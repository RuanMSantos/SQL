create database bd_nota_servico_avulsa;

use bd_nota_servico_avulsa;

create table tb_prestador
(
	cd_prestador int primary key auto_increment,
    cpf_prestador char(11) not null unique,
    cnpj_prestador char(14) not null unique,
    nm_prestador varchar(45),
    nm_razao_social varchar(45) unique,
    nm_endereco varchar(45),
    nm_bairro varchar(45),
    nr_endereco int,
    nm_cidade varchar(45),
    sg_estado char(2),
    nr_cep char(7),
    nr_inscricao_estadual char(12) unique,
    nr_inscricao_municipal char(14) unique
);

create table tb_tomador
(
	cd_tomador int primary key auto_increment,
    cpf char(11) not null unique,
    cnpj char(14)not null unique,
    nm_tomador varchar(45),
    nm_razao_social varchar(45) unique,
    nm_endereco varchar(45),
    nm_bairro varchar(45),
    nr_endereco int,
    nm_cidade varchar(45),
    sg_estado char(2),
    nr_cep char(7),
    nr_inscricao_estadual char(12) unique,
    nr_inscricao_municipal char(14) unique
);

create table tb_nota
(
	cd_nota int primary key auto_increment,
    cd_barras_nota char(6) not null unique,
    dt_emissao date,
    vl_total decimal(6,2),
    fk_cd_prestador int,
    foreign key (fk_cd_prestador) references tb_prestador(cd_prestador),
    fk_cd_tomador int,
    foreign key (fk_cd_tomador) references tb_tomador(cd_tomador)
);

create table tb_servico
(
	id_servico int primary key,
    ds_servico text,
    vl_unitario decimal(4,2)
);

create table item
(
	id_servico int primary key,
    fk_cd_nota int,
    foreign key (fk_cd_nota) references tb_nota (cd_nota),
    fk_id_servico int,
    foreign key (fk_id_servico) references tb_servico (id_servico),
    qt_item decimal(5,2),
    vl_total_item decimal(5,2)
);
