using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class QuizzesController : BaseAdminAPIRepoController<Quiz, long>
    {
        public QuizzesController(IRepository<Quiz, long> repository)
            : base(repository)
        {
        }
    }
}
