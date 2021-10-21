using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("notes")]
    [Index(nameof(CourseClassId), Name = "notes_course_class_id_foreign")]
    [Index(nameof(UserId), Name = "notes_user_id_foreign")]
    public partial class Note
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("body")]
        public string Body { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("Notes")]
        public virtual CourseClass CourseClass { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("Notes")]
        public virtual User User { get; set; }
    }
}
