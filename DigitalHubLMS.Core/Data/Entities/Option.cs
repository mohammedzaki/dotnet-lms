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
    [Table("options")]
    [Index(nameof(QuestionId), Name = "options_question_id_foreign")]
    public partial class Options : BaseEntity
    {
        [Column("option")]
        public string Option { get; set; }
        [Column("question_id")]
        public long QuestionId { get; set; }
        [Column("correct")]
        [System.ComponentModel.DefaultValue(null)]
        public bool Correct { get; set; }
        [Column("order")]
        public int Order { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(QuestionId))]
        [InverseProperty("Options")]
        public virtual Questions Question { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassQuizAnswer.Option))]
        public virtual ICollection<ClassQuizAnswer> ClassQuizAnswers { get; set; }
    }
}
