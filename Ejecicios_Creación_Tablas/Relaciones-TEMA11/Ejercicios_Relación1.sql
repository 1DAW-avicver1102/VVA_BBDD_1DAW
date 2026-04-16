UPDATE empleados
SET comision = IFNULL(comision, 0) + 100
WHERE emp_no IN (SELECT emp_no
		WHERE comision < 500);
		
SELECT *
FROM empleados;

-- EJERCICIO 2

CREATE TABLE clientes_producto_20 AS
SELECT c.cliente_no, c.nombre, p.unidades AS unidades_20
FROM clientes c
JOIN pedidos p ON c.cliente_no = p.cliente_no
WHERE p.producto_no = 20;

SELECT *
FROM clientes_producto_20;

-- EJERCICIO 3

UPDATE empleados
SET dep_no = (SELECT dep_no
	      FROM departamentos
	      WHERE dnombre = 'PRODUCCION')
WHERE dep_no = (SELECT dep_no
	      FROM departamentos
	      WHERE dnombre = 'INVESTIGACION');
	      
DELETE FROM departamentos
WHERE dnombre = 'InVESTIGACION';

-- EJERCICIO 4

update clientes c
set debe = 
    (SELECT sum(p.unidades * pr.precio_actual) 
    from pedidos p, productos pr
    where p.producto_no = pr.producto_no
    and p.cliente_no = c.cliente_no);


-- EJERCICIO 5

create view empleados_garrido
(empleado_no, apellido, salario_anual) as
(select emp_no, apellido, salario * 12
from empleados
where director =(select emp_no
		from empleados
		where apellido = 'GARRIDO')
		);
select *
from empleados_garrido;

-- EJERCICIO 6

Create view resumen_dep
(nombre_departamento, nº_empleados, suma_salarios, suma_comisiones) as
(select dnombre, count(emp_no), sum(salario), sum(ifnull(comision, 0))
from empleados e
LEFT join departamentos d
on d.dep_no = e.dep_no
group by d.dep_no, e.dep_no);

select *
from resumen_dep;
