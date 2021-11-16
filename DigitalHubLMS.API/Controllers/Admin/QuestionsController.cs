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
    }
}
