using System.ComponentModel.DataAnnotations;

namespace DigitalHubLMS.API.Models
{
    public class ForgetPasswordModel
    {
        [Required]
        public string email { get; set; }

    }
}