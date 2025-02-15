﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_data")]
    [Index(nameof(CourseId), Name = "course_data_course_id_foreign")]
    public partial class CourseData : BaseEntity
    {
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("data")]
        public string Data { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty(nameof(Entities.Course.CourseDatum))]
        public virtual Course Course { get; set; }
    }
}
