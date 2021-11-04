using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("bundle_enrols")]
    [Index(nameof(BundleId), Name = "bundle_enrols_bundle_id_foreign")]
    [Index(nameof(UserId), Name = "bundle_enrols_user_id_foreign")]
    public partial class BundleEnrol : BaseEntity
    {
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("bundle_id")]
        public long BundleId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(BundleId))]
        [InverseProperty("BundleEnrols")]
        public virtual Bundle Bundle { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("BundleEnrols")]
        public virtual User User { get; set; }
    }
}
