using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("options")]
    [Index(nameof(QuestionId), Name = "options_question_id_foreign")]
    public partial class Option : BaseEntity
    {
        [Column("option")]
        public string Option1 { get; set; }
        [Column("question_id")]
        public long QuestionId { get; set; }
        [Column("correct")]
        public byte Correct { get; set; }
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(QuestionId))]
        [InverseProperty("Options")]
        public virtual Question Question { get; set; }
        [InverseProperty(nameof(ClassQuizAnswer.Option))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }
    }
}
