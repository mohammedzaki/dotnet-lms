using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DigitalHubLMS.Core.Services;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("bundles")]
    [Index(nameof(InstructorId), Name = "bundles_instructor_id_foreign")]
    public partial class Bundle : BaseEntity
    {
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Column("short_description")]
        public string ShortDescription { get; set; }
        [Column("description")]
        public string Description { get; set; }
        [Column("outcomes")]
        public string Outcomes { get; set; }
        [Column("language")]
        [StringLength(255)]
        public string Language { get; set; }
        [Column("slug")]
        [StringLength(255)]
        public string Slug { get; set; }
        [Column("requirements")]
        public string Requirements { get; set; }
        [Column("level")]
        [StringLength(50)]
        public string Level { get; set; }
        [Column("created_by")]
        public int? CreatedBy { get; set; }
        [Column("instructor_id")]
        public long InstructorId { get; set; }
        [Column("thumbnail")]
        [StringLength(255)]
        public string Thumbnail { get; set; }
        [Column("video_url")]
        [JsonIgnore]
        public string _VideoUrl;
        [NotMapped]
        public string VideoUrl { get => _VideoUrl.ToHostUrl(); set => _VideoUrl = value; }
        [Column("is_top_course")]
        public int? IsTopCourse { get; set; }
        [Column("is_admin")]
        public int? IsAdmin { get; set; }
        [Column("published")]
        public bool? Published { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(InstructorId))]
        [InverseProperty(nameof(User.Bundles))]
        public virtual User Instructor { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(BundleCourse.Bundle))]
        public virtual ICollection<BundleCourse> BundleCourses { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(BundleEnrol.Bundle))]
        public virtual ICollection<BundleEnrol> BundleEnrols { get; set; }
    }
}
