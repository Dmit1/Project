USE [master]
GO
/****** Object:  Database [MTA]    Script Date: 06.11.2023 15:26:42 ******/
CREATE DATABASE [MTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MTA', FILENAME = N'D:\C#\DataBaseMTA\MTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MTA_log', FILENAME = N'D:\C#\DataBaseMTA\MTA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MTA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [MTA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MTA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MTA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MTA] SET  MULTI_USER 
GO
ALTER DATABASE [MTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MTA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MTA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MTA] SET QUERY_STORE = OFF
GO
USE [MTA]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[ID_Component] [int] IDENTITY(1,1) NOT NULL,
	[NamePart] [varchar](100) NULL,
	[NameSystem] [varchar](50) NULL,
	[NameComponent] [varchar](20) NULL,
	[ManufactureDate] [date] NULL,
	[ManufactureName] [varchar](20) NULL,
	[ManufactureNumber] [varchar](20) NULL,
	[PeriodMaintenance] [nchar](10) NULL,
	[Included] [bit] NULL,
	[DateInstallRemove] [date] NULL,
	[State] [bit] NULL,
	[FK_ID_Resource] [int] NULL,
	[FK_ID_Aircraft] [int] NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[ID_Component] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[ID_Aircraft] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[RegNumber] [varchar](20) NULL,
	[Modification] [varchar](50) NULL,
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[ID_Aircraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetAllAircraftInfo]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllAircraftInfo]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Aircraft.Name, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, dbo.Component.ManufactureNumber
FROM     dbo.Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Component.NameComponent = 'Планер') AND (dbo.Component.NamePart = 'Планер')
GO
/****** Object:  View [dbo].[vGetAllEngine]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllEngine]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Aircraft.Name, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, dbo.Component.ManufactureNumber
FROM     dbo.Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Component.NameComponent = 'Двигатель') AND (dbo.Component.NamePart = 'Двигатель') AND (dbo.Component.Included = 1)
GO
/****** Object:  View [dbo].[vGetAllPropeller]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllPropeller]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Aircraft.Name, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, dbo.Component.ManufactureNumber
FROM     dbo.Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Component.NameComponent = 'Винт') AND (dbo.Component.NamePart = 'Винт') AND (dbo.Component.Included = 1)
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ID_Resource] [int] IDENTITY(1,1) NOT NULL,
	[BasicOverhaulHours] [int] NULL,
	[BasicOverhaulLife] [int] NULL,
	[UsefullHours] [int] NULL,
	[UsefullLife] [int] NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ID_Resource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatingTime]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingTime](
	[ID_OperatingTime] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[OperatingHours] [int] NULL,
	[OverhaulHours] [int] NULL,
	[FK_ID_Component] [int] NULL,
 CONSTRAINT [PK_OperatingTime] PRIMARY KEY CLUSTERED 
(
	[ID_OperatingTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetAllAircraftHours]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllAircraftHours]
AS
SELECT dbo.Aircraft.Name AS ВС, dbo.Aircraft.RegNumber AS [рег.номер], dbo.Component.NamePart AS Планер, dbo.Component.ManufactureNumber AS [зав.номер], dbo.OperatingTime.Date AS дата, 
                  dbo.OperatingTime.OverhaulHours AS [Наработка ППР], dbo.OperatingTime.OperatingHours AS [Наработка СНЭ], dbo.Resource.BasicOverhaulHours AS [меж.рем.Ресус], dbo.Resource.BasicOverhaulLife AS [меж.рем.срок службы], 
                  dbo.Resource.UsefullHours AS [назначеный ресурс], dbo.Resource.UsefullLife AS [назначенный срок службы]
FROM     dbo.OperatingTime INNER JOIN
                  dbo.Component ON dbo.OperatingTime.FK_ID_Component = dbo.Component.ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft INNER JOIN
                  dbo.Resource ON dbo.Component.FK_ID_Resource = dbo.Resource.ID_Resource
WHERE  (dbo.Component.NamePart = 'Планер') AND (dbo.Component.NameComponent = 'Планер')
GO
/****** Object:  View [dbo].[vGetAllComponent]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllComponent]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Component.NamePart, dbo.Component.NameSystem, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, 
                  dbo.Component.DateInstallRemove, dbo.Component.Included
FROM     dbo.Aircraft INNER JOIN
                  dbo.Component ON dbo.Aircraft.ID_Aircraft = dbo.Component.FK_ID_Aircraft
WHERE  (dbo.Component.Included = 1)
GO
/****** Object:  View [dbo].[vGetAllOperatingTime]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllOperatingTime]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Component.NameComponent, dbo.OperatingTime.OperatingHours, dbo.OperatingTime.OverhaulHours
FROM     dbo.OperatingTime INNER JOIN
                  dbo.Component ON dbo.OperatingTime.FK_ID_Component = dbo.Component.ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Component.Included = 1)
GO
/****** Object:  Table [dbo].[Repair]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[ID_Repair] [int] IDENTITY(1,1) NOT NULL,
	[DateRepair] [date] NULL,
	[CompanyRepair] [varchar](20) NULL,
	[FK_ID_Component] [int] NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[ID_Repair] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extension]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extension](
	[ID_Extension] [int] IDENTITY(1,1) NOT NULL,
	[DateExtension] [date] NULL,
	[PeriodExtension] [int] NULL,
	[DateEndExtension] [date] NULL,
	[FK_ID_Component] [int] NULL,
 CONSTRAINT [PK_Extension] PRIMARY KEY CLUSTERED 
(
	[ID_Extension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetAllExtension]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllExtension]
AS
SELECT dbo.Aircraft.Name AS ВС, dbo.Aircraft.RegNumber AS [рег.номер], dbo.Component.NameComponent AS Компонет, dbo.Component.ManufactureNumber AS [зав.номер], dbo.Repair.DateRepair AS ДатаРемонта, 
                  dbo.Resource.BasicOverhaulLife AS [меж.рем.срок], dbo.Extension.DateExtension AS [Дата продления], dbo.Extension.DateEndExtension AS [Дата действия], dbo.Extension.PeriodExtension AS [Кол-во лет продления], 
                  dbo.OperatingTime.OperatingHours, dbo.OperatingTime.OverhaulHours, dbo.Resource.BasicOverhaulHours
FROM     dbo.Component INNER JOIN
                  dbo.Extension ON dbo.Component.ID_Component = dbo.Extension.FK_ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft INNER JOIN
                  dbo.OperatingTime ON dbo.Component.ID_Component = dbo.OperatingTime.FK_ID_Component INNER JOIN
                  dbo.Resource ON dbo.Component.FK_ID_Resource = dbo.Resource.ID_Resource INNER JOIN
                  dbo.Repair ON dbo.Component.ID_Component = dbo.Repair.FK_ID_Component
WHERE  (dbo.Component.Included = 1)
GO
/****** Object:  View [dbo].[vGetAllRepair]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllRepair]
AS
SELECT dbo.Aircraft.RegNumber, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Repair.DateRepair, dbo.Repair.CompanyRepair
FROM     dbo.Repair INNER JOIN
                  dbo.Component ON dbo.Repair.FK_ID_Component = dbo.Component.ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Component.Included = 1)
GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[ID_Maintenance] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[NameMaintenance] [varchar](20) NULL,
	[TypeMaintenace] [nchar](10) NULL,
	[SpendTime] [nchar](10) NULL,
	[WorkOrder] [int] NULL,
	[Completed] [int] NULL,
	[FK_ID_ServiceGroup] [int] NULL,
	[FK_ID_Aircraft] [int] NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[ID_Maintenance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetAllMaintenance]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllMaintenance]
AS
SELECT dbo.Maintenance.WorkOrder, dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Maintenance.DateStart, dbo.Maintenance.DateEnd, dbo.Maintenance.NameMaintenance, dbo.Maintenance.TypeMaintenace, dbo.Maintenance.SpendTime, 
                  dbo.Maintenance.Completed
FROM     dbo.Maintenance INNER JOIN
                  dbo.Aircraft ON dbo.Maintenance.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[ID_Flight] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[FlightType] [varchar](50) NULL,
	[AirportDeparture] [varchar](20) NULL,
	[TimeDeparture] [time](7) NULL,
	[AirportArrival] [varchar](20) NULL,
	[TimeArrival] [time](7) NULL,
	[AirHours] [int] NULL,
	[GroundHours] [int] NULL,
	[FlightCompleted] [bit] NULL,
	[FK_ID_Crew] [int] NULL,
	[FK_ID_Aircraft] [int] NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[ID_Flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetAllFlight]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAllFlight]
AS
SELECT dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Flight.Date, dbo.Flight.FlightType, dbo.Flight.AirportDeparture, dbo.Flight.TimeDeparture, dbo.Flight.AirportArrival, dbo.Flight.TimeArrival, dbo.Flight.AirHours, dbo.Flight.GroundHours, 
                  dbo.Flight.FlightCompleted
FROM     dbo.Flight INNER JOIN
                  dbo.Aircraft ON dbo.Flight.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
GO
/****** Object:  View [dbo].[vGetAircraft]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetAircraft]
AS
SELECT ID_Aircraft, Name, RegNumber, Modification
FROM     dbo.Aircraft
GO
/****** Object:  Table [dbo].[AirworthinessCertificate]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirworthinessCertificate](
	[ID_AWC] [int] IDENTITY(1,1) NOT NULL,
	[DateAWC] [date] NULL,
	[NumberAWC] [int] NULL,
	[FK_ID_Aircraft] [int] NULL,
	[ValiditeAWC] [date] NULL,
 CONSTRAINT [PK_AirworthinessCertificate] PRIMARY KEY CLUSTERED 
(
	[ID_AWC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crew]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crew](
	[ID_Crew] [int] IDENTITY(1,1) NOT NULL,
	[NameCrew] [varchar](50) NULL,
 CONSTRAINT [PK_Crew] PRIMARY KEY CLUSTERED 
(
	[ID_Crew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Defect]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Defect](
	[ID_Defect] [int] IDENTITY(1,1) NOT NULL,
	[NameDefect] [nvarchar](100) NULL,
	[NameEliminate] [nvarchar](100) NULL,
	[Eliminated] [bit] NOT NULL,
	[FK_ID_Maintenance] [int] NULL,
 CONSTRAINT [PK_Defect] PRIMARY KEY CLUSTERED 
(
	[ID_Defect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[Position] [varchar](20) NULL,
	[FK_ID_ServiseGroup] [int] NULL,
	[FK_ID_Crew] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EngineСheck]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EngineСheck](
	[ID_EngineCheck] [int] IDENTITY(1,1) NOT NULL,
	[DataEngineCheck] [date] NULL,
	[SpentTime] [time](7) NULL,
	[FuelUsed] [int] NULL,
	[FK_ID_Maintenance] [int] NULL,
 CONSTRAINT [PK_EngineСheck] PRIMARY KEY CLUSTERED 
(
	[ID_EngineCheck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FL]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FL](
	[ID_FL] [int] IDENTITY(1,1) NOT NULL,
	[NameFL] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_FL] PRIMARY KEY CLUSTERED 
(
	[ID_FL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Refueling]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Refueling](
	[ID_Refueling] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Remainder] [int] NULL,
	[Refueling] [int] NULL,
	[FK_ID_Maintenance] [int] NULL,
	[FK_ID_FL] [int] NULL,
 CONSTRAINT [PK_Refueling] PRIMARY KEY CLUSTERED 
(
	[ID_Refueling] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](20) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesToUsers]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesToUsers](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceGroup]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceGroup](
	[ID_ServiceGroup] [int] IDENTITY(1,1) NOT NULL,
	[NameGroup] [varchar](50) NULL,
 CONSTRAINT [PK_ServiceGroup] PRIMARY KEY CLUSTERED 
(
	[ID_ServiceGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nchar](20) NULL,
	[Password] [nchar](20) NULL,
	[FirstName] [nchar](20) NULL,
	[SecondName] [nchar](20) NULL,
	[Gender] [nchar](10) NULL,
	[Phone] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AirworthinessCertificate]  WITH CHECK ADD  CONSTRAINT [FK_AirworthinessCertificate_Aircraft] FOREIGN KEY([FK_ID_Aircraft])
REFERENCES [dbo].[Aircraft] ([ID_Aircraft])
GO
ALTER TABLE [dbo].[AirworthinessCertificate] CHECK CONSTRAINT [FK_AirworthinessCertificate_Aircraft]
GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [FK_Component_Aircraft] FOREIGN KEY([FK_ID_Aircraft])
REFERENCES [dbo].[Aircraft] ([ID_Aircraft])
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [FK_Component_Aircraft]
GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [FK_Component_Resource] FOREIGN KEY([FK_ID_Resource])
REFERENCES [dbo].[Resource] ([ID_Resource])
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [FK_Component_Resource]
GO
ALTER TABLE [dbo].[Defect]  WITH CHECK ADD  CONSTRAINT [FK_Defect_Maintenance1] FOREIGN KEY([FK_ID_Maintenance])
REFERENCES [dbo].[Maintenance] ([ID_Maintenance])
GO
ALTER TABLE [dbo].[Defect] CHECK CONSTRAINT [FK_Defect_Maintenance1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Crew] FOREIGN KEY([FK_ID_Crew])
REFERENCES [dbo].[Crew] ([ID_Crew])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Crew]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_ServiceGroup1] FOREIGN KEY([FK_ID_ServiseGroup])
REFERENCES [dbo].[ServiceGroup] ([ID_ServiceGroup])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_ServiceGroup1]
GO
ALTER TABLE [dbo].[EngineСheck]  WITH CHECK ADD  CONSTRAINT [FK_EngineСheck_Maintenance] FOREIGN KEY([FK_ID_Maintenance])
REFERENCES [dbo].[Maintenance] ([ID_Maintenance])
GO
ALTER TABLE [dbo].[EngineСheck] CHECK CONSTRAINT [FK_EngineСheck_Maintenance]
GO
ALTER TABLE [dbo].[Extension]  WITH CHECK ADD  CONSTRAINT [FK_Extension_Component] FOREIGN KEY([FK_ID_Component])
REFERENCES [dbo].[Component] ([ID_Component])
GO
ALTER TABLE [dbo].[Extension] CHECK CONSTRAINT [FK_Extension_Component]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Crew] FOREIGN KEY([FK_ID_Crew])
REFERENCES [dbo].[Crew] ([ID_Crew])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Crew]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flights_Aircraft] FOREIGN KEY([FK_ID_Aircraft])
REFERENCES [dbo].[Aircraft] ([ID_Aircraft])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flights_Aircraft]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Aircraft1] FOREIGN KEY([FK_ID_Aircraft])
REFERENCES [dbo].[Aircraft] ([ID_Aircraft])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Aircraft1]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_ServiceGroup] FOREIGN KEY([FK_ID_ServiceGroup])
REFERENCES [dbo].[ServiceGroup] ([ID_ServiceGroup])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_ServiceGroup]
GO
ALTER TABLE [dbo].[OperatingTime]  WITH CHECK ADD  CONSTRAINT [FK_OperatingTime_Component] FOREIGN KEY([FK_ID_Component])
REFERENCES [dbo].[Component] ([ID_Component])
GO
ALTER TABLE [dbo].[OperatingTime] CHECK CONSTRAINT [FK_OperatingTime_Component]
GO
ALTER TABLE [dbo].[Refueling]  WITH CHECK ADD  CONSTRAINT [FK_Refueling_FL] FOREIGN KEY([FK_ID_FL])
REFERENCES [dbo].[FL] ([ID_FL])
GO
ALTER TABLE [dbo].[Refueling] CHECK CONSTRAINT [FK_Refueling_FL]
GO
ALTER TABLE [dbo].[Refueling]  WITH CHECK ADD  CONSTRAINT [FK_Refueling_Maintenance] FOREIGN KEY([FK_ID_Maintenance])
REFERENCES [dbo].[Maintenance] ([ID_Maintenance])
GO
ALTER TABLE [dbo].[Refueling] CHECK CONSTRAINT [FK_Refueling_Maintenance]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Component] FOREIGN KEY([FK_ID_Component])
REFERENCES [dbo].[Component] ([ID_Component])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Component]
GO
ALTER TABLE [dbo].[RolesToUsers]  WITH CHECK ADD  CONSTRAINT [FK_RolwsToUsers_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RolesToUsers] CHECK CONSTRAINT [FK_RolwsToUsers_Roles]
GO
ALTER TABLE [dbo].[RolesToUsers]  WITH CHECK ADD  CONSTRAINT [FK_RolwsToUsers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[RolesToUsers] CHECK CONSTRAINT [FK_RolwsToUsers_Users]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUserInfo]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteUserInfo]
	@userid int
AS
BEGIN	
 DELETE FROM Users WHERE UserID = @userid
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAircraft]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllAircraft] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID_Aircraft, Name, RegNumber
    FROM  dbo.Aircraft
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAircraftInfo]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllAircraftInfo] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Aircraft.Name, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, dbo.Component.ManufactureNumber
FROM     dbo.Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllComponent]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllComponent] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Component.NamePart, dbo.Component.NameSystem, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, 
                  dbo.Component.DateInstallRemove, dbo.Component.Included
FROM     dbo.Aircraft INNER JOIN
                  dbo.Component ON dbo.Aircraft.ID_Aircraft = dbo.Component.FK_ID_Aircraft
WHERE  (dbo.Component.Included = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllComponentAircraft]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllComponentAircraft]
     @idAircraft int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Component.NamePart, dbo.Component.NameSystem, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, 
                  dbo.Component.DateInstallRemove, dbo.Component.Included
FROM     dbo.Aircraft INNER JOIN
                  dbo.Component ON dbo.Aircraft.ID_Aircraft = dbo.Component.FK_ID_Aircraft
WHERE  (dbo.Component.Included = 1) AND ID_Aircraft = @idAircraft
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllExtension]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllExtension] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Component.NameSystem, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Component.ManufactureDate, dbo.Component.ManufactureName, dbo.Component.DateInstallRemove, 
                  dbo.Component.Included
    FROM     dbo.Aircraft INNER JOIN
                  dbo.Component ON dbo.Aircraft.ID_Aircraft = dbo.Component.FK_ID_Aircraft
    WHERE  (dbo.Component.Included = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllFlights]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllFlights] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Flight.Date, dbo.Flight.FlightType, dbo.Flight.AirportDeparture, dbo.Flight.TimeDeparture, dbo.Flight.AirportArrival, dbo.Flight.TimeArrival, dbo.Flight.AirHours, dbo.Flight.GroundHours, 
                  dbo.Flight.FlightCompleted
FROM     dbo.Flight INNER JOIN
                  dbo.Aircraft ON dbo.Flight.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Flight.FlightCompleted = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllMaintenance]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllMaintenance] 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Maintenance.WorkOrder, dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Maintenance.DateStart, dbo.Maintenance.DateEnd, dbo.Maintenance.NameMaintenance, dbo.Maintenance.TypeMaintenace, dbo.Maintenance.SpendTime, 
                  dbo.Maintenance.Completed
FROM     dbo.Maintenance INNER JOIN
                  dbo.Aircraft ON dbo.Maintenance.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
     WHERE  (dbo.Maintenance.Completed = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllMaintenanceInWork]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllMaintenanceInWork] 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Maintenance.WorkOrder, dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Maintenance.DateStart, dbo.Maintenance.DateEnd, dbo.Maintenance.NameMaintenance, dbo.Maintenance.TypeMaintenace, dbo.Maintenance.SpendTime, 
                  dbo.Maintenance.Completed
FROM     dbo.Maintenance INNER JOIN
                  dbo.Aircraft ON dbo.Maintenance.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
     WHERE  (dbo.Maintenance.Completed = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllOperatingTime]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllOperatingTime] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Component.NameComponent, dbo.OperatingTime.OperatingHours, dbo.OperatingTime.OverhaulHours
    FROM     dbo.OperatingTime INNER JOIN
                  dbo.Component ON dbo.OperatingTime.FK_ID_Component = dbo.Component.ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
    WHERE  (dbo.Component.Included = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllPlanFlights]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllPlanFlights] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT dbo.Aircraft.Name, dbo.Aircraft.RegNumber, dbo.Flight.Date, dbo.Flight.FlightType, dbo.Flight.AirportDeparture, dbo.Flight.TimeDeparture, dbo.Flight.AirportArrival, dbo.Flight.TimeArrival, dbo.Flight.AirHours, dbo.Flight.GroundHours, 
                  dbo.Flight.FlightCompleted
FROM     dbo.Flight INNER JOIN
                  dbo.Aircraft ON dbo.Flight.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
WHERE  (dbo.Flight.FlightCompleted = 0 AND dbo.Flight.Date>getdate())
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllRegNumbers]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllRegNumbers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID_Aircraft, RegNumber
    FROM  dbo.Aircraft
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllRepair]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllRepair] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Aircraft.RegNumber, dbo.Component.NameComponent, dbo.Component.ManufactureNumber, dbo.Repair.DateRepair, dbo.Repair.CompanyRepair
	FROM     dbo.Repair INNER JOIN
                  dbo.Component ON dbo.Repair.FK_ID_Component = dbo.Component.ID_Component INNER JOIN
                  dbo.Aircraft ON dbo.Component.FK_ID_Aircraft = dbo.Aircraft.ID_Aircraft
	WHERE  (dbo.Component.Included = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUserRoles]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllUserRoles]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Roles
	INNER JOIN RolesToUsers ON Roles.RoleID = RolesToUsers.RoleID
	WHERE RolesToUsers.UserID = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersData]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllUsersData]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT * FROM Users

END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserCredential]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserCredential]
	-- Add the parameters for the stored procedure here
	@login varchar(20),
	@password varchar(20),
	@firstname varchar(20) out,
	@secondname varchar(20) out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @firstname = Users.FirstName, @secondname = Users.SecondName FROM Users
	INNER JOIN RolesToUsers ON Users.UserID = RolesToUsers.UserID
	INNER JOIN Roles ON RolesToUsers.RoleID = Roles.RoleID
	WHERE Users.Login = @login AND Users.Password = @password

	SELECT Roles.Type FROM Users
	INNER JOIN RolesToUsers ON Users.UserID = RolesToUsers.UserId
	INNER JOIN Roles ON RolesToUsers.RoleID = Roles.RoleID
	WHERE Users.Login = @login AND Users.Password = @password

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUserData]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertUserData] 
	-- Add the parameters for the stored procedure here
	@login varchar(10),
	@password varchar(10),
	@firstName varchar(10) = null,
	@secondName varchar(10) = null,
	@gender varchar(10) = null,
	@phone varchar(10) = null,
	@role varchar(10) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO
	Users (Login, Password, FirstName, SecondName, Gender, phone)
	VALUES (@login, @password, @firstName, @secondName, @gender,@phone)

	IF @role IS NULL OR LEN(@role) = 0
	SET @role = 'User'

	INSERT INTO RolesToUsers VALUES(IDENT_CURRENT('Users'), 
	(SELECT RoleID FROM Roles WHERE Type = @role))
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUserInfo]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertUserInfo] 
	@login varchar(20),
	@password varchar(20),
	@firstname varchar(20) = null,
	@secondname varchar(20) = null,
	@gender varchar(20) = null,
	@phone varchar(20) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO 
	Users (Login, Password, FirstName, SecondName, Gender, Phone)
	VALUES (@login, @password, @firstname, @secondname, @gender, @phone)

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUserInfo]    Script Date: 06.11.2023 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateUserInfo] 
	-- Add the parameters for the stored procedure here
	@userId int,
	@login varchar(10),
	@password varchar(10),
	@firstName varchar(10) = null,
	@secondName varchar(10) = null,
	@gender varchar(10) = null,
	@phone varchar(10) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users SET
	Login = @login, Password = @password, 
	FirstName = @firstName, SecondName = @secondName, 
	Gender = @gender, Phone = @phone
	WHERE UserID = @userId

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Регистационный номер ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Aircraft', @level2type=N'COLUMN',@level2name=N'RegNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Модификация Т-транспортный, С-санитарный, Ф-Аэрофотосъемка, TП - транспортно пассажирский, СХ- Сельско-хозяйственный' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Aircraft', @level2type=N'COLUMN',@level2name=N'Modification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата выдачи' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AirworthinessCertificate', @level2type=N'COLUMN',@level2name=N'DateAWC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер сертификата' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AirworthinessCertificate', @level2type=N'COLUMN',@level2name=N'NumberAWC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата, до которой действителен' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AirworthinessCertificate', @level2type=N'COLUMN',@level2name=N'ValiditeAWC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Сертификат летной годности ВС, выдается на год как тех.осмотр авто' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AirworthinessCertificate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Компонента ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'ID_Component'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наименование основных частей ВС Планер, Двигатель, Винт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'NamePart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название систем основных частей Планер, Двигатель, Винт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'NameSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название компонентов частей и систем, в том числе и название Двигатель Планер и Винт как отдельные компаненты, для описания их информации' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'NameComponent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата изготовления' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'ManufactureDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Завадское название компонента' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'ManufactureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Заводской номер компонента' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'ManufactureNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Включенение компонента в состав ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'Included'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата установки, дата снятия компонента если компонент включен Included - true, то дата установки, если нет то дата снятия' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'DateInstallRemove'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Состояние исправен/неисправен' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Компоненты ВС - основные части планер, двигатель,винт их системы и включенные компоненты ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Component'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Экипаж ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Crew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название дефекта' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Defect', @level2type=N'COLUMN',@level2name=N'NameDefect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Метод устранения' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Defect', @level2type=N'COLUMN',@level2name=N'NameEliminate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Отметка о устранении' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Defect', @level2type=N'COLUMN',@level2name=N'Eliminated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дефекты обнаруженные при ТО' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Defect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Должность' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Работники' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Время работы двигателя, для добавления в наработку двигателя' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EngineСheck', @level2type=N'COLUMN',@level2name=N'SpentTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Количество потраченого топлива при запуске' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EngineСheck', @level2type=N'COLUMN',@level2name=N'FuelUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Запуск двигателя при ТО, для контроля параметров' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EngineСheck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата продления срока службы - продлении дается на год' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extension', @level2type=N'COLUMN',@level2name=N'DateExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Период продления -  количество лет со дня окончания "Межремонтного срока службы компонента"( но не межремонтной наработки - сразу ремонт)  до даты окончания продления ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extension', @level2type=N'COLUMN',@level2name=N'PeriodExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата окончания продления - дата после которой необходимо выполнить ремонт или продление срока службы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extension', @level2type=N'COLUMN',@level2name=N'DateEndExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Продления срока службы компонента' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Бензин/масло' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FL', @level2type=N'COLUMN',@level2name=N'NameFL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'АИ-95/МС-20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FL', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ГСМ - топливо, масло' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата выполненого полета или планируемого' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Тип полета: Маршрут(полет с возвращением в место базирования), Перелет(новое место базирования), Контрольно-испытательный полет(КИП), для продления сертификата летной годности,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'FlightType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Аэропорт вылета' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'AirportDeparture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Время вылета' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'TimeDeparture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Аэропорт прибытия' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'AirportArrival'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Время прибытия' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'TimeArrival'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка в полете, время от момента разбега до пробега после посадки. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'AirHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка двигателя на земле, время от начала запуска двигателей до начало разбега по полосе, от посадки и руления до стоянки данные предоствляет командир ВС   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'GroundHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Выполненый и планируемый полет' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight', @level2type=N'COLUMN',@level2name=N'FlightCompleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Информация о выполненных полетах и планируемых' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Периодическое ТО/Оперативное ТО' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance', @level2type=N'COLUMN',@level2name=N'NameMaintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Оперативное ТО - ПР+ОВ, КВС+ОВ, ВС+ПП/ Периодическое ТО - Формы Ф-1, Ф-2, Ф-4, Ф-8 (совместно с ними ВЛП, ОЗП, Бюллетень ) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance', @level2type=N'COLUMN',@level2name=N'TypeMaintenace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Установленные человека часы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance', @level2type=N'COLUMN',@level2name=N'SpendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер карта-наряд для выполнения ТО ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance', @level2type=N'COLUMN',@level2name=N'WorkOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Выполнено или находиться на выполнении' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance', @level2type=N'COLUMN',@level2name=N'Completed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Обслуживание ВС- оперативное и периодическое ТО' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Maintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID наработки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperatingTime', @level2type=N'COLUMN',@level2name=N'ID_OperatingTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка на данную дату' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperatingTime', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка "СНЭ" с начала эксплуатации ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperatingTime', @level2type=N'COLUMN',@level2name=N'OperatingHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка "ППР" после последнего ремонта' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperatingTime', @level2type=N'COLUMN',@level2name=N'OverhaulHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наработка компонента в часах' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperatingTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата выполнения заправки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Refueling', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Остаток топлива после прилета' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Refueling', @level2type=N'COLUMN',@level2name=N'Remainder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Заправка топливом' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Refueling', @level2type=N'COLUMN',@level2name=N'Refueling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'При обслуживании выполняеться заправка ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Refueling'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата выполненого ремонта, для отсчета сроков службы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Repair', @level2type=N'COLUMN',@level2name=N'DateRepair'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название компании выполнявшей ремонт ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Repair', @level2type=N'COLUMN',@level2name=N'FK_ID_Component'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Межремонтная наработка в часах, после которой необходим ремонт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'BasicOverhaulHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Межремонтный срок службы, после которого выполнения ремонта или продление срока службы(и только в течении межремонтной наработки)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'BasicOverhaulLife'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Назначенный ресурс в часах, после которого эксплуатация ВС запрещена.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'UsefullHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Назначеный срок службы, количество лет после которых эксплуатация ВС запрещена' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'UsefullLife'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Установленный ресурс производителем' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Оперативное ТО работа по обеспечению взлета и посадки/ периодическое ТО - работы по обслуживанию и востановления исправности ВС' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceGroup', @level2type=N'COLUMN',@level2name=N'NameGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Группа обслуживания' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceGroup'
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
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAircraft'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAircraft'
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
         Begin Table = "OperatingTime"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 170
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 592
               Bottom = 170
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Resource"
            Begin Extent = 
               Top = 7
               Left = 834
               Bottom = 170
               Right = 1061
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 576
         Width = 1080
         Width = 936
         Width = 1104
         Width = 1128
         Width = 1548
         Width = 1488
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllAircraftHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllAircraftHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllAircraftHours'
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
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 381
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 127
               Left = 328
               Bottom = 290
               Right = 522
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1344
         Width = 1524
         Width = 1824
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllAircraftInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllAircraftInfo'
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
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 328
               Bottom = 170
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1872
         Width = 1452
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllComponent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllComponent'
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
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 328
               Bottom = 170
               Right = 522
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllEngine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllEngine'
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
         Begin Table = "Component"
            Begin Extent = 
               Top = 119
               Left = 735
               Bottom = 282
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Extension"
            Begin Extent = 
               Top = 0
               Left = 426
               Bottom = 169
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 271
               Left = 423
               Bottom = 434
               Right = 617
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OperatingTime"
            Begin Extent = 
               Top = 20
               Left = 1139
               Bottom = 183
               Right = 1355
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Resource"
            Begin Extent = 
               Top = 127
               Left = 48
               Bottom = 290
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Repair"
            Begin Extent = 
               Top = 210
               Left = 1137
               Bottom = 373
               Right = 1353
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
      Begin ColumnWidths = 23
         Width = 284
         Width = 1944
         W' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'idth = 2184
         Width = 1944
         Width = 2052
         Width = 1980
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1752
         Width = 1464
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1896
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllExtension'
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
         Begin Table = "Flight"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 305
               Bottom = 170
               Right = 499
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllFlight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllFlight'
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
         Begin Table = "Maintenance"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 316
               Bottom = 170
               Right = 510
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllMaintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllMaintenance'
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
         Begin Table = "OperatingTime"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 170
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 592
               Bottom = 170
               Right = 824
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllOperatingTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllOperatingTime'
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
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 328
               Bottom = 170
               Right = 522
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllPropeller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllPropeller'
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
         Begin Table = "Repair"
            Begin Extent = 
               Top = 26
               Left = 144
               Bottom = 189
               Right = 360
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Component"
            Begin Extent = 
               Top = 7
               Left = 408
               Bottom = 170
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Aircraft"
            Begin Extent = 
               Top = 7
               Left = 688
               Bottom = 170
               Right = 920
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllRepair'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetAllRepair'
GO
USE [master]
GO
ALTER DATABASE [MTA] SET  READ_WRITE 
GO
