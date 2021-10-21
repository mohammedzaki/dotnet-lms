using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_quiz")]
    [Index(nameof(CourseClassId), Name = "class_quiz_course_class_id_foreign")]
    [Index(nameof(QuizId), Name = "class_quiz_quiz_id_foreign")]
    public partial class ClassQuiz
    {
        public ClassQuiz()
        {
            ClassQuizTakes = new HashSet<ClassQuizTake>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("quiz_id")]
        public long QuizId { get; set; }
        [Column("course_class_id")]
        public long CourseClassId { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassQuizzes")]
        public virtual CourseClass CourseClass { get; set; }
        [ForeignKey(nameof(QuizId))]
        [InverseProperty("ClassQuizzes")]
        public virtual Quiz Quiz { get; set; }
        [InverseProperty(nameof(ClassQuizTake.ClassQuiz))]
        public virtual ICollection<ClassQuizTake> ClassQuizTakes { get; set; }
    }
}
