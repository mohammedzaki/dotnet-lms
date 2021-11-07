/*
 Navicat Premium Data Transfer

 Source Server         : DOC-MSSQL
 Source Server Type    : SQL Server
 Source Server Version : 14003411
 Source Host           : 0.0.0.0:1433
 Source Catalog        : DigitalHubLMS_DB3
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14003411
 File Encoding         : 65001

 Date: 07/11/2021 09:45:30
*/


-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__EFMigrationsHistory]
GO

CREATE TABLE [dbo].[__EFMigrationsHistory] (
  [MigrationId] nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[__EFMigrationsHistory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of __EFMigrationsHistory
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[__EFMigrationsHistory] VALUES (N'20211107073746_InitialCreate', N'5.0.5')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for announcement_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[announcement_data]') AND type IN ('U'))
	DROP TABLE [dbo].[announcement_data]
GO

CREATE TABLE [dbo].[announcement_data] (
  [id] bigint  NOT NULL,
  [announcement_id] bigint  NOT NULL,
  [data] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[announcement_data] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for announcement_users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[announcement_users]') AND type IN ('U'))
	DROP TABLE [dbo].[announcement_users]
GO

CREATE TABLE [dbo].[announcement_users] (
  [id] bigint  NOT NULL,
  [announcement_id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [read] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[announcement_users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for announcements
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[announcements]') AND type IN ('U'))
	DROP TABLE [dbo].[announcements]
GO

CREATE TABLE [dbo].[announcements] (
  [id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [message] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [priority] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_by] bigint  NULL,
  [updated_by] bigint  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[announcements] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for bundle_courses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bundle_courses]') AND type IN ('U'))
	DROP TABLE [dbo].[bundle_courses]
GO

CREATE TABLE [dbo].[bundle_courses] (
  [id] bigint  NOT NULL,
  [bundle_id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[bundle_courses] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for bundle_enrols
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bundle_enrols]') AND type IN ('U'))
	DROP TABLE [dbo].[bundle_enrols]
GO

CREATE TABLE [dbo].[bundle_enrols] (
  [id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [bundle_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[bundle_enrols] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for bundles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[bundles]') AND type IN ('U'))
	DROP TABLE [dbo].[bundles]
GO

CREATE TABLE [dbo].[bundles] (
  [id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [short_description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [outcomes] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [language] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [slug] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [requirements] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [level] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_by] int  NULL,
  [instructor_id] bigint  NOT NULL,
  [thumbnail] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [is_top_course] int  NULL,
  [is_admin] int  NULL,
  [published] bit  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[bundles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for categories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[categories]') AND type IN ('U'))
	DROP TABLE [dbo].[categories]
GO

CREATE TABLE [dbo].[categories] (
  [id] bigint  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [parent] int  NULL,
  [slug] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [thumbnail] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [short_description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [icon] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[categories] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for certificates
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[certificates]') AND type IN ('U'))
	DROP TABLE [dbo].[certificates]
GO

CREATE TABLE [dbo].[certificates] (
  [id] bigint  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [slug] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [user_id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [status] bit  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[certificates] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'1-published 0-Not Published',
'SCHEMA', N'dbo',
'TABLE', N'certificates',
'COLUMN', N'status'
GO


-- ----------------------------
-- Table structure for class_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_data]') AND type IN ('U'))
	DROP TABLE [dbo].[class_data]
GO

CREATE TABLE [dbo].[class_data] (
  [id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [data] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_data] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_document
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_document]') AND type IN ('U'))
	DROP TABLE [dbo].[class_document]
GO

CREATE TABLE [dbo].[class_document] (
  [id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [document_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_document] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_media
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_media]') AND type IN ('U'))
	DROP TABLE [dbo].[class_media]
GO

CREATE TABLE [dbo].[class_media] (
  [id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [media_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_media] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_meta
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_meta]') AND type IN ('U'))
	DROP TABLE [dbo].[class_meta]
GO

CREATE TABLE [dbo].[class_meta] (
  [id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [meta_key] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [meta_value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_meta] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_quiz
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_quiz]') AND type IN ('U'))
	DROP TABLE [dbo].[class_quiz]
GO

CREATE TABLE [dbo].[class_quiz] (
  [id] bigint  NOT NULL,
  [quiz_id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_quiz] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_quiz_answers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_quiz_answers]') AND type IN ('U'))
	DROP TABLE [dbo].[class_quiz_answers]
GO

CREATE TABLE [dbo].[class_quiz_answers] (
  [id] bigint  NOT NULL,
  [class_quiz_take_id] bigint  NOT NULL,
  [question_id] bigint  NOT NULL,
  [option_id] bigint  NOT NULL,
  [attempt] smallint  NOT NULL,
  [score] smallint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_quiz_answers] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_quiz_takes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_quiz_takes]') AND type IN ('U'))
	DROP TABLE [dbo].[class_quiz_takes]
GO

CREATE TABLE [dbo].[class_quiz_takes] (
  [id] bigint  NOT NULL,
  [class_quiz_id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [quiz_result] int  NULL,
  [attempt] int  NOT NULL,
  [score] smallint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_quiz_takes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for class_user_meta
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[class_user_meta]') AND type IN ('U'))
	DROP TABLE [dbo].[class_user_meta]
GO

CREATE TABLE [dbo].[class_user_meta] (
  [id] bigint  NOT NULL,
  [course_class_id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [completed] int  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_user_meta] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_category]') AND type IN ('U'))
	DROP TABLE [dbo].[course_category]
GO

CREATE TABLE [dbo].[course_category] (
  [id] bigint  NOT NULL,
  [category_id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_category] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_classes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_classes]') AND type IN ('U'))
	DROP TABLE [dbo].[course_classes]
GO

CREATE TABLE [dbo].[course_classes] (
  [id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [duration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [course_id] bigint  NOT NULL,
  [section_id] bigint  NOT NULL,
  [type] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [order] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_classes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_data
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_data]') AND type IN ('U'))
	DROP TABLE [dbo].[course_data]
GO

CREATE TABLE [dbo].[course_data] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [data] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_data] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_department]') AND type IN ('U'))
	DROP TABLE [dbo].[course_department]
GO

CREATE TABLE [dbo].[course_department] (
  [id] bigint  NOT NULL,
  [group_id] bigint  NOT NULL,
  [course_id] bigint  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_department] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_document
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_document]') AND type IN ('U'))
	DROP TABLE [dbo].[course_document]
GO

CREATE TABLE [dbo].[course_document] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [document_id] bigint  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_document] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_enrols
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_enrols]') AND type IN ('U'))
	DROP TABLE [dbo].[course_enrols]
GO

CREATE TABLE [dbo].[course_enrols] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NULL,
  [user_id] bigint  NOT NULL,
  [current_class] bigint  NULL,
  [progress] bigint  NULL,
  [type] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_enrols] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_image
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_image]') AND type IN ('U'))
	DROP TABLE [dbo].[course_image]
GO

CREATE TABLE [dbo].[course_image] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [image_id] bigint  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_image] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_media
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_media]') AND type IN ('U'))
	DROP TABLE [dbo].[course_media]
GO

CREATE TABLE [dbo].[course_media] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [media_id] bigint  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_media] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for course_meta
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[course_meta]') AND type IN ('U'))
	DROP TABLE [dbo].[course_meta]
GO

CREATE TABLE [dbo].[course_meta] (
  [id] bigint  NOT NULL,
  [course_id] bigint  NOT NULL,
  [meta_key] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [meta_value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_meta] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for courses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[courses]') AND type IN ('U'))
	DROP TABLE [dbo].[courses]
GO

CREATE TABLE [dbo].[courses] (
  [id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [short_description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [slug] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_by] int  NULL,
  [updated_by] int  NULL,
  [instructor_id] bigint  NOT NULL,
  [thumbnail] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [published] bit  NOT NULL,
  [duration] int  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[courses] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for documents
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[documents]') AND type IN ('U'))
	DROP TABLE [dbo].[documents]
GO

CREATE TABLE [dbo].[documents] (
  [id] bigint  NOT NULL,
  [uid] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] bit  NOT NULL,
  [downloads] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[documents] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for groups
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type IN ('U'))
	DROP TABLE [dbo].[groups]
GO

CREATE TABLE [dbo].[groups] (
  [id] bigint  NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_ldap] bit  NOT NULL,
  [is_active] bit  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[groups] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for images
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[images]') AND type IN ('U'))
	DROP TABLE [dbo].[images]
GO

CREATE TABLE [dbo].[images] (
  [id] bigint  NOT NULL,
  [uid] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] bit  NOT NULL,
  [downloads] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[images] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for media
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[media]') AND type IN ('U'))
	DROP TABLE [dbo].[media]
GO

CREATE TABLE [dbo].[media] (
  [id] bigint  NOT NULL,
  [uid] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [quality] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [duration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] bit  NOT NULL,
  [downloads] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[media] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for migrations
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[migrations]') AND type IN ('U'))
	DROP TABLE [dbo].[migrations]
GO

CREATE TABLE [dbo].[migrations] (
  [id] bigint  NOT NULL,
  [migration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [batch] int  NOT NULL
)
GO

ALTER TABLE [dbo].[migrations] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for notes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[notes]') AND type IN ('U'))
	DROP TABLE [dbo].[notes]
GO

CREATE TABLE [dbo].[notes] (
  [id] bigint  NOT NULL,
  [body] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [course_class_id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[notes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for options
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[options]') AND type IN ('U'))
	DROP TABLE [dbo].[options]
GO

CREATE TABLE [dbo].[options] (
  [id] bigint  NOT NULL,
  [option] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [question_id] bigint  NOT NULL,
  [correct] bit  NOT NULL,
  [order] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[options] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for profile_pictures
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[profile_pictures]') AND type IN ('U'))
	DROP TABLE [dbo].[profile_pictures]
GO

CREATE TABLE [dbo].[profile_pictures] (
  [id] bigint  NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [user_id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[profile_pictures] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for questions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[questions]') AND type IN ('U'))
	DROP TABLE [dbo].[questions]
GO

CREATE TABLE [dbo].[questions] (
  [id] bigint  NOT NULL,
  [question] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [quiz_id] bigint  NOT NULL,
  [order] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[questions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for quizzes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[quizzes]') AND type IN ('U'))
	DROP TABLE [dbo].[quizzes]
GO

CREATE TABLE [dbo].[quizzes] (
  [id] bigint  NOT NULL,
  [title] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[quizzes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for ratings
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ratings]') AND type IN ('U'))
	DROP TABLE [dbo].[ratings]
GO

CREATE TABLE [dbo].[ratings] (
  [id] bigint  NOT NULL,
  [rating] float(53)  NULL,
  [course_id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [review] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[ratings] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for role_claims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[role_claims]') AND type IN ('U'))
	DROP TABLE [dbo].[role_claims]
GO

CREATE TABLE [dbo].[role_claims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [RoleId] bigint  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[role_claims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for roles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[roles]') AND type IN ('U'))
	DROP TABLE [dbo].[roles]
GO

CREATE TABLE [dbo].[roles] (
  [id] bigint  NOT NULL,
  [is_active] bit  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL,
  [name] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[roles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[roles] VALUES (N'1', N'1', N'1', N'1', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, N'system', N'SYSTEM', N'167860ad-4ade-4725-92b9-d8b57815b919')
GO

INSERT INTO [dbo].[roles] VALUES (N'2', N'1', N'1', N'1', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, N'admin', N'ADMIN', N'167860ad-4ade-4725-92b9-d8b57815b919')
GO

INSERT INTO [dbo].[roles] VALUES (N'3', N'1', N'1', N'1', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, N'supervisor', N'SUPERVISOR', N'167860ad-4ade-4725-92b9-d8b57815b919')
GO

INSERT INTO [dbo].[roles] VALUES (N'4', N'1', N'1', N'1', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, N'instructor', N'INSTRUCTOR', N'167860ad-4ade-4725-92b9-d8b57815b919')
GO

INSERT INTO [dbo].[roles] VALUES (N'5', N'1', N'1', N'1', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, N'employee', N'EMPLOYEE', N'167860ad-4ade-4725-92b9-d8b57815b919')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for sections
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sections]') AND type IN ('U'))
	DROP TABLE [dbo].[sections]
GO

CREATE TABLE [dbo].[sections] (
  [id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [course_id] bigint  NOT NULL,
  [order] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sections] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for security_questions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[security_questions]') AND type IN ('U'))
	DROP TABLE [dbo].[security_questions]
GO

CREATE TABLE [dbo].[security_questions] (
  [id] bigint  NOT NULL,
  [question] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[security_questions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of security_questions
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[security_questions] VALUES (N'1', N'What was the street name you lived in as a child?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'2', N'What primary school did you attend?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'3', N'In what city or town was your first job?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'4', N'What was the make and model of your first car?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'5', N'What is your oldest cousin''s first and last name?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'6', N'What was the street name you lived in as a child?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'7', N'What primary school did you attend?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'8', N'In what city or town was your first job?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'9', N'What was the make and model of your first car?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'10', N'What is your oldest cousin''s first and last name?', N'2021-11-07 09:37:42', N'2021-11-07 09:37:42')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for settings
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[settings]') AND type IN ('U'))
	DROP TABLE [dbo].[settings]
GO

CREATE TABLE [dbo].[settings] (
  [id] bigint  NOT NULL,
  [key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[settings] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for subtitles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[subtitles]') AND type IN ('U'))
	DROP TABLE [dbo].[subtitles]
GO

CREATE TABLE [dbo].[subtitles] (
  [id] bigint  NOT NULL,
  [uid] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[subtitles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for tags
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tags]') AND type IN ('U'))
	DROP TABLE [dbo].[tags]
GO

CREATE TABLE [dbo].[tags] (
  [id] bigint  NOT NULL,
  [tag] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tagable_id] int  NULL,
  [tagable_type] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [slug] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[tags] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_claims
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_claims]') AND type IN ('U'))
	DROP TABLE [dbo].[user_claims]
GO

CREATE TABLE [dbo].[user_claims] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [UserId] bigint  NOT NULL,
  [ClaimType] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ClaimValue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[user_claims] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_group
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_group]') AND type IN ('U'))
	DROP TABLE [dbo].[user_group]
GO

CREATE TABLE [dbo].[user_group] (
  [id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [group_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[user_group] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_info]') AND type IN ('U'))
	DROP TABLE [dbo].[user_info]
GO

CREATE TABLE [dbo].[user_info] (
  [id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [title] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[user_info] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_logins
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_logins]') AND type IN ('U'))
	DROP TABLE [dbo].[user_logins]
GO

CREATE TABLE [dbo].[user_logins] (
  [LoginProvider] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderKey] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderDisplayName] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [UserId] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[user_logins] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[user_role]
GO

CREATE TABLE [dbo].[user_role] (
  [user_id] bigint  NOT NULL,
  [role_id] bigint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'1', N'0', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'2', N'0', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'3', N'0', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'4', N'0', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'5', N'0', N'0', NULL, NULL)
GO

COMMIT
GO


-- ----------------------------
-- Table structure for user_security_question
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_security_question]') AND type IN ('U'))
	DROP TABLE [dbo].[user_security_question]
GO

CREATE TABLE [dbo].[user_security_question] (
  [id] bigint  NOT NULL,
  [user_id] bigint  NOT NULL,
  [security_question_id] bigint  NOT NULL,
  [security_answer] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[user_security_question] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for user_tokens
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_tokens]') AND type IN ('U'))
	DROP TABLE [dbo].[user_tokens]
GO

CREATE TABLE [dbo].[user_tokens] (
  [UserId] bigint  NOT NULL,
  [LoginProvider] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(450) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Value] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[user_tokens] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [api_key] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [is_ldap] bit  NOT NULL,
  [first_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [last_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [is_banned] bit  NOT NULL,
  [is_verified] bit  NOT NULL,
  [confirm_code] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [confirmed_at] datetime2(0)  NULL,
  [password_changed_at] datetime2(0)  NULL,
  [display_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [user_url] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [remember_token] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] date  NULL,
  [otp] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [otp_created_at] datetime2(0)  NULL,
  [profile_picture_id] bigint  NULL,
  [username] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedUserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [NormalizedEmail] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EmailConfirmed] bit  NOT NULL,
  [PasswordHash] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SecurityStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ConcurrencyStamp] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumber] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PhoneNumberConfirmed] bit  NOT NULL,
  [TwoFactorEnabled] bit  NOT NULL,
  [LockoutEnd] datetimeoffset(7)  NULL,
  [LockoutEnabled] bit  NOT NULL,
  [AccessFailedCount] int  NOT NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[users] ON
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [is_ldap], [first_name], [last_name], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [username], [NormalizedUserName], [email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1', N'edfeb122-3656-483b-b477-17c827f44cd4', NULL, N'0', N'Abe', N'Sal', N'0', N'0', N'1234                                ', NULL, N'2021-11-07 09:37:42', N'Abdalla Salah', NULL, N'1', N'1', NULL, N'2021-11-07 09:37:42', N'2021-11-07 09:37:42', NULL, NULL, NULL, NULL, N'admin', N'ADMIN', N'ahmed.kamal@mped.gov.eg', N'AHMED.KAMAL@MPED.GOV.EG', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

SET IDENTITY_INSERT [dbo].[users] OFF
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE [dbo].[__EFMigrationsHistory] ADD CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table announcement_data
-- ----------------------------
CREATE NONCLUSTERED INDEX [announcement_data_announcement_id_foreign]
ON [dbo].[announcement_data] (
  [announcement_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table announcement_data
-- ----------------------------
ALTER TABLE [dbo].[announcement_data] ADD CONSTRAINT [PK_announcement_data] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table announcement_users
-- ----------------------------
CREATE NONCLUSTERED INDEX [announcement_users_announcement_id_foreign]
ON [dbo].[announcement_users] (
  [announcement_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [announcement_users_user_id_foreign]
ON [dbo].[announcement_users] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table announcement_users
-- ----------------------------
ALTER TABLE [dbo].[announcement_users] ADD CONSTRAINT [PK_announcement_users] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table announcements
-- ----------------------------
ALTER TABLE [dbo].[announcements] ADD CONSTRAINT [PK_announcements] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table bundle_courses
-- ----------------------------
CREATE NONCLUSTERED INDEX [bundle_courses_bundle_id_foreign]
ON [dbo].[bundle_courses] (
  [bundle_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [bundle_courses_course_id_foreign]
ON [dbo].[bundle_courses] (
  [course_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table bundle_courses
-- ----------------------------
ALTER TABLE [dbo].[bundle_courses] ADD CONSTRAINT [PK_bundle_courses] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table bundle_enrols
-- ----------------------------
CREATE NONCLUSTERED INDEX [bundle_enrols_bundle_id_foreign]
ON [dbo].[bundle_enrols] (
  [bundle_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [bundle_enrols_user_id_foreign]
ON [dbo].[bundle_enrols] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table bundle_enrols
-- ----------------------------
ALTER TABLE [dbo].[bundle_enrols] ADD CONSTRAINT [PK_bundle_enrols] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table bundles
-- ----------------------------
CREATE NONCLUSTERED INDEX [bundles_instructor_id_foreign]
ON [dbo].[bundles] (
  [instructor_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table bundles
-- ----------------------------
ALTER TABLE [dbo].[bundles] ADD CONSTRAINT [PK_bundles] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE [dbo].[categories] ADD CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table certificates
-- ----------------------------
CREATE NONCLUSTERED INDEX [certificates_course_id_foreign]
ON [dbo].[certificates] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [certificates_user_id_foreign]
ON [dbo].[certificates] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table certificates
-- ----------------------------
ALTER TABLE [dbo].[certificates] ADD CONSTRAINT [PK_certificates] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_data
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_data_course_class_id_foreign]
ON [dbo].[class_data] (
  [course_class_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_data
-- ----------------------------
ALTER TABLE [dbo].[class_data] ADD CONSTRAINT [PK_class_data] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_document
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_document_course_class_id_foreign]
ON [dbo].[class_document] (
  [course_class_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_document_document_id_foreign]
ON [dbo].[class_document] (
  [document_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_document
-- ----------------------------
ALTER TABLE [dbo].[class_document] ADD CONSTRAINT [PK_class_document] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_media
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_media_course_class_id_foreign]
ON [dbo].[class_media] (
  [course_class_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_media_media_id_foreign]
ON [dbo].[class_media] (
  [media_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_media
-- ----------------------------
ALTER TABLE [dbo].[class_media] ADD CONSTRAINT [PK_class_media] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_meta
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_meta_course_class_id_foreign]
ON [dbo].[class_meta] (
  [course_class_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_meta
-- ----------------------------
ALTER TABLE [dbo].[class_meta] ADD CONSTRAINT [PK_class_meta] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_quiz
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_quiz_course_class_id_foreign]
ON [dbo].[class_quiz] (
  [course_class_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_quiz_quiz_id_foreign]
ON [dbo].[class_quiz] (
  [quiz_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_quiz
-- ----------------------------
ALTER TABLE [dbo].[class_quiz] ADD CONSTRAINT [PK_class_quiz] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_quiz_answers
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_quiz_answers_class_quiz_take_id_foreign]
ON [dbo].[class_quiz_answers] (
  [class_quiz_take_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_quiz_answers_option_id_foreign]
ON [dbo].[class_quiz_answers] (
  [option_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_quiz_answers_question_id_foreign]
ON [dbo].[class_quiz_answers] (
  [question_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_quiz_answers
-- ----------------------------
ALTER TABLE [dbo].[class_quiz_answers] ADD CONSTRAINT [PK_class_quiz_answers] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_quiz_takes
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_quiz_takes_class_quiz_id_foreign]
ON [dbo].[class_quiz_takes] (
  [class_quiz_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_quiz_takes_user_id_foreign]
ON [dbo].[class_quiz_takes] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_quiz_takes
-- ----------------------------
ALTER TABLE [dbo].[class_quiz_takes] ADD CONSTRAINT [PK_class_quiz_takes] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table class_user_meta
-- ----------------------------
CREATE NONCLUSTERED INDEX [class_user_meta_course_class_id_foreign]
ON [dbo].[class_user_meta] (
  [course_class_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [class_user_meta_user_id_foreign]
ON [dbo].[class_user_meta] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table class_user_meta
-- ----------------------------
ALTER TABLE [dbo].[class_user_meta] ADD CONSTRAINT [PK_class_user_meta] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_category
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_category_category_id_foreign]
ON [dbo].[course_category] (
  [category_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_category_course_id_foreign]
ON [dbo].[course_category] (
  [course_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_category
-- ----------------------------
ALTER TABLE [dbo].[course_category] ADD CONSTRAINT [PK_course_category] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_classes
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_classes_course_id_foreign]
ON [dbo].[course_classes] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_classes_section_id_foreign]
ON [dbo].[course_classes] (
  [section_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_classes
-- ----------------------------
ALTER TABLE [dbo].[course_classes] ADD CONSTRAINT [PK_course_classes] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_data
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_data_course_id_foreign]
ON [dbo].[course_data] (
  [course_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_data
-- ----------------------------
ALTER TABLE [dbo].[course_data] ADD CONSTRAINT [PK_course_data] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_department
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_department_course_id_foreign]
ON [dbo].[course_department] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_department_group_id_foreign]
ON [dbo].[course_department] (
  [group_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_department
-- ----------------------------
ALTER TABLE [dbo].[course_department] ADD CONSTRAINT [PK_course_department] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_document
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_document_course_id_foreign]
ON [dbo].[course_document] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_document_document_id_foreign]
ON [dbo].[course_document] (
  [document_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_document
-- ----------------------------
ALTER TABLE [dbo].[course_document] ADD CONSTRAINT [PK_course_document] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_enrols
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_enrols_course_id_foreign]
ON [dbo].[course_enrols] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_enrols_user_id_foreign]
ON [dbo].[course_enrols] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_enrols
-- ----------------------------
ALTER TABLE [dbo].[course_enrols] ADD CONSTRAINT [PK_course_enrols] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_image
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_image_course_id_foreign]
ON [dbo].[course_image] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_image_image_id_foreign]
ON [dbo].[course_image] (
  [image_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_image
-- ----------------------------
ALTER TABLE [dbo].[course_image] ADD CONSTRAINT [PK_course_image] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_media
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_media_course_id_foreign]
ON [dbo].[course_media] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [course_media_media_id_foreign]
ON [dbo].[course_media] (
  [media_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_media
-- ----------------------------
ALTER TABLE [dbo].[course_media] ADD CONSTRAINT [PK_course_media] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table course_meta
-- ----------------------------
CREATE NONCLUSTERED INDEX [course_meta_course_id_foreign]
ON [dbo].[course_meta] (
  [course_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table course_meta
-- ----------------------------
ALTER TABLE [dbo].[course_meta] ADD CONSTRAINT [PK_course_meta] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table courses
-- ----------------------------
CREATE NONCLUSTERED INDEX [courses_instructor_id_foreign]
ON [dbo].[courses] (
  [instructor_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table courses
-- ----------------------------
ALTER TABLE [dbo].[courses] ADD CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table documents
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [documents_uid_unique]
ON [dbo].[documents] (
  [uid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table documents
-- ----------------------------
ALTER TABLE [dbo].[documents] ADD CONSTRAINT [PK_documents] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table groups
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [groups__id_unique]
ON [dbo].[groups] (
  [_id] ASC
)
WHERE ([_id] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [groups_name_unique]
ON [dbo].[groups] (
  [name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table groups
-- ----------------------------
ALTER TABLE [dbo].[groups] ADD CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table images
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [images_uid_unique]
ON [dbo].[images] (
  [uid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table images
-- ----------------------------
ALTER TABLE [dbo].[images] ADD CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table media
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [media_uid_unique]
ON [dbo].[media] (
  [uid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table media
-- ----------------------------
ALTER TABLE [dbo].[media] ADD CONSTRAINT [PK_media] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE [dbo].[migrations] ADD CONSTRAINT [PK_migrations] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table notes
-- ----------------------------
CREATE NONCLUSTERED INDEX [notes_course_class_id_foreign]
ON [dbo].[notes] (
  [course_class_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [notes_user_id_foreign]
ON [dbo].[notes] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table notes
-- ----------------------------
ALTER TABLE [dbo].[notes] ADD CONSTRAINT [PK_notes] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table options
-- ----------------------------
CREATE NONCLUSTERED INDEX [options_question_id_foreign]
ON [dbo].[options] (
  [question_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table options
-- ----------------------------
ALTER TABLE [dbo].[options] ADD CONSTRAINT [PK_options] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table profile_pictures
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [profile_pictures__id_unique]
ON [dbo].[profile_pictures] (
  [_id] ASC
)
WHERE ([_id] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table profile_pictures
-- ----------------------------
ALTER TABLE [dbo].[profile_pictures] ADD CONSTRAINT [PK_profile_pictures] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table questions
-- ----------------------------
CREATE NONCLUSTERED INDEX [questions_quiz_id_foreign]
ON [dbo].[questions] (
  [quiz_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table questions
-- ----------------------------
ALTER TABLE [dbo].[questions] ADD CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table quizzes
-- ----------------------------
ALTER TABLE [dbo].[quizzes] ADD CONSTRAINT [PK_quizzes] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ratings
-- ----------------------------
CREATE NONCLUSTERED INDEX [ratings_course_id_foreign]
ON [dbo].[ratings] (
  [course_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [ratings_user_id_foreign]
ON [dbo].[ratings] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ratings
-- ----------------------------
ALTER TABLE [dbo].[ratings] ADD CONSTRAINT [PK_ratings] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table role_claims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_role_claims_RoleId]
ON [dbo].[role_claims] (
  [RoleId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table role_claims
-- ----------------------------
ALTER TABLE [dbo].[role_claims] ADD CONSTRAINT [PK_role_claims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
ON [dbo].[roles] (
  [NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [roles_name_unique]
ON [dbo].[roles] (
  [name] ASC
)
WHERE ([name] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE [dbo].[roles] ADD CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sections
-- ----------------------------
CREATE NONCLUSTERED INDEX [sections_course_id_foreign]
ON [dbo].[sections] (
  [course_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sections
-- ----------------------------
ALTER TABLE [dbo].[sections] ADD CONSTRAINT [PK_sections] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table security_questions
-- ----------------------------
ALTER TABLE [dbo].[security_questions] ADD CONSTRAINT [PK_security_questions] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table settings
-- ----------------------------
ALTER TABLE [dbo].[settings] ADD CONSTRAINT [PK_settings] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table subtitles
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [subtitles_uid_unique]
ON [dbo].[subtitles] (
  [uid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table subtitles
-- ----------------------------
ALTER TABLE [dbo].[subtitles] ADD CONSTRAINT [PK_subtitles] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tags
-- ----------------------------
ALTER TABLE [dbo].[tags] ADD CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_claims
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_user_claims_UserId]
ON [dbo].[user_claims] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_claims
-- ----------------------------
ALTER TABLE [dbo].[user_claims] ADD CONSTRAINT [PK_user_claims] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_group
-- ----------------------------
CREATE NONCLUSTERED INDEX [user_group_group_id_foreign]
ON [dbo].[user_group] (
  [group_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [user_group_user_id_foreign]
ON [dbo].[user_group] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_group
-- ----------------------------
ALTER TABLE [dbo].[user_group] ADD CONSTRAINT [PK_user_group] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_info
-- ----------------------------
CREATE NONCLUSTERED INDEX [user_info_user_id_foreign]
ON [dbo].[user_info] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_info
-- ----------------------------
ALTER TABLE [dbo].[user_info] ADD CONSTRAINT [PK_user_info] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_logins
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_user_logins_UserId]
ON [dbo].[user_logins] (
  [UserId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_logins
-- ----------------------------
ALTER TABLE [dbo].[user_logins] ADD CONSTRAINT [PK_user_logins] PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_role
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_user_role_role_id]
ON [dbo].[user_role] (
  [role_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_role
-- ----------------------------
ALTER TABLE [dbo].[user_role] ADD CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED ([user_id], [role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table user_security_question
-- ----------------------------
CREATE NONCLUSTERED INDEX [user_security_question_security_question_id_foreign]
ON [dbo].[user_security_question] (
  [security_question_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [user_security_question_user_id_foreign]
ON [dbo].[user_security_question] (
  [user_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table user_security_question
-- ----------------------------
ALTER TABLE [dbo].[user_security_question] ADD CONSTRAINT [PK_user_security_question] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_tokens
-- ----------------------------
ALTER TABLE [dbo].[user_tokens] ADD CONSTRAINT [PK_user_tokens] PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE NONCLUSTERED INDEX [EmailIndex]
ON [dbo].[users] (
  [NormalizedEmail] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
ON [dbo].[users] (
  [NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [users__id_unique]
ON [dbo].[users] (
  [_id] ASC
)
WHERE ([_id] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique]
ON [dbo].[users] (
  [email] ASC
)
WHERE ([email] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [users_username_unique]
ON [dbo].[users] (
  [username] ASC
)
WHERE ([username] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table announcement_data
-- ----------------------------
ALTER TABLE [dbo].[announcement_data] ADD CONSTRAINT [announcement_data_announcement_id_foreign] FOREIGN KEY ([announcement_id]) REFERENCES [dbo].[announcements] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table announcement_users
-- ----------------------------
ALTER TABLE [dbo].[announcement_users] ADD CONSTRAINT [announcement_users_announcement_id_foreign] FOREIGN KEY ([announcement_id]) REFERENCES [dbo].[announcements] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[announcement_users] ADD CONSTRAINT [announcement_users_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table bundle_courses
-- ----------------------------
ALTER TABLE [dbo].[bundle_courses] ADD CONSTRAINT [bundle_courses_bundle_id_foreign] FOREIGN KEY ([bundle_id]) REFERENCES [dbo].[bundles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[bundle_courses] ADD CONSTRAINT [bundle_courses_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table bundle_enrols
-- ----------------------------
ALTER TABLE [dbo].[bundle_enrols] ADD CONSTRAINT [bundle_enrols_bundle_id_foreign] FOREIGN KEY ([bundle_id]) REFERENCES [dbo].[bundles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[bundle_enrols] ADD CONSTRAINT [bundle_enrols_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table bundles
-- ----------------------------
ALTER TABLE [dbo].[bundles] ADD CONSTRAINT [bundles_instructor_id_foreign] FOREIGN KEY ([instructor_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table certificates
-- ----------------------------
ALTER TABLE [dbo].[certificates] ADD CONSTRAINT [certificates_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[certificates] ADD CONSTRAINT [certificates_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_data
-- ----------------------------
ALTER TABLE [dbo].[class_data] ADD CONSTRAINT [class_data_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_document
-- ----------------------------
ALTER TABLE [dbo].[class_document] ADD CONSTRAINT [class_document_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_document] ADD CONSTRAINT [class_document_document_id_foreign] FOREIGN KEY ([document_id]) REFERENCES [dbo].[documents] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_media
-- ----------------------------
ALTER TABLE [dbo].[class_media] ADD CONSTRAINT [class_media_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_media] ADD CONSTRAINT [class_media_media_id_foreign] FOREIGN KEY ([media_id]) REFERENCES [dbo].[media] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_meta
-- ----------------------------
ALTER TABLE [dbo].[class_meta] ADD CONSTRAINT [class_meta_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_quiz
-- ----------------------------
ALTER TABLE [dbo].[class_quiz] ADD CONSTRAINT [class_quiz_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_quiz] ADD CONSTRAINT [FK_class_quiz_quizzes_quiz_id] FOREIGN KEY ([quiz_id]) REFERENCES [dbo].[quizzes] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_quiz_answers
-- ----------------------------
ALTER TABLE [dbo].[class_quiz_answers] ADD CONSTRAINT [class_quiz_answers_class_quiz_take_id_foreign] FOREIGN KEY ([class_quiz_take_id]) REFERENCES [dbo].[class_quiz_takes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_quiz_answers] ADD CONSTRAINT [class_quiz_answers_option_id_foreign] FOREIGN KEY ([option_id]) REFERENCES [dbo].[options] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_quiz_answers] ADD CONSTRAINT [class_quiz_answers_question_id_foreign] FOREIGN KEY ([question_id]) REFERENCES [dbo].[questions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_quiz_takes
-- ----------------------------
ALTER TABLE [dbo].[class_quiz_takes] ADD CONSTRAINT [class_quiz_takes_class_quiz_id_foreign] FOREIGN KEY ([class_quiz_id]) REFERENCES [dbo].[class_quiz] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_quiz_takes] ADD CONSTRAINT [class_quiz_takes_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table class_user_meta
-- ----------------------------
ALTER TABLE [dbo].[class_user_meta] ADD CONSTRAINT [class_user_meta_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_user_meta] ADD CONSTRAINT [class_user_meta_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_category
-- ----------------------------
ALTER TABLE [dbo].[course_category] ADD CONSTRAINT [course_category_category_id_foreign] FOREIGN KEY ([category_id]) REFERENCES [dbo].[categories] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_category] ADD CONSTRAINT [course_category_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_classes
-- ----------------------------
ALTER TABLE [dbo].[course_classes] ADD CONSTRAINT [course_classes_section_id_foreign] FOREIGN KEY ([section_id]) REFERENCES [dbo].[sections] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_data
-- ----------------------------
ALTER TABLE [dbo].[course_data] ADD CONSTRAINT [course_data_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_department
-- ----------------------------
ALTER TABLE [dbo].[course_department] ADD CONSTRAINT [course_department_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_department] ADD CONSTRAINT [course_department_group_id_foreign] FOREIGN KEY ([group_id]) REFERENCES [dbo].[groups] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_document
-- ----------------------------
ALTER TABLE [dbo].[course_document] ADD CONSTRAINT [course_document_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_document] ADD CONSTRAINT [course_document_document_id_foreign] FOREIGN KEY ([document_id]) REFERENCES [dbo].[documents] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_enrols
-- ----------------------------
ALTER TABLE [dbo].[course_enrols] ADD CONSTRAINT [course_enrols_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_enrols] ADD CONSTRAINT [course_enrols_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_image
-- ----------------------------
ALTER TABLE [dbo].[course_image] ADD CONSTRAINT [course_image_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_image] ADD CONSTRAINT [course_image_image_id_foreign] FOREIGN KEY ([image_id]) REFERENCES [dbo].[images] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_media
-- ----------------------------
ALTER TABLE [dbo].[course_media] ADD CONSTRAINT [course_media_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[course_media] ADD CONSTRAINT [course_media_media_id_foreign] FOREIGN KEY ([media_id]) REFERENCES [dbo].[media] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table course_meta
-- ----------------------------
ALTER TABLE [dbo].[course_meta] ADD CONSTRAINT [course_meta_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table courses
-- ----------------------------
ALTER TABLE [dbo].[courses] ADD CONSTRAINT [courses_instructor_id_foreign] FOREIGN KEY ([instructor_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table notes
-- ----------------------------
ALTER TABLE [dbo].[notes] ADD CONSTRAINT [notes_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[notes] ADD CONSTRAINT [notes_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table options
-- ----------------------------
ALTER TABLE [dbo].[options] ADD CONSTRAINT [options_question_id_foreign] FOREIGN KEY ([question_id]) REFERENCES [dbo].[questions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table questions
-- ----------------------------
ALTER TABLE [dbo].[questions] ADD CONSTRAINT [questions_quiz_id_foreign] FOREIGN KEY ([quiz_id]) REFERENCES [dbo].[quizzes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ratings
-- ----------------------------
ALTER TABLE [dbo].[ratings] ADD CONSTRAINT [ratings_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ratings] ADD CONSTRAINT [ratings_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table role_claims
-- ----------------------------
ALTER TABLE [dbo].[role_claims] ADD CONSTRAINT [FK_role_claims_roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[roles] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table sections
-- ----------------------------
ALTER TABLE [dbo].[sections] ADD CONSTRAINT [sections_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_claims
-- ----------------------------
ALTER TABLE [dbo].[user_claims] ADD CONSTRAINT [FK_user_claims_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[users] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_group
-- ----------------------------
ALTER TABLE [dbo].[user_group] ADD CONSTRAINT [user_group_group_id_foreign] FOREIGN KEY ([group_id]) REFERENCES [dbo].[groups] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_group] ADD CONSTRAINT [user_group_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_info
-- ----------------------------
ALTER TABLE [dbo].[user_info] ADD CONSTRAINT [user_info_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_logins
-- ----------------------------
ALTER TABLE [dbo].[user_logins] ADD CONSTRAINT [FK_user_logins_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[users] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_role
-- ----------------------------
ALTER TABLE [dbo].[user_role] ADD CONSTRAINT [user_role_role_id_foreign] FOREIGN KEY ([role_id]) REFERENCES [dbo].[roles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_role] ADD CONSTRAINT [user_role_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_security_question
-- ----------------------------
ALTER TABLE [dbo].[user_security_question] ADD CONSTRAINT [user_security_question_security_question_id_foreign] FOREIGN KEY ([security_question_id]) REFERENCES [dbo].[security_questions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_security_question] ADD CONSTRAINT [user_security_question_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_tokens
-- ----------------------------
ALTER TABLE [dbo].[user_tokens] ADD CONSTRAINT [FK_user_tokens_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[users] ([id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

