using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("security_questions")]
    public partial class SecurityQuestion : BaseEntity
    {
        [Required]
        [Column("question")]
        [StringLength(255)]
        public string Question { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserSecurityQuestion.SecurityQuestion))]
        public virtual ICollection<UserSecurityQuestion> UserSecurityQuestions { get; set; }
    }
}
