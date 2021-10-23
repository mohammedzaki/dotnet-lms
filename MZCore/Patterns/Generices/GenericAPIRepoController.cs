using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;

namespace MZCore.Patterns.Generices
{
    [ApiController]
    [Route("[controller]")]
    public abstract class GenericAPIRepoController<TRepository, TEntity, TKey> : ControllerBase
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

        public GenericAPIRepoController(TRepository repository)
        {
            _repository = repository;
        }

        // GET: [ControllerName]
        [HttpGet]
        public virtual async Task<ActionResult<List<TEntity>>> Get()
        {
            return await _repository.GetAll();
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public virtual async Task<ActionResult<TEntity>> Get(TKey id)
        {
            return await _repository.FindByIdAsync(id);
        }

        // PUT: [ControllerName]/:id

        /// <returns>successful updated entity</returns>
        /// <response code="201">Returns the updated item</response>
        /// <response code="400">If the item is null</response>    
        /// <response code="404">If the item is null</response>         
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public virtual async Task<ActionResult<TEntity>> Put(TKey id, TEntity entity)
        {
            return await _repository.UpdateAsync(entity);
        }

        // POST: [ControllerName]
        /// <returns>A newly created entity</returns>
        /// <response code="201">Returns the newly created item</response>
        /// <response code="400">If the item is null</response>            
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public virtual async Task<ActionResult<TEntity>> Post(TEntity entity)
        {
            return await _repository.SaveAsync(entity);
        }

        // DELETE: api/[ControllerName]/:id
        /// <summary>
        /// Deletes a specific entity.
        /// </summary>
        /// <param name="id"></param>  
        /// <returns>successful deleted entity</returns>
        /// <response code="200">entity has been deleted</response>
        /// <response code="404">If the item is null</response> 
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public virtual async Task<ActionResult<int>> Delete(TKey id)
        {
            return await _repository.DeleteAsync(id);
        }
    }
}
