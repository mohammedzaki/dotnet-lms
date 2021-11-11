using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MZCore.Patterns.Repositroy;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Data.Repositories.Contracts
{
    public interface ICourseRepository : IRepository<Course, long>
    {
        Task<List<CourseEnrol>> GetEnrolledCourses(long userId);

        Task<Course> GetUserCoursePage(long userId, string courseSlug);

        Task<CourseClass> GetNextCourseClass(long courseId, long classId);

        Task<Course> GetUserCourseTaking(long userId, string courseSlug);

        Task<List<CourseEnrol>> GetCourseTracking(long courseId);
    }
}
