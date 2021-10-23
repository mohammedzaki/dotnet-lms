using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class AdminDashboard
    {
        public int total_certificates { get; set; }
        public int total_quizzes { get; set; }
        public int total_departments { get; set; }
        public int total_categories { get; set; }
        public int total_announcements { get; set; }
        public int total_instructors { get; set; }
        public int total_employees { get; set; }
        public decimal completed_progress { get; set; }
        public int total_courses { get; set; }
        public int total_completed { get; set; }
        public int total_not_started { get; set; }
        public int total_in_progress { get; set; }
        public IList year_courses { get; set; }
        public IList<CourseUserProgress> CourseUserProgresses { get; set; }
    }

    public class CourseUserProgress
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public int completed_count { get; set; }
        public int not_started_count { get; set; }
        public int in_progress_count { get; set; }
    }
}
