# sergio_andres_aparicio_MySQL
Examen, MySQL. examen. 
 /*Sección 1
La primera forma normal establece la atomicidad en las tablas al tener las llaves ya cumple con la regla que vincula las tablas.



Las tablas intermedias son tablas que relacionan llaves foraneas para interconectar con otras tablas y mantener la forma 3N.
por ejemplo la tablas que relacionan clientes y pagos con los pedidos. la tabla pedidos se relaciona con la otras para mantener
la normalidad
*/ 
 /*
● ID_Inscripcion (Identificador único de la fila)yaaaaaa
● Estudiante_Matricula (Código del alumno)yaaaaaa
● Estudiante_Nombre YAAAAA
● Estudiante_Correo YAAAAA


● Curso_Codigo (Ejemplo: BD-101, PROG-202)
● Curso_Nombre (Ejemplo: Bases de Datos, Programación)
● Lista_Notas_Parciales (Ejemplo: "4.5, 3.8, 4.0")


● ID_Profesor
● Profesor_Nombre

● Profesor_Cubiculo
  
 */
 
 
CREATE DATABASE colegio;
USE colegio;
 
CREATE TABLE IF NOT EXISTS estudiantes(
	id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(200) UNIQUE NOT NULL,
	Estudiante_Matricula INT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS profesores(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cubiculos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	profesor_cubiculo VARCHAR(100) NOT NULL,
	id_profesor INT,
	FOREIGN KEY (id_profesor) REFERENCES profesores (id)
);

CREATE TABLE IF NOT EXISTS cursos(
	id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
	curso_codigo VARCHAR(6) UNIQUE NOT NULL,
	curso_nombre VARCHAR(40) UNIQUE NOT NULL,
	id_estudiantes INT,
	id_profesores INT,
	FOREIGN KEY (id_estudiantes) REFERENCES estudiantes (id_inscripcion),
	FOREIGN KEY (id_profesores) REFERENCES profesores (id)
);

INSERT INTO estudiantes (nombre, correo, Estudiante_Matricula) VALUES
('carlos','carlos@',123),
('laura','laura@',122),
('peña','peña@',121),
('manozalba','manozalba@',120);

INSERT INTO profesores (nombre) VALUES
('cristian'),
('pedro'),
('luis'),
('chimpandolfo');

INSERT INTO cursos (curso_codigo,curso_nombre) VALUES
('BD-101', 'programacion 1'),
('BD-102', 'programacion 2'),
('BD-103', 'programacion 3'),
('BD-104', 'programacion 4');

