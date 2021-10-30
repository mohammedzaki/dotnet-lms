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
using Serilog;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CourseClassRepository : EntityRepository<DigitalHubLMSContext, CourseClass, long>, ICourseClassRepository
    {
        public CourseClassRepository(DigitalHubLMSContext context)
            : base(context)
        {
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
                    //        $classQuizMatch = ['quiz_id' => $quiz->id, 'course_class_id' => $courseClassId];
                    //        $classQuiz      = ClassQuiz::where($classQuizMatch)->first();
                    var classQuiz = courseClass.ClassQuizzes.First();
                    var newClassQuizTake = new ClassQuizTake {
                        ClassQuizId = classQuiz.Id,
                        //Score = quiz.Questions.Count * 10,
                        UserId = userId,
                        Attempt = 0
                    };
                    _dbContext.ClassQuizTakes.Add(newClassQuizTake);
                    await _dbContext.SaveChangesAsync();
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