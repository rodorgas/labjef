SET search_path TO laboratorio;

INSERT INTO pessoa (
  id,
  cpf,
  nome,
  endereco,
  nascimento
)
VALUES

(
  1,
  '83293332480',
  'Lindenberg Batista',
  'Rodovia Sávio, 834 - Botafogo, Rio de Janeiro',
  '1969-10-31T00:42:09.284Z'
),

(
  2,
  '62294303717',
  'Jaison Oliveira',
  'Rua das Flores, 23 - Cidade Jardim, Tocantins',
  '1955-06-03T03:08:28.481Z'
),

(
  3,
  '16537173353',
  'André Pereira',
  'Avenida Orem, 92 - República, Ceará',
  '1975-04-03T09:42:28.392Z'
),

(
  4,
  '21683645839',
  'Modesto Martins',
  'Praça Degenerada, 1 - Parque das Flores, São Paulo',
  '1961-09-10T17:55:23.153Z'
),

(
  5,
  '73843878250',
  'Ide Pereira',
  'Rua Descabida, 9912 - Morro do Totó, Amapá',
  '1954-11-25T03:00:50.324Z'
),

(
  6,
  '02652119214',
  'Yngledhan Xavier',
  'Avenida Rupestre, 192 - Lapa, Rio Grande do Sul',
  '1951-03-08T05:12:31.202Z'
),

(
  7,
  '14653181357',
  'Charles Carvalho',
  'Praça Bem Querida, 62 - Parque da Nicotina, Mato Grosso',
  '1987-05-13T13:02:00.843Z'
),

(
  8,
  '42355198837',
  'Marcloves Silva',
  'Rua Realce Medieval, 91 - Butantã, Minas Gerais',
  '1951-05-03T08:38:31.595Z'
),

(
  9,
  '53121214870',
  'Lucia Carvalho',
  'Avenida Jorges Bosques, 101 - Vila Weseslay, Distrito Federal',
  '1950-10-18T04:17:00.559Z'
),

-- Tutorandos
(
  10,
  '80557886694',
  'Ruth Reis',
  'Rodovia Intergalática, 404 - Vila Medieval, Amazonas',
  '1971-02-22'
),

(
  11,
  '78936128868',
  'Maraci Costa',
  'Rua Guerreira Importal, 504 - Parque Delgado, Santa Catarina',
  '1974-01-13'
),

(
  12,
  '27904634414',
  'Aderito Braga',
  'Avenida Realeza Fantástica, 500 - Hira, Paraná',
  '1963-06-19'
),

(
  13,
  '92616832232',
  'Thelma Saraiva',
  'Rua Supresa Indevida, 200 - Repercussão, Alagoas',
  '1975-01-20'
),

(
  14,
  '93754246348',
  'Romina Batista',
  'Avenida Abominável Jiló, 204 - Vila Fantástica, Rio Grande do Norte',
  '1982-08-11'
),

(
  15,
  '87677173225',
  'Ivaneide Reis',
  'Rua das Chaleiras, 418 - Parque da Glória, Piauí',
  '1956-03-09'
),

(
    16,
    '70474350185',
    'Denner Oliveira',
    'Rodovia Sávio, 337 - Vila Weseley, Tocantins',
    '2000-09-02T21:28:22.040Z'
),

(
    17,
    '67912886710',
    'Jürgen Reis',
    'Viela Laís, 356 - Grande Evely, Mato Grosso',
    '2003-09-06T01:33:28.759Z'
),

(
    18,
    '38930836500',
    'Tomiko Braga',
    'Avenida Lilian, 976 - Grande Celso, Pernambuco',
    '1964-06-05T04:02:25.200Z'
),

(
    19,
    '83681837236',
    'Jevetic Saraiva',
    'Rua Elaine, 721 - Velha Susana, Amazonas',
    '1953-04-21T16:34:20.488Z'
),

(
    20,
    '40888079443',
    'Cristiani Braga',
    'Avenida Sílvio, 790 - Vila Zuleno, Alagoas',
    '1958-03-19T22:52:20.283Z'
),

(
    21,
    '72531952306',
    'Yulle Carvalho',
    'Travessa Toshio, 436 - Município de Analeia, Sergipe',
    '1948-09-01T04:40:05.948Z'
),

(
    22,
    '96553777500',
    'Ilson Macedo',
    'Ponte Fabrisa, 336 - Vila Elma, São Paulo',
    '1964-06-22T04:01:09.038Z'
),

(
    23,
    '61960354876',
    'Joelmir Pereira',
    'Alameda Giovani, 641 - Município de Osmundo, Acre',
    '1953-12-03T15:48:22.079Z'
),

(
    24,
    '63122761718',
    'Maricy Oliveira',
    'Rodovia Christine, 106 - Município de Ereciano, Maranhão',
    '1960-02-16T20:19:08.064Z'
),

(
    25,
    '70074874322',
    'Toshio Carvalho',
    'Rua Gessé, 992 - Vila Wladimir, Piauí',
    '1993-06-19T15:24:21.486Z'
)
;

ALTER SEQUENCE pessoa_id_seq RESTART WITH 26;
INSERT INTO usuario (
  id,
  pessoa_id,
  area_de_pesquisa,
  instituicao,
  login,
  senha,
  tutor_id
)
VALUES

(
  1,
  1,
  'Computação',
  'UNESP',
  'lindenberg.batista',
  'e3vE18PNblUcA9d',
  NULL
),

(
  2,
  2,
  'Geografia',
  'UFPR',
  'jaison.oliveira',
  'CNs8rhmvPHB1r2b',
  NULL
),

(
  3,
  3,
  'Oceanografia',
  'UFRJ',
  'andré.pereira',
  'A__si_BLqlQZGJC',
  NULL
),

(
  4,
  4,
  'Computação',
  'UNESP',
  'modesto.martins',
  'mDMq1UdEWfIX4KK',
  NULL
),

(
  5,
  5,
  'Literatura Africana',
  'UFRJ',
  'ide.pereira',
  'qy7QlyiN27PaVNr',
  NULL
),

(
  6,
  6,
  'Biologia Molecular',
  'PUC',
  'yngledhan.xavier',
  'iypMCD1C5gGo3Vr',
  NULL
),

(
  7,
  7,
  'Literatura Africana',
  'IME',
  'charles.carvalho',
  'CqefcYypgv4qXST',
  NULL
),

(
  8,
  8,
  'Literatura Africana',
  'ITA',
  'marcloves.silva',
  'dlYXkicWMINVTVi',
  NULL
),

(
  9,
  9,
  'Psicanálise',
  'INPA',
  'lucia.carvalho',
  '4EjBdML9fxHGs_V',
  NULL
),

-- Tutorandos
(
  10,
  10,
  'Homeopatia',
  'MACKENZIE',
  'ruth.reis',
  '3SbuMlYpL5E6UvE',
  2
),

(
  11,
  11,
  'Direito Penal',
  'PUC',
  'maraci.costa',
  'vzyyPR45NHc0LDp',
  8
),

(
  12,
  12,
  'Computação',
  'IMPA',
  'aderito.braga',
  'iTFCVLu3ZxKYZqS',
  2),

(
  13,
  13,
  'Geografia',
  'UNICAMP',
  'thelma.saraiva',
  'ozIXgTsqScmrAXv',
  5
),

(
  14,
  14,
  'Física Nuclear',
  'IMPA',
  'romina.batista',
  'AWFXMCAqCt8AuSh',
  2
),

(
  15,
  15,
  'Computação',
  'UNICAMP',
  'ivaneide.santos',
  'SgvpBc6EepEiHxy',
  4
);

ALTER SEQUENCE usuario_id_seq RESTART WITH 16;
INSERT INTO perfil(id,codigo, tipo)
VALUES (1,'01','Administrador'),(2,'02', 'Visitante'),
       (3,'03','Pesquisador'),(4,'04','Aluno'),
       (5,'05','Bolsista'),(6,'06','Supervisor');

ALTER SEQUENCE perfil_id_seq RESTART WITH 7;
INSERT INTO possui(
      usuario_id, perfil_id)
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
insert into servico(id,nome, classe)
values (1,'Alterar exame','alteração'),(2,'Solicitar exame', 'inserção'),
       (3,'Visualizar exame','visualização'),(4,'Remover exame', 'remoção'),
       (5,'Segunda via', 'visualização');


ALTER SEQUENCE servico_id_seq RESTART WITH 6;
INSERT INTO paciente(
    id, pessoa_id)
VALUES
(
    1,
    16
),
(
    2,
    17
),
(
    3,
    18
),
(
    4,
    19
),
(
    5,
    20
),
(
    6,
    21
),
(
    7,
    22
),
(
    8,
    23
),
(
    9,
    24
),
(
    10,
    25
);

ALTER SEQUENCE paciente_id_seq RESTART WITH 11;
insert into pertence(perfil_id, servico_id)
values (1,1),(1,2),(1,3),(1,4),(1,5),
       (2,3),
       (3,1),(3,2),(3,3),
       (4,3),
       (5,1),(5,2),(5,3), (5,5),
       (6,1),(6,2),(6,3),(6,4), (6,5);
INSERT INTO exame(id, tipo, virus)
  values
  (1,'PCR','Sars-CoV-2'),
  (2,'Sorologia','Sars-Cov-2'),
  (3,'Peniscopia','HPV'),
  (4,'Papanicolau','HPV'),
  (5,'PCR','H1N1');

ALTER SEQUENCE exame_id_seq RESTART WITH 6;
INSERT INTO amostra (
  paciente_id, exame_id, codigo_amostra, metodo_de_coleta, material
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
    paciente_id, exame_id, codigo_amostra, data_de_realizacao, data_de_solicitacao)
VALUES
(1, 1, 1, '2020-04-03 15:04:15', '2020-04-03 07:08:29'),
(2, 2, 2, '2020-04-29 23:25:12', '2020-04-29 23:22:32'),
(3, 3, 3, '2020-05-01 12:16:10', '2020-05-01 08:09:42'),
(6, 4, 4, '2020-05-07 03:59:48', '2020-05-03 19:36:34'),
(8, 5, 5, '2020-05-09 16:09:39', '2020-05-03 10:00:45'),
(8, 5, 6, '2020-05-09 16:13:28', '2020-05-02 12:41:14'),
(4, 1, 7, '2020-05-14 23:01:02', '2020-05-10 15:05:30'),
(5, 4, 8, '2020-05-20 12:28:01', '2020-05-18 23:15:24'),
(7, 3, 9, '2020-05-22 14:19:10', '2020-05-21 07:41:18'),
(7, 2, 10, '2020-05-26 08:23:47', '2020-05-25 16:18:53');
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
INSERT INTO registra
  (usuario_id, servico_id,exame_id, data_de_solicitacao)
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
    usuario_tutelado_id, tutor_id, servico_id, perfil_id, data_de_inicio, data_de_termino)
    VALUES (10,2,3,4,'2016-03-02','2018-03-02'),
           (11,8,3,4,'2016-07-02', NULL),
           (12,2,3,2,'2019-04-02','2019-04-02'),
           (13,5,3,2,'2019-04-02','2019-04-02'),
           (14,2,3,5,'2017-08-02', NULL),
           (15,8,3,5,'2015-07-10', NULL),
           (15,8,2,5,'2015-07-05', NULL);
