USE tienda;

ALTER TABLE facturas 
ADD IF NOT EXISTS cod_oficina INT(4);

ALTER TABLE facturas
ADD CONSTRAINT FK_FACTURA_COMPRADORES FOREIGN KEY (cif_cliente)
REFERENCES compradores(cif_comprador);

ALTER TABLE compradores
RENAME COLUMN c_postal TO codigo_postal;

ALTER TABLE facturas
ADD CONSTRAINT CK_COD_OFICINA
	CHECK (cod_oficina BETWEEN 1 AND 1000);