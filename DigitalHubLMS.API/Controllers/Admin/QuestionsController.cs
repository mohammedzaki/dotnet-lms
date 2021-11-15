using System;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class QuestionsController : BaseAdminAPIRepoController<Questions, long>
    {
        public QuestionsController(IRepository<Questions, long> repository)
            : base(repository)
        {
        }

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
        public override async Task<ActionResult<Questions>> Put(long id, Questions inputentity)
        {
            var entity = await _repository.FindByIdAsync(id);
            JsonPatchDocumentExtension.From(inputentity).ApplyTo(entity);
            entity.Options = inputentity.Options;
            return await _repository.UpdateAsync(entity);
        }
    }
}
