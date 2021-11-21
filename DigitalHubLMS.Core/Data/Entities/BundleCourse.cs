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
    [Table("bundle_courses")]
    [Index(nameof(BundleId), Name = "bundle_courses_bundle_id_foreign")]
    [Index(nameof(CourseId), Name = "bundle_courses_course_id_foreign")]
    public partial class BundleCourse : BaseEntity
    {
        [Column("bundle_id")]
        public long BundleId { get; set; }
        [Column("course_id")]
        public long CourseId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(BundleId))]
        [InverseProperty("BundleCourses")]
        public virtual Bundle Bundle { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("BundleCourses")]
        public virtual Course Course { get; set; }
    }
}
