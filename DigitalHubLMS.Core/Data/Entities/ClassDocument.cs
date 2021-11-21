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
    [Table("class_document")]
    [Index(nameof(CourseClassId), Name = "class_document_course_class_id_foreign")]
    [Index(nameof(DocumentId), Name = "class_document_document_id_foreign")]
    public partial class ClassDocument : BaseEntity
    {
        [Column("course_class_id")]
        public long CourseClassId { get; set; }

        [Column("document_id")]
        public long DocumentId { get; set; }


        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassDocuments")]
        public virtual CourseClass CourseClass { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(DocumentId))]
        [InverseProperty("ClassDocuments")]
        public virtual Document Document { get; set; }
    }
}
