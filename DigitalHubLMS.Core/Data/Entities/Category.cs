using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("categories")]
    public partial class Category : BaseEntity
    {
        [Required]
        [Column("name")]
        [StringLength(255)]
        public string Name { get; set; }
        [Column("parent")]
        public int? Parent { get; set; }
        [Column("slug")]
        [StringLength(255)]
        public string Slug { get; set; }
        [Column("thumbnail")]
        [StringLength(255)]
        public string Thumbnail { get; set; }
        [Column("short_description")]
        public string ShortDescription { get; set; }
        [Column("description")]
        public string Description { get; set; }
        [Column("icon")]
        public string Icon { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [NotMapped]
        public int CoursesCount { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(CourseCategory.Category))]
        public virtual ICollection<CourseCategory> CourseCategories { get; set; }
    }
}
