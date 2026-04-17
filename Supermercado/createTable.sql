DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS productos;

-- =====================================
-- CREACIÓN DE TABLAS
-- =====================================

CREATE TABLE sucursales (
    id_sucursal INT,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

CREATE TABLE categorias (
    id_categoria INT,
    nombre_categoria VARCHAR(50),
    id_sucursal INT
);

CREATE TABLE productos (
    id_producto INT,
    nombre VARCHAR(50),
    precio DECIMAL(10,2),
    id_categoria INT
);

SELECT * FROM sucursales;
SELECT * FROM categorias;
SELECT * FROM productos;