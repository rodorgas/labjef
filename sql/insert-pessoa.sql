INSERT INTO pessoa (
  id_pessoa,
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

ALTER SEQUENCE pessoa_id_pessoa_seq RESTART WITH 25;
