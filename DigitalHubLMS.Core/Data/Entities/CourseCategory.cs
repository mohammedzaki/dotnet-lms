using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_category")]
    [Index(nameof(CategoryId), Name = "course_category_category_id_foreign")]
    [Index(nameof(CourseId), Name = "course_category_course_id_foreign")]
    public partial class CourseCategory : BaseEntity
    {
        [Column("category_id")]
        public long CategoryId { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CategoryId))]
        [InverseProperty("CourseCategories")]
        public virtual Category Category { get; set; }
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseCategories")]
        public virtual Course Course { get; set; }
    }
}
