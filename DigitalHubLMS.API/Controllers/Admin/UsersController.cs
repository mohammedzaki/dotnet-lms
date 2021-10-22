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
using Castle.DynamicProxy.Generators.Emitters.SimpleAST;
using DigitalHubLMS.API.Controllers.Admin;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class UsersController : BaseAdminAPIController
    {
        private readonly IUserRepository _repository;

        public UsersController(IUserRepository repository, DigitalHubLMSContext context)
            : base(context)
        {
            _repository = repository;
        }

        [HttpGet]
        public async Task<ActionResult<List<User>>> GetAllUsers()
        {
            return await _repository.GetAll();
        }

        [HttpPost]
        public async Task<ActionResult<User>> CreateUser(User user)
        {
            //return await _repository.CreateAsync(user);

            return user;
        }

        [HttpDelete("{id?}")]
        public async Task<ActionResult<int>> DeleteUser(long? id)
        {
            return await _repository.DeleteAsync(id);
        }
    }
}
