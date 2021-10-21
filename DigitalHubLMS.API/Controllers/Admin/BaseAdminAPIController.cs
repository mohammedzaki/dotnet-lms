using System;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;

namespace DigitalHubLMS.API.Controllers.Admin
{
    [Route("admin/[controller]")]
    public class BaseAdminAPIController : BaseAPIController
    {
        public BaseAdminAPIController(DigitalHubLMSContext context)
            : base(context)
        {
        }
    }
}
