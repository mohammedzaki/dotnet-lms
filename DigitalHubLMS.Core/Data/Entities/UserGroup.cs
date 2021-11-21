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
    [Table("user_group")]
    [Index(nameof(GroupId), Name = "user_group_group_id_foreign")]
    [Index(nameof(UserId), Name = "user_group_user_id_foreign")]
    public partial class UserGroup : BaseEntity
    {
        [Column("user_id")]
        public long UserId { get; set; }
        [Column("group_id")]
        public long GroupId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(GroupId))]
        [InverseProperty("UserGroups")]
        public virtual Group Group { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("UserGroups")]
        public virtual User User { get; set; }
    }
}
