﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

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
        [Column("instructor_id")]
        public long InstructorId { get; set; }
        [Column("thumbnail")]
        [StringLength(255)]
        public string Thumbnail { get; set; }

        [Column("published")]
        [System.ComponentModel.DefaultValue(null)]
        public bool Published { get; set; }

        [Column("duration")]
        public int? Duration { get; set; }

        public Course Copy()
        {
            return (Course) this.MemberwiseClone();
        }

        [SwaggerSchema(ReadOnly = true)]
        [ForeignKey(nameof(InstructorId))]
        [InverseProperty(nameof(User.Courses))]
        public virtual User Instructor { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(BundleCourse.Course))]
        public virtual ICollection<BundleCourse> BundleCourses { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.Certificate.Course))]
        public virtual ICollection<Certificate> Certificates { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseCategory.Course))]
        public virtual ICollection<CourseCategory> CourseCategories { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.CourseData.Course))]
        public virtual ICollection<CourseData> CourseDatum { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseDepartment.Course))]
        public virtual ICollection<CourseDepartment> CourseDepartments { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseDocument.Course))]
        public virtual ICollection<CourseDocument> CourseDocuments { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseEnrol.Course))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseImage.Course))]
        public virtual ICollection<CourseImage> CourseImages { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.CourseMedia.Course))]
        public virtual ICollection<CourseMedia> CourseMedia { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.CourseMeta.Course))]
        public virtual ICollection<CourseMeta> CourseMeta { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Rating.Course))]
        public virtual ICollection<Rating> Ratings { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Section.Course))]
        public virtual ICollection<Section> Sections { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public string CourseData { get; set; }

        [NotMapped]
        public virtual ICollection<Category> Categories { get; set; }

        [NotMapped]
        public virtual ICollection<Group> Departments { get; set; }

        [NotMapped]
        public virtual ICollection<User> Included { get; set; }

        [NotMapped]
        public virtual ICollection<User> Excluded { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public int Studying { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public DateTime? CourseEnds { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public long? Progress { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public long? Grade { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public long? CurrentClass { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public int ClassesCount { get; set; }

        [NotMapped]
        public bool HasCertificate { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public string Certificate { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public string CertificateSlug { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public string CertificateName { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public Dictionary<string, string> Meta { get; set; }

    }
}
