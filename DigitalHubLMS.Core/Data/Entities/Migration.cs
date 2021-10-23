using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("migrations")]
    public partial class Migration : BaseEntity
    {
        [Required]
        [Column("migration")]
        [StringLength(255)]
        public string Migration1 { get; set; }
        [Column("batch")]
        public int Batch { get; set; }
    }
}
