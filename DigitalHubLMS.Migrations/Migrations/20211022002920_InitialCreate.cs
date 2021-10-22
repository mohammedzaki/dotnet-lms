using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DigitalHubLMS.Migrations.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "announcements",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    message = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    priority = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: true),
                    updated_by = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_announcements", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "categories",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    parent = table.Column<int>(type: "int", nullable: true),
                    slug = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    thumbnail = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    short_description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    icon = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_categories", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "documents",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    uid = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    size = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    file_key = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    mime = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    @private = table.Column<byte>(name: "private", type: "tinyint", nullable: false),
                    downloads = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_documents", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "failed_jobs",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    connection = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    queue = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    payload = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    exception = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    failed_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_failed_jobs", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "groups",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    _id = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    is_ldap = table.Column<byte>(type: "tinyint", nullable: false),
                    is_active = table.Column<byte>(type: "tinyint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_groups", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "images",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    uid = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    size = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    file_key = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    mime = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    @private = table.Column<byte>(name: "private", type: "tinyint", nullable: false),
                    downloads = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_images", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "jobs",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    queue = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    payload = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    attempts = table.Column<byte>(type: "tinyint", nullable: false),
                    reserved_at = table.Column<int>(type: "int", nullable: true),
                    available_at = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_jobs", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "media",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    uid = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    size = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    file_key = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    mime = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    quality = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    duration = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    @private = table.Column<byte>(name: "private", type: "tinyint", nullable: false),
                    downloads = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_media", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "migrations",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false),
                    migration = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    batch = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_migrations", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "password_resets",
                columns: table => new
                {
                    email = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    token = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "profile_pictures",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    _id = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    mime = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    file_key = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_profile_pictures", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "quizzes",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_quizzes", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "security_questions",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    question = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_security_questions", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "settings",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    key = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    value = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_settings", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "subtitles",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    uid = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    mime = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_subtitles", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "tags",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    tag = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    tagable_id = table.Column<int>(type: "int", nullable: true),
                    tagable_type = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    slug = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tags", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "users",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _id = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    api_key = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: true),
                    username = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    is_ldap = table.Column<byte>(type: "tinyint", nullable: false),
                    first_name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    last_name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    is_banned = table.Column<byte>(type: "tinyint", nullable: false),
                    is_verified = table.Column<byte>(type: "tinyint", nullable: false),
                    confirm_code = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    confirmed_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    password_changed_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    display_name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    user_url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    remember_token = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "date", nullable: true),
                    otp = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    otp_created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    profile_picture_id = table.Column<long>(type: "bigint", nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_users", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "announcement_data",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    announcement_id = table.Column<long>(type: "bigint", nullable: false),
                    data = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_announcement_data", x => x.id);
                    table.ForeignKey(
                        name: "announcement_data_announcement_id_foreign",
                        column: x => x.announcement_id,
                        principalTable: "announcements",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "questions",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    question = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    quiz_id = table.Column<long>(type: "bigint", nullable: false),
                    order = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_questions", x => x.id);
                    table.ForeignKey(
                        name: "questions_quiz_id_foreign",
                        column: x => x.quiz_id,
                        principalTable: "quizzes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "announcement_users",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    announcement_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    read = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_announcement_users", x => x.id);
                    table.ForeignKey(
                        name: "announcement_users_announcement_id_foreign",
                        column: x => x.announcement_id,
                        principalTable: "announcements",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "announcement_users_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "bundles",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    short_description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    outcomes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    language = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    slug = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    requirements = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    level = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    created_by = table.Column<int>(type: "int", nullable: true),
                    instructor_id = table.Column<long>(type: "bigint", nullable: false),
                    thumbnail = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    video_url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    is_top_course = table.Column<int>(type: "int", nullable: true),
                    is_admin = table.Column<int>(type: "int", nullable: true),
                    published = table.Column<byte>(type: "tinyint", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_bundles", x => x.id);
                    table.ForeignKey(
                        name: "bundles_instructor_id_foreign",
                        column: x => x.instructor_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "courses",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    short_description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    slug = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    created_by = table.Column<int>(type: "int", nullable: true),
                    updated_by = table.Column<int>(type: "int", nullable: true),
                    instructor_id = table.Column<long>(type: "bigint", nullable: false),
                    thumbnail = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    published = table.Column<byte>(type: "tinyint", nullable: false),
                    duration = table.Column<int>(type: "int", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_courses", x => x.id);
                    table.ForeignKey(
                        name: "courses_instructor_id_foreign",
                        column: x => x.instructor_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "roles",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _id = table.Column<string>(type: "nchar(36)", fixedLength: true, maxLength: 36, nullable: false),
                    name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    is_active = table.Column<byte>(type: "tinyint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    level = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    deleted_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    UserId = table.Column<long>(type: "bigint", nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_roles", x => x.id);
                    table.ForeignKey(
                        name: "FK_roles_users_UserId",
                        column: x => x.UserId,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "user_claims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<long>(type: "bigint", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_claims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_user_claims_users_UserId",
                        column: x => x.UserId,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "user_group",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    group_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_group", x => x.id);
                    table.ForeignKey(
                        name: "user_group_group_id_foreign",
                        column: x => x.group_id,
                        principalTable: "groups",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "user_group_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "user_info",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_info", x => x.id);
                    table.ForeignKey(
                        name: "user_info_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "user_logins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_logins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_user_logins_users_UserId",
                        column: x => x.UserId,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "user_security_question",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    security_question_id = table.Column<long>(type: "bigint", nullable: false),
                    security_answer = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_security_question", x => x.id);
                    table.ForeignKey(
                        name: "user_security_question_security_question_id_foreign",
                        column: x => x.security_question_id,
                        principalTable: "security_questions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "user_security_question_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "user_tokens",
                columns: table => new
                {
                    UserId = table.Column<long>(type: "bigint", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_tokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_user_tokens_users_UserId",
                        column: x => x.UserId,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "options",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    option = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    question_id = table.Column<long>(type: "bigint", nullable: false),
                    correct = table.Column<byte>(type: "tinyint", nullable: false),
                    order = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_options", x => x.id);
                    table.ForeignKey(
                        name: "options_question_id_foreign",
                        column: x => x.question_id,
                        principalTable: "questions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "bundle_enrols",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    bundle_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_bundle_enrols", x => x.id);
                    table.ForeignKey(
                        name: "bundle_enrols_bundle_id_foreign",
                        column: x => x.bundle_id,
                        principalTable: "bundles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "bundle_enrols_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "bundle_courses",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    bundle_id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_bundle_courses", x => x.id);
                    table.ForeignKey(
                        name: "bundle_courses_bundle_id_foreign",
                        column: x => x.bundle_id,
                        principalTable: "bundles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "bundle_courses_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "certificates",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    name = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    slug = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    url = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    status = table.Column<byte>(type: "tinyint", nullable: false, comment: "1-published 0-Not Published"),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_certificates", x => x.id);
                    table.ForeignKey(
                        name: "certificates_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "certificates_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_category",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    category_id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_category", x => x.id);
                    table.ForeignKey(
                        name: "course_category_category_id_foreign",
                        column: x => x.category_id,
                        principalTable: "categories",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_category_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_data",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    data = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_data", x => x.id);
                    table.ForeignKey(
                        name: "course_data_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_department",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    group_id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_department", x => x.id);
                    table.ForeignKey(
                        name: "course_department_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_department_group_id_foreign",
                        column: x => x.group_id,
                        principalTable: "groups",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_document",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    document_id = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_document", x => x.id);
                    table.ForeignKey(
                        name: "course_document_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_document_document_id_foreign",
                        column: x => x.document_id,
                        principalTable: "documents",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_enrols",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    current_class = table.Column<long>(type: "bigint", nullable: true),
                    progress = table.Column<long>(type: "bigint", nullable: true),
                    type = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_enrols", x => x.id);
                    table.ForeignKey(
                        name: "course_enrols_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_enrols_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_image",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    image_id = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_image", x => x.id);
                    table.ForeignKey(
                        name: "course_image_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_image_image_id_foreign",
                        column: x => x.image_id,
                        principalTable: "images",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_media",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    media_id = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_media", x => x.id);
                    table.ForeignKey(
                        name: "course_media_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_media_media_id_foreign",
                        column: x => x.media_id,
                        principalTable: "media",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_meta",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    meta_key = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    meta_value = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_meta", x => x.id);
                    table.ForeignKey(
                        name: "course_meta_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ratings",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    rating = table.Column<double>(type: "float", nullable: true),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    review = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ratings", x => x.id);
                    table.ForeignKey(
                        name: "ratings_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "ratings_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "sections",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    order = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sections", x => x.id);
                    table.ForeignKey(
                        name: "sections_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "role_claims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<long>(type: "bigint", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_role_claims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_role_claims_roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "roles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "user_role",
                columns: table => new
                {
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    role_id = table.Column<long>(type: "bigint", nullable: false),
                    created_by = table.Column<long>(type: "bigint", nullable: false),
                    updated_by = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_role", x => new { x.user_id, x.role_id });
                    table.ForeignKey(
                        name: "user_role_role_id_foreign",
                        column: x => x.role_id,
                        principalTable: "roles",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "user_role_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "course_classes",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    title = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    duration = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    course_id = table.Column<long>(type: "bigint", nullable: false),
                    section_id = table.Column<long>(type: "bigint", nullable: false),
                    type = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    order = table.Column<int>(type: "int", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_course_classes", x => x.id);
                    table.ForeignKey(
                        name: "course_classes_course_id_foreign",
                        column: x => x.course_id,
                        principalTable: "courses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "course_classes_section_id_foreign",
                        column: x => x.section_id,
                        principalTable: "sections",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_data",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    data = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_data", x => x.id);
                    table.ForeignKey(
                        name: "class_data_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_document",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    document_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_document", x => x.id);
                    table.ForeignKey(
                        name: "class_document_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_document_document_id_foreign",
                        column: x => x.document_id,
                        principalTable: "documents",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_media",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    media_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_media", x => x.id);
                    table.ForeignKey(
                        name: "class_media_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_media_media_id_foreign",
                        column: x => x.media_id,
                        principalTable: "media",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_meta",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    meta_key = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    meta_value = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_meta", x => x.id);
                    table.ForeignKey(
                        name: "class_meta_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_quiz",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    quiz_id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_quiz", x => x.id);
                    table.ForeignKey(
                        name: "class_quiz_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_quiz_quiz_id_foreign",
                        column: x => x.quiz_id,
                        principalTable: "quizzes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_user_meta",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    completed = table.Column<int>(type: "int", nullable: true),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_user_meta", x => x.id);
                    table.ForeignKey(
                        name: "class_user_meta_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_user_meta_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "notes",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    body = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    course_class_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_notes", x => x.id);
                    table.ForeignKey(
                        name: "notes_course_class_id_foreign",
                        column: x => x.course_class_id,
                        principalTable: "course_classes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "notes_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_quiz_takes",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    class_quiz_id = table.Column<long>(type: "bigint", nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    quiz_result = table.Column<int>(type: "int", nullable: true),
                    attempt = table.Column<int>(type: "int", nullable: false),
                    score = table.Column<byte>(type: "tinyint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_quiz_takes", x => x.id);
                    table.ForeignKey(
                        name: "class_quiz_takes_class_quiz_id_foreign",
                        column: x => x.class_quiz_id,
                        principalTable: "class_quiz",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_quiz_takes_user_id_foreign",
                        column: x => x.user_id,
                        principalTable: "users",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "class_quiz_answers",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false),
                    class_quiz_take_id = table.Column<long>(type: "bigint", nullable: false),
                    question_id = table.Column<long>(type: "bigint", nullable: false),
                    option_id = table.Column<long>(type: "bigint", nullable: false),
                    attempt = table.Column<byte>(type: "tinyint", nullable: false),
                    score = table.Column<byte>(type: "tinyint", nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true),
                    updated_at = table.Column<DateTime>(type: "datetime2(0)", precision: 0, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_class_quiz_answers", x => x.id);
                    table.ForeignKey(
                        name: "class_quiz_answers_class_quiz_take_id_foreign",
                        column: x => x.class_quiz_take_id,
                        principalTable: "class_quiz_takes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_quiz_answers_option_id_foreign",
                        column: x => x.option_id,
                        principalTable: "options",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "class_quiz_answers_question_id_foreign",
                        column: x => x.question_id,
                        principalTable: "questions",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "roles",
                columns: new[] { "id", "ConcurrencyStamp", "created_at", "created_by", "deleted_at", "is_active", "level", "name", "NormalizedName", "updated_at", "updated_by", "UserId", "_id" },
                values: new object[,]
                {
                    { 1L, "167860ad-4ade-4725-92b9-d8b57815b919", new DateTime(2021, 10, 22, 2, 29, 20, 162, DateTimeKind.Local).AddTicks(1490), 1L, null, (byte)1, 0, "system", "SYSTEM", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(600), 1L, null, "7be3e993-425f-4575-a642-8715ab1fd7c1" },
                    { 2L, "167860ad-4ade-4725-92b9-d8b57815b919", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1300), 1L, null, (byte)1, 1, "admin", "ADMIN", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1310), 1L, null, "0c515869-132e-4f65-b078-e9646aaabfd1" },
                    { 3L, "167860ad-4ade-4725-92b9-d8b57815b919", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1320), 1L, null, (byte)1, 3, "supervisor", "SUPERVISOR", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1320), 1L, null, "aa9930ca-cb8e-492d-8058-63edff77c5e4" },
                    { 4L, "167860ad-4ade-4725-92b9-d8b57815b919", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1330), 1L, null, (byte)1, 4, "instructor", "INSTRUCTOR", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1330), 1L, null, "55ec9f9c-43bd-4a37-bf53-a0312d7b544f" },
                    { 5L, "167860ad-4ade-4725-92b9-d8b57815b919", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1340), 1L, null, (byte)1, 5, "employee", "EMPLOYEE", new DateTime(2021, 10, 22, 2, 29, 20, 169, DateTimeKind.Local).AddTicks(1340), 1L, null, "dd3c0e71-e0cb-45a0-af9b-401090882087" }
                });

            migrationBuilder.InsertData(
                table: "users",
                columns: new[] { "id", "AccessFailedCount", "api_key", "ConcurrencyStamp", "confirm_code", "confirmed_at", "created_at", "created_by", "deleted_at", "display_name", "email", "EmailConfirmed", "first_name", "is_banned", "is_ldap", "is_verified", "last_name", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "otp", "otp_created_at", "password_changed_at", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "profile_picture_id", "remember_token", "SecurityStamp", "TwoFactorEnabled", "updated_at", "updated_by", "username", "user_url", "_id" },
                values: new object[] { 1L, 0, null, "d6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7", "1234                                ", null, new DateTime(2021, 10, 22, 2, 29, 20, 172, DateTimeKind.Local).AddTicks(6410), 1L, null, "Abdalla Salah", "ahmed.kamal@mped.gov.eg", true, "Abe", (byte)0, (byte)0, (byte)0, "Sal", false, null, "AHMED.KAMAL@MPED.GOV.EG", "ADMIN", null, null, new DateTime(2021, 10, 22, 2, 29, 20, 172, DateTimeKind.Local).AddTicks(2930), "AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==", null, false, null, null, "27c0b512-9f7e-4ce7-bcff-6563379cbe20", false, new DateTime(2021, 10, 22, 2, 29, 20, 172, DateTimeKind.Local).AddTicks(7020), 1L, "admin", null, "edfeb122-3656-483b-b477-17c827f44cd4" });

            migrationBuilder.InsertData(
                table: "user_role",
                columns: new[] { "role_id", "user_id", "created_at", "created_by", "updated_at", "updated_by" },
                values: new object[,]
                {
                    { 1L, 1L, null, 0L, null, 0L },
                    { 2L, 1L, null, 0L, null, 0L },
                    { 3L, 1L, null, 0L, null, 0L },
                    { 4L, 1L, null, 0L, null, 0L },
                    { 5L, 1L, null, 0L, null, 0L }
                });

            migrationBuilder.CreateIndex(
                name: "announcement_data_announcement_id_foreign",
                table: "announcement_data",
                column: "announcement_id");

            migrationBuilder.CreateIndex(
                name: "announcement_users_announcement_id_foreign",
                table: "announcement_users",
                column: "announcement_id");

            migrationBuilder.CreateIndex(
                name: "announcement_users_user_id_foreign",
                table: "announcement_users",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "bundle_courses_bundle_id_foreign",
                table: "bundle_courses",
                column: "bundle_id");

            migrationBuilder.CreateIndex(
                name: "bundle_courses_course_id_foreign",
                table: "bundle_courses",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "bundle_enrols_bundle_id_foreign",
                table: "bundle_enrols",
                column: "bundle_id");

            migrationBuilder.CreateIndex(
                name: "bundle_enrols_user_id_foreign",
                table: "bundle_enrols",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "bundles_instructor_id_foreign",
                table: "bundles",
                column: "instructor_id");

            migrationBuilder.CreateIndex(
                name: "certificates_course_id_foreign",
                table: "certificates",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "certificates_user_id_foreign",
                table: "certificates",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "class_data_course_class_id_foreign",
                table: "class_data",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_document_course_class_id_foreign",
                table: "class_document",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_document_document_id_foreign",
                table: "class_document",
                column: "document_id");

            migrationBuilder.CreateIndex(
                name: "class_media_course_class_id_foreign",
                table: "class_media",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_media_media_id_foreign",
                table: "class_media",
                column: "media_id");

            migrationBuilder.CreateIndex(
                name: "class_meta_course_class_id_foreign",
                table: "class_meta",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_course_class_id_foreign",
                table: "class_quiz",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_quiz_id_foreign",
                table: "class_quiz",
                column: "quiz_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_answers_class_quiz_take_id_foreign",
                table: "class_quiz_answers",
                column: "class_quiz_take_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_answers_option_id_foreign",
                table: "class_quiz_answers",
                column: "option_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_answers_question_id_foreign",
                table: "class_quiz_answers",
                column: "question_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_takes_class_quiz_id_foreign",
                table: "class_quiz_takes",
                column: "class_quiz_id");

            migrationBuilder.CreateIndex(
                name: "class_quiz_takes_user_id_foreign",
                table: "class_quiz_takes",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "class_user_meta_course_class_id_foreign",
                table: "class_user_meta",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "class_user_meta_user_id_foreign",
                table: "class_user_meta",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "course_category_category_id_foreign",
                table: "course_category",
                column: "category_id");

            migrationBuilder.CreateIndex(
                name: "course_category_course_id_foreign",
                table: "course_category",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_classes_course_id_foreign",
                table: "course_classes",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_classes_section_id_foreign",
                table: "course_classes",
                column: "section_id");

            migrationBuilder.CreateIndex(
                name: "course_data_course_id_foreign",
                table: "course_data",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_department_course_id_foreign",
                table: "course_department",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_department_group_id_foreign",
                table: "course_department",
                column: "group_id");

            migrationBuilder.CreateIndex(
                name: "course_document_course_id_foreign",
                table: "course_document",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_document_document_id_foreign",
                table: "course_document",
                column: "document_id");

            migrationBuilder.CreateIndex(
                name: "course_enrols_course_id_foreign",
                table: "course_enrols",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_enrols_user_id_foreign",
                table: "course_enrols",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "course_image_course_id_foreign",
                table: "course_image",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_image_image_id_foreign",
                table: "course_image",
                column: "image_id");

            migrationBuilder.CreateIndex(
                name: "course_media_course_id_foreign",
                table: "course_media",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "course_media_media_id_foreign",
                table: "course_media",
                column: "media_id");

            migrationBuilder.CreateIndex(
                name: "course_meta_course_id_foreign",
                table: "course_meta",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "courses_instructor_id_foreign",
                table: "courses",
                column: "instructor_id");

            migrationBuilder.CreateIndex(
                name: "documents_uid_unique",
                table: "documents",
                column: "uid",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "groups__id_unique",
                table: "groups",
                column: "_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "groups_name_unique",
                table: "groups",
                column: "name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "images_uid_unique",
                table: "images",
                column: "uid",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "jobs_queue_index",
                table: "jobs",
                column: "queue");

            migrationBuilder.CreateIndex(
                name: "media_uid_unique",
                table: "media",
                column: "uid",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "notes_course_class_id_foreign",
                table: "notes",
                column: "course_class_id");

            migrationBuilder.CreateIndex(
                name: "notes_user_id_foreign",
                table: "notes",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "options_question_id_foreign",
                table: "options",
                column: "question_id");

            migrationBuilder.CreateIndex(
                name: "password_resets_email_index",
                table: "password_resets",
                column: "email");

            migrationBuilder.CreateIndex(
                name: "profile_pictures__id_unique",
                table: "profile_pictures",
                column: "_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "questions_quiz_id_foreign",
                table: "questions",
                column: "quiz_id");

            migrationBuilder.CreateIndex(
                name: "ratings_course_id_foreign",
                table: "ratings",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "ratings_user_id_foreign",
                table: "ratings",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "IX_role_claims_RoleId",
                table: "role_claims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_roles_UserId",
                table: "roles",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "roles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "roles__id_unique",
                table: "roles",
                column: "_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "roles_level_unique",
                table: "roles",
                column: "level",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "roles_name_unique",
                table: "roles",
                column: "name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "sections_course_id_foreign",
                table: "sections",
                column: "course_id");

            migrationBuilder.CreateIndex(
                name: "subtitles_uid_unique",
                table: "subtitles",
                column: "uid",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_user_claims_UserId",
                table: "user_claims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "user_group_group_id_foreign",
                table: "user_group",
                column: "group_id");

            migrationBuilder.CreateIndex(
                name: "user_group_user_id_foreign",
                table: "user_group",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "user_info_user_id_foreign",
                table: "user_info",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "IX_user_logins_UserId",
                table: "user_logins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_user_role_role_id",
                table: "user_role",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "user_security_question_security_question_id_foreign",
                table: "user_security_question",
                column: "security_question_id");

            migrationBuilder.CreateIndex(
                name: "user_security_question_user_id_foreign",
                table: "user_security_question",
                column: "user_id");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "users",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "users",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "users__id_unique",
                table: "users",
                column: "_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "users_email_unique",
                table: "users",
                column: "email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "users_username_unique",
                table: "users",
                column: "username",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "announcement_data");

            migrationBuilder.DropTable(
                name: "announcement_users");

            migrationBuilder.DropTable(
                name: "bundle_courses");

            migrationBuilder.DropTable(
                name: "bundle_enrols");

            migrationBuilder.DropTable(
                name: "certificates");

            migrationBuilder.DropTable(
                name: "class_data");

            migrationBuilder.DropTable(
                name: "class_document");

            migrationBuilder.DropTable(
                name: "class_media");

            migrationBuilder.DropTable(
                name: "class_meta");

            migrationBuilder.DropTable(
                name: "class_quiz_answers");

            migrationBuilder.DropTable(
                name: "class_user_meta");

            migrationBuilder.DropTable(
                name: "course_category");

            migrationBuilder.DropTable(
                name: "course_data");

            migrationBuilder.DropTable(
                name: "course_department");

            migrationBuilder.DropTable(
                name: "course_document");

            migrationBuilder.DropTable(
                name: "course_enrols");

            migrationBuilder.DropTable(
                name: "course_image");

            migrationBuilder.DropTable(
                name: "course_media");

            migrationBuilder.DropTable(
                name: "course_meta");

            migrationBuilder.DropTable(
                name: "failed_jobs");

            migrationBuilder.DropTable(
                name: "jobs");

            migrationBuilder.DropTable(
                name: "migrations");

            migrationBuilder.DropTable(
                name: "notes");

            migrationBuilder.DropTable(
                name: "password_resets");

            migrationBuilder.DropTable(
                name: "profile_pictures");

            migrationBuilder.DropTable(
                name: "ratings");

            migrationBuilder.DropTable(
                name: "role_claims");

            migrationBuilder.DropTable(
                name: "settings");

            migrationBuilder.DropTable(
                name: "subtitles");

            migrationBuilder.DropTable(
                name: "tags");

            migrationBuilder.DropTable(
                name: "user_claims");

            migrationBuilder.DropTable(
                name: "user_group");

            migrationBuilder.DropTable(
                name: "user_info");

            migrationBuilder.DropTable(
                name: "user_logins");

            migrationBuilder.DropTable(
                name: "user_role");

            migrationBuilder.DropTable(
                name: "user_security_question");

            migrationBuilder.DropTable(
                name: "user_tokens");

            migrationBuilder.DropTable(
                name: "announcements");

            migrationBuilder.DropTable(
                name: "bundles");

            migrationBuilder.DropTable(
                name: "class_quiz_takes");

            migrationBuilder.DropTable(
                name: "options");

            migrationBuilder.DropTable(
                name: "categories");

            migrationBuilder.DropTable(
                name: "documents");

            migrationBuilder.DropTable(
                name: "images");

            migrationBuilder.DropTable(
                name: "media");

            migrationBuilder.DropTable(
                name: "groups");

            migrationBuilder.DropTable(
                name: "roles");

            migrationBuilder.DropTable(
                name: "security_questions");

            migrationBuilder.DropTable(
                name: "class_quiz");

            migrationBuilder.DropTable(
                name: "questions");

            migrationBuilder.DropTable(
                name: "course_classes");

            migrationBuilder.DropTable(
                name: "quizzes");

            migrationBuilder.DropTable(
                name: "sections");

            migrationBuilder.DropTable(
                name: "courses");

            migrationBuilder.DropTable(
                name: "users");
        }
    }
}
