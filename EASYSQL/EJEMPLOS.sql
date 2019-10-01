/*
 ___ _   _ ____ ___ ____ _____ 
|_ _| \ | |  _ \_ _/ ___| ____|
 | ||  \| | | | | | |   |  _|  
 | || |\  | |_| | | |___| |___ 
|___|_| \_|____/___\____|_____|

CTRL + F
++::::::::::::::::::::::::::::::::::::::::::::::::::::::::++
::        -INDICE -------------------------@0.            ::                                                
::        -SENTENCIAS -------------------- @1.            :: 
::            °DESC ------------------------- @1,1        ::        
::            °SELECT ----------------------- @1,2        ::
::            °DUAL ------------------------- @1,3        ::   
::        -CLAUSULAS --------------------- @2.            ::                                
::            °WHERE ------------------------ @2,1        ::       
::                *OOPERADORES -------------- @2,1,1      ::
::            °ORDERBY ---------------------- @2,3        ::
::        -FUNCIONES --------------------- @3.            ::  
::            °CONCAT ----------------------- @3,1        ::
::            °SUBSRT ----------------------- @3,2        ::
::            °INTSTR ----------------------- @3,3        ::
::            °LEGHT ------------------------ @3,4        ::
::            °LOWER ------------------------ @3,5        ::
::            °LPAD/RPAD -------------------- @3,6        ::
::            °REPLACE  --------------------- @3,7        ::
::            °ARITMETICA ------------------- @3,8        ::
::            °TO CHAR ---------------------- @3,9        ::
::            °TO_DATE ---------------------- @3,10       ::
::            °FECHAS  ---------------------- @3,11       ::
::            °DATOS NULL ------------------- @3,12       ::
::            °ADICIONALES ------------------ @3,13       ::
::                                                        ::
::                                                        ::
______________________________________________________________________________________________________________________________
@1.
 ___ ___ ._ _ _| |_ ___ ._ _  ___ <_> ___  ___
<_-</ ._>| ' | | | / ._>| ' |/ | '| |<_> |<_-<
/__/\___.|_|_| |_| \___.|_|_|\_|_.|_|<___|/__/

_______________________________________________________________________________________________________________________________
@1,1 
 ____ ____ ____ ____ 
||D |||E |||S |||C ||
||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|
PERMITE DESCRIBIR LA TABLA DE FORMA DECENDENTE */

DESC jobs;
--------------------------------------------------------------------------------------------------------------------------------
/*
@1,2
 ____ ____ ____ ____ ____ ____ 
||S |||E |||L |||E |||C |||T ||
||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|
PERMITE OBTENER DATOS DE TABLAS QUE ESTEN ALMACENADO EN LA DB)*/

--selecionar todas las columnas de la tabla jobs
SELECT * FROM jobs;
--selec columnas job y min de la tabla jobs
SELECT job_id, min_salary FROM jobs;
--  selec columna con alias con minuscula job y alias min_salaray
SELECT job_id AS "job", min_salary as min_salaray 
FROM jobs;
-- selc columna DEPARTMENT de la tabla de empleados  
DESC employees;
SELECT DEPARTMENT_ID FROM employees;
--selec distintos a la colum de la tabla empleados
SELECT DISTINCT department_id from employees;
--selec distintos a 2 columnas de la tabla empleados
SELECT DISTINCT department_id, job_id FROM employees;
-------------------------------------------------------------------------------------------------------------------------
/*
@1,3
TABLA DUAL 
PERMITE REALIZAR OPERACIONES ARITMETICAS Y CONCATENACION DE CADENAS
*/

-- mostrar tabla dual 
SELECT * FROM dual;
-- selec multiplicacion
SELECT 3*4 FROM dual;
-- escribir 
SELECT 'HOLA MUNDO' FROM dual;
-- mostrar fecha
SELECT SYSDATE FROM dual;
-- verificar usuario
SELECT USER FROM dual;
-- concatenar 
SELECT 'esta es una cadena' || ' ' || 'otra cadena de prueba'
FROM dual;
-- mostrar alias usuario concatenado con alias dia de hoy y nombrar la columna encabezado 
SELECT ('usuario: ' || USER || ', el dia de hoy es : ' || SYSDATE) AS "encabezado"
FROM dual;
--
SELECT ('I''M ' || USER) AS "quien es?" 
FROM dual;

/*

---------------------------------------------------------------------------------------------------------------------------
 @2.
 ___  _    ___  _ _  ___  _ _  _    ___  ___ 
|  _>| |  | . || | |/ __>| | || |  | . |/ __>
| <__| |_ |   || ' |\__ \| ' || |_ |   |\__ \
`___/|___||_|_|`___'<___/`___'|___||_|_|<___/

_____________________________________________________________________________________________________________________________ 
@2,1
 ____ ____ ____ ____ ____ 
||W |||H |||E |||R |||E ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
SE UTILIZA PARA SELECCIONAR AQUELLOS REGISTROS QUE CUMPLEN UNA O MÁS CONDICIONES
SELECCIONA AQUELLAS FILAS QUE CUMPLEN LA CONDICIÓN ESPECIFICADA POR ESTA ORDEN. 
LA CONDICIÓN DE BÚSQUEDA O DE SELECCIÓN DE REGISTROS SE PUEDE CONFORMAR UTILIZANDO COLUMNAS DE LA TABLA, 
CONSTANTES, FUNCIONES Y/O EXPRESIONES Y OPERADORES. 
@2,1,1 
----------------------+-------------------------------------------------------------------------------------+
OPERADORES            +  DEFINICION                                                                         +
----------------------+-------------------------------------------------------------------------------------+
=, !=, <>	          +  Igual a, distinto de, distinto de                                                  +                        
----------------------+-------------------------------------------------------------------------------------+
>, >=, <, <=	      +  Mayor que, Mayor o igual que, menor que, menor o igual que                         +
----------------------+-------------------------------------------------------------------------------------+
BETWEEN … AND …	  +  Chequea un rango incluyendo los dos valores                                        +
----------------------+-------------------------------------------------------------------------------------+
LIKE	              +  Compara una cadena de caracteres con un patrón o formato                           +    
----------------------+-------------------------------------------------------------------------------------+
IN ( ), NOT IN ( )	  +  Comprueba que un campo o expresión tenga valores o no en un conjunto de valores    +
----------------------+-------------------------------------------------------------------------------------+
IS NULL, IS NOT NULL  +	Comprueba que un campo o expresión sea nula o no                                    +
----------------------+-------------------------------------------------------------------------------------+
*/

-- seleccionar columnas concatenadas de la tabla empleados y filtrar solo los que tengan de id 90
SELECT first_name || ' ' || last_name "name", department_id 
FROM employees
WHERE department_id = 90;
-- selec la columna depart_ de la tabla departments y filtrar por departamentos con id 90
SELECT department_name
FROM departments
WHERE department_id = 90;
--
desc job_history;
-- selec todas las colum de job_ y filtrar sus job_id por ac_acc
SELECT * FROM job_history
WHERE job_id = 'AC_ACCOUNT';
-- selec todas las columnas de la tabla countries y filtrar por region 4
SELECT * FROM countries
WHERE region_id= 4;
--
DESC regions;
-- selec la colum reg_name de la tabla regiones y filtrar todas las regiones igual a 4
SELECT region_name
FROM regions
WHERE region_id = 4;

--
desc employees;
-- selec colum concatenadas first_ las_ comm de la tabla empleados y filtrar las comm_pct que sea mayor o = que .35
SELECT first_name || ' ' || last_name "name", COMMISSION_PCT 
FROM employees
WHERE COMMISSION_PCT >= .35; 

/* IN Definir LISTA de valores a comparar */

-- selec colum concatenadas first_name  last_name department_id de la tabla employees 
-- y filtrar los department_id muestre solo los valores (10, 20, 50)
SELECT first_name || ' ' || last_name "name", department_id 
    FROM employees
    WHERE department_id IN (10, 20, 50);

/*NOT niega los valores dados */
-- select colum first_name, last_name de la tabla employees  y no mostrar valores mayores o igual que 30
SELECT first_name, last_name 
   FROM employees 
   WHERE NOT (department_id >= 30);
   
/*AND indicar verdadero si las 2 se cumplen */

-- selc a colum first_name, salary  de la tabla empleados y filtrar apellido smith y que cumpla la condicion de salario de 7500
SELECT first_name, salary 
   FROM employees 
   WHERE last_name = 'Smith' AND salary > 7500; 

/* OR indicar verdadero si 1 de las 2 se cumple */  

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Kelly' or last_name = 'Smith';

/*BETWEEN verificar si un operador se encuentra en un rango valido*/

SELECT first_name, last_name, salary 
   FROM employees WHERE salary BETWEEN 5000 AND 6000;

/*LIKE compara caracteres*/

SELECT first_name, last_name 
   FROM employees WHERE first_name LIKE 'Su%';
   
SELECT first_name, last_name 
   FROM employees WHERE first_name LIKE 'O%';
   
SELECT first_name, last_name 
   FROM employees WHERE first_name LIKE 'A%t';
   
 SELECT first_name, last_name 
   FROM employees WHERE first_name LIKE '%m%';
   
/* NULL */

-- selec nombre y apellido de la tabla employees y filtrar a todos los departamentos que son nulos
SELECT (first_name || ' ' || last_name) as name_apellido
   FROM employees WHERE department_id IS NULL;

SELECT first_name, last_name 
   FROM employees WHERE department_id IS NOT NULL;   

/* 
______________________________________________________________________________________________________________________________
@2,2
 ____ ____ ____ ____ ____ ____ ____ 
||O |||R |||D |||E |||R |||B |||Y ||
||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
ORDENA LOS RESULTADOS DE LA CLAUSULA SELECT
*/

-- selecionar todos los datos de la tabla countries y ordenar por la region y nombres;
SELECT * FROM countries
ORDER BY region_id, country_name;
-- selec la colum primer nombre de la tabla empleados y filtrar solo los empleados 
--con departamento id = a 90 ordenandolos por su apellido 
SELECT first_name
   FROM employees 
   WHERE department_id = 90
   ORDER BY last_name;
--selecionar el primer nombre de la tabla empleados y ordenar el apellido de forma descendente y el primero ascendente
SELECT first_name
   FROM employees 
   ORDER BY last_name DESC, first_name ASC;
--selec nombre,alquiler,salario y mid de la tabla empleados y mostrar solo los empleados con departamento en 110 y 100 
-- ordenandolos primero por mid, fecha alquiler y salario
SELECT first_name, hire_date, salary, manager_id mid, 
   FROM employees
   WHERE department_id IN (110, 100)
   Order By 4, 2, 3;
--
SELECT last_name, commission_pct
  FROM employees where last_name LIKE 'R%'
  order by commission_pct ASC, last_name DESC;  
  
-----------------------------------------------------------------------------------------------------------------------
 /*
 @3.
 ___  _ _  _ _  ___  _  ___  _ _  ___  ___ 
| __>| | || \ ||  _>| || . || \ || __>/ __>
| _> | ' ||   || <__| || | ||   || _> \__ \
|_|  `___'|_\_|`___/|_|`___'|_\_||___><___/

_____________________________________________________________________________________________________________________________
@3,1 
 ____ ____ ____ ____ ____ ____ 
||C |||O |||N |||C |||A |||T ||
||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|
CONCATENA 2 CADENAS Y FORMA UNA TERCERA

*/

--
SELECT 'Esta es una cadena' || ' otra cadena' FROM dual;

--CONCAT (X, Y)
SELECT CONCAT('Esta es una cadena', ' otra cadena') AS "lacadena" FROM dual; 
SELECT CONCAT (CONCAT('UNO', ' DOS'), ' TRES') FROM dual;
-- 
SELECT CONCAT (CONCAT(first_name, ' '), last_name) employee_name,
    first_name || ' ' || last_name as employee_name_2
    FROM employees
    WHERE department_id = 30;
--

/*
 
 --------------------------------------------------------------------------------------------------------------
@3,2
 ____ ____ ____ ____ ____ ____ 
||S |||U |||B |||S |||T |||R ||
||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|
PERMITE DEVOLVER UNA SUBCADENA DE UNA CADENA MAS GRANDE

*/
-- Recibe argumento de tipo (cadena), numero (x) y posicion [opcional]
-- SUBSTR(C1, X, [,Y])
SELECT SUBSTR ('CADENA MUY LARGA DE EJEMPLO', 10, 7) FROM DUAL;
-- 9992 comienza la cadena en el caracter n3=(9) y n2=(9)
SELECT SUBSTR (10000 - 8, 3, 2) FROM DUAL;
-- dd/mm/yy 
SELECT SYSDATE,SUBSTR(SYSDATE, 4, 3) FROM DUAL;
--
SELECT SUBSTR('1#3#5#6#7#9', 5) FROM dual;
--
SELECT SUBSTR('1#3#5#6#7#9', 2, 6) FROM dual;
--
SELECT 'Nombre: ' || SUBSTR(first_name, 1, 1)
    || '. ' || last_name "Nombre"
    FROM employees
    WHERE SUBSTR(job_id, 1, 2) = 'AD';   

-- ACORTAR CADENA DE LOS FILES_NAME 
 
SELECT file_name
FROM dba_data_files;
-- INSTR Mostrara el numero c de la posicion principal de \ = 3 
SELECT INSTR(file_name), '\'), file_name
FROM dba_data_files;
-- INSTR Mostrara el numero c de la ultima posicion(-1) de \ = 20 
SELECT INSTR(file_name), '\', -1), file_name
FROM dba_data_files;
-- substr se pocionara en la ultima posicion c = 20 y acortar desde esa posicion(+1) 
select substr(file_name, instr(file_name, '\', -1) + 1)
from dba_data_files;

/*
---------------------------------------------------------------------------------------------------------------------- _
 @3,3
 ___ ____ ____ ____ ____ 
||I |||N |||S |||T |||R ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
PERMITE ENCONTRAR UN CARACTER DENTRO DE UNA CADENA, 
ESPECIFICA UN INICIO DE BUSQUEDA Y OCURRENCIA QUE SE QUIERA ENCONTRAR

*/

-- INSTR (c1, c2)
-- 
SELECT INSTR('Hola mundo', 'm') FROM dual;
--
SELECT INSTR('oTRA CADENA', 'NO EXISTE') FROM dual;
--
SELECT SYSDATE, INSTR(SYSDATE, '15') FROM dual;
--INSTR muestra el numero c (#) en su primera posicion
SELECT INSTR('1#3#5#7#9#', '#') 
FROM dual;
--INSTR muestra el numero c (#) en la posicion de c (5) 
SELECT INSTR('1#3#5#7#9#', '#', 5)
FROM dual;
-- INSTR muestra el numero c (#) recorriendo el c (3) y c (4)
SELECT INSTR('1#3#5#7#9#', '#', 3, 4)
FROM dual;
--el nombre del departamento tiene que tener la palabra (on) en la segunda posicion
SELECT * FROM departments
where INSTR(department_name, 'on') = 2; 

/*

------------------------------------------------------------------------------------------------------------------------
 @3,4
 ___ ____ ____ ____ ____ 
||L |||E |||D |||T |||H ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
MUESTRA LA LONGITUD DE UNA CADENA
*/

-- LENGHT (c)
SELECT LENGTH('esta es una cadena') 
FROM dual;
--
SELECT LENGTH('1 + 2 = ' || 3) 
FROM dual;
--DD/MM/YY=8
SELECT LENGTH(SYSDATE) 
FROM dual;
-- leght filtra todos los nombre paises con logitud menor a 10 
SELECT *
FROM countries
where LENGTH(country_name) <= 10;
------------------------------------------------------------------------------------------------------------------
/*
@3,5
____ ____ ____ ____ ____ 
||L |||O |||W |||E |||R ||
||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|
CONVIERTE UNA CADENA DE MINUSCULA a MAYUSCULA

*/
--
SELECT LOWER('hOla mUndo')
FROM dual;
--
SELECT LOWER(30+50)
FROM dual;
--
SELECT lower ('La suma ' || ' 10 + 10 ' || '=' || ' 20') 
FROM dual;
--
SELECT first_name, last_name, LOWER(last_name)
   FROM employees 
   WHERE LOWER(last_name) LIKE '%ur%';
----------------------------------------------------------------------------------------------------------------------------   
 /*
 @3,6
  ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||L |||P |||A |||D |||Y |||R |||P |||A |||D ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
RELLENA CADENAS HASTA UNA LOGITUD FIJA

*/

--LPAD(c, i[, c2]) 
SELECT LPAD('cadena', 10), RPAD('cadena', 10) FROM dual;
--
SELECT LPAD('aaaaa', 15, '*'), RPAD('aaaaa', 15, '*') FROM dual;
-- LPAD rellena a la izquierda con (15) caracteres y el resto con -?
-- RPAD rellena a la derecha  con (15) caracteres y el resto con -?
SELECT LPAD(SYSDATE, 14, '-?'), RPAD(SYSDATE, 15, '-?') FROM dual;
--
SELECT LPAD(last_name, 10) lpad_name,   
    LPAD(salary, 8, '*') lpad_salary
FROM employees
WHERE last_name LIKE 'J%';
------------------------------------------------------------------------------------------------------------------
/*
@3,7
 ____ ____ ____ ____ ____ ____ ____ 
||R |||E |||P |||L |||A |||C |||E ||
||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
PERMITE REEMPLAZAR UNA CADENA DENTRO DE OTRA
*/

--REPLACE(C1, C2[,C3])
--busca down(c2) en la primera cadena(C1) y la remmplaza por up(C3)
SELECT REPLACE('downtown', 'down', 'up')
FROM DUAL;
--busca down(C2) en la primera cadena(C1) y la remmplaza en blanco(C3)
SELECT REPLACE('downtown', 'down', '')
FROM DUAL;
-- se hace la operacion  9997(C1), y todos los numeros 9(C2) se reeplazan por 85(C3)
SELECT REPLACE(1000 - 3, '9', '85') 
FROM DUAL;
--
SELECT REPLACE(SYSDATE, '01', '08')
FROM dual;
--muestra el salario de la tabla empleados filtrando por SA_MAN y reemplaza 0(C2) por mas 0000(C3)
select last_name, salary, replace(salary, '0', '000') "salario soñado"
  FROM employees
  where job_id = 'SA_MAN';
  
/*
-------------------------------------------------------------------------------------------------------------------------
@3,8
 ___ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||A |||R |||I |||T |||M |||E |||T |||I |||C |||A |||S ||
||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
FUNCIONES MATEMATICAS

*/

--ABS(n)
--VALOR ABSOLUTO 
SELECT ABS(-52) negative, ABS(52) positive, ABS(0) zero
FROM dual;
--ACOS(n), ASIN(n), ATAN(n), COS(n), SIN(n), TAN(n)
-- trigonometrica ARCOSENO
SELECT ACOS(-1), acos(0) , acos(.045)
FROM dual;
--CEIL(n)
--Aproxima regresa el entero mas que pequeño que sea >= que (n)
SELECT CEIL(9.8), CEIL(-32.85), CEIL(0), CEIL(5)
FROM dual;
-- EXP(n)
--EXPONENCIAL 
SELECT EXP(1) "e" FROM dual;
-- FLOOR(n)
--Aproxima regresa el entero mas que pequeño que sea <= que (n)
SELECT FLOOR(9.8), FLOOR(-32.85), FLOOR(137)
FROM dual;
-- LN(n)
--LOG NATURAL
SELECT LN(2.7) FROM dual;
--POWER(n1, n2)
--regresa n1 elevado a la potencia n2
SELECT POWER(2, 10), POWER(3, 3), POWER(5,3), POWER(2, -3)
FROM dual;
-- SIGN(n)
-- devuelve el indicativo del signo si (+) , (-) o (0)
SELECT sign(2, 3), sign(0), POWER(47) 
FROM dual;

----------------------------------------------------------------------------------------------------------------------------
/*
@3,9
 ____ ____ _________ ____ ____ ____ ____ 
||T |||O |||       |||C |||H |||A |||R ||
||__|||__|||_______|||__|||__|||__|||__||
|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|
CONVIERTE DATOS DE OTROS TIPOS EN CARACTERES


*/

--TO_CHAR(expr[, fmt[, nlsparam]])
--
SELECT TO_CHAR('10') FROM DUAL;
--
SELECT TO_CHAR(000001, '0999999999') FROM DUAL;
--
SELECT job_title, max_salary, to_char(max_salary, '$99,999.99'),
    to_char(max_salary, '$99,999.99')
    FROM jobs
    WHERE UPPER(job_title) LIKE '%PRESIDENT%';