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
    [Table("class_user_meta")]
    [Index(nameof(CourseClassId), Name = "class_user_meta_course_class_id_foreign")]
    [Index(nameof(UserId), Name = "class_user_meta_user_id_foreign")]
    public partial class ClassUserMeta : BaseEntity
    {
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("completed")]
        public int? Completed { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassUserMeta")]
        public virtual CourseClass CourseClass { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("ClassUserMeta")]
        public virtual User User { get; set; }
    }
}
