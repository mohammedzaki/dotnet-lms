using System;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class DashboardController : BaseAdminAPIController<DigitalHubLMSContext>
    {
        public DashboardController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<AdminDashboard>> Get()
        {
            var total_certificates = await _dbContext.Certificates.CountAsync();
            var total_quizzes = await _dbContext.Quizzes.CountAsync();
            var total_departments = await _dbContext.Groups.CountAsync();
            var total_categories = await _dbContext.Categories.CountAsync();
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
                .Where(e => e.Published == true)
                .Include(e => e.CourseEnrols)
                .Select(e => new CourseUserProgress
                {
                    Id = e.Id,
                    Title = e.Title,
                    CompletedCount = e.CourseEnrols.Where(e => e.Progress == 100).Count(),
                    NotStartedCount = e.CourseEnrols.Where(e => e.Progress == 0).Count(),
                    InProgressCount = e.CourseEnrols.Where(e => e.Progress > 0 && e.Progress < 100).Count()
                })
                .ToListAsync();
            var total_courses = courses.Count;
            int total_completed = courses.Sum(e => e.CompletedCount);
            int total_not_started = courses.Sum(e => e.NotStartedCount);
            int total_in_progress = courses.Sum(e => e.InProgressCount);

            int totalEnrolled = total_completed + total_not_started + total_in_progress;
            decimal completed_progress = 0;
            if (total_completed > 0)
                completed_progress = Math.Ceiling(((decimal)total_completed / (decimal)totalEnrolled) * 100);

            return new AdminDashboard
            {
                TotalCertificates = total_certificates,
                TotalQuizzes = total_quizzes,
                TotalDepartments = total_departments,
                TotalCategories = total_categories,
                TotalAnnouncements = total_announcements,
                TotalInstructors = total_instructors,
                TotalEmployees = total_employees,
                CompletedProgress = completed_progress,
                TotalCourses = total_courses,
                TotalCompleted = total_completed,
                TotalNotStarted = total_not_started,
                TotalInProgress = total_in_progress,
                YearCourses = year_courses,
                CourseUserProgresses = courses
            };
        }
    }
}
