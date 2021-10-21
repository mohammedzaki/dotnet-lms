using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public interface IRepository<TEntity> where TEntity : class, new()
    {
        Task<List<TEntity>> GetAll();

        Task<TEntity> FindByIdAsync(int? id);

        Task<TEntity> SaveAsync(TEntity entity);

        Task<TEntity> UpdateAsync(TEntity entity);

        Task<TEntity> DeleteAsync(TEntity entity);
    }
}
