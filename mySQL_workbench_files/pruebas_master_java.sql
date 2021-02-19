-- Obtener todos los datos de la tabla empleados 
SELECT * FROM pruebamasterjava.empleados;
-- Obtener todos los datos de los empleados que cobren más de 2000€
SELECT nombre, apellidos, fecha_nacimiento, salario
FROM empleados
WHERE salario > 2000;

-- Obtener todos los datos de los empleados que cobren menos de 2000€
SELECT nombre, apellidos, salario
FROM empleados
WHERE salario < 2000;

-- Obtener cuánto cuesta a la empresa pagar a todos sus empleados:
SELECT sum(salario) AS total_salarios
FROM empleados;

-- ¿Qué cantidad de empleados hay en la empresa?
SELECT count(*) AS Cantidad_empleados
FROM empleados;

-- Obtener el salario medio de los empleados
SELECT sum(salario)/count(*) AS Salario_Medio_Empleados
FROM empleados;

-- La consulta anterior equivale a
SELECT AVG(salario) as Salario_Medio_Empleados_II
FROM empleados;

-- Obtener el salario máximo y el salario mínimo de los empleados
SELECT min(salario) AS Salario_Min, max(salario) AS Salario_Max
FROM empleados;

-- Obtener nombre, apellidos y salario del empleado que tiene el salario mínimo.
SELECT nombre, apellidos, salario AS salario_min
FROM empleados
WHERE salario = 0;

-- Obtener todas las mujeres que trabajan en la empresa
SELECT *
FROM empleados
where sexo = 'M';

-- Obtener los datos de todos los empleados cuyo nombre acabe en el
SELECT *
FROM empleados
WHERE nombre like '%l';


