-- EJERCICIO 1

SELECT p.descripcion "Descripción", c.nombre "Nombre Cliente"
FROM productos p, pedidos pd, clientes c
WHERE p.producto_no = pd.producto_no
  AND pd.cliente_no = c.cliente_no
ORDER BY pd.cliente_no;

-- EJERCICIO 2

SELECT apellido "Apellido", d.dnombre "Nombre departamento"
FROM empleados e, departamentos d
WHERE d.dnombre != 'VENTAS'
AND e.fecha_alta > "1982-01-01"
AND e.dep_no = d.dep_no;

-- EJERCICIO 3

SELECT e.apellido, SUM(pr.precio_actual * pd.unidades) "Importe Acumulado"
FROM empleados e
JOIN clientes c ON c.vendedor_no = e.emp_no
JOIN pedidos pd ON pd.cliente_no = c.cliente_no
JOIN productos pr ON pr.producto_no = pd.producto_no
WHERE e.oficio = 'VENDEDOR' -- AÑADIDO A POSTERIORI
GROUP BY e.apellido;

/* EJERCICIO 4: Obtener los nombres de los empleados del departamento 30 que son
jefes directos de algún empleado de la empresa, indicando de cuantos empleados son jefes*/

SELECT e1.apellido "Apellido", COUNT(*) "Nº Empleados"
FROM empleados e1, empleados e2
WHERE e1.dep_no = 30
AND e1.emp_no = e2.director
GROUP BY e1.apellido;

/*EJERCICIO 5: Realizar un listado de los empleados cuyo oficio es EMPLEADO, que incluirá los números de
empleado, los apellidos y los salarios anuales, sabiendo que el salario anual es el salario multiplicado por 14,
e incluyendo en este listado el nombre del director de la empresa.*/

SELECT e1.apellido, e1.emp_no, SUM(e1.salario*14) AS salario_anual
FROM empleados e1, empleados e2
WHERE e1.oficio = 'EMPLEADO'
AND e1.emp_no = e2.emp_no
GROUP BY e1.emp_no, e2.apellido;

/*EJERCICIO 6: Visualizar los productos con el número total de pedidos, las unidades totales vendidas,
y el precio de unidad de cada uno de ellos incluyendo los que no tienen pedidos (en este caso se mostrará
un 0 en el total de unidades vendidas)*/

SELECT pr.producto_no, pr.descripcion, COUNT(p.pedido_no) "Total_pedidos", pr.precio_actual, SUM(IFNULL(unidades,0)) "Total_unidades"
FROM productos pr
LEFT JOIN pedidos p
ON p.producto_no = pr.producto_no
GROUP BY pr.producto_no;