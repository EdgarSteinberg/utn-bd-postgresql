--1. Listar los identificadores de categoría que aparecen en la tabla de productos, sin
--repetir valores.
SELECT DISTINCT(id_categoria) FROM productos;

--2. Obtener la cantidad total de categorías distintas presentes en los productos.
SELECT COUNT(DISTINCT id_categoria) FROM productos;

--3. Mostrar cuántos productos hay en cada categoría.
SELECT id_categoria, COUNT(*)
FROM productos
GROUP BY id_categoria;

SELECT c.nombre_categoria, COUNT(p.id_producto) AS cantidad
FROM categorias c
JOIN productos p ON c.id_categoria = p.id_categoria
GROUP BY c.nombre_categoria;

--4. Calcular el precio promedio de los productos por categoría.
SELECT c.nombre_categoria, AVG(p.precio) AS precio_promedio
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria;

--5. Obtener la suma total de los precios de los productos por cada categoría.
SELECT nombre_categoria , SUM(p.precio) AS total_precios
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria;

--6. Mostrar el precio mínimo y el precio máximo de los productos por categoría.
SELECT nombre_categoria, MIN(p.precio) AS precio_minimo , MAX(p.precio) AS precio_maximo
FROM productos p
JOIN categorias c ON c.id_categoria = p.id_categoria
GROUP BY c.nombre_categoria;

--7. Listar las categorías cuyo precio promedio de productos sea mayor a 1500.
SELECT c.nombre_categoria , AVG(p.precio) AS precio_promedio
FROM productos p
JOIN categorias c ON c.id_categoria = p.id_categoria
GROUP BY c.nombre_categoria
HAVING AVG(p.precio) > 1500;

--8. Mostrar las categorías que tienen 3 o más productos.
SELECT c.nombre_categoria, COUNT(p.id_producto) AS cantidad
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria
HAVING COUNT(p.id_producto) >= 3;

--9. Indicar, para cada categoría, cuántos productos tienen precio cargado (es decir,
--distinto de NULL).
SELECT c.nombre_categoria, COUNT(p.precio) AS cantidad_con_precio
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria;

SELECT c.nombre_categoria, COUNT(*) AS cantidad_con_precio
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.precio IS NOT NULL
GROUP BY c.nombre_categoria;


--10. Listar el nombre de cada producto junto con el nombre de su categoría,
--considerando solo aquellos productos que tienen categoría asociada.
SELECT p.nombre , c.nombre_categoria AS nombre_categoria
FROM productos p
JOIN categorias c ON c.id_categoria = p.id_categoria;

--11. Listar el nombre de cada producto, su categoría y la sucursal a la que pertenece
--dicha categoría.
SELECT p.nombre AS producto , c.nombre_categoria , s.nombre AS sucursal
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
JOIN sucursales s ON s.id_sucursal = c.id_sucursal;

--12. Listar todos los productos junto con su categoría, incluyendo aquellos productos
--que no tienen categoría asignada.
SELECT p.nombre AS producto , c.nombre_categoria AS categoria
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria;

--13. Listar todas las categorías junto con los productos asociados, incluyendo
--aquellas categorías que no tienen productos.
SELECT c.nombre_categoria AS categoria , p.nombre AS producto
FROM categorias c
LEFT JOIN productos p ON c.id_categoria = p.id_categoria;

--14. Listar todos los productos y todas las categorías, incluyendo tanto productos sin
--categoría como categorías sin productos
SELECT c.nombre_categoria AS categoria , p.nombre AS producto
FROM productos p
FULL OUTER JOIN categorias c ON p.id_categoria = c.id_categoria;

--15. Mostrar todos los productos que no tienen precio cargado.
SELECT nombre AS producto , precio
FROM productos 
WHERE precio IS NULL;

--16. Listar los productos cuyo precio sea mayor a 1500.
SELECT nombre AS producto, precio
FROM productos
WHERE precio > 1500;

--17. Mostrar los productos que no tienen categoría asignada.
SELECT p.nombre AS producto , c.nombre_categoria AS categoria
FROM productos p
LEFT JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE c.id_categoria IS NULL;

--18. Obtener la cantidad total de productos.
SELECT COUNT(*) AS cantidad_productos
FROM productos;

--19. Obtener la cantidad de productos que tienen precio cargado.
SELECT COUNT(*)
FROM productos
WHERE precio IS NOT NULL;

--20. Mostrar el nombre del producto, su precio, el precio con IVA (21%) y la ciudad de
--la sucursal a la que pertenece (si tiene).

--Correcta
SELECT p.nombre,p.precio,
    p.precio * 1.21 AS precio_con_iva,
    s.ciudad
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN sucursales s ON c.id_sucursal = s.id_sucursal;

--Correcta pero no cumple (si no tiene ciudad)
SELECT p.nombre,p.precio,
    p.precio * 1.21 AS precio_con_iva,
    s.ciudad
FROM productos p
 JOIN categorias c ON p.id_categoria = c.id_categoria
 JOIN sucursales s ON c.id_sucursal = s.id_sucursal;