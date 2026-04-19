SELECT * FROM director;
SELECT * FROM actor;
SELECT * FROM pais;
SELECT * FROM categoria;
SELECT * FROM pelicula;
SELECT * FROM actores_x_película;


--a. El nombre de la película cuyo id es 2 cambiarlo a idioma español
UPDATE pelicula
SET titulo = 'Parque Jurasico'
WHERE id = 2;
SELECT * FROM pelicula ORDER BY id ASC;

--b. Dejar vacío (null) el campo director de las películas cuyo año de
--estreno sea menor a 1995
UPDATE pelicula
SET director = null
WHERE anio_estreno < 1995;
SELECT * FROM pelicula ORDER BY id ASC;


--1. Listar todos los datos de todos los directores
SELECT * FROM director;

--2. Listar el nombre de todos los directores
SELECT nombre FROM director;

--3. Listar el nombre y el año de estreno de todas las películas
SELECT titulo ,anio_estreno FROM pelicula; 

--4. Listar el nombre y la recaudación de cada película en pesos y dólares (2
--decimales)
SELECT titulo,
       ROUND(recaudacion::numeric, 2) AS recaudacion_usd,
       ROUND(recaudacion::numeric * 1400, 2) AS recaudacion_ars
FROM pelicula;

-- 5. Listar el nombre de todo el elenco con columna nombre_completo
SELECT CONCAT(nombre, ' ', apellido) AS nombre__completo
FROM actor;

--6. Listar el código de los directores que dirigieron películas entre 2005 y 2015,
--sin duplicados
SELECT DISTINCT(director)
FROM pelicula 
WHERE anio_estreno BETWEEN 2005 AND 2015;

--7. Listar las películas estrenadas entre 2015 y 2021 ordenadas por año
--descendente y nombre ascendente
--7. Listar las películas estrenadas entre 2015 y 2021 ordenadas por año
--descendente y nombre ascendente
SELECT *
FROM pelicula
WHERE anio_estreno BETWEEN 2015 AND 2021
ORDER BY anio_estreno DESC, titulo ASC;

--8. Listar las películas que no se estrenaron en 2016
SELECT *
FROM pelicula
WHERE anio_estreno != 2016;

-- 9. Listar el nombre y apellido del director más joven
SELECT nombre, apellido, anio_nacimiento
FROM director
ORDER BY anio_nacimiento DESC
LIMIT 1;

-- 10. Listar todas las películas cuya categoría sea Acción, Drama, Animación
-- Usando los códigos de categorías según nuestro ejemplo: Acción=1, Drama=2, Animación=8
SELECT *
FROM pelicula
WHERE categoria IN (1, 2, 8);

--11. Listar todas las películas cuyo año de estreno no sea 2006, 2010, 2015
SELECT * 
FROM pelicula
WHERE anio_estreno IN (2006,2010,2015);

-- 12. Listar las películas cuyo nombre contenga la palabra "Max"
SELECT *
FROM pelicula
WHERE titulo LIKE '%Max%';

-- 13. Listar las películas cuyo año de estreno > 2010 y < 2016 o recaudación < 100
-- recaudación en millones USD
SELECT *
FROM pelicula
WHERE (anio_estreno > 2010 AND anio_estreno < 2016)
   OR recaudacion < 100;


--14. Listar actores nacidos en 1974 y de nacionalidad española
SELECT CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo,
       p.nombre AS pais,
       a.anio_nacimiento
FROM actor a
JOIN pais p ON a.pais_nacimiento = p.id
WHERE a.anio_nacimiento = 1974
  AND p.nombre = 'España';

--Otra opcion
SELECT *
FROM actor
WHERE anio_nacimiento = 1974 AND pais_nacimiento = 5;

-- 15. Listar nombre, apellido y año de nacimiento de actores y directores nacidos en 1970, indicando tipo
SELECT nombre, apellido, anio_nacimiento, 'Actor' AS tipo
FROM actor
WHERE anio_nacimiento = 1970
UNION
SELECT nombre, apellido, anio_nacimiento, 'Director' AS tipo
FROM director
WHERE anio_nacimiento = 1970;

SELECT * FROM director;
SELECT * FROM actor;
SELECT * FROM pais;
SELECT * FROM categoria;
SELECT * FROM pelicula;
SELECT * FROM actores_x_película;