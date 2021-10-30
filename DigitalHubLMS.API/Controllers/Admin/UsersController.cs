using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class UsersController : BaseAdminAPIRepoController<User, long>
    {
        public UsersController(IUserRepository repository)
            : base(repository)
        {
        }
    }
}
