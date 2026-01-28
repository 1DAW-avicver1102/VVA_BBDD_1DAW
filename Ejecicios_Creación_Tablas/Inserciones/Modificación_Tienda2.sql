USE tienda2;

ALTER TABLE facturas_1
ADD CONSTRAINT PK_fACTURA_NO_1 PRIMARY KEY(factura_no);

ALTER TABLE lineas_factura`unidades``referencia_factura`_1
ADD CONSTRAINT FK_LINEAS_FACTURAS_1 FOREIGN KEY(factura_no)
REFERENCES facturas_1(factura_no);

ALTER TABLE articulos_1
ADD CONSTRAINT UQ_ARTICULOS_DESCRIPCION_1 UNIQUE(descripcion_articulo);

ALTER TABLE compradores_1
MODIFY COLUMN telefono INT(9);