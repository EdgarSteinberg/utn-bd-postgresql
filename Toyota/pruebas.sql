 SELECT * FROM modelos;
 SELECT * FROM versiones;
 SELECT * FROM sucursales;

 --4. Agregar una columna año (INT) a la tabla versiones.
ALTER TABLE versiones 
ADD COLUMN año INT;
SELECT * FROM versiones;

--5. Agregar una columna origen (VARCHAR(30)) a la tabla versiones.
ALTER TABLE versiones
ADD COLUMN origen VARCHAR(30);
SELECT * FROM versiones;

ALTER TABLE versiones
DROP COLUMN orgien;
SELECT * FROM versiones;

--6. Agregar una columna teléfono (VARCHAR(20)) a la tabla sucursales.
ALTER TABLE sucursales
ADD COLUMN télefono VARCHAR(20);

SELECT * FROM sucursales;

--7. Modificar la columna nombre de la tabla modelos para que permita hasta 100
--caracteres.
ALTER TABLE modelos
ALTER COLUMN nombre TYPE VARCHAR(100);
SELECT * FROM modelos;

--8. Eliminar la columna origen de la tabla versiones.
ALTER TABLE versiones
DROP COLUMN origen;
SELECT * FROM versiones;

--9. Completar la columna año en versiones con el valor 2025 para todos los registros.
UPDATE versiones
SET año = 2025;
SELECT * FROM versiones;

--10. Aumentar el precio de todas las versiones en un 10%.
UPDATE versiones 
SET precio = precio * 1.10;
SELECT * FROM versiones;

--11. Cambiar el motor a 'hibrido' para la versión 'XEI 2.0 CVT'.
UPDATE versiones
SET motor = 'hibrido'
WHERE nombre = 'XEI 2.0 CVT';
SELECT * FROM versiones;

--12. Actualizar el stock a 0 en todas las sucursales de la ciudad 'Salta'.
UPDATE sucursales
SET stock = 0
WHERE ciudad = 'Salta';
SELECT * FROM sucursales;

--13. Cambiar el nombre de la sucursal 'Toyota Caballito' a 'Toyota Centro'
UPDATE sucursales
SET nombre = 'Toyota Centro'
WHERE nombre = 'Toyota Caballito';
SELECT * FROM sucursales;

--14. Eliminar todas las versiones cuyo precio sea menor a 35.000.000
DELETE FROM versiones
WHERE precio < 3500000
SELECT *  FROM versiones;

--15. Eliminar todas las sucursales que tengan stock igual a 0.
DELETE FROM sucursales
WHERE stock = 0;
SELECT * FROM sucursales;

--16. Eliminar los modelos de tipo 'hatchback'
DELETE FROM modelos 
WHERE tipo = 'hatchback';
SELECT * FROM modelos;

--17. Mostrar todos los registros de la tabla modelos
SELECT * FROM modelos;

--18. Mostrar nombre y precio de todas las versiones.
SELECT nombre, precio FROM versiones;

--19. Mostrar todas las sucursales de la ciudad 'Buenos Aires'.
SELECT nombre, ciudad FROM sucursales
WHERE ciudad = 'Buenos Aires';

--20. Mostrar las versiones cuyo precio sea mayor a 50.000.000
SELECT nombre, precio FROM versiones
WHERE precio > 50000000;

--21. Mostrar el nombre del modelo y el nombre de la versión.
SELECT nombre , tipo FROM modelos;

--22. Mostrar ciudad, nombre del modelo, nombre de la versión y stock
SELECT * FROM sucursales;
SELECT * FROM versiones;
SELECT * FROM modelos;
SELECT s.ciudad , m.nombre AS modelo , v.nombre AS version , s.stock
FROM sucursales s 
JOIN versiones v ON s.id_version = v.id_version 
JOIN modelos m ON m.id_modelo = v.id_modelo;
SELECT * FROM modelos;
SELECT * FROM sucursales;
SELECT * FROM versiones;

--23. Insertar un nuevo registro en la tabla modelos con los siguientes valores:
--• id_modelo: NULL
--• nombre: 'Modelo X'
--• tipo: 'sedan'
INSERT INTO modelos VALUES
(NULL, 'Modelo X', 'Sedan');

--24. Insertar un nuevo registro en la tabla modelos con los siguientes valores:
--• id_modelo: 1
--• nombre: 'Modelo duplicado'
--• tipo: 'suv'
INSERT INTO modelos VALUES
(1, 'Modelo Duplicado', 'sub');

--25. Insertar un nuevo registro en la tabla versiones con los siguientes valores:
--• id_version: 99
--• id_modelo: 999
--• nombre: 'Versión inválida'
--• motor: 'nafta'
--• precio: 1000000 
INSERT INTO versiones VALUES
(99,999,'Versión inválida', 'nafta', 1000000);


--26. Insertar un nuevo registro en la tabla sucursales con los siguientes valores:
--• id_sucursal: 99
--• nombre: 'Sucursal Fantasma'
--• ciudad: 'Buenos Aires'
--• id_version: 999
--• stock: 10 
INSERT INTO sucursales VALUES
(99, 'Sucursal Fantasma', 'Buenos Aires', 999, 10);

--27. Eliminar el registro de la tabla modelos cuyo id_modelo sea 1.
DELETE FROM modelos WHERE id_modelo = 1;

--28. Eliminar el registro de la tabla versiones cuyo id_version sea 1.
DELETE FROM versiones WHERE id_version = 1;

--29. Insertar un nuevo registro en la tabla versiones con los siguientes valores:
--• id_version: 1
--• id_modelo: 1
--• nombre: 'Duplicado'
--• motor: 'nafta'
--• precio: 100 
INSERT INTO versiones VALUES
(1,1,'Duplicado','nafta', 100);

--30. Actualizar el campo id_modelo de la tabla versiones a 999 para el registro cuyo
--id_version sea 1.
UPDATE versiones
SET id_modelo = 999
WHERE id_version = 1;

--31. Intentar eliminar completamente la tabla modelos.
--borra los registros (las filas), pero la tabla sigue existiendo.
DELETE FROM modelos;
--elimina la tabla completa (estructura + datos).
DROP TABLE modelos;

--32. Eliminar completamente la tabla modelos utilizando la opción CASCADE.
DROP TABLE modelos CASCADE;
SELECT * FROM versiones;