using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

#nullable disable

namespace DigitalHubLMS.Core.Data.Entities 
{
    [Table("users")]
    [Index(nameof(_Id), Name = "users__id_unique", IsUnique = true)]
    [Index(nameof(Email), Name = "users_email_unique", IsUnique = true)]
    [Index(nameof(UserName), Name = "users_username_unique", IsUnique = true)]
    public partial class User : IdentityUser<long>
    {
        
        public User()
        {
            AnnouncementUsers = new HashSet<AnnouncementUser>();
            BundleEnrols = new HashSet<BundleEnrol>();
            Bundles = new HashSet<Bundle>();
            Certificates = new HashSet<Certificate>();
            ClassQuizTakes = new HashSet<ClassQuizTake>();
            ClassUserMeta = new HashSet<ClassUserMetum>();
            CourseEnrols = new HashSet<CourseEnrol>();
            Courses = new HashSet<Course>();
            Notes = new HashSet<Note>();
            Ratings = new HashSet<Rating>();
            UserGroups = new HashSet<UserGroup>();
            UserInfos = new HashSet<UserInfo>();
            UserSecurityQuestions = new HashSet<UserSecurityQuestion>();
        }

        [Key]
        [Column("id")]
        public long Id { get; set; }
        [Required]
        [Column("_id")]
        [StringLength(36)]
        public string _Id { get; set; }
        [Column("api_key")]
        [StringLength(36)]
        public string ApiKey { get; set; }
        [Column("is_ldap")]
        public byte IsLdap { get; set; }
        [Column("first_name")]
        [StringLength(255)]
        public string FirstName { get; set; }
        [Column("last_name")]
        [StringLength(255)]
        public string LastName { get; set; }
        [Column("is_banned")]
        public byte IsBanned { get; set; }
        [Column("is_verified")]
        public byte IsVerified { get; set; }
        [Required]
        [Column("confirm_code")]
        [StringLength(36)]
        public string ConfirmCode { get; set; }
        [Column("confirmed_at")]
        public DateTime? ConfirmedAt { get; set; }
        [Column("password_changed_at")]
        public DateTime? PasswordChangedAt { get; set; }
        [Column("display_name")]
        [StringLength(255)]
        public string DisplayName { get; set; }
        [Column("user_url")]
        [StringLength(255)]
        public string UserUrl { get; set; }
        [Column("created_by")]
        public long CreatedBy { get; set; }
        [Column("updated_by")]
        public long UpdatedBy { get; set; }
        [Column("remember_token")]
        [StringLength(100)]
        public string RememberToken { get; set; }
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }
        [Column("deleted_at", TypeName = "date")]
        public DateTime? DeletedAt { get; set; }
        [Column("otp")]
        [StringLength(255)]
        public string Otp { get; set; }
        [Column("otp_created_at")]
        public DateTime? OtpCreatedAt { get; set; }
        [Column("profile_picture_id")]
        public long? ProfilePictureId { get; set; }

        [InverseProperty(nameof(AnnouncementUser.User))]
        public virtual ICollection<AnnouncementUser> AnnouncementUsers { get; set; }
        [InverseProperty(nameof(BundleEnrol.User))]
        public virtual ICollection<BundleEnrol> BundleEnrols { get; set; }
        [InverseProperty(nameof(Bundle.Instructor))]
        public virtual ICollection<Bundle> Bundles { get; set; }
        [InverseProperty(nameof(Certificate.User))]
        public virtual ICollection<Certificate> Certificates { get; set; }
        [InverseProperty(nameof(ClassQuizTake.User))]
        public virtual ICollection<ClassQuizTake> ClassQuizTakes { get; set; }
        [InverseProperty(nameof(ClassUserMetum.User))]
        public virtual ICollection<ClassUserMetum> ClassUserMeta { get; set; }
        [InverseProperty(nameof(CourseEnrol.User))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }
        [InverseProperty(nameof(Course.Instructor))]
        public virtual ICollection<Course> Courses { get; set; }
        [InverseProperty(nameof(Note.User))]
        public virtual ICollection<Note> Notes { get; set; }
        [InverseProperty(nameof(Rating.User))]
        public virtual ICollection<Rating> Ratings { get; set; }
        [InverseProperty(nameof(UserGroup.User))]
        public virtual ICollection<UserGroup> UserGroups { get; set; }
        [InverseProperty(nameof(UserInfo.User))]
        public virtual ICollection<UserInfo> UserInfos { get; set; }

        [InverseProperty(nameof(UserRole.User))]
        public virtual ICollection<UserRole> UserRoles { get; set; }

        [InverseProperty(nameof(UserSecurityQuestion.User))]
        public virtual ICollection<UserSecurityQuestion> UserSecurityQuestions { get; set; }

        public List<Role> Roles {
            get; set;
        }

    }
}
