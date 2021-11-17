using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Ubiety.Dns.Core;

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
            errorDetails.Error = exception?.Message;
            switch (exception)
            {
                case AppException e:
                    errorDetails.Errors = e.Errors;
                    context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    foreach (var item in e.Errors)
                    {
                        errorDetails.Error += item.Value + "\n";
                    }
                    break;
                case DbUpdateConcurrencyException e:
                    context.Response.StatusCode = (int)HttpStatusCode.UnprocessableEntity;
                    break;
                case DbUpdateException e:
                    context.Response.StatusCode = (int)HttpStatusCode.UnprocessableEntity;
                    errorDetails.Error = e.InnerException.Message;
                    errorDetails.Message = "Error while saving data to database, please try again later!";
                    break;
                case BadHttpRequestException e:
                    context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    break;
                case KeyNotFoundException e:
                    context.Response.StatusCode = (int)HttpStatusCode.NotFound;
                    break;
                default:
                    errorDetails.Exception = exception.ToString();
                    errorDetails.Message = "Internal server error, please try again later!";
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    break;
            }
            errorDetails.StatusCode = context.Response.StatusCode;
            await context.Response.WriteAsJsonAsync(errorDetails);
        }
    }
}
