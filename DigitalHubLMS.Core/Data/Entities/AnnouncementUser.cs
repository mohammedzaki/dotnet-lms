using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("announcement_users")]
    [Index(nameof(AnnouncementId), Name = "announcement_users_announcement_id_foreign")]
    [Index(nameof(UserId), Name = "announcement_users_user_id_foreign")]
    public partial class AnnouncementUser
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("announcement_id")]
        public long AnnouncementId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("read")]
        public long Read { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(AnnouncementId))]
        [InverseProperty("AnnouncementUsers")]
        public virtual Announcement Announcement { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("AnnouncementUsers")]
        public virtual User User { get; set; }
    }
}
