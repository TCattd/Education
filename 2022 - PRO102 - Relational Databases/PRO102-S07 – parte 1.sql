/*
# @author Esteban Cuevas
# @collaborators Ruth Morales, Karen Contreras
# Date: 2022-07-16
# License: MIT https://opensource.org/licenses/MIT
*/

/* Creación de la base de datos */
CREATE DATABASE [pro102s07_netflix]
GO
ALTER DATABASE [pro102s07_netflix] SET COMPATIBILITY_LEVEL = 120
GO
USE [pro102s07_netflix]
GO

/* Creación de las Tablas */
CREATE TABLE pelicula(
				codigo numeric PRIMARY KEY,
				titulo varchar(35),
				nacionalidad varchar(50),
				productora varchar(50),
				fechaEstreno date,
				codDirector numeric,
				codCategoria numeric
				)

CREATE TABLE director(
				codigo numeric,
				nombre varchar(35) PRIMARY KEY,
				apellidos varchar(50)
				)

CREATE TABLE categoria(
				codigo numeric PRIMARY KEY,
				nombre varchar(35)
				)

CREATE TABLE cliente(
				codigo numeric,
				nombre varchar(20),
				dirección varchar(50),
				teléfono varchar(7)
				)

CREATE TABLE pago(
				codCliente numeric,
				fechaPago date,
				monto numeric
				)

CREATE TABLE reproduce(
				fechaCom date,
				fechaTer date,
				codCliente numeric,
				codPelicula numeric
				)

GO

/* Cliente: cambio de PK */
ALTER TABLE cliente ALTER COLUMN codigo numeric NOT NULL
GO

ALTER TABLE cliente ADD CONSTRAINT PK_cliente_codigo PRIMARY KEY (codigo)
GO

/* Director: cambio de PK */
/* No sabemos el nombre del Constraint para esta PK. La rutina de creación de la Tabla
No incluye un nombre.
Para sortear el problema, usaremos variables de SQL Server.
Mediante una consulta, obtendremos el nombre (al azar) con el que se fija un Constraint
sin nombre, y lo guardarmeos en una variable.
Luego, utilizaremos aquella variable dentro de la función Execute, para correr
un Alter Table que borre ese Constraint correspondiente a la PK inicial
de la tabla. */
DECLARE @PK_director_nn VARCHAR(100)
DECLARE @ExecuteString NVARCHAR(MAX)

SET @PK_director_nn = (SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'director'
		AND TABLE_SCHEMA = 'dbo'
		AND CONSTRAINT_TYPE = 'PRIMARY KEY')

PRINT @PK_director_nn

SET @ExecuteString = 'ALTER TABLE director DROP CONSTRAINT ' + @PK_director_nn
EXECUTE (@ExecuteString)
GO

/* Ahora si, fijamos el nuevo PK para la tabla Director */
ALTER TABLE director ALTER COLUMN codigo numeric NOT NULL
GO

ALTER TABLE director ADD CONSTRAINT PK_director_codigo PRIMARY KEY (codigo)
GO

/* Pago: cambio de PK */
ALTER TABLE pago ALTER COLUMN codCliente numeric NOT NULL
GO

ALTER TABLE pago ADD CONSTRAINT PK_pago_codcliente PRIMARY KEY (codCliente)
GO

/* Reproduce: cambio de PK */
ALTER TABLE reproduce ALTER COLUMN codCliente numeric NOT NULL
GO

ALTER TABLE reproduce ALTER COLUMN codPelicula numeric NOT NULL
GO

ALTER TABLE reproduce ADD CONSTRAINT PK_reproduce_dual PRIMARY KEY (codCliente, codPelicula)
GO

/* Fijar nuestras FK en todas las tablas */
ALTER TABLE pelicula ADD CONSTRAINT FK_pelicula_director FOREIGN KEY(codDirector) REFERENCES director (codigo)
GO

ALTER TABLE pelicula ADD CONSTRAINT FK_pelicula_categoria FOREIGN KEY(codCategoria) REFERENCES categoria (codigo)
GO

ALTER TABLE reproduce ADD CONSTRAINT FK_reproduce_cliente FOREIGN KEY(codCliente) REFERENCES cliente (codigo)
GO

ALTER TABLE reproduce ADD CONSTRAINT FK_reproduce_pelicula FOREIGN KEY(codPelicula) REFERENCES pelicula (codigo)
GO

ALTER TABLE pago ADD CONSTRAINT FK_pago_cliente FOREIGN KEY(codCliente) REFERENCES cliente (codigo)
GO

/* Inserción de datos en tabla: director */
INSERT INTO director VALUES (1, 'Christopher', 'Nolan')
INSERT INTO director VALUES (2, 'Steven', 'Spielberg')
INSERT INTO director VALUES (3, 'Alfred', 'Hitchcock')
INSERT INTO director VALUES (4, 'Stanley', 'Kubrick')
INSERT INTO director VALUES (5, 'Martin', 'Scorsese')
GO

/* Inserción de datos en tabla: categoria */
INSERT INTO categoria VALUES (1, 'Accion')
INSERT INTO categoria VALUES (2, 'Familiar')
INSERT INTO categoria VALUES (3, 'Horror')
INSERT INTO categoria VALUES (4, 'Ciencia Ficción')
INSERT INTO categoria VALUES (5, 'Drama')
GO

/* Inserción de datos en tabla: pelicula */
INSERT INTO pelicula VALUES (1, 'Inception', 'USA', 'Warner Bros', '2010-07-16', 1, 1)
INSERT INTO pelicula VALUES (2, 'ET', 'USA', 'Universal', '1982-06-11', 2, 2)
INSERT INTO pelicula VALUES (3, 'Psycho', 'USA', 'Shamley', '1960-09-08', 3, 3)
INSERT INTO pelicula VALUES (4, '2001 A Space Odyssey', 'USA', 'MGM', '1970-06-24', 4, 4)
INSERT INTO pelicula VALUES (5, 'Taxi Driver', 'USA', 'Columbia Pictures', '1976-02-09', 5, 5)
GO

/* Inserción de datos en tabla: cliente */
INSERT INTO cliente VALUES (1, 'Freddy Krueger', 'Elm Street 123', '123666')
INSERT INTO cliente VALUES (2, 'Dory Blue', 'P Sherman calle Wallaby 42', '555123')
INSERT INTO cliente VALUES (3, 'Bob Parr', 'Incredibles Street 101', '777123')
INSERT INTO cliente VALUES (4, 'Max Rockatansky', 'Desert Stret 4', '999123')
INSERT INTO cliente VALUES (5, 'Ellen Ripley', 'Space Street 1979', '111321')
GO

/* Inserción de datos en tabla: pago */
INSERT INTO pago VALUES (1, '2022-07-08', 5000)
INSERT INTO pago VALUES (2, '2022-07-09', 7000)
INSERT INTO pago VALUES (3, '2022-07-10', 3000)
INSERT INTO pago VALUES (4, '2022-07-11', 5000)
INSERT INTO pago VALUES (5, '2022-07-12', 10000)
GO

/* Inserción de datos en tabla: reproduce */
INSERT INTO reproduce VALUES ('2022-07-08', '2022-08-08', 1, 1)
INSERT INTO reproduce VALUES ('2022-07-09', '2022-08-09', 2, 2)
INSERT INTO reproduce VALUES ('2022-07-10', '2022-08-10', 3, 3)
INSERT INTO reproduce VALUES ('2022-07-11', '2022-08-11', 4, 4)
INSERT INTO reproduce VALUES ('2022-07-12', '2022-08-12', 4, 5)
GO
