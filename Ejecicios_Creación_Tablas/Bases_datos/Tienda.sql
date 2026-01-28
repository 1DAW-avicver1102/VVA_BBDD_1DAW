-- Creo la tabla "Compradores":

CREATE TABLE IF NOT EXISTS Compradores (
	CIF_comprador CHAR(11),
	Nombre_social VARCHAR(30),
	Domicilio_social VARCHAR(30),
	Localidad VARCHAR(30),
	C_postal INT(5),
	Telefono INT(9) NOT NULL,
	CONSTRAINT PK_COMPRADORES_CIF PRIMARY KEY(CIF_comprador),
	CONSTRAINT UQ_COMPRADORES_NOMBRE_SOCIAL UNIQUE(Nombre_social)
	);
	
-- Creo la tabla "Articulos":

CREATE TABLE IF NOT EXISTS Articulos (
	Referencia_articulo VARCHAR(12),
	Descripcion_articulo VARCHAR(30),
	Precio_unidad FLOAT(6, 2),
	IVA INT(2),
	Existencias_actuales INT(5) DEFAULT '0',
	CONSTRAINT PK_ARTICULOS PRIMARY KEY (referencia_articulo),
	CONSTRAINT CK_IVA
		CHECK (IVA BETWEEN 5 AND 25)
	);
	
-- Creo la tabla "Facturas":

CREATE TABLE IF NOT EXISTS Facturas (
	Factura_no INT(6),
	Fecha_factura DATE DEFAULT '2005-01-01',
	CIF_cliente CHAR(11),
	CONSTRAINT PK_FACTURAS PRIMARY KEY(Factura_no)
	);
	
-- Creo la tabla "Lineas_factura":

CREATE TABLE IF NOT EXISTS Lineas_factura (
	Factura_no INT(6),
	Referencia_articulo VARCHAR(12),
	Unidades INT(3),
	CONSTRAINT PK_LINEAS_FACTURA PRIMARY KEY(Factura_no, Referencia_articulo),
	CONSTRAINT FK_LINEAS_FACTURAS FOREIGN KEY(Factura_no)
	REFERENCES Facturas(Factura_no)
	ON DELETE CASCADE,
	CONSTRAINT FK_LINEAS_ARTICULOS FOREIGN KEY(Referencia_articulo)
	REFERENCES Articulos(Referencia_articulo)
	);