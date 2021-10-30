using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Helpers;

namespace DigitalHubLMS.API.Controllers
{
    public class AnnouncementController : BaseAPIRepoController<IAnnouncementRepository>
    {
        public AnnouncementController(IAnnouncementRepository repository)
            : base(repository)
        {
        }

        // GET: [ControllerName]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<AnnouncementUser>>> Get() => await _repository.GetUserAnnouncements(this.User.GetLoggedInUserId<long>());


        // GET: [ControllerName]
        [HttpPost("read/{announcementId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<Announcement>>> AnnouncementRead(long announcementId)
        {
            await _repository.SetUserAnnouncementRead(announcementId);
            return new JsonResult(new { success = true });
        }
        
    }
}
