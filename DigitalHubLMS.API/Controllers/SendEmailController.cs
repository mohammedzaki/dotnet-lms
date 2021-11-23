using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Services.Contracts;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DigitalHubLMS.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SendEmailController : Controller
    {
        private readonly IEmailSender EmailSender;
        public SendEmailController(IEmailSender emailSender)
        {
            EmailSender = emailSender;
        }

        [HttpGet]
        public IActionResult Index()
        {
            var message = new Message(new string[] { "ali.abozied@gmail.com" }, "Confirmation Email", "Dear Ali <br /> Welcome To LMS System");
            EmailSender.SendEmail(message);

            return Accepted();
        }
    }
}
