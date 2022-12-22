/*
# @author Esteban Cuevas
# @collaborators Ruth Morales, Karen Contreras
# Date: 2022-07-05
# License: MIT https://opensource.org/licenses/MIT
*/

USE [master]
GO
/****** Object:  Database [pro102s05]    Script Date: 05/07/2022 1:06:15 pm ******/
CREATE DATABASE [pro102s05]
GO
ALTER DATABASE [pro102s05] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pro102s05].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pro102s05] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [pro102s05] SET ANSI_NULLS OFF
GO
ALTER DATABASE [pro102s05] SET ANSI_PADDING OFF
GO
ALTER DATABASE [pro102s05] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [pro102s05] SET ARITHABORT OFF
GO
ALTER DATABASE [pro102s05] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [pro102s05] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [pro102s05] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [pro102s05] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [pro102s05] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [pro102s05] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [pro102s05] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [pro102s05] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [pro102s05] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [pro102s05] SET  DISABLE_BROKER
GO
ALTER DATABASE [pro102s05] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [pro102s05] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [pro102s05] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [pro102s05] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [pro102s05] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [pro102s05] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [pro102s05] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [pro102s05] SET RECOVERY SIMPLE
GO
ALTER DATABASE [pro102s05] SET  MULTI_USER
GO
ALTER DATABASE [pro102s05] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [pro102s05] SET DB_CHAINING OFF
GO
ALTER DATABASE [pro102s05] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [pro102s05] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [pro102s05] SET DELAYED_DURABILITY = DISABLED
GO
USE [pro102s05]
GO
/****** Object:  Table [dbo].[Det_Orden_de_Trabajo]    Script Date: 05/07/2022 1:06:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Det_Orden_de_Trabajo](
  [Num_OT] [int] NOT NULL,
  [Num_Det_OT] [int] IDENTITY(1,1) NOT NULL,
  [Cod_Modelo] [varchar](255) NOT NULL,
  [Num_pares] [int] NOT NULL,
  [Numeracion_pares] [int] NOT NULL,
 CONSTRAINT [PK_Det_Orden_de_Trabajo] PRIMARY KEY CLUSTERED
(
  [Num_OT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiales]    Script Date: 05/07/2022 1:06:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materiales](
  [Cod_material] [varchar](20) NOT NULL,
  [Nom_material] [varchar](255) NOT NULL,
  [Tipo_material] [varchar](255) NOT NULL,
  [vigencia_material] [int] NOT NULL,
 CONSTRAINT [PK_Materiales] PRIMARY KEY CLUSTERED
(
  [Cod_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 05/07/2022 1:06:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
  [Cod_Modelo] [varchar](255) NOT NULL,
  [Nombre_mod] [varchar](255) NOT NULL,
  [Tipo_mod] [varchar](255) NOT NULL,
  [Vigencia_mod] [int] NOT NULL,
  [Cod_material] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED
(
  [Cod_Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_de_Trabajo]    Script Date: 05/07/2022 1:06:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_de_Trabajo](
  [Num_OT] [int] NOT NULL,
  [Rut_Cli] [varchar](9) NOT NULL,
  [Fecha_ingresoOT] [date] NOT NULL,
  [Fecha_finOT] [date] NULL,
  [Estado_OT] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Orden_de_Trabajo] PRIMARY KEY CLUSTERED
(
  [Num_OT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Materiales] ADD  CONSTRAINT [DF_Materiales_vigencia_material]  DEFAULT ((1)) FOR [vigencia_material]
GO
ALTER TABLE [dbo].[Modelo] ADD  CONSTRAINT [DF_Modelo_Vigencia_mod]  DEFAULT ((1)) FOR [Vigencia_mod]
GO
ALTER TABLE [dbo].[Orden_de_Trabajo] ADD  CONSTRAINT [DF_Orden_de_Trabajo_Estado_OT]  DEFAULT ('i') FOR [Estado_OT]
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Det_Orden_de_Trabajo_Modelo] FOREIGN KEY([Cod_Modelo])
REFERENCES [dbo].[Modelo] ([Cod_Modelo])
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo] CHECK CONSTRAINT [FK_Det_Orden_de_Trabajo_Modelo]
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Det_Orden_de_Trabajo_Orden_de_Trabajo] FOREIGN KEY([Num_OT])
REFERENCES [dbo].[Orden_de_Trabajo] ([Num_OT])
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo] CHECK CONSTRAINT [FK_Det_Orden_de_Trabajo_Orden_de_Trabajo]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Materiales] FOREIGN KEY([Cod_material])
REFERENCES [dbo].[Materiales] ([Cod_material])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Materiales]
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [CK_Det_Orden_de_Trabajo_Num_Pares] CHECK  (([Num_pares]>=(1) AND [Num_pares]<=(20)))
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo] CHECK CONSTRAINT [CK_Det_Orden_de_Trabajo_Num_Pares]
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [CK_Det_Orden_de_Trabajo_Numeracion_pares] CHECK  (([Numeracion_pares]>=(33) AND [Numeracion_pares]<=(34)))
GO
ALTER TABLE [dbo].[Det_Orden_de_Trabajo] CHECK CONSTRAINT [CK_Det_Orden_de_Trabajo_Numeracion_pares]
GO
ALTER TABLE [dbo].[Materiales]  WITH CHECK ADD  CONSTRAINT [CK_Materiales_Tipo_Material] CHECK  (([Tipo_material]='sintetico' OR [Tipo_material]='natural'))
GO
ALTER TABLE [dbo].[Materiales] CHECK CONSTRAINT [CK_Materiales_Tipo_Material]
GO
ALTER TABLE [dbo].[Materiales]  WITH CHECK ADD  CONSTRAINT [CK_Materiales_vigencia_material] CHECK  (([vigencia_material]=(0) OR [vigencia_material]=(1)))
GO
ALTER TABLE [dbo].[Materiales] CHECK CONSTRAINT [CK_Materiales_vigencia_material]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [CK_Modelo_Tipo_Mod] CHECK  (([Tipo_mod]='adulto' OR [Tipo_mod]='juvenil' OR [Tipo_mod]='infantil'))
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [CK_Modelo_Tipo_Mod]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [CK_Modelo_Vigencia_mod] CHECK  (([Vigencia_mod]=(2) OR [Vigencia_mod]=(1)))
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [CK_Modelo_Vigencia_mod]
GO
ALTER TABLE [dbo].[Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [CK_Orden_de_Trabajo_EstadoOT] CHECK  (([Estado_OT]='t' OR [Estado_OT]='n' OR [Estado_OT]='p' OR [Estado_OT]='i'))
GO
ALTER TABLE [dbo].[Orden_de_Trabajo] CHECK CONSTRAINT [CK_Orden_de_Trabajo_EstadoOT]
GO
ALTER TABLE [dbo].[Orden_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [CK_Orden_de_Trabajo_RUT] CHECK  ((len([Rut_Cli])>=(1) AND len([Rut_Cli])<=(9) AND [Rut_Cli] like '^[0-9|K]{1,9}$'))
GO
ALTER TABLE [dbo].[Orden_de_Trabajo] CHECK CONSTRAINT [CK_Orden_de_Trabajo_RUT]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio Num_Pares' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Det_Orden_de_Trabajo', @level2type=N'CONSTRAINT',@level2name=N'CK_Det_Orden_de_Trabajo_Num_Pares'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio Numeracion_pares' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Det_Orden_de_Trabajo', @level2type=N'CONSTRAINT',@level2name=N'CK_Det_Orden_de_Trabajo_Numeracion_pares'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio Tipo_Material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Materiales', @level2type=N'CONSTRAINT',@level2name=N'CK_Materiales_Tipo_Material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio vigencia_material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Materiales', @level2type=N'CONSTRAINT',@level2name=N'CK_Materiales_vigencia_material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio Tipo_mod' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Modelo', @level2type=N'CONSTRAINT',@level2name=N'CK_Modelo_Tipo_Mod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio Vigencia_mod' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Modelo', @level2type=N'CONSTRAINT',@level2name=N'CK_Modelo_Vigencia_mod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio EstadoOT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orden_de_Trabajo', @level2type=N'CONSTRAINT',@level2name=N'CK_Orden_de_Trabajo_EstadoOT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dominio RUT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orden_de_Trabajo', @level2type=N'CONSTRAINT',@level2name=N'CK_Orden_de_Trabajo_RUT'
GO
USE [master]
GO
ALTER DATABASE [pro102s05] SET  READ_WRITE
GO
