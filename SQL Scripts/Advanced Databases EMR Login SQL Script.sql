USE [master]
GO
/****** Object:  Database [Advanced Databases EMR Login]    Script Date: 29/12/2017 01:46:22 ******/
CREATE DATABASE [Advanced Databases EMR Login]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Advanced Databases Login', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Advanced Databases Login.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Advanced Databases Login_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Advanced Databases Login_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Advanced Databases EMR Login] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Advanced Databases EMR Login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ARITHABORT OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET RECOVERY FULL 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET  MULTI_USER 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Advanced Databases EMR Login] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Advanced Databases EMR Login] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Advanced Databases EMR Login', N'ON'
GO
ALTER DATABASE [Advanced Databases EMR Login] SET QUERY_STORE = OFF
GO
USE [Advanced Databases EMR Login]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Advanced Databases EMR Login]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29/12/2017 01:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29/12/2017 01:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[PatientId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 29/12/2017 01:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'2.0.1-rtm-125')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'15765f87-5a98-413e-b82b-f6e3fb71c21c', N'7263b85e-4c86-47b0-a1ad-7e51c7fce1cc', N'Patient', N'PATIENT')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'7708208e-59f3-4613-b0d8-149e81f77346', N'3f6ae720-3f9f-48cf-a708-7e8d15ee7d85', N'HCP', N'HCP')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'a508071f-6a8c-4d13-8307-78abef13fb69', N'9f5a4fad-714e-4180-be01-6b82e38fab1c', N'Admin', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'afa74a05-a51f-412d-8016-ee2697b49e7c', N'746d572f-f288-47c1-9a81-1b786606c3dc', N'GP', N'GP')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1189c9d8-178d-473b-b460-b8e56bbf05d3', N'7708208e-59f3-4613-b0d8-149e81f77346')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1189c9d8-178d-473b-b460-b8e56bbf05d3', N'afa74a05-a51f-412d-8016-ee2697b49e7c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'190a7283-4f68-43ea-9330-745b286b3c8f', N'7708208e-59f3-4613-b0d8-149e81f77346')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'67595386-6164-4669-b922-c4d2732565d6', N'15765f87-5a98-413e-b82b-f6e3fb71c21c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a1734701-94a7-476d-9492-f04afe906ee2', N'a508071f-6a8c-4d13-8307-78abef13fb69')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd4191da1-5115-4173-8695-573dfbde6337', N'15765f87-5a98-413e-b82b-f6e3fb71c21c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd693dfc4-99dc-44ee-a1ae-5a4b02c00014', N'15765f87-5a98-413e-b82b-f6e3fb71c21c')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'1189c9d8-178d-473b-b460-b8e56bbf05d3', 0, N'df08e9ce-19fc-4ebd-b446-b816c2449109', N'testgp@example.com', 0, 1, NULL, N'TESTGP@EXAMPLE.COM', N'TESTGP@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEN4J1Rlrd76UMgpTkF+sicTRtvJXWWx2jLSEigd3fKLtqM/ai3hy7/soWs1mqHYnlQ==', NULL, 0, N'bb4fa728-48d4-4795-b7c7-93d850e9b748', 0, N'testgp@example.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'190a7283-4f68-43ea-9330-745b286b3c8f', 0, N'90052d0c-0407-4db4-a198-89c17fd376a7', N'testStaff@example.com', 0, 1, NULL, N'TESTSTAFF@EXAMPLE.COM', N'TESTSTAFF@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEE7xxKFZBH39O69nnRUdb2r8s1skcEDAg2DbKDWWcP0RDXWFP4DmmvhdhoRysYjUdg==', NULL, 0, N'7e3ae6cf-a989-437b-b144-ab171c6777a0', 0, N'testStaff@example.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'67595386-6164-4669-b922-c4d2732565d6', 0, N'072cc864-aa70-4d1c-959b-1045ef8e4a67', N'testpatient2@example.com', 0, 1, NULL, N'TESTPATIENT2@EXAMPLE.COM', N'TESTPATIENT2@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEJsDEqb+9iQlGdGFEiuLeKrts8wJz83DnEKXsVm9uHHbniRbh7CiGvqfJL0Xv32Gug==', NULL, 0, N'85b52a67-71d8-48d0-be62-86e2519ae189', 0, N'testpatient2@example.com', 4)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'a1734701-94a7-476d-9492-f04afe906ee2', 0, N'b3029116-c7fc-4782-bd53-7a1536d183f6', N'admin@example.com', 0, 1, NULL, N'ADMIN@EXAMPLE.COM', N'ADMIN@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEPHh0YAo4uEGOI0cHF6IANcOSQHa75Nyw07Vz2E8xzGIvBwIpvGemxPtnNrPwpHBoQ==', NULL, 0, N'abf06891-ada1-411c-aff4-912dffe69d0a', 0, N'admin@example.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'd4191da1-5115-4173-8695-573dfbde6337', 0, N'6d1d3660-fac7-4574-a4a3-b52b231efe10', N'testpatient@example.com', 0, 1, NULL, N'TESTPATIENT@EXAMPLE.COM', N'TESTPATIENT@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEK+oLrhx41jSrKqTVXbWftaGh8rUJz04SH9V0ZeesQT0OEeMdEqjsfyFQhnBj66MBw==', NULL, 0, N'cc0c8470-1043-4744-92e5-42796765992c', 0, N'testpatient@example.com', 2)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [PatientId]) VALUES (N'd693dfc4-99dc-44ee-a1ae-5a4b02c00014', 0, N'a85cb951-f2ee-4e91-9576-2070b576c098', N'testpatient3@example.com', 0, 1, NULL, N'TESTPATIENT3@EXAMPLE.COM', N'TESTPATIENT3@EXAMPLE.COM', N'AQAAAAEAACcQAAAAEHqQLze/ouLTcZwkVnrv8bHW2k8ZaEpnTzjAUKTyyK1tmFXCJdUmMwPfSFO8uVmVlA==', NULL, 0, N'9d8a1f81-251f-415e-ad7c-a8b517f2d5e1', 0, N'testpatient3@example.com', 5)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'e57ad9fe-6304-4625-9b6d-de4a29d6c02a', N'[AspNetUserStore]', N'AuthenticatorKey', N'WRABR7JOTDBMDNRYUYT2BMWAX7R6C7YY')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_UserId]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 29/12/2017 01:46:23 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 29/12/2017 01:46:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [Advanced Databases EMR Login] SET  READ_WRITE 
GO
