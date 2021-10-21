using Microsoft.AspNetCore.Identity;
using DigitalHubLMS.Core.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class UserRepository : EntityRepository<User>, IUserRepository
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;

        public UserRepository(DigitalHubLMSContext context, UserManager<User> userManager,
            SignInManager<User> signInManager) : base(context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task<User> FindByUsernamePasswordAsync(string username, string password)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(username);
                var valid = await _signInManager.UserManager.CheckPasswordAsync(user, password);
                if (valid)
                {
                    var userRoles = await _userManager.GetRolesAsync(user);

                    var roles = _dbContext.Roles.Where(item => userRoles.Any(n => n == item.Name)).ToList();
                    user.Roles = roles;
                    return user;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }
    }
}
