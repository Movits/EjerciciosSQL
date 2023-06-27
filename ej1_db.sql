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