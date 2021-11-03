using System;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace MZCore.Helpers.FileAnnotations
{
    public class AllowedTypesAttribute : ValidationAttribute
    {
        private readonly string[] _mimeTypes;
        public AllowedTypesAttribute(string[] types)
        {
            _mimeTypes = types;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var file = value as IFormFile;
            if (file != null)
            {
                var mimeType = file.ContentType;

                if (!_mimeTypes.Contains(mimeType.ToLower()))
                {
                    return new ValidationResult(GetErrorMessage(mimeType));
                }
            }
            return ValidationResult.Success;
        }

        public string GetErrorMessage(string mimeType)
        {
            return $"This media type {mimeType} is not allowed! The allowed files is {string.Join(",", _mimeTypes)}";
        }
    }
}
