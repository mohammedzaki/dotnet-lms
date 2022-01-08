using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using DigitalHubLMS.Core.Services.Contracts;
using Microsoft.AspNetCore.Authorization;
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
        protected readonly IRepository<SecurityQuestion, long> SecurityQuestionsRepository;
        protected readonly DigitalHubLMSContext _dbContext;
        protected readonly IStorageService StorageService;

        public UsersController(
            IUserRepository repository,
            IRepository<SecurityQuestion, long> securityQuestionsRepository,
            IStorageService storageService,
            DigitalHubLMSContext context) :
            base(repository)
        {
            SecurityQuestionsRepository = securityQuestionsRepository;
            StorageService = storageService;
            _dbContext = context;
        }

        // GET: [ControllerName]/get-security-questions
        [HttpGet("security-questions")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<SecurityQuestion>>> GetSecurityQuestions()
            => await SecurityQuestionsRepository.GetAll();

        // GET: [ControllerName]/get-profile-pic
        [HttpGet("get-profile-pic")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ProfilePicture>> GetProfilePicture()
        {
            return await _repository.GetProfilePic(User.GetLoggedInUserId<long>());
        }

        // GET: [ControllerName]/get-security-questions
        [HttpGet("security-questions/{username}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<SecurityQuestion>> GetSecurityQuestions([Required] string username)
            => await _repository.GetSecurityQuestionByUsername(username);

        // POST: [ControllerName]/security-questions/check-answer
        [HttpPost("security-questions/check-answer")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<bool>> CheckUserAnswer([Required] string username, [Required] string securityAnswer)
            => await _repository.CheckSecurityQuestionAnswer(username, securityAnswer);

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("set-profile-picture")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ProfilePicture>> SetProfilePicture([Required] [FromForm] IFormFile image)
            => await StorageService.SetUserProfilePicture(User.GetLoggedInUserId<long>(), image);

        // GET: [ControllerName]/change-pass-sec_ques
        [HttpPut("change-password-security-question")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<bool>> FirstLoginChangePassAndQues([Required] string password, [Required] long question_id, [Required] string security_answer)
            => await _repository.SetFirstLoginChangePassAndQues(User.GetLoggedInUserId<long>(), password, question_id, security_answer);

        [HttpPut("change-password")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<bool>> ChangePassword([Required] string username, [Required] string password, [Required] string newpassword)
            => await _repository.ChangeUserPassword(User.GetLoggedInUserId<long>(), username, password, newpassword);

        [AllowAnonymous]
        [HttpPost("forget-password")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<bool>> ForgetPassword([Required] ForgetPasswordModel forgetPasswordModel)
            => await _repository.SetUserForgetPassword(forgetPasswordModel.email);

        [HttpPut("update-info")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<bool>> UpdateInfo([Required] string title, [Required] string description)
            => await _repository.UpdateUserInfo(User.GetLoggedInUserId<long>(), title, description);
    }
}
