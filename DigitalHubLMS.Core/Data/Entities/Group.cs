using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("groups")]
    [Index(nameof(_Id), Name = "groups__id_unique", IsUnique = true)]
    [Index(nameof(Name), Name = "groups_name_unique", IsUnique = true)]
    public partial class Group : BaseEntity
    {
        [Column("_id")]
        [StringLength(36)]
        public string _Id { get; set; }
        [Required]
        [Column("name")]
        [StringLength(255)]
        public string Name { get; set; }
        [Column("is_ldap")]
        public byte IsLdap { get; set; }
        [Column("is_active")]
        public byte IsActive { get; set; }
        [Column("created_by")]
        public long CreatedBy { get; set; }
        [Column("updated_by")]
        public long UpdatedBy { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        public DateTime? DeletedAt { get; set; }

        [NotMapped]
        public int UsersCount { get; set; }

        [InverseProperty(nameof(CourseDepartment.Group))]
        public virtual ICollection<CourseDepartment> CourseDepartments { get; set; }
        [InverseProperty(nameof(UserGroup.Group))]
        public virtual ICollection<UserGroup> UserGroups { get; set; }
    }
}
