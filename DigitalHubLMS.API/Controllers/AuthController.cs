using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using System.Collections.Generic;
using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Extensions.Configuration;
using System.Text;
using Microsoft.AspNetCore.Authorization;

namespace DigitalHubLMS.API.Controllers
{
    public class AuthController : BaseAPIController<DigitalHubLMSContext>
    {
        private readonly IUserRepository _repository;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _configuration;

        public AuthController(IUserRepository repository, DigitalHubLMSContext context, UserManager<User> userManager,
            SignInManager<User> signInManager, IConfiguration configuration)
            : base(context)
        {
            _repository = repository;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        // POST: auth/login
        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<ActionResult<LoginResponse>> PostUsersLogin(LoginModel loginModel)
        {
            var user = await _repository.FindByUsernamePasswordAsync(loginModel.Username, loginModel.Password);
            if (user == null)
            {
                return Unauthorized();
            }
            else
            {
                var userRoles = await _userManager.GetRolesAsync(user);

                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };

                foreach (var userRole in userRoles)
                {
                    authClaims.Add(new Claim(ClaimTypes.Role, userRole));
                }

                var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

                var token = new JwtSecurityToken(
                    issuer: _configuration["JWT:ValidIssuer"],
                    audience: _configuration["JWT:ValidAudience"],
                    expires: DateTime.Now.AddHours(12),
                    claims: authClaims,
                    signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
                    );

                //return StatusCode(StatusCodes.Status200OK, new
                //{
                //    status = true,
                //    code = 200,
                //    message = "User Loginned Successfully!",
                //    //token = new JwtSecurityTokenHandler().WriteToken(token),
                //    //expiration = token.ValidTo,
                //    data = new { id = user.Id, fullName = user.FullName }
                //});

                return new LoginResponse
                {
                    _id = user._Id,
                    token = new JwtSecurityTokenHandler().WriteToken(token),
                    //token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZGlnaXRhbC1sbXMubG9jYWxob3N0L2xvZ2luIiwiaWF0IjoxNjM0ODcwNzkzLCJleHAiOjE2MzU0NzU1OTMsIm5iZiI6MTYzNDg3MDc5MywianRpIjoiN3FNem51VHZFa0I5bGd1ayIsInN1YiI6NSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.s8f6zPNGemf-wnDAtSgj29jOPRXiXx3N44Pixw8J8_s",
                    user = user
                };
            }
        }
    }
}
