using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
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
