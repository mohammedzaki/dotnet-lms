using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("options")]
    [Index(nameof(QuestionId), Name = "options_question_id_foreign")]
    public partial class Options : BaseEntity
    {
        [Column("option")]
        public string Option { get; set; }
        [Column("question_id")]
        public long QuestionId { get; set; }
        [Column("correct")]
        public bool Correct { get; set; }
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [JsonIgnore]
        [ForeignKey(nameof(QuestionId))]
        [InverseProperty("Options")]
        public virtual Questions Question { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(ClassQuizAnswer.Option))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }
    }
}
