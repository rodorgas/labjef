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
INSERT INTO public.possui(
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
	   (3,'Visualizar exame','visualização'),(4,'Remover exame', 'remoção');
INSERT INTO public.paciente(
    id_paciente, cpf, nome, endereco, nascimento)
    VALUES
(
      1,
      '76676341220',
      'Elias Nogueira',
      'Alameda Lígia, 462 - Vila Caren, Pará',
      '1950-07-21T05:17:18.590Z',
    ),
(
      2,
      '81786950812',
      'Nubia Oliveira',
      'Marginal Adinete, 450 - Vila Elizabeth, Amazonas',
      '1992-01-24T06:39:22.552Z',
    ),
(
      3,
      '85496852080',
      'Edval Saraiva',
      'Viela Adinete, 35 - Nova Elislabelle, Rondônia',
      '1945-09-30T12:26:41.101Z',
    ),
(
      4,
      '55537258870',
      'Luzia Melo',
      'Ponte Ivonise, 353 - Município de Tomiko, Rio de Janeiro',
      '1953-11-15T12:14:31.466Z',
    ),
(
      5,
      '17551803220',
      'Arethusa Carvalho',
      'Viela Roselly, 730 - Vila Auto, Maranhão',
      '1981-07-18T14:46:24.411Z',
    ),
(
      6,
      '63226269224',
      'Claudemiro Pereira',
      'Alameda Kazumi, 718 - Município de Filipe, Alagoas',
      '1980-01-09T09:04:05.642Z',
    ),
(
      7,
      '45883116469',
      'Elisena Franco',
      'Viela Celia, 362 - Velha Adriana, Amapá',
      '1972-08-17T23:43:59.472Z',
    ),
(
      8,
      '82228524425',
      'Rudyard Carvalho',
      'Avenida Silvania, 728 - Nova Ednei, Tocantins',
      '1940-07-12T16:28:10.361Z',
    ),
(
      9,
      '32964614695',
      'Weber Moraes',
      'Avenida Amélia, 605 - Velha Erivaldo, Rio Grande do Sul',
      '1968-07-26T07:11:49.894Z',
    ),
(
      10,
      '87878817642',
      'Vladimir Carvalho',
      'Rodovia Hercilia, 566 - Grande Lidiana, Alagoas',
      '1954-01-02T03:29:02.956Z',
    );
