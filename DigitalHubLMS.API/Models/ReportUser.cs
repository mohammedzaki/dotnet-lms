﻿using System;
using System.Collections;
using System.Collections.Generic;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class ReportUser
    {
        public string employee { get; set; }
        public long? progress { get; set; }
        public long? grade { get; set; }
        public string course { get; set; }
        public int year { get; set; }
        public string month { get; set; }
        public string start { get; set; }
        public string updated { get; set; }
    }
}