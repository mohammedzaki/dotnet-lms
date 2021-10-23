using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class DepartmentsController : BaseAdminAPIRepoController<Group, long>
    {
        public DepartmentsController(IRepository<Group, long> repository)
            : base(repository)
        {
        }
    }
}
