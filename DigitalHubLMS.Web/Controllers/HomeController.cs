using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ClosedXML.Excel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Helpers;

namespace DigitalHubLMS.Web.Controllers
{
    public class HomeController : Controller
    {
        

        public HomeController()
        {
            
        }
        
        public IActionResult Index()
        {
            return View();
        }
    }

}
