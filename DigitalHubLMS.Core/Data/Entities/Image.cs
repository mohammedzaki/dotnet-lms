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
    [Table("images")]
    [Index(nameof(Uid), Name = "images_uid_unique", IsUnique = true)]
    public partial class Image : BaseEntity
    {
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
        [JsonIgnore]
        public string _Url { get; set; }
        [NotMapped]
        public string Url { get => _Url.ToHostUrl(); set => _Url = value; }

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
        [System.ComponentModel.DefaultValue(null)]
        public bool Private { get; set; }
        [Column("downloads")]
        public long Downloads { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(CourseImage.Image))]
        public virtual ICollection<CourseImage> CourseImages { get; set; }
    }
}
