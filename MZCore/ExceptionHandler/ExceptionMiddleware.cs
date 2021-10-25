using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace MZCore.ExceptionHandler
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;

        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
        {
            _logger = logger;
            _next = next;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Something went wrong: {ex}");
                await HandleExceptionAsync(httpContext, ex);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            var errorDetails = new ErrorDetails();
            errorDetails.Success = false;
            errorDetails.Message = exception?.Message;
            errorDetails.Status = "error";
            errorDetails.Error = exception?.Message;
            switch (exception)
            {
                case AppException e:
                    errorDetails.Errors = e.Errors;
                    context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    break;
                case DbUpdateConcurrencyException e:
                    context.Response.StatusCode = (int)HttpStatusCode.UnprocessableEntity;
                    break;
                case BadHttpRequestException e:
                    context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    break;
                case KeyNotFoundException e:
                    context.Response.StatusCode = (int)HttpStatusCode.NotFound;
                    break;
                default:
                    errorDetails.Exception = exception.ToString();
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    break;
            }
            errorDetails.StatusCode = context.Response.StatusCode;
            await context.Response.WriteAsync(errorDetails.ToString());
        }
    }
}
