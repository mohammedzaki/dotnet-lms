using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class RoleRepository : EntityRepository<DigitalHubLMSContext, Role, long>
    {
        private readonly RoleManager<Role> RoleManager;

        public RoleRepository(DigitalHubLMSContext context, RoleManager<Role> roleManager)
            : base(context)
        {
            RoleManager = roleManager;
        }

        public override async Task<Role> SaveAsync(Role entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(SaveAsync)} entity must not be null");
            }
            await RoleManager.CreateAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }
    }
}