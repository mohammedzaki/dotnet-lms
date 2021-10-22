﻿using System;
using Microsoft.AspNetCore.Builder;

namespace MZCore.ExceptionHandler
{
    public static class ExceptionMiddlewareExtensions
    {
        public static void UseMZCoreAPIExceptionMiddleware(this IApplicationBuilder app)
        {
            app.UseMiddleware<ExceptionMiddleware>();
        }
    }
}
