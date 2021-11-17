using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CategoryRepository : EntityRepository<DigitalHubLMSContext, Category, long>
    {
        public CategoryRepository(DigitalHubLMSContext context,
            ClaimsPrincipal claimsPrincipal)
            : base(context, claimsPrincipal)
        {
        }

        public override async Task<List<Category>> GetAll()
        {
            var list = await _dbContext.Categories
                .Include(e => e.CourseCategories)
                .Where(e => e.DeletedAt == null)
                .ToListAsync();
            list.ForEach(e =>
            {
                e.CoursesCount = e.CourseCategories.Count;
                e.CourseCategories = null;
            });
            return list;
        }
    }
}