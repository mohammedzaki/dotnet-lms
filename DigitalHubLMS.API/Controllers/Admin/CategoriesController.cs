using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class CategoriesController : BaseAdminAPIRepoController<Category, long>
    {
        public CategoriesController(IRepository<Category, long> repository)
            : base(repository)
        {
        }
    }
}
