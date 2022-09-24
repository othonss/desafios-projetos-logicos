-- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIO E-COMMERCE
create database ecommerce;
use ecommerce;

-- CRIAR TABELA CLIENTE
create table cliente (
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

-- CRIAR TABELA PRODUTO
create table produtc (
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    Avaliacao float default 0,
    Size varchar(10),
    constraint unique_cpf_cliente unique (CPF)
);

-- CRIAR TABELA PEDIDO
