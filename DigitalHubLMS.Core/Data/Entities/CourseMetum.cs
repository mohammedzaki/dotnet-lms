﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_meta")]
    [Index(nameof(CourseId), Name = "course_meta_course_id_foreign")]
    public partial class CourseMetum
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("meta_key")]
        public string MetaKey { get; set; }
        [Column("meta_value")]
        public string MetaValue { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseMeta")]
        public virtual Course Course { get; set; }
    }
}
