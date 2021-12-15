using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using DigitalHubLMS.API.Utility;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Services.Contracts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MZCore.Helpers;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.API.Controllers
{
    public class ClassController : BaseAPIRepoController<IRepository<CourseClass, long>>
    {
        protected readonly DigitalHubLMSContext _dbContext;
        protected readonly IRepository<CourseEnrol, long> CourseEnrolRepository;
        protected readonly IRepository<ClassQuizAnswer, long> ClassQuizAnswerRepository;
        protected readonly IRepository<ClassUserMeta, long> ClassUserMetaRepository;
        protected readonly IStorageService StorageService;
        protected readonly ICertificateGenerator CertificateGenerator;

        public ClassController(
            IRepository<CourseClass, long> repository,
            IRepository<CourseEnrol, long> courseEnrolRepository,
            IRepository<ClassQuizAnswer, long> classQuizAnswerRepository,
            IRepository<ClassUserMeta, long> classUserMetaRepository,
            IStorageService storageService,
            ICertificateGenerator certificateGenerator,
            DigitalHubLMSContext context)
            : base(repository)
        {
            _dbContext = context;
            CourseEnrolRepository = courseEnrolRepository;
            ClassQuizAnswerRepository = classQuizAnswerRepository;
            ClassUserMetaRepository = classUserMetaRepository;
            StorageService = storageService;
            CertificateGenerator = certificateGenerator;
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("change")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<CourseEnrol>> Change([Required] long current_class, [Required] long course_id)
        {
            var userId = User.GetLoggedInUserId<long>();
            var changeClass = await _dbContext.CourseEnrols
                .Where(e => e.CourseId == course_id && e.UserId == userId).FirstOrDefaultAsync();
            if (changeClass == null)
            {
                changeClass = new CourseEnrol();
                changeClass.CourseId = course_id;
                changeClass.UserId = userId;
                changeClass.CurrentClass = current_class;
                changeClass = await CourseEnrolRepository.SaveAsync(changeClass);
            }
            else
            {
                changeClass.CurrentClass = current_class;
                changeClass = await CourseEnrolRepository.UpdateAsync(changeClass);
            }
            return Created(nameof(Change), changeClass);
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("answer")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassQuizAnswer>> Answer([Required] long class_quiz_take_id, [Required] long question_id, [Required] long option_id, byte? score, byte? attempt)
        {
            var classQuizAnswer = await _dbContext.ClassQuizAnswers.Where(e => e.ClassQuizTakeId == class_quiz_take_id && e.QuestionId == question_id && e.OptionId == option_id).FirstOrDefaultAsync();
            if (classQuizAnswer == null)
            {
                classQuizAnswer = new ClassQuizAnswer
                {
                    ClassQuizTakeId = class_quiz_take_id,
                    QuestionId = question_id,
                    OptionId = option_id,
                    Score = score.Value,
                    Attempt = attempt.Value
                };
                classQuizAnswer = await ClassQuizAnswerRepository.SaveAsync(classQuizAnswer);
            }
            else
            {
                classQuizAnswer.Score = score.Value;
                classQuizAnswer.Attempt = attempt.Value;
                classQuizAnswer = await ClassQuizAnswerRepository.UpdateAsync(classQuizAnswer);
            }
            return Created(nameof(Answer), classQuizAnswer);
        }

        // GET: [ControllerName]/:id
        /// <returns>successful deleted entity</returns>
        /// <response code="200">Returns entity data</response>
        /// <response code="404">If the item is null</response> 
        [HttpPost("markComplete")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public virtual async Task<ActionResult<ClassUserMeta>> MarkComplete([Required] int meta_value, [Required] long course_class_id, [Required] long course_id)
        {
            var userId = User.GetLoggedInUserId<long>();
            var classUserMeta = await _dbContext.ClassUserMeta.Where(e => e.CourseClassId == course_class_id && e.UserId == userId).FirstOrDefaultAsync();
            if (classUserMeta == null)
            {
                classUserMeta = new ClassUserMeta
                {
                    CourseClassId = course_class_id,
                    UserId = userId,
                    Completed = meta_value
                };
                classUserMeta = await ClassUserMetaRepository.SaveAsync(classUserMeta);
            }
            else
            {
                classUserMeta.Completed = meta_value;
                classUserMeta = await ClassUserMetaRepository.UpdateAsync(classUserMeta);
            }
            await UpdateProgressAsync(course_id, userId);
            return Created(nameof(MarkComplete), classUserMeta);
        }

        private async Task UpdateProgressAsync(long course_id, long user_id)
        {
            var classes = await _dbContext.CourseClasses
                .Where(e => e.CourseId == course_id)
                .OrderBy(e => e.SectionId)
                .OrderBy(e => e.Order)
                .ToListAsync();
            var done = 0;
            classes.ForEach(async courseClass =>
            {
                var isCompleted = _dbContext.ClassUserMeta.Where(e => e.UserId == user_id && e.CourseClassId == courseClass.Id).FirstOrDefault();
                if (isCompleted?.Completed == 1)
                {
                    done++;
                }
            });
            var progress = (done / classes.Count) * 100;
            var changeClass = await _dbContext.CourseEnrols
                .Where(e => e.CourseId == course_id && e.UserId == user_id).FirstOrDefaultAsync();
            if (changeClass == null)
            {
                changeClass = new CourseEnrol();
                changeClass.CourseId = course_id;
                changeClass.UserId = user_id;
                changeClass.Progress = progress;
                changeClass = await CourseEnrolRepository.SaveAsync(changeClass);
            }
            else
            {
                changeClass.Progress = progress;
                changeClass = await CourseEnrolRepository.UpdateAsync(changeClass);
            }
            var certificate = await _dbContext.Certificates
                .Where(e => e.CourseId == course_id && e.UserId == user_id).FirstOrDefaultAsync();
            if (progress == 100 && certificate == null) {
                var user = await _dbContext.Users.FindAsync(user_id);
                var course = await _dbContext.Courses.FindAsync(course_id);
                await GenerateCertificateAsync(user.DisplayName, course.Title, user_id, course_id);
            }
        }

        private async Task GenerateCertificateAsync(string userDisplayName, string courseTitle, long userId, long courseId)
        {
            var file = await CertificateGenerator.GeneratePDF(userDisplayName, courseTitle);
            await StorageService.SaveCertificate(file, userId, courseId);
        }
    }
}
