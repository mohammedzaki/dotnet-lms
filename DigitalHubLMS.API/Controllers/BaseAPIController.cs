using System;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;

namespace DigitalHubLMS.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BaseAPIController : ControllerBase
    {
        protected readonly DigitalHubLMSContext _dbContext;

        public BaseAPIController(DigitalHubLMSContext context)
        {
            _dbContext = context;
        }
    }
}
