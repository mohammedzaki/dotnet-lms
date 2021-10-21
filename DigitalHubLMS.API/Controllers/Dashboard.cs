using System;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers
{
    public class Dashboard : BaseAPIController
    {
        public Dashboard(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var total_certificates = await _dbContext.Certificates.CountAsync(); //Certificate::count();
            var total_quizzes = await _dbContext.Quizzes.CountAsync();
            var total_departments = await _dbContext.Groups.CountAsync();
            var total_categories = await _dbContext.Categories.CountAsync();
            var total_announcements = await _dbContext.Announcements.CountAsync();
            //var total_instructors = User::whereHas(
            //    'roles', function($q) {
            //    $q->where('name', 'instructor');
            //    }
            //)->count();

            var total_instructors = 5;
            //var total_employees = User::whereHas(
            //    'roles', function($q) {
            //    $q->where('name', 'employee');
            //    }
            //)->count();
            var total_employees = 13;


            //var year_courses = Course::whereYear('created_at', date('Y'))->selectRaw('year(created_at) year, monthname(created_at) month, count(*) count')
            //                        ->groupBy('year', 'month')
            //                        ->orderBy('year', 'desc')
            //                        ->get();
            var year_courses = 0;

            //$courses = Course::selectRaw('id,title')
            //                    ->whereYear('created_at', date('Y'))
            //                    ->withCount(['completed', 'not_started', 'in_progress'])
            //                    ->get();
            var courses = await _dbContext.Courses.Select(e => new { e.Id, e.Title }).ToListAsync();

            var total_courses = courses.Count();
            //$total_completed = $courses->sum('completed_count');
            decimal total_completed = 9;

            //$total_not_started = $courses->sum('not_started_count');
            decimal total_not_started = 39;

            //$total_in_progress = $courses->sum('in_progress_count');
            decimal total_in_progress = 34;

            decimal totalEnrolled = total_completed + total_not_started + total_in_progress;
            var completed_progress = Math.Ceiling((total_completed / totalEnrolled) * 100);
            
            return Ok(new
            {
                total_certificates,
                total_quizzes,
                total_departments,
                total_categories,
                total_announcements,
                total_instructors,
                total_employees,
                completed_progress,
                total_courses,
                total_completed,
                total_not_started,
                total_in_progress,
                year_courses,
                courses_users_progress = courses
            });
        }
    }
}
