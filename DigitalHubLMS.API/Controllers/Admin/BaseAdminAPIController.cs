using System;
using System.Linq;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DigitalHubLMS.API.Controllers.Admin
{

    [Route("admin/[controller]")]
    public class BaseAdminAPIController<TDbContext> : BaseAPIController<TDbContext>
        where TDbContext : DbContext
    {
        public BaseAdminAPIController(TDbContext context)
            : base(context)
        {
        }
    }
}
