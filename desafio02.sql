--  DESAFIO 2 - CONSULTAS AGRUPADAS
--  NOMBRE : CRISTIAN VENEGAS 

-- SCRIPTS :
-- BD
CREATE DATABASE desafio2_Cristian_Venegas_344
--TABLAS
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);
--INSERT
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021','Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

--PREGUNTAS :

-- 1. ¿Cuántos registros hay?
SELECT COUNT (*) FROM INSCRITOS;
-- RESPUESTA :  16 

-- 2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) CANTIDAD FROM INSCRITOS; 
-- RESPUESTA :  774 

-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * from INSCRITOS WHERE fecha = (SELECT min(fecha) FROM INSCRITOS);

--RESPUESTA : LOS DOS REGISTROS DE ENERO DE 2021

-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT FECHA, SUM(CANTIDAD) as 'Inscritos' FROM INSCRITOS GROUP BY fecha;

-- 5. ¿Cuántos inscritos hay por fuente?
SELECT fuente, sum(cantidad) as 'total' FROM INSCRITOS GROUP By fuente;

-- 6. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS 'total'  FROM INSCRITOS GROUP BY fecha ORDER BY total desc LIMIT 1;
--RESPUESTA 1 : EL DIA QUE MAYOR MATRICULA TUVO FUE EL 1 DE AGOSTO DE 2021
--RESPUESTA 2 : SE ISCRIBIERON UN TOTAL DE 182 PERSONAS.  

-- 7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT * from INSCRITOS WHERE fuente = 'Blog' ORDER by cantidad DESC LIMIT 1;
--RESPUESTA 1 : EL DIA 01-08-2021   
--RESPUESTA 2 : FUERON 83 PERSONAS


-- 8. ¿Cuántas personas en promedio se inscriben en un día?
SELECT AVG(cantidad) from INSCRITOS ;
--RESPUESTA : EN PROMEDIO SE INSCRIBEN 48 PERSONAS APROX 

-- 9. ¿Qué días se inscribieron más de 50 personas?
select fecha, sum(cantidad) as 'total' from INSCRITOS WHERE cantidad > 50 GROUP by fecha ORDER by total DESC;


--10. ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT avg(cantidad) as 'Promedio inscritos' FROM INSCRITOS WHERE fecha = '01/04/2021' and (SELECT max(fecha)from INSCRITOS) ;
