using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("groups")]
    [Index(nameof(Name), Name = "groups_name_unique", IsUnique = true)]
    public partial class Group : BaseEntity
    {
        [Required]
        [Column("name")]
        [StringLength(255)]
        public string Name { get; set; }
        [Column("is_ldap")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsLdap { get; set; }
        [Column("is_active")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsActive { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(CourseDepartment.Group))]
        public virtual ICollection<CourseDepartment> CourseDepartments { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserGroup.Group))]
        public virtual ICollection<UserGroup> UserGroups { get; set; }

        [NotMapped]
        public int UsersCount { get; set; }
    }
}
