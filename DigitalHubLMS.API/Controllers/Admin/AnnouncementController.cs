using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class AnnouncementController : BaseAdminAPIRepoController<Announcement, long>
    {
        public AnnouncementController(IRepository<Announcement, long> repository)
            : base(repository)
        {
        }
    }
}
