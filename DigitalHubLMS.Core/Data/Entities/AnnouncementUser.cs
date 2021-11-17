using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("announcement_users")]
    [Index(nameof(AnnouncementId), Name = "announcement_users_announcement_id_foreign")]
    [Index(nameof(UserId), Name = "announcement_users_user_id_foreign")]
    public partial class AnnouncementUser : BaseEntity
    {
        [Column("announcement_id")]
        public long AnnouncementId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("read")]
        public long Read { get; set; }

        [Column("created_at")]
        [AllowNull]
        public new DateTime? CreatedAt { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(AnnouncementId))]
        [InverseProperty("AnnouncementUsers")]
        public virtual Announcement Announcement { get; set; }
        [JsonIgnore]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("AnnouncementUsers")]
        public virtual User User { get; set; }

        [NotMapped]
        public string Title { get; set; }
        [NotMapped]
        public string Message { get; set; }
        [NotMapped]
        public string Priority { get; set; }
    }
}
