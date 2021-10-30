using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Data.Repositories.Contracts
{
    public interface ICertificatesRepository : IRepository<Certificate, long>
    {
        Task<List<Certificate>> GetUserCertificates(long userId);
    }
}
