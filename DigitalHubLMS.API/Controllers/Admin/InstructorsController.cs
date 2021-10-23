using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class InstructorsController : BaseAdminAPIRepoController<User, long>
    {
        public InstructorsController(IRepository<User, long> repository)
            : base(repository)
        {
        }
    }
}
