using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

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
    }
}
