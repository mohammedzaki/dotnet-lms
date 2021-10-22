using System;
using System.Text.Json;

namespace MZCore.ExceptionHandler
{
    public class ErrorDetails
    {
        public int StatusCode { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
        public string Exception { get; set; }
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
    }
}
