using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class DocumentsController : BaseAdminAPIRepoController<Document, long>
    {
        public DocumentsController(IRepository<Document, long> repository)
            : base(repository)
        {
        }
    }
}
