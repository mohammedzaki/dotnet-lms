using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Keyless]
    [Table("password_resets")]
    [Index(nameof(Email), Name = "password_resets_email_index")]
    public partial class PasswordReset
    {
        [Required]
        [Column("email")]
        [StringLength(255)]
        public string Email { get; set; }
        [Required]
        [Column("token")]
        [StringLength(255)]
        public string Token { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
    }
}
