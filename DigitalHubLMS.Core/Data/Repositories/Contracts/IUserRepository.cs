using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Data.Repositories.Contracts
{
    public interface IUserRepository : IRepository<User, long>
    {
        public Task<User> FindByUsernamePasswordAsync(string username, string password);

        public Task<SecurityQuestion> GetSecurityQuestionByUsername(string username);

        public Task<bool> CheckSecurityQuestionAnswer(string username, string securityAnswer);

        public UserManager<User> GetUserManager();

        public SignInManager<User> GetSignInManager();
    }
}
