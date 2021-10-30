using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Helpers;

namespace DigitalHubLMS.API.Controllers
{
    public class CoursesController : BaseAPIRepoController<ICourseRepository>
    {
        public CoursesController(ICourseRepository repository)
            : base(repository)
        {
        }

        // GET: [ControllerName]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<List<CourseEnrol>>> Get() => await _repository.GetEnrolledCourses(User.GetLoggedInUserId<long>());

        [HttpGet("{slug}/page")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<Course>> GetCoursePage([Required] string slug) => await _repository.GetUserCoursePage(User.GetLoggedInUserId<long>(),slug);

        [HttpGet("{courseId}/next/{classId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<CourseClass>> GetNextCourseClass([Required] long courseId, [Required] long classId) => await _repository.GetNextCourseClass(courseId, classId);

        [HttpGet("{courseSlug}/taking")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<Course>> GetCourseTaking([Required] string courseSlug) => await _repository.GetUserCourseTaking(User.GetLoggedInUserId<long>(), courseSlug);
    }
}
