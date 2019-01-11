CREATE TABLE DISTRITOS(
CODDIS CHAR(4) PRIMARY KEY,
NOMDIS VARCHAR2(30) NOT NULL);

CREATE TABLE CLIENTES(
CODCLI CHAR(4) PRIMARY KEY,
NOMCLI VARCHAR2(30) NOT NULL,
DNI CHAR(8) NOT NULL,
FNAC DATE NOT NULL,
SEXO CHAR(1) NOT NULL,
TELEF VARCHAR2(9),
DIRECC VARCHAR2(40)NOT NULL,
CODDIS CHAR(4) REFERENCES DISTRITOS(CODDIS),
EMAIL VARCHAR2(20));

CREATE TABLE CARGOS(
CODCAR CHAR(4) PRIMARY KEY,
NOMCAR VARCHAR2(30) NOT NULL);

CREATE TABLE EMPLEADOS(
CODEMP CHAR(4) PRIMARY KEY,
NOMEMP VARCHAR2(30) NOT NULL,
DNI CHAR(8) NOT NULL,
FNAC DATE NOT NULL,
SEXO CHAR(1) NOT NULL,
TELEF VARCHAR2(9),
DIRECC VARCHAR2(40)NOT NULL,
CODDIS CHAR(4) REFERENCES DISTRITOS(CODDIS),
CODCAR CHAR(4) REFERENCES CARGOS(CODCAR),
SUELDO NUMBER(7,2)NOT NULL,
FING DATE NOT NULL,
FCESE DATE NOT NULL,
EMAIL VARCHAR2(20));

CREATE TABLE MARCAS(
CODMAR CHAR(4) PRIMARY KEY,
NOMMAR VARCHAR2(20) NOT NULL);

CREATE TABLE PRODUCTOS(
CODPRO CHAR(3) PRIMARY KEY,
NOMPRO VARCHAR2(30) NOT NULL,
CODMAR CHAR(4) REFERENCES MARCAS(CODMAR),
PRECIO NUMBER(7,2) NOT NULL,
STOCK NUMBER NOT NULL,
ESTADO CHAR(1) NOT NULL);

CREATE TABLE PROVEEDORES(
 CODPROV CHAR(4) PRIMARY KEY,
 RAZON_SOCIAL VARCHAR(30 ),
 RUC CHAR(11),
 DIRECCION VARCHAR2(30),
 CODDIS CHAR(4) REFERENCES DISTRITOS(CODDIS),
 WEB VARCHAR2(30),
 EMAIL VARCHAR2(30),
 TELEFONO VARCHAR2(9),
 ESTADO CHAR(1) );
 
 CREATE TABLE ABASTECIMIENTO(
 CODABA CHAR(4) PRIMARY KEY,
 CODPROV CHAR(4) REFERENCES PROVEEDORES(CODPROV ),
 CODPRO CHAR(3) REFERENCES PRODUCTOS(CODPRO ) 
 );

 /*
 DROP TABLE DISTRITOS;
DROP TABLE CLIENTES;
DROP TABLE CARGOS;
DROP TABLE EMPLEADOS;
DROP TABLE MARCAS;
DROP TABLE PRODUCTOS;
DROP TABLE PROVEEDORES;
DROP TABLE ABASTECIMIENTO;
 */


INSERT INTO DISTRITOS VALUES('D001','ANCON');
INSERT INTO DISTRITOS VALUES('D002','ATE');
INSERT INTO DISTRITOS VALUES('D003','BELLAVISTA');
INSERT INTO DISTRITOS VALUES('D004','CALLAO');
INSERT INTO DISTRITOS VALUES('D005','LIMA');

INSERT INTO CARGOS VALUES('C001','VENDEDOR');
INSERT INTO CARGOS VALUES('C002','CAJERO');                           
INSERT INTO CARGOS VALUES('C003','VIGILANTE');
INSERT INTO CARGOS VALUES('C004','AUXILIAR');
INSERT INTO CARGOS VALUES('C005','JEFE DE TIENDA');

INSERT INTO MARCAS VALUES('M001','LAIVE'); 
INSERT INTO MARCAS VALUES('M002','GLORIA');
INSERT INTO MARCAS VALUES('M003','SAPOLIO');
INSERT INTO MARCAS VALUES('M004','COSTE�O');
INSERT INTO MARCAS VALUES('M005','ARIEL');

INSERT INTO CLIENTES VALUES('C001','JUAN BACA DEL BUENO','89456542','11/12/1996','M','465-8495','JR HANAN CUZCO #835','D001','J.BRIANB@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C002','VICTOR MATOS SECCE','45689856','15/06/1995','M','546-5465','AV OVALO #789','D001','VICTO@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C003','BRYAN AGUILAR CHUQUINO','54654668','13/06/1996','M','879-5465','JR GUTIERREZ #546','D002','BRYAAG@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C004','JOSSEPH MARTINEZ GUERRA','54687845','20/08/1995','M','879-5750','AV COLLIQUE #545','D002','JOSSMA@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C005','JERSON ROMERO DIAZ','54689874','19/09/1994','M','546-7882','JR ENTRADA #789','D003','JERSON@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C006','MARIA GUERRERO QUISPE','45687255','12/04/1992','F','789-2156','AV ZAMBO #879','D003','MARIA@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C007','OMAR ESPINOZA LUJAN','23154574','17/09/1995','M','489-8795','JR HANAN CUZCO #873','D004','OMAR@YAHOO.COM.PE');
INSERT INTO CLIENTES VALUES('C008','VIRGINIA FLORES MANRIQUE','12458521','13/08/1985','F','789-8725','AV INDUSTRIAL #789','D004','VIRGFLO@YAHOO.COM.PE');
INSERT INTO CLIENTES VALUES('C009','ANDRES ESPINOZA TORRES','35421782','23/07/1995','M','489-4582','AV GUTIERREZ #875','D005','ANDESPTO@HOTMAIL.COM');
INSERT INTO CLIENTES VALUES('C010','ROSA VICTORIO TORRES','96524812','20/07/1990','F','155-5465','OVALO MENDIOLA #122','D005','ROVICTO@YAHOO.COM.PE');

INSERT INTO EMPLEADOS VALUES ('E001','BRYAN AGUILAR','98745632','12/05/1995','M','987456123','JR. ASUNCION 976','D001','C003', 750.00,'24/07/2014','24/07/2014','BRADA@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E002','RAUL RAMOS','74589625','10/03/1998','M','968521471','JR. PERU 524','D001','C003', 750.00,'25/05/2014','25/05/2014','RAUL001@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E003','ENRIQUE PALACIOS','96587441','14/06/1985','M','987147852','JR. CANADA 924','D002','C002', 1100.00,'11/07/2013','11/07/2013','ENRIQUE7@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E004','JUANA RAMIREZ','71425896','15/07/1996','F','912365478','AV. BRASIL 984','D002','C002', 1100.00,'12/08/2013','12/08/2013','JUANA8@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E005','NATHALY CONTRERAS','78932156','02/08/1980','F','582-9874','AV. TUPACAMARU 789','D003','C001', 1200.50,'13/09/2012','13/09/2012','NATAH4@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E006','BRYAN ANGELES','96325874','23/09/1983','M','565-7419','JR. ASUNCION 147','D003','C001', 1200.50,'13/10/2012','13/10/2012','BRYAN44@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E007','STEVEN MIRANDA','89652314','16/10/1992','M','951753258','AV. PALACIOS 741','D004','C004', 950.00,'14/11/2011','14/11/2011','STEVEN78@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E008','JORGE ESTRADA','74368514','18/11/1990','M','974185214','JR. CELESTE 123','D004','C004', 950.00,'15/12/2011','15/12/2011','JORGE65@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E009','MARTIN BALDEON','74852514','19/12/1992','M','525-9876','AV. IZAGUIRRE 147','D005','C005', 4000.00,'16/10/2014','16/10/2014','MARTIN14@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E010','JUAN PEREZ','36258596','14/10/1993','M','978259564','AV. METROPOLI 781','D005','C005', 4000.00,'16/07/2014','16/07/2014','JUAN7@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E011','JUAN BACA CABRO','00087954','14/10/1995','M','978259564','AV. METROPOLI 781','D005','C005', 3800.00,'16/07/2014','16/07/2014','BACAGAY@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E012','JUAN PABLO','0008745','14/10/1993','M','978259564','AV. METROPOLI 781','D005','C005', 3800.00,'16/07/2014','16/07/2014','BACAGAY@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E013','JUAN NELIDAN','0008745','14/10/1993','M','978259564','AV. METROPOLI 781','D005','C005', 3800.00,'16/07/2014','16/07/2014','BACAGAY@HOTMAIL.COM');
INSERT INTO EMPLEADOS VALUES ('E014','JUAN SAS','0808745','14/10/1993','M','87954612','AV. METROPOLI 781','D005','C005', 3800.00,'16/07/2000','16/07/2014','BACAGAY@HOTMAIL.COM');

INSERT INTO PRODUCTOS VALUES ('001','QUESO LAIVE','M001',2.8,20,'A');
INSERT INTO PRODUCTOS VALUES ('002','MANTEQUILLA LAIVE','M001',1.5,80,'A');
INSERT INTO PRODUCTOS VALUES ('003','LECHE LAIVE','M001',2.5,47,'A');
INSERT INTO PRODUCTOS VALUES ('004','QUESO GLORIA','M002',3.2,20,'A');
INSERT INTO PRODUCTOS VALUES ('005','MANTEQUILLA GLORIA','M002',1.3,80,'A');
INSERT INTO PRODUCTOS VALUES ('006','LECHE GLORIA','M002',1.6,40,'A');
INSERT INTO PRODUCTOS VALUES ('007','YOGURT GLORIA','M002',4.5,29,'A');
INSERT INTO PRODUCTOS VALUES ('008','PANETON GLORIA','M002',18.5,85,'A');
INSERT INTO PRODUCTOS VALUES ('009','FRUGOS GLORIA','M002',18.5,85,'A');
INSERT INTO PRODUCTOS VALUES ('010','DETERGENTE DE 10K','M003',50.00,100,'A');
INSERT INTO PRODUCTOS VALUES ('011','DETERGENTE DE 15K','M003',55,100,'A');
INSERT INTO PRODUCTOS VALUES ('012','DETERGENTE DE 20K','M003',100.00,100,'A');
INSERT INTO PRODUCTOS VALUES ('013','DETERGENTE DE 35K','M003',105.00,100,'A');
INSERT INTO PRODUCTOS VALUES ('014','DETERGENTE DE 50K','M003',280.00,100,'A');

SELECT * FROM PRODUCTOS
INSERT INTO PROVEEDORES VALUES ('PR01','LAIVE S.A.C','10789452125','AV. LORETO 125','D001','WWW.LAIVE.COM','LAIVE.125@GMAIL.COM','520-1610','A');
INSERT INTO PROVEEDORES VALUES ('PR02','GLORIA S.A.C','20875412458','AV. PANAME 1565','D002','WWW.GLORIA.COM','GLORIA@GMAIL.COM','520-1610','A');
INSERT INTO PROVEEDORES VALUES ('PR03','SAPOLIO S.A.C','11879741254','JR. MATEO PUMACAHUA','D003','WWWSAPOLIO.COM','SAPOLIO@GMAIL.COM','520-1610','A');
INSERT INTO PROVEEDORES VALUES ('PR04','COSTE�O S.A.C','89752154456','JR. LIBERTAD 985','D004','WWW.COSTE�O.COM','COSTE�O@GMAIL.COM','520-1610','A');
INSERT INTO PROVEEDORES VALUES ('PR05','ARIEL S.A.C','11879741254','AV. PANAMA','D005','WWW.ARIEL.COM','ARIEL@GMAIL.COM','520-1610','A');



UPDATE EMPLEADOS SET SUELDO = 4550 WHERE CODEMP = 'E010'
SELECT * FROM EMPLEADOS;

SELECT E.NOMEMP AS EMPLEADO,D.NOMDIS AS DISTRITO,
       C.NOMCAR AS CARGO,E.SUELDO AS "SUELDO BASICO"
FROM EMPLEADOS  E ,DISTRITOS D ,CARGOS C
WHERE E.CODDIS = D.CODDIS AND E.CODCAR =  C.CODCAR 
      AND E.SUELDO > (SELECT AVG(SUELDO) FROM EMPLEADOS)
ORDER BY 4 DESC;

SELECT C.CODCAR,NOMCAR,COUNT(*) AS "CANTIDAD EMPLEADOS",
       SUM(E.SUELDO) AS "TOTAL SUELDO",
       AVG(E.SUELDO) AS "SUELDO PROMEDIO"
  FROM CARGOS C,EMPLEADOS E
 WHERE C.CODCAR = E.CODCAR
 GROUP BY C.CODCAR,C.NOMCAR
 ORDER BY 5 DESC;
 
 SELECT D.NOMDIS AS "DISTRITO",COUNT(C.CODCLI) AS "EMPLEADOS X DISTRITO"        
 FROM CLIENTES C ,DISTRITOS D 
 WHERE C.CODDIS = D.CODDIS  AND (D.NOMDIS LIKE 'A%' OR D.NOMDIS LIKE 'C%')
 GROUP BY D.NOMDIS
 ORDER BY 2 ASC
 
SELECT  C.NOMCAR,COUNT(CODEMP) AS "N� EMPLEADOS",AVG(SUELDO) "PROMEDIO"
 FROM  EMPLEADOS E,CARGOS C
 WHERE E.CODCAR = C.CODCAR
 GROUP BY C.NOMCAR
 HAVING AVG(SUELDO) < 2500
 ORDER BY 3 DESC ;
 
 SELECT NOMEMP || ' ' || DNI AS EMPLEADOS 
 FROM EMPLEADOS
 WHERE SUELDO >= (SELECT MAX(SUELDO) FROM EMPLEADOS)
 
 SELECT CONCAT(NOMEMP,CONCAT(' ',DNI))AS EMPLEADOS 
 FROM EMPLEADOS
 WHERE FNAC <= (SELECT MAX(FNAC) FROM EMPLEADOS)


SELECT NOMCLI,FNAC,TO_CHAR(FNAC,'DD') AS "DIA",
       TO_CHAR(FNAC,'MM') AS "MES",
      TO_CHAR(FNAC,'YYYY') AS "A�O" ,
     EXTRACT(YEAR  FROM SYSDATE) - EXTRACT(YEAR FROM FNAC)  AS "EDAD"
FROM CLIENTES
ORDER BY 6 DESC

SELECT CODEMP,NOMEMP,EXTRACT(YEAR  FROM SYSDATE) - EXTRACT(YEAR FROM FING)  AS "A�OS DE SERVICIO"
FROM EMPLEADOS
WHERE EXTRACT(YEAR  FROM SYSDATE) - EXTRACT(YEAR FROM FING) >= 2
ORDER BY 3;

SELECT DNI,SUELDO FROM EMPLEADOS
WHERE  ROWNUM < 2 AND SUELDO >= (SELECT MAX(SUELDO) FROM EMPLEADOS)

SELECT *
  FROM (SELECT DNI,SUELDO FROM EMPLEADOS ORDER BY CODEMP)
 WHERE  SUELDO >= (SELECT MAX(SUELDO) FROM EMPLEADOS) AND ROWNUM = 2 ;

/* TOP DE SUELDOS MAYORES */
 SELECT * FROM (SELECT NOMEMP "EMPLEADO",DNI,SUELDO FROM EMPLEADOS
 ORDER BY 3 DESC)
 WHERE ROWNUM <= 2 ;
 
 
 SELECT * FROM ( SELECT C.CODCAR "CODIGO CARGO",C.NOMCAR "NOMBRE CARGO",SUM(E.SUELDO) AS "SUELDO" 
                 FROM CARGOS C ,EMPLEADOS E
                 WHERE C.CODCAR = E.CODCAR
                 GROUP BY C.CODCAR,C.NOMCAR
                 ORDER BY 3  )
 WHERE ROWNUM <= 3
 
 SELECT * FROM (
      SELECT D.NOMDIS,COUNT(*) AS "N� CLIENTES",AVG(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM C.FNAC),'YY') AS "EDADES"
      FROM CLIENTES C,DISTRITOS D
      WHERE C.CODDIS = D.CODDIS
      GROUP BY D.NOMDIS
 )
 

 
 CREATE OR REPLACE VIEW VISTA2
 AS
 SELECT * FROM (SELECT  NOMEMP "EMPLEADO",NOMDIS "DISSTRITO",NOMCAR "CARGO",SUELDO  
 FROM EMPLEADOS E,DISTRITOS D,CARGOS C
 WHERE E.CODDIS = D.CODDIS AND E.CODCAR = C.CODCAR 
 ORDER BY SUELDO DESC )
 WHERE ROWNUM <= 2 ;

/* CREAR UNA VISTA QUE MUESTRE  CODIGO DE DISTRITO NOMBREDISTRITO Y NUMERO DE CLIENTE POR DISTRITO DE TODOS LOS DISTRITOS MENOS LIMA*/
CREATE OR REPLACE VIEW VISTA3
 AS
 SELECT * FROM (SELECT D.CODDIS "CODIGO DISTRITO",D.NOMDIS "NOMBREDISTRITO",COUNT(C.CODCLI) AS " N� CLIENTES"
                                    FROM DISTRITOS D ,CLIENTES C
                                    WHERE D.CODDIS = C.CODDIS AND D.NOMDIS NOT IN ('LIMA')                                    
                                    GROUP BY D.CODDIS,D.NOMDIS
                                    ORDER BY 1)
                            
                                    
SELECT * FROM VISTA3

/* CREAR VISTA QUE MUESTRE CODEMPLEADO NOMBE EMPLEADO   
FECHA NACIMIENTO DE TODOS LOS EMPLEADOS QUE HAYAN NACIDO EN UN MES IMPAR Y CUYO SUELDO ESTE ENTRE 100 Y 3000 SOLES
Y VIVA EN LOS DISTRITOS QUE ENPIECEN A Y C  ORDENADO SUELDO DES Y NOMBRE ASC*/
SELECT * FROM EMPLEADOS
CREATE OR REPLACE VIEW VISTA4
 AS
 SELECT CODEMP,NOMEMP,FNAC FROM EMPLEADOS
 WHERE 

CREATE OR REPLACE VIEW VISTA5
 AS
SELECT CODEMP,NOMEMP,FNAC,D.NOMDIS,SUELDO
FROM EMPLEADOS E,DISTRITOS D
WHERE E.CODDIS = D.CODDIS AND EXTRACT (MONTH FROM FNAC) IN (1,3,5,7,9,11) AND (NOMDIS LIKE 'A%' OR NOMDIS LIKE 'C%' ) AND SUELDO BETWEEN 1000 AND 3000
ORDER  BY SUELDO DESC,NOMEMP DESC

SELECT * FROM VISTA5

/*
CREE UNA VISTA QUE MUESTRE EN UNA SOLA CADENA EL NOMBRE DEL DNI Y EL NOMBRE DE DISTRITO DEL CLIENTE MAS JOVEN
*/
CREATE OR REPLACE VIEW VISTA6
 AS
SELECT NOMCLI || ' ' || DNI || ' ' || D.NOMDIS "TEXTO CONCATENADO"
FROM CLIENTES C,DISTRITOS D
WHERE C.CODDIS = D.CODDIS AND FNAC >= (SELECT MAX(FNAC) FROM CLIENTES)

/*
CREAR UNA VISTA QUE MUESTRE EL NOMBRE DE EMPLEADO DNI NOMBRECARGO DE TODOS LOS EMPLEAD
OS CULLA EDAD SEA SUPERIOR AL PROMEDIO DE EDADES CCUYO DNI SU PENULTIMO DIGITO SEA ENTRE 1 Y8
ORDENADO POR DNI DESC
*/
CREATE OR REPLACE VIEW VISTA7
 AS
SELECT NOMEMP,DNI,C.NOMCAR
FROM EMPLEADOS E,CARGOS C
WHERE E.CODCAR = C.CODCAR AND
                (EXTRACT (YEAR FROM SYSDATE)  - EXTRACT (YEAR FROM FNAC)) >  (SELECT AVG(EXTRACT (YEAR FROM SYSDATE)  - EXTRACT (YEAR FROM FNAC)) FROM EMPLEADOS)
                 AND SUBSTR(E.DNI,7,1)  IN ('1','8')

CREATE OR REPLACE VIEW VISTA8
 AS

/*
- CREAR UNA VISTA QUE MUESTRE EL NOMBRE EL RUC Y DIRECCION Y NOMBRE DE DISTRITO DE PROVEEDOR QUE VENDE MAS PRODUCTOS
- CREAR UNA VISTA QUE MUESTRE CODIGO DE MARCA NOMNBRE MARCA NNUMERO PRODUCTO Y TOTAL PRECIO POR CADA MARCA ORDENADO POR TOTAL PRECIO DESCENDENTEMENTEY PO RNOBRE DE MARCA ASC
- CREAR UNA VISTA QUE ME MUESTRE PROVEEDORES SOLO AQUELLOS PRECIOS QUE SON MAYOR A 150 ORDENADA POR TOTAL PRECIOS DESCENDENTEMENTE
*/

SELECT * FROM PRODUCTOS;

CREATE OR REPLACE VIEW VISTA10
AS
SELECT  A.CODPRO "CODIGO",P.NOMPRO"PRODUCTO",COUNT(CODPROV) "N.PROVEEDORES",SUM(P.PRECIO) "TOTAL PRECIOS"
FROM PRODUCTOS P,ABASTECIMIENTO A
WHERE P.CODPRO = A.CODPRO 
GROUP BY P.NOMPRO,A.CODPRO
HAVING SUM(P.PRECIO) > 150
ORDER BY 4 DESC

SELECT * FROM DISTRITOS;

CREATE OR REPLACE PROCEDURE USP_INSERTARDISTRITO (
CODDIS IN CHAR ,
NOMDIS IN VARCHAR2
)
IS
BEGIN  
  INSERT INTO DISTRITOS VALUES (CODDIS,NOMDIS);
END;

BEGIN
USP_INSERTARDISTRITO ('D007','LA MOLINA');
END;

EXECUTE USP_INSERTARDISTRITO ('D009','BRE�A');

SELECT * FROM EMPLEADOS;
SELECT * FROM CARGOS;

/* CREAR UN PROCEDIMINTO QUE ME PERMITA AUMENTAR LOS SUELDOS DE UN DETERMINADO CARGO */

CREATE OR REPLACE PROCEDURE USP_AUMENTARSUELDO (NODCARG IN CHAR,MONTO IN NUMBER)
IS
BEGIN 
  UPDATE EMPLEADOS SET SUELDO  = SUELDO + (MONTO /100) * SUELDO
  WHERE CODCAR = (SELECT CODCAR FROM CARGOS WHERE NOMCAR = NODCARG);
END;

EXECUTE USP_AUMENTARSUELDO ('CAJERO',10);
SELECT * FROM PRODUCTOS
-- DISMINUIR EL PRECIO DE LOS PRODUCTOS DE UNA DETERMINADA MARCA
CREATE OR REPLACE PROCEDURE USP_DISMINUIRPRECIO (NOMARC IN CHAR,MONTO IN NUMBER)
IS
BEGIN 
  UPDATE PRODUCTOS SET PRECIO = PRECIO - (MONTO /100) * PRECIO
  WHERE CODMAR = (SELECT CODMAR FROM MARCAS WHERE NOMMAR = NOMARC );
END;

EXECUTE USP_DISMINUIRPRECIO ('LAIVE',10);

-- CREAR UN PROCEDIMIENTO ALMACENADO QUE MUESTRE EL CODIGO DE PRODUCTO NOMBRE PRODUCTO PRECIO Y NOMBRE DE MARCA
 -- DE LOS PRODUCTOS DE UNA DETERMINADA MARCA

-- CREACION DE P.A. CON SELECT 
CREATE OR REPLACE PROCEDURE USP_MOSTRARDISTRITO (DATOS OUT SYS_REFCURSOR)
IS
BEGIN 
  OPEN DATOS FOR SELECT * FROM DISTRITOS ORDER BY 1;  
END;
-- EJECUCION DE P.A. 
VARIABLE TABLA REFCURSOR;
EXEC USP_MOSTRARDISTRITO(:TABLA);
PRINT TABLA

CREATE OR REPLACE PROCEDURE USP_MOSTRARPRODUCTOS (DATOS OUT SYS_REFCURSOR,NOMARC IN NCHAR)
IS
BEGIN 
  OPEN DATOS FOR 
  SELECT P.CODPRO,P.NOMPRO,P.PRECIO,M.NOMMAR
  FROM PRODUCTOS P,MARCAS M 
  WHERE P.CODMAR = M.CODMAR AND P.CODMAR = (SELECT CODMAR FROM MARCAS WHERE NOMMAR = NOMARC );
END;

VARIABLE TABLA REFCURSOR;
EXEC USP_MOSTRARPRODUCTOS(:TABLA,'LAIVE');
PRINT TABLA




 -- CREAR UN PROCEDIMIENTO ALMACENADO QUE MUESTRE EL NOMBRE LA FECHA DE NACIMIENTO DEL EMPLEADO MAS JOVEN
CREATE OR REPLACE PROCEDURE USP_EMPLEADOEDADMENOR(DATOS OUT SYS_REFCURSOR)
IS
BEGIN 
  OPEN DATOS FOR 
  SELECT * FROM EMPLEADOS 
  WHERE ROWNUM = 1 AND FNAC = (SELECT MAX(FNAC) FROM EMPLEADOS);
END;

VARIABLE TABLA REFCURSOR;
EXEC USP_EMPLEADOEDADMENOR(:TABLA);
PRINT TABLA

-- CREAR UN PROCEDIMIENTO QUE MUESTRE EL CODIGO DE MARCA NOMBRE MARC N� DE PRODUCTO POR CADA MARCA
 -- Y TOTAL DE PRECIOS DECENC
 
 CREATE OR REPLACE PROCEDURE USP_GRUPOPORMARCAS(DATOS OUT SYS_REFCURSOR)
IS
BEGIN 
  OPEN DATOS FOR 
  SELECT P.CODMAR,M.NOMMAR,COUNT(CODPRO) "CANTIDAD PRODUCTO",SUM(P.PRECIO) "TOTAL X  MARCA"
  FROM PRODUCTOS P,MARCAS M
  WHERE P.CODMAR = M.CODMAR  
  GROUP BY P.CODMAR, M.NOMMAR  
  ORDER BY 4 DESC ; 
END;

VARIABLE TABLA REFCURSOR;
EXEC USP_GRUPOPORMARCAS(:TABLA);
PRINT TABLA

-- CREAR UN PROCEDIMIENTO ALMACENADO QUE DISMINUYA EL 
-- SUELDO DE UN NOMBRE CARGO DE EMPLEADO Y POSTERIOR MENTE PRESENTE EL NOMBRE 
-- Y EL SUELDO Y EL N CARGO DE LAS PERSONAS QUE SE LE DISMINUYO

 CREATE OR REPLACE PROCEDURE USP_DESCONTARSUELDO(DATOS OUT SYS_REFCURSOR,DSCT IN NUMBER,CARGO IN NCHAR)
IS
BEGIN 
  UPDATE EMPLEADOS SET SUELDO = SUELDO - DSCT
  WHERE CODCAR = (SELECT CODCAR FROM CARGOS WHERE NOMCAR = CARGO );
   OPEN DATOS FOR  SELECT CODEMP,NOMEMP,SUELDO FROM EMPLEADOS WHERE CODCAR = (SELECT CODCAR FROM CARGOS WHERE NOMCAR = CARGO );
END;

SELECT * FROM EMPLEADOS
SELECT * FROM CARGOS

VARIABLE TABLA REFCURSOR;
EXEC USP_DESCONTARSUELDO(:TABLA,10,'JEFE DE TIENDA');
PRINT TABLA

SELECT LOWER(NOMEMP) FROM EMPLEADOS; -- MINUSCULA
SELECT UPPER(NOMEMP) FROM EMPLEADOS; -- MAYUSCULA
SELECT  LENGTH(NOMEMP)FROM EMPLEADOS; -- LONGITUD TEXTO
SELECT INITCAP(NOMEMP) FROM EMPLEADOS; -- ONVIERTE LA PRIMERA LETRA DE CADA PALABRA EN MAY�SCULAS, Y EL RESTO EN MIN�SCULA.

SELECT TO_DATE('01/01/2014', 'DD/MM/YYYY') + 1 FROM DUAL;

SELECT SYSDATE FROM DUAL;

SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -> 7

SELECT ROUND(SYSDATE,'YEAR') FROM DUAL;

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('HOLA CONSOLA');
END;

SET SERVEROUTPUT ON
DECLARE VAR NCHAR  := 'VICTOR KEVIN MATOS SECCE';
BEGIN 
DBMS_OUTPUT.PUT_LINE(VAR);
END;

-- LINEA SIMPLE


/* 
CONJUNTO DE LINEAS
*/


SELECT SYSDATE FROM DUAL;
SELECT 5**(1)  FROM DUAL;

DECLARE
  FLAG NUMBER;
BEGIN
  FLAG :=1 ;
  IF (FLAG = 1) THEN
     GOTO PASO1;     
  END IF;
<<PASO1>>
         DBMS_OUTPUT.PUT_LINE('EJECUCION DE PASO 1');
<<PASO2>>
         DBMS_OUTPUT.PUT_LINE('EJECUCION DE PASO 2');
END;

-- SENTENCIA IF 
DECLARE
  SEXO NCHAR;
BEGIN
  SEXO := 'X' ;
  IF (SEXO = 'M') THEN
       DBMS_OUTPUT.PUT_LINE('MASCULINO');
  ELSIF (SEXO = 'F') THEN
	    DBMS_OUTPUT.PUT_LINE('FEMENINO');
	ELSE
	    DBMS_OUTPUT.PUT_LINE('NINGUNO');
  END IF;
END;

DECLARE
 RESULTADO NUMBER;
  MULTIPLICADOR NUMBER:=0;
BEGIN
  LOOP
    RESULTADO:=4*MULTIPLICADOR;
    EXIT WHEN RESULTADO>=50;
    DBMS_OUTPUT.PUT_LINE('4X'||TO_CHAR(MULTIPLICADOR)||'='||TO_CHAR(RESULTADO));
    MULTIPLICADOR:=MULTIPLICADOR+1;
  END LOOP;
END;
-- CONTAR DE 1 A 50
SET SERVEROUTPUT ON;
DECLARE
CONTADOR NUMBER := 0;
BEGIN 
 LOOP    
   DBMS_OUTPUT.PUT_LINE(CONTADOR);
   CONTADOR :=  CONTADOR+1;
    EXIT WHEN CONTADOR > 50;
    END LOOP;
END;

DECLARE 
  SEXO NCHAR := 'M';
BEGIN
  IF (SEXO = 'M') THEN
       DBMS_OUTPUT.PUT_LINE('MASCULINO');
       END IF;
END;

DECLARE 
  PERSONA1 NCHAR(20) := 'MS';
  PERSONA2 NCHAR(20)  := 'VK';
BEGIN
  IF (PERSONA1 = 'MS') THEN
  IF (PERSONA2 = 'VK') THEN
       DBMS_OUTPUT.PUT_LINE('MATOS SECCE');
       DBMS_OUTPUT.PUT_LINE('VICTOR KEVIN');
       END IF;
      END IF;
END;

DECLARE 
    VALOR NCHAR(20);
   BEGIN
    VALOR := 'TRUE';
    IF (VALOR = 'TRUE') THEN
      DBMS_OUTPUT.PUT_LINE('VERDADERO');
      ELSE 
      DBMS_OUTPUT.PUT_LINE('FALSO');
    END IF;
   END;
   
  DECLARE
    VAR1 NUMBER;
    VAR2 NUMBER;
  BEGIN
    VAR1:= 10;
    VAR2:= 5;
     DBMS_OUTPUT.PUT_LINE('SUMA -- > ' || TO_CHAR(VAR1 + VAR2));
     DBMS_OUTPUT.PUT_LINE('RESTA -- > ' || TO_CHAR(VAR1 - VAR2));
     DBMS_OUTPUT.PUT_LINE('MULTIPLICACION -- > ' || TO_CHAR(VAR1 * VAR2));
     DBMS_OUTPUT.PUT_LINE('DIVISION -- > ' || TO_CHAR(VAR1 / VAR2));    
  END;
  
   DECLARE
    VAR NUMBER;
    BEGIN 
     VAR := 1;  
     WHILE(VAR <= 10) LOOP      
        DBMS_OUTPUT.PUT_LINE( TO_CHAR( VAR));
           VAR:= VAR +1;
     END LOOP;
    END;
    
SET SERVEROUTPUT ON;
BEGIN
  FOR LOOP_COUNTER IN 1..100 LOOP
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(LOOP_COUNTER) );
    END LOOP;
END;
/*
CREAR UN PROCEDIMIENTO QUE MUESTRE CODIGO EMPLEADO NOMBRE DNI Y SUELDO Y NOMBRE DE DISTRITO
DE TODOS LOS EMPLEADOS QUE VIVAN EN UN NOMBRE DE DISTRITO.
CREAR UNA VISTA QUE MUESTRE EL CODIGO DE MARCA,NOMBRE MARCA NUMERO DE PRODUCTO X MARCA Y TOTAL PRECIO POR CADA MARCA.
ORDENADO POR TOTAL PRESIO DESC Y MOSTRAR SOLO LAS MARCAS CUYO TOTAL DE PRECIO SEA MAYOR IGUAL QUE 500.
CREAR UN PROC ALMACENADO CON DOS CURSORES EL PIMER CURSOR DATA1 TENDRA EL CODIGO DE MARCA Y NOMBRE DE TODOS LOS PRODUCTOS
Y EL SEGUNDO TENRA QUE MOSTRAR EL CODIGO DE PRODUCTO NOMBRE PRECIO Y STOCK DE UNA DETERMINADA MARCA
*/


CREATE OR REPLACE PROCEDURE USP_MOSTRAREMPLEADO(DISTRITO NCHAR,CRS OUT SYS_REFCURSOR)
IS 
BEGIN
 OPEN CRS FOR 
 SELECT CODEMP "CODIGO",NOMEMP "NOMBRE",DNI "DNI",SUELDO "SUELDO",D.NOMDIS "DISTRITO"
 FROM EMPLEADOS E,DISTRITOS D
 WHERE E.CODDIS = D.CODDIS AND D.NOMDIS = DISTRITO;
END;

VARIABLE CRS REFCURSOR;
EXEC USP_MOSTRAREMPLEADO('LIMA',:CRS);
PRINT CRS

CREATE OR REPLACE VIEW VISTA_PRODUCTOS
AS
SELECT P.CODMAR,M.NOMMAR,COUNT(CODPRO) "CANTIDAD PRODUCTO",SUM(P.PRECIO * P.STOCK) "TOTAL X  MARCA"
  FROM PRODUCTOS P,MARCAS M
  WHERE P.CODMAR = M.CODMAR 
  GROUP BY P.CODMAR, M.NOMMAR 
  HAVING SUM(P.PRECIO) > 500
  ORDER BY 4 DESC
  
SELECT * FROM VISTA_PRODUCTOS;

CREATE OR REPLACE PROCEDURE USP_LISTARMARCASYPRODUCTOS(MARCA NCHAR,DATA1 OUT SYS_REFCURSOR,DATA2 OUT SYS_REFCURSOR)
IS
BEGIN
 OPEN DATA1 FOR 
 SELECT CODMAR "CODIGO",NOMMAR "MARCAS" FROM MARCAS;
 OPEN DATA2 FOR 
 SELECT P.CODPRO "CODIGO",P.NOMPRO "PRODUCTO",P.PRECIO "PRECIO",P.STOCK "STOCK"
 FROM PRODUCTOS P,MARCAS M
 WHERE P.CODMAR = M.CODMAR AND M.NOMMAR  = MARCA;
END;



VARIABLE CRS1 REFCURSOR;
VARIABLE CRS2 REFCURSOR;
EXEC USP_LISTARMARCASYPRODUCTOS('LAIVE',:CRS1,:CRS2);
PRINT CRS1
PRINT CRS2

/*
CREAR UN PROC ALMACENADO CON DOS CURSORES EL PIMER CURSOR DATA1 TENDRA EL CODIGO DE MARCA Y NOMBRE DE TODOS LOS PRODUCTOS
Y EL SEGUNDO TENRA QUE MOSTRAR EL CODIGO DE PRODUCTO NOMBRE PRECIO Y STOCK DE UNA DETERMINADA MARCA
*/


CREATE OR REPLACE FUNCTION GET_EMPS_IN_DEPT
  RETURN SYS_REFCURSOR
IS
  L_RET SYS_REFCURSOR;
BEGIN
  OPEN L_RET
   FOR SELECT *
         FROM EMPLEADOS;
  RETURN L_RET;
END;

VAR RC REFCURSOR;
EXEC :RC := GET_EMPS_IN_DEPT();
PRINT RC

/*
EL INTO PERMITE GUARDAR DATOS EN LA VARIABLE ASIGNADA
*/

CREATE OR REPLACE FUNCTION MOSTRARDISTRITO(CODIGO IN CHAR)
RETURN VARCHAR2
IS
NOM VARCHAR(30);
BEGIN
SELECT NOMDIS INTO NOM FROM DISTRITOS WHERE CODDIS =CODIGO;
RETURN NOM;
END MOSTRARDISTRITO;

-- FORMA DE EJECUTAR UN FUNCTION 1
 SELECT  MOSTRARDISTRITO('D004')  FROM DUAL;
-- FORMA DE EJECUTAR UN FUNCTION 2 
VARIABLE RC VARCHAR2(30);
EXEC :RC := MOSTRARDISTRITO('D004');
PRINT RC
----------------------------------------------------

CREATE OR REPLACE FUNCTION CANTIDADPRODUCTO(NOM IN CHAR)
RETURN NUMBER
IS
NUM NUMBER;
BEGIN
SELECT COUNT(CODPRO) INTO NUM 
FROM PRODUCTOS P,MARCAS M
WHERE P.CODMAR = M.CODMAR AND M.NOMMAR = NOM;
RETURN NUM;
END CANTIDADPRODUCTO;

VARIABLE CANTIDAD NUMBER;
EXEC :CANTIDAD :=  CANTIDADPRODUCTO('LAIVE');
PRINT CANTIDAD

DECLARE  
CANTIDAD NUMBER;
BEGIN
EXEC CANTIDAD :=  CANTIDADPRODUCTO('LAIVE');
END;


CREATE OR REPLACE FUNCTION FDU_EMPLEADOJOVEN
RETURN NUMBER
IS
EDAD NUMBER;
BEGIN
SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM FNAC) INTO EDAD 
FROM EMPLEADOS
WHERE FNAC = (SELECT MAX(FNAC) FROM EMPLEADOS);
RETURN EDAD;
END FDU_EMPLEADOJOVEN;

VARIABLE EDAD NUMBER;
EXEC :EDAD:=FDU_EMPLEADOJOVEN
PRINT EDAD

-- LISTA TIPO CURSOR
CREATE OR REPLACE FUNCTION LISTAEMPLEADOS
  RETURN SYS_REFCURSOR
AS
  MY_CURSOR SYS_REFCURSOR;
BEGIN
  OPEN MY_CURSOR FOR SELECT * FROM EMPLEADOS;
  RETURN MY_CURSOR;
END LISTAEMPLEADOS;

VARIABLE LISTA REFCURSOR;
EXEC :LISTA:=LISTAEMPLEADOS
PRINT LISTA
-- EMPLEADO MAYOR
CREATE OR REPLACE FUNCTION EMPLEADO_MAYOR
RETURN VARCHAR2
IS
NOMBRE  VARCHAR2(30);
BEGIN
SELECT NOMEMP || ' - ' || DNI INTO NOMBRE 
FROM EMPLEADOS
WHERE ROWNUM = 1 AND FNAC = (SELECT MIN(FNAC) FROM EMPLEADOS);
RETURN NOMBRE;
END EMPLEADO_MAYOR;

VARIABLE EMPLEADO VARCHAR2(30);
EXEC :EMPLEADO:= EMPLEADO_MAYOR
PRINT EMPLEADO

CREATE OR REPLACE FUNCTION MAYOR_EMP
RETURN VARCHAR2
IS
DATOS VARCHAR2(40);
BEGIN
SELECT DNI || ' - ' || NOMEMP INTO DATOS
FROM EMPLEADOS
WHERE FNAC = (SELECT MIN(FNAC) FROM EMPLEADOS);
RETURN DATOS;
END MAYOR_EMP;

VARIABLE EMPLEADO VARCHAR2(30);
EXEC :EMPLEADO:= MAYOR_EMP
PRINT EMPLEADO

SELECT MAYOR_EMP FROM DUAL

-- CREAR UNA FUNCTION QUE RETORNE EL PROMEDIO DE LOS PRODUCTOS DE UNA DETERMINADA MARCA


CREATE OR REPLACE FUNCTION PROMEDIO_PRODUCTOS(MARCA IN NCHAR)
RETURN NUMBER
IS
DATO NUMBER(10,2);
BEGIN
SELECT AVG(PRECIO)  INTO DATO 
FROM PRODUCTOS
WHERE CODMAR = (SELECT CODMAR FROM MARCAS WHERE NOMMAR = MARCA);
RETURN DATO;
END PROMEDIO_PRODUCTOS;

VARIABLE MARCA NUMBER(10,2);
EXEC :MARCA:= PROMEDIO_PRODUCTOS('LAIVE')
PRINT MARCA

-- CREAR UNA FUNCION QUE RETORNE EL NUMERO DE CLIENTES QUE TENGAN UNA DETERMINADA EDAD

CREATE OR REPLACE FUNCTION CANTIDAD_EDAD(EDAD IN NUMBER)
RETURN NUMBER
IS
CANTIDAD NUMBER;
BEGIN
SELECT COUNT(*) INTO CANTIDAD
FROM CLIENTES
WHERE  EXTRACT(YEAR FROM SYSDATE) -EXTRACT(YEAR FROM FNAC)  = EDAD;
RETURN CANTIDAD;
END CANTIDAD_EDAD;

VARIABLE EDAD NUMBER;
EXEC :EDAD:= CANTIDAD_EDAD(20)
PRINT EDAD

-- crear una function que resiva el codigo de un cliente y retorne su nombre ,dni,fnac y el nombre de distrito

CREATE  OR REPLACE FUNCTION DATOS_CLIENTES(COD IN NCHAR)
RETURN SYS_REFCURSOR -- CONOCIDO COMO DATATABLE.DATASET,RESULTSET
IS
CRS SYS_REFCURSOR;
BEGIN 
  OPEN CRS  FOR  SELECT CODCLI,NOMCLI,DNI,FNAC,D.NOMDIS
                                   FROM CLIENTES C,DISTRITOS D
                                  WHERE C.CODDIS = D.CODDIS AND CODCLI = COD;
RETURN CRS;
END;

VAR RC REFCURSOR;
EXEC :RC := DATOS_CLIENTES('C004');
PRINT RC

-- CREAR UNA FUNCTION QUE RETORNE EL NOMBRE Y PRECIO Y STOCK DE LOS 3 PRODUCTOS MAS CAROS
CREATE  OR REPLACE FUNCTION PRODUCTOS_CAROS
RETURN SYS_REFCURSOR -- CONOCIDO COMO DATATABLE.DATASET,RESULTSET
IS
CRS SYS_REFCURSOR;
BEGIN 
  OPEN CRS  FOR SELECT * FROM( SELECT codpro,nompro,precio,stock
                                   FROM productos  
                                   ORDER BY 3 DESC )                                 
                                  WHERE rownum <= 3;                          
RETURN CRS;
END;


VAR RC REFCURSOR;
EXEC :RC := PRODUCTOS_CAROS;
PRINT RC

/*
Bloques oracle
[ DECLARE
   <declaraciones>]
BEGIN
   <instrucciones>
[EXCEPTION
   <gesti�n de excepciones>]
END;
*/
SET SERVEROUTPUT ON
DECLARE 
  MENSAJE NVARCHAR2(40);
BEGIN
    MENSAJE:='MATOS SECCE VICTOR KEVIN';
    DBMS_OUTPUT.PUT_LINE(MENSAJE);
END;

-- crear una funcion que retorne los 3 productos mas caros de una determinada marca
-- crear una funcion que muestre el codigo del cliente,nombre,nombre distrito,edad, de todos los clientes que no vivan en un distrito y sean mayores a una edad determinada

CREATE  OR REPLACE FUNCTION CLIENTES_LISTA (DISTRITO IN NCHAR,EDAD IN  NUMBER )
RETURN SYS_REFCURSOR -- CONOCIDO COMO DATATABLE.DATASET,RESULTSET
IS
CRS SYS_REFCURSOR;
BEGIN 
  OPEN CRS  FOR  SELECT C.CODCLI "CODIGO",C.NOMCLI "NOMBRE",D.NOMDIS "DISTRITO",EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM C.FNAC) "EDAD"
                              FROM CLIENTES C INNER JOIN DISTRITOS D ON C.CODDIS = D.CODDIS
                              WHERE d.nomdis = DISTRITO AND EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM C.FNAC) > EDAD;               
RETURN CRS;
END;

VAR RC REFCURSOR;
EXEC :RC :=CLIENTES_LISTA('ANCON',19);
PRINT RC

  CREATE TABLE CLIENTES2(
  CODCLI CHAR(4) PRIMARY KEY,
  NOMCLI VARCHAR(30) NOT NULL,
  SALDO NUMBER(7,2) NOT NULL
  );

INSERT INTO CLIENTES2 VALUES ('C001','JUAN PEREZ',1200);

SELECT * FROM clientes2

CREATE TABLE AUDIT_CLIENTES2(
FECHA DATE NOT NULL,
CODCLI CHAR(4) NOT NULL,
NOMCLI VARCHAR(30) NOT NULL,
SALDO NUMBER(7,2) NOT NULL,
ESTADO VARCHAR(10) NOT NULL
);

/*
MS SQL
los datos nuevos se guarda en selected
los datos antiguos se guarda en deleted

ORACLE
los datos nuevos se guarda en new
los datos antiguos se guarda en old
*/


CREATE OR REPLACE TRIGGER MODIFICA_CLIENTE
AFTER UPDATE -- DESPUES ACTUALIZAR
 ON CLIENTES2-- SOBRE
 FOR EACH ROW 
 BEGIN
 INSERT INTO AUDIT_CLIENTES2 VALUES (SYSDATE,:OLD.CODCLI,:OLD.NOMCLI,:OLD.SALDO,'ANTIGUO');
 INSERT INTO AUDIT_CLIENTES2 VALUES (SYSDATE,:NEW.CODCLI,:NEW.NOMCLI,:NEW.SALDO,'NUEVO');
 END;

-- PROBANDO TRIGGER
UPDATE CLIENTES2 SET NOMCLI = 'ROSA LOPEZ',SALDO = 5600
WHERE CODCLI = 'C001';

SELECT * FROM CLIENTES2;
SELECT * FROM AUDIT_CLIENTES2;


SELECT * FROM  productos

-- CREAR UN TRIGGER QUE REGISTRE LAS ACTUALIZACIONES 
-- DEL PRECIO DE UN PRODUCTO CUANDO SE ACTUALIZE LA TABLA PRODUCTOS


CREATE TABLE PRODUCTOS2(
CODPRO CHAR(4) PRIMARY KEY,
NOMPRO VARCHAR(30) NOT NULL,
PRECIO NUMBER(7,2) NOT NULL
);

INSERT INTO PRODUCTOS2 VALUES ('P001','LECHE GLORIA',3.20);



CREATE TABLE HISTORIAL_PRECIOS(
FECHA DATE NOT NULL,
CODPRO CHAR(4) NULL,
NOMPRO VARCHAR(30) NOT NULL,
PRECIO NUMBER(7,2) NOT NULL,
ESTADO VARCHAR(20) NOT NULL
);

CREATE OR REPLACE TRIGGER MODIFICA_PRECIO
BEFORE UPDATE OF PRECIO -- ANTES DE ACTUALIZAR.
ON PRODUCTOS2
FOR EACH ROW
BEGIN
INSERT INTO HISTORIAL_PRECIOS VALUES (SYSDATE,:OLD.CODPRO,:OLD.NOMPRO,:OLD.PRECIO,'PRECIO ANTIGUO');
INSERT INTO HISTORIAL_PRECIOS VALUES (SYSDATE,:NEW.CODPRO,:NEW.NOMPRO,:NEW.PRECIO,'PRECIO NUEVO');
END;

SELECT * FROM productos2

-- PROBANDO EL TRIGGER
UPDATE PRODUCTOS2 SET NOMPRO = 'YOGURTX'
WHERE CODPRO = 'P001';

UPDATE PRODUCTOS2 SET PRECIO = 10.50  
WHERE CODPRO = 'P001' ;

SELECT * FROM PRODUCTOS2
SELECT * FROM HISTORIAL_PRECIOS

CREATE TABLE PRODUCTOS3 (
CODPRO CHAR(4) PRIMARY KEY,
NOMPRO VARCHAR(30),
PRECIO NUMBER(10,2),
STOCK NUMBER
);
INSERT INTO PRODUCTOS3 VALUES ('P001','LECHE GLORIA',3,50);
INSERT INTO PRODUCTOS3 VALUES ('P002','HUEVOS MADRID',6,20);
INSERT INTO PRODUCTOS3 VALUES ('P003','MANTEQUILLE BACA',4,60);

CREATE TABLE FACTURA_CABECERA (
CODFAC NCHAR(4) PRIMARY KEY,
FECHA DATE NOT NULL,
TOTAL NUMBER(7,2) NOT NULL
);
INSERT INTO factura_cabecera VALUES ('F001','21/08/15',0.00);

CREATE TABLE FACTURA_DETALLE (
CODFAC NCHAR(4) REFERENCES FACTURA_CABECERA (CODFAC),
CODPRO CHAR(4) REFERENCES PRODUCTOS3(CODPRO),
CANT NUMBER NOT NULL,
PRECIO NUMBER(7,2)
);

INSERT INTO FACTURA_CABECERA VALUES ('F001','21/09/15',0.0);
SELECT * FROM FACTURA_CABECERA 



/*
CREAR UN TRIGGER QUE PERMITA DISMINUIR EL STOCK DE PRODUCTOS Y ACTUALIZAR EL TOTAL DE UNA FACTURA
CABECERA CUANDO SE INSERTE UN NUEVO DETALLE EN LA TABLA FACTURA DETALLE
*/

CREATE OR REPLACE TRIGGER MODIFICAR_PRECIO
AFTER INSERT
ON FACTURA_DETALLE
FOR EACH ROW
BEGIN
  UPDATE PRODUCTOS3 SET STOCK = STOCK -  :NEW.CANT
  WHERE CODPRO = :NEW.CODPRO;
  UPDATE FACTURA_CABECERA SET TOTAL = TOTAL +(:NEW.PRECIO * :NEW.CANT)
  WHERE CODFAC = :NEW.CODFAC;  
END;


-- PROBAR TRIGGER
INSERT INTO FACTURA_DETALLE VALUES ('F001','P001',10,3);
INSERT INTO FACTURA_DETALLE VALUES ('F001','P001',20,3);

SELECT * FROM FACTURA_CABECERA;
SELECT * FROM PRODUCTOS3;

CREATE table Areas(
CODAREA CHAR(4) PRIMARY KEY,
NOMAREA VARCHAR2(30) NULL,
NUMEMP NUMBER(4) NULL
);

INSERT INTO AREAS VALUES ('A001','CONTABILIDAD',100);
INSERT INTO AREAS VALUES ('A002','LOGISTICA',200);
INSERT INTO AREAS VALUES ('A003','SISTEMAS',300);
INSERT INTO AREAS VALUES ('A004','VENTAS',400);

CREATE TABLE CARGOS(
CODCAR CHAR(4) PRIMARY KEY,
NOMCAR VARCHAR2(30) NULL,
NUMEMP NUMBER(4) NULL
);

INSERT INTO  CARGOS VALUES ('C001','GERENTE',105);
INSERT INTO  CARGOS VALUES ('C002','JEFE DE AREA',110);
INSERT INTO  CARGOS VALUES ('C003','SECRETARIA',115);
INSERT INTO  CARGOS VALUES ('C004','AUXILIAR',120);

create TABLE PERSONAL (
CODPER CHAR(4) PRIMARY KEY,
NOMPER VARCHAR2(30) NULL,
CODAREA CHAR(4) REFERENCES AREAS(CODAREA),
CODCAR CHAR(4) REFERENCES CARGOS(CODCAR),
SUELDO NUMBER(7,2)
);

INSERT INTO PERSONAL VALUES ('P001','VICTOR KEVIN','A001','C002',1500.50);
INSERT INTO PERSONAL VALUES ('P002','JULY ELIZABETH','A004','C003',1800.50);

/*
CREAR UN TRIGGER QUE ACTUALIZE EL NUMERO DE EMPLEADOS DE LAS TABLAS AREAS Y CARGOS EN LA TABLA RESUMEN DE PERSONAL CUANDO
SE INSERTE UN NUEVO EMPLEADO
*/

CREATE TABLE RESUMEN_PERSONAL (
TOTAL_EMP NUMBER(5),
TOTAL_A001 NUMBER(4),
TOTAL_A002 NUMBER(4),
TOTAL_A003 NUMBER(4),
TOTAL_A004 NUMBER(4)
);

insert into RESUMEN_PERSONAL values (10,10,10,10,10);
create or replace trigger inserta_persona
after insert
on PERSONAL
for each row
begin
      update areas set numemp = numemp + 1
      where codarea = :NEW.CODAREA;
      update cargos set numemp = numemp + 1
      where codcar = :new.codcar;
      update RESUMEN_PERSONAL set TOTAL_EMP = TOTAL_EMP + 1;
      
end;

insert into PERSONAL values ('P003','luis rios','A001','C002',4000)

select * from RESUMEN_PERSONAL 



/*
crear un trigger que actukize el numero de empleados cuando se modifique un personal
*/

