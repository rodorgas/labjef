INSERT INTO perfil(id,codigo, tipo)
VALUES (1,'01','Administrador'),(2,'02', 'Visitante'),
       (3,'03','Pesquisador'),(4,'04','Aluno'),
       (5,'05','Bolsista'),(6,'06','Supervisor');

ALTER SEQUENCE perfil_id_seq RESTART WITH 7;
