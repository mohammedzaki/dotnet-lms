using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CategoryRepository : EntityRepository<DigitalHubLMSContext, Category, long>
    {
        public CategoryRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override async Task<List<Category>> GetAll()
        {
            try
            {
                var list = await _dbContext.Categories
                    .Include(e => e.CourseCategories)
                    .ToListAsync();
                list.ForEach(e => {
                    e.CoursesCount = e.CourseCategories.Count;
                    e.CourseCategories = null;
                });
                return list;
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }
    }
}