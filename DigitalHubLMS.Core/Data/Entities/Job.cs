using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("jobs")]
    [Index(nameof(Queue), Name = "jobs_queue_index")]
    public partial class Job : BaseEntity
    {
        [Required]
        [Column("queue")]
        [StringLength(255)]
        public string Queue { get; set; }
        [Required]
        [Column("payload")]
        public string Payload { get; set; }
        [Column("attempts")]
        public byte Attempts { get; set; }
        [Column("reserved_at")]
        public int? ReservedAt { get; set; }
        [Column("available_at")]
        public int AvailableAt { get; set; }
        [Column("created_at")]
        public int CreatedAt { get; set; }
    }
}
