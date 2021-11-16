using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.JsonPatch.Operations;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;

namespace MZCore.Helpers
{
    public static class JsonPatchDocumentExtension
    {
        public static JsonPatchDocument<T> From<T>(T t) where T : class
        {
            var json = JObject.FromObject(t,
                new JsonSerializer()
                {
                    ContractResolver = new CamelCasePropertyNamesContractResolver(),
                    NullValueHandling = NullValueHandling.Ignore,
                    DefaultValueHandling = DefaultValueHandling.Ignore
                });

            var objProps = json.Properties().Select(p => p as JProperty);

            var properties = new Stack<JProperty>(objProps);
            var operations = new List<Operation<T>>();

            JProperty prop = null;

            while (properties.Count > 0)
            {
                prop = properties.Pop();
                operations.Add(
                    new Operation<T>()
                    {
                        path = $"/{prop.Path.Replace(".", "/")}",
                        value = prop.Value,
                        op = "replace"
                    });
            }

            return new JsonPatchDocument<T>(operations, new CamelCasePropertyNamesContractResolver());
        }
    }
}
