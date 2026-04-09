-- DDL – Definición de datos

-- 4.	Agregar una columna año (INT) a la tabla versiones.
ALTER TABLE versiones
ADD COLUMN año INT
;

-- 5.	Agregar una columna origen (VARCHAR(30)) a la tabla versiones.
ALTER TABLE versiones
ADD COLUMN origen VARCHAR(30)
;

-- 6.	Agregar una columna teléfono (VARCHAR(20)) a la tabla sucursales.
ALTER TABLE sucursales
ADD COLUMN teléfono VARCHAR(20)
;

-- 7.	Modificar la columna nombre de la tabla modelos para que permita hasta 100 caracteres.
ALTER TABLE modelos
ALTER COLUMN nombre TYPE VARCHAR(100)
;

-- 8.	Eliminar la columna origen de la tabla versiones.
SELECT * FROM versiones;

ALTER TABLE versiones
DROP COLUMN origen
;


-- DML – Manipulación de datos

-- 9.	Completar la columna año en versiones con el valor 2025 para todos los registros.
UPDATE versiones
SET año = 2025;
SELECT * FROM versiones;

-- 10.	Aumentar el precio de todas las versiones en un 10%.
UPDATE versiones
SET precio = precio * 1.10
;
SELECT * FROM versiones;

-- 11.	Cambiar motor a 'hibrido' para la version 'XEI 2.0 CVT'.
UPDATE versiones
SET motor = 'hibrido'
WHERE nombre = 'XEI 2.0 CVT'
;
SELECT * FROM versiones;

-- 12.	Actualizar el stock a 0 en todas las sucursales de la ciudad 'Salta'.
UPDATE sucursales
SET stock = 0
WHERE ciudad = 'Salta'
;
UPDATE sucursales
SET ciuadad = 'ciudad'
;
SELECT * FROM sucursales;
