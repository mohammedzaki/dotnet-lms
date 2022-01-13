using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.API.SignalRHubs;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using MZCore.Helpers;

namespace DigitalHubLMS.API.Controllers
{
    public class AnnouncementController : BaseAPIRepoController<IAnnouncementRepository>
    {
        private IHubContext<SyncDataHub> _hub;
        public AnnouncementController(IHubContext<SyncDataHub> hub, IAnnouncementRepository repository)
            : base(repository)
        {
            _hub = hub;
        }

        // GET: [ControllerName]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<AnnouncementUser>>> Get()
            => await _repository.GetUserAnnouncements(this.User.GetLoggedInUserId<long>());


        // POST: [ControllerName]
        [HttpPost("read/{announcementId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<Announcement>>> AnnouncementRead(long announcementId)
        {
            await _repository.SetUserAnnouncementRead(announcementId);
            await _hub.Clients.All.SendAsync("newDataInserted");
            return new JsonResult(new { success = true });
        }
        
    }
}
