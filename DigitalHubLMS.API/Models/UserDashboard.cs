using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class UserDashboard
    {
        public CurrentUserCourse latest_course { get; set; }
        public int in_progress { get; set; }
        public List<int> line { get; set; }
        public int done { get; set; }
        public int total_courses { get; set; }
        public int total_certificates { get; set; }
        public int not_started { get; set; }
    }

    public class CurrentUserCourse
    {
        public string Title { get; set; }
        public string thumbnail { get; set; }
        public string slug { get; set; }
        public int progress { get; set; }
    }
}
