select * from tb_agenda
where cd_agenda in (5, 6);

select * from tb_item 
where fk_cd_produto = 3;

select * from tb_cliente limit 2,1;

select nm_produto, vl_produto
from tb_produto 
where cd_produto > 6;

select cd_pedido, dt_pedido
from tb_pedido
where cd_pedido = 2;

select *
from tb_produto
where vl_produto > 20 or cd_produto < 10;

select * from tb_pedido
where cd_pedido = 4;

select * from tb_agenda
where cd_agenda < 8 and hr_agenda < '12:00:00';

select * from tb_cliente
where id_status = 1;

select * from tb_cliente
where sg_estado = 'RJ';

select nm_cliente
from tb_cliente
where nm_cliente like '%SANTOS%';

select nm_cliente
from tb_cliente
where nm_cliente like '%ANA%';

select * from tb_agenda
where dt_agenda = '2022-04-15' and hr_agenda between '10:00:00' and '16:00:00';

select cd_pedido 
from tb_pedido
where cd_pedido in (1, 7, 10);

select * from tb_pedido
where dt_pedido between '2022-07-10' and  '2022-07-30';