using System;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using DigitalHubLMS.Core.Services.Contracts;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using MZCore.ExceptionHandler;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Services
{
    public class StorageService : IStorageService
    {
        private readonly IRepository<Document, long> DocumentRepository;
        private readonly IRepository<Image, long> ImageRepository;
        private readonly IRepository<Subtitle, long> SubtitleRepository;
        private readonly IRepository<Media, long> MediaRepository;
        private readonly IRepository<Certificate, long> CertificateRepository;
        private readonly IUserRepository UserRepository;
        private Random random = new Random();
        private readonly ClaimsPrincipal User;

        private string StorageDirectoryPath;

        public StorageService(
            IConfiguration Configuration,
            IUserRepository userRepository,
            IRepository<Document, long> documentRepository,
            IRepository<Image, long> imageRepository,
            IRepository<Subtitle, long> subtitleRepository,
            IRepository<Certificate, long> certificateRepository,
            IRepository<Media, long> mediaRepository,
            ClaimsPrincipal claimsPrincipal)
        {
            StorageDirectoryPath = Configuration.GetStoragePath();
            DocumentRepository = documentRepository;
            ImageRepository = imageRepository;
            MediaRepository = mediaRepository;
            SubtitleRepository = subtitleRepository;
            User = claimsPrincipal;
            UserRepository = userRepository;
            CertificateRepository = certificateRepository;
        }

        public string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public async Task<Document> SaveDocument(IFormFile file)
        {
            var folderName = Path.Combine("media");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (file.Length > 0)
            {
                var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
                var fileName = fileContent.FileName.Trim('"');
                var originalFileName = Path.GetFileNameWithoutExtension(fileName);
                var mime = file.ContentType;
                var size = file.Length.ToString();
                var file_ext = Path.GetExtension(fileName);
                var uuid = Guid.NewGuid().ToString();
                var UserId = User.GetLoggedInUserId<long>();
                var fileStoreName = uuid + file_ext;
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                var document = new Document
                {
                    Uid = uuid,
                    Name = originalFileName,
                    Size = size,
                    Url = urlPath,
                    FileKey = uuid,
                    Mime = mime,
                    Private = true,
                    UserId = UserId,
                    CreatedBy = UserId,
                    UpdatedBy = UserId,
                };
                return await DocumentRepository.SaveAsync(document);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload file");
            }
        }

        public async Task<Certificate> SaveCertificate(FileInfo certTempFile, long userId, long courseId)
        {
            var folderName = Path.Combine("certificates");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (certTempFile.Length > 0)
            {
                var uuid = Guid.NewGuid().ToString();
                var fileStoreName = uuid + ".pdf";
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                certTempFile.CopyTo(fullPath, true);
                certTempFile.Delete();
                var certificate = new Certificate
                {
                    Name = uuid,
                    Slug = RandomString(16),
                    UserId = userId,
                    CourseId = courseId,
                    Url = urlPath,
                    Status = true
                };
                return await CertificateRepository.SaveAsync(certificate);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload file");
            }
        }

        public async Task<Image> SaveImage(IFormFile file)
        {
            var folderName = Path.Combine("image");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (file.Length > 0)
            {
                var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
                var fileName = fileContent.FileName.Trim('"');
                var originalFileName = Path.GetFileNameWithoutExtension(fileName);
                var mime = file.ContentType;
                var size = file.Length.ToString();
                var file_ext = Path.GetExtension(fileName);
                var uuid = Guid.NewGuid().ToString();
                var UserId = User.GetLoggedInUserId<long>();
                var fileStoreName = uuid + file_ext;
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                var image = new Image
                {
                    Uid = uuid,
                    Name = originalFileName,
                    Size = size,
                    Url = urlPath,
                    FileKey = uuid,
                    Mime = mime,
                    Private = true,
                    UserId = UserId,
                    CreatedBy = UserId,
                    UpdatedBy = UserId,
                };
                return await ImageRepository.SaveAsync(image);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload file");
            }
        }

        public async Task<Media> SaveMedia(IFormFile file)
        {
            var folderName = Path.Combine("course/media");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (file.Length > 0)
            {
                var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
                var fileName = fileContent.FileName.Trim('"');
                var originalFileName = Path.GetFileNameWithoutExtension(fileName);
                var mime = file.ContentType;
                var size = file.Length.ToString();
                var file_ext = Path.GetExtension(fileName);
                var uuid = Guid.NewGuid().ToString();
                var duration = "";
                var quality = "";
                var UserId = User.GetLoggedInUserId<long>();
                var fileStoreName = uuid + file_ext;
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                var media = new Media
                {
                    Uid = uuid,
                    Name = originalFileName,
                    Size = size,
                    Url = urlPath,
                    FileKey = uuid,
                    Duration = duration,
                    Quality = quality,
                    Mime = mime,
                    Private = true,
                    UserId = UserId,
                    CreatedBy = UserId,
                    UpdatedBy = UserId,
                };
                return await MediaRepository.SaveAsync(media);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload file");
            }
        }

        public async Task<Subtitle> SaveSubtitle(IFormFile file)
        {
            var folderName = Path.Combine("subtitle");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (file.Length > 0)
            {
                var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
                var fileName = fileContent.FileName.Trim('"');
                var originalFileName = Path.GetFileNameWithoutExtension(fileName);
                var mime = file.ContentType;
                var file_ext = Path.GetExtension(fileName);
                var uuid = Guid.NewGuid().ToString();
                var UserId = User.GetLoggedInUserId<long>();
                var fileStoreName = uuid + file_ext;
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                var subtitle = new Subtitle
                {
                    Uid = uuid,
                    Name = originalFileName,
                    Url = urlPath,
                    Mime = mime,
                    UserId = UserId,
                    CreatedBy = UserId,
                    UpdatedBy = UserId,
                };
                return await SubtitleRepository.SaveAsync(subtitle);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload file");
            }
        }

        public async Task<ProfilePicture> SetUserProfilePicture(long userId, IFormFile file, string displayName = "")
        {
            var folderName = Path.Combine("profile");
            var pathToSave = Path.Combine(StorageDirectoryPath, folderName);
            if (!Directory.Exists(pathToSave))
                Directory.CreateDirectory(pathToSave);
            if (file.Length > 0)
            {
                var user = await UserRepository.FindByIdAsync(userId);
                var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
                var fileName = fileContent.FileName.Trim('"');
                if (string.IsNullOrEmpty(displayName))
                {
                    displayName = user.DisplayName;
                }
                var title = displayName + " profile";
                // var originalFileName = Path.GetFileNameWithoutExtension(fileName);
                var mime = file.ContentType;
                var file_ext = Path.GetExtension(fileName);
                var uuid = Guid.NewGuid().ToString();
                var fileStoreName = "U-" + uuid + file_ext;
                var fullPath = Path.Combine(pathToSave, fileStoreName);
                var urlPath = Path.Combine(folderName, fileStoreName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                var profilePicture = new ProfilePicture
                {
                    UserId = userId,
                    _Id = Guid.NewGuid().ToString(),
                    Title = title,
                    Mime = mime,
                    Url = urlPath,
                    FileKey = uuid,
                    CreatedBy = userId,
                    UpdatedBy = userId
                };
                return await UserRepository.SaveUserProfilePicture(user, profilePicture);
            }
            else
            {
                throw new BadHttpRequestException("Cannot upload profile picture");
            }
        }
    }
}
