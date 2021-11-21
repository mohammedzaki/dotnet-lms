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
    [Table("class_media")]
    [Index(nameof(CourseClassId), Name = "class_media_course_class_id_foreign")]
    [Index(nameof(MediaId), Name = "class_media_media_id_foreign")]
    public partial class ClassMedia : BaseEntity
    {
        [Column("course_class_id")]
        public long CourseClassId { get; set; }

        [Column("media_id")]
        public long MediaId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassMedia")]
        public virtual CourseClass CourseClass { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(MediaId))]
        [InverseProperty(nameof(Entities.Media.ClassMedia))]
        public virtual Media Media { get; set; }
    }
}
