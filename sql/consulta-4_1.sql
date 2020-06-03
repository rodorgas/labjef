-- Liste todos os exames realizados, com seus respectivos tipos,
-- bem como os seus usuários com suas respectivas datas de
-- solicitação e execução.
select
	paciente.nome as "Paciente",
	exame.tipo as "Tipo",
	exame.virus as "Vírus",
	realiza.data_de_solicitacao as "Data de solicitação",
	realiza.data_de_realizacao as "Data de execução"
from
	realiza
inner join exame
	on realiza.id_exame = exame.id_exame
inner join paciente
	on realiza.id_paciente = paciente.id_paciente
;
