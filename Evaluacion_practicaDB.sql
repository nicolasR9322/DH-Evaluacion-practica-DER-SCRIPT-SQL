drop database if exists Evaluacion_practica;

create database Evaluacion_practica;
use Evaluacion_practica;

create table category(
id int(10) not null auto_increment,
name varchar(100) not null,
primary key(id)
);

create table deletable (
id int(10) not null auto_increment,
name varchar(100) not null,
primary key(id)
);

create table notes (
id int(10) not null auto_increment,
title varchar(100) not null,
created_at timestamp null default null,
updated_at timestamp null default null,
description varchar(100) not null,
category_id int(10) not null,
deletable_id int(1) not null,
primary key(id),
foreign key(category_id) references category(id),
foreign key(deletable_id) references deletable(id)
);

create table users (
id int(10) not null auto_increment,
name varchar(100) not null,
email varchar(100) not null,
notes_id int(10),
primary key(id),
foreign key (notes_id ) references notes(id)
);





