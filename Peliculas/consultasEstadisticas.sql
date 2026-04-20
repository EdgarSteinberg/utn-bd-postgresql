--1. Calcular el total de películas que posee la base de datos
SELECT COUNT(*) AS total_peliculas
FROM pelicula;

--2. Calcular el número de directores (código) a partir de los datos en la tabla
--películas.
SELECT COUNT(DISTINCT director) AS total_directores
FROM pelicula
WHERE director IS NOT NULL

--3. Calcular cual es el mínimo y máximo valor de recaudación en la tabla
--películas
SELECT MIN(recaudacion) AS min_recaudacion , MAX(recaudacion) AS mas_recaudacion
FROM pelicula;

--4. Mostrar el código de la categoría cuya película haya sido la de menor
--recaudación
SELECT categoria
FROM pelicula
ORDER BY recaudacion ASC
LIMIT 1;

SELECT c.id, c.nombre, p.titulo, p.recaudacion
FROM pelicula p
JOIN categoria c ON p.categoria = c.id
ORDER BY p.recaudacion ASC
LIMIT 1;

--5. Listar cuantas películas se estrenaron en el año 2018.
SELECT COUNT(*) AS total_peliculas_2018
FROM peliculas
WHERE anio_estreno = 2018;

--6. Listar cuantas películas estrenó cada director. Mostrar el nombre y apellido
--del director.
SELECT d.nombre, d.apellido, COUNT(*) AS cantidad_peliculas
FROM pelicula p
JOIN director d ON p.director = d.id
GROUP BY d.nombre, d.apellido;

SELECT d.nombre, d.apellido, COUNT(p.id) AS total_peliculas
FROM director d
LEFT JOIN pelicula p ON d.id = p.director
GROUP BY d.id, d.nombre, d.apellido
ORDER BY total_peliculas DESC;

--7. Listar las categorías de películas cuyo promedio de recaudación es
--superior a AR$ 500000
SELECT c.nombre,ROUND( AVG(p.recaudacion * 1400) ::numeric, 2) AS promedio_arg
FROM pelicula p
JOIN categoria c ON p.categoria = c.id
GROUP BY c.nombre
HAVING AVG(p.recaudacion * 1400) > 500000;

-- 8. Directores que estrenaron menos de 5 películas
SELECT d.nombre, d.apellido, COUNT(p.id) AS total_peliculas
FROM director d
LEFT JOIN pelicula p ON d.id = p.director
GROUP BY d.id, d.nombre, d.apellido;

SELECT d.nombre, d.apellido, COUNT(p.id) AS total_peliculas
FROM director d
LEFT JOIN pelicula p ON d.id = p.director
GROUP BY d.id, d.nombre, d.apellido
HAVING COUNT(p.id) < 5;

SELECT * FROM pelicula;
SELECT * FROM categoria;
SELECT * FROM director;