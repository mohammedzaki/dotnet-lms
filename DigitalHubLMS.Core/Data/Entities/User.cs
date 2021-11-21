using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using DigitalHubLMS.Core.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

namespace DigitalHubLMS.Core.Data.Entities 
{
    [Table("users")]
    [Index(nameof(Email), Name = "users_email_unique", IsUnique = true)]
    [Index(nameof(UserName), Name = "users_username_unique", IsUnique = true)]
    public partial class User : IdentityUser<long>, IEntity<long>
    {
        [SwaggerSchema(ReadOnly = true)]
        [Column("api_key")]
        [StringLength(36)]
        public string ApiKey { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("is_ldap")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsLdap { get; set; }

        [Column("first_name")]
        [StringLength(255)]
        public string FirstName { get; set; }

        [Column("last_name")]
        [StringLength(255)]
        public string LastName { get; set; }

        [Column("is_banned")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsBanned { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("is_verified")]
        [System.ComponentModel.DefaultValue(null)]
        public bool IsVerified { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("confirm_code")]
        [StringLength(36)]
        public string ConfirmCode { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("confirmed_at")]
        public DateTime? ConfirmedAt { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("password_changed_at")]
        public DateTime? PasswordChangedAt { get; set; }

        [Column("display_name")]
        [StringLength(255)]
        public string DisplayName { get; set; }

        [Column("user_url")]
        private string _UserUrl;
        [NotMapped]
        public string UserUrl { get => _UserUrl.ToHostUrl(); set => _UserUrl = value; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("remember_token")]
        [StringLength(100)]
        public string RememberToken { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [AllowNull]
        [Column("created_by")]
        public long? CreatedBy { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [AllowNull]
        [Column("updated_by")]
        public long? UpdatedBy { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [AllowNull]
        [Column("created_at")]
        public DateTime? CreatedAt { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [AllowNull]
        [Column("updated_at")]
        public DateTime? UpdatedAt { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("deleted_at", TypeName = "date")]
        public DateTime? DeletedAt { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("otp")]
        [StringLength(255)]
        public string Otp { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("otp_created_at")]
        public DateTime? OtpCreatedAt { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [Column("profile_picture_id")]
        public long? ProfilePictureId { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(AnnouncementUser.User))]
        public virtual ICollection<AnnouncementUser> AnnouncementUsers { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(BundleEnrol.User))]
        public virtual ICollection<BundleEnrol> BundleEnrols { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Bundle.Instructor))]
        public virtual ICollection<Bundle> Bundles { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Certificate.User))]
        public virtual ICollection<Certificate> Certificates { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(ClassQuizTake.User))]
        public virtual ICollection<ClassQuizTake> ClassQuizTakes { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Entities.ClassUserMeta.User))]
        public virtual ICollection<ClassUserMeta> ClassUserMeta { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(CourseEnrol.User))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Course.Instructor))]
        public virtual ICollection<Course> Courses { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Note.User))]
        public virtual ICollection<Note> Notes { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(Rating.User))]
        public virtual ICollection<Rating> Ratings { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(UserGroup.User))]
        public virtual ICollection<UserGroup> UserGroups { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(UserInfo.User))]
        public virtual ICollection<UserInfo> UserInfos { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(UserRole.User))]
        public virtual ICollection<UserRole> UserRoles { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [InverseProperty(nameof(UserSecurityQuestion.User))]
        public virtual ICollection<UserSecurityQuestion> UserSecurityQuestions { get; set; }

        [NotMapped]
        [Required]
        public string Username { get; set; }

        [NotMapped]
        //[Required]
        public string Password { get; set; }

        [NotMapped]
        public string Title { get; set; }

        [NotMapped]
        public string Description { get; set; }

        [SwaggerSchema(WriteOnly = true)]
        //[Required]
        [NotMapped]
        public IList<Role> SelectedRoles { get; set; }

        [SwaggerSchema(WriteOnly = true)]
        //[Required]
        [NotMapped]
        public IList<Group> SelectedGroups { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public IList<Role> Roles { get; set; }

        [SwaggerSchema(ReadOnly = true)]
        [NotMapped]
        public IList<Group> Departments { get; set; }
    }
}
