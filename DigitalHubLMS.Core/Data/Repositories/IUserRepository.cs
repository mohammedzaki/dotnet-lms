using DigitalHubLMS.Core.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public interface IUserRepository : IRepository<User>
    {
        public Task<User> FindByUsernamePasswordAsync(string username, string password);
    }
}
