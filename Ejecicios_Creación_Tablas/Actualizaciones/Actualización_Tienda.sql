USE tienda;

INSERT INTO articulos
(Referencia_articulo, Precio_unidad, IVA)
VALUES ('06-CUERO', 10.99, 10);

UPDATE articulos
SET IVA = IVA - 1;

UPDATE articulos 
SET Descripcion_articulo = 'LANA 90%NATURAL 10%ACRILICO'
WHERE Referencia_articulo = '01-LANA';

UPDATE articulos
SET Referencia_articulo = '01-LANA90/10'
WHERE Referencia_articulo = '01-LANA';

DELETE
FROM facturas
WHERE Factura_no = 2;