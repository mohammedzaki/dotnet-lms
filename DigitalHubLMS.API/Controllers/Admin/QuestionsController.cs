using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class QuestionsController : BaseAdminAPIRepoController<Question, long>
    {
        public QuestionsController(IRepository<Question, long> repository)
            : base(repository)
        {
        }
    }
}
