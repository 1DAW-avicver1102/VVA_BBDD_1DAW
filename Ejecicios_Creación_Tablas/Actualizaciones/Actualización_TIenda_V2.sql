USE tienda;

INSERT INTO articulos
(Referencia_articulo, Descripcion_articulo, Precio_unidad, IVA, Existencias_actuales)
VALUES ('05-YUTE', 'YUTE FINO', 25.99, 12, 15);

DELETE
FROM articulos
WHERE Referencia_articulo LIKE '%5%';
  
UPDATE articulos
SET IVA = 8
WHERE IVA LIKE '%10%';

UPDATE articulos
SET Precio_unidad = Precio_unidad/1.05;

INSERT INTO facturas
(Factura_no, Fecha_factura, CIF_cliente, Cod_oficina)
VALUES (000005, '2026-01-23', '111111-L', 1231);

INSERT INTO lineas_factura
(Factura_no, Referencia_articulo, Unidades)
VALUES (000005, '01-LANA', 60),
(000005, '04-LINO', 25);

DELETE
FROM lineas_factura
WHERE Factura_no = 2;

UPDATE facturas
SET Factura_no = 2
WHERE Factura_no = 5;

update lineas_factura
set Factura_no = 2
where Factura_no = 5;