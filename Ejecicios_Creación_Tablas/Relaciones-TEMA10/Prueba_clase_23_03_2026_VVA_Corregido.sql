-- NOTA FINAL: 8,5 (12/14) (He fallado la 5.1 y la 6.1)

/*BLOQUE 1*/

-- EJERCICIO 1: BIEN

SELECT e.emp_no, e.apellido, d.dnombre, d.localidad
FROM empleados e, departamentos d;

-- EJERCICIO 2: BIEN

SELECT e.emp_no, e.apellido, e.dep_no
FROM empleados e JOIN departamentos d
WHERE e.dep_no = d.dep_no;

/*BLOQUE 2*/

-- EJERCICIO 1: BIEN

SELECT d.dnombre, e.dep_no
FROM empleados e, departamentos d
WHERE d.dep_no = e.dep_no;

-- EJERCICIO 2: BIEN

SELECT e.emp_no, e.apellido, d.dnombre, d.localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

/*BLOQUE 3*/

-- EJERCICIO 1: BIEN

SELECT e.emp_no, e.apellido, d.dnombre
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no
AND d.dnombre != 'VENTAS';

-- EJERCICIO 2: BIEN

SELECT e.*
FROM empleados e, departamentos d
WHERE e.dep_no > d.dep_no
AND d.dnombre = 'CONTABILIDAD';

-- EJERCICIO 3: BIEN (El de los apuntes está mal)

SELECT e.*
FROM empleados e, departamentos d
WHERE e.dep_no < d.dep_no
AND d.localidad = 'BARCELONA';

/* BLOQUE 4 */

-- EJERCICIO 1: BIEN

SELECT e1.apellido, e2.apellido "Director"
FROM empleados e1 JOIN empleados e2
WHERE e2.emp_no = e1.director;

-- EJERCICIO 2: BIEN

SELECT e1.apellido, e2.apellido "Director"
FROM empleados e1 JOIN empleados e2
WHERE e2.emp_no = e1.director
AND e1.oficio = 'VENDEDOR';

/* BLOQUE 5 */

-- EJERCICIO 1: MAL

SELECT *
FROM empleados e
RIGHT JOIN departamentos d
ON e.dep_no = d.dep_no;

-- EJERCICIO 2: BIEN

SELECT d.dnombre, d.localidad, COUNT(e.emp_no) "Nº de empleados"
FROM empleados e
RIGHT JOIN departamentos d
ON e.dep_no = d.dep_no
GROUP BY d.dep_no;

-- EJERCICIO 3: BIEN

SELECT e1.emp_no, e2.apellido "Director", e1.apellido, e1.oficio 
FROM empleados e1
LEFT JOIN empleados e2
ON e1.director = e2.emp_no;

/* BLOQUE 6 */

-- EJERCICIO 1: MAL

SELECT e1.apellido, e1.oficio
FROM empleados e1
WHERE e1.dep_no IN (SELECT dep_no
		    FROM departamentos
		    WHERE dnombre = 'INVESTIGACION');
-- EJERCICIO 2: BIEN

SELECT e.apellido, e.oficio, d.localidad
FROM empleados e
JOIN departamentos d
WHERE e.dep_no = d.dep_no
AND d.dnombre = 'INVESTIGACION';