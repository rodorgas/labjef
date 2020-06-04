# EPs de MAC0350

## Modelos
### Modelo Conceitual
![Modelo Conceitual](models/modelo-conceitual.svg)

### Modelo Conceitual
![Modelo Lógico](models/modelo-logico.svg)

## Inserção

- `create.sql`: criação das tabelas, chaves e índices;
- `delete.sql`: remove todos os registros de todas as tabelas;
- `drop.sql`: remove todas as tabelas;
- `insert.sql`: popula todas as tabelas com dados simulados.

## Consultas

**4.1** Liste todos os exames realizados, com seus respectivos tipos,
bem como os seus usuários com suas respectivas datas de solicitação e
execução.

```SQL
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
```

**4.2** Liste os 5 exames realizados com maior eficiência (diferença
entre data de execução e data de solicitação).

```SQL
SELECT tipo,virus, realiza.data_de_realizacao - realiza.data_de_solicitacao as "Tempo de espera"
FROM exame
INNER JOIN realiza
      ON realiza.id_exame = exame.id_exame
ORDER BY "Tempo de espera"
LIMIT 5
```

**4.3** Liste os serviços que podem ser utilizados pelos os usuários.

```SQL
SELECT DISTINCT servico.nome,servico.classe
FROM servico
INNER JOIN pertence
      ON servico.id_servico=pertence.id_servico
INNER JOIN perfil
      ON pertence.id_perfil=perfil.id_perfil
INNER JOIN possui
      ON perfil.id_perfil = possui.id_perfil
INNER JOIN usuario
      ON possui.id_usuario = usuario.id_usuario
```

**4.4** Liste os serviços que podem ser utilizados por usuários
tutelados (dependentes).

```SQL
SELECT DISTINCT nome,classe
FROM servico
INNER JOIN tutelamento
      ON servico.id_servico=tutelamento.id_servico
```

**4.5** Liste em ordem crescente o total de serviços utilizados
agrupados pelos tipos de serviços disponíveis e pelo perfil dos
usuários.

```SQL
SELECT
    servico.nome,
    servico.classe,
    perfil.tipo as "Perfil",
    count(registra.id_servico) as "Quantidade"
FROM registra

INNER JOIN servico
    ON registra.id_servico = servico.id_servico

INNER JOIN usuario
    ON usuario.id_usuario = registra.id_usuario

INNER JOIN possui
    ON possui.id_usuario = usuario.id_usuario

INNER JOIN perfil
    ON perfil.id_perfil = possui.id_perfil

GROUP BY servico.id_servico, perfil.id_perfil

ORDER BY "Quantidade";
```

## Build

Este projeto contém alguns scripts quem auxiliam na geração dos scripts
em SQL. Para gerar tudo, apenas rode `make`, e os scripts em SQL serão
gerados na pasta `dist/`:

Os scripts de inserção utilizaram um pequeno programa em JavaScript que,
com o auxílio da biblioteca `faker.js`, geram `INSERTs` a partir de um
gerador de CPF e uma pequena base de dados de nomes e endereços
fictícios, além de funções úteis para gerar datas em intervalos
específicos. Esse programa não funciona para todas as tabelas, apenas
para `usuario`, `possui` e `paciente`. Achamos melhor escrever os
`INSERTs` das outras manualmente.

### Gerando novos dados fictícios

Não é necessário fazer isso para obter os scripts solicitados pelo EP,
esta seção descreve o funcionamento do script apenas para fins de
documentação interna.

Para gerar novos dados, basta instalar as dependências rodando `yarn` em
`script`, e então `make script/insert.js {usuario, possui, paciente}`.
Ao fazer isso, será necessário rescrever os scripts de inserção das
outras tabelas manualmente, pois há muita lógica envolvendo chaves
estrangeiras que não foram programadas (por exemplo, pesquisador não
pode ser tutelado por visitante). O objetivo desse programa não é
usar metaprogramação para fazer o EP inteiro, e sim automatizar a tarefa
mais tediosa envolvendo algumas tabelas com muitos campos, ganhando
produtividade.
