using System;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Google.Protobuf.WellKnownTypes;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class Dashboard : BaseAdminAPIController
    {
        public Dashboard(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        public async Task<ActionResult<Models.Dashboard>> Get()
        {
            var total_certificates = await _dbContext.Certificates.CountAsync();
            var total_quizzes = await _dbContext.Quizzes.CountAsync();
            var total_departments = await _dbContext.Groups.CountAsync();
            var total_categories = await _dbContext.Categories.CountAsync();
            throw new Exception("Exception while fetching all the students from the storage.");
            var total_announcements = await _dbContext.Announcements.CountAsync();
            var roleId = await _dbContext.Roles.Where(e => e.Name == "instructor").FirstOrDefaultAsync();
            var total_instructors = await _dbContext.Users.Include(e => e.UserRoles).Where(e => e.UserRoles.Any(e => e.RoleId == roleId.Id)).CountAsync();
            roleId = await _dbContext.Roles.Where(e => e.Name == "employee").FirstOrDefaultAsync();
            var total_employees = await _dbContext.Users.Include(e => e.UserRoles).Where(e => e.UserRoles.Any(e => e.RoleId == roleId.Id)).CountAsync();
            var year_courses = await _dbContext.Courses
                .Where(e => e.CreatedAt.Value.Year == DateTime.Now.Year)
                .Select(e => new { e.CreatedAt.Value.Year, e.CreatedAt.Value.Month })
                .GroupBy(e => new { e.Year, e.Month })
                .OrderBy(e => e.Key.Year)
                .Select(g => new { year = g.Key.Year, month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(g.Key.Month), count = g.Count() })
                .ToListAsync();
            var courses = await _dbContext.Courses
                .Where(e => e.CreatedAt.Value.Year == DateTime.Now.Year)
                .Include(e => e.CourseEnrols)
                .Select(e => new CourseUserProgress
                {
                    Id = e.Id,
                    Title = e.Title,
                    completed_count = e.CourseEnrols.Where(e => e.Progress == 100).Count(),
                    not_started_count = e.CourseEnrols.Where(e => e.Progress == 0).Count(),
                    in_progress_count = e.CourseEnrols.Where(e => e.Progress > 0 && e.Progress < 100).Count()
                })
                .ToListAsync();
            var total_courses = courses.Count;
            int total_completed = courses.Sum(e => e.completed_count);
            int total_not_started = courses.Sum(e => e.not_started_count);
            int total_in_progress = courses.Sum(e => e.in_progress_count);

            int totalEnrolled = total_completed + total_not_started + total_in_progress;
            decimal completed_progress = Math.Ceiling(((decimal)total_completed / (decimal)totalEnrolled) * 100);

            return new Models.Dashboard
            {
                total_certificates = total_certificates,
                total_quizzes = total_quizzes,
                total_departments = total_departments,
                total_categories = total_categories,
                total_announcements = total_announcements,
                total_instructors = total_instructors,
                total_employees = total_employees,
                completed_progress = completed_progress,
                total_courses = total_courses,
                total_completed = total_completed,
                total_not_started = total_not_started,
                total_in_progress = total_in_progress,
                year_courses = year_courses,
                CourseUserProgresses = courses
            };
        }
    }
}
