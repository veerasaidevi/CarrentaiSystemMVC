USE [master]
GO
/****** Object:  Database [CarRentalSystem]    Script Date: 23-04-2024 11:44:37 ******/
CREATE DATABASE [CarRentalSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarRentalSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarRentalSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarRentalSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarRentalSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CarRentalSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRentalSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRentalSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRentalSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRentalSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRentalSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRentalSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRentalSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRentalSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRentalSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRentalSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRentalSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRentalSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRentalSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRentalSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRentalSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRentalSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRentalSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRentalSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRentalSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRentalSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRentalSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRentalSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRentalSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRentalSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarRentalSystem] SET  MULTI_USER 
GO
ALTER DATABASE [CarRentalSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRentalSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRentalSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRentalSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRentalSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarRentalSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarRentalSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [CarRentalSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CarRentalSystem]
GO
/****** Object:  Table [dbo].[BookingHistory]    Script Date: 23-04-2024 11:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BookingDate] [date] NULL,
	[PickupDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[OdometerPick] [float] NOT NULL,
	[OdometerDrop] [float] NOT NULL,
	[DistanceTravelled] [float] NOT NULL,
	[TotalCost] [float] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [pk_bokinghistory_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CancelReservation]    Script Date: 23-04-2024 11:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelReservation](
	[BookId] [int] NOT NULL,
	[Reason] [nvarchar](250) NOT NULL,
	[Refund] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarDetails]    Script Date: 23-04-2024 11:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](1) NOT NULL,
	[PricePerKm] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Availibility] [nvarchar](10) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [pk_carsdetails_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23-04-2024 11:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_roles_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23-04-2024 11:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastLName] [nvarchar](50) NOT NULL,
	[DrivingLicense] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[LoyalityPoints] [tinyint] NULL,
 CONSTRAINT [pk_users_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Supervisor')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Password], [Email], [FirstName], [LastLName], [DrivingLicense], [RoleId], [LoyalityPoints]) VALUES (1, N'Saidevi', N'S@idevi', N'saidevi@gmail.com', N'sai', N'devi', N'FD900315M001', 3, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Password], [Email], [FirstName], [LastLName], [DrivingLicense], [RoleId], [LoyalityPoints]) VALUES (3, N'santhosh', N'Santhosh', N'Santhosh@gmail.com', N'santhosh', N's', N'FD900315M090', 2, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_users_email]    Script Date: 23-04-2024 11:44:38 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [uq_users_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingHistory] ADD  CONSTRAINT [def_bokinghistory_status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CarDetails] ADD  CONSTRAINT [def_cardetails_avalibility]  DEFAULT ('Yes') FOR [Availibility]
GO
ALTER TABLE [dbo].[BookingHistory]  WITH CHECK ADD  CONSTRAINT [fk_bokinghistory_userid] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BookingHistory] CHECK CONSTRAINT [fk_bokinghistory_userid]
GO
ALTER TABLE [dbo].[CancelReservation]  WITH CHECK ADD  CONSTRAINT [fk_csncelreservation_bid] FOREIGN KEY([BookId])
REFERENCES [dbo].[BookingHistory] ([Id])
GO
ALTER TABLE [dbo].[CancelReservation] CHECK CONSTRAINT [fk_csncelreservation_bid]
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD  CONSTRAINT [fk_ardetails_uid] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CarDetails] CHECK CONSTRAINT [fk_ardetails_uid]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_users_rid] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_users_rid]
GO
USE [master]
GO
ALTER DATABASE [CarRentalSystem] SET  READ_WRITE 
GO
