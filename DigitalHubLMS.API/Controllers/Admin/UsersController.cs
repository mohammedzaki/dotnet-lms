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
    public class UsersController : BaseAdminAPIRepoController<User, long>
    {
        public UsersController(IUserRepository repository)
            : base(repository)
        {
        }
    }
}
