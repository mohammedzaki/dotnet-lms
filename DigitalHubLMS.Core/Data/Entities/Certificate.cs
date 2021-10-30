﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("certificates")]
    [Index(nameof(CourseId), Name = "certificates_course_id_foreign")]
    [Index(nameof(UserId), Name = "certificates_user_id_foreign")]
    public partial class Certificate : BaseEntity
    {
        [Column("name")]
        [StringLength(255)]
        public string Name { get; set; }
        [Column("slug")]
        [StringLength(255)]
        public string Slug { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("url")]
        public string Url { get; set; }
        [Column("status")]
        public byte Status { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("Certificates")]
        public virtual Course Course { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("Certificates")]
        public virtual User User { get; set; }

        [NotMapped]
        public string Username { get; set; }
        [NotMapped]
        public string Coursename { get; set; }
        [NotMapped]
        public string Title { get; set; }
        [NotMapped]
        public string Description { get; set; }
        [NotMapped]
        public string Thumbnail { get; set; }
    }
}
