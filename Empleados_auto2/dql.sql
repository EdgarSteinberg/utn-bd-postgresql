
SELECT * FROM Empleados WHERE id_empleado = 103;
SELECT MIN(SALARIO) FROM Empleados;
SELECT nombre , apellido FROM empleados WHERE salario > 55000;
SELECT nombre_departamento FROM Departamentos WHERE id_departamento =4;
SELECT nombre , salario FROM Empleados ORDER BY salario DESC;
SELECT nombre_departamento FROM Departamentos ORDER BY nombre_departamento ASC;
SELECT nombre , apellido FROM Empleados ORDER BY nombre ASC LIMIT 2;
SELECT nombre , apellido FROM Empleados ORDER BY id_empleado ASC LIMIT 2 OFFSET 3;
SELECT COUNT(*) FROM Empleados;
SELECT AVG(salario) FROM Empleados WHERE id_departamento = 4 ;