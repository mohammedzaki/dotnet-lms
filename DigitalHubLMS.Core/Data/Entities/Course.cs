using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    [Table("courses")]
    [Index(nameof(InstructorId), Name = "courses_instructor_id_foreign")]
    public partial class Course : BaseEntity
    {
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
        [InverseProperty(nameof(Entities.Certificate.Course))]
        public virtual ICollection<Certificate> Certificates { get; set; }
        [InverseProperty(nameof(CourseCategory.Course))]
        public virtual ICollection<CourseCategory> CourseCategories { get; set; }


        [InverseProperty(nameof(Entities.CourseData.Course))]
        public virtual ICollection<CourseData> CourseDatum { get; set; }

        [InverseProperty(nameof(CourseDepartment.Course))]
        public virtual ICollection<CourseDepartment> CourseDepartments { get; set; }
        [InverseProperty(nameof(CourseDocument.Course))]
        public virtual ICollection<CourseDocument> CourseDocuments { get; set; }
        [InverseProperty(nameof(CourseEnrol.Course))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }
        [InverseProperty(nameof(CourseImage.Course))]
        public virtual ICollection<CourseImage> CourseImages { get; set; }
        [InverseProperty(nameof(Entities.CourseMedia.Course))]
        public virtual ICollection<CourseMedia> CourseMedia { get; set; }
        [InverseProperty(nameof(Entities.CourseMeta.Course))]
        public virtual ICollection<CourseMeta> CourseMeta { get; set; }
        [InverseProperty(nameof(Rating.Course))]
        public virtual ICollection<Rating> Ratings { get; set; }
        [InverseProperty(nameof(Section.Course))]
        public virtual ICollection<Section> Sections { get; set; }

        [NotMapped]
        public string CourseData { get; set; }
        [NotMapped]
        public virtual ICollection<Category> Categories { get; set; }
        [NotMapped]
        public virtual ICollection<Group> Departments { get; set; }
        [NotMapped]
        public int Studying { get; set; }
        [NotMapped]
        public DateTime? CourseEnds { get; set; }
        [NotMapped]
        public long? Progress { get; set; }
        [NotMapped]
        public int ClassesCount { get; set; }
        [NotMapped]
        public bool HasCertificate { get; set; }
        [NotMapped]
        public string Certificate { get; set; }
        [NotMapped]
        public string CertificateSlug { get; set; }
        [NotMapped]
        public string CertificateName { get; set; }

    }
}
