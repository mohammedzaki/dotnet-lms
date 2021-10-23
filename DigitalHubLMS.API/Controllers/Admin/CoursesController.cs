using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class CoursesController : BaseAdminAPIRepoController<Course, long>
    {
        public CoursesController(IRepository<Course, long> repository)
            : base(repository)
        {
        }
    }
}
