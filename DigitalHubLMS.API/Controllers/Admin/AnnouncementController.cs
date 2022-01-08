using System;
using System.Threading.Tasks;
using DigitalHubLMS.API.SignalRHubs;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class AnnouncementController : BaseAdminAPIRepoController<Announcement, long>
    {
        private IHubContext<SyncDataHub> _hub;
        public AnnouncementController(IHubContext<SyncDataHub> hub, IRepository<Announcement, long> repository)
            : base(repository)
        {
            _hub = hub;
        }

        // POST: [ControllerName]
        /// <returns>A newly created entity</returns>
        /// <response code="201">Returns the newly created item</response>
        /// <response code="400">If the item is null</response>            
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public override async Task<ActionResult<Announcement>> Post(Announcement entity)
        {
            var ann = await _repository.SaveAsync(entity);
            await _hub.Clients.All.SendAsync("newDataInserted");
            return ann;
        }

    }
}
