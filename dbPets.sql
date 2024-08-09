-- apagar banco de dados
drop database dbPets;

-- criar banco de dados
create database dbPets;

-- acessar o banco de dados
use dbPets;

-- visualizar banco de dados
show databases;

-- criar tabelas no banco de dados
create table tbFuncionarios(
idFuncionarios int not null auto_increment,
nome varchar(100) not null,
cpf char(14) unique,
email varchar(100) unique,
sexo char(1) default 'F' check(sexo),
salario decimal(9,2),
nascimento date,
telCelular char(10),
primary key(idFuncionarios)
);

create table tbUsuarios(
idUsuarios int not null auto_increment,
nome varchar(50) not null,
senha varchar(10) not null,
idFuncionarios int not null,
primary key(idUsuarios),
foreign key(idFuncionarios)references tbFuncionarios(idFuncionarios)
);

-- visualizar tabelas
show tables;

-- visualizar estrutura das tabelas
desc tbFuncionarios;
desc tbUsuarios;