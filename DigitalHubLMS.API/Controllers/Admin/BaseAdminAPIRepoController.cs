using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Generices;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    [Authorize]
    [Route("admin/[controller]")]
    public class BaseAdminAPIRepoController<TEntity, TKey> : GenericAPIRepoController<IRepository<TEntity, TKey>, TEntity, TKey>
        where TEntity : class, IEntity<TKey>, new()
        where TKey : struct,
          IComparable,
          IComparable<TKey>,
          IConvertible,
          IEquatable<TKey>,
          IFormattable
    {
        public BaseAdminAPIRepoController(IRepository<TEntity, TKey> repository)
            : base(repository)
        {
        }
    }
}
