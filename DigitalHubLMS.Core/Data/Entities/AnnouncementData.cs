using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("announcement_data")]
    [Index(nameof(AnnouncementId), Name = "announcement_data_announcement_id_foreign")]
    public partial class AnnouncementData : BaseEntity
    {
        [Column("announcement_id")]
        public long AnnouncementId { get; set; }
        [Column("data")]
        public string Data { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(AnnouncementId))]
        [InverseProperty("AnnouncementData")]
        public virtual Announcement Announcement { get; set; }
    }
}
