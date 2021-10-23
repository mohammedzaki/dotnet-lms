using System;
using DigitalHubLMS.Core.Data.Entities;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class ImagesController : BaseAdminAPIRepoController<Image, long>
    {
        public ImagesController(IRepository<Image, long> repository)
            : base(repository)
        {
        }
    }
}
