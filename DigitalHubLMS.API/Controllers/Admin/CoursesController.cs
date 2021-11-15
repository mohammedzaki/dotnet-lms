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

        // PUT: [ControllerName]/:id

        /// <returns>successful updated entity</returns>
        /// <response code="201">Returns the updated item</response>
        /// <response code="400">If the item is null</response>    
        /// <response code="404">If the item is null</response>         
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public override async Task<ActionResult<Course>> Put(long id, Course inputentity)
        {
            var entity = await _repository.FindByIdAsync(id);
            JsonPatchDocumentExtension.From(inputentity).ApplyTo(entity);
            entity.Categories = inputentity.Categories;
            entity.Departments = inputentity.Departments;
            entity.Included = inputentity.Included;
            entity.Excluded = inputentity.Excluded;
            return await _repository.UpdateAsync(entity);
        }
    }
}
