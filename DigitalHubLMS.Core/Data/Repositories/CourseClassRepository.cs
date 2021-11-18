using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Castle.DynamicProxy.Contributors;
using Castle.DynamicProxy.Generators.Emitters.SimpleAST;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;
using Serilog;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CourseClassRepository : EntityRepository<DigitalHubLMSContext, CourseClass, long>, ICourseClassRepository
    {
        protected readonly IRepository<Quiz, long> QuizRepository;
        protected readonly IRepository<ClassQuiz, long> ClassQuizRepository;
        protected readonly IRepository<ClassData, long> ClassDataQuizRepository;
        protected readonly IRepository<ClassQuizTake, long> ClassQuizTakeRepository;

        public CourseClassRepository(DigitalHubLMSContext context,
            ClaimsPrincipal claimsPrincipal,
            IRepository<Quiz, long> quizRepository,
            IRepository<ClassQuiz, long> classQuizRepository,
            IRepository<ClassData, long> classDataQuizRepository,
            IRepository<ClassQuizTake, long> classQuizTakeRepository)
            : base(context, claimsPrincipal)
        {
            QuizRepository = quizRepository;
            ClassQuizRepository = classQuizRepository;
            ClassDataQuizRepository = classDataQuizRepository;
            ClassQuizTakeRepository = classQuizTakeRepository;
        }

        public override async Task<CourseClass> SaveAsync(CourseClass entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(SaveAsync)} entity must not be null");
            }
            using var transaction = _dbContext.Database.BeginTransaction();
            entity.Id = GenerateNewID();
            await _dbContext.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            switch (entity.Type) {
                case "video":
                    entity.ClassData = entity.Data;
                    break;
                case "document":
                    entity.ClassData = entity.DocumentUrl;
                    break;
                case "text":
                    entity.ClassData = entity.Description;
                    break;
                case "url":
                    entity.ClassData = entity.url;
                    break;
                case "quiz":
                    var classQuiz = new ClassQuiz {
                        CourseClassId = entity.Id
                    };
                    if (entity.SelectedQuiz != "")
                    { 
                        classQuiz.QuizId = long.Parse(entity.SelectedQuiz);
                    }
                    else
                    {
                        var quiz = await QuizRepository.SaveAsync(new Quiz
                        {
                            Title = entity.NewQuiz
                        });
                        classQuiz.QuizId = quiz.Id;
                    }
                    entity.ClassData = classQuiz.QuizId.ToString();
                    classQuiz = await ClassQuizRepository.SaveAsync(classQuiz);
                    entity.Quiz = await QuizRepository.FindByIdAsync(classQuiz.QuizId);
                    break;
                default:
                    break;
            }
            await ClassDataQuizRepository.SaveAsync(new ClassData
            {
                CourseClassId = entity.Id,
                Data = entity.ClassData
            });
            await transaction.CommitAsync();
            return entity;
        }

        public override async Task<CourseClass> UpdateAsync(CourseClass entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(UpdateAsync)} entity must not be null");
            }
            using var transaction = _dbContext.Database.BeginTransaction();
            _dbContext.Update(entity);
            await _dbContext.SaveChangesAsync();
            switch (entity.Type)
            {
                case "video":
                    entity.ClassData = entity.Data;
                    break;
                case "document":
                    entity.ClassData = entity.DocumentUrl;
                    break;
                case "text":
                    entity.ClassData = entity.Description;
                    break;
                case "quiz":
                    var classQuiz = await _dbContext.ClassQuizzes.Where(e => e.CourseClassId == entity.Id).FirstOrDefaultAsync();
                    if (classQuiz == null)
                    {
                        classQuiz = new ClassQuiz
                        {
                            CourseClassId = entity.Id
                        };
                    }
                    if (entity.SelectedQuiz != "")
                    {
                        classQuiz.QuizId = long.Parse(entity.SelectedQuiz);
                    }
                    else
                    {
                        var quiz = await QuizRepository.SaveAsync(new Quiz
                        {
                            Title = entity.NewQuiz
                        });
                        classQuiz.QuizId = quiz.Id;
                    }
                    if (classQuiz.Id == 0)
                        classQuiz = await ClassQuizRepository.SaveAsync(classQuiz);
                    else
                        classQuiz = await ClassQuizRepository.UpdateAsync(classQuiz);

                    entity.ClassData = classQuiz.QuizId.ToString();
                    entity.Quiz = await QuizRepository.FindByIdAsync(classQuiz.QuizId);
                    break;
                default:
                    break;
            }
            var classData = await _dbContext.ClassData.Where(e => e.CourseClassId == entity.Id).FirstOrDefaultAsync();
            if (classData == null)
            {
                await ClassDataQuizRepository.SaveAsync(new ClassData
                {
                    CourseClassId = entity.Id,
                    Data = entity.ClassData
                });
            }
            else
            {
                classData.Data = entity.ClassData;
                await ClassDataQuizRepository.UpdateAsync(classData);
            }
            await transaction.CommitAsync();
            return entity;
        }

        public async Task<CourseClass> GetUserCourseClass(long userId, long courseClassId)
        {
            var courseClass = await _dbContext.CourseClasses
                .Include(e => e.ClassDatum)
                .Include(e => e.ClassQuizzes)
                .ThenInclude(e => e.Quiz)
                .ThenInclude(e => e.Questions)
                .ThenInclude(e => e.Options)
                .Where(e => e.Id == courseClassId)
                .FirstOrDefaultAsync();

            var isCompleted = await _dbContext.ClassUserMeta.Where(e => e.UserId == userId && e.CourseClassId == courseClassId).FirstOrDefaultAsync();

            if (isCompleted != null) {
                courseClass.Completed = isCompleted.Completed;
            } else
            {
                courseClass.Completed = 0;
            }
            courseClass.ClassData = courseClass.ClassDatum.FirstOrDefault()?.Data;
            if (courseClass.Type == "quiz") {
                var quiz = courseClass.ClassQuizzes.First().Quiz;

            var classQuizTake = await _dbContext.ClassQuizTakes
                    .Include(e => e.ClassQuizAnswers)
                    .Where(e => e.ClassQuizId == quiz.Id && e.UserId == userId).FirstOrDefaultAsync();
                if (classQuizTake != null) {
                    var classQuiz = courseClass.ClassQuizzes.First();
                    var newClassQuizTake = await ClassQuizTakeRepository.SaveAsync(new ClassQuizTake
                    {
                        //Id = newId,
                        ClassQuizId = classQuiz.Id,
                        Score = (short)(quiz.Questions.Count * 10),
                        UserId = userId,
                        Attempt = 0
                    });
                    courseClass.TakeId = newClassQuizTake.Id;
                    courseClass.Answers = newClassQuizTake.ClassQuizAnswers;
                }
                else
                {
                    courseClass.TakeId = classQuizTake.Id;
                    courseClass.Answers = classQuizTake.ClassQuizAnswers;
                }
            }
            return courseClass;
        }
    }
}