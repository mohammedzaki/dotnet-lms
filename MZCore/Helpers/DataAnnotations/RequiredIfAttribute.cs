using System;
using System.ComponentModel.DataAnnotations;

namespace MZCore.Helpers.DataAnnotations
{
    [AttributeUsage(AttributeTargets.Property)]
    public class RequiredIfAttribute : RequiredAttribute
    {
        private string PropertyName { get; set; }

        private object CompareValue { get; set; }

        public RequiredIfAttribute(string propertyName, object compareValue)
        {
            PropertyName = propertyName;
            CompareValue = compareValue;
        }

        protected override ValidationResult IsValid(object value, ValidationContext context)
        {
            object instance = context.ObjectInstance;
            Type type = instance.GetType();

            var PropertyNameValue = type.GetProperty(PropertyName).GetValue(instance)?.ToString();

            var valid = PropertyNameValue.Equals(CompareValue);

            if (valid && string.IsNullOrWhiteSpace(value?.ToString()))
            {
                ErrorMessage = $"{context.DisplayName} is required when {PropertyName} is set to {PropertyNameValue}";
                return new ValidationResult(ErrorMessage);
            }

            return ValidationResult.Success;
        }
    }
}
