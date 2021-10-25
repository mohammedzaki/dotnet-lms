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
using MZCore.ExceptionHandler;
using MZCore.SwaggerAuth;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using MZCore.Patterns.Repositroy;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

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
                .AddRouting(options => options.LowercaseUrls = true)
                .AddControllers()
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.Converters.Add(new StringEnumConverter());
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    // options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                    // options.SerializerSettings.DefaultValueHandling = DefaultValueHandling.Ignore;
                    options.SerializerSettings.ContractResolver = new DefaultContractResolver
                    {
                        NamingStrategy = new SnakeCaseNamingStrategy()
                    };
                });

            // Adding Authentication  
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            // Adding Jwt Bearer  
            .AddJwtBearer(options =>
            {
                options.SaveToken = true;
                options.RequireHttpsMetadata = false;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidAudience = Configuration["JWT:ValidAudience"],
                    ValidIssuer = Configuration["JWT:ValidIssuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:Secret"]))
                };
            });

            services.AddSwaggerGen(options =>
            {
                options.CustomSchemaIds(type => type.ToString().Replace("DigitalHubLMS.API.Models.", "").Replace("DigitalHubLMS.Core.Data.Entities.", ""));

                options.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "Digital-Hub LMS APIs",
                    Description = "Digital-Hub LMS APIs"
                });

                // To Enable authorization using Swagger (JWT)    
                options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "Enter 'Bearer' [space] and then your valid token in the text input below.\r\n\r\nExample: \"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9\"",
                });
                options.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            }
                        },
                        Array.Empty<string>()
                    }
                });
            });

            services.AddSwaggerGenNewtonsoftSupport();

            services.AddDbContext<DigitalHubLMSContext>(options =>
                options
                .UseSqlServer(mySqlConnectionString)
            );

            services.AddDefaultIdentity<User>(options =>
            {
                options.User.RequireUniqueEmail = true;
                //options.Password.RequireDigit = false;
                //options.Password.RequiredLength = 6;
                options.Password.RequireNonAlphanumeric = false;
                //options.Password.RequireUppercase = false;
                //options.Password.RequireLowercase = false;
            })
            .AddRoles<Role>()
            .AddEntityFrameworkStores<DigitalHubLMSContext>();

            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IRepository<Announcement, long>, EntityRepository<DigitalHubLMSContext, Announcement, long>>();
            services.AddScoped<IRepository<Course, long>, CourseRepository>();
            services.AddScoped<IRepository<Group, long>, EntityRepository<DigitalHubLMSContext, Group, long>>();
            services.AddScoped<IRepository<Category, long>, EntityRepository<DigitalHubLMSContext, Category, long>>();
            services.AddScoped<IRepository<User, long>, EntityRepository<DigitalHubLMSContext, User, long>>();
            services.AddScoped<IRepository<Quiz, long>, QuizRepository>();
            services.AddScoped<IRepository<Section, long>, EntityRepository<DigitalHubLMSContext, Section, long>>();
            services.AddScoped<IRepository<Questions, long>, EntityRepository<DigitalHubLMSContext, Questions, long>>();
            services.AddScoped<IRepository<Options, long>, EntityRepository<DigitalHubLMSContext, Options, long>>();
            services.AddScoped<IRepository<CourseClass, long>, EntityRepository<DigitalHubLMSContext, CourseClass, long>>();
            services.AddScoped<IRepository<Role, long>, EntityRepository<DigitalHubLMSContext, Role, long>>();
            services.AddScoped<IRepository<Document, long>, EntityRepository<DigitalHubLMSContext, Document, long>>();
            services.AddScoped<IRepository<Subtitle, long>, EntityRepository<DigitalHubLMSContext, Subtitle, long>>();
            services.AddScoped<IRepository<Certificate, long>, EntityRepository<DigitalHubLMSContext, Certificate, long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
            // services.AddScoped<IRepository<, long>, EntityRepository<DigitalHubLMSContext, , long>>();
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

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
