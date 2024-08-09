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
idFuncionario int not null auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
email varchar(100) unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(idFuncionario)
);

create table tbFornecedores(
idFornecedor int not null auto_increment,
nome varchar(100) not null,
cnpj char(17) not null unique,
emai varchar(100) not null,
primary key(idFornecedor)
);

create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(idCliente)
);

create table tbUsuarios(
idUsuario int not null auto_increment,
nome varchar(50) not null unique,
senha varchar(10) not null,
idFuncionarios int not null,
primary key(idUsuario),
foreign key(idFuncionario)references tbFuncionarios(idFuncionario)
);

create table tbProdutos(
idProduto int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2) default 0 check(salario >=0),
validade date,
dataEntrada date,
horaEntrada date,
idFornecedor int not null,
primary key(idProduto),
foreign key(idFornecedor)references tbFornecedores(idFornecedor)
);

create table tbVendas(
idVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
idUsuario int not null,
idCliente int not null,
idProduto int not null,
primary key(idVenda),
foreign key(idUsuario)references tbUsuarios(idUsuario),
foreign key(idCliente)references tbClientes(idCliente),
foreign key(idProduto)references tbProdutos(idProduto)
);

-- visualizar tabelas
show tables;

-- visualizar estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;