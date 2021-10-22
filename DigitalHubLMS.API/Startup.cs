using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using LettuceEncrypt;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json.Converters;
using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories;
using Swashbuckle.AspNetCore.Newtonsoft;
using MZCore.Helpers.SnakeCaseConverter;
using MZCore.ExceptionHandler;
using MZCore.SwaggerAuth;

namespace DigitalHubLMS.API
{
    public class Startup
    {
        readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            _env = env;
        }

        public IConfiguration Configuration { get; }

        private IWebHostEnvironment _env { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var mySqlConnectionString = Configuration.GetConnectionString("DefaultConnection");

            var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;
            
            var directoryPath = Configuration["LettuceEncrypt:PersistDataDirectory"];

            if (!_env.IsDevelopment())
            {
                services
                    .AddLettuceEncrypt()
                    .PersistDataToDirectory(new DirectoryInfo(directoryPath), "MmR!#63^V5Fu7m!T");
            }

            services.AddCors(options =>
            {
                options.AddPolicy(name: MyAllowSpecificOrigins,
                                    builder =>
                                    {
                                        builder.AllowAnyOrigin()
                                        .AllowAnyHeader().AllowAnyMethod();
                                    });
            });

            services
                .AddControllers()
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.Converters.Add(new StringEnumConverter());
                })
                .AddJsonOptions(x =>
                {
                    x.JsonSerializerOptions.PropertyNamingPolicy = new SnakeCaseNamingPolicy();
                });

            services.AddSwaggerGen(options =>
            {

                options.CustomSchemaIds(type => type.ToString().Replace("DigitalHubLMS.API.Models.", "").Replace("DigitalHubLMS.Core.Data.Entities.", ""));

                options.SwaggerDoc("v1", new OpenApiInfo { Title = "DigitalHubLMS.API", Version = "v1" });
            });

            services.AddSwaggerGenNewtonsoftSupport();

            services.AddDbContext<DigitalHubLMSContext>(options =>
                options
                .UseSqlServer(mySqlConnectionString)
            );

            services.AddDefaultIdentity<User>(options => {
                options.User.RequireUniqueEmail = true;
            })
            .AddRoles<Role>()
            .AddEntityFrameworkStores<DigitalHubLMSContext>();

            services.AddScoped<IUserRepository, UserRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            if (env.IsDevelopment() || env.IsStaging())
            {
                logger.LogInformation("In Development.");
                app.UseDeveloperExceptionPage();
            }

            app.UseMZCoreAPIExceptionMiddleware();

            app.UseSwaggerAuthorized();

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "DigitalHubLMS.API v1");
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors(MyAllowSpecificOrigins);

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
