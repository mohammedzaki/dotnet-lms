using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Helpers;
using MZCore.Patterns.Generices;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    [Authorize]
    [Route("admin/[controller]")]
    public class CoursesController : GenericAPIRepoController<ICourseRepository, Course, long>
    {
        public CoursesController(ICourseRepository repository)
            : base(repository)
        {
        }

        // GET: [ControllerName]
        [HttpGet("track/{courseId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<List<CourseEnrol>>> GetCourseTracking(long courseId)
            => await _repository.GetCourseTracking(courseId);
    }
}
