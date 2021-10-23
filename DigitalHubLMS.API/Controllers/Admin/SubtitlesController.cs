using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class SubtitlesController : BaseAdminAPIRepoController<Subtitle, long>
    {
        public SubtitlesController(IRepository<Subtitle, long> repository)
            : base(repository)
        {
        }
    }
}
