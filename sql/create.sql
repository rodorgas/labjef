
CREATE TABLE pessoa (
    id_pessoa    SERIAL NOT NULL PRIMARY KEY,
    cpf    CHAR(11) NOT NULL,
    nome    VARCHAR(255) NOT NULL,
    endereco    VARCHAR(255) NOT NULL,
    nascimento    DATE,
        UNIQUE (cpf)
);

CREATE TABLE usuario (
    id_usuario    SERIAL NOT NULL PRIMARY KEY,
    cpf   CHAR(11) NOT NULL references pessoa(cpf),
    area_de_pesquisa    VARCHAR(255),
    instituicao    VARCHAR(255),
    login    VARCHAR(255) NOT NULL,
    senha    VARCHAR(255) NOT NULL,
    id_tutor   INT references usuario(id_usuario),
        UNIQUE (cpf)
);

CREATE TABLE perfil (
    id_perfil    SERIAL NOT NULL PRIMARY KEY,
    codigo    VARCHAR(255) NOT NULL,
    tipo    VARCHAR(255),
        UNIQUE (codigo)
);

--Relacionamento possui
CREATE TABLE possui (
    id_usuario    INT NOT NULL references usuario(id_usuario),
    id_perfil    INT NOT NULL references perfil(id_perfil),
        UNIQUE (id_usuario, id_perfil)
);

CREATE TABLE servico (
    id_servico    SERIAL NOT NULL PRIMARY KEY,
    nome    VARCHAR(255) NOT NULL,
    classe    VARCHAR(255) NOT NULL CHECK (classe IN ('visualização', 'inserção', 'alteração', 'remoção')),
        UNIQUE (nome, classe)
);

--Relacionamento pertence
CREATE TABLE pertence (
    id_servico    INT NOT NULL references servico(id_servico),
    id_perfil    INT NOT NULL references perfil(id_perfil),
        UNIQUE (id_servico, id_perfil)
);

--Relacionamento tutelamento
CREATE TABLE tutelamento (
    id_usuario_tutelado    INT NOT NULL references usuario(id_usuario),
    id_tutor    INT NOT NULL references usuario(id_usuario),
    id_servico    INT NOT NULL references servico(id_servico),
    id_perfil    INT NOT NULL references perfil(id_perfil),
    data_de_inicio    DATE NOT NULL,
    data_de_termino    DATE,
        UNIQUE (id_usuario_tutelado, id_tutor, id_servico, id_perfil)
);

CREATE TABLE paciente (
    id_paciente    SERIAL NOT NULL PRIMARY KEY,
    cpf   CHAR(11) NOT NULL references pessoa(cpf),
        UNIQUE (cpf)
);

CREATE TABLE exame (
    id_exame    SERIAL NOT NULL PRIMARY KEY,
    tipo    VARCHAR(255) NOT NULL,
    virus    VARCHAR(255) NOT NULL,
        UNIQUE (tipo, virus)
);

--Relacionamento gerencia
CREATE TABLE gerencia (
    id_servico    INT NOT NULL references servico(id_servico),
    id_exame    INT NOT NULL references exame(id_exame),
        UNIQUE (id_servico, id_exame)
);

--Relacionamento realiza
CREATE TABLE realiza (
    id_paciente    INT NOT NULL references paciente(id_paciente),
    id_exame    INT NOT NULL references exame(id_exame),
    codigo_amostra    VARCHAR(255),
    data_de_realizacao TIMESTAMP,
    data_de_solicitacao TIMESTAMP,
        UNIQUE (id_paciente, id_exame, data_de_realizacao, data_de_solicitacao)
);

--Agregado amostra
CREATE TABLE amostra (
    id_paciente    INT NOT NULL references paciente(id_paciente),
    id_exame    INT NOT NULL references exame(id_exame),
    codigo_amostra    VARCHAR(255) NOT NULL,
    metodo_de_coleta    VARCHAR(255) NOT NULL,
    material    VARCHAR(255) NOT NULL,
        UNIQUE (id_paciente, id_exame, codigo_amostra)
);

--Relacionamento registra
CREATE TABLE registra (
    id_usuario INT NOT NULL references usuario(id_usuario),
    id_servico INT NOT NULL references servico(id_servico),
    id_exame INT NOT NULL references exame(id_exame),
    data_de_solicitacao DATE,
	UNIQUE (id_usuario, id_servico, id_exame, data_de_solicitacao)
);

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO "10737011";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO  "8921590";

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO "10737011";
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO  "8921590";

