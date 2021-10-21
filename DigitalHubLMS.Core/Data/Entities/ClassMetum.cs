using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_meta")]
    [Index(nameof(CourseClassId), Name = "class_meta_course_class_id_foreign")]
    public partial class ClassMetum
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("meta_key")]
        public string MetaKey { get; set; }
        [Column("meta_value")]
        public string MetaValue { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassMeta")]
        public virtual CourseClass CourseClass { get; set; }
    }
}
