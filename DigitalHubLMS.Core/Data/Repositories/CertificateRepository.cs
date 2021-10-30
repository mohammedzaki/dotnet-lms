using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Castle.DynamicProxy.Generators.Emitters.SimpleAST;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CertificateRepository : EntityRepository<DigitalHubLMSContext, Certificate, long>, ICertificatesRepository
    {
        public CertificateRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override async Task<List<Certificate>> GetAll()
        {
            var list = await _dbContext.Certificates
                .Include(e => e.User)
                .Include(e => e.Course)
                .ToListAsync();
            list.ForEach(e =>
            {
                e.Username = e.User.DisplayName;
                e.Coursename = e.Course.Title;
                e.User = null;
                e.Course = null;
            });
            return list;
        }

        public async Task<List<Certificate>> GetUserCertificates(long userId)
        {
            var certificates = await _dbContext.Certificates
                .Include(e => e.Course)
                .Where(e => e.UserId == userId && e.Status == 1).ToListAsync();
            certificates.ForEach(cert =>
            {
                cert.Title = cert.Course.Title;
                cert.Description = cert.Course.Description;
                cert.Thumbnail = cert.Course.Thumbnail;
            });
            return certificates;
        }
    }
}