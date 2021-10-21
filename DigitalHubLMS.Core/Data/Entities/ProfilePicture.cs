using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("profile_pictures")]
    [Index(nameof(Id1), Name = "profile_pictures__id_unique", IsUnique = true)]
    public partial class ProfilePicture
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Required]
        [Column("_id")]
        [StringLength(36)]
        public string Id1 { get; set; }
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
        [StringLength(255)]
        public string Url { get; set; }
        [Required]
        [Column("file_key")]
        [StringLength(255)]
        public string FileKey { get; set; }
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
    }
}
