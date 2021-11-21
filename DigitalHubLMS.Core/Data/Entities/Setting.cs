using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Swashbuckle.AspNetCore.Annotations;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("settings")]
    public partial class Setting : BaseEntity
    {
        [Column("key")]
        [StringLength(255)]
        public string Key { get; set; }
        [Column("value")]
        public string Value { get; set; }
    }
}
