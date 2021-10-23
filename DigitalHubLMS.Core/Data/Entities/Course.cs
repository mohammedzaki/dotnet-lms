﻿using System;
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
        [InverseProperty(nameof(Certificate.Course))]
        public virtual ICollection<Certificate> Certificates { get; set; }
        [InverseProperty(nameof(CourseCategory.Course))]
        public virtual ICollection<CourseCategory> CourseCategories { get; set; }
        [InverseProperty(nameof(CourseClass.Course))]
        public virtual ICollection<CourseClass> CourseClasses { get; set; }
        [InverseProperty(nameof(Entities.CourseData.Course))]
        public virtual ICollection<CourseData> CourseData { get; set; }
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

        /*
        public function completed()
        {
            return $this->belongsToMany('App\User', 'course_enrols')->using('App\PivotRelations')->where('progress', '=', 100)->select('display_name');

        }

        public function not_started()
        {
            return $this->belongsToMany('App\User', 'course_enrols')->using('App\PivotRelations')->where('progress', '=', 0);
        }

        public function in_progress()
        {

            return $this->belongsToMany('App\User', 'course_enrols')->using('App\PivotRelations')
                        ->where('progress', '>', 0)
                        ->where('progress', '<', 100);
        }
        */
    }
}
