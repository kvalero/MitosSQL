-- Mito: SQL ejecuta los comandos necesariamente en el mismo orden en el que están escritos

-- SQL es un lenguaje DECLARATIVO

CREATE TABLE dbo.AlgunosNumeros
(
	ID int, 
	Puntaje varchar(20)
);

CREATE TABLE dbo.Relacionada
(
  ID int
);

INSERT dbo.AlgunosNumeros(ID, Puntaje) 
VALUES	(1,'50'),
		(2,'Marco'),
		(4,'71');

INSERT dbo.Relacionada(ID) 
VALUES	(1), 
		(4), 
		(13), 
		(350);
GO

SELECT n.ID, n.Puntaje * 5
FROM dbo.AlgunosNumeros AS n
INNER JOIN dbo.Relacionada AS r
	ON n.ID = r.ID;
GO

WITH Numeros AS
(
  SELECT ID, Puntaje
  FROM dbo.AlgunosNumeros
  WHERE ISNUMERIC(Puntaje) = 1
  --WHERE Puntaje NOT LIKE '%[^0-9]%' 
)
SELECT ID, Puntaje
FROM Numeros
WHERE Puntaje > 10;
GO

-- qué hacer?
SELECT	n.ID, 
		5 * CASE WHEN ISNUMERIC(n.Puntaje) = 1 
				 THEN n.Puntaje 
				 ELSE NULL 
			END,
		TRY_CONVERT(int, n.Puntaje) * 5 -- desde SQL Server 2012
FROM dbo.AlgunosNumeros AS n
INNER JOIN dbo.Relacionada AS r
	ON n.ID = r.ID;
GO

DROP TABLE dbo.AlgunosNumeros, dbo.Relacionada;
