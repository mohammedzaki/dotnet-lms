using System;
using System.ComponentModel.DataAnnotations;

namespace DigitalHubLMS.Core.Data.Entities
{
    /// <summary>
    /// Represents the base class for entities
    /// </summary>
    public abstract partial class BaseEntity
    {
        /// <summary>
        /// Gets or sets the entity identifier
        /// </summary>
        [Key]
        public int ID { get; set; }
    }
}
