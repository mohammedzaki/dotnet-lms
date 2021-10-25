using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class OptionsController : BaseAdminAPIRepoController<Options, long>
    {
        public OptionsController(IRepository<Options, long> repository)
            : base(repository)
        {
        }
    }
}
