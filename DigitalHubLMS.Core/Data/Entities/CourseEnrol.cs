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
    [Table("course_enrols")]
    [Index(nameof(CourseId), Name = "course_enrols_course_id_foreign")]
    [Index(nameof(UserId), Name = "course_enrols_user_id_foreign")]
    public partial class CourseEnrol : BaseEntity
    {
        [Column("course_id")]
        public long? CourseId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("current_class")]
        public long? CurrentClass { get; set; }
        [Column("progress")]
        public long? Progress { get; set; }
        [Column("grade")]
        public long? Grade { get; set; }
        [Required]
        [Column("type")]
        [StringLength(255)]
        public string Type { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseEnrols")]
        public virtual Course Course { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("CourseEnrols")]
        public virtual User User { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public int Lectures { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public int Quizes { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public double Duration { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public DateTime? CourseEnds { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public double BehindDays { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public virtual ICollection<Section> CourseProgress { get; set; }

        
    }
}
