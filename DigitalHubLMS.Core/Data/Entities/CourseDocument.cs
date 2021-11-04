using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_document")]
    [Index(nameof(CourseId), Name = "course_document_course_id_foreign")]
    [Index(nameof(DocumentId), Name = "course_document_document_id_foreign")]
    public partial class CourseDocument : BaseEntity
    {
        [Column("course_id")]
        public long CourseId { get; set; }
        [Column("document_id")]
        public long? DocumentId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseDocuments")]
        public virtual Course Course { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(DocumentId))]
        [InverseProperty("CourseDocuments")]
        public virtual Document Document { get; set; }
    }
}
