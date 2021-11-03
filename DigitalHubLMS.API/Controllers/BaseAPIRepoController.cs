using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Generices;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers
{
    //[Authorize]
    [ApiController]
    [Route("[controller]")]
    public abstract class BaseAPIRepoController<TRepository> : ControllerBase
        where TRepository : IBaseRepository
    {
        protected readonly TRepository _repository;

        public BaseAPIRepoController(TRepository repository)
        {
            _repository = repository;
        }
    }
}
