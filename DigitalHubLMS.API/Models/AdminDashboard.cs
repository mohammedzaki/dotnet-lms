using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class AdminDashboard
    {
        public int TotalCertificates { get; set; }
        public int TotalQuizzes { get; set; }
        public int TotalDepartments { get; set; }
        public int TotalCategories { get; set; }
        public int TotalAnnouncements { get; set; }
        public int TotalInstructors { get; set; }
        public int TotalEmployees { get; set; }
        public decimal CompletedProgress { get; set; }
        public int TotalCourses { get; set; }
        public int TotalCompleted { get; set; }
        public int TotalNotStarted { get; set; }
        public int TotalInProgress { get; set; }
        public IList YearCourses { get; set; }
        public IList<CourseUserProgress> CourseUserProgresses { get; set; }
    }

    public class CourseUserProgress
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public int CompletedCount { get; set; }
        public int NotStartedCount { get; set; }
        public int InProgressCount { get; set; }
    }
}
