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
            var message = new Message(new string[] { "ali.abozied@gmail.com" }, "Confirmation Email", "Dear Ali <br /> Welcome to MPED E-Learning system! Here's your login info: <br />" +
                "Username: AliAbozied <br /> Password: Password <br /> Please use the following link to login: <a href='lms.mped.gov.eg'> lms.mped.gov.eg </a>");
            EmailSender.SendEmail(message);

            return Accepted();
        }
    }
}
