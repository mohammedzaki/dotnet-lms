using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class Report
    {
        public string employee { get; set; }
        public int progress { get; set; }
        public string course { get; set; }
        public int year { get; set; }
        public string month { get; set; }
    }
}