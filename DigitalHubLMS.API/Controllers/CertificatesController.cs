using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using DigitalHubLMS.Core.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MZCore.Helpers;

namespace DigitalHubLMS.API.Controllers
{
    public class CertificatesController : BaseAPIRepoController<ICertificatesRepository>
    {
        public IConfiguration Configuration { get; }

        public CertificatesController(ICertificatesRepository repository, IConfiguration configuration)
            : base(repository)
        {
            Configuration = configuration;
        }

        // GET: [ControllerName]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<Certificate>>> GetUserCertificates()
            => await _repository.GetUserCertificates(User.GetLoggedInUserId<long>());

        // GET: [ControllerName]
        [AllowAnonymous]
        [HttpGet("download/{name}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual IActionResult DownLoadCertificate(string name)
        {
            var storageDirectoryPath = Configuration.GetStoragePath();
            var certPath = storageDirectoryPath + @$"/certificates/{name}.pdf";
            return new PhysicalFileResult(certPath, "application/pdf");
        }
    }
}
