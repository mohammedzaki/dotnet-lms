using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class AnnouncementRepository : EntityRepository<DigitalHubLMSContext, Announcement, long>, IAnnouncementRepository
    {
        public AnnouncementRepository(DigitalHubLMSContext context)
            : base(context)
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
            var announcement  = await _dbContext.AnnouncementUsers.FindAsync(announcementId);
            if (announcement == null)
            {
                throw new KeyNotFoundException("Announcement not exists");
            }
            announcement.Read = 1;
            _dbContext.Update(announcement);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}