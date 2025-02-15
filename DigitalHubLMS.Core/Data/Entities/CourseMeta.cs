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
    [Table("course_meta")]
    [Index(nameof(CourseId), Name = "course_meta_course_id_foreign")]
    public partial class CourseMeta : BaseEntity
    {
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("meta_key")]
        public string MetaKey { get; set; }
        [Column("meta_value")]
        public string MetaValue { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseMeta")]
        public virtual Course Course { get; set; }
    }
}
