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
        public async Task<IActionResult> PostUsersLogin(LoginModel loginModel)
        {
            var user = await _repository.FindByUsernamePasswordAsync(loginModel.Username, loginModel.Password);
            if (user == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(new {
                    _id = user._Id,
                    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZGlnaXRhbC1sbXMubG9jYWxob3N0L2xvZ2luIiwiaWF0IjoxNjM0Nzk0NzE2LCJleHAiOjE2MzUzOTk1MTYsIm5iZiI6MTYzNDc5NDcxNiwianRpIjoiRGlTcVQ1SWRUb1dTcm8zSCIsInN1YiI6MzM2LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.M5TSxsL1IudfXb1M5k6Wh25fcDwuxXMUWOz4I1NL2tY",
                    user
                } );
            }
        }
    }
}
