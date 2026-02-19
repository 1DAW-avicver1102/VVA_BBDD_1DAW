CREATE DATABASE Gimnasio;
USE Gimnasio;

CREATE TABLE IF NOT EXISTS Clases (
	id_clase INT(5) PRIMARY KEY,
	nombre_clase VARCHAR(30) NOT NULL, 
	instructor VARCHAR(30),
	capacidad_max INT(2),
		CHECK (capacidad_max > 5)
	);
	
CREATE TABLE IF NOT EXISTS Socios (
	id_socio INT(5) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	tipo_membresia VARCHAR(20), 
	fecha_alta DATE,
	telefono VARCHAR(9) UNIQUE,
	id_clase_inscrita INT(5),
	CONSTRAINT FK_SOCIOS FOREIGN KEY(id_clase_inscrita)
	REFERENCES Clases(id_clase)
	);
	
INSERT INTO Clases
	VALUES(1, 'Yoga', 'Llados', 20),
	(2, 'Crossfit', 'Juan de la Palmilla', 30),
	(3, 'Boxeo', 'Romanian Final Boss', 25);
	
INSERT INTO Socios
	VALUES(10, 'Ibai', 'Mensual', '2024-03-10', '932532555', 1),
	(11, 'Xokas', 'Mensual', '2024-02-11', '911023111', 2),
	(12, 'Amador Rivas', 'Anual', '2023-04-11', '935824392', 3);
	
SELECT *
FROM Socios;

SELECT nombre, id_clase_inscrita
FROM Socios
WHERE id_clase_inscrita = 2;

SELECT nombre, id_clase_inscrita
FROM Socios
WHERE id_clase_inscrita = 1 OR id_clase_inscrita = 3;

SELECT id_clase_inscrita, COUNT(*)
FROM Socios
GROUP BY id_clase_inscrita;

SELECT tipo_membresia, COUNT(*) AS membresia_total
FROM Socios
GROUP BY tipo_membresia
HAVING membresia_total > 1;

SELECT SUM(capacidad_max) AS capacidad_total
FROM Clases;