BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL UNIQUE,
	"user"	TEXT NOT NULL UNIQUE,
	"password"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"role"	TEXT DEFAULT 'user',
	"attempts"	int DEFAULT '0',
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "users" VALUES (1,'admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','El Admin','admin',0),
 (2,'user','04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb','El User','user',0),
 (3,'dummy','b5a2c96250612366ea272ffac6d9744aaf4b45aacd96aa7cfcb931ee3b558259','El Dummy','user',0);
COMMIT;
