using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("sections")]
    [Index(nameof(CourseId), Name = "sections_course_id_foreign")]
    public partial class Section
    {
        public Section()
        {
            CourseClasses = new HashSet<CourseClass>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Column("description")]
        public string Description { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("Sections")]
        public virtual Course Course { get; set; }
        [InverseProperty(nameof(CourseClass.Section))]
        public virtual ICollection<CourseClass> CourseClasses { get; set; }
    }
}
