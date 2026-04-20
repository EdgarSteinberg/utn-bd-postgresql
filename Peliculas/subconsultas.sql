--1. Listar las películas cuya recaudación sea superior al promedio de
--recaudación de todas las películas del año 2018.
SELECT *
FROM pelicula
WHERE recaudacion > (
    SELECT AVG(recaudacion)
    FROM pelicula
    WHERE anio_estreno = 2018
);

--2. Listar todos los directores que no hayan estrenado películas.
SELECT *
FROM director
WHERE id NOT IN(
 	SELECT DISTINCT director
	FROM pelicula
	WHERE director IS NOT NULL
);

--3. Listar el nombre del director junto con el nombre y recaudación de su
--película más taquillera
SELECT d.nombre, d.apellido, p.titulo, p.recaudacion
FROM director d
JOIN pelicula p ON d.id = p.director
WHERE p.recaudacion = (
    SELECT MAX(p2.recaudacion)
    FROM pelicula p2
    WHERE p2.director = d.id
);

SELECT * FROM pelicula;
SELECT * FROM categoria;
SELECT * FROM director;