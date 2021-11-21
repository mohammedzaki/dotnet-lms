using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DigitalHubLMS.Core.Services;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

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
        [SwaggerSchema(ReadOnly = true)]
        public long UserId { get; set; }

        [Column("course_id")]
        [SwaggerSchema(ReadOnly = true)]
        public long CourseId { get; set; }

        [Column("url")]
        private string _Url;
        [NotMapped]
        public string Url { get => _Url.ToHostUrl(); set => _Url = value; }

        [Column("status")]
        [DefaultValue(null)]
        public bool Status { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("Certificates")]
        public virtual Course Course { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("Certificates")]
        public virtual User User { get; set; }

        [NotMapped]
        [SwaggerSchema(ReadOnly = true)]
        public string Username { get; set; }

        [NotMapped]
        [SwaggerSchema(ReadOnly = true)]
        public string Coursename { get; set; }

        [NotMapped]
        [SwaggerSchema(ReadOnly = true)]
        public string Title { get; set; }

        [NotMapped]
        [SwaggerSchema(ReadOnly = true)]
        public string Description { get; set; }

        [NotMapped]
        [SwaggerSchema(ReadOnly = true)]
        public string Thumbnail { get; set; }
    }
}
