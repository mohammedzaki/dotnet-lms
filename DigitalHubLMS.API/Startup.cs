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
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using MZCore.Helpers;
using Microsoft.Extensions.FileProviders;
using DigitalHubLMS.Core.Services.Contracts;
using DigitalHubLMS.Core.Services;
using DinkToPdf;
using DinkToPdf.Contracts;
using DigitalHubLMS.API.Utility;

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

            var useLettuceEncryptSSL = Configuration.GetValue("UseLettuceEncryptSSL", false);

            if (!_env.IsDevelopment())
            {
                if (useLettuceEncryptSSL)
                {
                    var directoryPath = Configuration.GetValue("LettuceEncrypt:PersistDataDirectory", Path.Combine(Directory.GetCurrentDirectory(), "storage/LettuceEncrypt"));
                    services
                        .AddLettuceEncrypt()
                        .PersistDataToDirectory(new DirectoryInfo(directoryPath), "MmR!#63^V5Fu7m!T");
                }
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
                .ConfigureApiBehaviorOptions(options =>
                {
                    options.InvalidModelStateResponseFactory = context =>
                    {
                        var problems = new APIBadRequestResponse(context);

                        return new BadRequestObjectResult(problems);
                    };
                })
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.Converters.Add(new StringEnumConverter());
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                    //options.SerializerSettings.DefaultValueHandling = DefaultValueHandling.Ignore;
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

                options.OperationFilter<SwaggerFileOperationFilter>();

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

            services.AddTransient(s => s.GetService<IHttpContextAccessor>().HttpContext.User);

            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<ICourseRepository, CourseRepository>();
            services.AddScoped<IAnnouncementRepository, AnnouncementRepository>();
            services.AddScoped<ICertificatesRepository, CertificateRepository>();
            services.AddScoped<ICourseClassRepository, CourseClassRepository>();
            services.AddScoped<IRepository<Quiz, long>, QuizRepository>();
            services.AddScoped<IRepository<Course, long>, CourseRepository>();
            services.AddScoped<IRepository<Group, long>, DepartmentRepository>();
            services.AddScoped<IRepository<Category, long>, CategoryRepository>();

            services.AddScoped<IRepository<Announcement, long>, EntityRepository<DigitalHubLMSContext, Announcement, long>>();
            services.AddScoped<IRepository<User, long>, EntityRepository<DigitalHubLMSContext, User, long>>();
            services.AddScoped<IRepository<Section, long>, EntityRepository<DigitalHubLMSContext, Section, long>>();
            services.AddScoped<IRepository<Questions, long>, EntityRepository<DigitalHubLMSContext, Questions, long>>();
            services.AddScoped<IRepository<Options, long>, EntityRepository<DigitalHubLMSContext, Options, long>>();
            services.AddScoped<IRepository<CourseClass, long>, EntityRepository<DigitalHubLMSContext, CourseClass, long>>();
            services.AddScoped<IRepository<Role, long>, EntityRepository<DigitalHubLMSContext, Role, long>>();
            services.AddScoped<IRepository<Document, long>, EntityRepository<DigitalHubLMSContext, Document, long>>();
            services.AddScoped<IRepository<Subtitle, long>, EntityRepository<DigitalHubLMSContext, Subtitle, long>>();
            services.AddScoped<IRepository<Certificate, long>, EntityRepository<DigitalHubLMSContext, Certificate, long>>();
            services.AddScoped<IRepository<Media, long>, EntityRepository<DigitalHubLMSContext, Media, long>>();
            services.AddScoped<IRepository<Image, long>, EntityRepository<DigitalHubLMSContext, Image, long>>();
            services.AddScoped<IRepository<SecurityQuestion, long>, EntityRepository<DigitalHubLMSContext, SecurityQuestion, long>>();
            services.AddScoped<IRepository<UserSecurityQuestion, long>, EntityRepository<DigitalHubLMSContext, UserSecurityQuestion, long>>();
            services.AddScoped<IRepository<UserInfo, long>, EntityRepository<DigitalHubLMSContext, UserInfo, long>>();
            services.AddScoped<IRepository<CourseEnrol, long>, EntityRepository<DigitalHubLMSContext, CourseEnrol, long>>();
            services.AddScoped<IRepository<ClassQuizAnswer, long>, EntityRepository<DigitalHubLMSContext, ClassQuizAnswer, long>>();
            services.AddScoped<IRepository<ClassUserMeta, long>, EntityRepository<DigitalHubLMSContext, ClassUserMeta, long>>();
            services.AddScoped<IRepository<ProfilePicture, long>, EntityRepository<DigitalHubLMSContext, ProfilePicture, long>>();
            services.AddScoped<IRepository<ClassQuiz, long>, EntityRepository<DigitalHubLMSContext, ClassQuiz, long>>();
            services.AddScoped<IRepository<ClassData, long>, EntityRepository<DigitalHubLMSContext, ClassData, long>>();
            services.AddScoped<IRepository<UserGroup, long>, EntityRepository<DigitalHubLMSContext, UserGroup, long>>();
            services.AddScoped<IRepository<ClassQuizTake, long>, EntityRepository<DigitalHubLMSContext, ClassQuizTake, long>>();
            services.AddScoped<IRepository<CourseCategory, long>, EntityRepository<DigitalHubLMSContext, CourseCategory, long>>();
            services.AddScoped<IRepository<CourseDepartment, long>, EntityRepository<DigitalHubLMSContext, CourseDepartment, long>>();
            services.AddScoped<IRepository<CourseData, long>, EntityRepository<DigitalHubLMSContext, CourseData, long>>();

            services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));
            services.AddScoped<ICertificateGenerator, CertificateGenerator>();
            services.AddScoped<IStorageService, StorageService>();
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

            app.UseCors(MyAllowSpecificOrigins);

            app.UseHttpsRedirection();

            app.UseAppStorage();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
