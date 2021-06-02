-- Mito: El largo por defecto en un string se ajusta a la consulta
DECLARE @a varchar = 'hola';

SELECT a, b, LEN(b) Largo_b
FROM (	SELECT a = @a, 
			   b = CONVERT(nvarchar, 'este es un string de ejemplo, no tengo imaginación para escribir muchas cosas')
	 ) x;


-- ejemplo 2

CREATE TABLE dbo.ejemplo2
(
  c1 varchar(max),
  c2 varchar(max),
  c3 varchar
);
GO

CREATE OR ALTER PROCEDURE dbo.ejemplo2_agregar_fila
  @v1 varchar,
  @v2 varchar(10),
  @v3 varchar
AS
BEGIN
  INSERT dbo.ejemplo2(c1,c2,c3) VALUES(@v1,@v2,@v3);
END
GO

EXEC dbo.ejemplo2_agregar_fila	@v1 = 'érase una vez un dato', 
								@v2 = 'en una galaxia muy muy lejana',
								@v3 = 'y colorín colorado.....';

SELECT c1, c2, c3 
FROM dbo.ejemplo2;

-- se perdieron datos....y no arrojó error

GO
DROP PROCEDURE dbo.ejemplo2_agregar_fila;
DROP TABLE dbo.ejemplo2;
GO


