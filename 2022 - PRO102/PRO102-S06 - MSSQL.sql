/*
# @author Esteban Cuevas
# @collaborators Ruth Morales, Karen Contreras
# Date: 2022-07-10
# License: MIT https://opensource.org/licenses/MIT
*/

USE [master]
GO
CREATE DATABASE [pro102s06]
GO
ALTER DATABASE [pro102s06] SET COMPATIBILITY_LEVEL = 120
GO
USE [pro102s06]
GO

CREATE TABLE [dbo].[Oficinas](
	[Sucursal] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Direccion] [varchar](255) NOT NULL,
	[Ciudad] [varchar](255) NOT NULL,
	[Region] [int] NOT NULL,
	[Jefatura] [int] NULL,
	[Meta] [bigint] NULL,
	[Monto_ventasOF] [bigint] NULL
)

CREATE TABLE [dbo].[Empleados](
	[Id_empleado] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sucursal] [int] NULL,
	[Cargo] [varchar](20) NOT NULL,
	[Fecha_ingreso] [date] NOT NULL,
	[Jefatura] [int] NULL,
	[Base_Ventas] [bigint] NULL,
	[Monto_ventas] [bigint] NOT NULL,
	CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([Jefatura]) REFERENCES [dbo].[Empleados] ([Id_empleado]),
	CONSTRAINT [FK_Empleados_Oficinas] FOREIGN KEY([Sucursal]) REFERENCES [dbo].[Oficinas] ([Sucursal])
)

CREATE TABLE [dbo].[Clientes](
	[Id_cliente] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre_Cli] [varchar](255) NOT NULL,
	[Empleado_id] [int] NOT NULL,
	[Credito_Cli] [bigint] NOT NULL,
	CONSTRAINT [FK_Clientes_Empleados] FOREIGN KEY([Empleado_id]) REFERENCES [dbo].[Empleados] ([Id_empleado])
)

CREATE TABLE [dbo].[Fabricas](
	[Id_fabrica] [varchar](4) NOT NULL PRIMARY KEY,
	[Nombre_fabrica] [varchar](255) NOT NULL
)

CREATE TABLE [dbo].[Productos](
	[Id_producto] [varchar](10) NOT NULL PRIMARY KEY,
	[Id_fabrica] [varchar](4) NOT NULL,
	[Nombre_prod] [varchar](255) NOT NULL,
	[Precio_prod] [bigint] NOT NULL,
	[Stock] [int] NOT NULL,
	CONSTRAINT [FK_Productos_Productos] FOREIGN KEY([Id_fabrica]) REFERENCES [dbo].[Fabricas] ([Id_fabrica])
)

CREATE TABLE [dbo].[Pedidos](
	[Id_pedido] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Num_pedido] [int] NOT NULL,
	[Fecha_pedido] [date] NOT NULL,
	[Id_cliente] [int] NOT NULL,
	[Id_vendedor] [int] NOT NULL,
	[Id_fabrica] [varchar](4) NOT NULL,
	[Cod_producto] [varchar](10) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[valor] [bigint] NOT NULL,
	CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([Id_cliente]) REFERENCES [dbo].[Clientes] ([Id_cliente]),
	CONSTRAINT [FK_Pedidos_Empleados] FOREIGN KEY([Id_vendedor]) REFERENCES [dbo].[Empleados] ([Id_empleado]),
	CONSTRAINT [FK_Pedidos_Fabricas] FOREIGN KEY([Id_fabrica]) REFERENCES [dbo].[Fabricas] ([Id_fabrica]),
	CONSTRAINT [FK_Pedidos_Productos] FOREIGN KEY([Cod_producto]) REFERENCES [dbo].[Productos] ([Id_producto])
)

USE [master]
GO
ALTER DATABASE [pro102s06] SET READ_WRITE
GO
