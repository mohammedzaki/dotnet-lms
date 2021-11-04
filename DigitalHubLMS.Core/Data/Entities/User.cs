using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DigitalHubLMS.Core.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MZCore.Patterns.Repositroy;
using Newtonsoft.Json;

namespace DigitalHubLMS.Core.Data.Entities 
{
    [Table("users")]
    [Index(nameof(_Id), Name = "users__id_unique", IsUnique = true)]
    [Index(nameof(Email), Name = "users_email_unique", IsUnique = true)]
    [Index(nameof(UserName), Name = "users_username_unique", IsUnique = true)]
    public partial class User : IdentityUser<long>, IEntity<long>
    {
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
        [JsonIgnore]
        public string _UserUrl { get; set; }
        [NotMapped]
        public string UserUrl { get => _UserUrl.ToHostUrl(); set => _UserUrl = value; }
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

        [JsonIgnore]
        [InverseProperty(nameof(AnnouncementUser.User))]
        public virtual ICollection<AnnouncementUser> AnnouncementUsers { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(BundleEnrol.User))]
        public virtual ICollection<BundleEnrol> BundleEnrols { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Bundle.Instructor))]
        public virtual ICollection<Bundle> Bundles { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Certificate.User))]
        public virtual ICollection<Certificate> Certificates { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(ClassQuizTake.User))]
        public virtual ICollection<ClassQuizTake> ClassQuizTakes { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Entities.ClassUserMeta.User))]
        public virtual ICollection<ClassUserMeta> ClassUserMeta { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(CourseEnrol.User))]
        public virtual ICollection<CourseEnrol> CourseEnrols { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Course.Instructor))]
        public virtual ICollection<Course> Courses { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Note.User))]
        public virtual ICollection<Note> Notes { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(Rating.User))]
        public virtual ICollection<Rating> Ratings { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserGroup.User))]
        public virtual ICollection<UserGroup> UserGroups { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserInfo.User))]
        public virtual ICollection<UserInfo> UserInfos { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserRole.User))]
        public virtual ICollection<UserRole> UserRoles { get; set; }

        [JsonIgnore]
        [InverseProperty(nameof(UserSecurityQuestion.User))]
        public virtual ICollection<UserSecurityQuestion> UserSecurityQuestions { get; set; }

        [NotMapped]
        [Required]
        public string Username { get; set; }
        [NotMapped]
        public string Password { get; set; }
        [NotMapped]
        public string Title { get; set; }
        [NotMapped]
        public string Description { get; set; }
        [NotMapped]
        public IList<Role> SelectedRoles { get; set; }
        [NotMapped]
        public IList<Group> SelectedGroups { get; set; }
        [NotMapped]
        public IList<Role> Roles { get; set; }
        [NotMapped]
        public IList<Group> Departments { get; set; }
    }
}
