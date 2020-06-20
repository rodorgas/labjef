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
