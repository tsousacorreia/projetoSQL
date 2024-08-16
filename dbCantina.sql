-- apagar banco de dados
drop database dbCantina;

-- criar banco de dados
create database dbCantina;

-- acessar o banco de dados
use dbCantina;

-- visualizar banco de dados
show databases;

-- criar tabelas no banco de dados
create table tbFuncionarios(
idFuncionario int not null auto_increment,
nome varchar(100) not null,
cpf varchar(14) not null unique,
email varchar(100) unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(11),
primary key(idFuncionario)
);

create table tbFornecedores(
idFornecedor int not null auto_increment,
nome varchar(100) not null,
cnpj varchar(18) not null unique,
email varchar(100) not null,
primary key(idFornecedor)
);

create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(11),
primary key(idCliente)
);

create table tbUsuarios(
idUsuario int not null auto_increment,
nome varchar(50) not null unique,
senha varchar(10) not null,
idFuncionario int not null,
primary key(idUsuario),
foreign key(idFuncionario)references tbFuncionarios(idFuncionario)
);
create table tbProdutos(
idProduto int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2) default 0 check(valor >=0),
validade date,
dataEntrada date,
horaEntrada time,
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

-- inserir registros nas tabelas

insert into tbFuncionarios(nome,cpf,email,sexo,salario,nascimento,telCelular)values('Thiago','222.333.444-55','thiago@email.com','M',9000.00,'1989/05/14','99898-7675');
insert into tbFuncionarios(nome,cpf,email,sexo,salario,nascimento,telCelular)values('Simone','111.333.555-77','simone@email.com','F',8200.00,'1986/03/21','99471-5478');
insert into tbFornecedores(nome,cnpj,email)values('Loja Tem de Tudo','123.456.789-10','lojatdt@email.com');
insert into tbFornecedores(nome,cnpj,email)values('Loja Super Oferta','234.567.891-11','lojasupo@email.com');
insert into tbClientes(nome,email,telCelular)values('Juliana','juliana@email.com','95624-8753');
insert into tbClientes(nome,email,telCelular)values('Mariana','mariana@email.com','98642-7891');
insert into tbClientes(nome,email,telCelular)values('Lucas','lucas@email.com','95549-1245');
insert into tbUsuarios(nome,senha,idFuncionario)values('Thiago','426153', 1);
insert into tbUsuarios(nome,senha,idFuncionario)values('Simone','153456', 2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,idFornecedor)values('Garrafa Termica',100,10.00,'2034/12/01','2024/08/16','19:53:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,idFornecedor)values('Ventilador',50,159.90,'2034/12/01','2024/08/16','19:54:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,idFornecedor)values('TV Smart',80,4179.90,'2034/12/01','2024/08/16','19:55:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,idFornecedor)values('Geladeira',30,6250.90,'2034/12/01','2024/08/16','19:56:00',2);
insert into tbVendas(dataVenda,horaVenda,quantidade,idUsuario,idCliente,idProduto)values('2024/08/16','20:00',2,1,3,3);
insert into tbVendas(dataVenda,horaVenda,quantidade,idUsuario,idCliente,idProduto)values('2024/08/16','20:03',10,2,1,1);
insert into tbVendas(dataVenda,horaVenda,quantidade,idUsuario,idCliente,idProduto)values('2024/08/16','20:05',1,1,2,4);

-- visualizar os registros das tabelas

select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;