--1. Listar los identificadores de categoría que aparecen en la tabla de productos, sin
--repetir valores.
SELECT DISTINCT(id_categoria) FROM productos;


--2. Obtener la cantidad total de categorías distintas presentes en los productos
SELECT COUNT( DISTINCT id_categoria) AS total_categorias FROM productos;


--3. Mostrar cuántos productos hay en cada categoría.
SELECT id_categoria , COUNT(*)
FROM productos 
GROUP BY id_categoria;


--4. Calcular el precio promedio de los productos por categoría
SELECT id_categoria , AVG(precio)
FROM productos
GROUP BY id_categoria;

--5. Obtener la suma total de los precios de los productos por cada categoría.
SELECT c.nombre_categoria, SUM(p.precio)
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria;

--6. Mostrar el precio mínimo y el precio máximo de los productos por categoría.
SELECT c.nombre_categoria, MIN(p.precio), MAX(p.precio)
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria;

--7. Listar las categorías cuyo precio promedio de productos sea mayor a 1500.
SELECT c.nombre_categoria, AVG(p.precio)
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria
HAVING AVG(p.precio) > 1500;

//Codigo profesor
SELECT id_categoria, AVG(precio) AS precio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 1500;

--8. Mostrar las categorías que tienen 3 o más productos.
SELECT id_categoria, COUNT(*) AS cantidad
FROM productos 
GROUP BY id_categoria
HAVING COUNT(*) >= 3;

-- 9. Indicar, para cada categoría, cuántos productos tienen precio cargado (es decir, distinto de NULL).
SELECT id_categoria, COUNT(precio) AS con_precio
FROM productos
GROUP BY id_categoria;

-- 10. Listar el nombre de cada producto junto con el nombre de su categoría,
-- considerando solo aquellos productos que tienen categoría asociada.

SELECT p.nombre, c.nombre_categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 11. Listar el nombre de cada producto, su categoría y la sucursal a la que pertenece
-- dicha categoría.

SELECT p.nombre, c.id_categoria, s.nombre AS nombre_sucursal
FROM productos p
JOIN categorias c ON c.id_categoria = p.id_categoria
JOIN sucursales s ON s.id_sucursal = c.id_categoria;


-- 12. Listar todos los productos junto con su categoría, incluyendo aquellos productos
-- que no tienen categoría asignada.

SELECT p.nombre, c.nombre_categoria
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria;
 

-- 13. Listar todas las categorías junto con los productos asociados, incluyendo
-- aquellas categorías que no tienen productos.
SELECT c.nombre_categoria, p.nombre
FROM categorias c
LEFT JOIN productos p ON p.id_categoria = c.id_categoria;


--  15. Mostrar todos los productos que no tienen precio cargado.
SELECT nombre, precio
FROM productos
WHERE precio IS NULL;


-- 16. Listar los productos cuyo precio sea mayor a 1500.
SELECT nombre, precio
FROM productos
WHERE precio > 1500;

--17. Mostrar los productos que no tienen categoría asignada.
SELECT p.nombre, c.nombre_categoria
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE c.id_categoria IS NULL;