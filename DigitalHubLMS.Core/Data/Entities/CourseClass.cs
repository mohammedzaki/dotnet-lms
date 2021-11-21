using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DigitalHubLMS.Core.Services;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers.DataAnnotations;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_classes")]
    [Index(nameof(CourseId), Name = "course_classes_course_id_foreign")]
    [Index(nameof(SectionId), Name = "course_classes_section_id_foreign")]
    public partial class CourseClass : BaseEntity
    {
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }

        [Column("duration")]
        [StringLength(255)]
        public string Duration { get; set; }

        [Column("course_id")]
        public long CourseId { get; set; }

        [Column("section_id")]
        public long SectionId { get; set; }

        [Column("type")]
        [StringLength(255)]
        public string Type { get; set; }

        [Column("poster")]
        private string _Poster;
        [NotMapped]
        public string Poster { get => _Poster.ToHostUrl(); set => _Poster = value; }

        [Column("order")]
        public int Order { get; set; }

        [NotMapped]
        [RequiredIf(nameof(Type), "document")]
        public string DocumentUrl { get; set; }

        [NotMapped]
        [RequiredIf(nameof(Type), "video")]
        public string Data { get; set; }

        [NotMapped]
        [RequiredIf(nameof(Type), "text")]
        public string Description { get; set; }

        [NotMapped]
        [RequiredIf(nameof(Type), "url")]
        public string Url { get; set; }

        [NotMapped]
        [RequiredIf(nameof(Type), "quiz")]
        public string SelectedQuiz { get; set; }

        [NotMapped]
        public string NewQuiz { get; set; }

        [ForeignKey(nameof(SectionId))]
        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.Section.CourseClasses))]
        public virtual Section Section { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassData.CourseClass))]
        public virtual ICollection<ClassData> ClassDatum { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassDocument.CourseClass))]
        public virtual ICollection<ClassDocument> ClassDocuments { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassMedia.CourseClass))]
        public virtual ICollection<ClassMedia> ClassMedia { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassMeta.CourseClass))]
        public virtual ICollection<ClassMeta> ClassMeta { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassQuiz.CourseClass))]
        public virtual ICollection<ClassQuiz> ClassQuizzes { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassUserMeta.CourseClass))]
        public virtual ICollection<ClassUserMeta> ClassUserMeta { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Note.CourseClass))]
        public virtual ICollection<Note> Notes { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public virtual Quiz Quiz { get; set; }

        [NotMapped]
        private string _ClassData;

        [NotMapped]
        public virtual string ClassData {
            set
            {
                switch (Type)
                {
                    case "video":
                        Data = value;
                        break;
                    case "document":
                        DocumentUrl = value;
                        break;
                    case "text":
                        Description = value;
                        break;
                    case "quiz":
                        SelectedQuiz = value;
                        break;
                    case "url":
                        Url = value;
                        break;
                    default:
                        break;
                }
                _ClassData = value;
            }
            get => _ClassData;
        }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public virtual ICollection<Media> Media { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public int? Completed { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public long? TakeId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public virtual ICollection<ClassQuizAnswer> Answers { get; set; }

    }
}
