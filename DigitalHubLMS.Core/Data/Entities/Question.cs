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

        public Questions Copy()
        {
            return (Questions) MemberwiseClone();
        }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(QuizId))]
        [InverseProperty("Questions")]
        public virtual Quiz Quiz { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassQuizAnswer.Question))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.Options.Question))]
        public virtual ICollection<Options> Options { get; set; }
    }
}
