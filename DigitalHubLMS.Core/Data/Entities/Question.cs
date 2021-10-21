using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("questions")]
    [Index(nameof(QuizId), Name = "questions_quiz_id_foreign")]
    public partial class Question
    {
        public Question()
        {
            ClassQuizAnswers = new HashSet<ClassQuizAnswer>();
            Options = new HashSet<Option>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("question")]
        public string Question1 { get; set; }
        [Column("quiz_id")]
        public long QuizId { get; set; }
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(QuizId))]
        [InverseProperty("Questions")]
        public virtual Quiz Quiz { get; set; }
        [InverseProperty(nameof(ClassQuizAnswer.Question))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }
        [InverseProperty(nameof(Option.Question))]
        public virtual ICollection<Option> Options { get; set; }
    }
}
