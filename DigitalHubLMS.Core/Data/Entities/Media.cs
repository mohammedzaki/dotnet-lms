using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DigitalHubLMS.Core.Services;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("media")]
    [Index(nameof(Uid), Name = "media_uid_unique", IsUnique = true)]
    public partial class Media : BaseEntity
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
        private string _Url;
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

        [Required]
        [Column("quality")]
        [StringLength(255)]
        public string Quality { get; set; }

        [Required]
        [Column("duration")]
        [StringLength(255)]
        public string Duration { get; set; }

        [Column("private")]
        [System.ComponentModel.DefaultValue(null)]
        public bool Private { get; set; }

        [Column("downloads")]
        public long Downloads { get; set; }

        [Column("user_id")]
        public long UserId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassMedia.Media))]
        public virtual ICollection<ClassMedia> ClassMedia { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.CourseMedia.Media))]
        public virtual ICollection<CourseMedia> CourseMedia { get; set; }
    }
}
