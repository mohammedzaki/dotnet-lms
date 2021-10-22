using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public interface IUserRepository : IRepository<User, long>
    {
        public Task<User> FindByUsernamePasswordAsync(string username, string password);

        public Task<User> CreateAsync(User user, List<Role> selectedRoles, List<Group> selectedGroups);
    }
}
