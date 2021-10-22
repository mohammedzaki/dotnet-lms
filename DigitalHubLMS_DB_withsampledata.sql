/*
 Navicat Premium Data Transfer

 Source Server         : DOC-MSSQL
 Source Server Type    : SQL Server
 Source Server Version : 14003411
 Source Host           : 0.0.0.0:1433
 Source Catalog        : DigitalHubLMS_DB
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14003411
 File Encoding         : 65001

 Date: 22/10/2021 03:30:29
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

INSERT INTO [dbo].[__EFMigrationsHistory] VALUES (N'20211022002920_InitialCreate', N'5.0.5')
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
-- Records of announcement_users
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[announcement_users] VALUES (N'1', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2021-05-04 12:39:06')
GO

INSERT INTO [dbo].[announcement_users] VALUES (N'2', N'2', N'1', N'0', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

COMMIT
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
-- Records of announcements
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[announcements] VALUES (N'1', N'User Announcement', N'New Update Has come to you please click here', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL)
GO

INSERT INTO [dbo].[announcements] VALUES (N'2', N'Group Announcement', N'New Update2 Has come to you please click here', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL)
GO

COMMIT
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
  [video_url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [is_top_course] int  NULL,
  [is_admin] int  NULL,
  [published] tinyint  NULL,
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
-- Records of categories
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[categories] VALUES (N'1', N'technology', N'0', N'technology', NULL, N'this For Tech dev short Description', N'this For Tech dev', N'tech', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[categories] VALUES (N'2', N'SEO', N'0', N'seo', NULL, N'this For SEO short Description', N'this For SEO', N'tech', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[categories] VALUES (N'3', N'Digital Markting', N'2', N'digital-markting', NULL, N'this For Digital Markting short Description', N'this For Digital Markting', N'tech', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[categories] VALUES (N'4', N'CRM', N'0', N'crm', NULL, N'this For crm short Description', N'this For crm', N'crm', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[categories] VALUES (N'5', N'Information Security', N'0', NULL, NULL, NULL, NULL, NULL, N'2020-12-23 15:14:10', N'2020-12-23 15:14:10')
GO

INSERT INTO [dbo].[categories] VALUES (N'6', N'IT', N'0', NULL, NULL, NULL, NULL, NULL, N'2021-01-04 16:42:09', N'2021-01-04 16:42:09')
GO

COMMIT
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
  [status] tinyint  NOT NULL,
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
-- Records of certificates
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[certificates] VALUES (N'1', N'72346b2c-a4da-44a4-9a1d-49f59eff0fc5', N'uOtptLHmYYvYwY7d', N'1', N'3', N'http://lms.mped.gov.eg/cert/72346b2c-a4da-44a4-9a1d-49f59eff0fc5.pdf', N'1', N'2021-01-04 16:57:53', N'2021-01-04 16:57:53')
GO

INSERT INTO [dbo].[certificates] VALUES (N'2', N'533be541-e1f9-497a-b079-f67c446dcb0d', N'IUQMJYFIrwFDybLK', N'4', N'4', N'http://lms.mped.gov.eg/cert/533be541-e1f9-497a-b079-f67c446dcb0d.pdf', N'1', N'2021-03-21 22:46:35', N'2021-03-21 22:46:35')
GO

INSERT INTO [dbo].[certificates] VALUES (N'3', N'15974029-0e05-4ffd-88be-4cd2a1612805', N'Edo22VwYrKTrbyJM', N'5', N'4', N'http://lms.mped.gov.eg/cert/15974029-0e05-4ffd-88be-4cd2a1612805.pdf', N'1', N'2021-04-03 13:44:53', N'2021-04-03 13:44:53')
GO

INSERT INTO [dbo].[certificates] VALUES (N'4', N'14cd80a5-9c5e-432d-9c9c-2b25186e705d', N'NZQ8fc0qgAvG1iRS', N'1', N'4', N'http://lms.mped.gov.eg/cert/14cd80a5-9c5e-432d-9c9c-2b25186e705d.pdf', N'1', N'2021-05-04 12:38:35', N'2021-05-04 12:38:35')
GO

INSERT INTO [dbo].[certificates] VALUES (N'5', N'c27b4221-da0b-41a1-b569-ad35a33413ea', N'8oJWKWgNoGiAupBw', N'1', N'4', N'http://lms.mped.gov.eg/cert/c27b4221-da0b-41a1-b569-ad35a33413ea.pdf', N'1', N'2021-05-04 12:38:35', N'2021-05-04 12:38:35')
GO

INSERT INTO [dbo].[certificates] VALUES (N'6', N'c159428c-a791-42f1-a79a-8eebdaacaad5', N'2qIyhKTmbAOiKTCa', N'5', N'3', N'http://lms.mped.gov.eg/cert/c159428c-a791-42f1-a79a-8eebdaacaad5.pdf', N'1', N'2021-06-17 09:07:17', N'2021-06-17 09:07:17')
GO

INSERT INTO [dbo].[certificates] VALUES (N'7', N'6953744e-529f-4d99-82c6-60d9b8367380', N'X3rvPkbcxuj8redq', N'5', N'3', N'http://lms.mped.gov.eg/cert/6953744e-529f-4d99-82c6-60d9b8367380.pdf', N'1', N'2021-06-17 09:07:17', N'2021-06-17 09:07:17')
GO

INSERT INTO [dbo].[certificates] VALUES (N'8', N'8348f4eb-8faa-4e32-85f6-c967cd0bd8de', N'MIhYGP2zHk2qIS4c', N'237', N'6', N'http://lms.mped.gov.eg/cert/8348f4eb-8faa-4e32-85f6-c967cd0bd8de.pdf', N'1', N'2021-06-22 18:00:53', N'2021-06-22 18:00:53')
GO

INSERT INTO [dbo].[certificates] VALUES (N'9', N'865d0589-6515-4cd2-b735-83a3467264ae', N'jVEfdEWxXoFUhCmA', N'237', N'6', N'http://lms.mped.gov.eg/cert/865d0589-6515-4cd2-b735-83a3467264ae.pdf', N'1', N'2021-06-22 18:00:53', N'2021-06-22 18:00:53')
GO

COMMIT
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
-- Records of class_data
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[class_data] VALUES (N'1', N'1', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/v2/upload/course/media/360_88e2cff3-cb92-41fd-98dc-f1b8a1a37e21.mp4\",\"quality\":360},{\"url\":\"http://lms.mped.gov.eg/v2/upload/course/media/360_88e2cff3-cb92-41fd-98dc-f1b8a1a37e21.mp4\",\"quality\":\"480\"}]","subtitleList":"[{\"url\":\"http://lms.mped.gov.eg/v2v2/upload/subtitle/f35e5b6f-484b-49e1-bb9b-1ed9529aff2d.vtt\",\"lang\":\"English\"}]","poster":"http://lms.mped.gov.eg/v2/upload/image/65abd273-3d41-423d-86aa-2888ea9f9612.jpg"}', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[class_data] VALUES (N'2', N'2', N'<p style="text-align:left;"></p>
            <h2 style="text-align:left;"><span style="font-size: 24px;font-family: DauphinPlain;">What is Lorem Ipsum?</span></h2>
            <p style="text-align:justify;"><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <p style="text-align:left;"></p>
            <h2 style="text-align:left;"><span style="font-size: 24px;font-family: DauphinPlain;">Why do we use it?</span></h2>
            <p style="text-align:justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br></p>
            <p style="text-align:left;"></p>
            <h2 style="text-align:left;"><span style="color: rgb(0,0,0);background-color: rgb(255,255,255);font-size: 24px;font-family: DauphinPlain;">Where does it come from?</span></h2>
            <p style="text-align:justify;"><span style="color: rgb(0,0,0);background-color: rgb(255,255,255);font-size: 14px;font-family: Open Sans", Arial, sans-serif;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span><br>&nbsp;</p>
            ', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[class_data] VALUES (N'3', N'3', N'http://lms.mped.gov.eg/v2/upload/course/documents/1b08e059-badd-4b7a-8bfc-442aa95c7e81.pdf', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[class_data] VALUES (N'4', N'4', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[class_data] VALUES (N'5', N'5', N'{"videoList":"[{\"url\":\"https://www.youtube.com/v=1\",\"quality\":\"1080\"}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/2ccf39ca-c05a-42a5-98ab-23a0fb1fd26e.jpg"}', N'2020-12-23 15:20:56', N'2020-12-23 15:20:56')
GO

INSERT INTO [dbo].[class_data] VALUES (N'6', N'6', N'<p>test text&nbsp;</p>
', N'2020-12-23 15:21:41', N'2020-12-23 15:21:41')
GO

INSERT INTO [dbo].[class_data] VALUES (N'7', N'7', N'http://www.google.com/vshared=123', N'2020-12-23 15:22:19', N'2020-12-23 15:22:19')
GO

INSERT INTO [dbo].[class_data] VALUES (N'8', N'8', N'2', N'2020-12-23 15:23:25', N'2020-12-23 15:23:25')
GO

INSERT INTO [dbo].[class_data] VALUES (N'13', N'13', N'4', N'2021-03-21 18:09:46', N'2021-03-21 18:09:46')
GO

INSERT INTO [dbo].[class_data] VALUES (N'14', N'14', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1080_40046527-cf8e-4ef3-978d-7515b0de132e.mp4\",\"quality\":\"1080\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-03-21 23:01:57', N'2021-03-21 23:01:57')
GO

INSERT INTO [dbo].[class_data] VALUES (N'16', N'16', N'1', N'2021-05-17 21:56:45', N'2021-05-17 21:56:45')
GO

INSERT INTO [dbo].[class_data] VALUES (N'17', N'17', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_e7e0f35b-be82-456f-bffe-c9b1d2821aa3.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 11:42:53', N'2021-05-24 11:42:53')
GO

INSERT INTO [dbo].[class_data] VALUES (N'18', N'18', N'5', N'2021-05-24 11:49:09', N'2021-05-24 11:49:09')
GO

INSERT INTO [dbo].[class_data] VALUES (N'19', N'19', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_b64ba004-08b9-4182-80bc-4f8d37822a56.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 12:12:26', N'2021-05-24 12:12:26')
GO

INSERT INTO [dbo].[class_data] VALUES (N'21', N'21', N'6', N'2021-05-24 12:14:01', N'2021-05-24 12:14:01')
GO

INSERT INTO [dbo].[class_data] VALUES (N'22', N'22', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_8470edb3-3cdc-48a4-89a5-65c008a34af6.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 12:34:08', N'2021-05-24 12:34:08')
GO

INSERT INTO [dbo].[class_data] VALUES (N'24', N'24', N'7', N'2021-05-24 12:37:42', N'2021-05-24 12:37:42')
GO

INSERT INTO [dbo].[class_data] VALUES (N'25', N'25', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_12d7b8ac-9402-4091-a0d8-02117985634c.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 13:10:18', N'2021-05-24 13:10:18')
GO

INSERT INTO [dbo].[class_data] VALUES (N'26', N'26', N'8', N'2021-05-24 13:11:08', N'2021-05-24 13:11:08')
GO

INSERT INTO [dbo].[class_data] VALUES (N'27', N'27', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_8cf3d34a-2042-40ca-b0ac-5be5d921e023.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 13:24:39', N'2021-05-24 13:24:39')
GO

INSERT INTO [dbo].[class_data] VALUES (N'28', N'28', N'9', N'2021-05-24 13:27:03', N'2021-05-24 13:27:03')
GO

INSERT INTO [dbo].[class_data] VALUES (N'29', N'29', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_05473742-bb21-4bcd-bb37-0412d9c0c9c4.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG"}', N'2021-05-24 13:54:11', N'2021-05-24 13:54:11')
GO

INSERT INTO [dbo].[class_data] VALUES (N'30', N'30', N'10', N'2021-05-24 13:58:28', N'2021-05-24 13:58:28')
GO

INSERT INTO [dbo].[class_data] VALUES (N'31', N'31', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_ffe10ae5-9e0e-45cd-b343-25827bcae600.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 09:41:39', N'2021-06-03 09:49:53')
GO

INSERT INTO [dbo].[class_data] VALUES (N'32', N'32', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_e39d666d-7208-4c7e-b082-b2cc5440b513.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 09:44:45', N'2021-06-03 09:50:18')
GO

INSERT INTO [dbo].[class_data] VALUES (N'33', N'33', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_d89b181b-de6b-47b0-8e33-57766d2e3599.mp4\",\"quality\":720}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 09:46:15', N'2021-06-03 09:50:55')
GO

INSERT INTO [dbo].[class_data] VALUES (N'34', N'34', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_3c4942a9-0c24-4b1a-a81a-6637f2ccac87.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 09:51:36', N'2021-06-03 09:51:36')
GO

INSERT INTO [dbo].[class_data] VALUES (N'35', N'35', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_c6484258-33f5-4e28-8ab7-b5a67b982800.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:41:11', N'2021-06-03 10:43:04')
GO

INSERT INTO [dbo].[class_data] VALUES (N'36', N'36', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_8c12d99f-5b3e-40f4-ab5a-3553b14050e3.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:41:57', N'2021-06-03 10:43:29')
GO

INSERT INTO [dbo].[class_data] VALUES (N'37', N'37', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_0cd538fa-1b17-4bef-9cdf-a82a37eaaa61.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:44:20', N'2021-06-03 10:44:20')
GO

INSERT INTO [dbo].[class_data] VALUES (N'38', N'38', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_28b07e67-8b17-46d8-a5b9-6dec1b7e9d80.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:45:03', N'2021-06-03 10:45:03')
GO

INSERT INTO [dbo].[class_data] VALUES (N'39', N'39', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_01579b5d-73ac-4dbc-8fbb-75f45e10a9a0.mp4\",\"quality\":720}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:46:50', N'2021-06-03 10:46:50')
GO

INSERT INTO [dbo].[class_data] VALUES (N'40', N'40', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_919d914d-60fd-44c0-9fd8-6cfcf919708c.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:48:08', N'2021-06-03 10:48:08')
GO

INSERT INTO [dbo].[class_data] VALUES (N'41', N'41', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/720_0062bb7e-f2b1-48e0-98f0-82f660b63634.mp4\",\"quality\":720}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-03 10:49:16', N'2021-06-03 10:49:16')
GO

INSERT INTO [dbo].[class_data] VALUES (N'45', N'45', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/course/media/1040_44d88bd8-fb82-47e6-8b79-089b980b73ea.mp4\",\"quality\":1040}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-17 09:02:13', N'2021-06-17 09:02:13')
GO

INSERT INTO [dbo].[class_data] VALUES (N'48', N'48', N'{"videoList":"[{\"url\":\"http://lms.mped.gov.eg/upload/courses/NI/11.mp4\",\"quality\":\"720\"}]","subtitleList":"[]","poster":"/admin-panel/static/media/bg.6a9d678d.png"}', N'2021-06-20 21:54:41', N'2021-06-20 21:59:14')
GO

COMMIT
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
-- Records of class_quiz
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'1', N'1', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'2', N'2', N'8', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'5', N'4', N'13', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'6', N'1', N'16', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'7', N'5', N'18', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'8', N'6', N'21', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'10', N'7', N'24', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'11', N'8', N'26', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'12', N'9', N'28', NULL, NULL)
GO

INSERT INTO [dbo].[class_quiz] VALUES (N'13', N'10', N'30', NULL, NULL)
GO

COMMIT
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
  [attempt] tinyint  NOT NULL,
  [score] tinyint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_quiz_answers] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of class_quiz_answers
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'1', N'1', N'3', N'8', N'2', N'5', N'2020-12-23 15:33:05', N'2020-12-23 15:33:05')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'3', N'3', N'5', N'13', N'1', N'10', N'2021-03-21 22:46:25', N'2021-03-21 22:46:25')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'4', N'3', N'6', N'17', N'1', N'10', N'2021-03-21 22:46:32', N'2021-03-21 22:46:57')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'5', N'8', N'5', N'13', N'1', N'10', N'2021-03-22 13:35:14', N'2021-03-22 13:35:28')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'6', N'8', N'6', N'17', N'1', N'10', N'2021-03-22 13:35:18', N'2021-03-22 13:35:18')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'7', N'9', N'5', N'13', N'1', N'10', N'2021-03-28 12:12:04', N'2021-03-28 12:12:04')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'8', N'9', N'6', N'17', N'2', N'5', N'2021-03-28 12:12:08', N'2021-03-28 12:12:08')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'9', N'11', N'5', N'13', N'1', N'10', N'2021-03-28 12:13:28', N'2021-03-28 12:13:28')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'10', N'11', N'6', N'17', N'1', N'10', N'2021-03-28 12:13:32', N'2021-03-28 12:13:32')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'11', N'19', N'5', N'13', N'1', N'10', N'2021-03-28 13:08:15', N'2021-03-28 13:08:15')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'12', N'19', N'6', N'17', N'1', N'10', N'2021-03-28 13:08:16', N'2021-03-28 13:08:16')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'13', N'21', N'5', N'13', N'1', N'10', N'2021-04-03 13:44:46', N'2021-04-03 13:44:46')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'14', N'21', N'6', N'17', N'1', N'10', N'2021-04-03 13:44:52', N'2021-04-03 13:44:52')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'15', N'22', N'5', N'13', N'1', N'10', N'2021-05-04 12:36:33', N'2021-05-04 12:36:33')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'16', N'22', N'6', N'17', N'1', N'10', N'2021-05-04 12:36:54', N'2021-05-04 12:37:03')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'17', N'24', N'1', N'1', N'4', N'1', N'2021-05-17 22:02:08', N'2021-05-17 22:02:08')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'18', N'24', N'2', N'5', N'2', N'5', N'2021-05-17 22:02:16', N'2021-05-17 22:02:16')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'19', N'16', N'7', N'21', N'3', N'3', N'2021-05-24 14:25:07', N'2021-06-03 13:40:02')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'20', N'16', N'8', N'24', N'3', N'3', N'2021-05-24 14:25:22', N'2021-06-03 13:40:12')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'21', N'16', N'9', N'30', N'3', N'3', N'2021-05-24 14:25:27', N'2021-06-03 13:40:21')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'26', N'4', N'7', N'21', N'1', N'10', N'2021-06-15 11:11:49', N'2021-06-15 11:11:49')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'27', N'4', N'8', N'24', N'1', N'10', N'2021-06-15 11:11:56', N'2021-06-15 11:11:56')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'28', N'4', N'9', N'30', N'1', N'10', N'2021-06-15 11:12:04', N'2021-06-15 11:12:04')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'29', N'29', N'10', N'33', N'2', N'5', N'2021-06-15 11:16:28', N'2021-06-15 11:16:28')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'30', N'29', N'11', N'37', N'1', N'10', N'2021-06-15 11:16:44', N'2021-06-15 11:16:44')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'31', N'30', N'12', N'40', N'1', N'10', N'2021-06-15 11:21:21', N'2021-06-15 11:21:21')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'32', N'30', N'13', N'45', N'1', N'10', N'2021-06-15 11:21:25', N'2021-06-15 11:21:25')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'33', N'30', N'14', N'47', N'1', N'10', N'2021-06-15 11:21:34', N'2021-06-15 11:21:34')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'34', N'29', N'15', N'54', N'1', N'10', N'2021-06-15 11:25:49', N'2021-06-15 11:25:49')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'35', N'29', N'16', N'56', N'1', N'10', N'2021-06-15 11:25:55', N'2021-06-15 11:25:55')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'36', N'31', N'17', N'60', N'1', N'10', N'2021-06-15 11:28:31', N'2021-06-15 11:28:31')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'37', N'31', N'18', N'64', N'1', N'10', N'2021-06-15 11:28:39', N'2021-06-15 11:28:39')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'38', N'31', N'19', N'69', N'1', N'10', N'2021-06-15 11:28:48', N'2021-06-15 11:28:48')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'39', N'30', N'20', N'73', N'1', N'10', N'2021-06-15 11:32:55', N'2021-06-15 11:32:55')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'40', N'30', N'21', N'76', N'1', N'10', N'2021-06-15 11:33:01', N'2021-06-15 11:33:01')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'41', N'30', N'22', N'81', N'1', N'10', N'2021-06-15 11:33:06', N'2021-06-15 11:33:06')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'42', N'38', N'7', N'21', N'1', N'10', N'2021-09-20 19:06:43', N'2021-09-20 19:06:43')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'43', N'38', N'8', N'24', N'1', N'10', N'2021-09-20 19:06:57', N'2021-09-20 19:07:35')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'44', N'38', N'9', N'30', N'1', N'10', N'2021-09-20 19:07:26', N'2021-09-20 19:07:43')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'45', N'39', N'10', N'33', N'1', N'10', N'2021-09-20 19:14:15', N'2021-09-20 19:14:15')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'46', N'39', N'11', N'37', N'1', N'10', N'2021-09-20 19:14:48', N'2021-09-20 19:14:58')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'47', N'38', N'12', N'40', N'1', N'10', N'2021-09-20 19:31:27', N'2021-09-20 19:31:27')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'48', N'38', N'13', N'45', N'1', N'10', N'2021-09-20 19:31:51', N'2021-09-20 19:32:21')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'49', N'38', N'14', N'47', N'1', N'10', N'2021-09-20 19:32:13', N'2021-09-20 19:32:13')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'50', N'39', N'15', N'54', N'1', N'10', N'2021-09-20 19:38:25', N'2021-09-20 19:38:25')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'51', N'39', N'16', N'56', N'1', N'10', N'2021-09-20 19:38:39', N'2021-09-20 19:38:39')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'52', N'40', N'17', N'60', N'1', N'10', N'2021-09-20 19:43:53', N'2021-09-20 19:44:43')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'53', N'40', N'18', N'64', N'1', N'10', N'2021-09-20 19:44:14', N'2021-09-20 19:44:45')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'54', N'40', N'19', N'69', N'1', N'10', N'2021-09-20 19:44:38', N'2021-09-20 19:44:38')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'55', N'41', N'20', N'73', N'1', N'10', N'2021-09-20 19:49:24', N'2021-09-20 19:49:24')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'56', N'41', N'21', N'76', N'1', N'10', N'2021-09-20 19:49:32', N'2021-09-20 19:49:32')
GO

INSERT INTO [dbo].[class_quiz_answers] VALUES (N'57', N'41', N'22', N'81', N'1', N'10', N'2021-09-20 19:49:46', N'2021-09-20 19:49:57')
GO

COMMIT
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
  [score] tinyint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[class_quiz_takes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of class_quiz_takes
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'1', N'2', N'4', NULL, N'0', N'10', N'2020-12-23 15:33:00', N'2020-12-23 15:33:00')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'3', N'5', N'4', NULL, N'0', N'20', N'2021-03-21 22:46:14', N'2021-03-21 22:46:14')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'4', N'5', N'5', NULL, N'0', N'20', N'2021-03-21 23:00:01', N'2021-03-21 23:00:01')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'5', N'5', N'5', NULL, N'0', N'20', N'2021-03-21 23:00:09', N'2021-03-21 23:00:09')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'6', N'5', N'5', NULL, N'0', N'20', N'2021-03-21 23:03:18', N'2021-03-21 23:03:18')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'7', N'5', N'5', NULL, N'0', N'20', N'2021-03-21 23:04:49', N'2021-03-21 23:04:49')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'8', N'5', N'4', NULL, N'0', N'20', N'2021-03-22 13:35:00', N'2021-03-22 13:35:00')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'9', N'5', N'4', NULL, N'0', N'20', N'2021-03-28 12:11:52', N'2021-03-28 12:11:52')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'10', N'5', N'4', NULL, N'0', N'20', N'2021-03-28 12:12:29', N'2021-03-28 12:12:29')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'11', N'5', N'4', NULL, N'0', N'20', N'2021-03-28 12:13:23', N'2021-03-28 12:13:23')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'14', N'5', N'4', NULL, N'0', N'20', N'2021-03-28 12:18:22', N'2021-03-28 12:18:22')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'15', N'5', N'4', NULL, N'0', N'20', N'2021-03-28 12:18:37', N'2021-03-28 12:18:37')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'16', N'5', N'1', NULL, N'0', N'20', N'2021-03-28 13:07:31', N'2021-03-28 13:07:31')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'17', N'5', N'1', NULL, N'0', N'20', N'2021-03-28 13:07:39', N'2021-03-28 13:07:39')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'18', N'5', N'1', NULL, N'0', N'20', N'2021-03-28 13:07:45', N'2021-03-28 13:07:45')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'19', N'5', N'1', NULL, N'0', N'20', N'2021-03-28 13:08:12', N'2021-03-28 13:08:12')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'20', N'5', N'5', NULL, N'0', N'20', N'2021-04-03 13:41:21', N'2021-04-03 13:41:21')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'21', N'5', N'5', NULL, N'0', N'20', N'2021-04-03 13:44:41', N'2021-04-03 13:44:41')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'22', N'5', N'1', NULL, N'0', N'20', N'2021-05-04 12:36:25', N'2021-05-04 12:36:25')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'23', N'5', N'2', NULL, N'0', N'20', N'2021-05-17 21:51:54', N'2021-05-17 21:51:54')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'24', N'1', N'1', NULL, N'0', N'20', N'2021-05-17 22:01:56', N'2021-05-17 22:01:56')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'25', N'10', N'1', NULL, N'0', N'10', N'2021-05-24 12:51:05', N'2021-05-24 12:51:05')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'26', N'10', N'1', NULL, N'0', N'30', N'2021-05-24 14:24:47', N'2021-05-24 14:24:47')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'29', N'8', N'5', NULL, N'0', N'20', N'2021-06-15 11:16:19', N'2021-06-15 11:16:19')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'30', N'10', N'5', NULL, N'0', N'30', N'2021-06-15 11:21:02', N'2021-06-15 11:21:02')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'31', N'12', N'5', NULL, N'0', N'30', N'2021-06-15 11:28:24', N'2021-06-15 11:28:24')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'36', N'5', N'5', NULL, N'0', N'20', N'2021-06-21 13:15:14', N'2021-06-21 13:15:14')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'37', N'13', N'326', NULL, N'0', N'30', N'2021-09-20 18:54:44', N'2021-09-20 18:54:44')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'38', N'7', N'326', NULL, N'0', N'30', N'2021-09-20 19:02:45', N'2021-09-20 19:02:45')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'39', N'8', N'326', NULL, N'0', N'20', N'2021-09-20 19:13:59', N'2021-09-20 19:13:59')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'40', N'12', N'326', NULL, N'0', N'30', N'2021-09-20 19:43:38', N'2021-09-20 19:43:38')
GO

INSERT INTO [dbo].[class_quiz_takes] VALUES (N'41', N'13', N'326', NULL, N'0', N'30', N'2021-09-20 19:49:17', N'2021-09-20 19:49:17')
GO

COMMIT
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
-- Records of class_user_meta
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'1', N'8', N'4', N'0', N'2020-12-23 15:33:06', N'2020-12-23 15:33:06')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'5', N'13', N'4', N'1', N'2021-03-21 22:46:33', N'2021-03-21 22:46:33')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'6', N'14', N'4', N'1', N'2021-03-22 13:34:15', N'2021-03-22 13:34:15')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'7', N'13', N'1', N'1', N'2021-03-28 13:08:17', N'2021-03-28 13:08:17')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'8', N'14', N'5', N'1', N'2021-04-03 13:44:08', N'2021-04-03 13:44:08')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'9', N'13', N'5', N'1', N'2021-04-03 13:44:53', N'2021-04-03 13:44:53')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'10', N'14', N'1', N'1', N'2021-05-04 12:38:35', N'2021-05-04 12:38:35')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'11', N'4', N'1', N'0', N'2021-05-17 22:02:17', N'2021-05-17 22:02:17')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'13', N'18', N'1', N'0', N'2021-05-24 14:25:28', N'2021-06-03 13:40:22')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'14', N'17', N'5', N'1', N'2021-06-15 11:11:08', N'2021-06-15 11:11:08')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'15', N'18', N'5', N'1', N'2021-06-15 11:12:05', N'2021-06-15 11:12:05')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'16', N'19', N'5', N'1', N'2021-06-15 11:15:49', N'2021-06-15 11:15:49')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'17', N'21', N'5', N'1', N'2021-06-15 11:16:46', N'2021-06-15 11:16:46')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'18', N'22', N'5', N'1', N'2021-06-15 11:20:32', N'2021-06-15 11:20:32')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'19', N'24', N'5', N'1', N'2021-06-15 11:21:35', N'2021-06-15 11:21:35')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'20', N'25', N'5', N'1', N'2021-06-15 11:25:13', N'2021-06-15 11:25:13')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'21', N'26', N'5', N'1', N'2021-06-15 11:25:56', N'2021-06-15 11:25:56')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'22', N'27', N'5', N'1', N'2021-06-15 11:28:05', N'2021-06-15 11:28:05')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'23', N'28', N'5', N'1', N'2021-06-15 11:28:49', N'2021-06-15 11:28:49')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'24', N'29', N'5', N'1', N'2021-06-15 11:32:18', N'2021-06-15 11:32:18')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'25', N'30', N'5', N'1', N'2021-06-15 11:33:07', N'2021-06-15 11:33:07')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'27', N'45', N'5', N'1', N'2021-06-17 09:07:15', N'2021-06-17 09:07:15')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'28', N'31', N'240', N'1', N'2021-06-22 09:27:51', N'2021-06-22 09:27:51')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'29', N'31', N'209', N'1', N'2021-06-22 10:54:01', N'2021-06-22 10:54:01')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'30', N'41', N'207', N'1', N'2021-06-22 11:06:52', N'2021-06-22 11:06:52')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'31', N'32', N'209', N'1', N'2021-06-22 11:23:59', N'2021-06-22 11:23:59')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'32', N'33', N'209', N'1', N'2021-06-22 11:38:08', N'2021-06-22 11:38:08')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'33', N'31', N'201', N'1', N'2021-06-22 11:42:51', N'2021-06-22 11:42:51')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'34', N'34', N'209', N'1', N'2021-06-22 11:54:40', N'2021-06-22 11:54:40')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'35', N'32', N'201', N'1', N'2021-06-22 12:12:49', N'2021-06-22 12:12:49')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'36', N'33', N'201', N'1', N'2021-06-22 12:26:56', N'2021-06-22 12:26:56')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'37', N'35', N'209', N'1', N'2021-06-22 12:36:30', N'2021-06-22 12:36:30')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'38', N'31', N'237', N'1', N'2021-06-22 12:50:01', N'2021-06-22 12:50:01')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'39', N'36', N'209', N'1', N'2021-06-22 13:07:09', N'2021-06-22 13:07:09')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'40', N'32', N'237', N'1', N'2021-06-22 13:10:26', N'2021-06-22 13:10:26')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'41', N'33', N'237', N'1', N'2021-06-22 13:24:24', N'2021-06-22 13:24:24')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'42', N'37', N'209', N'1', N'2021-06-22 13:29:17', N'2021-06-22 13:29:17')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'43', N'34', N'237', N'1', N'2021-06-22 13:38:25', N'2021-06-22 13:38:25')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'44', N'35', N'201', N'1', N'2021-06-22 13:41:54', N'2021-06-22 13:41:54')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'45', N'36', N'201', N'1', N'2021-06-22 14:08:13', N'2021-06-22 14:08:13')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'46', N'38', N'209', N'1', N'2021-06-22 14:23:40', N'2021-06-22 14:23:40')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'47', N'37', N'201', N'1', N'2021-06-22 14:30:20', N'2021-06-22 14:30:20')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'48', N'35', N'237', N'1', N'2021-06-22 14:46:30', N'2021-06-22 14:46:30')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'49', N'36', N'237', N'1', N'2021-06-22 15:03:29', N'2021-06-22 15:03:29')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'50', N'37', N'237', N'1', N'2021-06-22 15:16:40', N'2021-06-22 15:16:40')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'51', N'38', N'237', N'1', N'2021-06-22 15:48:12', N'2021-06-22 15:48:12')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'52', N'39', N'237', N'1', N'2021-06-22 16:06:54', N'2021-06-22 16:06:54')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'53', N'40', N'237', N'1', N'2021-06-22 16:22:59', N'2021-06-22 16:22:59')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'54', N'48', N'237', N'1', N'2021-06-22 17:05:28', N'2021-06-22 17:05:28')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'55', N'41', N'237', N'1', N'2021-06-22 18:00:50', N'2021-06-22 18:00:50')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'56', N'31', N'203', N'1', N'2021-06-23 11:50:05', N'2021-06-23 11:50:05')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'57', N'31', N'216', N'1', N'2021-06-27 08:06:22', N'2021-06-27 08:06:22')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'58', N'32', N'216', N'1', N'2021-06-27 08:42:54', N'2021-06-27 08:42:54')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'59', N'33', N'216', N'1', N'2021-06-27 08:57:27', N'2021-06-27 08:57:27')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'60', N'34', N'216', N'1', N'2021-06-27 09:15:01', N'2021-06-27 09:15:01')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'61', N'35', N'216', N'1', N'2021-06-27 09:53:19', N'2021-06-27 09:53:19')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'62', N'36', N'216', N'1', N'2021-06-27 10:25:28', N'2021-06-27 10:25:28')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'63', N'31', N'218', N'1', N'2021-06-27 10:32:16', N'2021-06-27 10:32:16')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'64', N'37', N'216', N'1', N'2021-06-27 10:57:23', N'2021-06-27 10:57:23')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'65', N'32', N'218', N'1', N'2021-06-27 11:02:17', N'2021-06-27 11:02:17')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'66', N'33', N'218', N'1', N'2021-06-27 11:16:25', N'2021-06-27 11:16:25')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'67', N'33', N'200', N'1', N'2021-06-27 11:19:09', N'2021-06-27 11:19:09')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'68', N'38', N'216', N'1', N'2021-06-27 12:31:00', N'2021-06-27 12:31:00')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'69', N'39', N'216', N'1', N'2021-06-27 13:37:04', N'2021-06-27 13:37:04')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'70', N'41', N'200', N'1', N'2021-06-28 09:51:18', N'2021-06-28 09:51:18')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'71', N'38', N'200', N'1', N'2021-06-28 12:29:46', N'2021-06-28 12:29:46')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'72', N'39', N'200', N'1', N'2021-06-28 13:27:46', N'2021-06-28 13:27:46')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'73', N'40', N'216', N'1', N'2021-06-29 09:18:26', N'2021-06-29 09:18:26')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'74', N'39', N'209', N'1', N'2021-06-29 09:33:56', N'2021-06-29 09:33:56')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'75', N'48', N'216', N'1', N'2021-06-29 10:49:37', N'2021-06-29 10:49:37')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'76', N'38', N'201', N'1', N'2021-06-29 13:28:30', N'2021-06-29 13:28:30')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'77', N'39', N'201', N'1', N'2021-06-29 13:57:43', N'2021-06-29 13:57:43')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'78', N'40', N'201', N'1', N'2021-06-29 14:29:36', N'2021-06-29 14:29:36')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'79', N'48', N'201', N'1', N'2021-06-29 14:46:55', N'2021-06-29 14:46:55')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'80', N'41', N'201', N'1', N'2021-06-30 12:58:48', N'2021-06-30 12:58:48')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'81', N'17', N'326', N'1', N'2021-08-16 13:50:03', N'2021-08-16 13:50:03')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'82', N'17', N'335', N'1', N'2021-09-14 10:14:18', N'2021-09-14 10:14:18')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'83', N'18', N'326', N'1', N'2021-09-20 19:07:27', N'2021-09-20 19:07:44')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'84', N'19', N'326', N'1', N'2021-09-20 19:12:06', N'2021-09-20 19:12:06')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'85', N'21', N'326', N'1', N'2021-09-20 19:14:49', N'2021-09-20 19:14:49')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'86', N'22', N'326', N'1', N'2021-09-20 19:28:55', N'2021-09-20 19:28:55')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'87', N'24', N'326', N'1', N'2021-09-20 19:32:14', N'2021-09-20 19:32:14')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'88', N'25', N'326', N'1', N'2021-09-20 19:36:03', N'2021-09-20 19:36:03')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'89', N'26', N'326', N'1', N'2021-09-20 19:38:40', N'2021-09-20 19:38:40')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'90', N'27', N'326', N'1', N'2021-09-20 19:43:07', N'2021-09-20 19:43:07')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'91', N'28', N'326', N'1', N'2021-09-20 19:44:39', N'2021-09-20 19:44:49')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'92', N'29', N'326', N'1', N'2021-09-20 19:48:46', N'2021-09-20 19:48:46')
GO

INSERT INTO [dbo].[class_user_meta] VALUES (N'93', N'30', N'326', N'1', N'2021-09-20 19:49:47', N'2021-09-20 19:49:47')
GO

COMMIT
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
-- Records of course_category
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_category] VALUES (N'6', N'6', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[course_category] VALUES (N'7', N'1', N'4', NULL, NULL)
GO

INSERT INTO [dbo].[course_category] VALUES (N'14', N'5', N'5', NULL, NULL)
GO

INSERT INTO [dbo].[course_category] VALUES (N'15', N'2', N'6', NULL, NULL)
GO

INSERT INTO [dbo].[course_category] VALUES (N'16', N'5', N'2', NULL, NULL)
GO

INSERT INTO [dbo].[course_category] VALUES (N'27', N'1', N'1', NULL, NULL)
GO

COMMIT
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
-- Records of course_classes
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_classes] VALUES (N'1', N'Overview of the PSTI method', N'03:08', N'1', N'1', N'video', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'2', N'Thank you for enrollement', N'01:22', N'1', N'1', N'text', N'2', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'3', N'Stage One', N'06:31', N'1', N'1', N'document', N'3', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'4', N'Stage Three', N'04:31', N'1', N'1', N'quiz', N'4', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'5', N'Module 1', N'2 :00', N'2', N'2', N'video', N'1', N'2020-12-23 15:20:56', N'2020-12-23 15:20:56')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'6', N'Module 2', N'1 :00', N'2', N'2', N'text', N'1', N'2020-12-23 15:21:41', N'2020-12-23 15:21:41')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'7', N'Module 3', N'10:00', N'2', N'2', N'document', N'2', N'2020-12-23 15:22:19', N'2020-12-23 15:22:19')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'8', N'Exam', N'1 :00', N'2', N'3', N'quiz', N'3', N'2020-12-23 15:23:25', N'2020-12-23 15:23:25')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'13', N'WIFI', N'02:00', N'4', N'5', N'quiz', N'2', N'2021-03-21 18:09:46', N'2021-03-21 23:03:06')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'14', N'ازاي تقدر تتصل بالانترنت من خلال شبكة الواي فاي', N'03:30', N'4', N'5', N'video', N'1', N'2021-03-21 23:01:57', N'2021-03-21 23:01:57')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'16', N'module 1', N'01:00', N'5', N'9', N'quiz', N'1', N'2021-05-17 21:56:45', N'2021-05-17 21:56:45')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'17', N'فيديو', N'05:40', N'3', N'8', N'video', N'1', N'2021-05-24 11:42:53', N'2021-05-24 13:01:26')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'18', N'الاسئلة', N'02:00', N'3', N'8', N'quiz', N'2', N'2021-05-24 11:49:09', N'2021-05-24 13:01:26')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'19', N'فيديو', N'04:05', N'3', N'10', N'video', N'1', N'2021-05-24 12:12:26', N'2021-05-24 12:12:26')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'21', N'الاسئلة', N'02:00', N'3', N'10', N'quiz', N'2', N'2021-05-24 12:14:01', N'2021-05-24 12:14:23')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'22', N'فيديو', N'04:12', N'3', N'11', N'video', N'1', N'2021-05-24 12:34:08', N'2021-05-24 12:34:08')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'24', N'الاسئلة', N'02:00', N'3', N'11', N'quiz', N'1', N'2021-05-24 12:37:42', N'2021-05-24 12:37:42')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'25', N'فيديو', N'04:01', N'3', N'12', N'video', N'1', N'2021-05-24 13:10:18', N'2021-05-24 13:10:18')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'26', N'الاسئلة', N'02:00', N'3', N'12', N'quiz', N'2', N'2021-05-24 13:11:08', N'2021-05-24 13:11:08')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'27', N'فيديو', N'02:34', N'3', N'13', N'video', N'1', N'2021-05-24 13:24:39', N'2021-05-24 13:24:39')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'28', N'الاسئلة', N'02:00', N'3', N'13', N'quiz', N'2', N'2021-05-24 13:27:03', N'2021-05-24 13:27:03')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'29', N'فيديو', N'03:54', N'3', N'14', N'video', N'1', N'2021-05-24 13:54:11', N'2021-05-24 13:54:11')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'30', N'الاسئلة', N'02:00', N'3', N'14', N'quiz', N'2', N'2021-05-24 13:58:28', N'2021-05-24 13:58:28')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'31', N'فيديو', N'26:54', N'6', N'15', N'video', N'1', N'2021-06-03 09:41:39', N'2021-06-03 09:41:39')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'32', N'فيديو', N'29:56', N'6', N'16', N'video', N'1', N'2021-06-03 09:44:45', N'2021-06-03 09:44:45')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'33', N'فيديو', N'14:06', N'6', N'17', N'video', N'1', N'2021-06-03 09:46:15', N'2021-06-03 09:46:15')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'34', N'فيديو', N'16:30', N'6', N'18', N'video', N'1', N'2021-06-03 09:51:36', N'2021-06-03 09:51:36')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'35', N'فيديو', N'29:40', N'6', N'19', N'video', N'1', N'2021-06-03 10:41:11', N'2021-06-03 10:41:11')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'36', N'فيديو', N'30:37', N'6', N'20', N'video', N'1', N'2021-06-03 10:41:57', N'2021-06-03 10:41:57')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'37', N'فيديو', N'22:06', N'6', N'21', N'video', N'1', N'2021-06-03 10:44:20', N'2021-06-03 10:44:20')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'38', N'فيديو', N'54:20', N'6', N'22', N'video', N'1', N'2021-06-03 10:45:03', N'2021-06-03 10:45:03')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'39', N'فيديو', N'29:10', N'6', N'23', N'video', N'1', N'2021-06-03 10:46:50', N'2021-06-03 10:46:50')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'40', N'فيديو', N'31:52', N'6', N'24', N'video', N'1', N'2021-06-03 10:48:08', N'2021-06-03 10:48:08')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'41', N'فيديو', N'23:15', N'6', N'26', N'video', N'1', N'2021-06-03 10:49:16', N'2021-06-03 10:49:16')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'45', N'فيديو', N'05:15', N'3', N'30', N'video', N'1', N'2021-06-17 09:02:13', N'2021-06-17 09:02:13')
GO

INSERT INTO [dbo].[course_classes] VALUES (N'48', N'فيديو', N'59:24', N'6', N'25', N'video', N'1', N'2021-06-20 21:54:41', N'2021-06-20 21:54:41')
GO

COMMIT
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
-- Records of course_data
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_data] VALUES (N'1', N'2', N'{"included":"[{\"id\":4,\"_id\":\"6cd86d8d-5c7d-42d2-97af-f14b0fb13a95\",\"username\":\"haithem\",\"first_name\":\"Haithem \",\"last_name\":\"Atef\",\"email\":\"haithem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:37:14\",\"display_name\":\"Haithem Atef\",\"user_url\":null,\"profile_picture\":null}]","excluded":"[{\"id\":4,\"_id\":\"6cd86d8d-5c7d-42d2-97af-f14b0fb13a95\",\"username\":\"haithem\",\"first_name\":\"Haithem \",\"last_name\":\"Atef\",\"email\":\"haithem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:37:14\",\"display_name\":\"Haithem Atef\",\"user_url\":null,\"profile_picture\":null}]"}', N'2020-12-23 15:18:02', N'2020-12-23 15:18:02')
GO

INSERT INTO [dbo].[course_data] VALUES (N'2', N'3', N'{"included":"[]","excluded":"[]"}', N'2021-01-04 16:52:14', N'2021-05-24 14:18:17')
GO

INSERT INTO [dbo].[course_data] VALUES (N'3', N'4', N'{"included":"[{\"id\":2,\"_id\":\"a8a5bfa7-2fb0-41ea-af18-16710cd13fd5\",\"username\":\"kareem\",\"first_name\":\"Kareem\",\"last_name\":\"Adel\",\"email\":\"kereem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-03-21 10:20:21\",\"display_name\":\"Kareem Adel\",\"user_url\":null,\"profile_picture\":null},{\"id\":3,\"_id\":\"af5351fa-e5bf-4502-86e9-c5a5e7b50af8\",\"username\":\"mansour\",\"first_name\":\"Mansour\",\"last_name\":\"Mo\",\"email\":\"mansour@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":null,\"display_name\":\"Mo Mansour\",\"user_url\":null,\"profile_picture\":null},{\"id\":1,\"_id\":\"edfeb122-3656-483b-b477-17c827f44cd4\",\"username\":\"admin\",\"first_name\":\"Abe\",\"last_name\":\"Sal\",\"email\":\"admin@admin.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:40:04\",\"display_name\":\"Abdalla Salah\",\"user_url\":null,\"profile_picture\":null},{\"id\":4,\"_id\":\"6cd86d8d-5c7d-42d2-97af-f14b0fb13a95\",\"username\":\"haithem\",\"first_name\":\"Haithem \",\"last_name\":\"Atef\",\"email\":\"haithem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:37:14\",\"display_name\":\"Haithem Atef\",\"user_url\":null,\"profile_picture\":null},{\"id\":5,\"_id\":\"51d81a9d-281a-4e20-a6f7-478d294dcaa2\",\"username\":\"akamal\",\"first_name\":\"Ahmed\",\"last_name\":\"Kamal\",\"email\":\"ahmed.kamal@mped.gov.eg\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-03-21 16:15:45\",\"display_name\":\"Ahmed Kamal\",\"user_url\":null,\"profile_picture\":null}]","excluded":"[{\"id\":2,\"_id\":\"a8a5bfa7-2fb0-41ea-af18-16710cd13fd5\",\"username\":\"kareem\",\"first_name\":\"Kareem\",\"last_name\":\"Adel\",\"email\":\"kereem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-03-21 10:20:21\",\"display_name\":\"Kareem Adel\",\"user_url\":null,\"profile_picture\":null},{\"id\":3,\"_id\":\"af5351fa-e5bf-4502-86e9-c5a5e7b50af8\",\"username\":\"mansour\",\"first_name\":\"Mansour\",\"last_name\":\"Mo\",\"email\":\"mansour@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":null,\"display_name\":\"Mo Mansour\",\"user_url\":null,\"profile_picture\":null},{\"id\":1,\"_id\":\"edfeb122-3656-483b-b477-17c827f44cd4\",\"username\":\"admin\",\"first_name\":\"Abe\",\"last_name\":\"Sal\",\"email\":\"admin@admin.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:40:04\",\"display_name\":\"Abdalla Salah\",\"user_url\":null,\"profile_picture\":null},{\"id\":4,\"_id\":\"6cd86d8d-5c7d-42d2-97af-f14b0fb13a95\",\"username\":\"haithem\",\"first_name\":\"Haithem \",\"last_name\":\"Atef\",\"email\":\"haithem@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:37:14\",\"display_name\":\"Haithem Atef\",\"user_url\":null,\"profile_picture\":null},{\"id\":5,\"_id\":\"51d81a9d-281a-4e20-a6f7-478d294dcaa2\",\"username\":\"akamal\",\"first_name\":\"Ahmed\",\"last_name\":\"Kamal\",\"email\":\"ahmed.kamal@mped.gov.eg\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-03-21 16:15:45\",\"display_name\":\"Ahmed Kamal\",\"user_url\":null,\"profile_picture\":null}]"}', N'2021-03-21 17:57:46', N'2021-03-21 18:30:29')
GO

INSERT INTO [dbo].[course_data] VALUES (N'4', N'5', N'{"included":"[{\"id\":3,\"_id\":\"af5351fa-e5bf-4502-86e9-c5a5e7b50af8\",\"username\":\"mansour\",\"first_name\":\"Mansour\",\"last_name\":\"Mo\",\"email\":\"mansour@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":null,\"display_name\":\"Mo Mansour\",\"user_url\":null,\"profile_picture\":null,\"isdisabled\":false}]","excluded":"[{\"id\":3,\"_id\":\"af5351fa-e5bf-4502-86e9-c5a5e7b50af8\",\"username\":\"mansour\",\"first_name\":\"Mansour\",\"last_name\":\"Mo\",\"email\":\"mansour@domerai.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":null,\"display_name\":\"Mo Mansour\",\"user_url\":null,\"profile_picture\":null,\"isdisabled\":false}]"}', N'2021-05-17 21:54:57', N'2021-05-17 21:54:57')
GO

INSERT INTO [dbo].[course_data] VALUES (N'5', N'6', N'{"included":"[{\"id\":5,\"_id\":\"51d81a9d-281a-4e20-a6f7-478d294dcaa2\",\"username\":\"akamal\",\"is_ldap\":0,\"first_name\":\"Ahmed\",\"last_name\":\"Kamal\",\"email\":\"ahmed.kamal@mped.gov.eg\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-05-04 10:51:20\",\"display_name\":\"Ahmed Kamal\",\"user_url\":null,\"deleted_at\":null,\"profile_picture\":{\"_id\":\"45b7b16b-db96-4990-b329-510e00fcc2f4\",\"title\":\"Ahmed Kamal profile\",\"mime\":\"image/jpeg\",\"url\":\"http://lms.mped.gov.eg/upload/profile/U-f5d01acb-4015-4b81-b847-ebf25acc5a06.jpg\"}}]","excluded":"[{\"id\":5,\"_id\":\"51d81a9d-281a-4e20-a6f7-478d294dcaa2\",\"username\":\"akamal\",\"is_ldap\":0,\"first_name\":\"Ahmed\",\"last_name\":\"Kamal\",\"email\":\"ahmed.kamal@mped.gov.eg\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2021-05-04 10:51:20\",\"display_name\":\"Ahmed Kamal\",\"user_url\":null,\"deleted_at\":null,\"profile_picture\":{\"_id\":\"45b7b16b-db96-4990-b329-510e00fcc2f4\",\"title\":\"Ahmed Kamal profile\",\"mime\":\"image/jpeg\",\"url\":\"http://lms.mped.gov.eg/upload/profile/U-f5d01acb-4015-4b81-b847-ebf25acc5a06.jpg\"}}]"}', N'2021-06-02 13:50:10', N'2021-06-03 10:51:14')
GO

INSERT INTO [dbo].[course_data] VALUES (N'6', N'1', N'{"included":"[{\"id\":1,\"_id\":\"edfeb122-3656-483b-b477-17c827f44cd4\",\"username\":\"admin\",\"is_ldap\":0,\"first_name\":\"Abe\",\"last_name\":\"Sal\",\"email\":\"abesalx@gmail.com\",\"is_banned\":0,\"is_verified\":0,\"password_changed_at\":\"2020-11-21 10:40:04\",\"display_name\":\"Abdalla Salah\",\"user_url\":null,\"deleted_at\":null,\"profile_picture\":null}]","excluded":"null"}', N'2021-06-03 15:36:17', N'2021-06-30 03:15:23')
GO

COMMIT
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
  [course_id] bigint  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[course_department] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of course_department
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_department] VALUES (N'11', N'7', N'3', NULL, NULL)
GO

INSERT INTO [dbo].[course_department] VALUES (N'12', N'9', N'6', NULL, NULL)
GO

COMMIT
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
  [course_id] bigint  NOT NULL,
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
-- Records of course_enrols
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'12', N'4', N'2', N'0', N'0', N'course', N'2021-03-28 12:15:30', N'2021-03-28 12:15:30')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'13', N'4', N'3', N'0', N'0', N'course', N'2021-03-28 12:15:30', N'2021-03-28 12:15:30')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'14', N'4', N'1', N'14', N'100', N'course', N'2021-03-28 12:15:30', N'2021-05-04 12:38:35')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'15', N'4', N'4', N'14', N'0', N'course', N'2021-03-28 12:15:30', N'2021-03-28 12:18:39')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'16', N'4', N'5', N'14', N'100', N'course', N'2021-03-28 12:15:30', N'2021-06-21 13:15:17')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'18', N'5', N'5', N'0', N'0', N'course', N'2021-05-17 21:54:57', N'2021-05-17 21:54:57')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'20', N'3', N'4', N'0', N'0', N'course', N'2021-05-24 14:17:34', N'2021-05-24 14:17:34')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'38', N'6', N'1', N'31', N'0', N'course', N'2021-06-02 13:50:10', N'2021-06-13 14:33:04')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'39', N'6', N'2', N'0', N'0', N'course', N'2021-06-02 13:50:10', N'2021-06-02 13:50:10')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'53', N'2', N'53', N'0', N'0', N'course', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'54', N'3', N'53', N'0', N'0', N'course', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'55', N'4', N'53', N'0', N'0', N'course', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'56', N'5', N'53', N'0', N'0', N'course', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'57', N'6', N'53', N'0', N'0', N'course', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'117', N'1', N'1', N'0', N'0', N'course', N'2021-06-17 01:08:13', N'2021-06-17 01:08:13')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'118', N'1', N'2', N'0', N'0', N'course', N'2021-06-17 01:08:13', N'2021-06-17 01:08:13')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'120', N'5', N'3', N'0', N'0', N'course', N'2021-06-17 01:08:44', N'2021-06-17 01:08:44')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'121', N'3', N'5', N'45', N'100', N'course', N'2021-06-17 09:05:03', N'2021-06-17 09:07:15')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'122', N'6', N'5', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'123', N'6', N'200', N'48', N'33', N'course', N'2021-06-21 12:27:36', N'2021-06-28 13:45:32')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'124', N'6', N'201', N'48', N'92', N'course', N'2021-06-21 12:27:36', N'2021-07-06 14:31:35')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'125', N'6', N'202', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'126', N'6', N'203', N'32', N'8', N'course', N'2021-06-21 12:27:36', N'2021-06-23 11:50:35')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'127', N'6', N'204', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'128', N'6', N'205', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'129', N'6', N'206', N'32', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-24 09:49:23')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'130', N'6', N'207', N'31', N'8', N'course', N'2021-06-21 12:27:36', N'2021-06-22 11:16:44')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'131', N'6', N'208', N'41', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-22 10:32:06')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'132', N'6', N'209', N'40', N'75', N'course', N'2021-06-21 12:27:36', N'2021-06-29 09:34:27')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'133', N'6', N'210', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'134', N'6', N'211', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'135', N'6', N'212', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'136', N'6', N'213', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'137', N'6', N'214', N'41', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-22 12:08:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'138', N'6', N'215', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'139', N'6', N'216', N'38', N'92', N'course', N'2021-06-21 12:27:36', N'2021-06-29 13:14:50')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'140', N'6', N'217', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'141', N'6', N'218', N'34', N'25', N'course', N'2021-06-21 12:27:36', N'2021-06-27 11:16:56')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'142', N'6', N'219', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'143', N'6', N'220', N'41', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-22 11:10:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'144', N'6', N'221', N'41', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-24 13:20:57')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'145', N'6', N'222', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'146', N'6', N'223', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'147', N'6', N'224', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'148', N'6', N'225', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'149', N'6', N'226', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'150', N'6', N'227', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'151', N'6', N'228', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'152', N'6', N'229', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'153', N'6', N'230', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'154', N'6', N'231', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'155', N'6', N'232', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'156', N'6', N'233', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'157', N'6', N'234', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'158', N'6', N'235', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'159', N'6', N'236', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'160', N'6', N'237', N'48', N'100', N'course', N'2021-06-21 12:27:36', N'2021-06-22 18:01:06')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'161', N'6', N'238', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'162', N'6', N'239', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'163', N'6', N'240', N'32', N'8', N'course', N'2021-06-21 12:27:36', N'2021-06-22 09:28:22')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'164', N'6', N'241', N'0', N'0', N'course', N'2021-06-21 12:27:36', N'2021-06-21 12:27:36')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'201', N'2', N'4', N'0', N'0', N'course', N'2021-06-30 01:55:01', N'2021-06-30 01:55:01')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'301', N'3', N'326', N'30', N'92', N'course', N'2021-09-01 18:31:51', N'2021-09-20 19:49:58')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'302', N'3', N'327', N'0', N'0', N'course', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'303', N'3', N'328', N'0', N'0', N'course', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'304', N'3', N'332', N'0', N'0', N'course', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'305', N'3', N'333', N'0', N'0', N'course', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'306', N'3', N'329', N'0', N'0', N'course', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[course_enrols] VALUES (N'307', N'3', N'335', N'0', N'8', N'course', N'2021-09-01 18:31:51', N'2021-09-14 10:14:19')
GO

COMMIT
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
-- Records of course_meta
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[course_meta] VALUES (N'1', N'1', N'duration', N'10 - 20 weeks', NULL, NULL)
GO

INSERT INTO [dbo].[course_meta] VALUES (N'2', N'1', N'features', N'[{"icon":"language","value":"Language: English"},{"icon":"language","value":"7 hours on-demand video"},{"icon":"language","value":"11 Lessons"},{"icon":"language","value":"Certificate of Completion"}]', NULL, NULL)
GO

COMMIT
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
  [published] tinyint  NOT NULL,
  [duration] int  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[courses] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[courses] VALUES (N'1', N'Creative Thinking for Problem solving (Practical Creativity)', N'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore. veritatis et
            quasi architecto beatae vitae dicta sunt explicabo.', N'<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>', N'creative-thinking-for-problem-solving-practical-creativity', NULL, NULL, N'1', N'http://lms.mped.gov.eg/upload/image/86d17d9d-ec86-4292-ab8d-3f89acfc50be.jpg', N'1', N'7', N'2020-11-21 02:14:36', N'2021-06-03 15:36:17')
GO

INSERT INTO [dbo].[courses] VALUES (N'2', N'test Alaa', N'test short desc', N'<p>test desc</p>
', N'test-alaa', NULL, NULL, N'1', N'http://lms.mped.gov.eg/upload/image/2ccf39ca-c05a-42a5-98ab-23a0fb1fd26e.jpg', N'1', N'30', N'2020-12-23 15:18:01', N'2021-06-30 01:55:01')
GO

INSERT INTO [dbo].[courses] VALUES (N'3', N'Power BI - Jan 2021', N'Short', N'<p><span style="font-size: 18px;"><strong>من خلال هذا الكورس سوف يتم معرفة كيفية انشاء التقارير المبنية علي قاعدة بيانات منظومة المشروعات الاستثمارية او من خلال اي قاعدة بيانات اخري في صورة اشكال بيانية باستخدام برنامج PowerBI</strong></span></p>
', N'power-bi-jan-2021', NULL, NULL, N'5', N'http://lms.mped.gov.eg/upload/image/6023ab88-4243-4132-ac8f-580cc09abdd9.jpg', N'1', N'7', N'2021-01-04 16:52:14', N'2021-05-24 14:23:01')
GO

INSERT INTO [dbo].[courses] VALUES (N'4', N'IT Unit', N'TEST', N'<p>Test</p>
', N'it-unit', NULL, NULL, N'5', N'http://lms.mped.gov.eg/upload/image/d8e26105-ff62-48e7-a8df-86a9bc059b28.jpg', N'1', N'7', N'2021-03-21 17:57:46', N'2021-03-28 12:15:30')
GO

INSERT INTO [dbo].[courses] VALUES (N'5', N'CCNA', N'asjlkasjldka', N'<p>a.,smd.a</p>
', N'ccna', NULL, NULL, N'1', N'http://lms.mped.gov.eg/upload/image/5a4c09cd-5590-4ff7-9315-ef299954cc68.jpg', N'1', N'7', N'2021-05-17 21:54:57', N'2021-05-17 21:54:57')
GO

INSERT INTO [dbo].[courses] VALUES (N'6', N'برنامج التدريب التمهيدي لإعداد دراسات الجدوي للمشروعات القومية', N'برنامج التدريب التمهيدي لإعداد دراسات الجدوي للمشروعات القومية
', N'<h1>برنامج التدريب التمهيدي لإعداد دراسات الجدوي للمشروعات القومية</h1>
', N'Preparatory-training-program-for-preparing-feasibility-studies-for-national-projects', NULL, NULL, N'53', N'http://lms.mped.gov.eg/upload/image/378e705a-dcbf-4006-b1b9-14fa2df0f5be.jpg', N'1', N'7', N'2021-06-02 13:50:10', N'2021-06-03 13:56:24')
GO

COMMIT
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
  [url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] tinyint  NOT NULL,
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
-- Records of documents
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[documents] VALUES (N'1', N'e710a1af-c237-4513-b4da-193f6950bf14', N'Noor-Book', N'http://lms.mped.gov.eg/upload/course/documents/20af645f-4480-4345-af76-2cd109ae8cba.pdf', N'4331467', N'20af645f-4480-4345-af76-2cd109ae8cba', N'application/pdf', N'0', N'0', N'1', N'1', N'1', N'2021-01-04 16:55:54', N'2021-01-04 16:55:54', NULL)
GO

COMMIT
GO


-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[failed_jobs]') AND type IN ('U'))
	DROP TABLE [dbo].[failed_jobs]
GO

CREATE TABLE [dbo].[failed_jobs] (
  [id] bigint  NOT NULL,
  [connection] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [queue] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [payload] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [exception] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [failed_at] datetime2(0)  NOT NULL
)
GO

ALTER TABLE [dbo].[failed_jobs] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[failed_jobs] VALUES (N'1', N'database', N'default', N'{"uuid":"bf2b5b66-bbcb-4a07-ba94-7b97d19da0cb","displayName":"App\\Mail\\UserEnrolled","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\Mail\\SendQueuedMailable","command":"O:34:\"Illuminate\\Mail\\SendQueuedMailable\":3:{s:8:\"mailable\";O:21:\"App\\Mail\\UserEnrolled\":27:{s:4:\"user\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":4:{s:5:\"class\";s:8:\"App\\User\";s:2:\"id\";i:329;s:9:\"relations\";a:1:{i:0;s:15:\"profile_picture\";}s:10:\"connection\";s:5:\"mysql\";}s:6:\"course\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":4:{s:5:\"class\";s:10:\"App\\Course\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";}s:6:\"locale\";N;s:4:\"from\";a:0:{}s:2:\"to\";a:1:{i:0;a:2:{s:4:\"name\";N;s:7:\"address\";s:23:\"Farah.sadek@mped.gov.eg\";}}s:2:\"cc\";a:0:{}s:3:\"bcc\";a:0:{}s:7:\"replyTo\";a:0:{}s:7:\"subject\";N;s:11:\"\u0000*\u0000markdown\";N;s:7:\"\u0000*\u0000html\";N;s:4:\"view\";N;s:8:\"textView\";N;s:8:\"viewData\";a:0:{}s:11:\"attachments\";a:0:{}s:14:\"rawAttachments\";a:0:{}s:15:\"diskAttachments\";a:0:{}s:9:\"callbacks\";a:0:{}s:5:\"theme\";N;s:6:\"mailer\";s:4:\"smtp\";s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}}s:5:\"tries\";N;s:7:\"timeout\";N;}"}}', N'Swift_TransportException: Expected response code 250 but got code "421", with message "421 4.4.2 Message submission rate for this client has exceeded the configured limit
" in D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php:457
Stack trace:
#0 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(341): Swift_Transport_AbstractSmtpTransport->assertResponseCode(''421 4.4.2 Messa...'', Array)
#1 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand(''MAIL FROM:<lms@...'', Array, Array, false, NULL)
#2 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(390): Swift_Transport_EsmtpTransport->executeCommand(''DATA\r\n'', Array, Array)
#3 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(497): Swift_Transport_AbstractSmtpTransport->doDataCommand(Array)
#4 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(516): Swift_Transport_AbstractSmtpTransport->doMailTransaction(Object(Swift_Message), ''lms@mped.gov.eg'', Array, Array)
#5 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(206): Swift_Transport_AbstractSmtpTransport->sendTo(Object(Swift_Message), ''lms@mped.gov.eg'', Array, Array)
#6 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Mailer.php(71): Swift_Transport_AbstractSmtpTransport->send(Object(Swift_Message), Array)
#7 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)
#8 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(288): Illuminate\Mail\Mailer->sendSwiftMessage(Object(Swift_Message))
#9 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(177): Illuminate\Mail\Mailer->send(''email.enrolled'', Array, Object(Closure))
#10 D:\lms\www\backend\vendor\illuminate\support\Traits\Localizable.php(19): Illuminate\Mail\Mailable->Illuminate\Mail\{closure}()
#11 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(178): Illuminate\Mail\Mailable->withLocale(NULL, Object(Closure))
#12 D:\lms\www\backend\vendor\illuminate\mail\SendQueuedMailable.php(52): Illuminate\Mail\Mailable->send(Object(Illuminate\Mail\MailManager))
#13 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Mail\SendQueuedMailable->handle(Object(Illuminate\Mail\MailManager))
#14 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#15 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#16 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#17 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#18 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(94): Illuminate\Container\Container->call(Array)
#19 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Bus\Dispatcher->Illuminate\Bus\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#20 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#21 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(98): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#22 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(83): Illuminate\Bus\Dispatcher->dispatchNow(Object(Illuminate\Mail\SendQueuedMailable), false)
#23 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Queue\CallQueuedHandler->Illuminate\Queue\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#24 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#25 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(85): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#26 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(59): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Mail\SendQueuedMailable))
#27 D:\lms\www\backend\vendor\illuminate\queue\Jobs\Job.php(98): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#28 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(356): Illuminate\Queue\Jobs\Job->fire()
#29 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(306): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#30 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(132): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#31 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(112): Illuminate\Queue\Worker->daemon(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#32 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(96): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#33 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#34 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#35 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#36 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#37 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#38 D:\lms\www\backend\vendor\illuminate\console\Command.php(134): Illuminate\Container\Container->call(Array)
#39 D:\lms\www\backend\vendor\symfony\console\Command\Command.php(258): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#40 D:\lms\www\backend\vendor\illuminate\console\Command.php(121): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#41 D:\lms\www\backend\vendor\symfony\console\Application.php(920): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#42 D:\lms\www\backend\vendor\symfony\console\Application.php(266): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#43 D:\lms\www\backend\vendor\symfony\console\Application.php(142): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#44 D:\lms\www\backend\vendor\illuminate\console\Application.php(93): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#45 D:\lms\www\backend\vendor\laravel\lumen-framework\src\Console\Kernel.php(116): Illuminate\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#46 D:\lms\www\backend\artisan(35): Laravel\Lumen\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#47 {main}', N'2021-09-01 18:36:56')
GO

INSERT INTO [dbo].[failed_jobs] VALUES (N'2', N'database', N'default', N'{"uuid":"1704d33f-33db-46af-85c2-297aab5657ba","displayName":"App\\Mail\\UserEnrolled","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"Illuminate\\Mail\\SendQueuedMailable","command":"O:34:\"Illuminate\\Mail\\SendQueuedMailable\":3:{s:8:\"mailable\";O:21:\"App\\Mail\\UserEnrolled\":27:{s:4:\"user\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":4:{s:5:\"class\";s:8:\"App\\User\";s:2:\"id\";i:335;s:9:\"relations\";a:1:{i:0;s:15:\"profile_picture\";}s:10:\"connection\";s:5:\"mysql\";}s:6:\"course\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":4:{s:5:\"class\";s:10:\"App\\Course\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";}s:6:\"locale\";N;s:4:\"from\";a:0:{}s:2:\"to\";a:1:{i:0;a:2:{s:4:\"name\";N;s:7:\"address\";s:22:\"haidy.riad@mped.gov.eg\";}}s:2:\"cc\";a:0:{}s:3:\"bcc\";a:0:{}s:7:\"replyTo\";a:0:{}s:7:\"subject\";N;s:11:\"\u0000*\u0000markdown\";N;s:7:\"\u0000*\u0000html\";N;s:4:\"view\";N;s:8:\"textView\";N;s:8:\"viewData\";a:0:{}s:11:\"attachments\";a:0:{}s:14:\"rawAttachments\";a:0:{}s:15:\"diskAttachments\";a:0:{}s:9:\"callbacks\";a:0:{}s:5:\"theme\";N;s:6:\"mailer\";s:4:\"smtp\";s:10:\"connection\";N;s:5:\"queue\";N;s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:5:\"delay\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}}s:5:\"tries\";N;s:7:\"timeout\";N;}"}}', N'Swift_IoException: Connection to tcp://mail.ipi.gov.eg:587 Timed Out in D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\StreamBuffer.php:166
Stack trace:
#0 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(467): Swift_Transport_StreamBuffer->readLine(149)
#1 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(339): Swift_Transport_AbstractSmtpTransport->getFullResponse(149)
#2 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand(''HELO [127.0.0.1...'', Array, Array, false, NULL)
#3 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(365): Swift_Transport_EsmtpTransport->executeCommand(''HELO [127.0.0.1...'', Array)
#4 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\EsmtpTransport.php(341): Swift_Transport_AbstractSmtpTransport->doHeloCommand()
#5 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(148): Swift_Transport_EsmtpTransport->doHeloCommand()
#6 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()
#7 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)
#8 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(288): Illuminate\Mail\Mailer->sendSwiftMessage(Object(Swift_Message))
#9 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(177): Illuminate\Mail\Mailer->send(''email.enrolled'', Array, Object(Closure))
#10 D:\lms\www\backend\vendor\illuminate\support\Traits\Localizable.php(19): Illuminate\Mail\Mailable->Illuminate\Mail\{closure}()
#11 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(178): Illuminate\Mail\Mailable->withLocale(NULL, Object(Closure))
#12 D:\lms\www\backend\vendor\illuminate\mail\SendQueuedMailable.php(52): Illuminate\Mail\Mailable->send(Object(Illuminate\Mail\MailManager))
#13 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Mail\SendQueuedMailable->handle(Object(Illuminate\Mail\MailManager))
#14 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#15 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#16 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#17 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#18 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(94): Illuminate\Container\Container->call(Array)
#19 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Bus\Dispatcher->Illuminate\Bus\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#20 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#21 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(98): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#22 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(83): Illuminate\Bus\Dispatcher->dispatchNow(Object(Illuminate\Mail\SendQueuedMailable), false)
#23 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Queue\CallQueuedHandler->Illuminate\Queue\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#24 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#25 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(85): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#26 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(59): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Mail\SendQueuedMailable))
#27 D:\lms\www\backend\vendor\illuminate\queue\Jobs\Job.php(98): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#28 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(356): Illuminate\Queue\Jobs\Job->fire()
#29 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(306): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#30 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(132): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#31 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(112): Illuminate\Queue\Worker->daemon(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#32 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(96): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#33 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#34 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#35 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#36 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#37 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#38 D:\lms\www\backend\vendor\illuminate\console\Command.php(134): Illuminate\Container\Container->call(Array)
#39 D:\lms\www\backend\vendor\symfony\console\Command\Command.php(258): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#40 D:\lms\www\backend\vendor\illuminate\console\Command.php(121): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#41 D:\lms\www\backend\vendor\symfony\console\Application.php(920): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#42 D:\lms\www\backend\vendor\symfony\console\Application.php(266): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#43 D:\lms\www\backend\vendor\symfony\console\Application.php(142): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#44 D:\lms\www\backend\vendor\illuminate\console\Application.php(93): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#45 D:\lms\www\backend\vendor\laravel\lumen-framework\src\Console\Kernel.php(116): Illuminate\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#46 D:\lms\www\backend\artisan(35): Laravel\Lumen\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#47 {main}

Next Swift_TransportException: Connection to tcp://mail.ipi.gov.eg:587 Timed Out in D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php:473
Stack trace:
#0 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(339): Swift_Transport_AbstractSmtpTransport->getFullResponse(149)
#1 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand(''HELO [127.0.0.1...'', Array, Array, false, NULL)
#2 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(365): Swift_Transport_EsmtpTransport->executeCommand(''HELO [127.0.0.1...'', Array)
#3 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\EsmtpTransport.php(341): Swift_Transport_AbstractSmtpTransport->doHeloCommand()
#4 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Transport\AbstractSmtpTransport.php(148): Swift_Transport_EsmtpTransport->doHeloCommand()
#5 D:\lms\www\backend\vendor\swiftmailer\swiftmailer\lib\classes\Swift\Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()
#6 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)
#7 D:\lms\www\backend\vendor\illuminate\mail\Mailer.php(288): Illuminate\Mail\Mailer->sendSwiftMessage(Object(Swift_Message))
#8 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(177): Illuminate\Mail\Mailer->send(''email.enrolled'', Array, Object(Closure))
#9 D:\lms\www\backend\vendor\illuminate\support\Traits\Localizable.php(19): Illuminate\Mail\Mailable->Illuminate\Mail\{closure}()
#10 D:\lms\www\backend\vendor\illuminate\mail\Mailable.php(178): Illuminate\Mail\Mailable->withLocale(NULL, Object(Closure))
#11 D:\lms\www\backend\vendor\illuminate\mail\SendQueuedMailable.php(52): Illuminate\Mail\Mailable->send(Object(Illuminate\Mail\MailManager))
#12 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Mail\SendQueuedMailable->handle(Object(Illuminate\Mail\MailManager))
#13 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#14 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#15 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#16 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#17 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(94): Illuminate\Container\Container->call(Array)
#18 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Bus\Dispatcher->Illuminate\Bus\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#19 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#20 D:\lms\www\backend\vendor\illuminate\bus\Dispatcher.php(98): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#21 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(83): Illuminate\Bus\Dispatcher->dispatchNow(Object(Illuminate\Mail\SendQueuedMailable), false)
#22 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(128): Illuminate\Queue\CallQueuedHandler->Illuminate\Queue\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#23 D:\lms\www\backend\vendor\illuminate\pipeline\Pipeline.php(103): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Mail\SendQueuedMailable))
#24 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(85): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#25 D:\lms\www\backend\vendor\illuminate\queue\CallQueuedHandler.php(59): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Mail\SendQueuedMailable))
#26 D:\lms\www\backend\vendor\illuminate\queue\Jobs\Job.php(98): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#27 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(356): Illuminate\Queue\Jobs\Job->fire()
#28 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(306): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#29 D:\lms\www\backend\vendor\illuminate\queue\Worker.php(132): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#30 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(112): Illuminate\Queue\Worker->daemon(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#31 D:\lms\www\backend\vendor\illuminate\queue\Console\WorkCommand.php(96): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#32 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#33 D:\lms\www\backend\vendor\illuminate\container\Util.php(37): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#34 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(93): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#35 D:\lms\www\backend\vendor\illuminate\container\BoundMethod.php(37): Illuminate\Container\BoundMethod::callBoundMethod(Object(Laravel\Lumen\Application), Array, Object(Closure))
#36 D:\lms\www\backend\vendor\illuminate\container\Container.php(596): Illuminate\Container\BoundMethod::call(Object(Laravel\Lumen\Application), Array, Array, NULL)
#37 D:\lms\www\backend\vendor\illuminate\console\Command.php(134): Illuminate\Container\Container->call(Array)
#38 D:\lms\www\backend\vendor\symfony\console\Command\Command.php(258): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#39 D:\lms\www\backend\vendor\illuminate\console\Command.php(121): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#40 D:\lms\www\backend\vendor\symfony\console\Application.php(920): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#41 D:\lms\www\backend\vendor\symfony\console\Application.php(266): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#42 D:\lms\www\backend\vendor\symfony\console\Application.php(142): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#43 D:\lms\www\backend\vendor\illuminate\console\Application.php(93): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#44 D:\lms\www\backend\vendor\laravel\lumen-framework\src\Console\Kernel.php(116): Illuminate\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#45 D:\lms\www\backend\artisan(35): Laravel\Lumen\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#46 {main}', N'2021-09-01 18:37:31')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for groups
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type IN ('U'))
	DROP TABLE [dbo].[groups]
GO

CREATE TABLE [dbo].[groups] (
  [id] bigint  NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_ldap] tinyint  NOT NULL,
  [is_active] tinyint  NOT NULL,
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
-- Records of groups
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[groups] VALUES (N'1', N'ae9d7298-2dee-443e-9424-26eada86cb4e', N'Technical', N'0', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL)
GO

INSERT INTO [dbo].[groups] VALUES (N'2', N'bab76795-46ed-4f54-b238-cfb51392d89f', N'Designers', N'0', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL)
GO

INSERT INTO [dbo].[groups] VALUES (N'3', N'3962385b-7987-46da-b3e8-3b6034f1bff3', N'Accountant', N'0', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL)
GO

INSERT INTO [dbo].[groups] VALUES (N'4', N'f9e71f2f-6c14-4af7-ac55-e5dbc94b8f9f', N'Test !', N'0', N'1', N'5', N'5', N'2021-06-03 17:09:36', N'2021-06-03 17:09:36', NULL)
GO

INSERT INTO [dbo].[groups] VALUES (N'7', N'485de593-c89d-4d7f-85df-b669329bc3a4', N'LMS-PowerBi', N'1', N'1', N'1', N'1', N'2021-06-16 15:43:02', N'2021-09-01 19:29:02', NULL)
GO

INSERT INTO [dbo].[groups] VALUES (N'9', N'7a48e829-8070-4d7a-902b-e8646a8e509f', N'LMS NI Feasibility study', N'1', N'1', N'1', N'1', N'2021-06-17 09:05:03', N'2021-09-01 19:29:02', NULL)
GO

COMMIT
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
  [url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] tinyint  NOT NULL,
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
-- Records of images
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[images] VALUES (N'1', N'2ccf39ca-c05a-42a5-98ab-23a0fb1fd26e', N'1', N'http://lms.mped.gov.eg/upload/image/2ccf39ca-c05a-42a5-98ab-23a0fb1fd26e.jpg', N'6571', N'2ccf39ca-c05a-42a5-98ab-23a0fb1fd26e', N'image/jpeg', N'0', N'0', N'1', N'1', N'1', N'2020-12-23 15:16:22', N'2020-12-23 15:16:22', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'2', N'5a4c09cd-5590-4ff7-9315-ef299954cc68', N'power-bi-1', N'http://lms.mped.gov.eg/upload/image/5a4c09cd-5590-4ff7-9315-ef299954cc68.jpg', N'50530', N'5a4c09cd-5590-4ff7-9315-ef299954cc68', N'image/jpeg', N'0', N'0', N'1', N'1', N'1', N'2021-01-04 16:43:17', N'2021-01-04 16:43:17', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'3', N'5b1b2ceb-b6da-45ca-b4b5-b30c753ae87c', N'wifi', N'http://lms.mped.gov.eg/upload/image/5b1b2ceb-b6da-45ca-b4b5-b30c753ae87c.jpg', N'38060', N'5b1b2ceb-b6da-45ca-b4b5-b30c753ae87c', N'image/jpeg', N'0', N'0', N'1', N'1', N'1', N'2021-03-21 18:02:50', N'2021-03-21 18:02:50', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'4', N'd8e26105-ff62-48e7-a8df-86a9bc059b28', N'unnamed', N'http://lms.mped.gov.eg/upload/image/d8e26105-ff62-48e7-a8df-86a9bc059b28.jpg', N'37228', N'd8e26105-ff62-48e7-a8df-86a9bc059b28', N'image/jpeg', N'0', N'0', N'5', N'5', N'5', N'2021-03-21 18:30:10', N'2021-03-21 18:30:10', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'5', N'4d915065-8416-4b79-9171-339674904edb', N'Power Bi', N'http://lms.mped.gov.eg/upload/image/4d915065-8416-4b79-9171-339674904edb.PNG', N'110746', N'4d915065-8416-4b79-9171-339674904edb', N'image/png', N'0', N'0', N'5', N'5', N'5', N'2021-05-24 11:38:28', N'2021-05-24 11:38:28', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'6', N'ed1bb369-6cea-4724-b0c8-df0f70e7e284', N'Power Bi', N'http://lms.mped.gov.eg/upload/image/ed1bb369-6cea-4724-b0c8-df0f70e7e284.PNG', N'110746', N'ed1bb369-6cea-4724-b0c8-df0f70e7e284', N'image/png', N'0', N'0', N'5', N'5', N'5', N'2021-05-24 11:40:40', N'2021-05-24 11:40:40', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'7', N'170118e7-d328-4470-a1d5-268a4da0a186', N'Power Bi', N'http://lms.mped.gov.eg/upload/image/170118e7-d328-4470-a1d5-268a4da0a186.PNG', N'116819', N'170118e7-d328-4470-a1d5-268a4da0a186', N'image/png', N'0', N'0', N'5', N'5', N'5', N'2021-05-24 14:21:27', N'2021-05-24 14:21:27', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'8', N'6023ab88-4243-4132-ac8f-580cc09abdd9', N'منظومة المشروعات الإستثمارية with ease', N'http://lms.mped.gov.eg/upload/image/6023ab88-4243-4132-ac8f-580cc09abdd9.jpg', N'196939', N'6023ab88-4243-4132-ac8f-580cc09abdd9', N'image/jpeg', N'0', N'0', N'5', N'5', N'5', N'2021-05-24 14:22:47', N'2021-05-24 14:22:47', NULL)
GO

INSERT INTO [dbo].[images] VALUES (N'9', N'378e705a-dcbf-4006-b1b9-14fa2df0f5be', N'Feasibility Studies_large (1)', N'http://lms.mped.gov.eg/upload/image/378e705a-dcbf-4006-b1b9-14fa2df0f5be.jpg', N'288070', N'378e705a-dcbf-4006-b1b9-14fa2df0f5be', N'image/jpeg', N'0', N'0', N'5', N'5', N'5', N'2021-06-02 13:55:39', N'2021-06-02 13:55:39', NULL)
GO

COMMIT
GO


-- ----------------------------
-- Table structure for jobs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[jobs]') AND type IN ('U'))
	DROP TABLE [dbo].[jobs]
GO

CREATE TABLE [dbo].[jobs] (
  [id] bigint  NOT NULL,
  [queue] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [payload] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [attempts] tinyint  NOT NULL,
  [reserved_at] int  NULL,
  [available_at] int  NOT NULL,
  [created_at] int  NOT NULL
)
GO

ALTER TABLE [dbo].[jobs] SET (LOCK_ESCALATION = TABLE)
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
  [url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [size] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [file_key] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [quality] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [duration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [private] tinyint  NOT NULL,
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
-- Records of media
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[media] VALUES (N'1', N'011a7467-a4dd-416a-beea-be8b16b3fa5b', N'WIFI 1', N'http://lms.mped.gov.eg/upload/course/media/768_8630b23e-0806-4835-8c2c-ae20a212cbf9.mp4', N'27511868', N'8630b23e-0806-4835-8c2c-ae20a212cbf9', N'video/mp4', N'768', N'15:19', N'1', N'0', N'1', N'1', N'1', N'2021-03-21 18:02:22', N'2021-03-21 18:02:22', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'2', N'05186224-4580-4539-b3e1-239ecd9c111a', N'WIFI 1', N'http://lms.mped.gov.eg/upload/course/media/1080_40046527-cf8e-4ef3-978d-7515b0de132e.mp4', N'63679908', N'40046527-cf8e-4ef3-978d-7515b0de132e', N'video/mp4', N'1080', N'3:14', N'1', N'0', N'5', N'5', N'5', N'2021-03-21 22:57:58', N'2021-03-21 22:57:58', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'3', N'f0e87572-7b5b-444a-85cd-55bf515d8299', N'WIFI 1', N'http://lms.mped.gov.eg/upload/course/media/1080_42acc591-a242-49c8-a5c0-5321cf9f697c.mp4', N'63679908', N'42acc591-a242-49c8-a5c0-5321cf9f697c', N'video/mp4', N'1080', N'3:14', N'1', N'0', N'5', N'5', N'5', N'2021-03-21 23:01:41', N'2021-03-21 23:01:41', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'4', N'76a5be68-f4a5-42c7-b02d-1f597c36aec1', N'Manzoma Part 1', N'http://lms.mped.gov.eg/upload/course/media/1080_304bba62-2b10-42ad-b15d-f591108eedb8.mp4', N'78876297', N'304bba62-2b10-42ad-b15d-f591108eedb8', N'video/mp4', N'1080', N'4:18', N'1', N'0', N'5', N'5', N'5', N'2021-05-04 11:02:23', N'2021-05-04 11:02:23', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'5', N'16734298-8cd1-4db3-bc0f-9594b9a88f4a', N'1- Manzoma Introduction & User interface', N'http://lms.mped.gov.eg/upload/course/media/1040_e7e0f35b-be82-456f-bffe-c9b1d2821aa3.mp4', N'98407425', N'e7e0f35b-be82-456f-bffe-c9b1d2821aa3', N'video/mp4', N'1040', N'5:41', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 11:42:35', N'2021-05-24 11:42:35', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'6', N'cd17c248-60ef-42bd-8c5c-20002327a969', N'2- Pie chart & Format', N'http://lms.mped.gov.eg/upload/course/media/1040_b64ba004-08b9-4182-80bc-4f8d37822a56.mp4', N'64092293', N'b64ba004-08b9-4182-80bc-4f8d37822a56', N'video/mp4', N'1040', N'4:05', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 12:10:21', N'2021-05-24 12:10:21', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'7', N'39d2e66c-613e-4942-a4d6-476037dcb55f', N'3- Filter & Drillthrouh', N'http://lms.mped.gov.eg/upload/course/media/1040_8470edb3-3cdc-48a4-89a5-65c008a34af6.mp4', N'71475802', N'8470edb3-3cdc-48a4-89a5-65c008a34af6', N'video/mp4', N'1040', N'4:12', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 12:31:03', N'2021-05-24 12:31:03', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'8', N'4089506f-edc0-41dc-8fc8-c6935b7c7fd6', N'4- Manzoma MAP', N'http://lms.mped.gov.eg/upload/course/media/1040_12d7b8ac-9402-4091-a0d8-02117985634c.mp4', N'70129019', N'12d7b8ac-9402-4091-a0d8-02117985634c', N'video/mp4', N'1040', N'4:01', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 13:10:02', N'2021-05-24 13:10:02', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'9', N'692aaca7-8742-40c7-8d35-7017c12a8bff', N'5- Manzoma ForCasting', N'http://lms.mped.gov.eg/upload/course/media/1040_8cf3d34a-2042-40ca-b0ac-5be5d921e023.mp4', N'47628500', N'8cf3d34a-2042-40ca-b0ac-5be5d921e023', N'video/mp4', N'1040', N'2:35', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 13:23:49', N'2021-05-24 13:23:49', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'10', N'78f3e797-b497-4425-846f-f9b60309c4ea', N'6- Manzoma Get Data & Save & Share', N'http://lms.mped.gov.eg/upload/course/media/1040_05473742-bb21-4bcd-bb37-0412d9c0c9c4.mp4', N'60217410', N'05473742-bb21-4bcd-bb37-0412d9c0c9c4', N'video/mp4', N'1040', N'3:55', N'1', N'0', N'5', N'5', N'5', N'2021-05-24 13:54:03', N'2021-05-24 13:54:03', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'11', N'abf40ff0-c562-4146-866a-027caa9a4192', N'1) دراسة الجدوى', N'http://lms.mped.gov.eg/upload/course/media/720_ffe10ae5-9e0e-45cd-b343-25827bcae600.mp4', N'863901660', N'ffe10ae5-9e0e-45cd-b343-25827bcae600', N'video/mp4', N'720', N'26:54', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:41:32', N'2021-06-03 09:41:32', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'12', N'433adc05-203f-4186-822c-4ba6986a9048', N'2)مراحل اعداد دراسة الجدوى', N'http://lms.mped.gov.eg/upload/course/media/720_e39d666d-7208-4c7e-b082-b2cc5440b513.mp4', N'961499273', N'e39d666d-7208-4c7e-b082-b2cc5440b513', N'video/mp4', N'720', N'29:56', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:44:34', N'2021-06-03 09:44:34', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'13', N'5bf765e4-fd4b-4c03-98da-c52e9321afa4', N'4)علاوة – حالات عملية', N'http://lms.mped.gov.eg/upload/course/media/720_3c4942a9-0c24-4b1a-a81a-6637f2ccac87.mp4', N'528676312', N'3c4942a9-0c24-4b1a-a81a-6637f2ccac87', N'video/mp4', N'720', N'16:30', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:45:53', N'2021-06-03 09:45:53', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'14', N'b06d424b-1ac2-48ac-8b0a-7b09072dcdb4', N'3)تصنيف المشروعات', N'http://lms.mped.gov.eg/upload/course/media/720_d89b181b-de6b-47b0-8e33-57766d2e3599.mp4', N'451585014', N'd89b181b-de6b-47b0-8e33-57766d2e3599', N'video/mp4', N'720', N'14:07', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:50:50', N'2021-06-03 09:50:50', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'15', N'a45cb109-b0fb-4532-ad89-618dd1eef845', N'7)أثر دراسة الجدوى القومية اقتصاديا', N'http://lms.mped.gov.eg/upload/course/media/720_0cd538fa-1b17-4bef-9cdf-a82a37eaaa61.mp4', N'709589119', N'0cd538fa-1b17-4bef-9cdf-a82a37eaaa61', N'video/mp4', N'720', N'22:07', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:54:35', N'2021-06-03 09:54:35', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'16', N'20b8546d-501a-4e10-8c79-362fdfa978cd', N'6)محاور دراسة الجدوى القومية', N'http://lms.mped.gov.eg/upload/course/media/720_8c12d99f-5b3e-40f4-ab5a-3553b14050e3.mp4', N'983383984', N'8c12d99f-5b3e-40f4-ab5a-3553b14050e3', N'video/mp4', N'720', N'30:37', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:54:45', N'2021-06-03 09:54:45', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'17', N'cbe13dee-84a6-40c0-ae0b-7849e282036a', N'8)تمهيد دراسة الجدوى المالية', N'http://lms.mped.gov.eg/upload/course/media/720_28b07e67-8b17-46d8-a5b9-6dec1b7e9d80.mp4', N'1748587802', N'28b07e67-8b17-46d8-a5b9-6dec1b7e9d80', N'video/mp4', N'720', N'54:20', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:55:31', N'2021-06-03 09:55:31', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'18', N'a72bde33-02e8-407d-a1a2-c39d8d6b0564', N'10)امثلة الموازنة العامة للدولة', N'http://lms.mped.gov.eg/upload/course/media/720_919d914d-60fd-44c0-9fd8-6cfcf919708c.mp4', N'1023800311', N'919d914d-60fd-44c0-9fd8-6cfcf919708c', N'video/mp4', N'720', N'31:52', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 09:56:13', N'2021-06-03 09:56:13', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'19', N'9d34f677-d89b-45ba-bea1-37def6cb43d8', N'5)دراسة الجدوى القومية', N'http://lms.mped.gov.eg/upload/course/media/720_c6484258-33f5-4e28-8ab7-b5a67b982800.mp4', N'952541159', N'c6484258-33f5-4e28-8ab7-b5a67b982800', N'video/mp4', N'720', N'29:40', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 10:41:07', N'2021-06-03 10:41:07', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'20', N'c312b8d9-884c-41df-9213-f6e6be7668c8', N'9)الفرق بين الإنفاق الجاري والاستثماري', N'http://lms.mped.gov.eg/upload/course/media/720_01579b5d-73ac-4dbc-8fbb-75f45e10a9a0.mp4', N'937570248', N'01579b5d-73ac-4dbc-8fbb-75f45e10a9a0', N'video/mp4', N'720', N'29:11', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 10:46:16', N'2021-06-03 10:46:16', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'21', N'8e9458e0-153b-4156-b2a8-36b30d9e0b5f', N'12)مفهوم تكلفة الفرصة البديلة', N'http://lms.mped.gov.eg/upload/course/media/720_0062bb7e-f2b1-48e0-98f0-82f660b63634.mp4', N'746699730', N'0062bb7e-f2b1-48e0-98f0-82f660b63634', N'video/mp4', N'720', N'23:16', N'1', N'0', N'5', N'5', N'5', N'2021-06-03 10:49:07', N'2021-06-03 10:49:07', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'22', N'14678fb8-3e12-4c6d-b12f-fd1fd3389366', N'Quez', N'http://lms.mped.gov.eg/upload/course/media/1040_992fe3d9-4651-4d88-a03f-458d1f1b1fe3.mp4', N'103093187', N'992fe3d9-4651-4d88-a03f-458d1f1b1fe3', N'video/mp4', N'1040', N'5:10', N'1', N'0', N'5', N'5', N'5', N'2021-06-13 16:23:56', N'2021-06-13 16:23:56', NULL)
GO

INSERT INTO [dbo].[media] VALUES (N'23', N'd9fcf282-d1ca-47c7-a3e8-eab827566887', N'QQQ', N'http://lms.mped.gov.eg/upload/course/media/1040_44d88bd8-fb82-47e6-8b79-089b980b73ea.mp4', N'117549315', N'44d88bd8-fb82-47e6-8b79-089b980b73ea', N'video/mp4', N'1040', N'5:16', N'1', N'0', N'5', N'5', N'5', N'2021-06-17 09:02:08', N'2021-06-17 09:02:08', NULL)
GO

COMMIT
GO


-- ----------------------------
-- Table structure for migrations
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[migrations]') AND type IN ('U'))
	DROP TABLE [dbo].[migrations]
GO

CREATE TABLE [dbo].[migrations] (
  [id] int  NOT NULL,
  [migration] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [batch] int  NOT NULL
)
GO

ALTER TABLE [dbo].[migrations] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[migrations] VALUES (N'1', N'2017_12_01_160502_user_tables', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'2', N'2017_12_08_142555_add_groups_tables', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'3', N'2017_12_08_142555_add_roles_tables', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'4', N'2020_06_01_044244_otp', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'5', N'2020_06_01_061537_announcement', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'6', N'2020_06_01_061537_profile', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'7', N'2020_06_02_093515_queues', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'8', N'2020_06_02_115721_uploads', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'9', N'2020_07_16_210333_create_tags_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'10', N'2020_07_16_210400_create_settings_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'11', N'2020_07_16_210401_create_categories_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'12', N'2020_07_16_210402_create_courses_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'13', N'2020_07_16_210430_create_sections_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'14', N'2020_07_16_210553_create_classes_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'15', N'2020_07_16_210858_create_quizs_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'16', N'2020_07_16_211325_create_bundles_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'17', N'2020_07_16_211509_create_certificates_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'18', N'2020_07_16_211542_create_notes_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'19', N'2020_07_16_211624_create_ratings_table', N'1')
GO

INSERT INTO [dbo].[migrations] VALUES (N'20', N'2020_07_16_211625_create_security_questions_table', N'1')
GO

COMMIT
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
  [correct] tinyint  NOT NULL,
  [order] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[options] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of options
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[options] VALUES (N'1', N'HTML & CSS', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'2', N'Perl', N'1', N'0', N'2', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'3', N'Oracle', N'1', N'0', N'3', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'4', N'abot', N'2', N'0', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'5', N'Correct', N'2', N'1', N'2', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'6', N'Contact Html', N'1', N'0', N'3', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[options] VALUES (N'7', N'Ans 1', N'3', N'0', N'1', N'2020-12-23 15:25:04', N'2020-12-23 15:25:04')
GO

INSERT INTO [dbo].[options] VALUES (N'8', N'Ans 2', N'3', N'1', N'2', N'2020-12-23 15:25:04', N'2020-12-23 15:25:04')
GO

INSERT INTO [dbo].[options] VALUES (N'9', N'Ans 3', N'3', N'0', N'3', N'2020-12-23 15:25:04', N'2020-12-23 15:25:04')
GO

INSERT INTO [dbo].[options] VALUES (N'13', N'MOP', N'5', N'1', N'1', N'2021-03-21 18:07:33', N'2021-03-21 18:07:33')
GO

INSERT INTO [dbo].[options] VALUES (N'14', N'MOP-Guests', N'5', N'0', N'2', N'2021-03-21 18:07:33', N'2021-03-21 18:07:33')
GO

INSERT INTO [dbo].[options] VALUES (N'15', N'MOP-M', N'5', N'0', N'3', N'2021-03-21 18:07:33', N'2021-03-21 18:07:33')
GO

INSERT INTO [dbo].[options] VALUES (N'16', N'Email Account', N'6', N'0', N'1', N'2021-03-21 18:12:14', N'2021-03-21 18:12:45')
GO

INSERT INTO [dbo].[options] VALUES (N'17', N'Domain Account', N'6', N'1', N'2', N'2021-03-21 18:12:14', N'2021-03-21 18:12:45')
GO

INSERT INTO [dbo].[options] VALUES (N'18', N'Bank Account', N'6', N'0', N'3', N'2021-03-21 18:12:14', N'2021-03-21 18:12:45')
GO

INSERT INTO [dbo].[options] VALUES (N'19', N'Import From Database', N'7', N'0', N'1', N'2021-05-24 11:55:02', N'2021-05-24 11:55:02')
GO

INSERT INTO [dbo].[options] VALUES (N'20', N'Paste or manually enter data', N'7', N'0', N'2', N'2021-05-24 11:55:02', N'2021-05-24 11:55:02')
GO

INSERT INTO [dbo].[options] VALUES (N'21', N'Pick a published dataset', N'7', N'1', N'3', N'2021-05-24 11:55:02', N'2021-05-24 11:55:02')
GO

INSERT INTO [dbo].[options] VALUES (N'22', N'Create from scratch database', N'7', N'0', N'4', N'2021-05-24 11:55:02', N'2021-05-24 11:55:02')
GO

INSERT INTO [dbo].[options] VALUES (N'23', N'Visualizations', N'8', N'0', N'1', N'2021-05-24 11:55:22', N'2021-05-24 12:01:49')
GO

INSERT INTO [dbo].[options] VALUES (N'24', N'Fields', N'8', N'1', N'2', N'2021-05-24 11:55:22', N'2021-05-24 12:01:49')
GO

INSERT INTO [dbo].[options] VALUES (N'25', N'Filters', N'8', N'0', N'3', N'2021-05-24 11:55:22', N'2021-05-24 12:01:49')
GO

INSERT INTO [dbo].[options] VALUES (N'26', N'Manzoma Servers', N'8', N'0', N'4', N'2021-05-24 11:55:22', N'2021-05-24 12:01:49')
GO

INSERT INTO [dbo].[options] VALUES (N'27', N'الباب الرابع بالموازنة العامة للدولة', N'9', N'0', N'1', N'2021-05-24 12:06:51', N'2021-05-24 12:06:51')
GO

INSERT INTO [dbo].[options] VALUES (N'28', N'الجهات السيادية للدولة', N'9', N'0', N'2', N'2021-05-24 12:06:51', N'2021-05-24 12:06:51')
GO

INSERT INTO [dbo].[options] VALUES (N'29', N'المرافق', N'9', N'0', N'3', N'2021-05-24 12:06:51', N'2021-05-24 12:06:51')
GO

INSERT INTO [dbo].[options] VALUES (N'30', N'التبعيات', N'9', N'1', N'4', N'2021-05-24 12:06:51', N'2021-05-24 12:06:51')
GO

INSERT INTO [dbo].[options] VALUES (N'31', N'Axis', N'10', N'0', N'1', N'2021-05-24 12:14:48', N'2021-05-24 12:20:09')
GO

INSERT INTO [dbo].[options] VALUES (N'32', N'Legend', N'10', N'0', N'2', N'2021-05-24 12:14:48', N'2021-05-24 12:20:09')
GO

INSERT INTO [dbo].[options] VALUES (N'33', N'Values', N'10', N'1', N'3', N'2021-05-24 12:14:48', N'2021-05-24 12:20:09')
GO

INSERT INTO [dbo].[options] VALUES (N'34', N'Filters', N'10', N'0', N'4', N'2021-05-24 12:14:48', N'2021-05-24 12:20:09')
GO

INSERT INTO [dbo].[options] VALUES (N'35', N'Category, Data Value', N'11', N'0', N'1', N'2021-05-24 12:26:39', N'2021-05-24 12:26:52')
GO

INSERT INTO [dbo].[options] VALUES (N'36', N'Percentage', N'11', N'0', N'2', N'2021-05-24 12:26:39', N'2021-05-24 12:26:52')
GO

INSERT INTO [dbo].[options] VALUES (N'37', N'Data Value, Percent of total', N'11', N'1', N'3', N'2021-05-24 12:26:39', N'2021-05-24 12:26:52')
GO

INSERT INTO [dbo].[options] VALUES (N'38', N'Investment Percentage', N'11', N'0', N'4', N'2021-05-24 12:26:39', N'2021-05-24 12:26:52')
GO

INSERT INTO [dbo].[options] VALUES (N'39', N'Filters on this visual', N'12', N'0', N'1', N'2021-05-24 12:42:16', N'2021-05-24 12:52:27')
GO

INSERT INTO [dbo].[options] VALUES (N'40', N'Filters on this page', N'12', N'1', N'2', N'2021-05-24 12:42:16', N'2021-05-24 12:52:27')
GO

INSERT INTO [dbo].[options] VALUES (N'41', N'Filters on this workspace', N'12', N'0', N'3', N'2021-05-24 12:42:16', N'2021-05-24 12:52:27')
GO

INSERT INTO [dbo].[options] VALUES (N'42', N'Filters on all pages', N'12', N'0', N'4', N'2021-05-24 12:42:16', N'2021-05-24 12:52:27')
GO

INSERT INTO [dbo].[options] VALUES (N'43', N'Axis', N'13', N'0', N'1', N'2021-05-24 13:00:07', N'2021-05-24 13:00:07')
GO

INSERT INTO [dbo].[options] VALUES (N'44', N'Drill through', N'13', N'0', N'2', N'2021-05-24 13:00:07', N'2021-05-24 13:00:07')
GO

INSERT INTO [dbo].[options] VALUES (N'45', N'Tool Tips', N'13', N'1', N'3', N'2021-05-24 13:00:07', N'2021-05-24 13:00:07')
GO

INSERT INTO [dbo].[options] VALUES (N'46', N'Filters', N'13', N'0', N'4', N'2021-05-24 13:00:07', N'2021-05-24 13:00:07')
GO

INSERT INTO [dbo].[options] VALUES (N'47', N'Slicer', N'14', N'1', N'1', N'2021-05-24 13:04:11', N'2021-05-24 13:04:26')
GO

INSERT INTO [dbo].[options] VALUES (N'48', N'Pie Chart', N'14', N'0', N'2', N'2021-05-24 13:04:11', N'2021-05-24 13:04:26')
GO

INSERT INTO [dbo].[options] VALUES (N'49', N'Bar Chart', N'14', N'0', N'3', N'2021-05-24 13:04:11', N'2021-05-24 13:04:26')
GO

INSERT INTO [dbo].[options] VALUES (N'50', N'Visual Data', N'14', N'0', N'4', N'2021-05-24 13:04:11', N'2021-05-24 13:04:26')
GO

INSERT INTO [dbo].[options] VALUES (N'51', N'Legend', N'15', N'0', N'1', N'2021-05-24 13:14:53', N'2021-05-24 13:14:53')
GO

INSERT INTO [dbo].[options] VALUES (N'52', N'Value', N'15', N'0', N'2', N'2021-05-24 13:14:53', N'2021-05-24 13:14:53')
GO

INSERT INTO [dbo].[options] VALUES (N'53', N'Country', N'15', N'0', N'3', N'2021-05-24 13:14:53', N'2021-05-24 13:14:53')
GO

INSERT INTO [dbo].[options] VALUES (N'54', N'Location', N'15', N'1', N'4', N'2021-05-24 13:14:53', N'2021-05-24 13:14:53')
GO

INSERT INTO [dbo].[options] VALUES (N'55', N'Dashboard', N'16', N'0', N'1', N'2021-05-24 13:21:17', N'2021-05-24 13:21:17')
GO

INSERT INTO [dbo].[options] VALUES (N'56', N'Card', N'16', N'1', N'2', N'2021-05-24 13:21:17', N'2021-05-24 13:21:17')
GO

INSERT INTO [dbo].[options] VALUES (N'57', N'Filters', N'16', N'0', N'3', N'2021-05-24 13:21:17', N'2021-05-24 13:21:17')
GO

INSERT INTO [dbo].[options] VALUES (N'58', N'Dataset', N'16', N'0', N'4', N'2021-05-24 13:21:17', N'2021-05-24 13:21:17')
GO

INSERT INTO [dbo].[options] VALUES (N'59', N'Donate Chart', N'17', N'0', N'1', N'2021-05-24 13:31:48', N'2021-05-24 13:31:48')
GO

INSERT INTO [dbo].[options] VALUES (N'60', N'Line Chart', N'17', N'1', N'2', N'2021-05-24 13:31:48', N'2021-05-24 13:31:48')
GO

INSERT INTO [dbo].[options] VALUES (N'61', N'Bar Chart', N'17', N'0', N'3', N'2021-05-24 13:31:48', N'2021-05-24 13:31:48')
GO

INSERT INTO [dbo].[options] VALUES (N'62', N'Forecasting ', N'17', N'0', N'4', N'2021-05-24 13:31:48', N'2021-05-24 13:31:48')
GO

INSERT INTO [dbo].[options] VALUES (N'63', N'العام المالي وقيم الاستثمارات', N'18', N'0', N'1', N'2021-05-24 13:44:43', N'2021-05-24 13:44:43')
GO

INSERT INTO [dbo].[options] VALUES (N'64', N'السنوات وقيم الاستثمارات', N'18', N'1', N'2', N'2021-05-24 13:44:43', N'2021-05-24 13:44:43')
GO

INSERT INTO [dbo].[options] VALUES (N'65', N'الاقسام وقيم الاستثمارت', N'18', N'0', N'3', N'2021-05-24 13:44:43', N'2021-05-24 13:44:43')
GO

INSERT INTO [dbo].[options] VALUES (N'66', N'البيانات المستقبلية', N'18', N'0', N'4', N'2021-05-24 13:44:43', N'2021-05-24 13:44:43')
GO

INSERT INTO [dbo].[options] VALUES (N'67', N'Visualizations, Format, Legend', N'19', N'0', N'1', N'2021-05-24 13:50:54', N'2021-05-24 13:50:54')
GO

INSERT INTO [dbo].[options] VALUES (N'68', N'Fields, Axis, Data', N'19', N'0', N'2', N'2021-05-24 13:50:54', N'2021-05-24 13:50:54')
GO

INSERT INTO [dbo].[options] VALUES (N'69', N'Visualizations, Analytics, forecast', N'19', N'1', N'3', N'2021-05-24 13:50:54', N'2021-05-24 13:50:54')
GO

INSERT INTO [dbo].[options] VALUES (N'70', N'ArcGIS Map', N'19', N'0', N'4', N'2021-05-24 13:50:54', N'2021-05-24 13:50:54')
GO

INSERT INTO [dbo].[options] VALUES (N'71', N'My Information', N'20', N'0', N'1', N'2021-05-24 14:01:47', N'2021-05-24 14:01:47')
GO

INSERT INTO [dbo].[options] VALUES (N'72', N'Get Value', N'20', N'0', N'2', N'2021-05-24 14:01:47', N'2021-05-24 14:01:47')
GO

INSERT INTO [dbo].[options] VALUES (N'73', N'Get Data', N'20', N'1', N'3', N'2021-05-24 14:01:47', N'2021-05-24 14:01:47')
GO

INSERT INTO [dbo].[options] VALUES (N'74', N'Dashboard', N'20', N'0', N'4', N'2021-05-24 14:01:47', N'2021-05-24 14:01:47')
GO

INSERT INTO [dbo].[options] VALUES (N'75', N'Share', N'21', N'0', N'1', N'2021-05-24 14:04:44', N'2021-05-24 14:04:44')
GO

INSERT INTO [dbo].[options] VALUES (N'76', N'Edit', N'21', N'1', N'2', N'2021-05-24 14:04:44', N'2021-05-24 14:04:44')
GO

INSERT INTO [dbo].[options] VALUES (N'77', N'Save', N'21', N'0', N'3', N'2021-05-24 14:04:44', N'2021-05-24 14:04:44')
GO

INSERT INTO [dbo].[options] VALUES (N'78', N'Get Chart', N'21', N'0', N'4', N'2021-05-24 14:04:44', N'2021-05-24 14:04:44')
GO

INSERT INTO [dbo].[options] VALUES (N'79', N'Whiteboard', N'22', N'0', N'1', N'2021-05-24 14:08:32', N'2021-05-24 14:08:32')
GO

INSERT INTO [dbo].[options] VALUES (N'80', N'Donate Chart', N'22', N'0', N'2', N'2021-05-24 14:08:32', N'2021-05-24 14:08:32')
GO

INSERT INTO [dbo].[options] VALUES (N'81', N'Dashboard', N'22', N'1', N'3', N'2021-05-24 14:08:32', N'2021-05-24 14:08:32')
GO

INSERT INTO [dbo].[options] VALUES (N'82', N'Favorites ', N'22', N'0', N'4', N'2021-05-24 14:08:32', N'2021-05-24 14:08:32')
GO

INSERT INTO [dbo].[options] VALUES (N'83', N'السوقي', N'23', N'0', N'1', N'2021-06-03 12:54:26', N'2021-06-03 12:54:26')
GO

INSERT INTO [dbo].[options] VALUES (N'84', N'الفني', N'23', N'0', N'2', N'2021-06-03 12:54:26', N'2021-06-03 12:54:26')
GO

INSERT INTO [dbo].[options] VALUES (N'85', N'المالي والاقتصادي', N'23', N'0', N'3', N'2021-06-03 12:54:26', N'2021-06-03 12:54:26')
GO

INSERT INTO [dbo].[options] VALUES (N'86', N'كل ماسبق', N'23', N'1', N'4', N'2021-06-03 12:54:26', N'2021-06-03 12:54:26')
GO

INSERT INTO [dbo].[options] VALUES (N'87', N'استكشاف أولي حول الاستثمار المحتمل', N'24', N'0', N'1', N'2021-06-03 12:55:15', N'2021-06-03 12:55:15')
GO

INSERT INTO [dbo].[options] VALUES (N'88', N'استكشاف نهائي حول الاستثمار المحتمل', N'24', N'0', N'2', N'2021-06-03 12:55:15', N'2021-06-03 12:55:15')
GO

INSERT INTO [dbo].[options] VALUES (N'89', N'استكشاف أولي ونهائي حول الاستثمار المحتمل', N'24', N'1', N'3', N'2021-06-03 12:55:15', N'2021-06-03 12:55:15')
GO

INSERT INTO [dbo].[options] VALUES (N'90', N'تحديد الطاقة الإنتاجية للاستثمار المحتمل', N'24', N'0', N'4', N'2021-06-03 12:55:15', N'2021-06-03 12:55:15')
GO

INSERT INTO [dbo].[options] VALUES (N'91', N'ترشيد القرارات الاستثمارية', N'25', N'0', N'1', N'2021-06-03 12:55:42', N'2021-06-03 12:55:42')
GO

INSERT INTO [dbo].[options] VALUES (N'92', N'زيادة الإنتاجية', N'25', N'0', N'2', N'2021-06-03 12:55:42', N'2021-06-03 12:55:42')
GO

INSERT INTO [dbo].[options] VALUES (N'93', N'زيادة درجة رضاء العملاء', N'25', N'1', N'3', N'2021-06-03 12:55:42', N'2021-06-03 12:55:42')
GO

INSERT INTO [dbo].[options] VALUES (N'94', N'قبول عدد أكبر من البدائل', N'25', N'0', N'4', N'2021-06-03 12:55:42', N'2021-06-03 12:55:42')
GO

INSERT INTO [dbo].[options] VALUES (N'95', N'التكاليف الحدية', N'26', N'0', N'1', N'2021-06-03 12:56:38', N'2021-06-03 12:56:38')
GO

INSERT INTO [dbo].[options] VALUES (N'96', N'التكاليف التفاضلية', N'26', N'1', N'2', N'2021-06-03 12:56:38', N'2021-06-03 12:56:38')
GO

INSERT INTO [dbo].[options] VALUES (N'97', N'التكاليف الغارقة', N'26', N'0', N'3', N'2021-06-03 12:56:38', N'2021-06-03 12:56:38')
GO

INSERT INTO [dbo].[options] VALUES (N'98', N'تكاليف الفرصة البديلة', N'26', N'0', N'4', N'2021-06-03 12:56:38', N'2021-06-03 12:56:38')
GO

INSERT INTO [dbo].[options] VALUES (N'99', N'بالبدائل الاستثمارية أو المشروعات الجديدة', N'27', N'0', N'1', N'2021-06-03 12:57:08', N'2021-06-03 12:57:08')
GO

INSERT INTO [dbo].[options] VALUES (N'100', N'البدائل أو المشروعات القائمة بالفعل', N'27', N'0', N'2', N'2021-06-03 12:57:08', N'2021-06-03 12:57:08')
GO

INSERT INTO [dbo].[options] VALUES (N'101', N'بأي بديل استثماري جديد أو قائم بالفعل', N'27', N'1', N'3', N'2021-06-03 12:57:08', N'2021-06-03 12:57:08')
GO

INSERT INTO [dbo].[options] VALUES (N'102', N'لا شيء مما سبق', N'27', N'0', N'4', N'2021-06-03 12:57:08', N'2021-06-03 12:57:08')
GO

INSERT INTO [dbo].[options] VALUES (N'103', N'الدراسة المبدئية أو التمهيدية', N'28', N'0', N'1', N'2021-06-03 12:57:32', N'2021-06-03 12:57:32')
GO

INSERT INTO [dbo].[options] VALUES (N'104', N'مرحلة وصف وتحديد البدائل', N'28', N'0', N'2', N'2021-06-03 12:57:32', N'2021-06-03 12:57:32')
GO

INSERT INTO [dbo].[options] VALUES (N'105', N'الدراسة المتكاملة أو التفصيلية', N'28', N'1', N'3', N'2021-06-03 12:57:32', N'2021-06-03 12:57:32')
GO

INSERT INTO [dbo].[options] VALUES (N'106', N'كل ما سبق', N'28', N'0', N'4', N'2021-06-03 12:57:32', N'2021-06-03 12:57:32')
GO

INSERT INTO [dbo].[options] VALUES (N'107', N'تحقيق أقصي مبيعات', N'29', N'0', N'1', N'2021-06-03 12:57:54', N'2021-06-03 12:57:54')
GO

INSERT INTO [dbo].[options] VALUES (N'108', N'تحقيق أقصي أرباح', N'29', N'0', N'2', N'2021-06-03 12:57:54', N'2021-06-03 12:57:54')
GO

INSERT INTO [dbo].[options] VALUES (N'109', N'تحقيق أحسن سمعة', N'29', N'1', N'3', N'2021-06-03 12:57:54', N'2021-06-03 12:57:54')
GO

INSERT INTO [dbo].[options] VALUES (N'110', N'كل ما سبق', N'29', N'0', N'4', N'2021-06-03 12:57:54', N'2021-06-03 12:57:54')
GO

INSERT INTO [dbo].[options] VALUES (N'111', N'أولية أو تمهيدية', N'30', N'0', N'1', N'2021-06-03 12:58:20', N'2021-06-03 12:58:20')
GO

INSERT INTO [dbo].[options] VALUES (N'112', N'تحليلية', N'30', N'0', N'2', N'2021-06-03 12:58:20', N'2021-06-03 12:58:20')
GO

INSERT INTO [dbo].[options] VALUES (N'113', N'تفصيلية', N'30', N'1', N'3', N'2021-06-03 12:58:20', N'2021-06-03 12:58:20')
GO

INSERT INTO [dbo].[options] VALUES (N'114', N'كل ما سبق', N'30', N'0', N'4', N'2021-06-03 12:58:20', N'2021-06-03 12:58:20')
GO

INSERT INTO [dbo].[options] VALUES (N'115', N'المشروعات الجديدة', N'31', N'0', N'1', N'2021-06-03 12:58:46', N'2021-06-03 12:58:46')
GO

INSERT INTO [dbo].[options] VALUES (N'116', N'مشروعات الاستكمال والتوسع', N'31', N'0', N'2', N'2021-06-03 12:58:46', N'2021-06-03 12:58:46')
GO

INSERT INTO [dbo].[options] VALUES (N'117', N'مشروعات الإحلال والتجديد', N'31', N'1', N'3', N'2021-06-03 12:58:46', N'2021-06-03 12:58:46')
GO

INSERT INTO [dbo].[options] VALUES (N'118', N'كل ما سبق', N'31', N'0', N'4', N'2021-06-03 12:58:46', N'2021-06-03 12:58:46')
GO

INSERT INTO [dbo].[options] VALUES (N'119', N'إعداد دراسة جدوي مبدئية للمشروع', N'32', N'1', N'1', N'2021-06-03 12:59:13', N'2021-06-03 12:59:13')
GO

INSERT INTO [dbo].[options] VALUES (N'120', N'إعداد دراسة جدوي متكاملة للمشروع', N'32', N'0', N'2', N'2021-06-03 12:59:13', N'2021-06-03 12:59:13')
GO

INSERT INTO [dbo].[options] VALUES (N'121', N'إستخدام مؤشرات ربحية المشروع في إتخاذ قرار بشأن المشروع', N'32', N'0', N'3', N'2021-06-03 12:59:13', N'2021-06-03 12:59:13')
GO

INSERT INTO [dbo].[options] VALUES (N'122', N'كل ما سبق', N'32', N'0', N'4', N'2021-06-03 12:59:13', N'2021-06-03 12:59:13')
GO

INSERT INTO [dbo].[options] VALUES (N'123', N'ans 1', N'33', N'1', N'1', N'2021-06-05 10:41:05', N'2021-06-05 10:41:05')
GO

INSERT INTO [dbo].[options] VALUES (N'124', N'ans 2', N'33', N'0', N'2', N'2021-06-05 10:41:05', N'2021-06-05 10:41:05')
GO

INSERT INTO [dbo].[options] VALUES (N'125', N'ans 1', N'34', N'1', N'1', N'2021-06-05 11:09:37', N'2021-06-05 11:09:37')
GO

INSERT INTO [dbo].[options] VALUES (N'126', N'ans 2', N'34', N'0', N'2', N'2021-06-05 11:09:37', N'2021-06-05 11:09:37')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[password_resets]') AND type IN ('U'))
	DROP TABLE [dbo].[password_resets]
GO

CREATE TABLE [dbo].[password_resets] (
  [email] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [token] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_at] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[password_resets] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for profile_pictures
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[profile_pictures]') AND type IN ('U'))
	DROP TABLE [dbo].[profile_pictures]
GO

CREATE TABLE [dbo].[profile_pictures] (
  [id] bigint  NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_id] bigint  NOT NULL,
  [title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [mime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
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
-- Records of profile_pictures
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[profile_pictures] VALUES (N'1', N'45b7b16b-db96-4990-b329-510e00fcc2f4', N'5', N'Ahmed Kamal profile', N'image/jpeg', N'http://lms.mped.gov.eg/upload/profile/U-f5d01acb-4015-4b81-b847-ebf25acc5a06.jpg', N'f5d01acb-4015-4b81-b847-ebf25acc5a06', N'5', N'5', N'2021-05-04 12:55:51', N'2021-05-04 12:55:51', NULL)
GO

INSERT INTO [dbo].[profile_pictures] VALUES (N'2', N'7016585b-bd09-479f-ac04-149733dc478a', N'12', N'Test 7 profile', N'image/jpeg', N'http://lms.mped.gov.eg/upload/profile/U-9f42a02f-20f7-44f1-90a8-b9247a68ce87.jpg', N'9f42a02f-20f7-44f1-90a8-b9247a68ce87', N'12', N'12', N'2021-06-02 13:21:45', N'2021-06-02 13:21:45', NULL)
GO

INSERT INTO [dbo].[profile_pictures] VALUES (N'3', N'957ea1a9-5af9-41be-abc9-d39edd73f14b', N'53', N'NI Consulting School profile', N'image/png', N'http://lms.mped.gov.eg/upload/profile/U-61edb6a5-2e6c-440a-807b-e2b11d01354b.png', N'61edb6a5-2e6c-440a-807b-e2b11d01354b', N'53', N'53', N'2021-06-03 13:58:45', N'2021-06-03 13:58:45', NULL)
GO

INSERT INTO [dbo].[profile_pictures] VALUES (N'4', N'3d392d29-82bd-41a1-b4b5-dcd87cd791bb', N'239', N'medhat Hasan nasr profile', N'image/jpeg', N'http://lms.mped.gov.eg/upload/profile/U-7132d4ed-6440-41c9-ac95-d0b349a37e0e.jpg', N'7132d4ed-6440-41c9-ac95-d0b349a37e0e', N'239', N'239', N'2021-06-22 10:02:12', N'2021-06-22 10:02:12', NULL)
GO

COMMIT
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
-- Records of questions
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[questions] VALUES (N'1', N'What web languages do we use to create website layout?', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[questions] VALUES (N'2', N'Every parent directory/folder picks up a default page, what''s that?', N'1', N'2', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[questions] VALUES (N'3', N'Q 1', N'2', N'1', N'2020-12-23 15:25:04', N'2020-12-23 15:25:04')
GO

INSERT INTO [dbo].[questions] VALUES (N'5', N'ما هي شبكة الواي فاي الخاصة بالسادة الموظفين؟', N'4', N'1', N'2021-03-21 18:07:33', N'2021-03-21 18:07:33')
GO

INSERT INTO [dbo].[questions] VALUES (N'6', N'ما نوع الحساب المستخدم للاتصال بخدمة الواي فاي والخدمات الاخري المقدمة علي شبكة الوزارة؟', N'4', N'2', N'2021-03-21 18:12:14', N'2021-03-21 18:12:14')
GO

INSERT INTO [dbo].[questions] VALUES (N'7', N'في حالة الرغبة في انشاء تقارير بناءا علي قاعدة بيانات معدة مسبقا يتم اختيار؟', N'5', N'1', N'2021-05-24 11:55:02', N'2021-05-24 11:55:02')
GO

INSERT INTO [dbo].[questions] VALUES (N'8', N'لانشاء تقرير بناء علي شكل بياني يتم اختيار البيانات الخاصة بالشكل البياني من خلال قائمة؟', N'5', N'1', N'2021-05-24 11:55:22', N'2021-05-24 12:01:49')
GO

INSERT INTO [dbo].[questions] VALUES (N'9', N'ما هو التصنيف الذي توجد به المشروعات الرئيسية؟', N'5', N'1', N'2021-05-24 12:06:51', N'2021-05-24 12:06:51')
GO

INSERT INTO [dbo].[questions] VALUES (N'10', N'اين يتم ادخال قيم الاستثمارات في حالة العمل علي الشكل البياني Bar Chart؟ ', N'6', N'3', N'2021-05-24 12:14:48', N'2021-05-24 12:50:26')
GO

INSERT INTO [dbo].[questions] VALUES (N'11', N'لاظهار الاستثمارت علي الشكل البياني في صورة قيمة الاستثمارات ونسبتها المئوية يتم اختيار؟', N'6', N'1', N'2021-05-24 12:26:39', N'2021-05-24 12:26:52')
GO

INSERT INTO [dbo].[questions] VALUES (N'12', N'لعمل تصفية او فلتر علي كل الاشكال البيانية الموجودة في الصفحة الحالية فقط يتم اختيار؟', N'7', N'1', N'2021-05-24 12:42:16', N'2021-05-24 12:52:27')
GO

INSERT INTO [dbo].[questions] VALUES (N'13', N'عند وضع مؤشر الماوس علي اي جزء من الشكل البياني تظهر بيانات هذا الجزء بشكل تلقائي .. يمكن اضافة بيان جديد لهذه الخاصية من خلال ', N'7', N'1', N'2021-05-24 13:00:07', N'2021-05-24 13:00:07')
GO

INSERT INTO [dbo].[questions] VALUES (N'14', N'اختر الشكل البياني الذي يمكن من خلاله عمل فلترة او تصفية للاشكال البيانية داخل نفس الصفحة؟', N'7', N'3', N'2021-05-24 13:04:11', N'2021-05-24 13:04:26')
GO

INSERT INTO [dbo].[questions] VALUES (N'15', N'يتم اضافة البيان الخاص بالمحافظات داخل الشكل الشكل البياني للخرائط في؟', N'8', N'1', N'2021-05-24 13:14:53', N'2021-05-24 13:14:53')
GO

INSERT INTO [dbo].[questions] VALUES (N'16', N'ما هو الشكل الذي يمكن من خلال استخدامه اظهار قيمة محددة بشكل منفصل  داخل الصفحة مثل قيمة الاستثمارات ', N'8', N'2', N'2021-05-24 13:21:17', N'2021-05-24 13:21:17')
GO

INSERT INTO [dbo].[questions] VALUES (N'17', N'في حالة الحاجة للحصول علي شكل مستقبلي لحجم الاستثمارات في المستقبل يمكن عمل ذلك من خلال الشكل البياني؟', N'9', N'1', N'2021-05-24 13:31:48', N'2021-05-24 13:31:48')
GO

INSERT INTO [dbo].[questions] VALUES (N'18', N'القيم التي يمكن اضافتها للشكل البياني المستخدم لعمل التوقع المستقبلي هو؟ ', N'9', N'2', N'2021-05-24 13:44:43', N'2021-05-24 13:44:43')
GO

INSERT INTO [dbo].[questions] VALUES (N'19', N'لتحديد المدة الزمنية المستقبلية المراد توقع نتائجها يتم ذلك من خلال تحديد الشطل البياني ثم؟', N'9', N'3', N'2021-05-24 13:50:54', N'2021-05-24 13:50:54')
GO

INSERT INTO [dbo].[questions] VALUES (N'20', N'لعمل تقارير بناءا علي قاعدة بيانات اوملف اكسيل خارجي يتم ذلك من خلال', N'10', N'1', N'2021-05-24 14:01:46', N'2021-05-24 14:01:46')
GO

INSERT INTO [dbo].[questions] VALUES (N'21', N'بعد الانتهاء من حفظ التقارير يمكن اجراء تعديلات مرة اخري من خلال ', N'10', N'2', N'2021-05-24 14:04:44', N'2021-05-24 14:04:44')
GO

INSERT INTO [dbo].[questions] VALUES (N'22', N'لتجميع بعض الاشكال البيانية من صفحات مختلفة والعرض في مكان واحد يتم ذلك من خلال؟', N'10', N'3', N'2021-05-24 14:08:32', N'2021-05-24 14:08:32')
GO

INSERT INTO [dbo].[questions] VALUES (N'23', N' تتمثل دراسة الجدوى المتكاملة أو التفصيلية في مجموعة من الدراسات التي تسعى لتحديد مدى صلاحية مشروع استثماري من الجانب:', N'11', N'1', N'2021-06-03 12:54:26', N'2021-06-03 12:54:26')
GO

INSERT INTO [dbo].[questions] VALUES (N'24', N' تهدف دراسات الجدوى المبدئية أوالتمهيدية إلي:', N'11', N'1', N'2021-06-03 12:55:15', N'2021-06-03 12:55:15')
GO

INSERT INTO [dbo].[questions] VALUES (N'25', N'تأتي أهمية عملية تقييم المشروعات من كونها تساعد في', N'11', N'2', N'2021-06-03 12:55:42', N'2021-06-03 12:55:42')
GO

INSERT INTO [dbo].[questions] VALUES (N'26', N'التغير أو الفرق بين تكاليف بديلين يطلق عليه', N'11', N'3', N'2021-06-03 12:56:38', N'2021-06-03 12:56:38')
GO

INSERT INTO [dbo].[questions] VALUES (N'27', N'يتم الاعتماد على آراء رجال الإدارة العليا لجمع البيانات الخاصة', N'11', N'4', N'2021-06-03 12:57:08', N'2021-06-03 12:57:08')
GO

INSERT INTO [dbo].[questions] VALUES (N'28', N'يتم إجراء دراسة الجدوي التسويقية والفنيّة والتنظيمية والمالية والاجتماعية والبيئية في مرحلة', N'11', N'5', N'2021-06-03 12:57:32', N'2021-06-03 12:57:32')
GO

INSERT INTO [dbo].[questions] VALUES (N'29', N'من أهداف أي مشروع خاص', N'11', N'6', N'2021-06-03 12:57:54', N'2021-06-03 12:57:54')
GO

INSERT INTO [dbo].[questions] VALUES (N'30', N'الدراسة التي تمثل الخطوط العريضة لفكرة المشروع هي دراسة', N'11', N'7', N'2021-06-03 12:58:20', N'2021-06-03 12:58:20')
GO

INSERT INTO [dbo].[questions] VALUES (N'31', N'تتضمن صور الإنفاق الاستثماري', N'11', N'8', N'2021-06-03 12:58:46', N'2021-06-03 12:58:46')
GO

INSERT INTO [dbo].[questions] VALUES (N'32', N'يقصد بتقييم الاستثمار في المشروع', N'11', N'9', N'2021-06-03 12:59:13', N'2021-06-03 12:59:13')
GO

INSERT INTO [dbo].[questions] VALUES (N'33', N'question 3', N'1', N'3', N'2021-06-05 10:41:05', N'2021-06-05 10:41:05')
GO

INSERT INTO [dbo].[questions] VALUES (N'34', N'q1', N'12', N'1', N'2021-06-05 11:09:37', N'2021-06-05 11:09:37')
GO

COMMIT
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
-- Records of quizzes
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[quizzes] VALUES (N'1', N'Creativity Quiz', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'2', N'Test Alaa Quiz 1', N'2020-12-23 15:23:25', N'2020-12-23 15:23:25')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'3', N'Ahmed Quiz', N'2021-01-04 16:58:58', N'2021-01-04 16:58:58')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'4', N'WIFI', N'2021-03-21 18:06:07', N'2021-03-21 18:06:07')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'5', N'لانشاء تقاير مبنية علي قاعدة بيانات معدة مسبقا يتم اختيار؟', N'2021-05-24 11:49:09', N'2021-05-24 11:49:09')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'6', N'PowerBI', N'2021-05-24 12:14:01', N'2021-05-24 12:14:01')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'7', N'Filters', N'2021-05-24 12:37:42', N'2021-05-24 12:37:42')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'8', N'MAPs', N'2021-05-24 13:11:08', N'2021-05-24 13:11:08')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'9', N'Forecasting', N'2021-05-24 13:27:03', N'2021-05-24 13:27:03')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'10', N'Get Data', N'2021-05-24 13:58:28', N'2021-05-24 13:58:28')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'11', N'ni', N'2021-06-03 12:53:20', N'2021-06-03 12:53:20')
GO

INSERT INTO [dbo].[quizzes] VALUES (N'12', N'quiz 6 5', N'2021-06-05 11:09:01', N'2021-06-05 11:09:01')
GO

COMMIT
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
  [id] bigint  IDENTITY(1,1) NOT NULL,
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [name] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_active] tinyint  NOT NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [level] int  NOT NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] datetime2(0)  NULL,
  [UserId] bigint  NULL,
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

SET IDENTITY_INSERT [dbo].[roles] ON
GO

INSERT INTO [dbo].[roles] ([id], [_id], [name], [is_active], [created_by], [updated_by], [level], [created_at], [updated_at], [deleted_at], [UserId], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'7be3e993-425f-4575-a642-8715ab1fd7c1', N'system', N'1', N'1', N'1', N'0', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[roles] ([id], [_id], [name], [is_active], [created_by], [updated_by], [level], [created_at], [updated_at], [deleted_at], [UserId], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'0c515869-132e-4f65-b078-e9646aaabfd1', N'admin', N'1', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[roles] ([id], [_id], [name], [is_active], [created_by], [updated_by], [level], [created_at], [updated_at], [deleted_at], [UserId], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3', N'aa9930ca-cb8e-492d-8058-63edff77c5e4', N'supervisor', N'1', N'1', N'1', N'3', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[roles] ([id], [_id], [name], [is_active], [created_by], [updated_by], [level], [created_at], [updated_at], [deleted_at], [UserId], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4', N'55ec9f9c-43bd-4a37-bf53-a0312d7b544f', N'instructor', N'1', N'1', N'1', N'4', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[roles] ([id], [_id], [name], [is_active], [created_by], [updated_by], [level], [created_at], [updated_at], [deleted_at], [UserId], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5', N'dd3c0e71-e0cb-45a0-af9b-401090882087', N'employee', N'1', N'1', N'1', N'5', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[roles] OFF
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
-- Records of sections
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[sections] VALUES (N'1', N'The PSTI method', NULL, N'1', N'0', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[sections] VALUES (N'2', N'Lesson 1', NULL, N'2', N'0', N'2020-12-23 15:18:34', N'2020-12-23 15:18:34')
GO

INSERT INTO [dbo].[sections] VALUES (N'3', N'Lesson 2', NULL, N'2', N'0', N'2020-12-23 15:22:37', N'2020-12-23 15:22:37')
GO

INSERT INTO [dbo].[sections] VALUES (N'5', N'ازاي تقدر تتصل بالانترنت من خلال شبكة الواي فاي', NULL, N'4', N'0', N'2021-03-21 18:00:37', N'2021-03-21 18:00:37')
GO

INSERT INTO [dbo].[sections] VALUES (N'8', N'التعريف بواجهة المستخدم', NULL, N'3', N'1', N'2021-05-04 11:01:28', N'2021-05-24 12:07:00')
GO

INSERT INTO [dbo].[sections] VALUES (N'9', N'lesson 1', NULL, N'5', N'0', N'2021-05-17 21:55:34', N'2021-05-17 21:55:34')
GO

INSERT INTO [dbo].[sections] VALUES (N'10', N'التطبيق العملي علي بعض الاشكال البيانية والتعديل عليها', NULL, N'3', N'2', N'2021-05-24 12:09:24', N'2021-05-24 12:14:23')
GO

INSERT INTO [dbo].[sections] VALUES (N'11', N'Drill through طريقة عمل تصفية للبيانات وشرح خاصية ', NULL, N'3', N'3', N'2021-05-24 12:30:25', N'2021-05-24 12:45:28')
GO

INSERT INTO [dbo].[sections] VALUES (N'12', N'التوزيع الجغرافي للاستثمارات من خلال الخرائط', NULL, N'3', N'4', N'2021-05-24 13:09:24', N'2021-05-24 13:09:24')
GO

INSERT INTO [dbo].[sections] VALUES (N'13', N'Forecasting', NULL, N'3', N'5', N'2021-05-24 13:22:42', N'2021-05-24 13:22:42')
GO

INSERT INTO [dbo].[sections] VALUES (N'14', N'انشاء تقارير من خلال ملف خارجي وحفظ ومشاركة التقارير ', NULL, N'3', N'6', N'2021-05-24 13:53:40', N'2021-05-24 13:53:40')
GO

INSERT INTO [dbo].[sections] VALUES (N'15', N'دراسة الجدوى', NULL, N'6', N'0', N'2021-06-02 14:45:11', N'2021-06-02 14:45:11')
GO

INSERT INTO [dbo].[sections] VALUES (N'16', N'مراحل اعداد دراسة الجدوى', NULL, N'6', N'2', N'2021-06-02 20:45:16', N'2021-06-02 20:45:16')
GO

INSERT INTO [dbo].[sections] VALUES (N'17', N'تصنيف المشروعات', NULL, N'6', N'3', N'2021-06-02 20:45:56', N'2021-06-02 20:45:56')
GO

INSERT INTO [dbo].[sections] VALUES (N'18', N'علاوة – حالات عملية', NULL, N'6', N'4', N'2021-06-02 20:46:36', N'2021-06-02 20:46:36')
GO

INSERT INTO [dbo].[sections] VALUES (N'19', N'دراسة الجدوى القومية', NULL, N'6', N'5', N'2021-06-02 20:47:09', N'2021-06-02 20:47:09')
GO

INSERT INTO [dbo].[sections] VALUES (N'20', N'محاور دراسة الجدوى القومية', NULL, N'6', N'6', N'2021-06-02 20:47:30', N'2021-06-02 20:47:30')
GO

INSERT INTO [dbo].[sections] VALUES (N'21', N'أثر دراسة الجدوى القومية اقتصاديا', NULL, N'6', N'7', N'2021-06-02 20:47:56', N'2021-06-02 20:47:56')
GO

INSERT INTO [dbo].[sections] VALUES (N'22', N'تمهيد دراسة الجدوى المالية', NULL, N'6', N'8', N'2021-06-02 20:48:18', N'2021-06-02 20:48:18')
GO

INSERT INTO [dbo].[sections] VALUES (N'23', N'الفرق بين الإنفاق الجاري والاستثماري', NULL, N'6', N'9', N'2021-06-02 20:48:41', N'2021-06-02 20:48:41')
GO

INSERT INTO [dbo].[sections] VALUES (N'24', N'امثلة الموازنة العامة للدولة', NULL, N'6', N'10', N'2021-06-02 20:49:00', N'2021-06-02 20:49:00')
GO

INSERT INTO [dbo].[sections] VALUES (N'25', N' مفهوم القيمة الزمنية للنقود', NULL, N'6', N'11', N'2021-06-02 20:49:23', N'2021-06-03 13:46:08')
GO

INSERT INTO [dbo].[sections] VALUES (N'26', N'مفهوم تكلفة الفرصة البديلة', NULL, N'6', N'12', N'2021-06-02 20:49:47', N'2021-06-02 20:49:47')
GO

INSERT INTO [dbo].[sections] VALUES (N'28', N'Lesson 2', NULL, N'1', N'2', N'2021-06-05 10:38:14', N'2021-06-05 10:38:14')
GO

INSERT INTO [dbo].[sections] VALUES (N'29', N'6-5', NULL, N'1', N'3', N'2021-06-05 11:07:04', N'2021-06-05 11:07:04')
GO

INSERT INTO [dbo].[sections] VALUES (N'30', N'الاختبار العملي', NULL, N'3', N'7', N'2021-06-13 16:22:13', N'2021-06-13 16:22:13')
GO

COMMIT
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

INSERT INTO [dbo].[security_questions] VALUES (N'1', N'What was the street name you lived in as a child?', N'2020-11-21 02:11:31', N'2020-11-21 02:11:31')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'2', N'What primary school did you attend?', N'2020-11-21 02:11:31', N'2020-11-21 02:11:31')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'3', N'In what city or town was your first job?', N'2020-11-21 02:11:31', N'2020-11-21 02:11:31')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'4', N'What was the make and model of your first car?', N'2020-11-21 02:11:31', N'2020-11-21 02:11:31')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'5', N'What is your oldest cousin''s first and last name?', N'2020-11-21 02:11:31', N'2020-11-21 02:11:31')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'6', N'What was the street name you lived in as a child?', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'7', N'What primary school did you attend?', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'8', N'In what city or town was your first job?', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'9', N'What was the make and model of your first car?', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[security_questions] VALUES (N'10', N'What is your oldest cousin''s first and last name?', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
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
  [url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
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
-- Records of user_group
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[user_group] VALUES (N'1', N'1', N'2', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_group] VALUES (N'2', N'1', N'3', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_group] VALUES (N'3', N'2', N'2', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_group] VALUES (N'4', N'5', N'1', N'5', N'5', N'2021-03-21 18:19:05', N'2021-03-21 18:22:27')
GO

INSERT INTO [dbo].[user_group] VALUES (N'10', N'5', N'2', N'5', N'5', N'2021-06-02 20:57:59', N'2021-06-02 20:57:59')
GO

INSERT INTO [dbo].[user_group] VALUES (N'11', N'5', N'3', N'5', N'5', N'2021-06-02 20:57:59', N'2021-06-02 20:57:59')
GO

INSERT INTO [dbo].[user_group] VALUES (N'14', N'53', N'1', N'5', N'5', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[user_group] VALUES (N'157', N'5', N'7', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'158', N'200', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'159', N'201', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'160', N'202', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'161', N'203', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'162', N'204', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'163', N'205', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'164', N'206', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'165', N'207', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'166', N'208', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'167', N'209', N'9', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_group] VALUES (N'168', N'210', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'169', N'211', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'170', N'212', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'171', N'213', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'172', N'214', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'173', N'215', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'174', N'216', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'175', N'217', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'176', N'218', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'177', N'219', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'178', N'220', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'179', N'221', N'9', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_group] VALUES (N'180', N'222', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'181', N'223', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'182', N'224', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'183', N'225', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'184', N'226', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'185', N'227', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'186', N'228', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'187', N'229', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'188', N'230', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'189', N'231', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'190', N'232', N'9', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_group] VALUES (N'191', N'233', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'192', N'234', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'193', N'235', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'194', N'236', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'195', N'237', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'196', N'238', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'197', N'239', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'198', N'240', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'199', N'241', N'9', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_group] VALUES (N'336', N'326', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'337', N'327', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'338', N'328', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'339', N'332', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'340', N'333', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'341', N'329', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'342', N'335', N'7', N'1', N'1', N'2021-09-01 18:31:51', N'2021-09-01 18:31:51')
GO

INSERT INTO [dbo].[user_group] VALUES (N'343', N'4', N'1', N'5', N'5', N'2021-09-20 18:39:51', N'2021-09-20 18:39:51')
GO

COMMIT
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
-- Records of user_info
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[user_info] VALUES (N'1', N'1', N'Ph.D., M.Sc., Entrepreneur, Marketing Psychology strategist', N'I help small Business owners to make big profit using buyers Psychology.

Imagine holding the brain in your hands ... wondering how this small sticky squashy organ controls your emotions and your decisions.
Dissecting brains was a morning routine after coffee. LOL.
Dissecting brains , for me, is much easier than cooking (wow, how much I hate cooking?).
In my previous life .. I was a neuroscientist (I had a Ph.D. and M.Sc. in Neuro-Pharmacology).


I had 4 Scientific medical publications, Published in 4 of the most respectful international medical journals.

Three years ago, with a full cup of Strong Coffee and a sink full of dishes,
my entrepreneurial Journey started with my first website

Where I help Mothers (who are fighting like a ninja) to be more productive
and more happy with her children. I have 73000+ Mothers following my
Page and 5000+ Moms subscribers to my blog as well as 2000+ moms
enrolled in my courses

With a bigger cup of stronger coffee and more dishes in the sink. I started a second Entrepreneurial Adventure .. it is the adventure to the neuro-psychology of business and gaining the hearts and the brains of the customers...

Come Join the Adventure

Where you will change your small business from money eating, energy draining
Monster to a cash Pumping ATM by applying the power of psychology (your
psychology and your customers Psychology).

Come in to the adventure
Come in for the Fun
Come in to win the hearts
Come in to win the minds
Come in to win the wallets
Come in to live your legend', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_info] VALUES (N'2', N'5', N'Ahmed Kamal', N'Ahmed Kamal', N'2021-03-21 18:19:05', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'30', N'53', N'', N'', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[user_info] VALUES (N'173', N'200', N'Esraa Ebrahim', N'Esraa Ebrahim', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'174', N'201', N'Emad Abdalah', N'Emad Abdalah', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'175', N'202', N'Maha Abdelhameed', N'Maha Abdelhameed', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'176', N'203', N'Shaimaa Mamdouh', N'Shaimaa Mamdouh', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'177', N'204', N'ahmed mohamed gad', N'ahmed mohamed gad', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'178', N'205', N'Adel Elgabry', N'Adel Elgabry', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'179', N'206', N'amal abdel rahman', N'amal abdel rahman', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'180', N'207', N'Ahmed Mahmoud Hamed Mahmoud', N'Ahmed Mahmoud Hamed Mahmoud', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'181', N'208', N'Maha Abdelfatah Elenbaby', N'Maha Abdelfatah Elenbaby', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'182', N'209', N'Tariq Elsayd Abdelaled', N'Tariq Elsayd Abdelaled', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'183', N'210', N'Mohamed Kamal', N'Mohamed Kamal', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'184', N'211', N'Shaima samer abdallah', N'Shaima samer abdallah', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'185', N'212', N'Ayman Henary', N'Ayman Henary', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'186', N'213', N'Tamer abdelhameed', N'Tamer abdelhameed', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'187', N'214', N'Maher Ahmed Hasan', N'Maher Ahmed Hasan', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'188', N'215', N'Engy Taher Tawfeek', N'Engy Taher Tawfeek', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'189', N'216', N'Mamdouh emam Abdelhalim', N'Mamdouh emam Abdelhalim', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'190', N'217', N'Maha Hossin Zaky', N'Maha Hossin Zaky', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'191', N'218', N'Mounira Shaban', N'Mounira Shaban', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'192', N'219', N'Yasmin Al Sayed', N'Yasmin Al Sayed', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'193', N'220', N'Mohamed Badr Mohamed', N'Mohamed Badr Mohamed', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'194', N'221', N'Hend Said', N'Hend Said', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_info] VALUES (N'195', N'222', N'Ahmed Ali Basuny', N'Ahmed Ali Basuny', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'196', N'223', N'dalia hesham', N'dalia hesham', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'197', N'224', N'Sara Mohamed Wahdan', N'Sara Mohamed Wahdan', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'198', N'225', N'Doaa Gamal Abdel Hamid Shebl', N'Doaa Gamal Abdel Hamid Shebl', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'199', N'226', N'Esraa Samir', N'Esraa Samir', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'200', N'227', N'sharawy fatouh', N'sharawy fatouh', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'201', N'228', N'Yasmin ali osman', N'Yasmin ali osman', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'202', N'229', N'Omnya Abdel Wahab', N'Omnya Abdel Wahab', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'203', N'230', N'hany said', N'hany said', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'204', N'231', N'Rehab ElBohey', N'Rehab ElBohey', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'205', N'232', N'Mennat Allah Hassan', N'Mennat Allah Hassan', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_info] VALUES (N'206', N'233', N'Moataz Mohamed Fathy', N'Moataz Mohamed Fathy', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'207', N'234', N'yosof abo elfadl', N'yosof abo elfadl', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'208', N'235', N'sara mostafa', N'sara mostafa', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'209', N'236', N'Sami Fayez', N'Sami Fayez', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'210', N'237', N'Badr Othman', N'Badr Othman', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'211', N'238', N'Rokaya Kamel Ahmed', N'Rokaya Kamel Ahmed', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'212', N'239', N'medhat Hasan nasr', N'medhat Hasan nasr', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'213', N'240', N'Hanaa Tharwat Naji', N'Hanaa Tharwat Naji', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'214', N'241', N'Noura Farouk', N'Noura Farouk', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_info] VALUES (N'289', N'326', N'Habiba Salama', N'Habiba Salama', N'2021-07-12 01:58:17', N'2021-07-12 01:58:17')
GO

INSERT INTO [dbo].[user_info] VALUES (N'290', N'327', N'Sherif Mahmoud Fouda', N'Sherif Mahmoud Fouda', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_info] VALUES (N'291', N'328', N'Sherry Asad', N'Sherry Asad', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_info] VALUES (N'292', N'329', N'Farah Mohamed Sadek', N'Farah Mohamed Sadek', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_info] VALUES (N'295', N'332', N'Omar Sherif', N'Omar Sherif', N'2021-07-12 02:01:03', N'2021-07-12 02:01:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'296', N'333', N'Monica Michael', N'Monica Michael', N'2021-07-12 02:01:03', N'2021-07-12 02:01:03')
GO

INSERT INTO [dbo].[user_info] VALUES (N'298', N'335', N'Haidy Reyad', N'Haidy Reyad', N'2021-09-01 14:05:58', N'2021-09-01 14:05:58')
GO

INSERT INTO [dbo].[user_info] VALUES (N'299', N'4', N'', N'', N'2021-09-20 18:39:51', N'2021-09-20 18:39:51')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for user_logins
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_logins]') AND type IN ('U'))
	DROP TABLE [dbo].[user_logins]
GO

CREATE TABLE [dbo].[user_logins] (
  [LoginProvider] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [ProviderKey] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
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

INSERT INTO [dbo].[user_role] VALUES (N'1', N'1', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'2', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'3', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'4', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'1', N'5', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'2', N'5', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'3', N'5', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'4', N'2', N'5', N'5', N'2021-09-20 18:39:51', N'2021-09-20 18:39:51')
GO

INSERT INTO [dbo].[user_role] VALUES (N'4', N'3', N'5', N'5', N'2021-09-20 18:39:51', N'2021-09-20 18:39:51')
GO

INSERT INTO [dbo].[user_role] VALUES (N'4', N'4', N'5', N'5', N'2021-09-20 18:39:51', N'2021-09-20 18:39:51')
GO

INSERT INTO [dbo].[user_role] VALUES (N'4', N'5', N'1', N'1', N'2020-11-21 02:14:36', N'2020-11-21 02:14:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'5', N'2', N'1', N'1', N'2021-03-21 18:19:05', N'2021-03-21 18:19:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'5', N'3', N'5', N'5', N'2021-03-21 18:22:27', N'2021-03-21 18:22:27')
GO

INSERT INTO [dbo].[user_role] VALUES (N'5', N'4', N'5', N'5', N'2021-03-21 18:22:27', N'2021-03-21 18:22:27')
GO

INSERT INTO [dbo].[user_role] VALUES (N'5', N'5', N'1', N'1', N'2021-03-21 18:19:05', N'2021-03-21 18:19:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'53', N'4', N'5', N'5', N'2021-06-03 13:56:00', N'2021-06-03 13:56:00')
GO

INSERT INTO [dbo].[user_role] VALUES (N'53', N'5', N'5', N'5', N'2021-06-03 13:57:36', N'2021-06-03 13:57:36')
GO

INSERT INTO [dbo].[user_role] VALUES (N'200', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'201', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'202', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'203', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'204', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'205', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'206', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'207', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'208', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'209', N'5', N'1', N'1', N'2021-06-17 09:05:03', N'2021-06-17 09:05:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'210', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'211', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'212', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'213', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'214', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'215', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'216', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'217', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'218', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'219', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'220', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'221', N'5', N'1', N'1', N'2021-06-17 09:05:04', N'2021-06-17 09:05:04')
GO

INSERT INTO [dbo].[user_role] VALUES (N'222', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'223', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'224', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'225', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'226', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'227', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'228', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'229', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'230', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'231', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'232', N'5', N'1', N'1', N'2021-06-17 09:05:05', N'2021-06-17 09:05:05')
GO

INSERT INTO [dbo].[user_role] VALUES (N'233', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'234', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'235', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'236', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'237', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'238', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'239', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'240', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'241', N'5', N'1', N'1', N'2021-06-17 09:05:06', N'2021-06-17 09:05:06')
GO

INSERT INTO [dbo].[user_role] VALUES (N'326', N'5', N'1', N'1', N'2021-07-12 01:58:17', N'2021-07-12 01:58:17')
GO

INSERT INTO [dbo].[user_role] VALUES (N'327', N'5', N'1', N'1', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_role] VALUES (N'328', N'5', N'1', N'1', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_role] VALUES (N'329', N'5', N'1', N'1', N'2021-07-12 01:58:18', N'2021-07-12 01:58:18')
GO

INSERT INTO [dbo].[user_role] VALUES (N'332', N'5', N'1', N'1', N'2021-07-12 02:01:03', N'2021-07-12 02:01:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'333', N'5', N'1', N'1', N'2021-07-12 02:01:03', N'2021-07-12 02:01:03')
GO

INSERT INTO [dbo].[user_role] VALUES (N'335', N'5', N'1', N'1', N'2021-09-01 14:05:58', N'2021-09-01 14:05:58')
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
-- Records of user_security_question
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[user_security_question] VALUES (N'3', N'1', N'3', N'$2y$10$R6C8TUIZ1yUohI714mzt2OXuI3ZoB1LOX5CcMpMTGNaUnersffHPy', N'2020-11-21 06:14:52', N'2020-11-21 12:40:04')
GO

INSERT INTO [dbo].[user_security_question] VALUES (N'4', N'4', N'2', N'$2y$10$I8/00vh4q5kvJ1FFCQS.POYfEXin4YNUpxhyWHzN/8wJUGhFSQWGW', N'2020-11-21 12:37:14', N'2020-11-21 12:37:14')
GO

INSERT INTO [dbo].[user_security_question] VALUES (N'5', N'2', N'1', N'$2y$10$qxTDRKubmKX7atqU4WF5euEzQiuX/7KxBQHED5gl7CioMzjqU97iC', N'2021-03-21 12:20:21', N'2021-03-21 12:20:21')
GO

INSERT INTO [dbo].[user_security_question] VALUES (N'6', N'5', N'1', N'$2y$10$60dpoHt2zXq7.JLYSxo1jOCIN24M2ebooXTYqtRA.TxkhHnAuGNwa', N'2021-03-21 18:15:45', N'2021-03-21 18:15:45')
GO

INSERT INTO [dbo].[user_security_question] VALUES (N'7', N'53', N'1', N'$2y$10$/Cer2NsJmrT4ew2fhbE3Bum70EkvoYldKt/iJk7YhhHVi3Pjdi/0C', N'2021-06-03 13:58:21', N'2021-06-03 13:58:21')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for user_tokens
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_tokens]') AND type IN ('U'))
	DROP TABLE [dbo].[user_tokens]
GO

CREATE TABLE [dbo].[user_tokens] (
  [UserId] bigint  NOT NULL,
  [LoginProvider] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
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
  [_id] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [api_key] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [username] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_ldap] tinyint  NOT NULL,
  [first_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [last_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [email] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_banned] tinyint  NOT NULL,
  [is_verified] tinyint  NOT NULL,
  [confirm_code] nchar(36) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [confirmed_at] datetime2(0)  NULL,
  [password_changed_at] datetime2(0)  NULL,
  [display_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [user_url] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_by] bigint  NOT NULL,
  [updated_by] bigint  NOT NULL,
  [remember_token] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(0)  NULL,
  [updated_at] datetime2(0)  NULL,
  [deleted_at] date  NULL,
  [otp] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [otp_created_at] datetime2(0)  NULL,
  [profile_picture_id] bigint  NULL,
  [NormalizedUserName] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
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

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1', N'edfeb122-3656-483b-b477-17c827f44cd4', NULL, N'admin', N'0', N'Abe', N'Sal', N'ahmed.kamal@mped.gov.eg', N'0', N'0', N'1234                                ', NULL, N'2020-11-21 10:40:04', N'Abdalla Salah', NULL, N'5', N'5', NULL, N'2020-11-21 02:14:36', N'2021-09-20 18:39:15', NULL, NULL, NULL, NULL, N'admin', N'ahmed.kamal@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2', N'a8a5bfa7-2fb0-41ea-af18-16710cd13fd5', NULL, N'kareem', N'0', N'Kareem', N'Adel', N'kereem@domerai.com', N'0', N'0', N'1234                                ', NULL, N'2021-03-21 10:20:21', N'Kareem Adel', NULL, N'1', N'2', NULL, N'2020-11-21 02:14:36', N'2021-03-21 12:20:21', NULL, NULL, NULL, NULL, N'kareem', N'kereem@domerai.com', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3', N'af5351fa-e5bf-4502-86e9-c5a5e7b50af8', NULL, N'mansour', N'0', N'Mansour', N'Mo', N'mansour@domerai.com', N'0', N'0', N'1234                                ', NULL, NULL, N'Mo Mansour', NULL, N'1', N'1', NULL, N'2020-11-21 02:14:36', N'2020-11-21 02:14:36', NULL, NULL, NULL, NULL, N'mansour', N'mansour@domerai.com', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4', N'6cd86d8d-5c7d-42d2-97af-f14b0fb13a95', NULL, N'haithem', N'0', N'Haithem ', N'Atef', N'haithem@domerai.com', N'0', N'0', N'1234                                ', NULL, N'2020-11-21 10:37:14', N'Haithem Atef', NULL, N'5', N'5', NULL, N'2020-11-21 02:14:36', N'2021-09-20 18:39:51', NULL, NULL, NULL, NULL, N'haithem', N'haithem@domerai.com', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5', N'51d81a9d-281a-4e20-a6f7-478d294dcaa2', NULL, N'akamallocal', N'0', N'Ahmed', N'Kamal', N'aahmed.kamal@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-06-21 13:34:27', N'Ahmed Kamal', NULL, N'1', N'1', NULL, N'2021-03-21 18:05:03', N'2021-06-21 15:34:27', NULL, NULL, NULL, N'1', N'akamallocal', N'aahmed.kamal@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'53', N'b248e177-1d52-4721-82c9-04459dd148d5', NULL, N'niconsultingschool', N'0', N'NI ', N'Consulting School', N'ni@mped.gov.eg', N'0', N'0', N'123456                              ', NULL, N'2021-06-03 11:58:21', N'NI Consulting School', NULL, N'5', N'53', NULL, N'2021-06-03 13:54:10', N'2021-06-03 13:58:45', NULL, NULL, NULL, N'3', N'niconsultingschool', N'ni@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'200', N'49029942-1fab-42b2-88c7-7de232d0606c', NULL, N'EEbrahim', N'1', N'Esraa', N'Ebrahim', N'Esraa.Ebrahim@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Esraa Ebrahim', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'EEbrahim', N'Esraa.Ebrahim@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'201', N'f9e69c95-32b8-4c56-9c61-4f8f20c9909c', NULL, N'EAbdalah', N'1', N'Emad', N'Abdalah', N'Emad.Abdullah@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Emad Abdalah', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'EAbdalah', N'Emad.Abdullah@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'202', N'ee61a14e-9e43-4e5b-a7ab-9c5391f33e20', NULL, N'mabdelhameed', N'1', N'Maha', N'Abdelhameed', N'Maha.Abdelhamid@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Maha Abdelhameed', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'mabdelhameed', N'Maha.Abdelhamid@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'203', N'09559a8a-5735-4924-917e-9f78ae1584f3', NULL, N'smamdouh', N'1', N'Shaimaa', N'Mamdouh', N'Shaimaa.Mamdouh@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Shaimaa Mamdouh', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'smamdouh', N'Shaimaa.Mamdouh@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'204', N'8313039f-40e5-4150-b37c-270e60e7856d', NULL, N'agad', N'1', N'ahmed', N'mohamed gad', N'ahmed.gad@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'ahmed mohamed gad', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'agad', N'ahmed.gad@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'205', N'd6e61fff-0771-4319-8610-b1fe60efb105', NULL, N'aelgabry', N'1', N'Adel', N'Elgabry', N'Adel.ata@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Adel Elgabry', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'aelgabry', N'Adel.ata@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'206', N'21e3bd6f-e64b-46f5-b186-f237a6cf9ce8', NULL, N'aabdelrahman', N'1', N'amal', N'abdel rahman', N'Amal.abdelrahman@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'amal abdel rahman', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'aabdelrahman', N'Amal.abdelrahman@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'207', N'a4ea9394-9f26-4b40-a598-71edf68427c3', NULL, N'AHamed', N'1', N'Ahmed', N'Mahmoud Hamed Mahmoud', N'Ahmed.Hamed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Ahmed Mahmoud Hamed Mahmoud', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'AHamed', N'Ahmed.Hamed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'208', N'bd475c81-0872-440e-8313-186dd785d035', NULL, N'melenbaby', N'1', N'Maha', N'Abdelfatah Elenbaby', N'maha.abdelFatah@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Maha Abdelfatah Elenbaby', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'melenbaby', N'maha.abdelFatah@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'209', N'945960aa-9a54-47be-8275-c34e34c2950b', NULL, N'tabdelalem', N'1', N'Tariq', N'Elsayd Abdelaled', N'Tarek.Elsayed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Tariq Elsayd Abdelaled', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:03', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'tabdelalem', N'Tarek.Elsayed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'210', N'8ddba917-f01d-4e14-9c43-b43fec7e780e', NULL, N'MKamal', N'1', N'Mohamed', N'Kamal', N'Mohamed.Kamal@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Mohamed Kamal', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'MKamal', N'Mohamed.Kamal@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'211', N'b8c169a0-a353-4dc6-b703-48a5fdd4d490', NULL, N'ssamer', N'1', N'Shaima', N'samer abdallah', N'Shaimaa.Samir@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Shaima samer abdallah', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'ssamer', N'Shaimaa.Samir@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'212', N'51b49b86-8ea6-4b6a-9f8a-741da2dcc00b', NULL, N'AHenary', N'1', N'Ayman', N'Henary', N'Ayman.Henary@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Ayman Henary', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'AHenary', N'Ayman.Henary@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'213', N'12b21e8a-7f52-4cb9-8ffe-5a944a6ebb83', NULL, N'TAbdelhameed', N'1', N'Tamer', N'abdelhameed', N'tamer.abdelhamid@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Tamer abdelhameed', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'TAbdelhameed', N'tamer.abdelhamid@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'214', N'5d98d0c6-c060-4bf3-bd85-28314cbbacff', NULL, N'MHasan', N'1', N'Maher', N'Ahmed Hasan', N'maher.ahmed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:45', N'Maher Ahmed Hasan', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:45', NULL, NULL, NULL, NULL, N'MHasan', N'maher.ahmed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'215', N'cb933237-16bf-435b-8171-ae5d840a0179', NULL, N'ETawfeek', N'1', N'Engy', N'Taher Tawfeek', N'Angie.Taher@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Engy Taher Tawfeek', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'ETawfeek', N'Angie.Taher@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'216', N'cd96fc4c-27e7-45e3-b6c1-43453bc477b4', NULL, N'meabdelhalim', N'1', N'Mamdouh', N'emam Abdelhalim', N'Mamdouh.Emam@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Mamdouh emam Abdelhalim', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'meabdelhalim', N'Mamdouh.Emam@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'217', N'98f9ed03-f185-44ff-8af4-44f31d8780f6', NULL, N'MHossin', N'1', N'Maha', N'Hossin Zaky', N'Maha.Hussain@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Maha Hossin Zaky', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'MHossin', N'Maha.Hussain@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'218', N'5b34acd5-9239-47c4-aa38-9f0128b687e6', NULL, N'mshaban', N'1', N'Mounira', N'Shaban', N'Mounira.Shabaan@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Mounira Shaban', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'mshaban', N'Mounira.Shabaan@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'219', N'ad687b3b-db33-4d7c-8c43-7648afd3ac83', NULL, N'ysayed', N'1', N'Yasmin', N'Al Sayed', N'Yasmeen.AlSayed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Yasmin Al Sayed', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'ysayed', N'Yasmeen.AlSayed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'220', N'469cb04e-e27e-408a-94a1-9d57acab6df4', NULL, N'mbadr', N'1', N'Mohamed', N'Badr Mohamed', N'Mohamed.Badr@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Mohamed Badr Mohamed', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'mbadr', N'Mohamed.Badr@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'221', N'95f8e0bf-870b-4deb-99fa-282c6e040ea6', NULL, N'hisaid', N'1', N'Hend', N'Said', N'Hind.Said@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Hend Said', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:04', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'hisaid', N'Hind.Said@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'222', N'6e497b04-9483-4670-8640-3e035a2e8f4c', NULL, N'ABasuny', N'1', N'Ahmed', N'Ali Basuny', N'Ahmed.Basuny@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Ahmed Ali Basuny', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'ABasuny', N'Ahmed.Basuny@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'223', N'9a6b9238-d244-4100-969d-736eb94701b3', NULL, N'dhesham', N'1', N'dalia', N'hesham', N'Dalia.Hesham@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'dalia hesham', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'dhesham', N'Dalia.Hesham@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'224', N'bd56396f-a4b8-45f8-9eff-bb0f7cbbfeb5', NULL, N'swahdan', N'1', N'Sara', N'Mohamed Wahdan', N'Sara.Wahdan@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:46', N'Sara Mohamed Wahdan', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:46', NULL, NULL, NULL, NULL, N'swahdan', N'Sara.Wahdan@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'225', N'c41c78d2-2108-4f13-89a5-f92104e35d9a', NULL, N'dgamal', N'1', N'Doaa', N'Gamal Abdel Hamid Shebl', N'Doaa.Gamal@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Doaa Gamal Abdel Hamid Shebl', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'dgamal', N'Doaa.Gamal@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'226', N'e5dd4c06-8dd1-4768-875d-770bb2d61b91', NULL, N'esamir', N'1', N'Esraa', N'Samir', N'Esraa.Samir@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Esraa Samir', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'esamir', N'Esraa.Samir@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'227', N'cbd5204b-9bd9-4ee8-bb77-001eb4cc7e42', NULL, N'sfatouh', N'1', N'sharawy', N'fatouh', N'Sharawy.Fattouh@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'sharawy fatouh', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'sfatouh', N'Sharawy.Fattouh@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'228', N'a860ffb6-6b1f-4f0f-9f0b-253963e76f3e', NULL, N'yali', N'1', N'Yasmin', N'ali osman', N'Yasmeen.Othman@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Yasmin ali osman', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'yali', N'Yasmeen.Othman@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'229', N'63fad992-599f-446f-8fb2-5b0844cb83e2', NULL, N'owahab', N'1', N'Omnya', N'Abdel Wahab', N'Omnya.AbdelWahab@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Omnya Abdel Wahab', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'owahab', N'Omnya.AbdelWahab@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'230', N'9b9137ca-191b-4342-89ad-88668373b71f', NULL, N'hsaid', N'1', N'hany', N'said', N'Hany.Said@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'hany said', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'hsaid', N'Hany.Said@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'231', N'84e4ec83-91cb-4f54-b4b0-26823b477cf6', NULL, N'RElBohey', N'1', N'Rehab', N'ElBohey', N'Rehab.Shawqy@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Rehab ElBohey', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'RElBohey', N'Rehab.Shawqy@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'232', N'a18187cb-a9ee-43c9-aa74-208795532263', NULL, N'mahassan', N'1', N'Mennat Allah', N'Hassan', N'Menna.Ahmed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Mennat Allah Hassan', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'mahassan', N'Menna.Ahmed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'233', N'05e33f08-55d5-4e40-8420-2489c99d00c8', NULL, N'mfathy', N'1', N'Moataz', N'Mohamed Fathy', N'moutaz.mohamed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'Moataz Mohamed Fathy', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:05', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'mfathy', N'moutaz.mohamed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'234', N'0de7ce23-5f0c-4cf8-8a64-f8d6e968ac62', NULL, N'yaboelfadl', N'1', N'yosof', N'abo elfadl', N'Yousef.AboElFadl@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:47', N'yosof abo elfadl', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:47', NULL, NULL, NULL, NULL, N'yaboelfadl', N'Yousef.AboElFadl@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'235', N'f8e48598-bfa8-489e-ae95-eba2ae4e8355', NULL, N'smostafa', N'1', N'sara', N'mostafa', N'Sara.Mohamed@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'sara mostafa', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'smostafa', N'Sara.Mohamed@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'236', N'f0529e8a-dc83-43a1-bf0b-82469ab0a6ab', NULL, N'sfayez', N'1', N'Sami', N'Fayez', N'Samy.Fayez@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'Sami Fayez', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'sfayez', N'Samy.Fayez@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'237', N'6a2145e6-d092-436a-a660-b4cfbc052425', NULL, N'bothman', N'1', N'Badr', N'Othman Ali', N'Badr.Othman@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'Badr Othman', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'bothman', N'Badr.Othman@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'238', N'2dad6d33-0258-4875-b913-5733e82ea12e', NULL, N'Rokamel', N'1', N'Rokaya', N'Kamel Ahmed', N'Rouqia.Kamel@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'Rokaya Kamel Ahmed', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'Rokamel', N'Rouqia.Kamel@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'239', N'e773e118-1e0c-4086-a145-147c8308f85a', NULL, N'mnasr', N'1', N'medhat', N'Hasan nasr', N'Medhat.nasr@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'medhat Hasan nasr', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, N'4', N'mnasr', N'Medhat.nasr@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'240', N'ff9e6249-620d-4718-a813-ed99432098a1', NULL, N'hnaji', N'1', N'Hanaa', N'Tharwat Naji', N'Hanaa.Tharwat@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'Hanaa Tharwat Naji', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'hnaji', N'Hanaa.Tharwat@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'241', N'9dde5756-4c90-4895-94c6-856c18741d3f', NULL, N'nfarouk', N'1', N'Noura', N'Farouk', N'Noura.Farok@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:48', N'Noura Farouk', NULL, N'1', N'1', NULL, N'2021-06-17 09:05:06', N'2021-08-16 14:02:48', NULL, NULL, NULL, NULL, N'nfarouk', N'Noura.Farok@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'326', N'5fd2e3f1-9b24-4aa5-9754-fd215486fa49', NULL, N'HaSalama', N'1', N'Habiba', N'Salama', N'Habiba.Salama@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Habiba Salama', NULL, N'1', N'1', NULL, N'2021-07-12 01:58:17', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'HaSalama', N'Habiba.Salama@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'327', N'9f467a3f-b277-47c1-8aa9-d767ca1a234a', NULL, N'SFouda', N'1', N'Sherif', N'Mahmoud Fouda', N'Sherif.Fouda@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Sherif Mahmoud Fouda', NULL, N'1', N'1', NULL, N'2021-07-12 01:58:18', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'SFouda', N'Sherif.Fouda@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'328', N'2fb2ae37-2bc5-434a-94d7-2f80a3ed589d', NULL, N'SAsad', N'1', N'Sherry', N'Asad', N'Sherry.Asad@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Sherry Asad', NULL, N'1', N'1', NULL, N'2021-07-12 01:58:18', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'SAsad', N'Sherry.Asad@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'329', N'4ef44129-fdf3-4972-898f-a17113be0f8c', NULL, N'fsadek', N'1', N'Farah Mohamed Sadek', N'Farah Mohamed Sadek', N'Farah.sadek@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Farah Mohamed Sadek', NULL, N'1', N'1', NULL, N'2021-07-12 01:58:18', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'fsadek', N'Farah.sadek@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'332', N'a55ee71e-3473-4b61-b797-335f936c2c72', NULL, N'OSherif', N'1', N'Omar', N'Sherif', N'Omar.Sherif@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Omar Sherif', NULL, N'1', N'1', NULL, N'2021-07-12 02:01:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'OSherif', N'Omar.Sherif@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'333', N'c803309b-b06a-404b-8c45-bbe632cf94ec', NULL, N'mmichael', N'1', N'Monica', N'Michael', N'Monica.George@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-08-16 12:02:44', N'Monica Michael', NULL, N'1', N'1', NULL, N'2021-07-12 02:01:03', N'2021-08-16 14:02:44', NULL, NULL, NULL, NULL, N'mmichael', N'Monica.George@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
GO

INSERT INTO [dbo].[users] ([id], [_id], [api_key], [username], [is_ldap], [first_name], [last_name], [email], [is_banned], [is_verified], [confirm_code], [confirmed_at], [password_changed_at], [display_name], [user_url], [created_by], [updated_by], [remember_token], [created_at], [updated_at], [deleted_at], [otp], [otp_created_at], [profile_picture_id], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'335', N'face28f3-cfd7-41d5-9bc7-9c263ee5925a', NULL, N'hreyad', N'1', N'Haidy', N'Reyad', N'haidy.riad@mped.gov.eg', N'0', N'0', N'134                                 ', NULL, N'2021-09-01 12:05:58', N'Haidy Reyad', NULL, N'1', N'1', NULL, N'2021-09-01 14:05:58', N'2021-09-01 14:05:58', NULL, NULL, NULL, NULL, N'hreyad', N'haidy.riad@mped.gov.eg', N'1', N'AQAAAAEAACcQAAAAEBu3ShA1B6T9d8Hu1/JYIVWNOqOZ2vy2/RIj3CC5g1gosnRRBk/aPLrP0YI9EowIsQ==', N'27c0b512-9f7e-4ce7-bcff-6563379cbe20', N'd6e2c1f1-3a7b-4cf0-aea5-05deb4f12df7', NULL, N'0', N'0', NULL, N'0', N'0')
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
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE [dbo].[failed_jobs] ADD CONSTRAINT [PK_failed_jobs] PRIMARY KEY CLUSTERED ([id])
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
-- Indexes structure for table jobs
-- ----------------------------
CREATE NONCLUSTERED INDEX [jobs_queue_index]
ON [dbo].[jobs] (
  [queue] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table jobs
-- ----------------------------
ALTER TABLE [dbo].[jobs] ADD CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED ([id])
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
-- Indexes structure for table password_resets
-- ----------------------------
CREATE NONCLUSTERED INDEX [password_resets_email_index]
ON [dbo].[password_resets] (
  [email] ASC
)
GO


-- ----------------------------
-- Indexes structure for table profile_pictures
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [profile_pictures__id_unique]
ON [dbo].[profile_pictures] (
  [_id] ASC
)
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
CREATE NONCLUSTERED INDEX [IX_roles_UserId]
ON [dbo].[roles] (
  [UserId] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
ON [dbo].[roles] (
  [NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [roles__id_unique]
ON [dbo].[roles] (
  [_id] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [roles_level_unique]
ON [dbo].[roles] (
  [level] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [roles_name_unique]
ON [dbo].[roles] (
  [name] ASC
)
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
GO

CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique]
ON [dbo].[users] (
  [email] ASC
)
GO

CREATE UNIQUE NONCLUSTERED INDEX [users_username_unique]
ON [dbo].[users] (
  [username] ASC
)
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

ALTER TABLE [dbo].[class_quiz] ADD CONSTRAINT [class_quiz_quiz_id_foreign] FOREIGN KEY ([quiz_id]) REFERENCES [dbo].[quizzes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
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
ALTER TABLE [dbo].[class_user_meta] ADD CONSTRAINT [class_user_meta_course_class_id_foreign] FOREIGN KEY ([course_class_id]) REFERENCES [dbo].[course_classes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[class_user_meta] ADD CONSTRAINT [class_user_meta_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
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
ALTER TABLE [dbo].[course_classes] ADD CONSTRAINT [course_classes_course_id_foreign] FOREIGN KEY ([course_id]) REFERENCES [dbo].[courses] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

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
-- Foreign Keys structure for table roles
-- ----------------------------
ALTER TABLE [dbo].[roles] ADD CONSTRAINT [FK_roles_users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
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

