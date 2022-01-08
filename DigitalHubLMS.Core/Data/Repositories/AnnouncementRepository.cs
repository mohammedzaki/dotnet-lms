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
    public class AnnouncementRepository : EntityRepository<DigitalHubLMSContext, Announcement, long>, IAnnouncementRepository
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
            AnnouncementUser announcementUser = new AnnouncementUser();
            announcementUser.UserId = User.GetLoggedInUserId<long>();
            announcementUser.AnnouncementId = announcementId;
            announcementUser.Read = 1;
            await _dbContext.AddAsync(announcementUser);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}