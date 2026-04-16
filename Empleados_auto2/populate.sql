INSERT INTO Departamentos(id_departamento, nombre_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Marketing'),
(3, 'Ventas'),
(4, 'Desarrollo')
;

SELECT * FROM Departamentos;

INSERT INTO Empleados(id_empleado, nombre, apellido, salario, id_departamento) VALUES
(101, 'Juan', 'Perez', 50000,4),
(102, 'Ana', 'Garcia', 60000, 4),
(103, 'Carlos', 'Lopez', 45000, 3),
(104, 'Sofia', 'Martinez', 55000, 2),
(105, 'Luis', 'Fernandez', 52000, 3),
(106, 'Maria', 'Diaz', 70000,4),
(107, 'Pedro', 'Ruiz', 48000 ,1)
;

SELECT * FROM Empleados;