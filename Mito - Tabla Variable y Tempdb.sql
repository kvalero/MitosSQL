USE tempdb;
GO

CHECKPOINT;

-- Revisar log
SELECT N = COUNT(*)
FROM sys.fn_dblog (NULL, NULL);

SELECT [Transaction Name]
FROM sys.fn_dblog (NULL, NULL)
WHERE [Transaction Name] IS NOT NULL;

-- creamos la tabla temporal
CREATE TABLE #Temp1(c1 int);

-- vemos que existe en la base de datos
SELECT *
FROM sys.objects
WHERE is_ms_shipped = 0
AND name LIKE '%temp%';

-- volvemos a revisar el log
SELECT N = COUNT(*)
FROM sys.fn_dblog (NULL, NULL);

SELECT [Transaction Name]
FROM sys.fn_dblog (NULL, NULL)
WHERE [Transaction Name] IS NOT NULL;



--CHECKPOINT;

DECLARE @tabla TABLE(c1 int);
 
SELECT name, object_id
FROM sys.objects o
WHERE is_ms_shipped = 0

-- volvemos a revisar el log
SELECT N = COUNT(*)
FROM sys.fn_dblog (NULL, NULL);

SELECT [Transaction Name]
FROM sys.fn_dblog (NULL, NULL)
WHERE [Transaction Name] IS NOT NULL;
