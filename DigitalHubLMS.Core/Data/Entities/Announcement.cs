using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("announcements")]
    public partial class Announcement
    {
        public Announcement()
        {
            AnnouncementData = new HashSet<AnnouncementDatum>();
            AnnouncementUsers = new HashSet<AnnouncementUser>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Required]
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Required]
        [Column("message")]
        public string Message { get; set; }
        [Required]
        [Column("priority")]
        [StringLength(255)]
        public string Priority { get; set; }
        [Column("created_by")]
        public long? CreatedBy { get; set; }
        [Column("updated_by")]
        public long? UpdatedBy { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [InverseProperty(nameof(AnnouncementDatum.Announcement))]
        public virtual ICollection<AnnouncementDatum> AnnouncementData { get; set; }
        [InverseProperty(nameof(AnnouncementUser.Announcement))]
        public virtual ICollection<AnnouncementUser> AnnouncementUsers { get; set; }
    }
}
