using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_media")]
    [Index(nameof(CourseId), Name = "course_media_course_id_foreign")]
    [Index(nameof(MediaId), Name = "course_media_media_id_foreign")]
    public partial class CourseMedium
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("media_id")]
        public long? MediaId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseMedia")]
        public virtual Course Course { get; set; }
        [ForeignKey(nameof(MediaId))]
        [InverseProperty(nameof(Medium.CourseMedia))]
        public virtual Medium Media { get; set; }
    }
}
