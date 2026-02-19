CREATE DATABASE Biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS Libros(
	id_libro INT(5),
	titulo VARCHAR(30) NOT NULL,
	autor VARCHAR(20),
	categoria VARCHAR(25),
	precio_alquiler FLOAT(3,2),
	stock INT(3) DEFAULT '1',
	isbn VARCHAR(20) UNIQUE,
	CONSTRAINT PK_LIBROS PRIMARY KEY(id_libro),
	CONSTRAINT CK_PRECIO_ALQUILER CHECK(precio_alquiler BETWEEN 0 AND 150)
	);

INSERT INTO Libros
	VALUES(1, 'Don Quijote de La Mancha', 'Cervantes', 'Novela', 1.99, 40, '34923493-3'),
	(2, 'Demian', 'Hermann Hesse', 'Novela', 9.99, 20, '34252352-5'),
	(3, 'El Principito', 'Anónimo', 'Cuentos', 5.50, 40, '324235325-3'),
	(4, 'Moby Dick', 'Herman Melville', 'Novela', 4.99, 30, '342534253-9'),
	(5, 'El Libro Troll', 'El Rubius', 'Humor', 5.99, 0, '342345223-2');
	
UPDATE Libros
SET precio_alquiler = precio_alquiler*1.10
WHERE categoria = 'Novela';

SELECT *
FROM Libros;

DELETE
FROM Libros
WHERE stock = 0;

SELECT *
FROM Libros;

SELECT titulo, autor
FROM Libros
WHERE titulo LIKE '%Quijote%';

SELECT categoria, AVG(precio_alquiler) AS alquiler_medio
FROM Libros
GROUP BY categoria;

SELECT categoria, COUNT(*) AS cantidad_libros
FROM Libros
GROUP BY categoria
HAVING cantidad_libros > 2;

SELECT titulo, precio_alquiler
FROM Libros
ORDER BY precio_alquiler DESC
LIMIT 1;