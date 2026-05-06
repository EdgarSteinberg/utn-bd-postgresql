DROP TABLE IF EXISTS cuentas;

CREATE TABLE cuentas (
id SERIAL PRIMARY KEY,
saldo INT
);

INSERT INTO cuentas (saldo) VALUES 
(100), (200);

SELECT * FROM cuentas;

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



BEGIN;
SELECT COUNT(*) FROM cuentas;

INSERT INTO cuentas (saldo) VALUES (300);