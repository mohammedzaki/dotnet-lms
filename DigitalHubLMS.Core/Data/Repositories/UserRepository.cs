using Microsoft.AspNetCore.Identity;
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

        public UserRepository(DigitalHubLMSContext context, UserManager<User> userManager,
            SignInManager<User> signInManager) : base(context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
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
            try
            {
                var user = await _userManager.FindByNameAsync(username);
                var valid = await _signInManager.UserManager.CheckPasswordAsync(user, password);
                if (valid)
                {
                    var userRoles = await _userManager.GetRolesAsync(user);
                    var roles = _dbContext.Roles
                        .Where(item => userRoles.Any(n => n == item.Name))
                        .Select(e => new Role { Id = e.Id, _Id = e._Id, Name = e.Name, IsActive = e.IsActive, Level = e.Level, ConcurrencyStamp = null }).ToList();
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
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
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

            await CreateUser(user);
            await AssignUserRoles(user);
            await AddToGroups(user);
            await CreateUserInfo(user);
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
            if (user != null)
            {
                throw new KeyNotFoundException("User Not found");
            }
            var uquestion = await _dbContext.UserSecurityQuestions.Where(e => e.UserId == user.Id).FirstOrDefaultAsync();
            var squestion = await _dbContext.SecurityQuestions.Where(e => e.Id == uquestion.SecurityQuestionId).FirstOrDefaultAsync();
            return squestion;
        }

        public async Task<bool> CheckSecurityQuestionAnswer(string username, string securityAnswer)
        {
            /*
             $user = User::where('username', $request->username)
                    ->first();

            if (!$user) {
                $this->throwValidationExceptionMessage('User Not found');
            }

            $question = UserSecurityQuestion::where('user_id', $user->id)
                                            ->first();

            if (!$question) {
                $this->throwValidationExceptionMessage('No Question');
            }

            if (!Hash::check($request->security_answer, $question->security_answer)) {
                $this->throwValidationExceptionMessage('There was a problem checking Answer.');
            }

            return response('OK', 200);
             */

            throw new NotImplementedException();
        }
    }
}
