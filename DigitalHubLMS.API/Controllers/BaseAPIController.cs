using System;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BaseAPIController<TDbContext> : ControllerBase
        where TDbContext : DbContext
    {
        protected readonly TDbContext _dbContext;

        public BaseAPIController(TDbContext context)
        {
            _dbContext = context;
        }
    }
}
