-- EJERCICIO 1

CREATE TABLE clientes_2
(SELECT cliente_no, nombre AS nombre_cliente, localidad AS localidad_cliente
FROM clientes);

SELECT *
FROM clientes_2;

-- EJERCICIO 2

SELECT *
FROM clientes_2
WHERE localidad_cliente = 'SEVILLA';

-- EJERCICIO 3

CREATE TABLE empleados_sin_comision
SELECT emp_no, apellido, dnombre
FROM empleados e, departamentos d
WHERE comision IS NULL
AND d.dep_no = e.dep_no;

SELECT *
FROM empleados_sin_comision;

-- EJERCICIO 4

INSERT INTO empleados_sin_comision (emp_no, apellido)
SELECT emp_no, apellido
FROM empleados
WHERE comision = 0;

SELECT * 
FROM empleados_sin_comision;

-- EJERCICIO 5

UPDATE productos
SET precio_actual = precio_actual + precio_actual*0.1
WHERE producto_no NOT IN (SELECT producto_no
			  FROM pedidos);
			  
SELECT *
FROM productos;

-- EJERCICIO 6

UPDATE empleados
SET salario = salario + 50
WHERE dep_no IN (SELECT dep_no
		FROM departamentos
		WHERE localidad = 'BARCELONA'
		OR localidad = 'MADRID');
		
SELECT * 
FROM departamentos
ORDER BY dep_no;
		
SELECT *
FROM empleados;

-- EJERCICIO 7

DELETE FROM clientes_2
WHERE cliente_no IN (SELECT cliente_no
		    FROM pedidos
		    WHERE producto_no IN (SELECT producto_no
					FROM productos
					WHERE descripcion = 'MESA MODELO UNION'));
					
SELECT * 
FROM clientes_2;

-- EJERCICIO 8

UPDATE empleados
SET salario = salario*1.1
WHERE emp_no IN (SELECT vendedor_no
		FROM clientes
		WHERE cliente_no IN (SELECT cliente_no
				    FROM pedidos
				    GROUP BY cliente_no
				    HAVING MAX(unidades)));
SELECT * FROM empleados;

-- EJERCICIO 9

CREATE VIEW emple_dep20 AS
(SELECT *
FROM empleados
WHERE dep_no = 20);

SELECT *
FROM emple_dep20;
-- EJERCICIO 10

