using System;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Services.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MZCore.ExceptionHandler;
using MZCore.Helpers.FileAnnotations;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class UploadController : BaseAdminAPIController<DigitalHubLMSContext>
    {
        protected readonly IStorageService StorageService;

        public UploadController(DigitalHubLMSContext context, IStorageService storageService)
            : base(context)
        {
            StorageService = storageService;
        }

        [HttpPost("document")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<Document>> UploadCourseDocument(
            [Required]
            [MaxFileSize(20 * 1024 * 1024)]
            [AllowedTypes(new string[] {
                "application/pdf",
                "text/html",
                "text/plain",
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                "application/vnd.openxmlformats-officedocument.presentationml.presentation",
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                "application/CDFV2"
            })]
            [FromForm] IFormFile file) => await StorageService.SaveDocument(file);

        [HttpPost("image")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<Image>> UploadImage(
            [Required]
            [MaxFileSize(5 * 1024 * 1024)]
            [FromForm] IFormFile file) => await StorageService.SaveImage(file);

        [HttpPost("media")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<Media>> UploadMedia(
            [Required]
            [AllowedTypes(new string[] { "video/mp4", "video/mpeg", "video/x-m4v", "video/x-matroska" })]
            [FromForm] IFormFile file) => await StorageService.SaveMedia(file);

        [HttpPost("subtitle")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<Subtitle>> UploadSubtitle(
            [Required]
            [AllowedTypes(new string[] { "text/plain" })]
            [MaxFileSize(5 * 1024 * 1024)]
            [FromForm] IFormFile file) => await StorageService.SaveSubtitle(file);

    }
}
