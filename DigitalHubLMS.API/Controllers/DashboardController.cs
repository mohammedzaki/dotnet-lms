using System;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers;

namespace DigitalHubLMS.API.Controllers
{
    public class DashboardController : BaseAPIController<DigitalHubLMSContext>
    {
        public DashboardController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<UserDashboard>> Get()
        {
            long userId = this.User.GetLoggedInUserId<long>();
            var enroll = await _dbContext.CourseEnrols
                .Include(e => e.Course)
                .ThenInclude(e => e.CourseMeta)
                .Where(e => e.UserId == userId && e.Type == "course" && e.Course.Published == true)
                .OrderByDescending(e => e.CreatedAt)
                .ToListAsync();
            if (enroll.Count > 0)
            {
                var progress = new System.Collections.Generic.List<long>();
                var course = enroll.First();
                var currentCourse = new CurrentUserCourse();
                currentCourse.Title = course.Course.Title;
                currentCourse.Thumbnail = course.Course.Thumbnail;
                currentCourse.Slug = course.Course.Slug;
                currentCourse.Progress = course.Progress;

                var TotalCourses = enroll.Count;
                double TotalProgress = enroll.Sum(e => e.Progress).Value;
                double TotalPercent = TotalCourses * 100;
                double NotStarted = enroll.Where(e => e.Progress == 0).ToList().Count;
                double NotStartedPercent = NotStarted * 100;
                double TotalDonePercent = Math.Ceiling((TotalProgress / TotalPercent) * 100);
                double TotalNotStartedPercent = Math.Ceiling((NotStartedPercent / TotalPercent) * 100);
                var TotalInProgressPercent = (Math.Ceiling(100 - (TotalDonePercent + TotalNotStartedPercent))) > 0 ? Math.Ceiling(100 - (TotalDonePercent + TotalNotStartedPercent)) : 0;
                enroll.ForEach(en =>
                {
                    if (en.Progress.HasValue)
                    {
                        progress.Add(en.Progress.Value);
                    }
                    else progress.Add(0);
                });
                var TotalCertificates = _dbContext.Certificates.Where(e => e.UserId == userId).ToListAsync().Result.Count;
                var courses = await _dbContext.Courses
                .Where(e => e.CourseEnrols.Any(a => a.UserId == userId) && e.CourseEnrols.Any(a => a.Type == "course") && e.Published == true)
                .Include(e => e.CourseEnrols)
                .Select(e => new CourseUserProgress
                {
                    Id = e.Id,
                    Title = e.Title,
                    CompletedCount = e.CourseEnrols.Where(e => e.Progress == 100 && e.UserId == userId).Count(),
                    NotStartedCount = e.CourseEnrols.Where(e => e.Progress == 0 && e.UserId == userId).Count(),
                    InProgressCount = e.CourseEnrols.Where(e => e.Progress > 0 && e.Progress < 100 && e.UserId == userId).Count()
                })
                .ToListAsync();
                var year_courses = await _dbContext.Courses
                .Where(e => e.CreatedAt.Value.Year == DateTime.Now.Year && e.CourseEnrols.Any(a => a.UserId == userId) && e.CourseEnrols.Any(a => a.Type == "course") && e.Published == true)
                .Select(e => new { e.CreatedAt.Value.Year, e.CreatedAt.Value.Month })
                .GroupBy(e => new { e.Year, e.Month })
                .OrderBy(e => e.Key.Year)
                .Select(g => new { year = g.Key.Year, month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(g.Key.Month), count = g.Count() })
                .ToListAsync();
                return new UserDashboard
                {
                    LatestCourse = currentCourse,
                    InProgress = TotalInProgressPercent,
                    Line = progress,
                    Done = TotalDonePercent,
                    TotalCourses = TotalCourses,
                    TotalCertificates = TotalCertificates,
                    NotStarted = TotalNotStartedPercent,
                    CourseUserProgresses = courses,
                    YearCourses = year_courses
                };
            }
            return new UserDashboard
            {
                LatestCourse = null,
                InProgress = 0,
                Line = new System.Collections.Generic.List<long>(),
                Done = 0,
                TotalCourses = 0,
                TotalCertificates = 0,
                NotStarted = 0
            };
        }
    }
}
