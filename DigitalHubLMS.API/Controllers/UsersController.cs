using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories;

namespace DigitalHubLMS.API.Controllers
{
    public class UsersController : BaseAPIController
    {
        private readonly IUserRepository _repository;

        public UsersController(IUserRepository repository, DigitalHubLMSContext context)
            : base(context)
        {
            _repository = repository;
        }

        // POST: api/FamilyHistory
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost("login")]
        public async Task<ActionResult<LoginResponse>> PostUsersLogin(LoginModel loginModel)
        {
            var user = await _repository.FindByUsernamePasswordAsync(loginModel.Username, loginModel.Password);
            if (user == null)
            {
                return NotFound();
            }
            else
            {
                return new LoginResponse
                {
                    _id = user._Id,
                    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZGlnaXRhbC1sbXMubG9jYWxob3N0L2xvZ2luIiwiaWF0IjoxNjM0ODcwNzkzLCJleHAiOjE2MzU0NzU1OTMsIm5iZiI6MTYzNDg3MDc5MywianRpIjoiN3FNem51VHZFa0I5bGd1ayIsInN1YiI6NSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.s8f6zPNGemf-wnDAtSgj29jOPRXiXx3N44Pixw8J8_s",
                    user = user
                };
            }
        }
    }
}
