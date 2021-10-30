using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
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
            try
            {
                return await _dbContext.Groups
                    .Include(e => e.UserGroups)
                    .Select(g => new Group { UsersCount = g.UserGroups.Count, Id = g.Id, _Id = g._Id, Name = g.Name, IsLdap = g.IsLdap, IsActive = g.IsActive})
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }
    }
}