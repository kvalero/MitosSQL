-- Mito: el tipo de datos se escribe con mayúscula o minúscula dependiendo de la preferencia del usuario

-- Podemos ver sys.types
SELECT *
FROM sys.types;


CREATE DATABASE EjemploRaro COLLATE Latin1_General_BIN2; 
GO
USE EjemploRaro;
GO

SELECT geography::STGeomFromText('LINESTRING(-5 14, -8 11)', 4326);
GO
SELECT GEOGRAPHY::STGeomFromText('LINESTRING(-5 14, -8 1)', 4326);
GO

USE Tests;
GO
ALTER DATABASE EjemploRaro SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE EjemploRaro;

-- En general, nunca tendrán problemas con esto, pero es una buena práctica
-- escribir los tipos de datos en minúsculas (sí, a mí también me sorprende)

