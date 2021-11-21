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
    [Table("course_media")]
    [Index(nameof(CourseId), Name = "course_media_course_id_foreign")]
    [Index(nameof(MediaId), Name = "course_media_media_id_foreign")]
    public partial class CourseMedia : BaseEntity
    {
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("media_id")]
        public long? MediaId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseMedia")]
        public virtual Course Course { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(MediaId))]
        [InverseProperty(nameof(Entities.Media.CourseMedia))]
        public virtual Media Media { get; set; }
    }
}
