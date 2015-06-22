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
	url varchar(200),
	fecha datetime
);

create table noticias(
	id int primary key auto_increment,
	titulo varchar(50),
	descripcion varchar(500),
	url varchar(200)
);