using System;
using System.ComponentModel.DataAnnotations;

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
        public TKey Id { get; set; }
    }
}
