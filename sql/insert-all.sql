INSERT INTO usuario (
  id_usuario,
  cpf,
  nome,
  area_de_pesquisa,
  instituicao,
  data_de_nascimento,
  login,
  senha,
  id_tutor
)
VALUES

(
  1,
  '83293332480',
  'Lindenberg Batista',
  'Computação',
  'UNESP',
  '1969-10-31T00:42:09.284Z',
  'lindenberg.batista',
  'e3vE18PNblUcA9d',
  NULL
),

(
  2,
  '62294303717',
  'Jaison Oliveira',
  'Geografia',
  'UFPR',
  '1955-06-03T03:08:28.481Z',
  'jaison.oliveira',
  'CNs8rhmvPHB1r2b',
  NULL
),

(
  3,
  '16537173353',
  'André Pereira',
  'Oceanografia',
  'UFRJ',
  '1975-04-03T09:42:28.392Z',
  'andré.pereira',
  'A__si_BLqlQZGJC',
  NULL
),

(
  4,
  '21683645839',
  'Modesto Martins',
  'Computação',
  'UNESP',
  '1961-09-10T17:55:23.153Z',
  'modesto.martins',
  'mDMq1UdEWfIX4KK',
  NULL
),

(
  5,
  '73843878250',
  'Ide Pereira',
  'Literatura Africana',
  'UFRJ',
  '1954-11-25T03:00:50.324Z',
  'ide.pereira',
  'qy7QlyiN27PaVNr',
  NULL
),

(
  6,
  '02652119214',
  'Yngledhan Xavier',
  'Biologia Molecular',
  'PUC',
  '1951-03-08T05:12:31.202Z',
  'yngledhan.xavier',
  'iypMCD1C5gGo3Vr',
  NULL
),

(
  7,
  '14653181357',
  'Charles Carvalho',
  'Literatura Africana',
  'IME',
  '1987-05-13T13:02:00.843Z',
  'charles.carvalho',
  'CqefcYypgv4qXST',
  NULL
),

(
  8,
  '42355198837',
  'Marcloves Silva',
  'Literatura Africana',
  'ITA',
  '1951-05-03T08:38:31.595Z',
  'marcloves.silva',
  'dlYXkicWMINVTVi',
  NULL
),

(
  9,
  '53121214870',
  'Lucia Carvalho',
  'Psicanálise',
  'INPA',
  '1950-10-18T04:17:00.559Z',
  'lucia.carvalho',
  '4EjBdML9fxHGs_V',
  NULL
),

-- Tutorandos
(
  10,
  '80557886694',
  'Ruth Reis',
  'Homeopatia',
  'MACKENZIE',
  '1959-06-01',
  'ruth.reis',
  '3SbuMlYpL5E6UvE',
  2
),

(
  11,
  '78936128868',
  'Maraci Costa',
  'Direito Penal',
  'PUC',
  '1974-01-13',
  'maraci.costa',
  'vzyyPR45NHc0LDp',
  8
),

(
  12,
  '27904634414',
  'Aderito Braga',
  'Computação',
  'IMPA',
  '1963-06-19',
  'aderito.braga',
  'iTFCVLu3ZxKYZqS',
  2),

(
  13,
  '92616832232',
  'Thelma Saraiva',
  'Geografia',
  'UNICAMP',
  '1975-01-20',
  'thelma.saraiva',
  'ozIXgTsqScmrAXv',
  5
),

(
  14,
  '93754246348',
  'Romina Batista',
  'Física Nuclear',
  'IMPA',
  '1982-08-11',
  'romina.batista',
  'AWFXMCAqCt8AuSh',
  2
),

(
  15,
  '87677173225',
  'Ivaneide Reis',
  'Computação',
  'UNICAMP',
  '1956-03-09',
  'ivaneide.santos',
  'SgvpBc6EepEiHxy',
  4
);
INSERT INTO perfil(id_perfil,codigo, tipo)
VALUES (1,'01','Administrador'),(2,'02', 'Visitante'),
       (3,'03','Pesquisador'),(4,'04','Aluno'),
       (5,'05','Bolsista'),(6,'06','Supervisor');
INSERT INTO possui(
      id_usuario, id_perfil)
      VALUES 
(1, 5),
(2, 2),
(3, 3),
(4, 2),
(5, 6),
(6, 1),
(7, 3),
(8, 2),
(9, 4),
(10, 4),
(11, 4),
(12, 3),
(13, 6),
(14, 4),
(15, 4);
insert into servico(id_servico,nome, classe)
values (1,'Alterar exame','alteração'),(2,'Solicitar exame', 'inserção'),
	   (3,'Visualizar exame','visualização'),(4,'Remover exame', 'remoção'),
	   (5,'Segunda via', 'visualização');
insert into pertence(id_perfil, id_servico)
values (1,1),(1,2),(1,3),(1,4),(1,5),
       (2,3),
	   (3,1),(3,2),(3,3),
	   (4,3),
	   (5,1),(5,2),(5,3), (5,5),
	   (6,1),(6,2),(6,3),(6,4), (6,5);
INSERT INTO paciente(
    id_paciente, cpf, nome, endereco, nascimento)
VALUES
(
    1,
    '70474350185',
    'Denner Oliveira',
    'Rodovia Sávio, 337 - Vila Weseley, Tocantins',
    '2000-09-02T21:28:22.040Z'
),
(
    2,
    '67912886710',
    'Jürgen Reis',
    'Viela Laís, 356 - Grande Evely, Mato Grosso',
    '2003-09-06T01:33:28.759Z'
),
(
    3,
    '38930836500',
    'Tomiko Braga',
    'Avenida Lilian, 976 - Grande Celso, Pernambuco',
    '1964-06-05T04:02:25.200Z'
),
(
    4,
    '83681837236',
    'Jevetic Saraiva',
    'Rua Elaine, 721 - Velha Susana, Amazonas',
    '1953-04-21T16:34:20.488Z'
),
(
    5,
    '40888079443',
    'Cristiani Braga',
    'Avenida Sílvio, 790 - Vila Zuleno, Alagoas',
    '1958-03-19T22:52:20.283Z'
),
(
    6,
    '72531952306',
    'Yulle Carvalho',
    'Travessa Toshio, 436 - Município de Analeia, Sergipe',
    '1948-09-01T04:40:05.948Z'
),
(
    7,
    '96553777500',
    'Ilson Macedo',
    'Ponte Fabrisa, 336 - Vila Elma, São Paulo',
    '1964-06-22T04:01:09.038Z'
),
(
    8,
    '61960354876',
    'Joelmir Pereira',
    'Alameda Giovani, 641 - Município de Osmundo, Acre',
    '1953-12-03T15:48:22.079Z'
),
(
    9,
    '63122761718',
    'Maricy Oliveira',
    'Rodovia Christine, 106 - Município de Ereciano, Maranhão',
    '1960-02-16T20:19:08.064Z'
),
(
    10,
    '70074874322',
    'Toshio Carvalho',
    'Rua Gessé, 992 - Vila Wladimir, Piauí',
    '1993-06-19T15:24:21.486Z'
);
insert into exame(id_exame, tipo, virus)
  values
  (1,'PCR','Sars-CoV-2'),
  (2,'Sorologia','Sars-Cov-2'),
  (3,'Peniscopia','HPV'),
  (4,'Papanicolau','HPV'),
  (5,'PCR','H1N1');
INSERT INTO amostra (
  id_paciente, id_exame, codigo_amostra, metodo_de_coleta, material
)
VALUES
  (1, 1, 1, 'Raspagem de nasofaringe', 'Secreção de nasofaringe'),
  (2, 2, 2, 'Coleta de sangue', 'Sangue'),
  (3, 3, 3, 'Raspagem no pênis', 'Secreção do pênis'),
  (6, 4, 4, 'Raspagem no colo do útero', 'Secreção do colo do útero'),
  (8, 5, 5, 'Raspagem da orofaringe', 'Secreção de orofaringe'),
  (8, 5, 6, 'Coleta de sangue', 'Sangue'),
  (4, 1, 7, 'Raspagem da nasofaringe', 'Secreção de nasofaringe'),
  (5, 4, 8, 'Raspagem no colo do útero', 'Secreção do colo do útero'),
  (7, 3, 9, 'Raspagem no pênis', 'Secreção do pênis'),
  (7, 2, 10, 'Coleta de sangue', 'Sangue');
INSERT INTO realiza(
	id_paciente, id_exame, codigo_amostra, data_de_solicitacao, data_de_realizacao)
VALUES
(1, 1, 1, '2020-04-03 15:04:15', '2020-04-03 07:08:29'),
(2, 2, 2, '2020-04-29 23:25:12', '2020-04-29 23:54:32'),
(3, 3, 3, '2020-05-01 12:16:10', '2020-05-01 08:09:42'),
(6, 4, 4, '2020-05-07 03:59:48', '2020-05-03 19:36:34'),
(8, 5, 5, '2020-05-09 16:09:39', '2020-05-03 10:00:45'),
(8, 5, 6, '2020-05-09 16:13:28', '2020-05-02 12:41:14'),
(4, 1, 7, '2020-05-14 23:01:02', '2020-05-10 15:05:30'),
(5, 4, 8, '2020-05-20 12:28:01', '2020-05-18 23:15:24'),
(7, 3, 9, '2020-05-22 14:19:10', '2020-05-21 07:41:18'),
(7, 2, 10, '2020-05-26 08:23:47', '2020-05-25 16:18:53');
insert into gerencia (
  id_servico, id_exame
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
INSERT INTO registra
  (id_usuario, id_servico,id_exame, data_de_solicitacao)
VALUES
  (14,2,1,'2020-04-01 15:04:15'),(14,2,2,'2020-04-24 21:25:12'),
  (15,2,3,'2020-04-28 12:16:10'),(15,2,4,'2020-05-01 03:59:48'),
  (2,2,5,'2020-05-04 11:13:39'),(2,2,5,'2020-05-09 12:25:28'),
  (1,2,1,'2020-05-14 20:01:02'),(1,2,4,'2020-05-15 12:28:01'),
  (8,2,3,'2020-05-22 11:19:10'),(8,2,2,'2020-05-20 08:23:47'),

  (14,1,3,'2020-05-22 11:19:10'),
  (8,3,1,'2020-05-20 08:23:47'),
  (7,1,2,'2020-05-22 11:19:10'),

  (3,3,2,'2020-05-20 08:23:47'),
  (4,1,3,'2020-05-22 11:19:10'),
  (5,3,5,'2020-05-20 08:23:47'),
  (6,1,4,'2020-05-20 08:23:47'),
  (14,5,1,'2020-10-01 11:04:15'),(14,5,2,'2020-07-24 19:35:12'),
  (15,5,3,'2020-08-30 08:16:10');
INSERT INTO tutelamento(
	id_usuario_tutelado, id_tutor, id_servico, id_perfil, data_de_inicio, data_de_termino)
	VALUES (10,2,3,4,'2016-03-02','2018-03-02'),
		   (11,8,3,4,'2016-07-02', NULL),
		   (12,2,3,2,'2019-04-02','2019-04-02'),
		   (13,5,3,2,'2019-04-02','2019-04-02'),
		   (14,2,3,5,'2017-08-02', NULL),
		   (15,8,3,5,'2015-07-10', NULL),
		   (15,8,2,5,'2015-07-05', NULL);
