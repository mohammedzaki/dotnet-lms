using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("sections")]
    [Index(nameof(CourseId), Name = "sections_course_id_foreign")]
    public partial class Section : BaseEntity
    {
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Column("description")]
        public string Description { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("order")]
        public int Order { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("Sections")]
        public virtual Course Course { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseClass.Section))]
        public virtual ICollection<CourseClass> CourseClasses { get; set; }
    }
}
