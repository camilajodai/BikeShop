CREATE DATABASE bikeshop;

USE bikeshop;

CREATE TABLE inventario(
idinventario INT AUTO_INCREMENT PRIMARY KEY,
modelo VARCHAR(50) not null,
marca varchar(100) not null,
quantidade INT not null,
preco DECIMAL(6,2),
idfornecedor INT not null
);

CREATE TABLE clientes(
idcliente int auto_increment primary key,
nome varchar(50) not null,
endereco varchar(250) not null,
numerotelefone varchar(15) not null,
email varchar(50)
);

CREATE TABLE vendas(
idvenda int auto_increment primary key,
data DATETIME default current_timestamp(),
idcliente int not null,
idinventario int not null,
quantidadevendida int not null,
precototal decimal(7,2) not null,
metododepagamento ENUM("Dinheiro","Crédito","Débito","Pix"),
idvendedor int not null
);

CREATE TABLE fornecedores(
idfornecedor int auto_increment primary key,
nomedofornecedor varchar(50) not null,
enderecodofornecedor varchar(250) not null,
telefonedofornecedor varchar(15) not null,
emaildofornecedor varchar(50) not null
);

CREATE TABLE vendedores(
idvendedor int auto_increment primary key,
nomedovendedor varchar(50) not null,
idfuncionario int not null
);

CREATE TABLE funcionarios(
idfuncionario int auto_increment primary key,
nomedofuncionario varchar(50) not null,
cargo varchar(50) not null,
salario decimal(7,2) not null,
datadeadmissao DATE not null
);

CREATE TABLE detalhevenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idinventario int not null
);

ALTER TABLE inventario ADD CONSTRAINT `fk.inventario_pk.fornec` foreign key inventario(`idfornecedor`) references fornecedores(`idfornecedor`);

ALTER TABLE vendas add constraint `fk.vendas_pk.clientes` foreign key vendas(`idcliente`) references clientes(`idcliente`);
ALTER TABLE vendas add constraint `fk.vendas_pk.inventario` foreign key vendas(`idinventario`) references inventario(`idinventario`);
ALTER TABLE vendas add constraint `fk.vendas_pk.vendedor` foreign key vendas(`idvendedor`) references vendedores(`idvendedor`);

ALTER TABLE vendedores add constraint `fk.vendedores_pk.funcionarios` foreign key vendedores(`idfuncionario`) references funcionarios(`idfuncionario`);

ALTER TABLE detalhevenda add constraint `fk.detalhevenda_pk.venda` foreign key detalhevenda(`idvenda`) references vendas(`idvenda`);
ALTER TABLE detalhevenda add constraint `fk.detalhevenda_pk.inventario` foreign key detalhevenda(`idinventario`) references inventario(`idinventario`);