using System;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class CourseClassController : BaseAdminAPIRepoController<CourseClass, long>
    {
        public CourseClassController(ICourseClassRepository repository)
            : base(repository)
        {
        }
    }
}
