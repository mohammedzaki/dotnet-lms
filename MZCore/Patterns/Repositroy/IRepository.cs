using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace MZCore.Patterns.Repositroy
{
    public interface IRepository<TEntity, TKey>
        where TKey : struct,
          IComparable,
          IComparable<TKey>,
          IConvertible,
          IEquatable<TKey>,
          IFormattable
        where TEntity : class, IEntity<TKey>, new()
    {
        Task<List<TEntity>> GetAll();

        Task<TEntity> FindByIdAsync(TKey id);

        Task<TEntity> SaveAsync(TEntity entity);

        Task<TEntity> UpdateAsync(TEntity entity);

        Task<int> DeleteAsync(TEntity entity);

        Task<int> DeleteAsync(TKey id);

        Task<TEntity> CreateOrUpdateAsync(TEntity entity);
    }
}
