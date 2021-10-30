﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.Core.Data.Entities;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class QuizRepository : EntityRepository<DigitalHubLMSContext, Quiz, long>
    {
        public QuizRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override async Task<Quiz> FindByIdAsync(long id)
        {
            try
            {
                var quiz = await _dbContext.Quizzes
                    .Include(e => e.Questions)
                    .ThenInclude(e => e.Options)
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
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }
    }
}