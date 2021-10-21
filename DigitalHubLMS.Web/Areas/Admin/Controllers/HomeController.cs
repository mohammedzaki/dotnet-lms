using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DigitalHubLMS.Web.Areas.Admin.Controllers
{
    public class HomeController : AdministrationController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
