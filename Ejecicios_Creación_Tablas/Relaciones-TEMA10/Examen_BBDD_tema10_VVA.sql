-- 1. Obtener el nombre de los productos cuyo precio sea mayor a 200 euros. 

SELECT nombre 'Nombre producto'
FROM articulos
WHERE precio > 200;

/* 2. Obtener todos los datos de los artículos cuyo precio esté entre los 60 euros y los 
120 euros (ambas cantidades incluidas).  */

SELECT *
FROM articulos
WHERE precio BETWEEN 60 AND 120;

/* 3. Obtener el nombre y el precio en euros y en pesetas (el precio en pesetas es el 
precio en euros multiplicado por 166,386).  */

SELECT nombre 'Nombre producto', precio 'Precio euros', precio*166.383 'Precio pesetas'
FROM articulos;

-- 4. Seleccionar el precio medio de todos los productos. 

SELECT AVG(precio) 'Precio medio'
FROM articulos;

-- 5. Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

SELECT AVG(precio) 'Precio medio - Código 2'
FROM articulos
WHERE codigo = 2;

-- 6. Obtener el número de artículos cuyo precio sea mayor o igual a 180 euros.

SELECT COUNT(*) 'Nº Artículos'
FROM articulos
WHERE precio >= 180;

/* 7. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 
180€ ordenados descendentemente por precio y luego ascendentemente por 
nombre.  */

SELECT nombre, precio
FROM articulos
WHERE precio > 180
ORDER BY precio DESC;

SELECT nombre, precio
FROM articulos
WHERE precio > 180
ORDER BY precio ASC;

/* 8. Obtener un listado completo de artículos, incluyendo por cada artículo los 
datos del artículo y de su fabricante.  */

SELECT a.*, f.*
FROM articulos a 
JOIN fabricantes f ON f.codigo = a.fabricante;

/* 9. Listar los nombres de los fabricantes que no tienen ningún artículo registrado 
en la tienda.  */

SELECT nombre
FROM fabricantes
WHERE codigo NOT IN (SELECT fabricante
		     FROM articulos);

/* 10.Obtener el precio medio de los productos de cada fabricante,  mostrando el 
código del fabricante, el nombre y el precio medio.  */

SELECT f.codigo 'Codigo fabricante', f.nombre 'Nombre fabricante', AVG(precio) 'Precio medio'
FROM articulos a
JOIN fabricantes f ON a.fabricante = f.codigo
GROUP BY fabricante;

/* 11.Obtener el nombre y el precio de los artículos cuyo nombre contenga la 
palabra 'Monitor' y cuyo precio sea inferior a la media de todos los artículos.   */

SELECT nombre, precio
FROM articulos
WHERE nombre LIKE '%Monitor%'
AND precio < ANY (SELECT AVG(precio)
		  FROM articulos);

/* 12. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio 
medio sea mayor o igual a 150 euros.  */

SELECT nombre
FROM fabricantes
WHERE codigo IN (SELECT fabricante
		 FROM articulos
		 GROUP BY codigo
		 HAVING AVG(precio) < 150);

/* 13. Obtener el nombre, precio y nombre del fabricante del artículo más barato.  */

SELECT a.nombre, a.precio, f.nombre
FROM articulos a
JOIN fabricantes f ON a.fabricante = f.codigo
ORDER BY precio ASC
LIMIT 1;

/* 14. Obtener una lista con el nombre y precio de los artículos más caros de cada 
proveedor (incluyendo el nombre del proveedor)  */

SELECT a.nombre, precio, f.nombre
FROM articulos a
JOIN fabricantes f ON f.codigo = a.fabricante
WHERE precio IN (SELECT MAX(precio)
		 FROM articulos
		 GROUP BY fabricante)
ORDER BY a.precio DESC;

/* 15.Nombres de los fabricantes cuyos artículos tienen todos un precio superior a 
la media de todos los productos de la tienda.  */

SELECT nombre
FROM fabricantes
WHERE codigo IN (SELECT fabricante
		FROM articulos
		WHERE precio > (SELECT AVG(precio)
				FROM articulos));

/* 16. Mostrar el nombre de cada fabricante y la suma total de los precios de todos 
sus artículos, pero solo para aquellos fabricantes cuyo nombre tenga 
exactamente 4 caracteres.   */

SELECT f.nombre, SUM(precio) AS 'Total precios'
FROM fabricantes f
JOIN articulos a ON f.codigo = a.fabricante
WHERE LENGTH(f.nombre) = 4
GROUP BY f.nombre;

/* 17. Listar los nombres de los fabricantes que tienen al menos dos artículos 
diferentes registrados con el mismo precio. */

SELECT f.nombre
FROM articulos a1
JOIN fabricantes f ON f.codigo = a1.fabricante
WHERE f.codigo IN (SELECT fabricante
		FROM articulos a2
		WHERE a1.nombre <> a2.nombre
		AND a1.precio = a2.precio)
GROUP BY f.nombre;

/* 18.Obtener el nombre del fabricante, el nombre de su artículo más caro y su 
precio, pero solo si ese precio es superior a la media global. */

SELECT f.nombre, a.nombre, a.precio
FROM fabricantes f
JOIN articulos a ON f.codigo = a.fabricante
WHERE precio IN (SELECT MAX(precio)
		FROM articulos
		GROUP BY fabricante)
AND precio > (SELECT AVG(precio)
	      FROM articulos);

/* 19.Seleccionar los nombres de fabricantes que fabrican algún producto de más de 
100 euros y que tienen un catálogo de más de 2 artículos  */

SELECT nombre
FROM fabricantes
WHERE codigo IN (SELECT fabricante
		FROM articulos
		WHERE precio > 100
		GROUP BY fabricante
		HAVING COUNT(*) > 2);

/* 20. Para cada fabricante con más de un producto, obtener su nombre y  la 
diferencia de precio entre su artículo más caro y el más barato. */

SELECT f.nombre, (MAX(precio) - MIN(precio)) 'Diferencia precio'
FROM articulos a
JOIN fabricantes f ON f.codigo = a.fabricante
WHERE f.codigo IN (SELECT fabricante
		  FROM articulos
		  GROUP BY fabricante
		  HAVING COUNT(*) > 1)
GROUP BY fabricante;