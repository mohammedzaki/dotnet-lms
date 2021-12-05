using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class UserDashboard
    {
        public CurrentUserCourse LatestCourse { get; set; }
        public double InProgress { get; set; }
        public List<long> Line { get; set; }
        public double Done { get; set; }
        public int TotalCourses { get; set; }
        public int TotalCertificates { get; set; }
        public double NotStarted { get; set; }
        public IList<CourseUserProgress> CourseUserProgresses { get; set; }
        public IList YearCourses { get; set; }
    }

    public class CurrentUserCourse
    {
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Slug { get; set; }
        public long? Progress { get; set; }
    }
}
