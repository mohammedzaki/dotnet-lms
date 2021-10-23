using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class RolesController : BaseAdminAPIRepoController<Role, long>
    {
        public RolesController(IRepository<Role, long> repository)
            : base(repository)
        {
        }
    }
}
