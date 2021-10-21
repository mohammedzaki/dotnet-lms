using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Newtonsoft.Json;

namespace MZCore.Helpers.MySql
{
    public static class MySqlExtensions
    {
        public static ValueConverter EnumConverter<T>() where T : Enum
        {
            return new ValueConverter<List<T>, string>(
                v => JsonConvert.SerializeObject(v.ConvertAll<string>(e => e.ToString())).Replace("[", "").Replace("]", "").Replace("]", "").Replace("\"", ""),
                v => JsonConvert.DeserializeObject<List<T>>("[\"" + v.Replace(",", "\",\"") + "\"]"));
        }

        public static ValueComparer EnumComparer<T>() where T : Enum
        {
            return new ValueComparer<List<T>>(
                        (c1, c2) => c1.SequenceEqual(c2),
                        c => c.Aggregate(0, (a, v) => HashCode.Combine(a, v.GetHashCode())),
                        c => c.ToList());
        }
    }
}
