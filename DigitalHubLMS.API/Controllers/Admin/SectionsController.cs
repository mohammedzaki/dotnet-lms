using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class SectionsController : BaseAdminAPIRepoController<Section, long>
    {
        protected readonly IRepository<CourseClass, long> CourseClassRepository;

        public SectionsController(IRepository<Section, long> repository, IRepository<CourseClass, long> courseClassRepository)
            : base(repository)
        {
            CourseClassRepository = courseClassRepository;
        }

        [HttpPut("order")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<bool>> OrderSections([Required] [FromBody] List<Section> sections)
        {
            foreach (var section in sections)
            {
                await _repository.UpdateAsync(section);
            }
            return true;
        }
    }
}
