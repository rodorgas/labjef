SET search_path TO public;


CREATE TABLE pessoa (
    id    SERIAL NOT NULL PRIMARY KEY,
    cpf    CHAR(11) NOT NULL,
    nome    VARCHAR(255) NOT NULL,
    endereco    VARCHAR(255) NOT NULL,
    nascimento    DATE,
        UNIQUE (cpf)
);

CREATE TABLE usuario (
    id    SERIAL NOT NULL PRIMARY KEY,
    pessoa_id   INT NOT NULL references pessoa(id),
    area_de_pesquisa    VARCHAR(255),
    instituicao    VARCHAR(255),
    login    VARCHAR(255) NOT NULL,
    senha    VARCHAR(255) NOT NULL,
    tutor_id   INT references usuario(id),
        UNIQUE (pessoa_id)
);

CREATE TABLE perfil (
    id    SERIAL NOT NULL PRIMARY KEY,
    codigo    VARCHAR(255) NOT NULL,
    tipo    VARCHAR(255),
        UNIQUE (codigo)
);

--Relacionamento possui
CREATE TABLE possui (
    id    SERIAL NOT NULL PRIMARY KEY,
    usuario_id    INT NOT NULL references usuario(id),
    perfil_id    INT NOT NULL references perfil(id),
        UNIQUE (usuario_id, perfil_id)
);

CREATE TABLE servico (
    id    SERIAL NOT NULL PRIMARY KEY,
    nome    VARCHAR(255) NOT NULL,
    classe    VARCHAR(255) NOT NULL CHECK (classe IN ('visualização', 'inserção', 'alteração', 'remoção')),
        UNIQUE (nome, classe)
);

--Relacionamento pertence
CREATE TABLE pertence (
    id    SERIAL NOT NULL PRIMARY KEY,
    servico_id    INT NOT NULL references servico(id),
    perfil_id    INT NOT NULL references perfil(id),
        UNIQUE (servico_id, perfil_id)
);

--Relacionamento tutelamento
CREATE TABLE tutelamento (
    id    SERIAL NOT NULL PRIMARY KEY,
    usuario_tutelado_id    INT NOT NULL references usuario(id),
    tutor_id    INT NOT NULL references usuario(id),
    servico_id    INT NOT NULL references servico(id),
    perfil_id    INT NOT NULL references perfil(id),
    data_de_inicio    DATE NOT NULL,
    data_de_termino    DATE,
        UNIQUE (usuario_tutelado_id, tutor_id, servico_id, perfil_id)
);

CREATE TABLE paciente (
    id    SERIAL NOT NULL PRIMARY KEY,
    pessoa_id   INT NOT NULL references pessoa(id),
        UNIQUE (pessoa_id)
);

CREATE TABLE exame (
    id    SERIAL NOT NULL PRIMARY KEY,
    tipo    VARCHAR(255) NOT NULL,
    virus    VARCHAR(255) NOT NULL,
        UNIQUE (tipo, virus)
);

--Relacionamento gerencia
CREATE TABLE gerencia (
    id    SERIAL NOT NULL PRIMARY KEY,
    servico_id    INT NOT NULL references servico(id),
    exame_id    INT NOT NULL references exame(id),
        UNIQUE (servico_id, exame_id)
);

--Relacionamento realiza
CREATE TABLE realiza (
    id    SERIAL NOT NULL PRIMARY KEY,
    paciente_id    INT NOT NULL references paciente(id),
    exame_id    INT NOT NULL references exame(id),
    codigo_amostra    VARCHAR(255),
    data_de_realizacao TIMESTAMP,
    data_de_solicitacao TIMESTAMP,
        UNIQUE (paciente_id, exame_id, data_de_realizacao, data_de_solicitacao)
);

--Agregado amostra
CREATE TABLE amostra (
    id    SERIAL NOT NULL PRIMARY KEY,
    paciente_id    INT NOT NULL references paciente(id),
    exame_id    INT NOT NULL references exame(id),
    codigo_amostra    VARCHAR(255) NOT NULL,
    metodo_de_coleta    VARCHAR(255) NOT NULL,
    material    VARCHAR(255) NOT NULL,
        UNIQUE (paciente_id, exame_id, codigo_amostra)
);

--Relacionamento registra
CREATE TABLE registra (
    id    SERIAL NOT NULL PRIMARY KEY,
    usuario_id INT NOT NULL references usuario(id),
    servico_id INT NOT NULL references servico(id),
    exame_id INT NOT NULL references exame(id),
    data_de_solicitacao DATE,
	UNIQUE (usuario_id, servico_id, exame_id, data_de_solicitacao)
);

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO "10737011";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO  "8921590";

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO "10737011";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO  "8921590";

