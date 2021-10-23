using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Models;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers.Admin
{
    public class ReportController : BaseAdminAPIController<DigitalHubLMSContext>
    {
        public ReportController(DigitalHubLMSContext context)
            : base(context)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<List<ReportUser>>> Get()
        {
            var list = await _dbContext.Users
                .Include(e => e.CourseEnrols)
                .ThenInclude(e => e.Course)
                .SelectMany(e => e.CourseEnrols,
                        (user, enrol) => new ReportUser
                        {
                            employee = user.DisplayName,
                            progress = enrol.Progress,
                            course = enrol.Course.Title,
                            year = enrol.Course.CreatedAt.Value.Year,
                            month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(enrol.Course.CreatedAt.Value.Month)
                        }).ToListAsync();
            return list;
        }
    }
}
