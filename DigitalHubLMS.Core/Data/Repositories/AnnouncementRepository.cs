using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class AnnouncementRepository : EntityRepository<DigitalHubLMSContext, AnnouncementUser, long>, IAnnouncementRepository
    {
        public AnnouncementRepository(DigitalHubLMSContext context,
            ClaimsPrincipal claimsPrincipal)
            : base(context, claimsPrincipal)
        {
        }

        public async Task<List<AnnouncementUser>> GetUserAnnouncements(long id)
        {
            var announcements = await _dbContext.AnnouncementUsers
                .Include(e => e.Announcement)
                .Where(e => e.UserId == id)
                .OrderByDescending(e => e.CreatedAt)
                .ToListAsync();
            announcements.ForEach(an =>
            {
                var annData = an.Announcement;
                an.Title = annData.Title;
                an.Message = annData.Message;
                an.Priority = annData.Priority;
                an.Announcement = null;
            });
            return announcements;
        }

        public async Task<bool> SetUserAnnouncementRead(long announcementId)
        {
            bool announcement = _dbContext.AnnouncementUsers.Any(a => a.AnnouncementId == announcementId && a.UserId == User.GetLoggedInUserId<long>());
            if (announcement == true)
            {
                var announcementU = _dbContext.AnnouncementUsers.Where(a => a.AnnouncementId == announcementId && a.UserId == User.GetLoggedInUserId<long>()).FirstOrDefault();
                announcementU.Read = 1;
                _dbContext.Update(announcementU);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            AnnouncementUser announcementUser = new AnnouncementUser();
            announcementUser.Id = GenerateNewID();
            announcementUser.CreatedAt = DateTime.Now;
            announcementUser.UpdatedAt = DateTime.Now;
            announcementUser.CreatedBy = User.GetLoggedInUserId<long>();
            announcementUser.UpdatedBy = User.GetLoggedInUserId<long>();
            announcementUser.UserId = User.GetLoggedInUserId<long>();
            announcementUser.AnnouncementId = announcementId;
            announcementUser.Read = 1;
            await _dbContext.AddAsync(announcementUser);
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> SetUserAnnouncement(AnnouncementUser announcementU)
        {
            bool announcement = _dbContext.AnnouncementUsers.Any(a => a.AnnouncementId == announcementU.AnnouncementId && a.UserId == announcementU.UserId);
            if (announcement == true)
            {
                return true;
            }
            announcementU.Id = GenerateNewID();
            announcementU.CreatedAt = DateTime.Now;
            announcementU.UpdatedAt = DateTime.Now;
            announcementU.CreatedBy = User.GetLoggedInUserId<long>();
            announcementU.UpdatedBy = User.GetLoggedInUserId<long>();
            announcementU.UserId = User.GetLoggedInUserId<long>();
            announcementU.Read = 0;
            await _dbContext.AddAsync(announcementU);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}