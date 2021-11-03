using System;
using System.IO;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Http;

namespace DigitalHubLMS.Core.Services.Contracts
{
    public interface IStorageService
    {
        public Task<Document> SaveDocument(IFormFile file);
        public Task<Image> SaveImage(IFormFile file);
        public Task<Media> SaveMedia(IFormFile file);
        public Task<Subtitle> SaveSubtitle(IFormFile file);
        public Task<ProfilePicture> SetUserProfilePicture(long userId, IFormFile file, string displayName = "");
        public Task<Certificate> SaveCertificate(FileInfo file, long userId, long courseId);
    }
}
