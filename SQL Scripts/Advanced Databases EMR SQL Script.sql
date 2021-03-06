USE [master]
GO
/****** Object:  Database [Advanced Databases EMR]    Script Date: 29/12/2017 01:51:51 ******/
CREATE DATABASE [Advanced Databases EMR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Advanced Databases EMR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Advanced Databases EMR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Advanced Databases EMR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Advanced Databases EMR_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Advanced Databases EMR] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Advanced Databases EMR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Advanced Databases EMR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET ARITHABORT OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Advanced Databases EMR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Advanced Databases EMR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Advanced Databases EMR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Advanced Databases EMR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Advanced Databases EMR] SET  MULTI_USER 
GO
ALTER DATABASE [Advanced Databases EMR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Advanced Databases EMR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Advanced Databases EMR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Advanced Databases EMR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Advanced Databases EMR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Advanced Databases EMR', N'ON'
GO
ALTER DATABASE [Advanced Databases EMR] SET QUERY_STORE = OFF
GO
USE [Advanced Databases EMR]
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
USE [Advanced Databases EMR]
GO
/****** Object:  Table [dbo].[investigation_details]    Script Date: 29/12/2017 01:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[investigation_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[investigationId] [int] NOT NULL,
	[recordedBy] [varchar](50) NOT NULL,
	[recordedByRole] [varchar](50) NOT NULL,
	[recordedByOrganisationName] [varchar](50) NOT NULL,
	[recordedByOrganisationId] [varchar](50) NOT NULL,
	[snomedCode] [varchar](50) NOT NULL,
	[recordElementIdentifier] [varchar](50) NOT NULL,
	[sourceSystemId] [varchar](50) NOT NULL,
	[sourceSystemType] [varchar](50) NOT NULL,
	[extractIdentifier] [varchar](50) NOT NULL,
	[extractTime] [datetime] NOT NULL,
 CONSTRAINT [PK_investigation_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[consent] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[email] [varchar](50) NULL,
	[phoneNumber] [varchar](11) NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[investigations]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[investigations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[flagged] [bit] NOT NULL,
	[result] [decimal](18, 3) NULL,
	[rangeMin] [decimal](18, 3) NULL,
	[rangeMax] [decimal](18, 3) NULL,
	[unit] [varchar](10) NULL,
	[isBiochemistry] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[approved] [bit] NOT NULL,
 CONSTRAINT [PK_investigations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InvestigationView]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InvestigationView]
AS
SELECT        dbo.patient.id, dbo.patient.firstName, dbo.patient.lastName, dbo.patient.dob, dbo.patient.consent, dbo.investigations.dateTime, dbo.investigations.name, dbo.investigations.flagged, dbo.investigations.result, 
                         dbo.investigations.rangeMin, dbo.investigations.rangeMax, dbo.investigations.unit, dbo.investigations.isBiochemistry, dbo.investigation_details.recordedBy, dbo.investigation_details.recordedByRole, 
                         dbo.investigation_details.recordedByOrganisationName, dbo.investigation_details.recordedByOrganisationId, dbo.investigation_details.snomedCode, dbo.investigation_details.recordElementIdentifier, 
                         dbo.investigation_details.sourceSystemId, dbo.investigation_details.sourceSystemType, dbo.investigation_details.extractIdentifier, dbo.investigation_details.extractTime
FROM            dbo.investigation_details INNER JOIN
                         dbo.investigations ON dbo.investigation_details.investigationId = dbo.investigations.id INNER JOIN
                         dbo.patient ON dbo.investigations.patientId = dbo.patient.id
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/12/2017 01:51:52 ******/
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
/****** Object:  Table [dbo].[consent_lookup]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consent_lookup](
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_consent_lookup] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[events]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[approved] [bit] NOT NULL,
	[eventType] [varchar](50) NOT NULL,
	[investigationsId] [int] NULL,
	[medicationsId] [int] NULL,
	[reactionsId] [int] NULL,
	[referralsId] [int] NULL,
	[problemsId] [int] NULL,
 CONSTRAINT [PK_events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medications]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[isRepeat] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[approved] [bit] NOT NULL,
 CONSTRAINT [PK_medication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[problems]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[problems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[problemName] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
	[approved] [bit] NOT NULL,
 CONSTRAINT [PK_problems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reactions]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[date] [date] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
	[approved] [bit] NOT NULL,
 CONSTRAINT [PK_reactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recordAccess]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recordAccess](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[consent] [varchar](50) NOT NULL,
	[isEmergency] [bit] NOT NULL,
	[message] [varchar](500) NULL,
	[date] [datetime] NOT NULL,
	[accessedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_recordAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[referrals]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referrals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[encounter] [varchar](50) NOT NULL,
	[referredBy] [varchar](50) NOT NULL,
	[referredTo] [varchar](50) NOT NULL,
	[refferedToRole] [varchar](50) NOT NULL,
	[refferedToLocation] [varchar](50) NOT NULL,
	[reason] [varchar](50) NOT NULL,
	[approved] [bit] NOT NULL,
 CONSTRAINT [PK_referrals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[consent_lookup] ([name]) VALUES (N'amber')
INSERT [dbo].[consent_lookup] ([name]) VALUES (N'green')
INSERT [dbo].[consent_lookup] ([name]) VALUES (N'red')
SET IDENTITY_INSERT [dbo].[events] ON 

INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (4, 1, N'problems', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (5, 1, N'problems', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (6, 0, N'problems', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (7, 0, N'problems', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (8, 1, N'investigations', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (9, 0, N'medications', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (10, 1, N'reactions', NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (11, 1, N'referrals', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[events] ([id], [approved], [eventType], [investigationsId], [medicationsId], [reactionsId], [referralsId], [problemsId]) VALUES (12, 1, N'reactions', NULL, NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[events] OFF
SET IDENTITY_INSERT [dbo].[investigation_details] ON 

INSERT [dbo].[investigation_details] ([id], [investigationId], [recordedBy], [recordedByRole], [recordedByOrganisationName], [recordedByOrganisationId], [snomedCode], [recordElementIdentifier], [sourceSystemId], [sourceSystemType], [extractIdentifier], [extractTime]) VALUES (1, 1, N'Dr.Peters', N'Doctor', N'Imaginary Hospital', N'1', N'1', N'1', N'1', N'System', N'1', CAST(N'2017-12-22T01:01:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[investigation_details] OFF
SET IDENTITY_INSERT [dbo].[investigations] ON 

INSERT [dbo].[investigations] ([id], [patientId], [dateTime], [name], [flagged], [result], [rangeMin], [rangeMax], [unit], [isBiochemistry], [active], [approved]) VALUES (1, 2, CAST(N'2017-02-10T01:01:00.000' AS DateTime), N'Blood Levels', 1, CAST(1.150 AS Decimal(18, 3)), CAST(1.100 AS Decimal(18, 3)), CAST(1.200 AS Decimal(18, 3)), N'L', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[investigations] OFF
SET IDENTITY_INSERT [dbo].[medications] ON 

INSERT [dbo].[medications] ([id], [patientId], [name], [dateTime], [isRepeat], [active], [approved]) VALUES (1, 2, N'Ibuprofen', CAST(N'2017-12-29T01:02:19.070' AS DateTime), 0, 1, 0)
SET IDENTITY_INSERT [dbo].[medications] OFF
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([id], [consent], [firstName], [lastName], [dob], [email], [phoneNumber]) VALUES (2, N'green', N'Bob', N'Oldman', CAST(N'1921-07-06' AS Date), N'teatpatient@example.com', NULL)
INSERT [dbo].[patient] ([id], [consent], [firstName], [lastName], [dob], [email], [phoneNumber]) VALUES (4, N'amber', N'Amber', N'Smith', CAST(N'1982-12-27' AS Date), N'testpatient2@example.com', NULL)
INSERT [dbo].[patient] ([id], [consent], [firstName], [lastName], [dob], [email], [phoneNumber]) VALUES (5, N'red', N'Emilia', N'Emergent', CAST(N'2000-03-19' AS Date), N'testpatient3@example.com', NULL)
SET IDENTITY_INSERT [dbo].[patient] OFF
SET IDENTITY_INSERT [dbo].[problems] ON 

INSERT [dbo].[problems] ([id], [patientId], [date], [problemName], [active], [approved]) VALUES (1, 2, CAST(N'2017-12-29T00:33:20.340' AS DateTime), N'Head pain', 1, 1)
INSERT [dbo].[problems] ([id], [patientId], [date], [problemName], [active], [approved]) VALUES (2, 2, CAST(N'2017-12-29T00:33:24.503' AS DateTime), N'Tiredness', 1, 1)
INSERT [dbo].[problems] ([id], [patientId], [date], [problemName], [active], [approved]) VALUES (3, 4, CAST(N'2017-12-29T00:33:40.527' AS DateTime), N'Stomach pain', 1, 0)
INSERT [dbo].[problems] ([id], [patientId], [date], [problemName], [active], [approved]) VALUES (4, 5, CAST(N'2017-12-29T00:34:01.857' AS DateTime), N'Multiple lacerations', 1, 0)
SET IDENTITY_INSERT [dbo].[problems] OFF
SET IDENTITY_INSERT [dbo].[reactions] ON 

INSERT [dbo].[reactions] ([id], [patientId], [date], [name], [active], [approved]) VALUES (1, 2, CAST(N'2017-12-29' AS Date), N'Allergic to cats', 1, 1)
INSERT [dbo].[reactions] ([id], [patientId], [date], [name], [active], [approved]) VALUES (2, 5, CAST(N'2017-12-29' AS Date), N'Allergic to owls', 1, 1)
SET IDENTITY_INSERT [dbo].[reactions] OFF
SET IDENTITY_INSERT [dbo].[recordAccess] ON 

INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (1, 2, N'green', 0, NULL, CAST(N'2017-12-29T00:33:08.680' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (2, 4, N'amber', 0, N'Contacted', CAST(N'2017-12-29T00:33:34.817' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (3, 5, N'red', 0, N'Owl related accident', CAST(N'2017-12-29T00:33:52.767' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (4, 2, N'green', 0, NULL, CAST(N'2017-12-29T01:00:31.230' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (5, 4, N'amber', 0, NULL, CAST(N'2017-12-29T01:04:08.240' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (6, 2, N'green', 0, NULL, CAST(N'2017-12-29T01:04:26.847' AS DateTime), N'testStaff@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (8, 2, N'green', 0, NULL, CAST(N'2017-12-29T01:05:29.213' AS DateTime), N'testgp@example.com')
INSERT [dbo].[recordAccess] ([id], [patientId], [consent], [isEmergency], [message], [date], [accessedBy]) VALUES (9, 5, N'red', 0, N'Routine approval of records', CAST(N'2017-12-29T01:06:03.373' AS DateTime), N'testgp@example.com')
SET IDENTITY_INSERT [dbo].[recordAccess] OFF
SET IDENTITY_INSERT [dbo].[referrals] ON 

INSERT [dbo].[referrals] ([id], [patientId], [dateTime], [encounter], [referredBy], [referredTo], [refferedToRole], [refferedToLocation], [reason], [approved]) VALUES (1, 2, CAST(N'2017-12-29T01:03:23.433' AS DateTime), N'Refer to intensive care', N'Dr.Peters', N'A Surgeon', N'Surgeon', N'Intensive care unit at Imaginary Hospital', N'Soon', 1)
SET IDENTITY_INSERT [dbo].[referrals] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_consent_lookup]    Script Date: 29/12/2017 01:51:52 ******/
ALTER TABLE [dbo].[consent_lookup] ADD  CONSTRAINT [IX_consent_lookup] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UniqueExceptNullsForinvestigationsId]    Script Date: 29/12/2017 01:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsForinvestigationsId] ON [dbo].[events]
(
	[investigationsId] ASC
)
WHERE ([investigationsId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UniqueExceptNullsFormedicationsId]    Script Date: 29/12/2017 01:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsFormedicationsId] ON [dbo].[events]
(
	[medicationsId] ASC
)
WHERE ([medicationsId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UniqueExceptNullsForproblemsId]    Script Date: 29/12/2017 01:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsForproblemsId] ON [dbo].[events]
(
	[problemsId] ASC
)
WHERE ([problemsId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UniqueExceptNullsForreactionsId]    Script Date: 29/12/2017 01:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsForreactionsId] ON [dbo].[events]
(
	[reactionsId] ASC
)
WHERE ([reactionsId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UniqueExceptNullsForreferralsId]    Script Date: 29/12/2017 01:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsForreferralsId] ON [dbo].[events]
(
	[referralsId] ASC
)
WHERE ([referralsId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD  CONSTRAINT [FK__events__investig__5BE2A6F2] FOREIGN KEY([investigationsId])
REFERENCES [dbo].[investigations] ([id])
GO
ALTER TABLE [dbo].[events] CHECK CONSTRAINT [FK__events__investig__5BE2A6F2]
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([medicationsId])
REFERENCES [dbo].[medications] ([id])
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([problemsId])
REFERENCES [dbo].[problems] ([id])
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([reactionsId])
REFERENCES [dbo].[reactions] ([id])
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([referralsId])
REFERENCES [dbo].[referrals] ([id])
GO
ALTER TABLE [dbo].[investigation_details]  WITH CHECK ADD  CONSTRAINT [FK_investigation_details_investigations] FOREIGN KEY([investigationId])
REFERENCES [dbo].[investigations] ([id])
GO
ALTER TABLE [dbo].[investigation_details] CHECK CONSTRAINT [FK_investigation_details_investigations]
GO
ALTER TABLE [dbo].[investigations]  WITH CHECK ADD  CONSTRAINT [FK_investigations_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[investigations] CHECK CONSTRAINT [FK_investigations_patient]
GO
ALTER TABLE [dbo].[medications]  WITH CHECK ADD  CONSTRAINT [FK_medication_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[medications] CHECK CONSTRAINT [FK_medication_patient]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_consent_lookup] FOREIGN KEY([consent])
REFERENCES [dbo].[consent_lookup] ([name])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_consent_lookup]
GO
ALTER TABLE [dbo].[problems]  WITH CHECK ADD  CONSTRAINT [FK_problems_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[problems] CHECK CONSTRAINT [FK_problems_patient]
GO
ALTER TABLE [dbo].[reactions]  WITH CHECK ADD  CONSTRAINT [FK_reactions_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[reactions] CHECK CONSTRAINT [FK_reactions_patient]
GO
ALTER TABLE [dbo].[recordAccess]  WITH CHECK ADD  CONSTRAINT [FK_recordAccess_consent_lookup] FOREIGN KEY([consent])
REFERENCES [dbo].[consent_lookup] ([name])
GO
ALTER TABLE [dbo].[recordAccess] CHECK CONSTRAINT [FK_recordAccess_consent_lookup]
GO
ALTER TABLE [dbo].[recordAccess]  WITH CHECK ADD  CONSTRAINT [FK_recordAccess_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[recordAccess] CHECK CONSTRAINT [FK_recordAccess_patient]
GO
ALTER TABLE [dbo].[referrals]  WITH CHECK ADD  CONSTRAINT [FK_referrals_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([id])
GO
ALTER TABLE [dbo].[referrals] CHECK CONSTRAINT [FK_referrals_patient]
GO
ALTER TABLE [dbo].[investigations]  WITH CHECK ADD  CONSTRAINT [CK_range] CHECK  (([rangeMin] IS NOT NULL AND [rangeMax] IS NOT NULL AND [rangeMin]<=[rangeMax] OR [rangeMin] IS NULL AND [rangeMax] IS NULL))
GO
ALTER TABLE [dbo].[investigations] CHECK CONSTRAINT [CK_range]
GO
/****** Object:  StoredProcedure [dbo].[AddEventColumn]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Peter McTeague
-- Create date: 12/12/2017
-- Description:	A procedure for adding events for a created table
-- =============================================
CREATE PROCEDURE [dbo].[AddEventColumn] 
	@tableName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @sql VARCHAR(8000)
	SET @sql = 'ALTER TABLE dbo.events ADD '+@tableName+'Id int NULL; ALTER TABLE dbo.events ADD FOREIGN KEY (' + @tableName  + 'Id) REFERENCES ' + @tableName + '(id);'  
	EXEC(@sql) 
	SET @sql = 'CREATE UNIQUE NONCLUSTERED INDEX [UniqueExceptNullsFor' + @tableName +'Id] ON [events](' + @tableName + 'Id) WHERE [' + @tableName +'Id] IS NOT NULL'
	EXEC(@sql)
	SET @sql =
	'
	CREATE TRIGGER [dbo].[Add' + @tableName +'] 
	ON  [dbo].[' + @tableName + ']
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (' + @tableName + 'Id, approved, eventType) SELECT id , approved, ''' + @tableName +''' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE ' + @tableName + 'Id = (SELECT id FROM deleted)
		END
	END
	'
	EXEC(@sql)
	SET @sql =
	'
	CREATE TRIGGER [dbo].[UpdateApprovedEventFor' + @tableName +'] 
	ON  [dbo].[' + @tableName + ']
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.'+ @tableName +'Id = inserted.id
	END
	'
	EXEC(@sql)
END
GO
/****** Object:  Trigger [dbo].[Addinvestigations]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Addinvestigations] 
	ON  [dbo].[investigations]
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (investigationsId, approved, eventType) SELECT id , approved, 'investigations' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE investigationsId = (SELECT id FROM deleted)
		END
	END
GO
ALTER TABLE [dbo].[investigations] ENABLE TRIGGER [Addinvestigations]
GO
/****** Object:  Trigger [dbo].[UpdateApprovedEventForinvestigations]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateApprovedEventForinvestigations] 
	ON  [dbo].[investigations]
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.investigationsId = inserted.id
	END
GO
ALTER TABLE [dbo].[investigations] ENABLE TRIGGER [UpdateApprovedEventForinvestigations]
GO
/****** Object:  Trigger [dbo].[Addmedications]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[Addmedications] 
	ON  [dbo].[medications]
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (medicationsId, approved, eventType) SELECT id , approved, 'medications' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE medicationsId = (SELECT id FROM deleted)
		END
	END
	
GO
ALTER TABLE [dbo].[medications] ENABLE TRIGGER [Addmedications]
GO
/****** Object:  Trigger [dbo].[UpdateApprovedEventFormedications]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[UpdateApprovedEventFormedications] 
	ON  [dbo].[medications]
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.medicationsId = inserted.id
	END
	
GO
ALTER TABLE [dbo].[medications] ENABLE TRIGGER [UpdateApprovedEventFormedications]
GO
/****** Object:  Trigger [dbo].[Addproblems]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[Addproblems] 
	ON  [dbo].[problems]
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (problemsId, approved, eventType) SELECT id , approved, 'problems' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE problemsId = (SELECT id FROM deleted)
		END
	END
	
GO
ALTER TABLE [dbo].[problems] ENABLE TRIGGER [Addproblems]
GO
/****** Object:  Trigger [dbo].[UpdateApprovedEventForproblems]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[UpdateApprovedEventForproblems] 
	ON  [dbo].[problems]
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.problemsId = inserted.id
	END
	
GO
ALTER TABLE [dbo].[problems] ENABLE TRIGGER [UpdateApprovedEventForproblems]
GO
/****** Object:  Trigger [dbo].[Addreactions]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[Addreactions] 
	ON  [dbo].[reactions]
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (reactionsId, approved, eventType) SELECT id , approved, 'reactions' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE reactionsId = (SELECT id FROM deleted)
		END
	END
	
GO
ALTER TABLE [dbo].[reactions] ENABLE TRIGGER [Addreactions]
GO
/****** Object:  Trigger [dbo].[UpdateApprovedEventForreactions]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[UpdateApprovedEventForreactions] 
	ON  [dbo].[reactions]
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.reactionsId = inserted.id
	END
	
GO
ALTER TABLE [dbo].[reactions] ENABLE TRIGGER [UpdateApprovedEventForreactions]
GO
/****** Object:  Trigger [dbo].[Addreferrals]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[Addreferrals] 
	ON  [dbo].[referrals]
	AFTER INSERT,DELETE
	AS 
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF EXISTS(SELECT * FROM inserted)
		BEGIN
			--Inserted--
			INSERT INTO dbo.events (referralsId, approved, eventType) SELECT id , approved, 'referrals' AS eventType FROM inserted
		END
		ElSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
		BEGIN
			--Deleted--
			DELETE FROM dbo.events WHERE referralsId = (SELECT id FROM deleted)
		END
	END
	
GO
ALTER TABLE [dbo].[referrals] ENABLE TRIGGER [Addreferrals]
GO
/****** Object:  Trigger [dbo].[UpdateApprovedEventForreferrals]    Script Date: 29/12/2017 01:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE TRIGGER [dbo].[UpdateApprovedEventForreferrals] 
	ON  [dbo].[referrals]
	AFTER UPDATE
	AS
	BEGIN
	    IF UPDATE(approved)
		UPDATE dbo.events
		SET    approved = inserted.approved
		FROM   inserted
		WHERE dbo.events.referralsId = inserted.id
	END
	
GO
ALTER TABLE [dbo].[referrals] ENABLE TRIGGER [UpdateApprovedEventForreferrals]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "investigation_details"
            Begin Extent = 
               Top = 18
               Left = 430
               Bottom = 319
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "investigations"
            Begin Extent = 
               Top = 18
               Left = 240
               Bottom = 310
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "patient"
            Begin Extent = 
               Top = 17
               Left = 52
               Bottom = 113
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 25
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2730
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvestigationView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1410
         GroupBy = 1350
         Filter = 1350
         Or = 780
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvestigationView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvestigationView'
GO
USE [master]
GO
ALTER DATABASE [Advanced Databases EMR] SET  READ_WRITE 
GO
