using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("courses")]
    [Index(nameof(InstructorId), Name = "courses_instructor_id_foreign")]
    public partial class Course
    {
        public Course()
        {
            BundleCourses = new HashSet<BundleCourse>();
            Certificates = new HashSet<Certificate>();
            CourseCategories = new HashSet<CourseCategory>();
            CourseClasses = new HashSet<CourseClass>();
            CourseData = new HashSet<CourseDatum>();
            CourseDepartments = new HashSet<CourseDepartment>();
            CourseDocuments = new HashSet<CourseDocument>();
            CourseEnrols = new HashSet<CourseEnrol>();
            CourseImages = new HashSet<CourseImage>();
            CourseMedia = new HashSet<CourseMedium>();
            CourseMeta = new HashSet<CourseMetum>();
            Ratings = new HashSet<Rating>();
            Sections = new HashSet<Section>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Column("title")]
        [StringLength(255)]
        public string Title { get; set; }
        [Column("short_description")]
        public string ShortDescription { get; set; }
        [Column("description")]
        public string Description { get; set; }
        [Column("slug")]
        [StringLength(255)]
        public string Slug { get; set; }
        [Column("created_by")]
        public int? CreatedBy { get; set; }
        [Column("updated_by")]
        public int? UpdatedBy { get; set; }
        [Column("instructor_id")]
        public long InstructorId { get; set; }
        [Column("thumbnail")]
        [StringLength(255)]
        public string Thumbnail { get; set; }
        [Column("published")]
        public byte Published { get; set; }
        [Column("duration")]
        public int? Duration { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [ForeignKey(nameof(InstructorId))]
        [InverseProperty(nameof(User.Courses))]
        public virtual User Instructor { get; set; }
        [InverseProperty(nameof(BundleCourse.Course))]
        public virtual ICollection<BundleCourse> BundleCourses { get; set; }
        [InverseProperty(nameof(Certificate.Course))]
        public virtual ICollection<Certificate> Certificates { get; set; }
        [InverseProperty(nameof(CourseCategory.Course))]
        public virtual ICollection<CourseCategory> CourseCategories { get; set; }
        [InverseProperty(nameof(CourseClass.Course))]
        public virtual ICollection<CourseClass> CourseClasses { get; set; }
        [InverseProperty(nameof(CourseDatum.Course))]
        public virtual ICollection<CourseDatum> CourseData { get; set; }
        [InverseProperty(nameof(CourseDepartment.Course))]
        public virtual ICollection<CourseDepartment> CourseDepartments { get; set; }
        [InverseProperty(nameof(CourseDocument.Course))]
        public virtual ICollection<CourseDocument> CourseDocuments { get; set; }
        [InverseProperty(nameof(CourseEnrol.Course))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }
        [InverseProperty(nameof(CourseImage.Course))]
        public virtual ICollection<CourseImage> CourseImages { get; set; }
        [InverseProperty(nameof(CourseMedium.Course))]
        public virtual ICollection<CourseMedium> CourseMedia { get; set; }
        [InverseProperty(nameof(CourseMetum.Course))]
        public virtual ICollection<CourseMetum> CourseMeta { get; set; }
        [InverseProperty(nameof(Rating.Course))]
        public virtual ICollection<Rating> Ratings { get; set; }
        [InverseProperty(nameof(Section.Course))]
        public virtual ICollection<Section> Sections { get; set; }
    }
}
