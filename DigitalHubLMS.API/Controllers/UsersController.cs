using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers
{
    public class UsersController : BaseAPIRepoController<IUserRepository>
    {
        protected readonly IRepository<SecurityQuestion, long> _securityQuestionsRepository;
        protected readonly DigitalHubLMSContext _dbContext;

        public UsersController(IUserRepository repository, IRepository<SecurityQuestion, long> securityQuestionsRepository, DigitalHubLMSContext context)
            : base(repository)
        {
            _securityQuestionsRepository = securityQuestionsRepository;
            _dbContext = context;
        }

        // GET: [ControllerName]/get-security-questions
        [HttpGet("security-questions")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<SecurityQuestion>>> GetSecurityQuestions() => await _securityQuestionsRepository.GetAll();

        // GET: [ControllerName]/get-security-questions
        [HttpGet("security-questions/{username}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<SecurityQuestion>> GetSecurityQuestions([Required] string username) => await _repository.GetSecurityQuestionByUsername(username);

        // POST: [ControllerName]/security-questions/check-answer
        [HttpPost("security-questions/check-answer")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<bool>> CheckUserAnswer([Required] string username, [Required] string securityAnswer) => await _repository.CheckSecurityQuestionAnswer(username, securityAnswer);

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("set-profile-picture")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<IActionResult> SetProfilePicture()
        {
            /*
            $response = null;
            $userId   = Auth::user()->id;
            $fileName = Auth::user()->display_name;

            if ($request->has('user_id')) {
                $userId = $request->user_id;
            }
            if ($request->has('display_name')) {
                $fileName = $request->display_name;
            }
            $title = $fileName . " profile";
            if ($request->hasFile('image')) {
                $original_filename     = $request->file('image')->getClientOriginalName();
                $mime                  = $request->file('image')->getMimeType();
                $original_filename_arr = explode('.', $original_filename);
                $file_ext              = end($original_filename_arr);
                $destination_path      = $this->dbase . 'profile/';
                $host_path             = $this->base . 'profile/';
                $uuid                  = Uuid::generate(4)->string;
                $image                 = 'U-' . $uuid . '.' . $file_ext;

                if ($request->file('image')->move($destination_path, $image)) {

                    $profilePicture = ProfilePicture::updateOrCreate(
                        [
                            'user_id' => $userId,
                        ],
                        [

                            '_id'        => Uuid::generate(4)->string,
                            'title'      => $title,
                            'mime'       => $mime,
                            'url'        => request()->getSchemeAndHttpHost() . $host_path . $image,
                            'file_key'   => $uuid,
                            'created_by' => Auth::user()->id,
                            'updated_by' => Auth::user()->id,

                        ]
                    );

                    Auth::user()->profile_picture_id = $profilePicture->id;
                    Auth::user()->save();

                    return $this->responseRequestSuccess($profilePicture);
                } else {
                    return $this->responseRequestError('Cannot upload file');
                }
            } else {
                return $this->responseRequestError('File not found');
            }
             */
            throw new NotImplementedException();
        }

        // GET: [ControllerName]/change-pass-sec_ques
        [HttpPut("change-password-security-question")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<IActionResult> FirstLoginChangePassAndQues([Required] string password, [Required] long question_id, [Required] string security_answer)
        {
            var userId = User.GetLoggedInUserId<long>();
            var user = await _dbContext.Users.FindAsync(userId);
            if (user.PasswordChangedAt != null)
            {
                throw new BadHttpRequestException("Password already Changed");
            }
            var hasher = new PasswordHasher<User>();
            var SecurityStamp = Guid.NewGuid().ToString();
            var hasedPassword = hasher.HashPassword(null, password);
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
                question.SecurityAnswer = hasher.HashPassword(null, security_answer);
                _dbContext.Add(question);
            }
            else
            {
                question.UserId = userId;
                question.SecurityQuestionId = question_id;
                question.SecurityAnswer = hasher.HashPassword(null, security_answer);
                _dbContext.Update(question);
            }
            await _dbContext.SaveChangesAsync();
            return Ok("Ok");
        }

        [HttpPut("change-password")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<IActionResult> ChangePassword([Required] string username, [Required] string password, [Required] string newpassword)
        {
            var userId = User.GetLoggedInUserId<long>();
            var user = await _dbContext.Users.Where(e => e.UserName == username).FirstOrDefaultAsync();
            var validCredentials = await _repository.GetUserManager().CheckPasswordAsync(user, password);
            if (!validCredentials)
            {
                throw new BadHttpRequestException("There was a problem changing the password.");
            }
            await _repository.GetUserManager().ChangePasswordAsync(user, password, newpassword);
            return Ok("Ok");
        }


        [HttpPost("forget-password")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<IActionResult> ForgetPassword([Required] string password, [Required] string username)
        {
            var user = await _dbContext.Users.Where(e => e.UserName == username).FirstOrDefaultAsync();
            if (user == null) {
                throw new BadHttpRequestException("There was a problem changing the password.");
            }
            var hasher = new PasswordHasher<User>();
            var SecurityStamp = Guid.NewGuid().ToString();
            var hasedPassword = hasher.HashPassword(null, password);
            user.PasswordHash = hasedPassword;
            user.UpdatedBy = user.Id;
            user.IsBanned = 1;
            user.IsVerified = 0;
            _dbContext.Update(user);
            await _dbContext.SaveChangesAsync();
            return Ok("Ok");
        }

        [HttpPut("update-info")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<IActionResult> UpdateInfo([Required] string title, [Required] string description)
        {
            var userId = User.GetLoggedInUserId<long>();
            var userInfo = await _dbContext.UserInfos.Where(e => e.UserId == userId).FirstOrDefaultAsync();
            if (userInfo == null)
            {
                userInfo = new UserInfo();
                userInfo.UserId = userId;
                _dbContext.Add(userInfo);
                userInfo.Title = title;
                userInfo.Description = description;
            }
            else
            {
                userInfo.Title = title;
                userInfo.Description = description;
                _dbContext.Update(userInfo);
            }
            await _dbContext.SaveChangesAsync();
            return Ok("Ok");
        }
    }
}
