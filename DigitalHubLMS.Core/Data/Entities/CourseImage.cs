﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_image")]
    [Index(nameof(CourseId), Name = "course_image_course_id_foreign")]
    [Index(nameof(ImageId), Name = "course_image_image_id_foreign")]
    public partial class CourseImage
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("image_id")]
        public long? ImageId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseImages")]
        public virtual Course Course { get; set; }
        [ForeignKey(nameof(ImageId))]
        [InverseProperty("CourseImages")]
        public virtual Image Image { get; set; }
    }
}
