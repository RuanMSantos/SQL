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

/*Acrescentar o campo e-mail na tabela proprietário com o tipo de dado varchar(30)*/
alter table tb_proprietario
add email varchar(30);

/*Alterar o nome do campo nm_marca da tabela veículo para nm_fabricante mantento o mesmo tipo de dado*/
alter table tb_veiculo
change nm_marca nm_fabricante varchar(25);

/*Excluir o campo nm_modelo da tabela veículo*/
alter table tb_veiculo
drop column nm_modelo;

/*Alterar o tipo de dado do campo vl_pago da tabela mensalidade para decimal(8,2) not null*/
alter table tb_mensalidade
modify vl_pago decimal(8,2) not null;

describe tb_mensalidade;

/*Alterar o nome da tabela tb_entrada_saida para tb_controle*/
alter table tb_entrada_saida
rename tb_controle;

/*Alterar o nome do campo hr_entrada e hr_saida para id_entrada e id_saida com o tipo de dado datetime*/
alter table tb_controle
change hr_entrada id_entrada datetime,
change hr_saida id_saida datetime;

insert into tb_proprietario (cpf_proprietario, nm_proprietario, nr_fone)
values ('10020015021','Claudio Soares','11991446322');

insert into tb_proprietario
values ('10320515080','Madalena Carmosa','13344852662','madacarmosa@gmail.com'),
('12240515050','Sérgio Manteiga','13991447821','manteiga_sergio@hotmail.com');

select * from tb_proprietario;

insert into tb_veiculo
/*1*/
values (null, 0, 'BBC3345', 'FIAT','10320515080'),
/*2*/
(null, 1, 'G57BM90', 'HONDA','12240515050');

SELECT * FROM tb_veiculo;

insert into tb_proprietario
values ('12466378978', 'Cristiano Ronaldo', '13934577667', 'reidaschamp@gmail.com'),
('29053721998', 'Allan Zoka', '11922377322', 'nexstage@hotmail.com');

insert into tb_veiculo
/*3*/
values (null, 0, 'TRQ7E62', 'Fiat', '12466378978'),
/*4*/
(null, 1, 'XCV1K87', 'HONDA', '10020015021'),
/*5*/
(null, 1, 'BLF4W93', 'HONDA', '29053721998'),
/*6*/
(null, 0, 'FJD5H34', 'TOYOTA', '29053721998'),
/*7*/
(null, 0, 'MNP8Z29', 'Gol', '29053721998');

insert into tb_mensalidade
values (null, '2024-07-07', 2500, '12466378978'),
(null, '2024-07-12', 7500, '29053721998'),
(null, '2024-07-13', 2500, '10020015021'),
(null, '2024-08-07', 2500, '12466378978'),
(null, '2024-08-12', 7500, '29053721998'),
(null, '2024-08-13', 2500, '10020015021');


insert into tb_controle
values (null, '2024-07-07 15:40:07', '2024-07-14 18:10:49', 0.00,  1, 3),
(null, '2024-07-16 12:10:05', '2024-07-18 07:10:00', 0.00, 1, 3),
(null, '2024-07-17 11:01:54', '2024-07-19 11:18:09', 0.00, 1, 5),
(null, '2024-07-18 05:37:02', '2024-07-18 18:56:49', 123.50, 0, 1),
(null, '2024-07-19 10:20:44', '2024-07-19 12:40:23', 19.00, 0, 2),
(null, '2024-07-22 15:34:59', '2024-07-24 12:15:09', 0.00, 1, 7),
(null, '2024-07-25 09:23:20', '2024-07-27 08:44:27', 0.00, 1, 6),
(null, '2024-07-25 11:58:53', '2024-07-28 22:22:10', 0.00, 1, 3),
(null, '2024-08-01 17:33:00', '2024-08-03 06:30:07', 0.00, 1, 4),
(null, '2024-08-05 16:40:00', '2024-08-07 10:43:03', 0.00, 1, 4),
(null, '2024-08-05 19:10:00', '2024-08-06 13:32:33', 0.00, 1, 5),
(null, '2024-08-10 11:17:00', '2024-08-10 20:00:00', 85.50, 0, 2),
(null, '2024-08-11 07:23:26', '2024-08-11 13:40:32', 57.00, 0, 1),
(null, '2024-08-12 14:11:12', '2024-08-15 21:22:35', 0.00, 1, 7),
(null, '2024-08-20 10:30:00', '2024-08-31 12:34:00', 0.00, 1, 6);

update tb_veiculo
set id_tipo = 0
where cd_veiculo = 3;

delete from tb_controle
where cd_entrada_saida = 2;

select * from tb_veiculo;

select nm_fabricante
from tb_veiculo
where cd_veiculo = 5;

select * from tb_mensalidade;

select cd_mensalidade, dt_pagamento, vl_pago
from tb_mensalidade
where vl_pago < 200.00;
