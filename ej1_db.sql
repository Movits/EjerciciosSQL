/* 
    - Crear una base de datos llamada cine dondo tiene que guardar la info de las peliculas
        - nombre, ano de estreno, recaudacion en millones, director y plataformas de streaming
    - Agregar 3 peliculas

    - Notamos que no todas las peliculas tienen una plataforma de streaming por lo que ahora necesitamos agregar si tienen o no una
        - Actualizar los rigistros anteriores con un solo comando sql para el nuevo campo en la tabla
    - Agregar 2 peliculas donde al menos 1 no tenga una plataforma de streaming

    - Al agregar una nueva pelicula si esta no tiene plataforma de streaming:
        - el campo correspondiente debe figurar por defecto "no tiene" si no se agrega alguna
        - el campo del estado debe figurar true por defecto si tiene alguna plataforma o false caso contrario, esto es automatico y no tiene que agregarse manuealmente
    - Agregar 2 peliculas donde al menos 1 no tenga una plataforma de streaming

    - Agregar un nuevo campo donde figura el estado booleano si valio la pena no dondo por defecto lo agrega si la recaudacion supera los 80.50 millones
    - Agregar 2 peliculas donde uno no tiene plataforma de streaming y otra que no supera los 80.50 millones
 */

CREATE DATABASE cine;
USE cine;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ano_de_estreno INT,
    recaudacion_en_millones DECIMAL(10, 2),
    director VARCHAR(255),
    plataformas_de_streaming VARCHAR(255)
);

INSERT INTO peliculas (nombre, ano_de_estreno, recaudacion_en_millones, director, plataformas_de_streaming)
VALUES
    ('Titanic', 1997, 2187.46, 'James Cameron', 'Netflix'),
    ('The Dark Knight', 2008, 1005.84, 'Christopher Nolan', 'HBO'),
    ('Avengers: Endgame', 2019, 2797.80, 'Anthony Russo', 'Disney+');

SHOW TABLES;
DESCRIBE peliculas;
SELECT * FROM peliculas;

/* Agregar una nueva columna a la tabla de películas*/
ALTER TABLE peliculas ADD tiene_plataforma_de_streaming BOOLEAN;
/* Actualizar los registros existentes*/
UPDATE peliculas SET tiene_plataforma_de_streaming = 1 WHERE plataformas_de_streaming IS NOT NULL;

INSERT INTO peliculas (nombre, ano_de_estreno, recaudacion_en_millones, director, plataformas_de_streaming, tiene_plataforma_de_streaming)
VALUES
    ('Interstellar', 2014, 677.47, 'Christopher Nolan', NULL, 0),
    ('Spider-Man: No Way Home', 2021, 1852.56, 'Jon Watts', 'Disney+', 1);

ALTER TABLE peliculas
MODIFY plataformas_de_streaming VARCHAR(255) DEFAULT 'no tiene';

/* Crear un trigger para actualizar automáticamente la columna tiene_plataforma_de_streaming*/
DELIMITER //
CREATE TRIGGER actualizar_estado_streaming
BEFORE INSERT ON peliculas
FOR EACH ROW
BEGIN
   IF NEW.plataformas_de_streaming = 'no tiene' THEN
       SET NEW.tiene_plataforma_de_streaming = 0;
   ELSE
       SET NEW.tiene_plataforma_de_streaming = 1;
   END IF;
END;
//
DELIMITER ;

INSERT INTO peliculas (nombre, ano_de_estreno, recaudacion_en_millones, director, plataformas_de_streaming)
VALUES
    ('Inception', 2010, 829.89, 'Christopher Nolan', 'no tiene'),
    ('The Matrix', 1999, 465.3, 'Lana Wachowski, Lilly Wachowski', 'HBO');

UPDATE peliculas
SET plataformas_de_streaming = 'no tiene', tiene_plataforma_de_streaming = 0
WHERE id = 4;

ALTER TABLE peliculas ADD valio_la_pena BOOLEAN;

DELIMITER //
CREATE TRIGGER establecer_valio_la_pena
BEFORE INSERT ON peliculas
FOR EACH ROW
BEGIN
   IF NEW.recaudacion_en_millones > 80.50 THEN
       SET NEW.valio_la_pena = 1;
   ELSE
       SET NEW.valio_la_pena = 0;
   END IF;
END;
//
DELIMITER ;

INSERT INTO peliculas (nombre, ano_de_estreno, recaudacion_en_millones, director, plataformas_de_streaming)
VALUES
    ('Moonlight', 2016, 65, 'Barry Jenkins', 'no tiene'),
    ('Paranormal Activity', 2007, 193, 'Oren Peli', 'Netflix');

/* Actualizar los valores NULL */
UPDATE peliculas
SET valio_la_pena = CASE
    WHEN recaudacion_en_millones > 80.50 THEN 1
    ELSE 0
END;

/* Actualizar para tener solo un/a director */
UPDATE peliculas
SET director = 'Lana Wachowski'
WHERE id = 7;