BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "requirements" (
	"id"	INTEGER NOT NULL UNIQUE,
	"description"	TEXT NOT NULL,
	"assigned"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL,
	"priority"	TEXT NOT NULL,
	"status"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL UNIQUE,
	"user"	TEXT NOT NULL UNIQUE,
	"password"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"role"	TEXT DEFAULT 'user',
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "requirements" VALUES (1,'Lorem 01',1,'Base de Datos','Baja','Pendiente'),
 (2,'Lipsum 02',2,'Sistemas','Media','Pendiente'),
 (3,'Dolor 03',2,'Servidores','Alta','Pendiente'),
 (4,'Asimet 04',3,'Base de Datos','Baja','Pendiente');
INSERT INTO "users" VALUES (1,'admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','El Admin','admin'),
 (2,'user','04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb','El User','user'),
 (3,'dummy','b5a2c96250612366ea272ffac6d9744aaf4b45aacd96aa7cfcb931ee3b558259','El Dummy','user');
COMMIT;
