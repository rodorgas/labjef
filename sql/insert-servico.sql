insert into servico(id,nome, classe)
values (1,'Alterar exame','alteração'),(2,'Solicitar exame', 'inserção'),
       (3,'Visualizar exame','visualização'),(4,'Remover exame', 'remoção'),
       (5,'Segunda via', 'visualização');


ALTER SEQUENCE servico_id_seq RESTART WITH 6;
