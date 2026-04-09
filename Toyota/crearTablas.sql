CREATE TABLE modelos(
	id_models INT,
	nombre VARCHAR(50),
	tipo VARCHAR(50)
);
SELECT * FROM modelos;

CREATE TABLE versiones(
	id_version INT,
	id_modelo INT,
	nombre VARCHAR(50),
	motor VARCHAR(30),
	precio DECIMAL(12,2)
);
SELECT * FROM versiones;

CREATE TABLE sucursales(
	id_sucursal INT,
	nombre VARCHAR(50),
	ciudad VARCHAR(50),
	id_version INT,
	stock INT
);
SELECT * FROM sucursales;