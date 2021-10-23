using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Entities
{
    public abstract class BaseEntity : IEntity<long>
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }
    }
}