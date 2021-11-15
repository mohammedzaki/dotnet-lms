using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("questions")]
    [Index(nameof(QuizId), Name = "questions_quiz_id_foreign")]
    public partial class Questions : BaseEntity
    {
        [Column("question")]
        public string Question { get; set; }
        [Column("quiz_id")]
        public long QuizId { get; set; }
        [Column("order")]
        public int Order { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        public Questions Copy()
        {
            return (Questions) MemberwiseClone();
        }

        [JsonIgnore]
        [ForeignKey(nameof(QuizId))]
        [InverseProperty("Questions")]
        public virtual Quiz Quiz { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(ClassQuizAnswer.Question))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }

        //no
        [InverseProperty(nameof(Entities.Options.Question))]
        public virtual ICollection<Options> Options { get; set; }
    }
}
