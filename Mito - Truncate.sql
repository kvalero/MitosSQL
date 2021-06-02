-- Mito: TRUNCATE no escribe en el log ni se puede hacer ROLLBACK

DROP DATABASE IF EXISTS Tests;

CREATE DATABASE Tests;
GO

USE Tests;
GO

-- Se puede hacer ROLLBACK de un TRUNCATE?
CREATE TABLE dbo.Truncated(c1 INT, c2 INT);

INSERT INTO dbo.Truncated
SELECT number, ROW_NUMBER() OVER(ORDER BY status)
FROM master.dbo.spt_values;

BEGIN TRANSACTION;
	SELECT Filas_Iniciales = COUNT(*) 
	FROM dbo.Truncated;

	TRUNCATE TABLE dbo.Truncated;
	
	SELECT Filas_Actuales = COUNT(*) 
	FROM dbo.Truncated;
ROLLBACK TRANSACTION;

SELECT Filas_Despues_de_ROLLBACK = COUNT(*) 
FROM dbo.Truncated;


-- TRUNCATE escribe en el log?
CHECKPOINT; -- para tener un punto de comienzo en el log
 
SELECT Filas_Iniciales_Log = COUNT(*)
FROM sys.fn_dblog (NULL, NULL);

TRUNCATE TABLE dbo.Truncated;

SELECT Filas_Log_Despues_Truncate = COUNT(*) 
FROM sys.fn_dblog (NULL, NULL);


-- Qué pasa con DELETE?
INSERT INTO dbo.Truncated
SELECT number, ROW_NUMBER() OVER(ORDER BY status)
FROM master.dbo.spt_values;

CHECKPOINT; 
 
SELECT Filas_Iniciales_Log = COUNT(*)
FROM sys.fn_dblog (NULL, NULL);

DELETE dbo.Truncated;

SELECT Filas_Log_Despues_Truncate = COUNT(*) 
FROM sys.fn_dblog (NULL, NULL);






