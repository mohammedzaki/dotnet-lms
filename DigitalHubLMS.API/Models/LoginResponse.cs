using System;
using DigitalHubLMS.Core.Data.Entities;

namespace DigitalHubLMS.API.Models
{
    public class LoginResponse
    {
        public string _id { get; set; }
        public string token { get; set; }
        public User user { get; set; }
    }
}
