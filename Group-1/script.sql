USE [master]
GO
/****** Object:  Database [Airline]    Script Date: 16-04-2022 11:12:02 ******/
CREATE DATABASE [Airline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Airline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Airline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Airline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Airline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Airline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Airline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Airline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Airline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Airline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Airline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Airline] SET ARITHABORT OFF 
GO
ALTER DATABASE [Airline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Airline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Airline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Airline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Airline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Airline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Airline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Airline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Airline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Airline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Airline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Airline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Airline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Airline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Airline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Airline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Airline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Airline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Airline] SET  MULTI_USER 
GO
ALTER DATABASE [Airline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Airline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Airline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Airline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Airline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Airline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Airline] SET QUERY_STORE = OFF
GO
USE [Airline]
GO
/****** Object:  Table [dbo].[tblBookingDetails]    Script Date: 16-04-2022 11:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PNR] [nvarchar](100) NULL,
	[SeatBooking] [nvarchar](100) NULL,
	[Payment] [decimal](15, 2) NULL,
	[Class] [nvarchar](100) NULL,
	[DepatureTime] [datetime] NULL,
	[ArrivalTime] [datetime] NULL,
	[TicketConformation] [int] NULL,
 CONSTRAINT [PK_tblBookingDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingFlightUserMapping]    Script Date: 16-04-2022 11:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingFlightUserMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[FlightID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [date] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_tblBookingFlightUserMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlightDetails]    Script Date: 16-04-2022 11:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlightDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FlightName] [nvarchar](100) NULL,
	[Source] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[Arrival_Time] [datetime] NULL,
	[Depature_Time] [datetime] NULL,
	[Flight_Charges] [decimal](18, 2) NULL,
	[AvailableSeats] [int] NULL,
	[TotalSeats] [int] NULL,
 CONSTRAINT [PK_tblFlightDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 16-04-2022 11:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[IsDeleted] [int] NULL,
	[CreatedOn] [int] NULL,
	[CreatedBy] [date] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [date] NULL,
 CONSTRAINT [PK_TblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserDetails]    Script Date: 16-04-2022 11:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[Gender] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[UserId] [int] NULL,
	[IsDeleted] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [date] NULL,
 CONSTRAINT [PK_TblUserDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBookingDetails] ON 

INSERT [dbo].[tblBookingDetails] ([ID], [PNR], [SeatBooking], [Payment], [Class], [DepatureTime], [ArrivalTime], [TicketConformation]) VALUES (1, N'B001', N'3B', CAST(5000.00 AS Decimal(15, 2)), N'Economy', CAST(N'2022-04-16T02:50:00.000' AS DateTime), CAST(N'2022-04-16T03:30:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblBookingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFlightDetails] ON 

INSERT [dbo].[tblFlightDetails] ([ID], [FlightName], [Source], [Destination], [Arrival_Time], [Depature_Time], [Flight_Charges], [AvailableSeats], [TotalSeats]) VALUES (1, N'Boeing 303`', N'Delhi', N'Mumbai', CAST(N'2022-04-16T02:50:00.000' AS DateTime), CAST(N'2022-04-16T03:30:00.000' AS DateTime), CAST(5000.00 AS Decimal(18, 2)), 299, 300)
SET IDENTITY_INSERT [dbo].[tblFlightDetails] OFF
GO
USE [master]
GO
ALTER DATABASE [Airline] SET  READ_WRITE 
GO
