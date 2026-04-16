-- EJERCICIO 1

SELECT emp_no "Nº EMPLEADO", apellido "APELLIDO",
	dnombre "NOMBRE DEPARTAMENTO", localidad "LOCALIDAD"
FROM empleados e, departamentos d;

-- DETAL MICK

SELECT emp_no "Nº EMPLEADO", apellido "APELLIDO",
	dnombre "NOMBRE DEPARTAMENTO", localidad "LOCALIDAD"
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

SELECT DISTINCT e.dep_no "Nº DEPARTAMENTO",
	d.dnombre "NOMBRE DEPARTAMENTO"
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

SELECT emp_no "Nº EMPLEADO", apellido "APELLIDO"
FROM empleados e, departamentos d
WHERE d.dnombre = 'VENTAS'
AND e.dep_no != d.dep_no;

SELECT e.emp_no "NºEMPLEADO", e.apellido "APELLIDO", d.dnombre "NOMBRE DEPARTAMENTO"
FROM empleados e, departamentos d
WHERE d.dnombre = 'CONTABILIDAD'
AND e.dep_no > d.dep_no;

SELECT e.emp_no "NºEMPLEADO", e.apellido "APELLIDO", d.localidad "LOCALIDAD"
FROM empleados e, departamentos d
WHERE d.localidad = 'BARCELONA'
AND e.dep_no > d.dep_no;

SELECT e1.emp_no "NºEMPLEADO", e1.apellido "APELLIDO EMPLEADO",
e1.director "DIRECTOR", e2.apellido "APELLIDO DIRECTOR"
FROM empleados e1, empleados e2
WHERE e1.director = e2.emp_no;
