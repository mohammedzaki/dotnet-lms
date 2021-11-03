using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace MZCore.Patterns.Repositroy
{
    public class EntityRepository<TDbContext, TEntity, TKey> : IRepository<TEntity, TKey>
        where TDbContext : DbContext, new()
        where TEntity : class, IEntity<TKey>, new()
        where TKey : struct,
          IComparable,
          IComparable<TKey>,
          IConvertible,
          IEquatable<TKey>,
          IFormattable
    {
        public TDbContext _dbContext { get; set; }

        public EntityRepository(TDbContext context)
        {
            _dbContext = context;
        }

        public virtual async Task<List<TEntity>> GetAll()
        {
            return await _dbContext.Set<TEntity>().ToListAsync();
        }

        public virtual async Task<TEntity> FindByIdAsync(TKey id)
        {
            var entity = await _dbContext.Set<TEntity>().FindAsync(id);
            if (entity == null)
            {
                throw new KeyNotFoundException($"{typeof(TEntity).ShortDisplayName()} Not Found");
            }
            return entity;
        }

        public virtual async Task<TEntity> SaveAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(SaveAsync)} entity must not be null");
            }
            entity.Id = GenerateNewID();
            await _dbContext.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<TEntity> UpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(UpdateAsync)} entity must not be null");
            }
            _dbContext.Update(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<int> DeleteAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(DeleteAsync)} entity must not be null");
            }
            _dbContext.Remove(entity);
            return await _dbContext.SaveChangesAsync();
        }

        public virtual async Task<int> DeleteAsync(TKey id)
        {
            var entity = await FindByIdAsync(id);
            _dbContext.Remove(entity);
            return await _dbContext.SaveChangesAsync();
        }

        public virtual async Task<TEntity> CreateOrUpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(CreateOrUpdateAsync)} entity must not be null");
            }
            _dbContext.Update(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public TKey GenerateNewID()
        {
            dynamic maxId = GetMaxId();
            return (TKey)Convert.ChangeType((maxId + 1), typeof(TKey));
        }

        public TKey GetMaxId()
        {
            var dbSet = _dbContext.Set<TEntity>();
            var i = dbSet.OrderByDescending(e => e.Id).FirstOrDefault();
            if (i == null)
            {
                return (TKey)Convert.ChangeType(0, typeof(TKey));
            }
            return i.Id;
        }
    }
}
