using System;
using System.Collections.Generic;
using System.Linq;
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
            IRepository<Options, long> optionsRepository)
            : base(context)
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

        private async Task<List<Options>> SaveQuestionsOptions(List<Options> options, long questionId)
        {
            if (options != null)
            {
                foreach (var option in options)
                {
                    option.QuestionId = questionId;
                    await OptionsRepository.SaveAsync(option);
                }
            }
            return options;
        }
    }
}