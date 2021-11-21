using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("quizzes")]
    public partial class Quiz : BaseEntity
    {
        [Column("title")]
        public string Title { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.Questions.Quiz))]
        public virtual ICollection<Questions> Questions { get; set; }
    }
}
