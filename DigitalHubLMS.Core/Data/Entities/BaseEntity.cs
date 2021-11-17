using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;

namespace DigitalHubLMS.Core.Data.Entities
{
    public abstract class BaseEntity : IEntity<long>
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }

        [Column("created_by")]
        [AllowNull]
        [JsonIgnore]
        public long? CreatedBy { get; set; }
        [Column("updated_by")]
        [AllowNull]
        [JsonIgnore]
        public long? UpdatedBy { get; set; }
        [Column("created_at")]
        [AllowNull]
        [JsonIgnore]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        [AllowNull]
        [JsonIgnore]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at")]
        [AllowNull]
        [JsonIgnore]
        public DateTime? DeletedAt { get; set; }

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