CREATE TABLE Departamentos(
   id_departamento INT,
   nombre_departamento VARCHAR(30)
);

CREATE TABLE Empleados(
	id_empleado INT,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	salario INT,
	id_departamento INT
);