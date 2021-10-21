using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("quizzes")]
    public partial class Quiz
    {
        public Quiz()
        {
            ClassQuizzes = new HashSet<ClassQuiz>();
            Questions = new HashSet<Question>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("title")]
        public string Title { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [InverseProperty(nameof(ClassQuiz.Quiz))]
        public virtual ICollection<ClassQuiz> ClassQuizzes { get; set; }
        [InverseProperty(nameof(Question.Quiz))]
        public virtual ICollection<Question> Questions { get; set; }
    }
}
