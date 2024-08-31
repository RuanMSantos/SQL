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