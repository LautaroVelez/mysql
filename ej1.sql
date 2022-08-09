-- Active: 1655338327203@@127.0.0.1@3306
CREATE DATABASE Ej1_DDL_DML;
USE Ej1_DDL_DML;

create table Peliculas(
    titulo varchar(20),
   actor varchar(20),
   duracion integer,
   cantidad integer
);

  insert into Peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3);
  insert into Peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,2);
  insert into Peliculas (titulo, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,3);
  insert into Peliculas (titulo, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',90,2);

  select titulo,actor from Peliculas;
  select titulo, duracion from Peliculas;
  select titulo, cantidad from Peliculas;
  
  create table Agenda(
    nombre varchar(20),
    domicilio varchar(30),
    telefono int(11)
  );

  insert into Agenda (nombre,domicilio,telefono) values ('Alberto Mores','Colon 123','4234567');
  insert into Agenda (nombre,domicilio,telefono) values ('Juan Torres','Avellaneda 135','4458787');
  insert into Agenda (nombre,domicilio,telefono) values ('Mariana Lopez','Urquiza 333','4545454');
    insert into Agenda (nombre,domicilio,telefono) values('Fernando Lopez','Urquiza 333','4545454');

select nombre from Agenda where nombre="Juan Torres";

select domicilio from Agenda where domicilio="Colon 123";
select telefono from Agenda where telefono="4545454";

drop table Agenda;

drop table if exists Articulos;

create table Articulos(
   codigo integer,
   nombre varchar(20),
   descripcion varchar(30),
   precio float,
   cantidad integer
  );

    insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
  insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
  insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
  insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
  insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);

  select * from Articulos;
  select codigo,nombre,descripcion,precio,cantidad from Articulos where nombre="impresora";
  select codigo,nombre,descripcion,precio,cantidad from Articulos where precio>=500;
  select codigo,nombre,descripcion,precio,cantidad from Articulos where cantidad<30;
  select nombre,descripcion from Articulos where precio!=100;

drop table if exists Empleados;
create table Empleados(
    nombre varchar(40),
    documento int(8) PRIMARY KEY,
    sexo varchar(20),
    domicilio varchar(30),
    sueldobasico int,
    check (sueldobasico<9999.99),
    hijos int
);

insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Juan Perez','22333444','m',300,1);
insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Ana Acosta','21333444','f',400,2);
insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Alberto Lopez','24333444','m',600,0);
insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Carlos Sanchez','30333444','m',550,3);
insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Mariana Torres','23444555','f',600,1);
insert into Empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Marcos Garcia','23664555','m',1500,2);

UPDATE Empleados SET sueldoBasico = sueldoBasico*0.1;

-------------------------------------5---------------------------------------------------------------
drop Table if EXISTS Empleados;
create table Empleados(
   documento char(8) not null,
   nombre varchar(30) not null,
   sexo char(1),
   domicilio varchar(30),
   fechaIngreso date,
   fechaNacimiento date,
   sueldoBasico decimal(5,2) unsigned,
   primary key(documento)
  );
  
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);
  insert into Empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30615426','Federico Gonzalez','m','Peru 390','1996-08-15','1985-05-01',580);

  select nombre, fechaNacimiento from Empleados where Month(fechaNacimiento)=5;
  
select nombre, fechaIngreso, sueldoBasico from Empleados where Month(fechaIngreso)=8;

ALTER TABLE Empleados
ADD column incremento int;
UPDATE Empleados set incremento= sueldoBasico*0.01 where Month(fechaIngreso)=8;
UPDATE Empleados SET sueldoBasico = sueldoBasico+incremento where Month(fechaIngreso)=8;
ALTER TABLE Empleados
ADD column añosServicio int;

update Empleados set añosServicio=  YEAR(CURDATE()) - Year(fechaIngreso);

--------------------------------------------6--------------------------------
drop table if exist Medicamentos;
create table Medicamentos(
   codigo int unsigned auto_increment,
   nombre varchar(20),
   laboratorio varchar(20),
   precio decimal(5,2),
   cantidad int unsigned,
   primary key(codigo)
  );

  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);

  select * from Medicamentos ORDER BY precio;
  select * from Medicamentos ORDER BY cantidad;
  
  select nombre,laboratorio,cantidad from `Medicamentos` order by cantidad;


--------------------------------------------7--------------------------------

drop table if exists `Medicamentos`;

 create table Medicamentos(
  codigo int unsigned auto_increment,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2) unsigned,
  cantidad int unsigned,
  primary key(codigo)
 );

   insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
  insert into Medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);

select * from Medicamentos where laboratorio="Roche" and precio<5;
select * from Medicamentos where laboratorio="Roche" or precio<5;
select * from Medicamentos where not laboratorio="Bayer";
select * from Medicamentos where not laboratorio="Bayer" and cantidad= 100;
select * from Medicamentos where not laboratorio="Bayer" and not cantidad= 100;
delete from `Medicamentos` where laboratorio="Bayer" and precio>10; 

update `Medicamentos` set cantidad=200 where laboratorio="Bayer" and precio>5;

delete from `Medicamentos` where laboratorio="Bayer" and precio<3; 

--------------------------------------------8--------------------------------

drop table if EXISTS `Medicamentos`;

 create table Medicamentos(
   codigo int unsigned auto_increment,
   nombre varchar(20),
   laboratorio varchar(20),
   precio decimal(5,2) unsigned,
   cantidad int unsigned,
   primary key(codigo)
  );

  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
  insert into Medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);

  select nombre,precio from `Medicamentos` where precio>5 and precio<15;

  select * from `Medicamentos` where laboratorio='Bayer' or laboratorio='Bago';
  delete from `Medicamentos`where cantidad>100 and cantidad<200;

--------------------------------------------9--------------------------------
drop table if EXISTS `Medicamentos`;
   create table Medicamentos(
       codigo int unsigned auto_increment,
       nombre varchar(20) not null,
       laboratorio varchar(20),
       precio decimal(6,2) unsigned,
       cantidad int unsigned,
       primary key(codigo)
     );

  insert into Medicamentos (nombre, laboratorio,precio) values('Sertal gotas','Roche',5.2);
  insert into Medicamentos (nombre, laboratorio,precio) values('Buscapina','Roche',4.10);
  insert into Medicamentos (nombre, laboratorio,precio) values('Amoxidal 500','Bayer',15.60);
  insert into Medicamentos (nombre, laboratorio,precio) values('Paracetamol 500','Bago',1.90);
  insert into Medicamentos (nombre, laboratorio,precio) values('Bayaspirina','Bayer',2.10); 
  insert into Medicamentos (nombre, laboratorio,precio) values('Amoxidal jarabe','Bayer',5.10); 
  insert into Medicamentos (nombre, laboratorio,precio) values('Sertal compuesto','Bayer',5.10); 
  insert into Medicamentos (nombre, laboratorio,precio) values('Paracetamol 1000','Bago',2.90);
  insert into Medicamentos (nombre, laboratorio,precio) values('Amoxinil','Roche',17.80);

select * from `Medicamentos` where nombre like "Amox%";

select * from `Medicamentos` where nombre like 'Paracetamol%' and precio<2;
select * from `Medicamentos` where precio like '%10';

select * from `Medicamentos` where nombre not like "%compuesto%";
delete from `Medicamentos` where laboratorio  like "%y%";

UPDATE Medicamentos SET precio = 5 where nombre like 'Paracetamol%' and precio>2;

--------------------------------------------10--------------------------------
drop Table if EXISTS Agenda;
 create table Agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30)
 );

     insert into Agenda values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
     insert into Agenda values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
     insert into Agenda values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
     insert into Agenda values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
     insert into Agenda values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
     insert into Agenda values('Ferreyra','Patricia','Colon 1534','4585858',null);
     insert into Agenda values('Perez','Susana','San Martin 333',null,null);
     insert into Agenda values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
     insert into Agenda values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

     select * from Agenda where mail like '%gmail%';

     select * FROM Agenda where apellido not like '%z%' and not'%g%';

     select * FROM Agenda where apellido like '%z%' or '%v%' or '%w%' or '%x%' or '%y%' or '%z%';
     SELECT * FROM Agenda where apellido like '%ez';

     select apellido, nombre, domicilio from Agenda where apellido like '%i%i%';
     
    SELECT * FROM Agenda WHERE LENGTH(telefono) = 7;

    SELECT * FROM Agenda WHERE LENGTH(mail) >= 20;

--------------------------------------------11--------------------------------

drop Table if EXISTS visitantes;
create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal (6,2) unsigned
 );

  insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

 SELECT COUNT(*) FROM visitantes;  
  SELECT COUNT(*) FROM visitantes where telefono is not null;  
  select * from visitantes where sexo='m';
  select * from visitantes where edad>25 and sexo='f';
  select * from visitantes where ciudad not like '%Cordoba';
  select * from visitantes where not montocompra= 0;
  select * from visitantes where montocompra= 0;

-------------------------------------------12--------------------------------
drop Table if EXISTS visitantes;
 create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal (6,2) unsigned
 );

 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

  SELECT COUNT(*) FROM visitantes;  

  select sum(montocompra) from visitantes where ciudad='Alta Gracia';

  select max(montocompra) from visitantes;
 select min(edad) from visitantes;
  select avg(edad) from visitantes;
 select avg(montocompra) from visitantes;

 -------------------------------------------13--------------------------------
 drop table if exists clientes;
  create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
 );
  insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');

 select COUNT(*) from clientes;
select COUNT(*) from clientes where telefono is not null;

  SELECT ciudad,provincia FROM clientes GROUP BY ciudad,provincia order by provincia;

  -------------------------------------------14--------------------------------

   drop table if exists clientes;
   create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
 select COUNT(*),ciudad,provincia from clientes GROUP BY ciudad,provincia order by provincia;
 select COUNT(*),ciudad,provincia from clientes GROUP BY ciudad,provincia order by provincia,ciudad;
SELECT COUNT(*) as cantidad,ciudad,provincia FROM clientes where telefono is not null GROUP BY ciudad,provincia HAVING count(*)>1 ORDER BY provincia;

-------------------------------------------15--------------------------------