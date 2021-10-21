using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_user_meta")]
    [Index(nameof(CourseClassId), Name = "class_user_meta_course_class_id_foreign")]
    [Index(nameof(UserId), Name = "class_user_meta_user_id_foreign")]
    public partial class ClassUserMetum
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("completed")]
        public int? Completed { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassUserMeta")]
        public virtual CourseClass CourseClass { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("ClassUserMeta")]
        public virtual User User { get; set; }
    }
}
