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
    [Table("ratings")]
    [Index(nameof(CourseId), Name = "ratings_course_id_foreign")]
    [Index(nameof(UserId), Name = "ratings_user_id_foreign")]
    public partial class Rating : BaseEntity
    {
        [Column("rating")]
        public double? Rating1 { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("review")]
        public string Review { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("Ratings")]
        public virtual Course Course { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("Ratings")]
        public virtual User User { get; set; }
    }
}
