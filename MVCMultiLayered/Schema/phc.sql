USE [master]
GO
/****** Object:  Database [PHC]    Script Date: 09/17/2012 17:12:39 ******/
CREATE DATABASE [PHC] ON  PRIMARY 
( NAME = N'PHC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PHC.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PHC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PHC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PHC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PHC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PHC] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PHC] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PHC] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PHC] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PHC] SET ARITHABORT OFF
GO
ALTER DATABASE [PHC] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PHC] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PHC] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PHC] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PHC] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PHC] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PHC] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PHC] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PHC] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PHC] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PHC] SET  DISABLE_BROKER
GO
ALTER DATABASE [PHC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PHC] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PHC] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PHC] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PHC] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PHC] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PHC] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PHC] SET  READ_WRITE
GO
ALTER DATABASE [PHC] SET RECOVERY FULL
GO
ALTER DATABASE [PHC] SET  MULTI_USER
GO
ALTER DATABASE [PHC] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PHC] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'PHC', N'ON'
GO
USE [PHC]
GO
/****** Object:  Table [dbo].[Wallpaper]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Wallpaper](
	[WID] [int] IDENTITY(1,1) NOT NULL,
	[WallImage] [varchar](max) NULL,
	[Title] [varchar](200) NULL,
 CONSTRAINT [PK_Wallpaper] PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Link] [varchar](max) NULL,
	[fbid] [varchar](50) NULL,
	[acesstoken] [varchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reward]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reward](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[WID] [int] NULL,
 CONSTRAINT [PK_Reward] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetProfile]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PetProfile](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PetName] [varchar](50) NOT NULL,
	[PetBreed] [varchar](200) NULL,
	[PetCategory] [varchar](50) NOT NULL,
	[PetImage] [varchar](max) NULL,
	[Location] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[About] [varchar](500) NULL,
	[FavProduct] [varchar](50) NULL,
	[SecondBadge] [int] NULL,
 CONSTRAINT [PK_PetProfile] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PetEarnBadge]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PetEarnBadge](
	[EBID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[UID] [int] NULL,
	[BID] [int] NULL,
	[CID] [int] NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[FBStatus] [bit] NULL,
	[TwitterStatus] [bit] NULL,
	[Pinterest] [bit] NULL,
	[ChCompleteDate] [datetime] NULL,
	[BadgeEarn] [bit] NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_PetEarnBadge] PRIMARY KEY CLUSTERED 
(
	[EBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Challenge]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Challenge](
	[CHID] [int] IDENTITY(1,1) NOT NULL,
	[ChallengeName] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[BadgeID] [int] NULL,
	[DogChallengeImage] [varchar](max) NULL,
	[CatChallengeImage] [varchar](max) NULL,
	[ChallengeCreatedDate] [datetime] NOT NULL,
	[CatDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Challenge] PRIMARY KEY CLUSTERED 
(
	[CHID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Badge]    Script Date: 09/17/2012 17:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Badge](
	[BId] [int] IDENTITY(1,1) NOT NULL,
	[Badgename] [varchar](50) NULL,
	[Badgelogo] [varchar](max) NULL,
	[createdDate] [datetime] NULL,
	[CDescription] [varchar](max) NULL,
	[LDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED 
(
	[BId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO





INSERT INTO [PHC].[dbo].[Category]
           ([CategoryName])
     VALUES
           ('Dog')
           
           INSERT INTO [PHC].[dbo].[Category]
           ([CategoryName])
     VALUES
           ('Cat')
           
GO
