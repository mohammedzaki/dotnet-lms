using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class RoleRepository : EntityRepository<DigitalHubLMSContext, Role, long>
    {
        public RoleRepository(DigitalHubLMSContext context, ClaimsPrincipal claimsPrincipal)
            : base(context, claimsPrincipal)
        {
        }

        public override async Task<Role> SaveAsync(Role entity)
        {
            entity.NormalizedName = entity.Name.ToUpper();
            return await base.SaveAsync(entity);  
        }

        public override async Task<Role> UpdateAsync(Role entity)
        {
            entity.NormalizedName = entity.Name.ToUpper();
            return await base.UpdateAsync(entity);
        }
    }
}