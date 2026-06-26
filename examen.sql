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

CREATE TABLE IF NOT EXISTS notas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	notas DECIMAL(2,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS cursos(
	id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
	curso_codigo VARCHAR(6) UNIQUE NOT NULL,
	curso_nombre VARCHAR(40) UNIQUE NOT NULL,
	id_estudiantes INT,
	id_profesores INT,
	id_nota INT,
	FOREIGN KEY (id_estudiantes) REFERENCES estudiantes (id_inscripcion),
	FOREIGN KEY (id_profesores) REFERENCES profesores (id),
	FOREIGN KEY (id_nota) REFERENCES notas(id)
);


INSERT INTO notas(notas) VALUES
(4),
(3),
(5),
(2);

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

INSERT INTO cubiculos (profesor_cubiculo,id_profesor) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4');

/*
 1. (0.5 puntos) Uso de JOIN: Elabore una consulta que liste el código del curso, el
nombre del curso, el nombre del estudiante y la nota final obtenida, uniendo las
tablas que correspondan según su diseño.
 * */

SELECT 
	x.curso_codigo,
	x.curso_nombre,
	n.notas 
FROM colegio.cursos x
INNER JOIN notas n ON n.id = x.id_nota
GROUP BY (x.curso_codigo)
LIMIT 2;

/*
 
3. (0.5 puntos) Uso de GROUP BY y ORDER BY: Obtenga un reporte que agrupe los
datos por curso (Curso_Nombre) y calcule el promedio general de notas de cada
uno. Filtre los resultados para mostrar únicamente aquellos cursos cuyo promedio
sea menor a 3.0 (estudiantes reprobando en promedio), ordenados de forma
descendente (del promedio más alto al más bajo).

 
 */


/*
 4. (0.5 puntos) Uso de LIMIT: Para una campaña de excelencia académica, el
departamento necesita identificar a los estudiantes destacados. Escriba una consulta
que devuelva el Estudiante_Nombre junto con su promedio general de
calificaciones acumuladas, mostrando únicamente a los 5 estudiantes con los
promedios más altos (Top 5). 
 */

SELECT 
		
FROM colegio.cursos x
INNER JOIN notas n ON n.id = x.id_nota
GROUP BY (x.curso_codigo);




/*
 
 2. (0.5 puntos) Uso de LEFT JOIN: Se requiere una auditoría de la carga académica
de los docentes. Muestre un listado con todos los profesores registrados
(Profesor_Nombre), acompañados de la cantidad de cursos que dictan
actualmente. Nota: Si un profesor no tiene cursos asignados este periodo, debe
aparecer en la lista reflejando un total de 0.

 * /












