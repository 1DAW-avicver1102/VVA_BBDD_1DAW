CREATE DATABASE IF NOT EXISTS tienda2;

USE tienda2;

-- Creo la tabla "compradores_1":

CREATE TABLE IF NOT EXISTS compradores_1 (
	cif_comprador CHAR(11),
	nombre_social VARCHAR(30),
	domicilio_social VARCHAR(30),
	localidad VARCHAR(30),
	c_postal INT(5),
	telefono INT(9)
	);
	
-- Creo la tabla "articulos_1"

CREATE TABLE IF NOT EXISTS articulos_1 (
	referencia_articulo VARCHAR(12),
	descripcion_articulo VARCHAR(30),
	precio_unidad FLOAT(6, 2),
	iva INT(2),
	existencias_actuales INT(5)
	);
	
-- Creo la tabla "facturas_1":

CREATE TABLE IF NOT EXISTS facturas_1 (
	factura_no INT(6),
	fecha_factura DATE,
	cif_cliente CHAR(11)
	);
	
-- Creo la tabla "lineas_factura_1":

CREATE TABLE IF NOT EXISTS lineas_factura_1 (
	factura_no INT(6),
	referencia_factura VARCHAR(12),
	unidades INT(3)
	);
	
-- Creo la tabla "compradores_2" 

CREATE TABLE IF NOT EXISTS compradores_2 (
	cif_comprador CHAR(11) PRIMARY KEY,
	nombre_social VARCHAR(30) UNIQUE,
	domicilio_social VARCHAR(30),
	localidad VARCHAR(30),
	c_postal INT(5),
	telefono INT(9) NOT NULL
	);
	
-- Creo la tabla "articulos_2":

CREATE TABLE IF NOT EXISTS articulos_2 (
	referencia_articulo VARCHAR(12) PRIMARY KEY,
	descripcion_articulo VARCHAR(30),
	precio_unidad FLOAT(6, 2),
	iva INT(2),
	existencias_actuales INT(5) DEFAULT '0',
		CHECK(iva BETWEEN 5 AND 25)
	);

-- Creo la tabla "facturas_2":

CREATE TABLE IF NOT EXISTS facturas_2 (
	factura_no INT(6) PRIMARY KEY,
	fecha_factura DATE,
	cif_cliente CHAR(11) REFERENCES compradores_2(cif_comprador)
	);
	
-- Creo la tabla "compradores_3":

CREATE TABLE IF NOT EXISTS compradores_3 (
	cif_comprador CHAR(11),
	nombre_social VARCHAR(30),
	domicilio_social VARCHAR(30),
	localidad VARCHAR(30),
	c_postal INT(5),
	telefono INT(9),
	CONSTRAINT PK_COMPRADORES_3 PRIMARY KEY(cif_comprador),
	CONSTRAINT UQ_COMPRADORES_NOMBRE_SOCIAL_3 UNIQUE(nombre_social)
	);
	
CREATE TABLE IF NOT EXISTS facturas_3 (
	factura_no INT(6),
	fecha_factura DATE,
	cif_cliente CHAR(11),
	CONSTRAINT PK_FACTURAS_3 PRIMARY KEY(factura_no),
	CONSTRAINT FK_FACTURAS_COMPRADORES_3 FOREIGN KEY(cif_cliente)
	REFERENCES compradores_3(cif_comprador)
	);