using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_image")]
    [Index(nameof(CourseId), Name = "course_image_course_id_foreign")]
    [Index(nameof(ImageId), Name = "course_image_image_id_foreign")]
    public partial class CourseImage : BaseEntity
    {
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("image_id")]
        public long? ImageId { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseImages")]
        public virtual Course Course { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(ImageId))]
        [InverseProperty("CourseImages")]
        public virtual Image Image { get; set; }
    }
}
