using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

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
        [Required]
        [Column("type")]
        [StringLength(255)]
        public string Type { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }


        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseEnrols")]
        public virtual Course Course { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("CourseEnrols")]
        public virtual User User { get; set; }

        [NotMapped]
        public int Lectures { get; set; }
        [NotMapped]
        public int Quizes { get; set; }
        [NotMapped]
        public double Duration { get; set; }
        [NotMapped]
        public DateTime? CourseEnds { get; set; }
        [NotMapped]
        public double BehindDays { get; set; }
        [NotMapped]
        public virtual ICollection<Section> CourseProgress { get; set; }

        
    }
}
