create database ispharmadb;
use ispharmadb;

create table login(
	id int primary key auto_increment,
	nombre varchar(200),
	usuario varchar(20),
	password varchar(50),
	fecha_creacion datetime default now(),
	activo boolean
);

create table cursos(
	id int primary key auto_increment,
	titulo varchar(50),
	descripcion varchar(500),
	imagen MEDIUMBLOB,
	extension varchar(10),
	fecha_creacion datetime default now()
);

create table noticias(
	id int primary key auto_increment,
	titulo varchar(50),
	descripcion varchar(500),
	imagen MEDIUMBLOB,
	extension varchar(10),
	fecha_creacion datetime default now()
);

alter table cursos change image imagen blob;
drop table noticias;
drop table cursos;

select* from login;

select* from noticias;
select * from cursos;
SELECT * FROM cursos WHERE fecha > '2015-06-23';

select count(*) as cursos from cursos;

SELECT * FROM cursos LIMIT	0,10;

delete from cursos where id =1;

SELECT * FROM cursos where id=16;

 SELECT * FROM cursos Where id=16 LIMIT 0,16