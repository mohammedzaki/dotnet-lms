using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class CertificatesController : BaseAdminAPIRepoController<Certificate, long>
    {
        public CertificatesController(IRepository<Certificate, long> repository)
            : base(repository)
        {
        }
    }
}
