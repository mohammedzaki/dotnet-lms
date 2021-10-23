using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class MediaController : BaseAdminAPIRepoController<Media, long>
    {
        public MediaController(IRepository<Media, long> repository)
            : base(repository)
        {
        }
    }
}
