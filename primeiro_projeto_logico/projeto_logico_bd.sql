-- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIO E-COMMERCE
create database ecommerce;
use ecommerce;

-- CRIAR TABELA CLIENTE
create table clients (
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

/*
create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable float,
    primary key(idClient, idPayment)
);
*/

-- CRIAR TABELA PEDIDO
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- CRIAR TABELA ESTOQUE
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- CRIAR TABELA FORNECEDOR
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- CRIAR TABELA VENDEDOR
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstractName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPSeller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantify int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);


create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_product_seller foreign key (idLproduct) references product(idProduct),
    constraint fk_product_product foreign key (idLstorage) references orders(idOrder)
);
