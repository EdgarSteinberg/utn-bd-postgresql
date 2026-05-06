DROP TABLE IF EXISTS doctores;

CREATE TABLE doctores(
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    de_guardia BOOLEAN
);

INSERT INTO doctores (nombre, de_guardia) VALUES
('Ana', TRUE),
('Bruno', TRUE);


/* BEGIN → abrís una transacción
COMMIT → guardás cambios
ROLLBACK → descartás cambios */

/* Seccion uno */

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT COUNT(*) FROM doctores WHERE de_guardia = TRUE; -- devuelve 2
-- Ana piensa: "Hay otro doctor, me puedo ir"
UPDATE doctores SET de_guardia = FALSE WHERE nombre = 'Ana';

COMMIT;


/* Seccion dos */

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT COUNT(*) FROM doctores WHERE de_guardia = TRUE; -- devuelve 2(snapshot propio)
-- Bruno piensa: "Hay otro doctor, me puedo ir"
UPDATE doctores SET de_guardia = FALSE WHERE nombre = 'Bruno';

COMMIT;




/* LEVEL SERIALIZABLE */

/* Seccion uno */
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; 

SELECT COUNT(*) FROM doctores WHERE de_guardia = TRUE; -- devuelve 2
-- Ana piensa: "Hay otro doctor, me puedo ir"
UPDATE doctores SET de_guardia = FALSE WHERE nombre = 'Ana';

COMMIT;


/* Seccion dos */
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT COUNT(*) FROM doctores WHERE de_guardia = TRUE; -- devuelve 2(snapshot propio)
-- Bruno piensa: "Hay otro doctor, me puedo ir"
UPDATE doctores SET de_guardia = FALSE WHERE nombre = 'Bruno';

COMMIT;