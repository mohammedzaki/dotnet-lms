using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_media")]
    [Index(nameof(CourseClassId), Name = "class_media_course_class_id_foreign")]
    [Index(nameof(MediaId), Name = "class_media_media_id_foreign")]
    public partial class ClassMedium
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("media_id")]
        public long MediaId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassMedia")]
        public virtual CourseClass CourseClass { get; set; }
        [ForeignKey(nameof(MediaId))]
        [InverseProperty(nameof(Medium.ClassMedia))]
        public virtual Medium Media { get; set; }
    }
}
