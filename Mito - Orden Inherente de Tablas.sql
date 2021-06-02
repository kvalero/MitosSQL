-- Mito: Las filas de una tabla tienen un orden inherente seg�n como se insertaron

CREATE TABLE dbo.Nombres
(
  Id int PRIMARY KEY, 
  Nombre varchar(200)
);
GO

-- insertemos registros en orden no alfab�tico

INSERT dbo.Nombres(Id,Nombre) 
VALUES	(1,'marco'),
		(2,'kamal'),
		(3,'alberto');

-- el resultado de esta consulta la va a ordenar seg�n la llave primaria
-- porque es lo �ptimo en este caso
SELECT Id,Nombre
FROM dbo.Nombres;

-- ahora alguien crea otro �ndice
CREATE INDEX i1 ON dbo.Nombres(Nombre);

-- ahora el m�todo �ptimo es hacer un scan en este �ndice
SELECT Id,Nombre
FROM dbo.Nombres;


-- Algunos usan TOP 100 PERCENT...ORDER BY en subconsultas
-- pero esto no ayuda...
SELECT Id,Nombre
FROM (	SELECT TOP (100) PERCENT 
				Id,Nombre 
		FROM dbo.Nombres 
		ORDER BY Id) AS x;

-- tampoco hacer un ordenamiento impl�cito usando ROW_NUMBER
WITH CTE AS 
(
	SELECT	Id,Nombre , 
			RN = ROW_NUMBER() OVER (ORDER BY Id) 
	FROM dbo.Nombres
)
SELECT Id,Nombre  
FROM CTE;

-- quiz�s si la funci�n window se materializa, pero no es seguro
WITH CTE AS 
(
	SELECT	Id,Nombre , 
			RN = ROW_NUMBER() OVER (ORDER BY Id) 
	FROM dbo.Nombres
)
SELECT Id,Nombre,RN
FROM CTE;

-- En fin, para asegurar un orden, deben usar ORDER BY sobre el resultado completo!
SELECT Id, Nombre
FROM dbo.Nombres
ORDER BY Id;

-- (por favor no usen ORDER BY 1, 2, .....)

DROP TABLE dbo.Nombres;
GO
