using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class QuestionsController : BaseAdminAPIRepoController<Questions, long>
    {
        public QuestionsController(IRepository<Questions, long> repository)
            : base(repository)
        {
        }
    }
}
