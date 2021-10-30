using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace MZCore.ExceptionHandler
{
    public class ErrorDetails
    {
        public int StatusCode { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
        public string Exception { get; set; }
        public Dictionary<string, string> Errors { get; set; }
    }
}
