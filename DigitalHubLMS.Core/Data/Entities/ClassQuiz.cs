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
    [Table("class_quiz")]
    [Index(nameof(CourseClassId), Name = "class_quiz_course_class_id_foreign")]
    [Index(nameof(QuizId), Name = "class_quiz_quiz_id_foreign")]
    public partial class ClassQuiz : BaseEntity
    {
        [Column("quiz_id")]
        public long QuizId { get; set; }

        [Column("course_class_id")]
        public long CourseClassId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(CourseClassId))]
        [InverseProperty("ClassQuizzes")]
        public virtual CourseClass CourseClass { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(QuizId))]
        public virtual Quiz Quiz { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassQuizTake.ClassQuiz))]
        public virtual ICollection<ClassQuizTake> ClassQuizTakes { get; set; }
    }
}
