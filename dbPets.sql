-- apagar banco de dados
drop database dbPets;
-- criar banco de dados
create database dbPets;
-- acessar o banco de dados
use dbPets;
-- visualizar banco de dados
show databases;
-- criar tabelas no banco de dados
create table tbUsuarios(
idUsuario int not null auto_increment,
nome varchar(50) not null,
senha varchar(10) not null,
primary key(idUsuario)
);
create table tbFuncionarios(
idFuncionarios int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(11),
primary key(idFuncionarios)
);
-- visualizar tabelas
show tables;
-- visualizar estrutura das tabelas
desc tbUsuarios;