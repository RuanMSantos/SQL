create database bd_estacionamento;

use bd_estacionamento;

create table tb_proprietario
(
	cd_proprietario int primary key not null auto_increment,
    st_proprietario char(3) not null,
    cpf_proprietario char(11) unique,
    nm_proprietario varchar(30),
    nr_telefone varchar(11) unique,
    vl_mensalista decimal(5,2)
);

create table tb_mensalidade
(
	cd_mensalidade int primary key not null auto_increment,
    st_pagamento varchar(7) not null,
    dt_pagamento_mensalidade date,
    vl_pagamento_mensalidade decimal(5,2),
    fk_cd_proprietario int,
    foreign key (fk_cd_proprietario) references tb_proprietario (cd_proprietario)
);

create table tb_veiculo
(
	nr_placa_veiculo varchar(8) primary key not null,
    ds_veiculo varchar(5),
    nm_modelo_veiculo varchar(25),
    nm_marca_veiculo varchar(20),
    fk_cd_proprietario int,
    foreign key (fk_cd_proprietario) references tb_proprietario (cd_proprietario)
);

create table tb_entrada
(
cd_entrada int primary key not null auto_increment,
dt_entrada date not null,
hr_entrada varchar(5) not null,
fk_nr_placa_veiculo varchar(8),
foreign key (fk_nr_placa_veiculo) references tb_veiculo (nr_placa_veiculo)
);

create table tb_saida
(
cd_saida int primary key not null auto_increment,
ds_proprietario varchar(10) not null,
hr_saida char(5),
vl_pago_saida decimal(5,2),
fk_nr_placa_veiculo varchar(8),
foreign key (fk_nr_placa_veiculo) references tb_veiculo (nr_placa_veiculo)
);
