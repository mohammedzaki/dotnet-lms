using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_quiz_takes")]
    [Index(nameof(ClassQuizId), Name = "class_quiz_takes_class_quiz_id_foreign")]
    [Index(nameof(UserId), Name = "class_quiz_takes_user_id_foreign")]
    public partial class ClassQuizTake : BaseEntity
    {
        [Column("class_quiz_id")]
        public long ClassQuizId { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("quiz_result")]
        public int? QuizResult { get; set; }
        [Column("attempt")]
        public int Attempt { get; set; }
        [Column("score")]
        public byte Score { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(ClassQuizId))]
        [InverseProperty("ClassQuizTakes")]
        public virtual ClassQuiz ClassQuiz { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("ClassQuizTakes")]
        public virtual User User { get; set; }
        [InverseProperty(nameof(ClassQuizAnswer.ClassQuizTake))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }
    }
}
