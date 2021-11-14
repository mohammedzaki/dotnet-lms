using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class DepartmentRepository : EntityRepository<DigitalHubLMSContext, Group, long>
    {
        public DepartmentRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override async Task<List<Group>> GetAll()
        {
            return await _dbContext.Groups
                .Include(e => e.UserGroups)
                .Select(g => new Group { UsersCount = g.UserGroups.Count, Id = g.Id, _Id = g._Id, Name = g.Name, IsLdap = g.IsLdap, IsActive = g.IsActive })
                .ToListAsync();
        }

        public override async Task<Group> FindByIdAsync(long id)
        {
            var entity = await _dbContext.Groups
                .Include(e => e.UserGroups)
                .ThenInclude(e => e.User)
                .Where(e => e.Id == id).FirstOrDefaultAsync();

            if (entity == null)
            {
                throw new KeyNotFoundException($"{typeof(Group).ShortDisplayName()} with id {id} Not Found");
            }
            return entity;
        }
    }
}