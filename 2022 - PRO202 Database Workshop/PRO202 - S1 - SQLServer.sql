USE [master]
GO
/****** Object:  Database [car_rental]    Script Date: 8/19/2022 2:27:02 PM ******/
CREATE DATABASE [car_rental]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'car_rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\car_rental.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'car_rental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\car_rental_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [car_rental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [car_rental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [car_rental] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [car_rental] SET ANSI_NULLS OFF
GO
ALTER DATABASE [car_rental] SET ANSI_PADDING OFF
GO
ALTER DATABASE [car_rental] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [car_rental] SET ARITHABORT OFF
GO
ALTER DATABASE [car_rental] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [car_rental] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [car_rental] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [car_rental] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [car_rental] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [car_rental] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [car_rental] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [car_rental] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [car_rental] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [car_rental] SET  DISABLE_BROKER
GO
ALTER DATABASE [car_rental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [car_rental] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [car_rental] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [car_rental] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [car_rental] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [car_rental] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [car_rental] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [car_rental] SET RECOVERY SIMPLE
GO
ALTER DATABASE [car_rental] SET  MULTI_USER
GO
ALTER DATABASE [car_rental] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [car_rental] SET DB_CHAINING OFF
GO
ALTER DATABASE [car_rental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [car_rental] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [car_rental] SET DELAYED_DURABILITY = DISABLED
GO
USE [car_rental]
GO
/****** Object:  Table [dbo].[cars]    Script Date: 8/19/2022 2:27:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cars](
	[plate] [varchar](6) NOT NULL,
	[rental_price] [int] NOT NULL,
	[warranty_cost] [int] NOT NULL,
	[color] [varchar](100) NOT NULL,
	[model] [varchar](100) NOT NULL,
	[brand] [varchar](100) NOT NULL,
	[motor] [float] NOT NULL,
	[type] [varchar](100) NOT NULL,
	[year] [varchar](4) NOT NULL,
	[version] [varchar](50) NOT NULL,
	[availability] [bit] NOT NULL,
 CONSTRAINT [PK_cars] PRIMARY KEY CLUSTERED
(
	[plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clients]    Script Date: 8/19/2022 2:27:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clients](
	[rut] [int] NOT NULL,
	[name] [varchar](250) NOT NULL,
	[last_name] [varchar](250) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[phone] [int] NOT NULL,
	[email] [varchar](250) NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employees]    Script Date: 8/19/2022 2:27:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employees](
	[rut] [int] NOT NULL,
	[password] [varchar](250) NOT NULL,
	[name] [varchar](250) NOT NULL,
	[last_name] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rentals]    Script Date: 8/19/2022 2:27:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rentals](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[car_plate] [varchar](6) NOT NULL,
	[client_rut] [int] NOT NULL,
	[date_start] [date] NOT NULL,
	[date_end] [date] NOT NULL,
	[status_initial] [varchar](250) NOT NULL,
	[status_end] [varchar](250) NOT NULL,
	[km_initial] [int] NOT NULL,
	[km_end] [int] NOT NULL,
	[paid] [bit] NOT NULL,
	[sales_manager_rut] [int] NOT NULL,
 CONSTRAINT [PK_rentals] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [FK_rentals_cars] FOREIGN KEY([car_plate])
REFERENCES [dbo].[cars] ([plate])
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [FK_rentals_cars]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [FK_rentals_clients] FOREIGN KEY([client_rut])
REFERENCES [dbo].[clients] ([rut])
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [FK_rentals_clients]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [FK_rentals_employees] FOREIGN KEY([sales_manager_rut])
REFERENCES [dbo].[employees] ([rut])
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [FK_rentals_employees]
GO
USE [master]
GO
ALTER DATABASE [car_rental] SET  READ_WRITE
GO

