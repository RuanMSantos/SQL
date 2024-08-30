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