using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("class_quiz_answers")]
    [Index(nameof(ClassQuizTakeId), Name = "class_quiz_answers_class_quiz_take_id_foreign")]
    [Index(nameof(OptionId), Name = "class_quiz_answers_option_id_foreign")]
    [Index(nameof(QuestionId), Name = "class_quiz_answers_question_id_foreign")]
    public partial class ClassQuizAnswer : BaseEntity
    {
        [Column("class_quiz_take_id")]
        public long ClassQuizTakeId { get; set; }
        [Column("question_id")]
        public long QuestionId { get; set; }
        [Column("option_id")]
        public long OptionId { get; set; }
        [Column("attempt")]
        public short Attempt { get; set; }
        [Column("score")]
        public short Score { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(ClassQuizTakeId))]
        [InverseProperty("ClassQuizAnswers")]
        public virtual ClassQuizTake ClassQuizTake { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(OptionId))]
        [InverseProperty("ClassQuizAnswers")]
        public virtual Options Option { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(QuestionId))]
        [InverseProperty("ClassQuizAnswers")]
        public virtual Questions Question { get; set; }
    }
}
