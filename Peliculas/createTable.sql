DROP TABLE IF EXISTS pais CASCADE;
DROP TABLE IF EXISTS director CASCADE;
DROP TABLE IF EXISTS actor CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS actores_x_pelicula CASCADE;
DROP TABLE IF EXISTS pelicula CASCADE;

CREATE TABLE pais (
    id INT PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE director (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais_nacimiento INT,
    anio_nacimiento INT,
	FOREIGN KEY (pais_nacimiento) REFERENCES pais(id)
	);

CREATE TABLE actor (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais_nacimiento INT,
    anio_nacimiento INT,
	FOREIGN KEY (pais_nacimiento) REFERENCES pais(id)
);

CREATE TABLE categoria (
    id INT PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE pelicula (
    id INT PRIMARY KEY,
    titulo VARCHAR(50),
	sinopsis VARCHAR,
	categoria int,
	director int,
	anio_estreno int,
	recaudacion float,
	FOREIGN KEY (categoria) REFERENCES categoria(id),
	FOREIGN KEY (director) REFERENCES director(id)
);

CREATE TABLE actores_x_película (
	id_actor INT,
	id_pelicula INT,
	FOREIGN KEY (id_actor) REFERENCES actor(id),
	FOREIGN KEY (id_pelicula) REFERENCES pelicula(id)
);