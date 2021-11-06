using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class QuizzesController : BaseAdminAPIRepoController<Quiz, long>
    {
        protected readonly IRepository<Questions, long> QuestionsRepository;

        public QuizzesController(IRepository<Quiz, long> repository, IRepository<Questions, long> questionsRepository)
            : base(repository)
        {
            QuestionsRepository = questionsRepository;
        }

        [HttpPut("order")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<bool>> OrderSections([Required][FromBody] List<Questions> questions)
        {
            foreach (var question in questions)
            {
                await QuestionsRepository.UpdateAsync(question);
            }
            return true;
        }
    }
}
