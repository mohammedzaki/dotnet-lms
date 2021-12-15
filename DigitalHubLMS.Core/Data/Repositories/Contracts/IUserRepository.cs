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

        public Task<bool> ChangeUserPassword(long userId, string username, string password, string newpassword);

        public Task<bool> SetUserForgetPassword(string username);

        public Task<bool> SetFirstLoginChangePassAndQues(long userId, string password, long question_id, string security_answer);

        public Task<bool> UpdateUserInfo(long userId, string title, string description);

        public Task<ProfilePicture> SaveUserProfilePicture(User user, ProfilePicture profilePicture);

        public UserManager<User> GetUserManager();

        public SignInManager<User> GetSignInManager();

        public Task<ProfilePicture> GetProfilePic(long userId);
    }
}
