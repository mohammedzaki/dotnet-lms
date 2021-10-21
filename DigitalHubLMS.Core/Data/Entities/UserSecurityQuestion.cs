using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("user_security_question")]
    [Index(nameof(SecurityQuestionId), Name = "user_security_question_security_question_id_foreign")]
    [Index(nameof(UserId), Name = "user_security_question_user_id_foreign")]
    public partial class UserSecurityQuestion
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("security_question_id")]
        public long SecurityQuestionId { get; set; }
        [Column("security_answer")]
        [StringLength(255)]
        public string SecurityAnswer { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(SecurityQuestionId))]
        [InverseProperty("UserSecurityQuestions")]
        public virtual SecurityQuestion SecurityQuestion { get; set; }

        [ForeignKey(nameof(UserId))]
        [InverseProperty("UserSecurityQuestions")]
        public virtual User User { get; set; }
    }
}
