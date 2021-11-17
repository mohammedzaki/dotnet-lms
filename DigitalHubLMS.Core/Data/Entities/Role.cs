using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("roles")]
    [Index(nameof(Name), Name = "roles_name_unique", IsUnique = true)]
    public partial class Role : IdentityRole<long>, IEntity<long>
    {
        [Column("is_active")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsActive { get; set; }

        [AllowNull]
        [JsonIgnore]
        [Column("created_by")]
        public long? CreatedBy { get; set; }

        [AllowNull]
        [JsonIgnore]
        [Column("updated_by")]
        public long? UpdatedBy { get; set; }

        [AllowNull]
        [JsonIgnore]
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }

        [AllowNull]
        [JsonIgnore]
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [AllowNull]
        [JsonIgnore]
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserRole.Role))]
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
