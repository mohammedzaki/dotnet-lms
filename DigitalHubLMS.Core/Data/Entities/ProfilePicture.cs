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
    [Table("profile_pictures")]
    public partial class ProfilePicture : BaseEntity
    {
        [Column("user_id")]
        public long UserId { get; set; }
        [Required]
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Required]
        [Column("mime")]
        [StringLength(255)]
        public string Mime { get; set; }

        [Required]
        [Column("url")]
        private string _Url;
        [NotMapped]
        public string Url { get => _Url.ToHostUrl(); set => _Url = value; }

        [Required]
        [Column("file_key")]
        [StringLength(255)]
        public string FileKey { get; set; }
    }
}
