
-- =========================
-- Insertar países
-- =========================
INSERT INTO pais (id, nombre) VALUES
(1, 'Estados Unidos'),
(2, 'Reino Unido'),
(3, 'Francia'),
(4, 'Argentina'),
(5, 'España'),
(6, 'Canadá'),
(7, 'Italia'),
(8, 'Australia');

-- =========================
-- Insertar directores
-- =========================
INSERT INTO director (id, nombre, apellido, pais_nacimiento, anio_nacimiento) VALUES
(1, 'Steven', 'Spielberg', 1, 1946),
(2, 'Christopher', 'Nolan', 2, 1970),
(3, 'Quentin', 'Tarantino', 1, 1963),
(4, 'Pedro', 'Almodóvar', 5, 1949),
(5, 'James', 'Cameron', 1, 1954),
(6, 'Guillermo', 'del Toro', 1, 1964),
(7, 'Juan', 'José Campanella', 4, 1959),
(8, 'Denis', 'Villeneuve', 6, 1967),
(9, 'Martin', 'Scorsese', 1, 1942),
(10, 'Baz', 'Luhrmann', 8, 1962);

-- =========================
-- Insertar actores
-- =========================
INSERT INTO actor (id, nombre, apellido, pais_nacimiento, anio_nacimiento) VALUES
(1, 'Leonardo', 'DiCaprio', 1, 1974),
(2, 'Emma', 'Watson', 2, 1990),
(3, 'Penélope', 'Cruz', 5, 1974),
(4, 'Ricardo', 'Darín', 4, 1957),
(5, 'Brad', 'Pitt', 1, 1963),
(6, 'Natalie', 'Portman', 6, 1981),
(7, 'Tom', 'Hanks', 1, 1956),
(8, 'Christian', 'Bale', 2, 1974),
(9, 'Morgan', 'Freeman', 1, 1937),
(10, 'Saoirse', 'Ronan', 6, 1994),
(11, 'Robert', 'De Niro', 1, 1943),
(12, 'Matt', 'Damon', 1, 1970),
(13, 'Gal', 'Gadot', 5, 1985),
(14, 'Hugh', 'Jackman', 8, 1968),
(15, 'Marion', 'Cotillard', 3, 1975),
(16, 'Antonio', 'Banderas', 5, 1960),
(17, 'Cate', 'Blanchett', 8, 1969),
(18, 'Javier', 'Bardem', 5, 1969),
(19, 'Emma', 'Stone', 1, 1988),
(20, 'Michael', 'Fassbender', 3, 1977);

-- =========================
-- Insertar categorías
-- =========================
INSERT INTO categoria (id, nombre) VALUES
(1, 'Acción'),
(2, 'Drama'),
(3, 'Comedia'),
(4, 'Ciencia Ficción'),
(5, 'Terror'),
(6, 'Romance'),
(7, 'Aventura'),
(8, 'Animación');

-- =========================
-- Insertar películas
-- =========================
INSERT INTO pelicula (id, titulo, sinopsis, categoria, director, anio_estreno, recaudacion) VALUES
(1, 'Inception', 'Ladrón roba secretos a través de sueños', 4, 2, 2010, 829.89),
(2, 'Jurasic Park', 'Parque temático con dinosaurios clonados', 1, 1, 1993, 1029.15),
(3, 'Volver', 'Historia de mujeres en La Mancha', 2, 4, 2006, 124.5),
(4, 'El secreto de sus ojos', 'Exempleado judicial investiga un caso sin resolver', 2, 7, 2009, 34.9),
(5, 'Titanic', 'Romance en el barco hundido', 6, 5, 1997, 2187.5),
(6, 'Pulp Fiction', 'Historias entrecruzadas de crimen y humor negro', 2, 3, 1994, 213.9),
(7, 'Mad Max: Fury Road', 'Carretera post-apocalíptica con persecuciones', 7, 10, 2015, 378.9),
(8, 'Dune', 'Conflictos políticos y bélicos en planeta desértico', 4, 8, 2021, 400.0),
(9, 'Shutter Island', 'Investigador busca a paciente desaparecida', 2, 2, 2010, 294.8),
(10, 'The Revenant', 'Hombre busca venganza tras ataque de oso', 2, 9, 2015, 533.0),
(11, 'Batman Begins', 'Orígenes de Batman y lucha contra crimen', 1, 2, 2005, 374.2),
(12, 'La La Land', 'Romance entre músico y actriz', 6, 10, 2016, 446.1),
(13, 'The Irishman', 'Historia de crimen organizado', 2, 9, 2019, 8.0),
(14, 'Zootopia', 'Animales en sociedad antropomórfica', 8, 1, 2016, 1023.0),
(15, 'El Laberinto del Fauno', 'Fantasía y horror en posguerra española', 5, 6, 2006, 83.0);

-- =========================
-- Relación actores_x_película
-- =========================
INSERT INTO actores_x_película (id_actor, id_pelicula) VALUES
(1, 1),
(2, 1),
(5, 2),
(7, 2),
(3, 3),
(4, 4),
(1, 5),
(5, 5),
(11, 6),
(12, 6),
(8, 7),
(14, 7),
(6, 8),
(10, 8),
(1, 9),
(12, 9),
(1, 10),
(11, 10),
(8, 11),
(2, 11),
(2, 12),
(19, 12),
(4, 13),
(11, 13),
(15, 14),
(17, 14),
(16, 15),
(18, 15);

SELECT * FROM director;
SELECT * FROM actor;
SELECT * FROM pais;
SELECT * FROM categoria;
SELECT * FROM pelicula;
SELECT * FROM actores_x_película;
