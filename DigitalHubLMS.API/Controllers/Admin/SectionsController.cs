using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class SectionsController : BaseAdminAPIRepoController<Section, long>
    {
        public SectionsController(IRepository<Section, long> repository)
            : base(repository)
        {
        }
    }
}
