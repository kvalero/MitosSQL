-- Mito: el tipo de datos se escribe con may�scula o min�scula dependiendo de la preferencia del usuario

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

-- En general, nunca tendr�n problemas con esto, pero es una buena pr�ctica
-- escribir los tipos de datos en min�sculas (s�, a m� tambi�n me sorprende)

