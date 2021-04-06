
--PUNTO 1
CREATE TABLE XX (
	BB varchar(2),
	CC varchar(2)
);
CREATE TABLE YY (
	AA varchar(2),
	BB varchar(2)
);
CREATE TABLE ZZ (
	AA varchar(2),
	CC varchar(2)
);
INSERT INTO XX VALUES
	('b1', 'c1'),
	('b2', 'c2'),
  ('b2', 'c1'),
  ('b1', 'a3'),
  ('b1', 'c5');
INSERT INTO YY VALUES
	('a1', 'b1'),
  ('a1', 'b3'),
  ('a1', 'b4'),
  ('a3', 'b1');
INSERT INTO ZZ VALUES
	('a1', 'c2'),
	('a2', 'c2'),
	('a2', 'c1'),
  ('a3', 'b3');

--CONSULTAS
--X interseccion Y
SELECT BB FROM XX
INTERSECT
SELECT BB FROM YY;

--X JOIN Z
SELECT * FROM XX
INNER JOIN ZZ ON XX.CC=ZZ.CC;

--X UNION Y
SELECT * FROM XX
UNION
SELECT * FROM YY;

--Y PRODUCTO Z
SELECT * FROM YY,ZZ;

--SELECCION (AA = CC) de XX PRODUCTO Z
SELECT * FROM XX,ZZ WHERE AA = XX.CC;

--PROYECCION de (X.C,Y.A) de (SELECCION ((X.B)-(Y.B))
SELECT XX.CC, YY.AA FROM XX,YY WHERE XX.BB = YY.BB;

--PROYECCION de B(X) MENOS PROYECCION de B(Y)
SELECT BB FROM XX
EXCEPT
SELECT BB FROM YY;
