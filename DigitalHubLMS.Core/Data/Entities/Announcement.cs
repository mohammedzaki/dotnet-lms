﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("announcements")]
    public partial class Announcement : BaseEntity
    {
        [Required]
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Required]
        [Column("message")]
        public string Message { get; set; }
        [Required]
        [Column("priority")]
        [StringLength(255)]
        public string Priority { get; set; }
        [NotMapped]
        public virtual ICollection<User> Included { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.AnnouncementData.Announcement))]
        public virtual ICollection<AnnouncementData> AnnouncementData { get; set; }
        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(AnnouncementUser.Announcement))]
        public virtual ICollection<AnnouncementUser> AnnouncementUsers { get; set; }
    }
}
