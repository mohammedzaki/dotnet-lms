using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
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
        private readonly IRepository<CourseCategory, long> CourseCategoryRepository;
        private readonly IRepository<CourseEnrol, long> CourseEnrolRepository;
        private readonly IRepository<CourseDepartment, long> CourseDepartmentRepository;
        private readonly IRepository<Group, long> DepartmentRepository;
        private readonly IRepository<CourseData, long> CourseDataRepository;

        public CourseRepository(DigitalHubLMSContext context,
            ClaimsPrincipal claimsPrincipal,
            IRepository<CourseCategory, long> courseCategoryRepository,
            IRepository<CourseEnrol, long> courseEnrolRepository,
            IRepository<CourseDepartment, long> courseDepartmentRepository,
            IRepository<Group, long> departmentRepository,
            IRepository<CourseData, long> courseDataRepository)
            : base(context, claimsPrincipal)
        {
            CourseCategoryRepository = courseCategoryRepository;
            CourseEnrolRepository = courseEnrolRepository;
            CourseDepartmentRepository = courseDepartmentRepository;
            DepartmentRepository = departmentRepository;
            CourseDataRepository = courseDataRepository;
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
                .Where(e => e.DeletedAt == null)
                .ToListAsync();
            list.ForEach(e =>
            {
                e.CourseData = e.CourseDatum.FirstOrDefault()?.Data;
                e.Categories = e.CourseCategories.Select(e => new Category { Id = e.Category.Id, Name = e.Category.Name }).ToList();
                e.Departments = e.CourseDepartments.Select(e => new Group { Id = e.Group.Id, Name = e.Group.Name, IsLdap = e.Group.IsLdap, IsActive = e.Group.IsActive }).ToList();
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
                .Include(e => e.CourseCategories)
                .ThenInclude(e => e.Category)
                .Include(e => e.CourseDepartments)
                .ThenInclude(e => e.Group)
                .Include(e => e.CourseEnrols)
                .Include(e => e.CourseDatum)
                .Include(e => e.Instructor)
                .ThenInclude(e => e.UserInfos)

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
            course.Categories = course.CourseCategories.Select(e => new Category { Id = e.Category.Id, Name = e.Category.Name }).ToList();
            course.Departments = course.CourseDepartments.Select(e => new Group { Id = e.Group.Id, Name = e.Group.Name, IsLdap = e.Group.IsLdap, IsActive = e.Group.IsActive }).ToList();
            course.Included = new List<User>();
            course.Excluded = new List<User>();

            course.Sections.ToList().ForEach(e =>
            {
                e.CourseClasses.ToList().ForEach(courseClass =>
                {
                    if (courseClass.Type == "quiz")
                    {
                        var quiz = courseClass.ClassQuizzes.FirstOrDefault();
                        if (quiz != null) {
                            courseClass.Quiz = quiz.Quiz;
                            courseClass.ClassData = courseClass.Quiz.Id.ToString();
                        }
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

        public override async Task<Course> SaveAsync(Course course)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            await base.SaveAsync(course);
            var res = await SaveCourseGroupsCategories(course);
            transaction.Commit();
            return res;
        }

        public override async Task<Course> UpdateAsync(Course course)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            var upcourse = course.Copy();
            upcourse.Excluded = null;
            upcourse.Included = null;
            upcourse.Categories = null;
            upcourse.Departments = null;
            await base.UpdateAsync(course);

            upcourse.Excluded = course.Excluded;
            upcourse.Included = course.Included;
            upcourse.Categories = course.Categories;
            upcourse.Departments = course.Departments;
            var res = await SaveCourseGroupsCategories(upcourse);
            transaction.Commit();
            return res;
        }

        private async Task<Course> SaveCourseGroupsCategories(Course course)
        {
            var allCourseGroups = await _dbContext.CourseDepartments.Where(e => e.CourseId == course.Id).Select(e => e.GroupId).ToListAsync();
            var allCourseCategories = await _dbContext.CourseCategories.Where(e => e.CourseId == course.Id).Select(e => e.CategoryId).ToListAsync();
            var groupAdded = new List<long>();
            var categoryAdded = new List<long>();
            var usersToInclud = new List<long>();
            var usersToExclud = new List<long>();
            foreach (var cat in course.Categories)
            {
                await CourseCategoryRepository.CreateOrUpdateAsync(
                    e => e.CategoryId == cat.Id && e.CourseId == course.Id,
                    new CourseCategory
                    {
                        CategoryId = cat.Id,
                        CourseId = course.Id
                    });
                categoryAdded.Add(cat.Id);
            }
            if (course.Included != null)
            {
                foreach (var user in course.Included)
                {
                    var entity = await _dbContext.CourseEnrols.Where(e => e.UserId == user.Id && e.CourseId == course.Id).FirstOrDefaultAsync();
                    if (entity == null)
                    {
                        usersToInclud.Add(user.Id);
                    }
                }
            }
            if (course.Excluded != null)
            {
                foreach (var user in course.Excluded)
                {
                    usersToExclud.Add(user.Id);
                }
            }
            foreach (var group in course.Departments)
            {
                await CourseDepartmentRepository.CreateOrUpdateAsync(
                    e => e.GroupId == group.Id && e.CourseId == course.Id,
                    new CourseDepartment
                    {
                        GroupId = group.Id,
                        CourseId = course.Id
                    });
                groupAdded.Add(group.Id);
                var groupData = await DepartmentRepository.FindByIdAsync(group.Id);
                foreach (var userGroup in groupData.UserGroups)
                {
                    var e = await _dbContext.CourseEnrols.Where(e => e.UserId == userGroup.UserId && e.CourseId == course.Id).FirstOrDefaultAsync();
                    if (e == null)
                    {
                        usersToInclud.Add(userGroup.UserId);
                    }
                }
            }
            var toDeleteCategories = allCourseCategories.Except(categoryAdded);
            foreach (var catId in toDeleteCategories)
            {
                var deleteCat = await _dbContext.CourseCategories.Where(e => e.CourseId == course.Id && e.CategoryId == catId).FirstOrDefaultAsync();
                _dbContext.CourseCategories.Remove(deleteCat);
                await _dbContext.SaveChangesAsync();
            }
            var toDeleteGroups = allCourseGroups.Except(groupAdded);
            foreach (var groupId in toDeleteGroups)
            {
                var groupData = await DepartmentRepository.FindByIdAsync(groupId);
                foreach (var userGroup in groupData.UserGroups)
                {
                    usersToExclud.Add(userGroup.UserId);
                }
                var deleteDept = await _dbContext.CourseDepartments.Where(e => e.CourseId == course.Id && e.GroupId == groupId).FirstOrDefaultAsync();
                _dbContext.CourseDepartments.Remove(deleteDept);
                await _dbContext.SaveChangesAsync();
            }
            foreach (var userId in usersToInclud)
            {
                await CourseEnrolRepository.SaveAsync(
                    new CourseEnrol
                    {
                        CourseId = course.Id,
                        UserId = userId,
                        Type = "course"
                    });
                //if ($changeClass->wasRecentlyCreated) {
                //    if ($u->email) {
                //        dispatch(new EnrolledEmailJob($u->email, $u, $course));
                //    }
                //}
            }
            foreach (var userId in usersToExclud)
            {
                var entity = await _dbContext.CourseEnrols.Where(e => e.UserId == userId && e.CourseId == course.Id).FirstOrDefaultAsync();
                if (entity != null)
                {
                    _dbContext.Remove(entity);
                    await _dbContext.SaveChangesAsync();
                }
            }
            if (!string.IsNullOrEmpty(course.CourseData))
            {
                await CourseDataRepository.CreateOrUpdateAsync(
                    e => e.CourseId == course.Id,
                    new CourseData
                    {
                        CourseId = course.Id,
                        Data = course.CourseData
                    });
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