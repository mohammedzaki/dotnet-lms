using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Helpers;

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
        protected readonly ClaimsPrincipal User;

        public TDbContext _dbContext { get; set; }

        public EntityRepository(TDbContext context)
        {
            _dbContext = context;
        }

        public EntityRepository(TDbContext context, ClaimsPrincipal claimsPrincipal)
        {
            _dbContext = context;
            User = claimsPrincipal;
        }

        public virtual async Task<List<TEntity>> GetAll()
        {
            return await _dbContext.Set<TEntity>().Where(e => e.DeletedAt == null).ToListAsync();
        }

        public virtual async Task<bool> CheckIdIsExistsAsync(TKey id)
        {
            return await _dbContext.Set<TEntity>().AnyAsync(e => e.Id.Equals(id));
        }

        public virtual async Task<TEntity> FindByIdAsync(TKey id)
        {
            var entity = await _dbContext.Set<TEntity>().FindAsync(id);
            if (entity == null)
            {
                throw new KeyNotFoundException($"{typeof(TEntity).ShortDisplayName()} with id {id} Not Found");
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
            entity.CreatedAt = DateTime.Now;
            entity.UpdatedAt = DateTime.Now;
            entity.CreatedBy = User.GetLoggedInUserId<long>();
            entity.UpdatedBy = User.GetLoggedInUserId<long>();
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
            entity.UpdatedAt = DateTime.Now;
            entity.UpdatedBy = User.GetLoggedInUserId<long>();
            _dbContext.Update(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<TEntity> CreateOrUpdateAsync(Expression<Func<TEntity, bool>> predicate, TEntity entity)
        {
            var exists = await _dbContext.Set<TEntity>().Where(predicate).FirstOrDefaultAsync();

            if (exists != null)
            {
                return await UpdateAsync(exists);
            }
            else
            {
                return await SaveAsync(entity);
            }
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
            try
            {
                var entity = await FindByIdAsync(id);
                _dbContext.Remove(entity);
                return await _dbContext.SaveChangesAsync();
            }
            catch
            {
                return await SoftDeleteAsync(id);
            }
        }

        public virtual async Task<int> SoftDeleteAsync(TKey id)
        {
            var entity = await FindByIdAsync(id);
            entity.DeletedAt = DateTime.Now;
            _dbContext.Update(entity);
            return await _dbContext.SaveChangesAsync();
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
