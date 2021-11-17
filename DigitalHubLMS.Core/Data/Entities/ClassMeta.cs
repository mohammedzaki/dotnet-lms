using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_meta")]
    [Index(nameof(CourseClassId), Name = "class_meta_course_class_id_foreign")]
    public partial class ClassMeta : BaseEntity
    {
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("meta_key")]
        public string MetaKey { get; set; }
        [Column("meta_value")]
        public string MetaValue { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassMeta")]
        public virtual CourseClass CourseClass { get; set; }
    }
}
