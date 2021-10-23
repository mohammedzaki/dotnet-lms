using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("failed_jobs")]
    public partial class FailedJob : BaseEntity
    {
        [Required]
        [Column("connection")]
        public string Connection { get; set; }
        [Required]
        [Column("queue")]
        public string Queue { get; set; }
        [Required]
        [Column("payload")]
        public string Payload { get; set; }
        [Required]
        [Column("exception")]
        public string Exception { get; set; }
        [Column("failed_at")]
        public DateTime FailedAt { get; set; }
    }
}
