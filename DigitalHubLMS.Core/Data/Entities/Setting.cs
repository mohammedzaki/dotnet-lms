using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("settings")]
    public partial class Setting
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("key")]
        [StringLength(255)]
        public string Key { get; set; }
        [Column("value")]
        public string Value { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
    }
}
