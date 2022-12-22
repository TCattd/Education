/**
Authors:
	Ruth Morales
	Karen Contreras
	Patricio Muñoz
	Esteban Cuevas
**/

/* Creación de base de datos */
DROP DATABASE IF EXISTS Farma_AIEP;
CREATE DATABASE Farma_AIEP;
USE Farma_AIEP;

/* Borrar todas las tablas que usaremos, si es que existen previamente. En este caso, al borrar antes la DB completa, no existirá ninguna tabla previa */
DROP TABLE IF EXISTS Farmacia, Personal, Cargo, Ciudad, Stock, Presentacion, Medicamento, Monodroga, Laboratorio, Accion_Terapeutica;

/* Creación de Tablas */
CREATE TABLE Farmacia (
	id_farmacia int NOT NULL auto_increment,
	nombre_farmacia varchar(255) NOT NULL,
	direccion_farmacia varchar(255) NOT NULL,
	ciudad int NOT NULL,
	id_quimico int NOT NULL,
	PRIMARY KEY (id_farmacia)
);

CREATE TABLE Personal (
	id_personal int NOT NULL auto_increment,
	nombre_personal varchar(255) NOT NULL,
	apellido_personal varchar(255) NOT NULL,
	cargo int NOT NULL,
	id_farmacia int NOT NULL,
	username varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	PRIMARY KEY (id_personal)
);

CREATE TABLE Cargo (
	id_cargo int NOT NULL auto_increment,
	nombre_cargo varchar(255) NOT NULL,
	id_ciudad int NOT NULL,
	PRIMARY KEY (id_cargo)
);

CREATE TABLE Ciudad (
	id_ciudad int NOT NULL auto_increment,
	nombre_ciudad varchar(255) NOT NULL,
	PRIMARY KEY (id_ciudad)
);

CREATE TABLE Stock (
	id_stock int NOT NULL auto_increment,
	id_medicamento int NOT NULL,
	id_farmacia int NOT NULL,
	unidades int NOT NULL,
	precio int NOT NULL,
	vencimiento date NOT NULL,
	PRIMARY KEY (id_stock)
);

CREATE TABLE Presentacion (
	id_presentacion int NOT NULL auto_increment,
	nombre_presentacion varchar(255) NOT NULL,
	PRIMARY KEY (id_presentacion)
);

CREATE TABLE Medicamento (
	id_medicamento int NOT NULL auto_increment,
	nombre_medicamento varchar(255) NOT NULL,
	id_presentacion int NOT NULL,
	id_monodroga int NOT NULL,
	id_laboratorio int NOT NULL,
	id_accion_terapeutica int NOT NULL,
	PRIMARY KEY (id_medicamento)
);

CREATE TABLE Monodroga (
	id_monodroga int NOT NULL auto_increment,
	nombre_monodroga varchar(255) NOT NULL,
	PRIMARY KEY (id_monodroga)
);

CREATE TABLE Laboratorio (
	id_laboratorio int NOT NULL auto_increment,
	nombre_laboratorio varchar(255) NOT NULL,
	PRIMARY KEY (id_laboratorio)
);

CREATE TABLE Accion_Terapeutica (
	id_accion int NOT NULL auto_increment,
	nombre_accion varchar(255) NOT NULL,
	PRIMARY KEY (id_accion)
);

ALTER TABLE Farmacia ADD FOREIGN KEY (ciudad) REFERENCES Ciudad(id_ciudad);

/* No debe ir, puesto que no permitirá agregar una farmacia, si no existe un empleado primero, y viceversa */
/*ALTER TABLE Farmacia ADD FOREIGN KEY (id_quimico) REFERENCES Personal(id_personal);*/

ALTER TABLE Personal ADD FOREIGN KEY (cargo) REFERENCES Cargo(id_cargo);

ALTER TABLE Personal ADD FOREIGN KEY (id_farmacia) REFERENCES Farmacia(id_farmacia);

ALTER TABLE Cargo ADD FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad);

ALTER TABLE Stock ADD FOREIGN KEY (id_farmacia) REFERENCES Farmacia(id_farmacia);

ALTER TABLE Stock ADD FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento);

ALTER TABLE Medicamento ADD FOREIGN KEY (id_monodroga) REFERENCES Monodroga(id_monodroga);

ALTER TABLE Medicamento ADD FOREIGN KEY (id_presentacion) REFERENCES Presentacion(id_presentacion);

ALTER TABLE Medicamento ADD FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio);

ALTER TABLE Medicamento ADD FOREIGN KEY (id_accion_terapeutica) REFERENCES Accion_Terapeutica(id_accion);

/* Agregar Índices */
ALTER TABLE Medicamento ADD INDEX idx_nombre_medicamento (nombre_medicamento);
ALTER TABLE Monodroga ADD INDEX idx_nombre_monodroga (nombre_monodroga);
ALTER TABLE Laboratorio ADD INDEX idx_nombre_laboratorio (nombre_laboratorio);
ALTER TABLE Accion_Terapeutica ADD INDEX idx_nombre_accion (nombre_accion);

/* Constraints, restricciones */
ALTER TABLE Cargo ADD CONSTRAINT check_cargo_nombre CHECK (nombre_cargo IN ('Administrador', 'Farmaceutico', 'Vendedor'));

/* Inserción de datos */
insert into Ciudad (nombre_ciudad) values ('Santiago');
insert into Ciudad (nombre_ciudad) values ('Concepcion');
insert into Ciudad (nombre_ciudad) values ('Valparaiso');
insert into Ciudad (nombre_ciudad) values ('Arica');
insert into Ciudad (nombre_ciudad) values ('Coquimbo');

insert into Cargo (nombre_cargo, Id_ciudad) values ('Farmaceutico', '1');
insert into Cargo (nombre_cargo, Id_ciudad) values ('Vendedor', '1');
insert into Cargo (nombre_cargo, Id_ciudad) values ('Farmaceutico', '2');
insert into Cargo (nombre_cargo, Id_ciudad) values ('Vendedor', '2');
insert into Cargo (nombre_cargo, Id_ciudad) values ('Farmaceutico', '3');
insert into Cargo (nombre_cargo, Id_ciudad) values ('Vendedor', '3');

insert into Laboratorio (nombre_laboratorio) values ('Bagos');
insert into Laboratorio (nombre_laboratorio) values ('Laboratorio Chile');
insert into Laboratorio (nombre_laboratorio) values ('Andromaco');
insert into Laboratorio (nombre_laboratorio) values ('Abbot');
insert into Laboratorio (nombre_laboratorio) values ('Bayer');

insert into Accion_Terapeutica (nombre_accion) values ('Antibioticos');
insert into Accion_Terapeutica (nombre_accion) values ('Antihistamínico');
insert into Accion_Terapeutica (nombre_accion) values ('Analgésico');
insert into Accion_Terapeutica (nombre_accion) values ('Antihipertensivo');
insert into Accion_Terapeutica (nombre_accion) values ('Anticonceptivos');

insert into Presentacion (nombre_presentacion) values ('Comprimidos');
insert into Presentacion (nombre_presentacion) values ('Jarabe');
insert into Presentacion (nombre_presentacion) values ('Supositorios');
insert into Presentacion (nombre_presentacion) values ('Ampollas');
insert into Presentacion (nombre_presentacion) values ('Unguento');

insert into Monodroga (nombre_monodroga) values ('Losartán');
insert into Monodroga (nombre_monodroga) values ('Paracetamol');
insert into Monodroga (nombre_monodroga) values ('Ibuprofeno');
insert into Monodroga (nombre_monodroga) values ('Ketorolaco');
insert into Monodroga (nombre_monodroga) values ('Clorfenamina');

insert into Farmacia (nombre_farmacia, direccion_farmacia, ciudad, id_quimico) values ('La Blanca', 'Elm Street 123', 1, 1);
insert into Farmacia (nombre_farmacia, direccion_farmacia, ciudad, id_quimico) values ('La Negra', 'Elm Street 123', 1, 1);
insert into Farmacia (nombre_farmacia, direccion_farmacia, ciudad, id_quimico) values ('La Azul', 'Elm Street 123', 1, 1);
insert into Farmacia (nombre_farmacia, direccion_farmacia, ciudad, id_quimico) values ('La Roja', 'Elm Street 123', 1, 1);
insert into Farmacia (nombre_farmacia, direccion_farmacia, ciudad, id_quimico) values ('La Violeta', 'Elm Street 123', 1, 1);

insert into Personal (nombre_personal, apellido_personal, cargo, id_farmacia, username, password) values ('John', 'Smith', 1, 1, 'john.smith', 'ITXnwnOaLyxzUsM2E469');
insert into Personal (nombre_personal, apellido_personal, cargo, id_farmacia, username, password) values ('Peter', 'Smith', 1, 1, 'peter.smith', 'ITXnwnOaLyxzUsM2E469');
insert into Personal (nombre_personal, apellido_personal, cargo, id_farmacia, username, password) values ('Alfred', 'Smith', 1, 1, 'alfred.smith', 'ITXnwnOaLyxzUsM2E469');
insert into Personal (nombre_personal, apellido_personal, cargo, id_farmacia, username, password) values ('Walter', 'Smith', 1, 1, 'walter.smith', 'ITXnwnOaLyxzUsM2E469');
insert into Personal (nombre_personal, apellido_personal, cargo, id_farmacia, username, password) values ('Jesse', 'Smith', 1, 1, 'jesse.smith', 'ITXnwnOaLyxzUsM2E469');

insert into Medicamento (nombre_medicamento, id_presentacion, id_monodroga, id_laboratorio, id_accion_terapeutica) values ('Losartán', 1, 1, 2, 4);
insert into Medicamento (nombre_medicamento, id_presentacion, id_monodroga, id_laboratorio, id_accion_terapeutica) values ('Paracetamol', 2, 2, 1, 3);
insert into Medicamento (nombre_medicamento, id_presentacion, id_monodroga, id_laboratorio, id_accion_terapeutica) values ('Ibuprofeno', 5, 3, 3, 3);
insert into Medicamento (nombre_medicamento, id_presentacion, id_monodroga, id_laboratorio, id_accion_terapeutica) values ('Ketorolaco', 1, 4, 5, 3);
insert into Medicamento (nombre_medicamento, id_presentacion, id_monodroga, id_laboratorio, id_accion_terapeutica) values ('Clorfenamina', 1, 1, 4, 2);

insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (1, 1, 100, 1200, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (2, 1, 100, 2000, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (3, 1, 100, 2200, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (4, 1, 3, 1800, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (5, 1, 100, 1100, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (4, 2, 200, 1800, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (2, 2, 250, 2000, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (1, 3, 125, 1200, '2022-12-25');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (5, 4, 136, 1100, '2022-10-10');
insert into Stock (id_medicamento, id_farmacia, unidades, precio, vencimiento) values (4, 4, 97, 1800, '2022-10-10');

/*************/
/* Semana 06 */
/*************/

/* Parte C, A. Listar todos los medicamentos, agrupados por laboratorio, ordenado alfabéticamente (por nombre de medicamento) ascendentemente */
select m.nombre_medicamento, l.nombre_laboratorio
from Medicamento m
join Laboratorio l on m.id_laboratorio = l.id_laboratorio
order by m.nombre_medicamento asc;

/* Parte C, B. Listar todos los farmacéuticos y las farmacias que atienden, ordenados alfabéticamente descendentemente. Se entregan dos opciones de consulta. */
select p.nombre_personal, p.apellido_personal, f.nombre_farmacia
from Personal p
join Farmacia f on p.id_farmacia = f.id_farmacia
where p.cargo = 1
order by p.nombre_personal desc;

select id_personal, nombre_personal, apellido_personal, id_farmacia from personal
order by nombre_personal desc;

/* Parte C, C. Listar cual es el medicamento con mayor stock, por farmacia */
select f.nombre_farmacia, m.nombre_medicamento, max(s.unidades)
from Stock s
join Farmacia f on s.id_farmacia = f.id_farmacia
join Medicamento m on s.id_medicamento = m.id_medicamento
group by f.nombre_farmacia;

/* Parte C, D. Listar cual es el medicamento con menor stock, por farmacia */
select f.nombre_farmacia, m.nombre_medicamento, min(s.unidades)
from Stock s
join Farmacia f on s.id_farmacia = f.id_farmacia
join Medicamento m on s.id_medicamento = m.id_medicamento
group by f.nombre_farmacia;

/* Parte C, E. Listar todos los medicamentos que comiencen con la letra A */
select * from Medicamento where nombre_medicamento like 'A%';

/* Parte C, F. Listar todos los medicamentos existentes for farmacia, agrupados por presentación. */
select f.nombre_farmacia, m.nombre_medicamento, p.nombre_presentacion, s.unidades
from Stock s
join Farmacia f on s.id_farmacia = f.id_farmacia
join Medicamento m on s.id_medicamento = m.id_medicamento
join Presentacion p on m.id_presentacion = p.id_presentacion
order by m.id_presentacion asc;

/*************/
/* Semana 07 */
/*************/

/* Parte A, A: Listar todos los medicamentos con su id, nombre, stock, precio y precio con IVA incluido. */
select m.id_medicamento, m.nombre_medicamento, s.unidades, s.precio, s.precio*1.19 as precio_con_iva from Medicamento m, Stock s where m.id_medicamento = s.id_medicamento;

/* Parte A, B. Listar todos los medicamentos. Presentación Jarabe, con 15% de descuento. Presentación Unguento, 5% descuento. Todo el resto, 2,5% de descuento. */
select m.id_medicamento, m.nombre_medicamento, p.nombre_presentacion, s.precio, case when p.nombre_presentacion = 'Jarabe' then FLOOR(s.precio*0.85) when p.nombre_presentacion = 'Unguento' then FLOOR(s.precio*0.95) else FLOOR(s.precio*0.975) end as precio_descuento from Medicamento m, Stock s, Presentacion p where m.id_medicamento = s.id_medicamento and m.id_presentacion = p.id_presentacion;

/* Parte A, C. Listar la ciudad con la Farmacia con más empleados en ella, indicando el nombre de la Farmacia. */
select c.nombre_ciudad, f.nombre_farmacia, count(p.id_personal) as cantidad_personal from Ciudad c, Farmacia f, Personal p where c.id_ciudad = f.ciudad and f.id_farmacia = p.id_farmacia group by f.id_farmacia order by cantidad_personal desc limit 1;

/* Parte B, A. Listar medicamentos que posean menos de 5 de stock, e incluir la fecha actual. */
select m.nombre_medicamento, s.unidades, s.precio, s.precio*1.19 as precio_con_iva, now() as fecha from Medicamento m, Stock s where m.id_medicamento = s.id_medicamento and s.unidades < 5;

/* Parte B, B. Listar todos los Medicamentos con vencimiento a menos de 10 días desde la fecha actual. */
select m.nombre_medicamento, s.unidades, s.precio, s.precio*1.19 as precio_con_iva, s.vencimiento, now() as fecha from Medicamento m, Stock s where m.id_medicamento = s.id_medicamento and s.vencimiento < now() + interval 10 day;

/* Parte C, A. Listar la cantidad de medicamentos disponibles por cada farmacia en las distintas ciudades. */
select m.nombre_medicamento, s.unidades, f.nombre_farmacia, c.nombre_ciudad from Medicamento m, Stock s, Farmacia f, Ciudad c where m.id_medicamento = s.id_medicamento and s.id_farmacia = f.id_farmacia and f.ciudad = c.id_ciudad;

/* Parte C, B. Listar cada medicamento con su laboratorio y la monodroga del medicamento. */
select m.nombre_medicamento, l.nombre_laboratorio, mo.nombre_monodroga from Medicamento m, Laboratorio l, Monodroga mo where m.id_laboratorio = l.id_laboratorio and m.id_monodroga = mo.id_monodroga;

/* Parte C, C. Listar los medicamentos con su acción terapéutica, disponibles por cada farmacia. */
select m.nombre_medicamento, s.unidades, f.nombre_farmacia, at.nombre_accion as accion_terapeutica from Medicamento m, Stock s, Farmacia f, Accion_Terapeutica at where m.id_medicamento = s.id_medicamento and s.id_farmacia = f.id_farmacia and m.id_accion_terapeutica = at.id_accion;

/*************/
/* Semana 08 */
/*************/

/* Parte A, A: Vista listando todos los medicamentos con su código, nombre, precio (más IVA) y farmacia donde existe stock. */
create view medicamento_con_precio as
select m.id_medicamento, m.nombre_medicamento, s.precio*1.19 as precio, f.id_farmacia, f.nombre_farmacia
from medicamento m, stock s, farmacia f
where m.id_medicamento = s.id_medicamento and s.id_farmacia = f.id_farmacia;

/* Parte A, B. Vista listando farmacias y el personal que la compone, separado por ciudad. */
create view farmacia_personal_ciudad as
select f.id_farmacia, f.nombre_farmacia, f.ciudad, p.id_personal, p.nombre_personal, p.apellido_personal, p.cargo, p.username
from farmacia f, personal p
where f.id_farmacia = p.id_farmacia
group by f.ciudad;

/* Parte A, C. Vista listando un resumen de farmacias, agrupadas por ciudad, con sus funcionarios y el porcentaje que ellos corresponden dentro del total de funcionarios entre todas las farmacias. */
create view farmacia_personal_ciudad_porcentaje as
select f.id_farmacia, f.nombre_farmacia, f.ciudad, p.id_personal, p.nombre_personal, p.apellido_personal, p.cargo, p.username, count(p.id_personal) as total_personal, count(p.id_personal)*100/(select count(*) from personal) as porcentaje
from farmacia f, personal p
where f.id_farmacia = p.id_farmacia
group by f.ciudad;

/* Parte B, A. Vista que aumente el precio de todos los medicamentos por %5. */
create view medicamento_precio_105_porciento as
select m.id_medicamento, m.nombre_medicamento, s.precio*1.05 as precio, f.id_farmacia, f.nombre_farmacia
from medicamento m, stock s, farmacia f
where m.id_medicamento = s.id_medicamento and s.id_farmacia = f.id_farmacia;

/* Parte B, B. Vista que aumenta el stock en 5 unidades, para los medicamentos que tengan presentación en Jarabe, entrando el nuevo stock como campo nuevo_stock. */
create view medicamento_stock_5_unidades_mas as
select m.id_medicamento, m.nombre_medicamento, s.unidades+5 as nuevo_stock
from medicamento m, stock s, presentacion p
where m.id_medicamento = s.id_medicamento and p.nombre_presentacion = 'Jarabe';

/* Parte C, A. Vista que muestre id, nombre y apellido de Personal. */
create view personal_s08 as
select id_personal, nombre_personal, apellido_personal from Personal;

/* Alterar la vista personal_s08 para agregar campo: especialidad. */
alter view personal_s08 as
select id_personal, nombre_personal, apellido_personal, c.nombre_cargo as especialidad
from Personal p, Cargo c
where p.cargo = c.id_cargo;

/* Parte C, B. Vista para mostrar los Laboratorios con sus Medicamentos, agrupados por presentación. */
create view laboratorios_with_medicamentos as
select l.nombre_laboratorio, m.nombre_medicamento, p.nombre_presentacion
from Laboratorio l, Medicamento m, Presentacion p
where l.id_laboratorio = m.id_laboratorio and m.id_presentacion = p.id_presentacion
group by p.nombre_presentacion;

/* Alterar vista laboratorios_with_medicamentos para agregar stock como campo: cantidad_producto. */
alter view laboratorios_with_medicamentos as
select l.nombre_laboratorio, m.nombre_medicamento, p.nombre_presentacion, s.unidades as cantidad_producto
from Laboratorio l, Medicamento m, Presentacion p, Stock s
where l.id_laboratorio = m.id_laboratorio and m.id_presentacion = p.id_presentacion and m.id_medicamento = s.id_medicamento
group by p.nombre_presentacion;

/* Parte D. Cifrar base de datos MySQL */
/* En teoría, para poder cifrar y realizar en MySQL, lo que hacen sobre SQL Server (y que enseñan en el PDF de la semana), se requiere la versión Enterprise de MySQL. Aquella versión incluye el cifrado transparente de la base de datos: https://www.mysql.com/products/enterprise/tde.html
Pero esa versión, no es gratuita.
Por este motivo, no se pudo realizar el cifrado de la base de datos. */

/* Crear un respaldo de la Base de Datos Farma_AIEP, usando mysqldump */
/*mysqldump -u root -p Farma_AIEP > Farma_AIEP.sql*/

