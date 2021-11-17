using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("notes")]
    [Index(nameof(CourseClassId), Name = "notes_course_class_id_foreign")]
    [Index(nameof(UserId), Name = "notes_user_id_foreign")]
    public partial class Note : BaseEntity
    {
        [Column("body")]
        public string Body { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("Notes")]
        public virtual CourseClass CourseClass { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("Notes")]
        public virtual User User { get; set; }
    }
}
