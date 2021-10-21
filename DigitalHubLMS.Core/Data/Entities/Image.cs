using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("images")]
    [Index(nameof(Uid), Name = "images_uid_unique", IsUnique = true)]
    public partial class Image
    {
        public Image()
        {
            CourseImages = new HashSet<CourseImage>();
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

        [InverseProperty(nameof(CourseImage.Image))]
        public virtual ICollection<CourseImage> CourseImages { get; set; }
    }
}
