﻿using Microsoft.AspNetCore.Identity;
using DigitalHubLMS.Core.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using MZCore.ExceptionHandler;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authentication;
using DigitalHubLMS.Core.Data.Repositories.Contracts;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class UserRepository : EntityRepository<DigitalHubLMSContext, User, long>, IUserRepository
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IRepository<UserInfo, long> UserInfoRepository;
        private readonly IRepository<UserSecurityQuestion, long> UserSecurityQuestionRepository;
        private readonly IRepository<ProfilePicture, long> ProfilePictureRepository;

        public UserRepository(
            DigitalHubLMSContext context,
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IRepository<UserInfo, long> userInfoRepository,
            IRepository<ProfilePicture, long> profilePictureRepository,
            IRepository<UserSecurityQuestion, long> userSecurityQuestionRepository)
            : base(context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            UserInfoRepository = userInfoRepository;
            UserSecurityQuestionRepository = userSecurityQuestionRepository;
            ProfilePictureRepository = profilePictureRepository;
        }

        public UserManager<User> GetUserManager()
        {
            return _userManager;
        }

        public SignInManager<User> GetSignInManager()
        {
            return _signInManager;
        }

        public async Task<User> FindByUsernamePasswordAsync(string username, string password)
        {
            var user = await _userManager.FindByNameAsync(username);
            var valid = await _signInManager.UserManager.CheckPasswordAsync(user, password);
            if (valid)
            {
                var userRoles = await _userManager.GetRolesAsync(user);
                var roles = _dbContext.Roles
                    .Where(item => userRoles.Any(n => n == item.Name))
                    .Select(e => new Role { Id = e.Id, Name = e.Name, IsActive = e.IsActive, ConcurrencyStamp = null }).ToList();
                user.Username = user.UserName;
                user.Roles = roles;
                user.PasswordHash = null;
                return user;
            }
            else
            {
                return null;
            }
        }

        public override async Task<List<User>> GetAll()
        {
            var allroles = await _dbContext.Roles.ToListAsync();
            var alldepartments = await _dbContext.Groups.ToListAsync();

            var users = await _dbContext.Users
           .Include(e => e.UserGroups)
           .Include(e => e.UserInfos)
           .Include(e => e.UserRoles)
           .ToListAsync();
            foreach (var user in users)
            {
                var info = user.UserInfos.FirstOrDefault();
                if (info != null)
                {
                    user.Title = info.Title;
                    user.Description = info.Description;
                    user.UserInfos = null;
                }
                var uroles = allroles
                    .Where(role => user.UserRoles.Any(ur => ur.RoleId == role.Id))
                    .Select(e => new Role { Id = e.Id, Name = e.Name, ConcurrencyStamp = null }).ToList();

                var udepartments = alldepartments
                    .Where(item => user.UserGroups.Any(role => role.GroupId == item.Id))
                    .Select(e => new Group { Id = e.Id, Name = e.Name }).ToList();

                user.Roles = uroles;
                user.Departments = udepartments;
                user.Username = user.UserName;

                user.UserGroups = null;
                user.UserRoles = null;
            }
            return users;
        }

        public override async Task<User> SaveAsync(User user)
        {
            user.EmailConfirmed = true;
            user.LockoutEnabled = false;
            user.UserName = user.Username;
            user.ConfirmCode = "123456";
            user.IsLdap = 0;
            user.IsVerified = 0;
            user._Id = Guid.NewGuid().ToString();
            using var transaction = _dbContext.Database.BeginTransaction();
            await CreateUser(user);
            await AssignUserRoles(user);
            await AddToGroups(user);
            await CreateUserInfo(user);
            await transaction.CommitAsync();
            return user;
        }

        private async Task CreateUser(User user)
        {
            var result = await _userManager.CreateAsync(user, user.Password);
            if (!result.Succeeded)
            {
                var ex = new AppException("create new user validation failed");
                foreach (var item in result.Errors)
                {
                    ex.Errors.Add(item.Code, item.Description);
                }
                throw ex;
            }
        }

        private async Task AssignUserRoles(User user)
        {
            var result = await _userManager.AddToRolesAsync(user, user.SelectedRoles.Select(e => e.Name));
            if (result.Succeeded)
            {
                user.Roles = user.SelectedRoles;
            }
            else
            {
                var ex = new AppException("assing user roles failed");
                foreach (var item in result.Errors)
                {
                    ex.Errors.Add(item.Code, item.Description);
                }
                throw ex;
            }
        }

        private async Task AddToGroups(User user)
        {
            foreach (var g in user.SelectedGroups)
            {
                //TODO: Add login user id
                var usergroup = new UserGroup { GroupId = g.Id, UserId = user.Id, CreatedAt = DateTime.Now, CreatedBy = 1 };
                _dbContext.UserGroups.Add(usergroup);
                await _dbContext.SaveChangesAsync();

                var coursesDepartments = await _dbContext.CourseDepartments.Where(e => e.GroupId == g.Id).ToListAsync();

                foreach (var courseDept in coursesDepartments)
                {
                    if (courseDept.CourseId != null)
                    {
                        var changeClass = new CourseEnrol { CourseId = courseDept.CourseId, UserId = user.Id };
                        _dbContext.CourseEnrols.Add(changeClass);
                        await _dbContext.SaveChangesAsync();
                        /*
                         if ($changeClass->wasRecentlyCreated) {
                            if ($user->email) {
                                dispatch(new EnrolledEmailJob($user->email, $user, $ccourse));
                            }
                         }
                         */
                    }
                }
            }
            user.Departments = user.SelectedGroups;
        }

        private async Task CreateUserInfo(User user)
        {
            var userInfo = new UserInfo { UserId = user.Id, Title = user.Title, Description = user.Description };
            _dbContext.UserInfos.Add(userInfo);
            await _dbContext.SaveChangesAsync();
        }

        public override async Task<int> DeleteAsync(long id)
        {
            var user = await _dbContext.Users
                .Include(e => e.UserRoles)
                .Where(e => e.Id == id).FirstOrDefaultAsync();

            if (user == null)
            {
                throw new KeyNotFoundException("etity not exsits");
            }
            else
            {
                if (user.UserRoles.Count == 1 && user.UserRoles.FirstOrDefault().RoleId == 5)
                {
                    _dbContext.Remove(user);
                    return await _dbContext.SaveChangesAsync();
                }
                throw new AppException("User has a role other than \'employee\', cannot delete");
            }
        }

        public async Task<SecurityQuestion> GetSecurityQuestionByUsername(string username)
        {
            var user = await _userManager.FindByNameAsync(username);
            if (user == null)
            {
                throw new KeyNotFoundException("User Not found");
            }
            var uquestion = await _dbContext.UserSecurityQuestions.Where(e => e.UserId == user.Id).FirstOrDefaultAsync();
            var squestion = await _dbContext.SecurityQuestions.Where(e => e.Id == uquestion.SecurityQuestionId).FirstOrDefaultAsync();
            return squestion;
        }

        public async Task<bool> CheckSecurityQuestionAnswer(string username, string securityAnswer)
        {
            var hasher = new PasswordHasher<User>();
            var user = await _dbContext.Users.Where(e => e.UserName == username).FirstOrDefaultAsync();
            if (user == null)
            {
                throw new KeyNotFoundException("User Not found");
            }
            var uquestion = await _dbContext.UserSecurityQuestions.Where(e => e.UserId == user.Id).FirstOrDefaultAsync();
            if (uquestion == null)
            {
                throw new KeyNotFoundException("Question Not found");
            }
            var result = hasher.VerifyHashedPassword(user, uquestion.SecurityAnswer, securityAnswer);
            if (result == PasswordVerificationResult.Success)
            {
                return true;
            }
            else
            {
                throw new AppException("Wrong answer!.");
            }
        }

        public async Task<bool> ChangeUserPassword(long userId, string username, string password, string newpassword)
        {
            var user = await _dbContext.Users.Where(e => e.UserName == username).FirstOrDefaultAsync();
            var validCredentials = await _userManager.CheckPasswordAsync(user, password);
            if (!validCredentials)
            {
                throw new BadHttpRequestException("There was a problem changing the password.");
            }
            var result = await _userManager.ChangePasswordAsync(user, password, newpassword);
            if (result.Succeeded)
            {
                return true;
            }
            else
            {
                var ex = new AppException("assing user roles failed");
                foreach (var item in result.Errors)
                {
                    ex.Errors.Add(item.Code, item.Description);
                }
                throw ex;
            }
        }

        public async Task<bool> SetUserForgetPassword(string username)
        {
            var user = await _dbContext.Users.Where(e => e.UserName == username).FirstOrDefaultAsync();
            if (user == null)
            {
                throw new BadHttpRequestException("There was a problem changing the password.");
            }
            var hasher = new PasswordHasher<User>();
            var SecurityStamp = Guid.NewGuid().ToString();
            var hasedPassword = hasher.HashPassword(user, "1q2w3e4r5t");
            user.PasswordHash = hasedPassword;
            user.UpdatedBy = user.Id;
            user.IsBanned = 1;
            user.IsVerified = 0;
            _dbContext.Update(user);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateUserInfo(long userId, string title, string description)
        {
            var userInfo = await _dbContext.UserInfos.Where(e => e.UserId == userId).FirstOrDefaultAsync();
            if (userInfo == null)
            {
                userInfo = new UserInfo();
                userInfo.UserId = userId;
                userInfo = await UserInfoRepository.SaveAsync(userInfo);
                userInfo.Title = title;
                userInfo.Description = description;
            }
            else
            {
                userInfo.Title = title;
                userInfo.Description = description;
                userInfo = await UserInfoRepository.UpdateAsync(userInfo);
            }
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public async Task<bool> SetFirstLoginChangePassAndQues(long userId, string password, long question_id, string security_answer)
        {
            var user = await _dbContext.Users.FindAsync(userId);
            if (user.PasswordChangedAt != null)
            {
                throw new BadHttpRequestException("Password already Changed");
            }
            var hasher = new PasswordHasher<User>();
            var SecurityStamp = Guid.NewGuid().ToString();
            var hasedPassword = hasher.HashPassword(user, password);
            user.PasswordHash = hasedPassword;
            user.UpdatedBy = userId;

            user.PasswordChangedAt = DateTime.Now;
            _dbContext.Users.Update(user);
            await _dbContext.SaveChangesAsync();
            var question = await _dbContext.UserSecurityQuestions.Where(e => e.UserId == userId).FirstOrDefaultAsync();
            if (question == null)
            {
                question = new UserSecurityQuestion();
                question.UserId = userId;
                question.SecurityQuestionId = question_id;
                question.SecurityAnswer = hasher.HashPassword(user, security_answer);
                question = await UserSecurityQuestionRepository.SaveAsync(question);
            }
            else
            {
                question.UserId = userId;
                question.SecurityQuestionId = question_id;
                question.SecurityAnswer = hasher.HashPassword(user, security_answer);
                question = await UserSecurityQuestionRepository.UpdateAsync(question);
            }
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public async Task<ProfilePicture> SaveUserProfilePicture(User user, ProfilePicture profilePicture)
        {
            var pp = _dbContext.ProfilePictures.Where(e => e.UserId == profilePicture.UserId).FirstOrDefaultAsync();
            if (pp == null)
            {
                var newProfile = await ProfilePictureRepository.SaveAsync(profilePicture);
                user.ProfilePictureId = newProfile.Id;
                await UpdateAsync(user);
                return newProfile;
            }
            else
            {
                profilePicture.Id = pp.Id;
                return await ProfilePictureRepository.UpdateAsync(profilePicture);
            }
        }
    }
}
