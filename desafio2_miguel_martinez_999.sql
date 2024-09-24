--Desafio 2 modulo 5 PostgreSQL

--A continuación responderemos las preguntas:
--1. ¿Cuántos registros hay? 
--2. ¿Cuántos inscritos hay en total? 
--3. ¿Cuál o cuáles son los registros de mayor antigüedad?
--4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante) 
--5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
--En base a la tabla inscripción con los siguientes datos:

CREATE DATABASE desafio2_miguel_martinez_999;
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' ); INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

--Respuestas:
--1. ¿Cuántos registros hay? :

SELECT COUNT(*) FROM inscritos;
-- count
-------
--    16
--(1 fila)

--2. ¿Cuántos inscritos hay en total? 

SELECT SUM(cantidad) FROM inscritos;
-- sum
-----
-- 774
--(1 fila)

--3. ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT MIN(fecha) FROM inscritos;
--    min
------------
-- 2021-01-01
--(1 fila)

--También podemos ver el orden de los registros por fecha de la siguiente forma:

SELECT * FROM inscritos ORDER BY fecha;
-- cantidad |   fecha    | fuente
------------+------------+--------
--       44 | 2021-01-01 | Blog
--       56 | 2021-01-01 | Página
--       39 | 2021-02-01 | Blog
--       81 | 2021-02-01 | Página
--       12 | 2021-03-01 | Blog
--       91 | 2021-03-01 | Página
--       48 | 2021-04-01 | Blog
--       45 | 2021-04-01 | Página
--       55 | 2021-05-01 | Blog
--       33 | 2021-05-01 | Página
--       18 | 2021-06-01 | Blog
--       12 | 2021-06-01 | Página
--       34 | 2021-07-01 | Blog
--       24 | 2021-07-01 | Página
--       83 | 2021-08-01 | Blog
--       99 | 2021-08-01 | Página
--(16 filas)

--4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante) 

SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos GROUP BY fecha ORDER BY fecha;
--   fecha    | inscritos_por_dia
--------------+-------------------
-- 2021-01-01 |               100
-- 2021-02-01 |               120
-- 2021-03-01 |               103
-- 2021-04-01 |                93
-- 2021-05-01 |                88
-- 2021-06-01 |                30
-- 2021-07-01 |                58
-- 2021-08-01 |               182
--(8 filas)

--5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS max_inscritos FROM inscritos GROUP BY fecha ORDER BY fecha DESC LIMIT 1;
--   fecha    | max_inscritos
--------------+---------------
-- 2021-08-01 |           182
--(1 fila)
