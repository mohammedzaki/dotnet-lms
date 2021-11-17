using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace MZCore.Patterns.Repositroy
{
    public interface IEntity<TKey> where TKey : struct,
          IComparable,
          IComparable<TKey>,
          IConvertible,
          IEquatable<TKey>,
          IFormattable
    {
        [Key]
        [Column("id")]
        public TKey Id { get; set; }

        [Column("created_by")]
        [AllowNull]
        public long? CreatedBy { get; set; }

        [Column("updated_by")]
        [AllowNull]
        public long? UpdatedBy { get; set; }

        [Column("created_at")]
        [AllowNull]
        public DateTime? CreatedAt { get; set; }

        [Column("updated_at")]
        [AllowNull]
        public DateTime? UpdatedAt { get; set; }

        [Column("deleted_at")]
        [AllowNull]
        public DateTime? DeletedAt { get; set; }
    }
}
