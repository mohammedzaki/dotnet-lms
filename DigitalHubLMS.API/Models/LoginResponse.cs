using System;
using System.Text.Json.Serialization;
using DigitalHubLMS.Core.Data.Entities;
using Newtonsoft.Json;

namespace DigitalHubLMS.API.Models
{
    public class LoginResponse
    {
        //public string _id { get; set; }

        public string Token { get; set; }

        [JsonPropertyName("access_token")]
        [JsonProperty(PropertyName = "access_token")]
        public string AccessToken { get; set; }

        public User User { get; set; }
    }
}
