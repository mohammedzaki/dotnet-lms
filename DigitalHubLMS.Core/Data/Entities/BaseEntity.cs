using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Entities
{
    public abstract class BaseEntity : IEntity<long>
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }

        protected ILazyLoader LazyLoader { get; set; }

        public BaseEntity()
        {
        }

        public BaseEntity(ILazyLoader lazyLoader)
        {
            LazyLoader = lazyLoader;
        }
    }
}