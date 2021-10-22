using System;
using System.Text.Json;

namespace MZCore.Helpers.SnakeCaseConverter
{
    public class SnakeCaseNamingPolicy : JsonNamingPolicy
    {
        public override string ConvertName(string name) => name.ToSnakeCase();
    }
}
