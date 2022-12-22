/*
# @author Esteban Cuevas
# @collaborators Ruth Morales, Karen Contreras
# Date: 2022-07-16
# License: MIT https://opensource.org/licenses/MIT
*/

USE [master]
GO
/****** Object:  Database [pro102s07_netflix]    Script Date: 12/07/2022 8:00:51 pm ******/
CREATE DATABASE [pro102s07_netflix]
GO
ALTER DATABASE [pro102s07_netflix] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pro102s07_netflix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pro102s07_netflix] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [pro102s07_netflix] SET ANSI_NULLS OFF
GO
ALTER DATABASE [pro102s07_netflix] SET ANSI_PADDING OFF
GO
ALTER DATABASE [pro102s07_netflix] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [pro102s07_netflix] SET ARITHABORT OFF
GO
ALTER DATABASE [pro102s07_netflix] SET AUTO_CLOSE ON
GO
ALTER DATABASE [pro102s07_netflix] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [pro102s07_netflix] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [pro102s07_netflix] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [pro102s07_netflix] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [pro102s07_netflix] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [pro102s07_netflix] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [pro102s07_netflix] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [pro102s07_netflix] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [pro102s07_netflix] SET  ENABLE_BROKER
GO
ALTER DATABASE [pro102s07_netflix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [pro102s07_netflix] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [pro102s07_netflix] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [pro102s07_netflix] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [pro102s07_netflix] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [pro102s07_netflix] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [pro102s07_netflix] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [pro102s07_netflix] SET RECOVERY SIMPLE
GO
ALTER DATABASE [pro102s07_netflix] SET  MULTI_USER
GO
ALTER DATABASE [pro102s07_netflix] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [pro102s07_netflix] SET DB_CHAINING OFF
GO
ALTER DATABASE [pro102s07_netflix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [pro102s07_netflix] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [pro102s07_netflix] SET DELAYED_DURABILITY = DISABLED
GO
USE [pro102s07_netflix]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre] [varchar](20) NULL,
	[dirección] [varchar](50) NULL,
	[teléfono] [varchar](7) NULL,
 CONSTRAINT [PK_cliente_codigo] PRIMARY KEY CLUSTERED
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[director]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[director](
	[codigo] [numeric](18, 0) NOT NULL,
	[nombre] [varchar](35) NOT NULL,
	[apellidos] [varchar](50) NULL,
 CONSTRAINT [PK_director_codigo] PRIMARY KEY CLUSTERED
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[codCliente] [numeric](18, 0) NOT NULL,
	[fechaPago] [date] NULL,
	[monto] [numeric](18, 0) NULL,
 CONSTRAINT [PK_pago_codcliente] PRIMARY KEY CLUSTERED
(
	[codCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pelicula]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pelicula](
	[codigo] [numeric](18, 0) NOT NULL,
	[titulo] [varchar](35) NULL,
	[nacionalidad] [varchar](50) NULL,
	[productora] [varchar](50) NULL,
	[fechaEstreno] [date] NULL,
	[codDirector] [numeric](18, 0) NULL,
	[codCategoria] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reproduce]    Script Date: 12/07/2022 8:00:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reproduce](
	[fechaCom] [date] NULL,
	[fechaTer] [date] NULL,
	[codCliente] [numeric](18, 0) NOT NULL,
	[codPelicula] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_reproduce_dual] PRIMARY KEY CLUSTERED
(
	[codCliente] ASC,
	[codPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categoria] ([codigo], [nombre]) VALUES (CAST(1 AS Numeric(18, 0)), N'Accion')
GO
INSERT [dbo].[categoria] ([codigo], [nombre]) VALUES (CAST(2 AS Numeric(18, 0)), N'Familiar')
GO
INSERT [dbo].[categoria] ([codigo], [nombre]) VALUES (CAST(3 AS Numeric(18, 0)), N'Horror')
GO
INSERT [dbo].[categoria] ([codigo], [nombre]) VALUES (CAST(4 AS Numeric(18, 0)), N'Ciencia Ficción')
GO
INSERT [dbo].[categoria] ([codigo], [nombre]) VALUES (CAST(5 AS Numeric(18, 0)), N'Drama')
GO
INSERT [dbo].[cliente] ([codigo], [nombre], [dirección], [teléfono]) VALUES (CAST(1 AS Numeric(18, 0)), N'Freddy Krueger', N'Elm Street 123', N'123666')
GO
INSERT [dbo].[cliente] ([codigo], [nombre], [dirección], [teléfono]) VALUES (CAST(2 AS Numeric(18, 0)), N'Dory Blue', N'P Sherman calle Wallaby 42', N'555123')
GO
INSERT [dbo].[cliente] ([codigo], [nombre], [dirección], [teléfono]) VALUES (CAST(3 AS Numeric(18, 0)), N'Bob Parr', N'Incredibles Street 101', N'777123')
GO
INSERT [dbo].[cliente] ([codigo], [nombre], [dirección], [teléfono]) VALUES (CAST(4 AS Numeric(18, 0)), N'Max Rockatansky', N'Desert Stret 4', N'999123')
GO
INSERT [dbo].[cliente] ([codigo], [nombre], [dirección], [teléfono]) VALUES (CAST(5 AS Numeric(18, 0)), N'Ellen Ripley', N'Space Street 1979', N'111321')
GO
INSERT [dbo].[director] ([codigo], [nombre], [apellidos]) VALUES (CAST(1 AS Numeric(18, 0)), N'Christopher', N'Nolan')
GO
INSERT [dbo].[director] ([codigo], [nombre], [apellidos]) VALUES (CAST(2 AS Numeric(18, 0)), N'Steven', N'Spielberg')
GO
INSERT [dbo].[director] ([codigo], [nombre], [apellidos]) VALUES (CAST(3 AS Numeric(18, 0)), N'Alfred', N'Hitchcock')
GO
INSERT [dbo].[director] ([codigo], [nombre], [apellidos]) VALUES (CAST(4 AS Numeric(18, 0)), N'Stanley', N'Kubrick')
GO
INSERT [dbo].[director] ([codigo], [nombre], [apellidos]) VALUES (CAST(5 AS Numeric(18, 0)), N'Martin', N'Scorsese')
GO
INSERT [dbo].[pago] ([codCliente], [fechaPago], [monto]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(N'2022-07-08' AS Date), CAST(5000 AS Numeric(18, 0)))
GO
INSERT [dbo].[pago] ([codCliente], [fechaPago], [monto]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(N'2022-07-09' AS Date), CAST(7000 AS Numeric(18, 0)))
GO
INSERT [dbo].[pago] ([codCliente], [fechaPago], [monto]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(N'2022-07-10' AS Date), CAST(3000 AS Numeric(18, 0)))
GO
INSERT [dbo].[pago] ([codCliente], [fechaPago], [monto]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(N'2022-07-11' AS Date), CAST(5000 AS Numeric(18, 0)))
GO
INSERT [dbo].[pago] ([codCliente], [fechaPago], [monto]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(N'2022-07-12' AS Date), CAST(10000 AS Numeric(18, 0)))
GO
INSERT [dbo].[pelicula] ([codigo], [titulo], [nacionalidad], [productora], [fechaEstreno], [codDirector], [codCategoria]) VALUES (CAST(1 AS Numeric(18, 0)), N'Inception', N'USA', N'Warner Bros', CAST(N'2010-07-16' AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pelicula] ([codigo], [titulo], [nacionalidad], [productora], [fechaEstreno], [codDirector], [codCategoria]) VALUES (CAST(2 AS Numeric(18, 0)), N'ET', N'USA', N'Universal', CAST(N'1982-06-11' AS Date), CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pelicula] ([codigo], [titulo], [nacionalidad], [productora], [fechaEstreno], [codDirector], [codCategoria]) VALUES (CAST(3 AS Numeric(18, 0)), N'Psycho', N'USA', N'Shamley', CAST(N'1960-09-08' AS Date), CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pelicula] ([codigo], [titulo], [nacionalidad], [productora], [fechaEstreno], [codDirector], [codCategoria]) VALUES (CAST(4 AS Numeric(18, 0)), N'2001 A Space Odyssey', N'USA', N'MGM', CAST(N'1970-06-24' AS Date), CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pelicula] ([codigo], [titulo], [nacionalidad], [productora], [fechaEstreno], [codDirector], [codCategoria]) VALUES (CAST(5 AS Numeric(18, 0)), N'Taxi Driver', N'USA', N'Columbia Pictures', CAST(N'1976-02-09' AS Date), CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[reproduce] ([fechaCom], [fechaTer], [codCliente], [codPelicula]) VALUES (CAST(N'2022-07-08' AS Date), CAST(N'2022-08-08' AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[reproduce] ([fechaCom], [fechaTer], [codCliente], [codPelicula]) VALUES (CAST(N'2022-07-09' AS Date), CAST(N'2022-08-09' AS Date), CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[reproduce] ([fechaCom], [fechaTer], [codCliente], [codPelicula]) VALUES (CAST(N'2022-07-10' AS Date), CAST(N'2022-08-10' AS Date), CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[reproduce] ([fechaCom], [fechaTer], [codCliente], [codPelicula]) VALUES (CAST(N'2022-07-11' AS Date), CAST(N'2022-08-11' AS Date), CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[reproduce] ([fechaCom], [fechaTer], [codCliente], [codPelicula]) VALUES (CAST(N'2022-07-12' AS Date), CAST(N'2022-08-12' AS Date), CAST(4 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_cliente] FOREIGN KEY([codCliente])
REFERENCES [dbo].[cliente] ([codigo])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_cliente]
GO
ALTER TABLE [dbo].[pelicula]  WITH CHECK ADD  CONSTRAINT [FK_pelicula_categoria] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[categoria] ([codigo])
GO
ALTER TABLE [dbo].[pelicula] CHECK CONSTRAINT [FK_pelicula_categoria]
GO
ALTER TABLE [dbo].[pelicula]  WITH CHECK ADD  CONSTRAINT [FK_pelicula_director] FOREIGN KEY([codDirector])
REFERENCES [dbo].[director] ([codigo])
GO
ALTER TABLE [dbo].[pelicula] CHECK CONSTRAINT [FK_pelicula_director]
GO
ALTER TABLE [dbo].[reproduce]  WITH CHECK ADD  CONSTRAINT [FK_reproduce_cliente] FOREIGN KEY([codCliente])
REFERENCES [dbo].[cliente] ([codigo])
GO
ALTER TABLE [dbo].[reproduce] CHECK CONSTRAINT [FK_reproduce_cliente]
GO
ALTER TABLE [dbo].[reproduce]  WITH CHECK ADD  CONSTRAINT [FK_reproduce_pelicula] FOREIGN KEY([codPelicula])
REFERENCES [dbo].[pelicula] ([codigo])
GO
ALTER TABLE [dbo].[reproduce] CHECK CONSTRAINT [FK_reproduce_pelicula]
GO
USE [master]
GO
ALTER DATABASE [pro102s07_netflix] SET  READ_WRITE
GO
