insert into gerencia (
  servico_id, exame_id
)
values
(1,1),
(2,1),
(3,1),
(4,1),

(1,2),
(2,2),
(3,2),
(4,2),

(1,3),
(2,3),
(3,3),
(4,3),

(1,4),
(2,4),
(3,4),
(4,4),

(1,5),
(2,5),
(3,5),
(4,5),

(5,1),
(5,2),
(5,3);

ALTER SEQUENCE gerencia_id_seq RESTART WITH 6;
