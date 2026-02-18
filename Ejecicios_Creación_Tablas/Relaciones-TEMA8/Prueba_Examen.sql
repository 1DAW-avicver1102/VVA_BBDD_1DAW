CREATE DATABASE tienda_electronica;
USE tienda_electronica;

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT(9) NOT NULL,
	nombre VARCHAR(30),
	ciudad VARCHAR(15),
	edad INT(3),
	CONSTRAINT PK_clientes PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS productos (
	id_producto INT(9) NOT NULL,
	nombre VARCHAR(30),
	categoria VARCHAR(15),
	precio FLOAT(5, 2),
	CONSTRAINT PK_productores PRIMARY KEY(id_producto)
);

CREATE TABLE IF NOT EXISTS pedidos (
	id_pedido INT(9) NOT NULL,
	id_cliente INT(9),
	id_producto INT(9),
	cantidad INT(5),
	fecha DATE,
	CONSTRAINT PK_pedidos PRIMARY KEY(id_pedido),
	CONSTRAINT FK_clientes FOREIGN KEY(id_cliente)
	REFERENCES clientes(id_cliente),
	CONSTRAINT FK_productos FOREIGN KEY(id_producto)
	REFERENCES productos(id_producto)
);

INSERT INTO clientes
	VALUES(1, 'Francisco José Calvo', 'Sevilla', 45),
	(2, 'Francisco Platos', 'Galicia', 60),
	(3, 'Jorge el Salvaje', 'Cataluña', 42),
	(4, 'Jorge Floyd', 'Benalmádena', 50),
	(5, 'Ronald McNutt', 'Valladolid', 43);
	
INSERT INTO productos
	VALUES(1, 'Escopeta maquilladora', 'Accesorio', 99.99),
	(2, 'Portátil de Grefg', 'Portatil', 10.59),
	(3, 'Diente de Pereira', 'Accesorio', 20.99),
	(4, 'Móvil Orange de Agustín', 'Móvil', 109.35),
	(5, 'Johnsons Baby Oil', 'Accesorio', 5.99);

INSERT INTO pedidos
	VALUES(10, 1, 2, 4, '2004-03-11'),
	(20, 2, 5, 300, '2004-05-23'),
	(30, 1, 5, 4000, '1999-06-24'),
	(40, 4, 3, 30, '2020-05-25'),
	(50, 3, 2, 53, '2020-05-07'),
	(60, 5, 2, 304, '2024-07-13'),
	(70, 3, 5, 30, '2010-05-25'),
	(80, 2, 2, 30, '2025-02-11'),
	(90, 1, 4, 30, '2007-10-23');
	
SELECT *
FROM PEDIDOS
WHERE ciudad='Sevilla';