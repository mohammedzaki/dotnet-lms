using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    [Route("admin/[controller]")]
    public class BaseAdminAPIRepoController<TRepository, TEntity, TKey> : BaseAPIController
        where TRepository : IRepository<TEntity, TKey>
        where TEntity : class, IEntity<TKey>, new()
        where TKey : struct,
          IComparable,
          IComparable<TKey>,
          IConvertible,
          IEquatable<TKey>,
          IFormattable
    {
        protected readonly TRepository _repository;

        public BaseAdminAPIRepoController(DigitalHubLMSContext context, TRepository repository)
            : base(context)
        {
            _repository = repository;
        }

        [HttpGet]
        public virtual async Task<ActionResult<List<TEntity>>> GetAll()
        {
            return await _repository.GetAll();
        }

        [HttpPost]
        public virtual async Task<ActionResult<TEntity>> CreateOrUpdate(TEntity entity)
        {
            //return await _repository.CreateAsync(user);

            return entity;
        }

        [HttpDelete("{id?}")]
        public virtual async Task<ActionResult<int>> Delete(TKey? id)
        {
            return await _repository.DeleteAsync(id);
        }
    }
}
