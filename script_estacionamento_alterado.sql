create database bd_estacionamento;

use bd_estacionamento;

create table tb_proprietario(
cpf_proprietario char(11) primary key,
nm_proprietario varchar(45) not null,
nr_fone char(11) not null
);

create table tb_veiculo(
cd_veiculo int primary key auto_increment,
id_tipo bit not null,
nr_placa char(7) not null,
nm_marca varchar(25),
nm_modelo varchar(25),
fk_cpf_proprietario char(11),
foreign key (fk_cpf_proprietario) references tb_proprietario(cpf_proprietario)
);

create table tb_mensalidade(
cd_mensalidade int primary key auto_increment,
dt_pagamento date not null,
vl_pago decimal(6,2) not null,
fk_cpf_proprietario char(11),
foreign key (fk_cpf_proprietario) references tb_proprietario(cpf_proprietario)
);

create table tb_entrada_saida(
cd_entrada_saida int primary key auto_increment,
hr_entrada datetime not null,
hr_saida datetime,
vl_pago decimal(6,2),
id_mensalista bit not null,
fk_cd_veiculo int,
foreign key (fk_cd_veiculo) references tb_veiculo (cd_veiculo)
);

alter table tb_proprietario
add email varchar(30);

alter table tb_veiculo
change nm_marca nm_fabricante varchar(25);

alter table tb_veiculo
drop column nm_modelo;

alter table tb_mensalidade
modify vl_pago decimal(8,2) not null;

alter table tb_entrada_saida
rename tb_controle;

alter table tb_controle
change hr_entrada id_entrada datetime;

alter table tb_controle
change hr_saida id_saida datetime;