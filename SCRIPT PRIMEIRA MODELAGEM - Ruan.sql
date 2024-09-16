create database bd_exportacao;

use bd_exportacao;

create table tb_cliente
(
cnpj char(14) primary key,
nm_razao_social varchar(50) not null,
nm_pais varchar(30),
nm_email varchar(60) not null unique
);

create table tb_produto
(
cd_produto int primary key,
nm_produto varchar(30) not null,
vl_unitario decimal(6,2) not null
);

create table tb_nota
(
cd_nota int primary key,
dt_emissao date not null,
dt_envio date not null,
vl_total decimal(8,2),
fk_cnpj char(14),
foreign key (fk_cnpj) references tb_cliente (cnpj)
);

create table tb_item
(
cd_item int primary key,
fk_cd_produto int,
foreign key (fk_cd_produto) references tb_produto (cd_produto),
fk_cd_nota int,
foreign key (fk_cd_nota) references tb_nota (cd_nota),
qt_item int not null,
vl_total decimal(8,2)
);
