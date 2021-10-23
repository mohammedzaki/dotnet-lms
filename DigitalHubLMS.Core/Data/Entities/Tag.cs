using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("tags")]
    public partial class Tag : BaseEntity
    {
        [Column("tag")]
        [StringLength(255)]
        public string Tag1 { get; set; }
        [Column("tagable_id")]
        public int? TagableId { get; set; }
        [Column("tagable_type")]
        [StringLength(255)]
        public string TagableType { get; set; }
        [Column("slug")]
        [StringLength(255)]
        public string Slug { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
    }
}
