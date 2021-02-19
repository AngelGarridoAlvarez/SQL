
/*
instalar MySql:
brew install mysql 

brew services start mysql

ABRIR MySQL: mysql -u root -p , no poner password
mysql -u root: así me evito el password
 */


 --------------------------------------------------Apuntes-----------------------------------------------------

create database empresaLogistica ;

show databases;

use empresaLogistica;

create table camionero (rfc int(3), nombre varchar(20) not null, telefono varchar(9), salario float(7,2), direccion varchar(50), poblacion varchar(40), primary key (rfc));

describe camionero;

create table paquete (codigoP varchar(5) primary key, descripcion varchar(100), destinatario varchar(20), direccionP varchar(50), codRepartidor int(3), foreign key (codRepartidor) references camionero(rfc));

describe paquete;

use empresaLogistica;

alter table camionero add email varchar(40) not null;
alter table camionero modify email varchar(100) not null;
alter table camionero Change email correoE varchar(100);
alter table camionero drop correoE;
alter table camionero drop apellidos;


insert into camionero values (987,"Paco",123456789,500,"calle del Pez", "Granada"); /*dar de alta un camionero*/

insert into camionero (rfc, nombre, salario) values (123,"María",12000);
insert into camionero (rfc, nombre, salario) values (333, "Adela", 789.90);

select * from camionero; /*seleccionar todos los campos */

insert into camionero (rfc, salario) values (222, 40); /*como no meto el nombre que hemos dicho que era not null cuando hemos definido camionero me va a dar error*/

insert into camionero (rfc, nombre, poblacion) values (222, "Juan", "Madrid"),(444, "Irene", "Castellón"),(555, "Cristina", "Oviedo");

insert into camionero (rfc, nombre) --> si no le doy al ; me va  salir para que ponga linea por linea, es recomendable hacero en un editor de texto para poder manipular mejor con copy-paste

(567, "Manolita");
(2322323, "jajajajaja");

replace into camionero (rfc, nombre) values (123, "Juanita"); --> me cambia María que está en la posición 123 por juanita

delete from camionero --> Warning, la cagas si pones esto sin condiciones

delete from camionero where rfc="2322323" --> me borra quien esté en la posición 2322323

delete from camionero where poblacion="Madrid";

update camionero set salario = 1 where salario is null;

--> si nos piden el tlf de los camioneros de granada:
select nombre, telefono from camionero where poblacion="Granada";

--> si queremos que nos saque la información nombre como Camionero por consola (solo me las enseña una vez, no nos lo cambia en nuestras BBDD)
select nombre as CAMIONERO, telefono from camionero where poblacion="Granada";


--> && y ||
select nombre as CAMIONERO, telefono from camionero where poblacion="Granada" OR NOMBRE="Adela";
select nombre as CAMIONERO, telefono from camionero where poblacion="Granada" AND NOMBRE="Adela";

--> Podemos elegir el orden en el que nos salen las cosas:
select poblacion, salario, nombre from camionero where poblacion="Granada";


-->Podemos pedir operaciones aritméticas
select poblacion, salario, salario +(salario*0.10) as aumentoAño2021 from camionero;
select poblacion, salario, salario +(salario*0.10) as aumentoAño2021 from camionero where (salario*1.10) > 1.10;
 
 -->Operadores que podemos utilizar: a = b, a<>b (distinto), ...
 select poblacion, salario, salario + (salario*0.10) as aumentoAño2021 from camionero where (salario <> 1);

 -->between, en lugar de poner dos valores podemos poner un rango con between
select * from libro where autor='Paco' or autor='Pepe Botella';

--> busqueda de palabras que no sabemos exactamante como se escriben
select telefono from camionero where nombre like "cris%";
select nombre, salario from camionero where nombre like "%e%" order by salario desc;

--> Ordenar descendente
select nombre, salario from camionero order by salario desc;
select nombre, salario from camionero order by salario asc;



-->Contar campos

select count(*) from camionero;
--> aquí nos cuenta todos cuyo campo no sea nulo
select count(telefono) from camionero;


--> Group by, agrupa registros
select ediorial, avg(precio) from libros group by editorial having avg(precio)>10;

--> Se puede modificar una tabla con: insert, delete, update
update camionero set poblacion="Granada" where rfc=123;


-->evitar que se dupliquen resultados con DISTINCT:
select poblacion from camionero;
select distinct poblacion from camionero; --> Aquí no nos muestra valores repetidos

--> AVG(), MAX(), SUM(), AVG(), MIN();
select sum(salario) as totalSueldoMensual from camionero;
select min(salario) as sueldoMinimo from camionero;



 ----------------------------------------Ejercicio PDF tienda------------------------------------------------------

--> Crear la base de datos de la tienda.
create table productos (codigo varchar(3) primary key, nombre varchar(20),  precio float(4,2), fechaAlta date);

--> Introducir 10 registros/ datos de ejemplo

INSERT INTO productos VALUES ('c01','Cepillo abrillantar', 2.50, '2017-11-02'); INSERT INTO productos VALUES ('r01','Regleta mod. ZAZ', 10, '2018-05-03'); INSERT INTO productos VALUES ('r02','Regleta mod. XAX', 15, '2018-05-03'); INSERT INTO productos VALUES ('p01','Pegamento rápido', 6.50, '2017-11-02'); INSERT INTO productos VALUES ('p02','Pegamento industrial', 14.50, '2017-10-06'); INSERT INTO productos VALUES ('a03','Azada grande 60cm', 50.60, '2018-05-03'); INSERT INTO productos VALUES ('c02','Cepillo birutas', 6.20, '2017-10-06'); INSERT INTO productos VALUES ('c03','Cepillo jardín', 22.35, '2018-05-03'); INSERT INTO productos VALUES ('a01','Azada pequeña 30cm', 25, '2017-10-06'); INSERT INTO productos VALUES ('a02','Azada mediana 45 cm', 37.50, '2017-11-02');

--> Mostrar todos los datos introducidos.

select * from productos ;

--> Mostrar los datos que tienen un cierto nombre.

select * from productos where nombre like "%egamento%" --> and descripcion like "%orcelana%";

--> Ver sólo el nombre y el precio de los que cumplen una condición (precio > 22)

SELECT nombre, precio FROM productos WHERE precio > 22;

--> Ver el precio medio de aquellos cuyo nombre comienza con "regleta"

SELECT truncate(AVG(precio),2) AS "precio medio" from productos where nombre like "%egleta%";

--> Modificar la estructura de la tabla para añadir un nuevo campo: "categoría"

ALTER TABLE PRODUCTOS ADD categoria varchar(20);

--> Dar el valor "utensilio" a la categoría de todos los productos existentes

UPDATE productos set categoria = "utensilio";

--> Modificar los productos que comienza por la palabra "regleta", para que su categoría se enchufes

UPDATE productos set categoria = "enchufes" where nombre like "%regleta%";

--> Ver la lista categorías

select  categoria from productos; 

select distinct categoria from productos; 

--> Ver la cantidad de productos que tenemos en cada categoría.

SELECT categoria, COUNT(*) as "total productos" from productos group by categoria;
SELECT categoria, COUNT(nombre) from productos group by categoria;--> muestra los registros no nulos


--> Introducir: a fecha actual, un nuevo utensilio con nombre Cepillo Birutas pequeño, con código “c02”, y con precio 6.30.

insert into productos (precio, nombre, categoria, fechaAlta, codigo) VALUES (6.30, "Cepillo Virutas peq", "utensilio", "2020-06-11", "c02");
        --> nos devuelve error ERROR 1062 (23000): Duplicate entry 'c02' for key 'productos.PRIMARY'
insert into productos (precio, nombre, categoria, fechaAlta, codigo) VALUES (6.30, "Cepillo Virutas peq", "utensilio", "2020-06-11", "c10");


--> Renombrar la tabla con el nombre ‘Productos B’

rename table productos to ProductosB;
alter table ProductosB rename ProductosC;

--> valor más caro de la tienda

select max(precio) from ProductosC;

select nombre, precio from ProductosC where precio = 50.60;
select @camRico:=max(salario) from camionero; -->usando una variable

--> lo podemos sacar con una sola linea:
select nombre, precio from  ProductosC where precio=(select Max(precio) from ProductosC);

--> ordenar los cepillos poniendo primero el más caro:
select nombre, precio from ProductosC where nombre like "Cepillo%" ORDER by precio desc;

--> ordenar por fecha alta
select nombre, precio, fechaAlta from ProductosC where nombre like "Cepillo%" ORDER by fechaAlta desc;


----------------------------------------Ejercicio PDF tienda2------------------------------------------------------
-- PAUTAS EJERCICIO FINDE:
-- 1.- creación BBDD
-- 2.- creación de las tablas a partir del DER
-- 3.- inserción de Registros
-- 4.- resolución de consultas;

--Creación tabla cliente--
create table cliente(codCliente int auto_increment primary key, nombre varchar(50) not null, apellidos varchar(50), empresa varchar(50), puesto varchar(50), direccion varchar(50), poblacion varchar(25) default 'Écija', cp varchar(5) default '41400', provincia varchar(25) default 'Sevilla', telefono varchar(9), fechaNac date);

--Creación tabla artículo--
create table articulo(codArticulo int auto_increment primary key, nombre varchar(20), descripcion varchar(20) not null, precioUnidad float(7,2), unidadesEnStock float(4,3), stockDeSeguridad int default 2, imagen varchar(50));

--Creación tabla compra--
create table compra(codCliente int, codArticulo int, fechaCompra date, unidades int(5), foreign key (codCliente) references cliente(codCliente), foreign key (codArticulo) references articulo(codArticulo));

--Insertar registros en tabla cliente--
insert into cliente values(1, 'José', 'Fernández Ruiz', 'Estudio Cero', 'Gerente','Cervantes, 13', default, default, default, '656789043', '1968-06-13');
insert into cliente values(2, 'Luis', 'Fernández Chacón', 'Beep', 'Dependiente','Aurora, 4', default, default, default, '675894566', '1982-05-24');
insert into cliente values(3, 'Antonio', 'Ruiz Gómez', 'Comar', 'Dependiente','Osuna, 23', default, default, default, '654345544', '1989-08-06');
insert into cliente values(4, 'Andrea', 'Romero Vázquez', 'Estudio Cero', 'Dependiente','Cervantes, 25', default, default, default, '646776657', '1974-11-23');
insert into cliente values(5, 'José', 'Pérez Pérez', 'Beep', 'Gerente','Córdoba, 10', default, default, default, '645345543', '1978-04-10');

--Insertar registros en tabla producto--
INSERT INTO articulo VALUES(1, 'NETGEAR switch prosafe', 'Switch 8 puertos GigabitEthernet', 125, 3, 2, null );
alter table articulo modify descripcion varchar(100) not null;
 
INSERT INTO articulo VALUES( 2, 'Switch SRW224G4-EU de Lynksys', 'CISCO switch 24 puertos 10/100', 202.43, 2, 2, null );
 
INSERT INTO articulo VALUES( 3, 'Switch D-link', 'D-link smart switch 16 puertos', 149.90, 7, 4, null );
 
INSERT INTO articulo VALUES( 4, 'Switch D-link', 'D-link smart switch 16 puertos', 489.00, 4, 2, null);

--Insertar registros en tabla compra--
insert into compra values(1, 1, "2010-10-13", 2);
insert into compra values(1, 2, "2010-10-13", 1);
insert into compra values(2, 3, "2010-10-15", 1); 
insert into compra values(2, 4, "2010-10-15", 1); 
insert into compra values(3, 1, "2010-10-15", 2); 
insert into compra values(4, 2, "2010-10-15", 1); 
insert into compra values(5, 3, "2010-10-15", 3); 
insert into compra values(1, 4, "2010-10-16", 1);
insert into compra values(1, 1, "2010-10-16", 2); 
insert into compra values(2, 2, "2010-10-17", 1); 
insert into compra values(3, 3, "2010-10-18", 4); 
insert into compra values(4, 4, "2010-10-19", 2); 
insert into compra values(5, 1, "2010-10-19", 1);

--1.- Mostrar los apellidos y teléfono de los clientes llamados José o Luis ordenados alfabéticamente por nombres.--
select apellidos from cliente where nombre in ("José", "Luis") order by nombre;
select codCliente, nombre, apellidos, telefono from cliente where nombre in ("José", "Luis") order by nombre;

--2.- Mostrar todos los clientes ordenados por su fecha de nacimiento.--
select * from cliente order by fechaNac;

--3.- Mostrar nombre y apellidos de los clientes que no tengan teléfono.--
select nombre, apellidos from cliente where telefono is null;

--4.- Mostrar aquellos productos cuyo stock en almacén sea menor que cuatro.--
select unidadesEnStock, nombre from articulo where unidadesEnStock <=4;

--5.- Mostrar el nombre, la descripción y la ruta de la imagen de los productos que valgan menos de 200 €.--
select nombre, descripcion, imagen, precioUnidad from articulo where precioUnidad <=200;

--6.- Descubrir cuántos productos tenemos de D-link.--
select count(nombre) from articulo where nombre like "%D-link%";

--7.- ¿Cuál es la descripción de los productos de D-link?--
update articulo set descripcion="D-link smart switch 48 puertos" where codArticulo=4;

--8.- ¿Cuántas compras se llevan realizadas?--
select count(unidades) from compra;
select count(unidades) as "numeroCompras" from compra;

--9.- ¿Cuántas compras ha realizado el cliente 4? ¿Quién es?--
select count(*) from compra where codCliente=4;
select nombre, apellidos from cliente where codCliente=4;

--10.- ¿Cuántas unidades se han comprado del producto 2? ¿Qué producto es?--
select count(unidades) from compra where codArticulo=2;
select descripcion from articulo where codArticulo=2;
--Ahora con una sola query las dos anteriores--
select articulo.nombre, count(*)  as totalUnidades from compra, articulo where articulo.codarticulo=compra.codarticulo and compra.codArticulo=2;

--Quién las ha comprado?--
select codCliente from compra where codArticulo=2;
select nombre, apellidos from cliente where codCliente in (1, 2, 4);

--11.- ¿Cuál es el precio más caro de la tienda? ¿A qué producto pertenece?--
select max(precioUnidad) as "articuloMasCaro" from articulo;
select descripcion, precioUnidad from articulo where precioUnidad=489;
--Ahora con query's anidadas--
select descripcion, precioUnidad from articulo where precioUnidad=(select max(precioUnidad) from articulo);

--12.- ¿Qué media de precios se maneja en la tienda? ¿Cuántos de los actuales productos superan ese precio medio? ¿Qué productos son?--
select avg(precioUnidad) as "mediaDePrecios" from articulo;
select count(*) from articulo where precioUnidad>(select avg(precioUnidad) from articulo);
select descripcion from articulo where precioUnidad>(select avg(precioUnidad) from articulo);


--13.- Mostrar, sin repeticiones, los nombres de todos nuestros clientes--
select distinct nombre from cliente;


--14.- Obtener el nombre y el teléfono de los clientes cuya edad está comprendida entre 30 y 40 años ordenados por edad--
--TRUNCATE muestra la cantidad de decimales que le pases por parámetro--
--DATEDIFF para calcular número de días entre dos fechas--
select nombre, telefono, truncate(DATEDIFF(now(), fechaNac)/365, 1) as edad from cliente where (DATEDIFF(now(), fechaNac)/365) between 30 and 40;
--Ordenar por edad de mayor a menor--
select nombre, telefono, truncate(DATEDIFF(now(), fechaNac)/365, 0) as edad from cliente where (DATEDIFF(now(), fechaNac)/365) between 30 and 40 order by edad desc;

--PRÁCTICAS JOIN's--
--Saber todo lo que ha comprado cada cliente--(Solo se pone delante el nombre de la tabla cuando el nombre del campo se repite entre las tablas)
select concat(cliente.nombre, " ", apellidos), articulo.nombre, fechaCompra, unidadesEnStock as Unidades from cliente JOIN compra ON cliente.codCliente=compra.codCliente JOIN articulo ON compra.codArticulo=articulo.codArticulo order by apellidos;

--Crear tabla proveedores N:1 (Los articulos son traídos por proveedores)--
create table fabricante(codFabricante int primary key, nombreFabricante varchar(100));

--Crear campo codFabricante en tabla articulo para conectarla con tabla fabricante--
ALTER TABLE articulo ADD codFabricante int;
ALTER TABLE articulo ADD constraint FOREIGN KEY (codFabricante) REFERENCES fabricante(codFabricante);

--Introducir valores a fabricante--
insert into fabricante values(111, "Lynksys");
insert into fabricante values(222, "Netgear");
insert into fabricante values(333, "D-link");

--Introducir valores al nuevo campo codFabricante de la tabla articulo--
update articulo set codFabricante=222 where codArticulo=1;
update articulo set codFabricante=111 where codArticulo=2;
update articulo set codFabricante=333 where codArticulo=3;
update articulo set codFabricante=333 where codArticulo=4;

--Introducir más campos en la tabla fabricante--
ALTER TABLE fabricante ADD (direccion varchar(50), telefono varchar(9));

--Introducir valores a los nuevos campos de la tabla fabricante--
update fabricante set direccion="Calle del Pino, 23", telefono="678987765" where codFabricante=111;
update fabricante set direccion="Calle del Olmo, 29", telefono="678987700" where codFabricante=222;
update fabricante set direccion="Calle del Nogal, 49", telefono="655987700" where codFabricante=333;

--1.- Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante--
select * from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante;
--quitando campos repetidos:--
select articulo.*, nombreFabricante, direccion, telefono from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante;

--2.- Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante--
select articulo.nombre, precioUnidad, nombreFabricante from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante;
--sacar por pantalla descripcion artículo, importe y fabricante--
select descripcion, precioUnidad, nombreFabricante from articulo join fabricante on articulo.codFabricante=fabricante.codFabricante;

--3.- Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante, dos decimales y un alias--
select codFabricante, ROUND(AVG(precioUnidad),2) AS "precio medio" from articulo where codFabricante group by codFabricante;

--4.- Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante (agrupando con group by para evitar fabricantes repetidos)--
select nombreFabricante, ROUND(AVG(precioUnidad),2) AS "precio medio" from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante group by nombreFabricante;

--5.- Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 € (HAVING: para aplicar un filtro una vez hecha una agrupación)--
select nombreFabricante, ROUND(AVG(precioUnidad),2) AS "precio medio" from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante group by nombreFabricante HAVING AVG(precioUnidad)>=150;
--Lo mismo pero ahora mostrando los que contengan una 'd' en su nombre--
select nombreFabricante, ROUND(AVG(precioUnidad),2) AS "precio medio" from articulo JOIN fabricante on articulo.codFabricante=fabricante.codFabricante group by nombreFabricante HAVING nombreFabricante like
"%d%";

--6.- Obtener el nombre y precio del artículo más barato--
select nombre, precioUnidad from articulo where precioUnidad = (select min(precioUnidad) from articulo);

--7.- Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor)--
select a.nombre, a.precioUnidad, f.nombreFabricante
from articulo a
join fabricante f on a.codFabricante = f.codFabricante
where a.precioUnidad = (select max(a.precioUnidad) from articulo a where a.codFabricante = f.codFabricante) GROUP BY a.codFabricante;
 
 SELECT A.Nombre, A.PrecioUnidad, F.Nombre 
 FROM ARTICULO A 
 JOIN FABRICANTE F ON A.Fabricante = F.Codigo 
 WHERE A.PrecioUnidad = (SELECT MAX(A.PrecioUnidad) FROM ARTICULO A   WHERE A.Fabricante = F.Codigo) GROUP BY Fabricante;

--8.- Aplicar un descuento del 10 % a todos los productos--