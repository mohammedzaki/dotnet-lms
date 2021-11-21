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
    [Table("class_data")]
    [Index(nameof(CourseClassId), Name = "class_data_course_class_id_foreign")]
    public partial class ClassData : BaseEntity
    {
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("data")]
        public string Data { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty(nameof(Entities.CourseClass.ClassDatum))]
        public virtual CourseClass CourseClass { get; set; }
    }
}
