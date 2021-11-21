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
    [Table("subtitles")]
    [Index(nameof(Uid), Name = "subtitles_uid_unique", IsUnique = true)]
    public partial class Subtitle : BaseEntity
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
        [Column("mime")]
        [StringLength(255)]
        public string Mime { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
    }
}
