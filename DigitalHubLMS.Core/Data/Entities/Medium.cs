using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("media")]
    [Index(nameof(Uid), Name = "media_uid_unique", IsUnique = true)]
    public partial class Medium
    {
        public Medium()
        {
            ClassMedia = new HashSet<ClassMedium>();
            CourseMedia = new HashSet<CourseMedium>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Required]
        [Column("uid")]
        [StringLength(36)]
        public string Uid { get; set; }
        [Required]
        [Column("name")]
        [StringLength(255)]
        public string Name { get; set; }
        [Required]
        [Column("url")]
        [StringLength(255)]
        public string Url { get; set; }
        [Required]
        [Column("size")]
        [StringLength(255)]
        public string Size { get; set; }
        [Required]
        [Column("file_key")]
        [StringLength(255)]
        public string FileKey { get; set; }
        [Required]
        [Column("mime")]
        [StringLength(255)]
        public string Mime { get; set; }
        [Required]
        [Column("quality")]
        [StringLength(255)]
        public string Quality { get; set; }
        [Required]
        [Column("duration")]
        [StringLength(255)]
        public string Duration { get; set; }
        [Column("private")]
        public byte Private { get; set; }
        [Column("downloads")]
        public long Downloads { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("created_by")]
        public long CreatedBy { get; set; }
        [Column("updated_by")]
        public long UpdatedBy { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [InverseProperty(nameof(ClassMedium.Media))]
        public virtual ICollection<ClassMedium> ClassMedia { get; set; }
        [InverseProperty(nameof(CourseMedium.Media))]
        public virtual ICollection<CourseMedium> CourseMedia { get; set; }
    }
}
