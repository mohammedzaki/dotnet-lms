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
using Microsoft.AspNetCore.Http;
using DigitalHubLMS.Core.Data.Repositories.Contracts;

namespace DigitalHubLMS.API.Controllers
{
    public class AuthController : BaseAPIController<DigitalHubLMSContext>
    {
        private readonly IUserRepository _repository;
        private readonly IConfiguration _configuration;


        public AuthController(IUserRepository repository, DigitalHubLMSContext context, IConfiguration configuration)
            : base(context)
        {
            _repository = repository;
            _configuration = configuration;
        }

        // POST: auth/login
        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<ActionResult<LoginResponse>> PostBodyUsersLogin([FromBody] LoginModel loginModel)
        {
            return await DoLogin(loginModel);
        }

        // POST: auth/login
        [AllowAnonymous]
        [HttpPost("loginforswagger")]
        public async Task<ActionResult<LoginResponse>> PostFromUsersLogin([FromForm] LoginModel loginModel)
        {
            return await DoLogin(loginModel);
        }

        private async Task<ActionResult<LoginResponse>> DoLogin(LoginModel loginModel)
        {
            var user = await _repository.FindByUsernamePasswordAsync(loginModel.Username, loginModel.Password);
            if (user == null)
            {
                return Unauthorized();
            }
            else
            {
                var userRoles = await _repository.GetUserManager().GetRolesAsync(user);

                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(ClaimTypes.NameIdentifier, user.Id.ToString())
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
                var tokenStr = new JwtSecurityTokenHandler().WriteToken(token);
                return new LoginResponse
                {
                    Token = tokenStr,
                    AccessToken = tokenStr,
                    User = user
                };
            }
        }
    }
}
