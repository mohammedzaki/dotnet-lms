using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities
{
    public partial class DigitalHubLMSContext : IdentityDbContext<User, Role, long, UserClaim, UserRole, UserLogin, RoleClaim, UserToken>
    {
        public DigitalHubLMSContext()
        {
        }

        public DigitalHubLMSContext(DbContextOptions<DigitalHubLMSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Announcement> Announcements { get; set; }
        public virtual DbSet<AnnouncementData> AnnouncementData { get; set; }
        public virtual DbSet<AnnouncementUser> AnnouncementUsers { get; set; }
        public virtual DbSet<Bundle> Bundles { get; set; }
        public virtual DbSet<BundleCourse> BundleCourses { get; set; }
        public virtual DbSet<BundleEnrol> BundleEnrols { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Certificate> Certificates { get; set; }
        public virtual DbSet<ClassData> ClassData { get; set; }
        public virtual DbSet<ClassDocument> ClassDocuments { get; set; }
        public virtual DbSet<ClassMedia> ClassMedia { get; set; }
        public virtual DbSet<ClassMeta> ClassMeta { get; set; }
        public virtual DbSet<ClassQuiz> ClassQuizzes { get; set; }
        public virtual DbSet<ClassQuizAnswer> ClassQuizAnswers { get; set; }
        public virtual DbSet<ClassQuizTake> ClassQuizTakes { get; set; }
        public virtual DbSet<ClassUserMeta> ClassUserMeta { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<CourseCategory> CourseCategories { get; set; }
        public virtual DbSet<CourseClass> CourseClasses { get; set; }
        public virtual DbSet<CourseData> CourseData { get; set; }
        public virtual DbSet<CourseDepartment> CourseDepartments { get; set; }
        public virtual DbSet<CourseDocument> CourseDocuments { get; set; }
        public virtual DbSet<CourseEnrol> CourseEnrols { get; set; }
        public virtual DbSet<CourseImage> CourseImages { get; set; }
        public virtual DbSet<CourseMedia> CourseMedia { get; set; }
        public virtual DbSet<CourseMeta> CourseMeta { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<FailedJob> FailedJobs { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<Media> Media { get; set; }
        public virtual DbSet<Migration> Migrations { get; set; }
        public virtual DbSet<Note> Notes { get; set; }
        public virtual DbSet<Options> Options { get; set; }
        public virtual DbSet<PasswordReset> PasswordResets { get; set; }
        public virtual DbSet<ProfilePicture> ProfilePictures { get; set; }
        public virtual DbSet<Questions> Questions { get; set; }
        public virtual DbSet<Quiz> Quizzes { get; set; }
        public virtual DbSet<Rating> Ratings { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<SecurityQuestion> SecurityQuestions { get; set; }
        public virtual DbSet<Setting> Settings { get; set; }
        public virtual DbSet<Subtitle> Subtitles { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }
        public virtual DbSet<UserInfo> UserInfos { get; set; }
        public virtual DbSet<UserSecurityQuestion> UserSecurityQuestions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            #region Generated Code

            //modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Announcement>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<AnnouncementData>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Announcement)
                    .WithMany(p => p.AnnouncementData)
                    .HasForeignKey(d => d.AnnouncementId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("announcement_data_announcement_id_foreign");
            });

            modelBuilder.Entity<AnnouncementUser>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Announcement)
                    .WithMany(p => p.AnnouncementUsers)
                    .HasForeignKey(d => d.AnnouncementId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("announcement_users_announcement_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AnnouncementUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("announcement_users_user_id_foreign");
            });

            modelBuilder.Entity<Bundle>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Instructor)
                    .WithMany(p => p.Bundles)
                    .HasForeignKey(d => d.InstructorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("bundles_instructor_id_foreign");
            });

            modelBuilder.Entity<BundleCourse>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Bundle)
                    .WithMany(p => p.BundleCourses)
                    .HasForeignKey(d => d.BundleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("bundle_courses_bundle_id_foreign");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.BundleCourses)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("bundle_courses_course_id_foreign");
            });

            modelBuilder.Entity<BundleEnrol>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Bundle)
                    .WithMany(p => p.BundleEnrols)
                    .HasForeignKey(d => d.BundleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("bundle_enrols_bundle_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.BundleEnrols)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("bundle_enrols_user_id_foreign");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Certificate>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.Status).HasComment("1-published 0-Not Published");

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Certificates)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("certificates_course_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Certificates)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("certificates_user_id_foreign");
            });

            modelBuilder.Entity<ClassData>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassDatum)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_data_course_class_id_foreign");
            });

            modelBuilder.Entity<ClassDocument>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassDocuments)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_document_course_class_id_foreign");

                entity.HasOne(d => d.Document)
                    .WithMany(p => p.ClassDocuments)
                    .HasForeignKey(d => d.DocumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_document_document_id_foreign");
            });

            modelBuilder.Entity<ClassMedia>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassMedia)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_media_course_class_id_foreign");

                entity.HasOne(d => d.Media)
                    .WithMany(p => p.ClassMedia)
                    .HasForeignKey(d => d.MediaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_media_media_id_foreign");
            });

            modelBuilder.Entity<ClassMeta>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassMeta)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_meta_course_class_id_foreign");
            });

            modelBuilder.Entity<ClassQuiz>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassQuizzes)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_course_class_id_foreign");

                //entity.HasOne(d => d.Quiz)
                //    .WithMany(p => p.ClassQuizzes)
                //    .HasForeignKey(d => d.QuizId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("class_quiz_quiz_id_foreign");
            });

            modelBuilder.Entity<ClassQuizAnswer>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.ClassQuizTake)
                    .WithMany(p => p.ClassQuizAnswers)
                    .HasForeignKey(d => d.ClassQuizTakeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_answers_class_quiz_take_id_foreign");

                entity.HasOne(d => d.Option)
                    .WithMany(p => p.ClassQuizAnswers)
                    .HasForeignKey(d => d.OptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_answers_option_id_foreign");

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.ClassQuizAnswers)
                    .HasForeignKey(d => d.QuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_answers_question_id_foreign");
            });

            modelBuilder.Entity<ClassQuizTake>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.ClassQuiz)
                    .WithMany(p => p.ClassQuizTakes)
                    .HasForeignKey(d => d.ClassQuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_takes_class_quiz_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ClassQuizTakes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_quiz_takes_user_id_foreign");
            });

            modelBuilder.Entity<ClassUserMeta>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.ClassUserMeta)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_user_meta_course_class_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ClassUserMeta)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("class_user_meta_user_id_foreign");
            });

            modelBuilder.Entity<Course>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Instructor)
                    .WithMany(p => p.Courses)
                    .HasForeignKey(d => d.InstructorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("courses_instructor_id_foreign");
            });

            modelBuilder.Entity<CourseCategory>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.CourseCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_category_category_id_foreign");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseCategories)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_category_course_id_foreign");
            });

            modelBuilder.Entity<CourseClass>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Section)
                    .WithMany(p => p.CourseClasses)
                    .HasForeignKey(d => d.SectionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_classes_section_id_foreign");
            });

            modelBuilder.Entity<CourseData>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseDatum)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_data_course_id_foreign");
            });

            modelBuilder.Entity<CourseDepartment>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseDepartments)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_department_course_id_foreign");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.CourseDepartments)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_department_group_id_foreign");
            });

            modelBuilder.Entity<CourseDocument>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseDocuments)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_document_course_id_foreign");

                entity.HasOne(d => d.Document)
                    .WithMany(p => p.CourseDocuments)
                    .HasForeignKey(d => d.DocumentId)
                    .HasConstraintName("course_document_document_id_foreign");
            });

            modelBuilder.Entity<CourseEnrol>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseEnrols)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_enrols_course_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.CourseEnrols)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_enrols_user_id_foreign");
            });

            modelBuilder.Entity<CourseImage>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseImages)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_image_course_id_foreign");

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.CourseImages)
                    .HasForeignKey(d => d.ImageId)
                    .HasConstraintName("course_image_image_id_foreign");
            });

            modelBuilder.Entity<CourseMedia>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseMedia)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_media_course_id_foreign");

                entity.HasOne(d => d.Media)
                    .WithMany(p => p.CourseMedia)
                    .HasForeignKey(d => d.MediaId)
                    .HasConstraintName("course_media_media_id_foreign");
            });

            modelBuilder.Entity<CourseMeta>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseMeta)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("course_meta_course_id_foreign");
            });

            modelBuilder.Entity<Document>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.Uid).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<FailedJob>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.FailedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e._Id).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.Uid).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Job>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Media>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.Uid).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Migration>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Note>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.CourseClass)
                    .WithMany(p => p.Notes)
                    .HasForeignKey(d => d.CourseClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("notes_course_class_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Notes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("notes_user_id_foreign");
            });

            modelBuilder.Entity<Options>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.Options)
                    .HasForeignKey(d => d.QuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("options_question_id_foreign");
            });

            modelBuilder.Entity<PasswordReset>(entity =>
            {
                entity.Property(e => e.CreatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<ProfilePicture>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e._Id).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Questions>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("questions_quiz_id_foreign");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Ratings)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("ratings_course_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Ratings)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("ratings_user_id_foreign");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e._Id).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Name).HasColumnName("name");
            });

            modelBuilder.Entity<Section>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Sections)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("sections_course_id_foreign");
            });

            modelBuilder.Entity<SecurityQuestion>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Subtitle>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.DeletedAt).HasPrecision(0);

                entity.Property(e => e.Uid).IsFixedLength(true);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ApiKey).IsFixedLength(true);

                entity.Property(e => e.ConfirmCode).IsFixedLength(true);

                entity.Property(e => e.ConfirmedAt).HasPrecision(0);

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e._Id).IsFixedLength(true);

                entity.Property(e => e.OtpCreatedAt).HasPrecision(0);

                entity.Property(e => e.PasswordChangedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.Property(e => e.UserName).HasColumnName("username");

                entity.Property(e => e.Email).HasColumnName("email");
            });

            modelBuilder.Entity<UserGroup>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.UserGroups)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_group_group_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserGroups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_group_user_id_foreign");
            });

            modelBuilder.Entity<UserInfo>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserInfos)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_info_user_id_foreign");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_role_role_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserRoles)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_role_user_id_foreign");
            });

            modelBuilder.Entity<UserSecurityQuestion>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasPrecision(0);

                entity.Property(e => e.UpdatedAt).HasPrecision(0);

                entity.HasOne(d => d.SecurityQuestion)
                    .WithMany(p => p.UserSecurityQuestions)
                    .HasForeignKey(d => d.SecurityQuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_security_question_security_question_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserSecurityQuestions)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("user_security_question_user_id_foreign");
            });
            #endregion

            modelBuilder.Entity<User>().ToTable("users");
            modelBuilder.Entity<Role>().ToTable("roles");
            modelBuilder.Entity<UserRole>().ToTable("user_role");
            modelBuilder.Entity<UserClaim>().ToTable("user_claims");
            modelBuilder.Entity<UserLogin>().ToTable("user_logins");
            modelBuilder.Entity<RoleClaim>().ToTable("role_claims");
            modelBuilder.Entity<UserToken>().ToTable("user_tokens");

            OnModelCreatingPartial(modelBuilder);

            SeedInitialData(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        private void SeedInitialData(ModelBuilder modelBuilder)
        {
            //Seeding Roles table 
            modelBuilder.Entity<Role>().HasData(
                new Role
                {
                    Id = 1,
                    ConcurrencyStamp = "167860ad-4ade-4725-92b9-d8b57815b919",
                    Name = "system",
                    NormalizedName = "system".ToUpper(),
                    _Id = "7be3e993-425f-4575-a642-8715ab1fd7c1",
                    IsActive = 1,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    Level = 0,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                },
                new Role
                {
                    Id = 2,
                    ConcurrencyStamp = "167860ad-4ade-4725-92b9-d8b57815b919",
                    Name = "admin",
                    NormalizedName = "admin".ToUpper(),
                    _Id = "0c515869-132e-4f65-b078-e9646aaabfd1",
                    IsActive = 1,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    Level = 1,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                },
                new Role
                {
                    Id = 3,
                    ConcurrencyStamp = "167860ad-4ade-4725-92b9-d8b57815b919",
                    Name = "supervisor",
                    NormalizedName = "supervisor".ToUpper(),
                    _Id = "aa9930ca-cb8e-492d-8058-63edff77c5e4",
                    IsActive = 1,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    Level = 3,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                },
                new Role
                {
                    Id = 4,
                    ConcurrencyStamp = "167860ad-4ade-4725-92b9-d8b57815b919",
                    Name = "instructor",
                    NormalizedName = "instructor".ToUpper(),
                    _Id = "55ec9f9c-43bd-4a37-bf53-a0312d7b544f",
                    IsActive = 1,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    Level = 4,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                },
                new Role
                {
                    Id = 5,
                    ConcurrencyStamp = "167860ad-4ade-4725-92b9-d8b57815b919",
                    Name = "employee",
                    NormalizedName = "employee".ToUpper(),
                    _Id = "dd3c0e71-e0cb-45a0-af9b-401090882087",
                    IsActive = 1,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    Level = 5,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                }
            );

            //a hasher to hash the password before seeding the user to the db
            // 
            //var hasher = new PasswordHasher<User>();
            //var SecurityStamp = Guid.NewGuid().ToString();
            //var password = hasher.HashPassword(null, "#$3_!4&7F?Zb"); // AQAAAAEAACcQAAAAEA0dFJ7ebrmyrqdtL1eV5ttvgEi+6KSfBo4SVQIuvwsiqzcc18PrmHJ+sg8beske+w==

            //Seeding the User to AspNetUsers table
            modelBuilder.Entity<User>().HasData(
                new User
                {
                    Id = 1,
                    _Id = "edfeb122-3656-483b-b477-17c827f44cd4",
                    ApiKey = null,
                    UserName = "admin",
                    IsLdap = 0,
                    PasswordHash = "AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==", // = "q?$A!P_D5eT&D2BB"
                    FirstName = "Abe",
                    LastName = "Sal",
                    Email = "ahmed.kamal@mped.gov.eg",
                    IsBanned = 0,
                    IsVerified = 0,
                    ConfirmCode = "1234                                ",
                    ConfirmedAt = null,
                    PasswordChangedAt = DateTime.Now,
                    DisplayName = "Abdalla Salah",
                    UserUrl = null,
                    CreatedBy = 1,
                    UpdatedBy = 1,
                    RememberToken = null,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now,
                    Otp = null,
                    OtpCreatedAt = null,
                    ProfilePictureId = null,
                    NormalizedUserName = "admin".ToUpper(),
                    NormalizedEmail = "ahmed.kamal@mped.gov.eg".ToUpper(),
                    ConcurrencyStamp = "d6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7",
                    SecurityStamp = "27c0b512-9f7e-4ce7-bcff-6563379cbe20",
                    EmailConfirmed = true
                }
            );

            ////Seeding the relation between our user and role to AspNetUserRoles table
            modelBuilder.Entity<UserRole>().HasData(
                new UserRole
                {
                    UserId = 1,
                    RoleId = 1
                },
                new UserRole
                {
                    UserId = 1,
                    RoleId = 2
                },
                new UserRole
                {
                    UserId = 1,
                    RoleId = 3
                },
                new UserRole
                {
                    UserId = 1,
                    RoleId = 4
                },
                new UserRole
                {
                    UserId = 1,
                    RoleId = 5
                }
            );

        }
    }
}
