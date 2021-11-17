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
    public class QuestionsRepository : EntityRepository<DigitalHubLMSContext, Questions, long>
    {
        private readonly IRepository<Options, long> OptionsRepository;

        public QuestionsRepository(DigitalHubLMSContext context,
            ClaimsPrincipal claimsPrincipal,
            IRepository<Options, long> optionsRepository)
            : base(context, claimsPrincipal)
        {
            OptionsRepository = optionsRepository;
        }

        public override async Task<Questions> SaveAsync(Questions entity)
        {
            var options = entity.Copy().Options.ToList();
            entity.Options = null;
            await base.SaveAsync(entity);
            options = await SaveQuestionsOptions(options, entity.Id);
            entity.Options = options;
            return entity;
        }

        public override async Task<Questions> UpdateAsync(Questions entity)
        {
            var options = entity.Copy().Options.ToList();
            entity.Options = null;
            await base.UpdateAsync(entity);
            options = await SaveQuestionsOptions(options, entity.Id);
            entity.Options = options;
            return entity;
        }

        private async Task<List<Options>> SaveQuestionsOptions(List<Options> options, long questionId)
        {
            if (options != null)
            {
                var oldOptions = await _dbContext.Options.Where(e => e.QuestionId == questionId).Select(e => e.Id).ToListAsync();
                var optionsAdded = new List<long>();
                foreach (var option in options)
                {
                    option.QuestionId = questionId;
                    if (option.Id > 0)
                        await OptionsRepository.UpdateAsync(option);
                    else
                        await OptionsRepository.SaveAsync(option);
                    optionsAdded.Add(option.Id);
                }
                var toDeleteOptions = oldOptions.Except(optionsAdded);
                foreach (var oid in toDeleteOptions)
                {
                    await OptionsRepository.DeleteAsync(oid);
                }
            }
            return options;
        }
    }
}