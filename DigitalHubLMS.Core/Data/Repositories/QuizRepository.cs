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
    public class QuizRepository : EntityRepository<DigitalHubLMSContext, Quiz, long>
    {
        public QuizRepository(DigitalHubLMSContext context, ClaimsPrincipal claimsPrincipal)
            : base(context, claimsPrincipal)
        {
        }

        public override async Task<Quiz> FindByIdAsync(long id)
        {
            var quiz = await _dbContext.Quizzes
                .Include(e => e.Questions.OrderBy(e => e.Order))
                .ThenInclude(e => e.Options.OrderBy(e => e.Order))
                .Where(e => e.Id == id).FirstOrDefaultAsync();
            if (quiz != null)
            {
                return quiz;
            }
            else
            {
                throw new KeyNotFoundException($"quiz with id: {id} not exist!");
            }
        }
    }
}