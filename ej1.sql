-- Active: 1655377905197@@127.0.0.1@3306@Ej1_DDL_DML
create database Ej1_DDL_DML;
use Ej1_DDL_DML;

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