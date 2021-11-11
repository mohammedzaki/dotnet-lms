﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Castle.DynamicProxy.Generators.Emitters.SimpleAST;
using DigitalHubLMS.Core.Data.Entities;
using DigitalHubLMS.Core.Data.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MZCore.Patterns.Repositroy;

namespace DigitalHubLMS.Core.Data.Repositories
{
    public class CourseRepository : EntityRepository<DigitalHubLMSContext, Course, long>, ICourseRepository
    {
        public CourseRepository(DigitalHubLMSContext context)
            : base(context)
        {
        }

        public override async Task<List<Course>> GetAll()
        {
            var list = await _dbContext.Courses
                .Include(e => e.CourseCategories)
                .ThenInclude(e => e.Category)
                .Include(e => e.CourseDepartments)
                .ThenInclude(e => e.Group)
                .Include(e => e.CourseEnrols)
                .Include(e => e.CourseDatum)
                .ToListAsync();
            list.ForEach(e =>
            {
                e.CourseData = e.CourseDatum.FirstOrDefault()?.Data;
                e.Categories = e.CourseCategories.Select(e => new Category { Id = e.Category.Id, Name = e.Category.Name }).ToList();
                e.Departments = e.CourseDepartments.Select(e => new Group { Id = e.Group.Id, _Id = e.Group._Id, Name = e.Group.Name, IsLdap = e.Group.IsLdap, IsActive = e.Group.IsActive }).ToList();
                e.Studying = e.CourseEnrols.Count;
                e.CourseEnds = e.CreatedAt?.AddDays(e.Duration.GetValueOrDefault());
                e.CourseDatum = null;
                e.CourseCategories = null;
                e.CourseDepartments = null;
                e.CourseEnrols = null;
            });
            return list;
        }

        public override async Task<Course> FindByIdAsync(long id)
        {
            var course = await _dbContext.Courses

                .Include(e => e.Sections.OrderBy(e => e.Order))
                .ThenInclude(e => e.CourseClasses.OrderBy(e => e.Order))
                .ThenInclude(e => e.ClassQuizzes)
                .ThenInclude(e => e.Quiz)
                .ThenInclude(e => e.Questions)
                .ThenInclude(e => e.Options)

                .Include(e => e.Sections.OrderBy(e => e.Order))
                .ThenInclude(e => e.CourseClasses.OrderBy(e => e.Order))
                .ThenInclude(e => e.ClassMedia)
                .ThenInclude(e => e.Media)

                .Include(e => e.Sections.OrderBy(e => e.Order))
                .ThenInclude(e => e.CourseClasses.OrderBy(e => e.Order))
                .ThenInclude(e => e.ClassMeta)

                .Include(e => e.Sections.OrderBy(e => e.Order))
                .ThenInclude(e => e.CourseClasses.OrderBy(e => e.Order))
                .ThenInclude(e => e.ClassDatum)

                .Include(e => e.CourseMeta)
                .Where(e => e.Id == id)
                .FirstOrDefaultAsync();
            if (course == null)
            {
                throw new KeyNotFoundException($"{typeof(Course).ShortDisplayName()} Not Found");
            }
            course.Sections.ToList().ForEach(e =>
            {
                e.CourseClasses.ToList().ForEach(courseClass =>
                {
                    if (courseClass.Type == "quiz")
                    {
                        courseClass.Quiz = courseClass.ClassQuizzes.FirstOrDefault()?.Quiz;
                        courseClass.ClassData = courseClass.Quiz.Id.ToString();
                    }
                    else
                    {
                        courseClass.Media = courseClass.ClassMedia.Select(e => { return e.Media; }).ToList();
                        courseClass.ClassData = courseClass.ClassDatum.FirstOrDefault()?.Data;
                    }
                });
            });
            course.Meta = new Dictionary<string, string>();
            foreach (var m in course.CourseMeta)
            {
                course.Meta.Add(m.MetaKey, m.MetaValue);
            }
            return course;
        }

        public async Task<List<CourseEnrol>> GetEnrolledCourses(long userId)
        {
            var courseEnrols = await _dbContext.CourseEnrols
                .Include(e => e.Course)
                .ThenInclude(e => e.CourseMeta)
                .Where(e => e.UserId == userId && e.Type == "course").ToListAsync();
            courseEnrols.ForEach(en =>
            {
                var classes = _dbContext.CourseClasses
                .Where(e => e.CourseId == en.CourseId)
                .OrderBy(e => e.SectionId)
                .OrderBy(e => e.Order)
                .ToList();

                var quiz = 0;
                double duration = 0;
                foreach (var courseClass in classes)
                {
                    TimeSpan interval;
                    if (!TimeSpan.TryParseExact(courseClass.Duration, @"hh\:mm\:ss", null, out interval))
                    {
                        TimeSpan.TryParseExact(courseClass.Duration, @"mm\:ss", null, out interval);
                    }
                    duration += interval.TotalSeconds;
                    if (courseClass.Type == "quiz")
                    {
                        quiz += 1;
                    }
                }
                en.Lectures = classes.Count - quiz;
                en.Quizes = quiz;
                en.Duration = duration;
                en.Course.Meta = new Dictionary<string, string>();
                foreach (var m in en.Course.CourseMeta)
                {
                    en.Course.Meta.Add(m.MetaKey, m.MetaValue);
                }
            });
            return courseEnrols;
        }

        public async Task<List<CourseEnrol>> GetCourseTracking(long courseId)
        {
            var course = await _dbContext.Courses
                .Include(e => e.Sections)
                .ThenInclude(e => e.CourseClasses)
                .Include(e => e.CourseEnrols)
                .Include(e => e.CourseMeta)
                .Where(e => e.Id == courseId).FirstOrDefaultAsync();
            if (course == null)
            {
                throw new KeyNotFoundException($"{typeof(Course).ShortDisplayName()} Not Found");
            }
            var courseEnrols = course.CourseEnrols.ToList();
            var courseDuration = course.Duration;
            var date_now = DateTime.Now;
            var date_of_expiry = course.CreatedAt.Value.AddDays(course.Duration.Value);

            courseEnrols.ForEach(async enrolled =>
            {
                var userId = enrolled.UserId;
                var lastUpdate = enrolled.UpdatedAt;
                var diffLast = (lastUpdate - date_of_expiry).Value.TotalDays;
                enrolled.CourseEnds = date_of_expiry;
                enrolled.BehindDays = 0;
                if (enrolled.Progress != 100) {
                    enrolled.BehindDays = diffLast;
                }
                foreach (var section in course.Sections)
                {
                    foreach (var courseClass in section.CourseClasses)
                    {
                        var isCompleted = await _dbContext.ClassUserMeta.Where(e => e.UserId == userId && e.CourseClassId == courseClass.Id).FirstOrDefaultAsync();
                        if (isCompleted != null)
                        {
                            courseClass.Completed = isCompleted.Completed;
                        }
                        else
                        {
                            courseClass.Completed = 0;
                        }

                    }
                    enrolled.CourseProgress = course.Sections;
                }
            });
            return courseEnrols;
        }

        public async Task<Course> GetUserCoursePage(long userId, string courseSlug)
        {
            var course = await _dbContext.Courses
                .Include(e => e.Sections)
                .ThenInclude(e => e.CourseClasses)
                .Include(e => e.CourseCategories)
                .ThenInclude(e => e.Category)
                .Include(e => e.CourseMeta)
                .Include(e => e.Instructor)
                .ThenInclude(e => e.UserInfos)
                .Where(e => e.Slug == courseSlug).FirstOrDefaultAsync();
            if (course != null)
            {
                var enroll = await _dbContext.CourseEnrols.Where(e => e.Type == "course" && e.UserId == userId && e.CourseId == course.Id).FirstOrDefaultAsync();

                if (enroll != null)
                {
                    var insInfo = course.Instructor.UserInfos.FirstOrDefault();
                    course.Instructor.Title = insInfo?.Title;
                    course.Instructor.Description = insInfo?.Description;
                    var sections = course.Sections.ToList();
                    var classCount = 0;
                    sections.ForEach(s =>
                    {
                        classCount += s.CourseClasses.Count;
                    });
                    course.Categories = course.CourseCategories.Select(e => new Category { Id = e.Category.Id, Name = e.Category.Name }).ToList();
                    course.Progress = enroll.Progress;
                    course.ClassesCount = classCount;
                    var certificate = await _dbContext.Certificates.Where(e => e.UserId == userId && e.Status == true && e.CourseId == course.Id).FirstOrDefaultAsync();
                    if (certificate != null)
                    {
                        course.HasCertificate = true;
                        course.Certificate = certificate.Url;
                        course.CertificateSlug = certificate.Slug;
                        course.CertificateName = certificate.Name;
                    }
                    course.Meta = new Dictionary<string, string>();
                    foreach (var m in course.CourseMeta)
                    {
                        course.Meta.Add(m.MetaKey, m.MetaValue);
                    }
                    return course;
                }
            }
            throw new KeyNotFoundException("Not Found");
        }

        public async Task<CourseClass> GetNextCourseClass(long courseId, long classId)
        {
            var courseClass = await _dbContext.CourseClasses
                .Where(e => e.CourseId == courseId)
                .OrderBy(e => e.SectionId)
                .OrderBy(e => e.Order)
                .Where(e => e.Id > classId)
                .FirstOrDefaultAsync();
            return courseClass;
        }

        public async Task<Course> GetUserCourseTaking(long userId, string courseSlug)
        {
            var course = await _dbContext.Courses
                .Include(e => e.Sections)
                .ThenInclude(e => e.CourseClasses)
                .Include(e => e.CourseCategories)
                .ThenInclude(e => e.Category)
                .Include(e => e.CourseMeta)
                .Include(e => e.Instructor)
                .ThenInclude(e => e.UserInfos)
                .Where(e => e.Slug == courseSlug).FirstOrDefaultAsync();
            if (course != null)
            {
                var enroll = await _dbContext.CourseEnrols.Where(e => e.UserId == userId && e.CourseId == course.Id).FirstOrDefaultAsync();
                if (enroll != null)
                {
                    var insInfo = course.Instructor.UserInfos.FirstOrDefault();
                    course.Instructor.Title = insInfo?.Title;
                    course.Instructor.Description = insInfo?.Description;
                    var sections = course.Sections.ToList();
                    var classCount = 0;
                    sections.ForEach(section =>
                    {
                        var classes = section.CourseClasses.ToList();
                        classCount += classes.Count;
                        classes.ForEach(async courseClass =>
                        {
                            var isCompleted = await _dbContext.ClassUserMeta.Where(e => e.UserId == userId && e.CourseClassId == courseClass.Id).FirstOrDefaultAsync();
                            if (isCompleted != null)
                            {
                                courseClass.Completed = isCompleted.Completed;
                            }
                            else
                            {
                                courseClass.Completed = 0;
                            }
                        });
                    });
                    course.ClassesCount = classCount;
                    course.Meta = new Dictionary<string, string>();
                    foreach (var m in course.CourseMeta)
                    {
                        course.Meta.Add(m.MetaKey, m.MetaValue);
                    }
                    return course;
                }
            }
            throw new UnauthorizedAccessException("You Not Enrolled.");
        }
    }
}