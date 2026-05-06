/* Esto cumple con las propiedades ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad):

Atomicidad: o pasa todo o no pasa nada
Consistencia: los datos quedan válidos
Aislamiento: otras transacciones no ven estados intermedios
Durabilidad: después del COMMIT, no se pierde */


BEGIN;
SELECT SUM(saldo) AS total_inicial FROM cuentas;
UPDATE cuentas SET saldo = saldo - 50 WHERE id = 1;
COMMIT;

SELECT SUM(saldo) AS total_inicial FROM cuentas;




BEGIN;
SELECT SUM(saldo) AS total_inicial FROM cuentas;
UPDATE cuentas SET saldo = saldo - 50 WHERE id = 1;
ROLLBACK;

SELECT SUM(saldo) AS total_inicial FROM cuentas;


/* Me muestra el nivel de aislamiento que estoy trabajando */
SHOW transaction_isolation;

SHOW default_transaction_isolation;

UPDATE cuentas set saldo = saldo + 50 WHERE id = 1;


/* Nivel de aislamiento REPEATABLE READ; */

BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT saldo FROM cuentas WHERE id = 1;

SHOW transaction_isolation;
