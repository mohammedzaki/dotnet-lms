using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace MZCore.Helpers.MySql
{
    public class MySqlSetColumnAttribute : ColumnAttribute
    {
        /// <summary>Gets the name of the column the property is mapped to.</summary>
        /// <returns>The name of the column the property is mapped to.</returns>
        public Type EnumType
        {
            get
            {
                return this.EnumType;
            }
            [param: DisallowNull]
            set
            {
                string s = string.Join("','", Enum.GetNames(value));
                this.TypeName = "set('"+s+"')";
            }
        }

        public MySqlSetColumnAttribute()
            : base()
        {
        }

        public MySqlSetColumnAttribute(string name)
            : base(name) {
        }
    }
}
