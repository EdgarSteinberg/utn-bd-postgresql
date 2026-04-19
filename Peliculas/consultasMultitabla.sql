SELECT * FROM director;
SELECT * FROM actor;
SELECT * FROM pais;
SELECT * FROM categoria;
SELECT * FROM pelicula;
SELECT * FROM actores_x_película;

-- 1. Listar nombre completo del elenco y nombre de películas. Orden por película y actor
SELECT CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
	   p.titulo AS pelicula
FROM actores_x_película axp
JOIN actor a ON axp.id_actor = a.id
JOIN pelicula p ON axp.id_pelicula = p.id
ORDER BY p.titulo ASC, a.nombre ASC;


-- 2. Nombre completo, nacionalidad de todo el elenco, y nombre de películas del director con código 1
SELECT CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
	   pa.nombre AS pais,
	   p.titulo AS pelicula
FROM actores_x_película axp
JOIN actor a ON axp.id_actor = a.id
JOIN pelicula p ON axp.id_pelicula = p.id
JOIN director d ON p.director = d.id
JOIN pais pa ON a.pais_nacimiento = pa.id
WHERE d.id = 1
ORDER BY p.titulo ASC, a.nombre ASC;

-- 3. Nombre de todos los directores que no estrenaron película en 2015 o 2020
SELECT nombre, apellido
FROM director
WHERE id NOT IN (
	SELECT DISTINCT director
	FROM pelicula
	WHERE anio_estreno IN (2015, 2020)
);

SELECT nombre, apellido
FROM director d
WHERE NOT EXISTS (
	SELECT 1
	FROM pelicula p
	WHERE p.director = d.id
	  AND p.anio_estreno IN (2015, 2020)
);
SELECT * FROM director;

-- 4. Listar el nombre de todos los directores que se encuentren en la base de
-- datos junto con los datos de sus películas
SELECT d.nombre, d.apellido, p.titulo, p.anio_estreno, p.recaudacion
FROM director d
JOIN pelicula p ON d.id = p.director
ORDER BY d.nombre;

--5. Listar el nombre de todos los directores que se encuentren en la base de
--datos junto con los datos de sus películas. El listado debe incluir aquellos
--directores que no tengan películas.
SELECT d.nombre, d.apellido, p.titulo, p.anio_estreno, p.recaudacion
FROM director d
LEFT JOIN pelicula p ON d.id = p.director
ORDER BY d.nombre;

--6. Listar el nombre de aquellos actores/actrices cuyo año de nacimiento se
--encuentre entre 1970 y 1990 y que hayan o no participado en alguna
--película cuyo año de estreno haya sido 2020.
SELECT DISTINCT CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
	   a.anio_nacimiento
FROM actor a
LEFT JOIN actores_x_película axp ON a.id = axp.id_actor
LEFT JOIN pelicula p ON axp.id_pelicula = p.id AND p.anio_estreno = 2020
WHERE a.anio_nacimiento BETWEEN 1970 AND 1990;


SELECT * FROM actor;
SELECT * FROM pais;
SELECT * FROM categoria;
SELECT * FROM pelicula;
SELECT * FROM actores_x_película;