using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("quizzes")]
    public partial class Quiz : BaseEntity
    {
        [Column("title")]
        public string Title { get; set; }
        
        //no
        [InverseProperty(nameof(Entities.Questions.Quiz))]
        public virtual ICollection<Questions> Questions { get; set; }
    }
}
