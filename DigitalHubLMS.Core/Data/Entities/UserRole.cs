using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("user_role")]
    public partial class UserRole : IdentityUserRole<long>
    {
        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(RoleId))]
        [InverseProperty("UserRoles")]
        public virtual Role Role { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(UserId))]
        [InverseProperty("UserRoles")]
        public virtual User User { get; set; }
    }
}
