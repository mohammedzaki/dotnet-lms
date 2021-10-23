using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class CourseClassController : BaseAdminAPIRepoController<CourseClass, long>
    {
        public CourseClassController(IRepository<CourseClass, long> repository)
            : base(repository)
        {
        }
    }
}
