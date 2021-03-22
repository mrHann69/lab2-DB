IF EXIST

--PUNTO 1
CREATE TABLE X (
	B varchar(2),
	C varchar(2)
);
CREATE TABLE Y (
	A varchar(2),
	B varchar(2)
);
CREATE TABLE Z (
	A varchar(2),
	C varchar(2)
);
INSERT INTO X VALUES
	('b1', 'c1'),
	('b2', 'c2'),
  	('b2', 'c1'),
  	('b1', 'c3'),
  	('b1', 'c5');
INSERT INTO Y VALUES
	('a1', 'b1'),
  	('a1', 'b3'),
  	('a1', 'b4'),
  	('a3', 'b1');
INSERT INTO Z VALUES
	('a1', 'c2'),
  	('a2', 'c2'),
  	('a2', 'c1'),
  	('a3', 'b3');

--CONSULTAS
--X interseccion Y
SELECT * FROM X;
INTERSECT
SELECT * FROM Y;
--X JOIN Z
SELECT * FROM X;
INNER JOIN Y;
--X UNION Y
SELECT * FROM X;
UNION Y;
--Y PRODUCTO Z
--SELECCION (A - C) de X PRODUCTO Y
--PROYECCION de (X.C,Y.A) de (SELECCION ((X.B)-(Y.B))
--PROYECCION de B(X) MENOS PROYECCION de B(Y)
