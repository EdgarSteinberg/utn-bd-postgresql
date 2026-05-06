DROP TABLE IF EXISTS cuentas;

CREATE TABLE cuentas (
id SERIAL PRIMARY KEY,
saldo INT
);

INSERT INTO cuentas (saldo) VALUES 
(100), (200);

SELECT * FROM cuentas;