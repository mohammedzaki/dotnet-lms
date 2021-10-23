using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class OptionsController : BaseAdminAPIRepoController<Option, long>
    {
        public OptionsController(IRepository<Option, long> repository)
            : base(repository)
        {
        }
    }
}
