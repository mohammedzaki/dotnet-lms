using Microsoft.AspNetCore.Identity;
using DigitalHubLMS.Core.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

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

        public new async Task<List<User>> GetAll()
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

        public async Task<User> CreateAsync(User user, List<Role> selectedRoles, List<Group> selectedGroups)
        {
            /*
            $data = [
                'username' => $request->username,
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                'is_banned' => $request->is_banned ? 1 : 0,
                'display_name' => $request->display_name,
                'created_by' => $userId,
                'updated_by' => $userId
            ];
            */

            // var u = new User { UserName = user.Email, Email = user.Email, EmailConfirmed = true, LockoutEnabled = false };
            var result = await _userManager.CreateAsync(user, user.Password);

            return user;

        }

        /*
          public function createUser(Request $request)
    {
        $userId = Auth::user()->id;

        $data = ['username' => $request->username, 'first_name' => $request->first_name, 'last_name' => $request->last_name, 'email' => $request->email, 'is_banned' => $request->is_banned ? 1 : 0, 'display_name' => $request->display_name, 'created_by' => $userId, 'updated_by' => $userId,];

        if (!$request->id) {
            $data['password']     = Hash::make($request->password);
            $data['confirm_code'] = "123456";
        }
        $user = User::updateOrCreate(['id' => $request->id], $data);

        $roles = [];

        if ($request->id) {
            $userRoles = UserRole::where('user_id', $request->id)
                                 ->get();
            foreach ($userRoles as $role) {
                $found = in_array($role->role_id, array_column($request->selectedRoles, 'id'));
                if (!$found) {
                    // $role->delete();
                    User::findOrFail($request->id)
                        ->revokeRole($role->role_id);

                }
            }
            $userGroups = UserGroup::where('user_id', $request->id)
                                   ->get();
            foreach ($userGroups as $group) {
                $found = in_array($group->group_id, array_column($request->selectedGroups, 'id'));
                if (!$found) {
                    $group->delete();
                }
            }
        }

        if ($request->selectedRoles) {
            foreach ($request->selectedRoles as $role) {
                // $user_role =  UserRole::updateOrCreate(
                //     [
                //         'user_id' => $user->id,
                //         'role_id' =>
                //     ],[
                //         'created_by'=>$userId,
                //         'updated_by'=>$userId,
                //     ]
                // );
                User::findOrFail($request->id)
                    ->assignRole($role['id']);

                // $roles[]=$user_role;

            }
        }
        $user->roles = $request->selectedRoles;
        $groups      = [];

        if ($request->selectedGroups) {
            foreach ($request->selectedGroups as $group) {
                $user_group = UserGroup::updateOrCreate(['user_id' => $user->id, 'group_id' => $group['id']], ['created_by' => $userId, 'updated_by' => $userId,

                                                                                                            ]
                );

                $coursesDepartments = CourseDepartment::where('group_id', $group['id'])->get();
                foreach ($coursesDepartments as $course) {
                    $courseId = $course["course_id"];
                    $ccourse  = Course::findOrFail($courseId);

                    if ($courseId) {
                        $changeClass = CourseEnrol::updateOrCreate(['course_id' => $courseId, 'user_id' => $user->id,]);
                        if ($changeClass->wasRecentlyCreated) {
                            if ($user->email) {
                                dispatch(new EnrolledEmailJob($user->email, $user, $ccourse));
                            }

                        }

                    }

                }
            }
        }
        $user->departments = $request->selectedGroups;
        $userInfo          = UserInfo::updateOrCreate(['user_id' => $user->id], ['title' => $request->title, 'description' => $request->description,]
        );
        $user->title       = $request->title;
        $user->description = $request->description;

        $user->profile_picture;

        return response()
            ->json($user);
    }
         */

        /*
         
        public function deleteUser($userId)
    {
        $user = User::findOrFail($userId);

        if ($user
                ->roles
                ->count() === 1 && $user->hasRoleByName('employee')) {
            $user->forceDelete();

            Cache::tags(['users',])
                 ->flush();

            return response()
                ->json(['success' => true], 202);
        }

        return response()
            ->json(['error' => 'User has a role other than \'employee\', cannot delete'], 404);
    }
         */
    }
}
