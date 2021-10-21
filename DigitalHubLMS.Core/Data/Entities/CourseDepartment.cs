using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_department")]
    [Index(nameof(CourseId), Name = "course_department_course_id_foreign")]
    [Index(nameof(GroupId), Name = "course_department_group_id_foreign")]
    public partial class CourseDepartment
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("group_id")]
        public long GroupId { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseDepartments")]
        public virtual Course Course { get; set; }
        [ForeignKey(nameof(GroupId))]
        [InverseProperty("CourseDepartments")]
        public virtual Group Group { get; set; }
    }
}
