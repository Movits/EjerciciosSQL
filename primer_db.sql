SHOW DATABASES;

CREATE DATABASE primer_db;

USE primer_db;

SHOW TABLES;

CREATE TABLE primer_tabla (
  id_registro INT NOT NULL AUTO_INCREMENT,
  campo_1 VARCHAR(30) NOT NULL,
  campo_2 FLOAT,
  PRIMARY KEY (id_registro)
);

CREATE TABLE productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL,
  peso FLOAT,
  precio FLOAT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_producto)
);

DESCRIBE primer_tabla;

/* ver todo el contenido de la tabla */
SELECT * FROM primer_tabla;

/* ver un campo especifico de una tabla especifica */
SELECT campo_1 FROM primer_tabla;
SELECT * FROM primer_tabla WHERE id_registro = 2;


INSERT INTO primer_tabla (campo_1, campo_2) VALUES ("Hola, soy un varchar", 1123.02);
INSERT INTO primer_tabla (campo_1, campo_2) VALUES ("Hola, soy otro varchar", 0.03);
INSERT INTO primer_tabla (campo_1, campo_2) VALUES ("Hola, soy el ultimo varchar", 1.01);
INSERT INTO primer_tabla (campo_1, campo_2) VALUES ("Hola, soy un extra varchar", null);

INSERT INTO id_producto (nombre, peso, precio, cantidad) VALUES ("Coca cola", 2.5, 1500, 50);
INSERT INTO id_producto (nombre, peso, precio, cantidad) VALUES ("Pringles", 0.5, 700, 150);


UPDATE primer_tabla SET campo_1 = "Hola, me modificaron", campo_2 = 0.0 WHERE id_registro = 1;

DELETE FROM primer_tabla WHERE id_registro = 2;

DROP DATABASE primer_db;

/* 

CRUD

Create - INSERT INTO
Read - SELECT
Update - UPDATE
Delete - DELETE

 */