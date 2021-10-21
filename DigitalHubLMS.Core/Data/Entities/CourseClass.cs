using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("course_classes")]
    [Index(nameof(CourseId), Name = "course_classes_course_id_foreign")]
    [Index(nameof(SectionId), Name = "course_classes_section_id_foreign")]
    public partial class CourseClass
    {
        public CourseClass()
        {
            ClassData = new HashSet<ClassDatum>();
            ClassDocuments = new HashSet<ClassDocument>();
            ClassMedia = new HashSet<ClassMedium>();
            ClassMeta = new HashSet<ClassMetum>();
            ClassQuizzes = new HashSet<ClassQuiz>();
            ClassUserMeta = new HashSet<ClassUserMetum>();
            Notes = new HashSet<Note>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
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
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseId))]
        [InverseProperty("CourseClasses")]
        public virtual Course Course { get; set; }
        [ForeignKey(nameof(SectionId))]
        [InverseProperty("CourseClasses")]
        public virtual Section Section { get; set; }
        [InverseProperty(nameof(ClassDatum.CourseClass))]
        public virtual ICollection<ClassDatum> ClassData { get; set; }
        [InverseProperty(nameof(ClassDocument.CourseClass))]
        public virtual ICollection<ClassDocument> ClassDocuments { get; set; }
        [InverseProperty(nameof(ClassMedium.CourseClass))]
        public virtual ICollection<ClassMedium> ClassMedia { get; set; }
        [InverseProperty(nameof(ClassMetum.CourseClass))]
        public virtual ICollection<ClassMetum> ClassMeta { get; set; }
        [InverseProperty(nameof(ClassQuiz.CourseClass))]
        public virtual ICollection<ClassQuiz> ClassQuizzes { get; set; }
        [InverseProperty(nameof(ClassUserMetum.CourseClass))]
        public virtual ICollection<ClassUserMetum> ClassUserMeta { get; set; }
        [InverseProperty(nameof(Note.CourseClass))]
        public virtual ICollection<Note> Notes { get; set; }
    }
}
