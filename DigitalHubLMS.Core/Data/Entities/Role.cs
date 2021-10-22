using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("roles")]
    [Index(nameof(_Id), Name = "roles__id_unique", IsUnique = true)]
    [Index(nameof(Level), Name = "roles_level_unique", IsUnique = true)]
    [Index(nameof(Name), Name = "roles_name_unique", IsUnique = true)]
    public partial class Role : IdentityRole<long>
    {
        [Required]
        [Column("_id")]
        [StringLength(36)]
        public string _Id { get; set; }
        [Column("is_active")]
        public byte IsActive { get; set; }
        [Column("created_by")]
        public long CreatedBy { get; set; }
        [Column("updated_by")]
        public long UpdatedBy { get; set; }
        [Column("level")]
        public int Level { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [InverseProperty(nameof(UserRole.Role))]
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
