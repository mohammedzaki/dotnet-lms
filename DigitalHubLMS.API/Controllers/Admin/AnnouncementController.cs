using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.SignalRHubs;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class AnnouncementController : BaseAdminAPIRepoController<Announcement, long>
    {
        private IHubContext<SyncDataHub> _hub;
        protected readonly IRepository<AnnouncementUser, long> announcementUserRepository;
        public AnnouncementController(IRepository<AnnouncementUser, long> AnnouncementUserRepository, IHubContext<SyncDataHub> hub, IRepository<Announcement, long> repository)
            : base(repository)
        {
            announcementUserRepository = AnnouncementUserRepository;
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
            var usersToInclud = new List<long>();
            Announcement ann = new Announcement();
            long annId = 0;
            if (entity.Included != null)
            {
                entity.Priority = "1";
                ann = await _repository.SaveAsync(entity);
                annId = ann.Id;
                foreach (var user in entity.Included)
                {
                    usersToInclud.Add(user.Id);
                }
            }
            else
            {
                ann = await _repository.SaveAsync(entity);
            }
            foreach (var userId in usersToInclud)
            {
                await announcementUserRepository.SaveAsync(
                    new AnnouncementUser
                    {
                        //Id = GenerateNewID(),
                        //CreatedAt = DateTime.Now,
                        //UpdatedAt = DateTime.Now,
                        //CreatedBy = User.GetLoggedInUserId<long>(),
                        //UpdatedBy = User.GetLoggedInUserId<long>(),
                        AnnouncementId = annId,
                        UserId = userId,
                        Read = 0
                    });
            }
            
            await _hub.Clients.All.SendAsync("newDataInserted");
            return ann;
        }

        // GET: [ControllerName]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public override async Task<ActionResult<List<Announcement>>> Get()
        {
            List<Announcement> list =  await _repository.GetAll();
            //list = list.Where(e => e.Priority == "0").ToList();
            return list;
        }

    }
}
