CREATE TABLE PERTENCE
(
    CODIGO_CURSO INTEGER NOT NULL,
    MATRICULA INTEGER NOT NULL,
    CONSTRAINT CODIGO_CURSOFK FOREIGN KEY (CODIGO_CURSO) REFERENCES curso (CODIGO_CURSO),
    CONSTRAINT MATRICULAFK FOREIGN KEY (MATRICULA) REFERENCES aluno (MATRICULA)
);

##

CREATE TABLE POSSUI
(
    CODIGO_AVALIACAO INTEGER NOT NULL,
    MATRICULA INTEGER NOT NULL,
    CONSTRAINT CODIGO_AVALIACAOFK1 FOREIGN KEY (CODIGO_AVALIACAO) REFERENCES avaliacao (CODIGO_AVALIACAO),
    CONSTRAINT MATRICULAFK1 FOREIGN KEY (MATRICULA) REFERENCES aluno (MATRICULA)
);

##

CREATE TABLE CONTEM
(
    CODIGO_DISCIPLINA INTEGER NOT NULL,
    CODIGO_CURSO INTEGER NOT NULL,
    CONSTRAINT CODIGO_DISCIPLINAFK FOREIGN KEY (CODIGO_DISCIPLINA) REFERENCES disciplina (CODIGO_DISCIPLINA),
    CONSTRAINT CODIGO_CURSOFK1 FOREIGN KEY (CODIGO_CURSO) REFERENCES curso (CODIGO_CURSO)
);

##

CREATE TABLE MATRICULA
(
    MATRICULA INTEGER NOT NULL,
    CODIGO_TURMA INTEGER NOT NULL,
    CONSTRAINT MATRICULAFK2 FOREIGN KEY (MATRICULA) REFERENCES aluno (MATRICULA),
    CONSTRAINT CODIGO_TURMAFK FOREIGN KEY (CODIGO_TURMA) REFERENCES turma (CODIGO_TURMA)
);

##

CREATE TABLE TEM
(
    CODIGO_TURMA INTEGER NOT NULL,
    CODIGO_AVALIACAO INTEGER NOT NULL,
    CONSTRAINT CODIGO_TURMAFK1 FOREIGN KEY (CODIGO_TURMA) REFERENCES turma (CODIGO_TURMA),
    CONSTRAINT CODIGO_AVALIACAOFK FOREIGN KEY (CODIGO_AVALIACAO) REFERENCES avaliacao (CODIGO_AVALIACAO)
);

##

CREATE TABLE LECIONA
(
    MATRICULA INTEGER NOT NULL,
    CODIGO_TURMA INTEGER NOT NULL,
    CONSTRAINT MATRICULAPR FOREIGN KEY (MATRICULA) REFERENCES professor (MATRICULA),
    CONSTRAINT CODIGO_TURMAFK2 FOREIGN KEY (CODIGO_TURMA) REFERENCES turma (CODIGO_TURMA)
);

##

CREATE TABLE PRE_REQUISITO
(
    CODIGO_DISCIPLINA INTEGER NOT NULL,
    POSSUI_CODIGO_DISCIPLINA BOOLEAN NOT NULL,
    CONSTRAINT CODIGO_DISCIPLINAFK1 FOREIGN KEY (CODIGO_DISCIPLINA) REFERENCES disciplina(CODIGO_DISCIPLINA)
);

##

EXERCICIO 01 ATENDIMENTOS

CREATE TABLE ATENDIMENTOS
(
  CODIGO INTEGER NOT NULL PRIMARY KEY,
  DATA_HORA DATETIME NOT NULL,
  MEDICO INTEGER NOT NULL,
  ANIMAL INTEGER NULL,
  CONSTRAINT CODIGO_MEDICO FOREIGN KEY (MEDICO) REFERENCES MEDICO_VETERINARIOS (CODIGO),
  DESCRICAO TEXT NULL,
  PRECO DECIMAL(6,2) NULL,
  CONSTRAINT CODIGO_ANIMAL FOREIGN KEY (ANIMAL) REFERENCES ANIMAIS (CODIGO)
);

##

EXERCICIO 02 BAIRROS

CREATE TABLE BAIRROS
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  NOME CHAR(25) NOT NULL,
  POPULACAO INTEGER NULL
);

##

EXERCICIO 03 LOGRADOUROS

CREATE TABLE LOGRADOUROS
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  NOME VARCHAR(70) NULL
);

##

EXERCICIO 04 ITENS_PEDIDOS

CREATE TABLE ITENS_PEDIDOS
(
  PIZZA INTEGER PRIMARY KEY NOT NULL,
  TAMANHO TINYINT PRIMARY KEY NOT NULL,
  PEDIDO INTEGER PRIMARY KEY NOT NULL,
  QUANTIDADE SMALLINT NOT NULL,
  VALORUNITARIO DECIMAL(4,2) NOT NULL,
  CONSTRAINT CODIGO_PIZZA FOREIGN KEY (PIZZA) REFERENCES PIZZAS (CODIGO),
  CONSTRAINT CODIGO_TAMANHO FOREIGN KEY (TAMANHO) REFERENCES TAMANHOS (CODIGO),
  CONSTRAINT CODIGO_PEDIDO FOREIGN KEY (PEDIDO) REFERENCES PEDIDOS (NUMERO)
);

##

EXERCICIO 05 ANIMAIS

CREATE TABLE ANIMAIS
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  PROPRIETARIO INTEGER NOT NULL,
  RACA SMALLINT NOT NULL,
  COR TINYINT NOT NULL,
  CONSTRAINT CODIGO_PROPRIETARIO FOREIGN KEY (PROPRIETARIO) REFERENCES PROPRIETARIOS (CODIGO),
  CONSTRAINT CODIGO_RACA FOREIGN KEY (RACA) REFERENCES RACAS (CODIGO),
  CONSTRAINT CODIGO_COR FOREIGN KEY (COR) REFERENCES CORES (CODIGO),
  NOME CHAR(20) NOT NULL,
  NASCIMENTO DATE NULL
);

##

EXERCICIO 06 CORRIDAS

CREATE TABLE CORRIDAS
(
  CORRIDA INTEGER PRIMARY KEY NOT NULL,
  CARRO CHAR(7) NOT NULL,
  CNH CHAR(10) NOT NULL,
  RUA_ORIGEM INTEGER NOT NULL,
  BAIRRO_ORIGEM SMALLINT NOT NULL,
  RUA_DESTINO INTEGER NULL,
  BAIRRO_DESTINO SMALLINT NULL,
  PASSAGEIRO VARCHAR(15) NULL,
  VALOR DECIMAL(5,2) NULL,
  CONSTRAINT CODIGO_CARRO FOREIGN KEY (CARRO) REFERENCES CARROS (PLACA),
  CONSTRAINT CODIGO_CNH FOREIGN KEY (CNH) REFERENCES MOTORISTAS (CNH),
  CONSTRAINT CODIGO_RUA FOREIGN KEY (RUA_ORIGEM) REFERENCES LOGRADOUROS (CODIGO),
  CONSTRAINT CODIGO_BAIRRO FOREING KEY (BAIRRO_ORIGEM) REFERENCES BAIRROS (CODIGO),
  CONSTRAINT CODIGO_RUADESTINO FOREIGN KEY (RUA_DESTINO) REFERENCES LOGRADOUROS (CODIGO),
  CONSTRAINT CODIGO_BAIRRODESTINO FOREIGN KEY (BAIRRO_DESTINO) REFERENCES BAIRROS (CODIGO),
  CONSTRAINT CODIGO_PASSAGEIRO FOREIGN KEY (PASSAGEIRO) REFERENCES PASSAGEIROS (TELEFONE)
);

##

EXERCICIO 07 MOTORISTAS

CREATE TABLE MOTORISTAS
(
  CNH CHAR(10) PRIMARY KEY NOT NULL,
  NOME CHAR(30) NOT NULL,
  NASCIMENTO DATE NULL
);

##

EXERCICIO 08 CIDADES

CREATE TABLE CIDADES
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  ESTADO CHAR(2) NOT NULL,
  NOME VARCHAR(80) NOT NULL,
  POPULACAO INTEGER NOT NULL,
  FUNDACAO DATE NULL,
  CONSTRAINT CODIGO_ESTADO FOREING KEY (ESTADO) REFERENCES ESTADOS (SIGLA)
);

##

EXERCICIO 09 ESCRITORES

CREATE TABLE ESCRITORES
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  NOME VARCHAR(70) NOT NULL,
  SEXO CHAR(1) NOT NULL,
  NASCIMENTO DATE NOT NULL,
  NASCEU INTEGER NULL,
  CONSTRAINT CODIGO_NASCEU FOREIGN KEY (NASCEU) PREFERENCES CIDADES (CODIGO)
);

##

EXERCICIO 10 EMPRESAS

CREATE TABLE EMPRESAS
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  NOME VARCHAR(30) NOT NULL, 
  ENDERECO VARCHAR(40) NOT NULL,
  FONE VARCHAR(14) NOT NULL
);

##

EXERCICIO 11 EDITORAS

CREATE TABLE EDITORAS
(
  CNPJ CHAR(14) PRIMARY KEY NOT NULL,
  CIDADE INTEGER NOT NULL,
  NOME VARCHAR(50) NOT NULL,
  TELEFONE CHAR(15) NULL,
  CONSTRAINT CODIGO_CIDADE FOREIGN KEY (CIDADE) REFERENCES CIDADES (CODIGO)
);

##

EXERCICIO 12 HOSPITAIS

CREATE TABLE HOSPITAIS
(
  CODIGO SMALLINT PRIMARY KEY NOT NULL,
  CIDADE SMALLINT NOT NULL,
  NOME VARCHAR(30) NOT NULL,
  TELEFONE VARCHAR(15) NOT NULL,
  CONSTRAINT CODIGO_CIDADE FOREIGN KEY (CIDADE) REFERENCES CIDADES (CODIGO)
);

##

EXERCICIO 13 CARROS

CREATE TABLE CARROS
(
  PLACA CHAR(7) PRIMARY KEY NOT NULL
  ANO DECIMAL(4,0) NULL,
  MODELO CHAR(10) NULL,
  CAPACIDADE TINYINT NULL
);

##

EXERCICIOS 14 AVIOES

CREATE TABLE AVIOES
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  EMPRESA INTEGER NOT NULL,
  MODELO CHAR(20) NOT NULL,
  CAPACIDADE SMALLINT NOT NULL,
  CONSTRAINT CODIGO_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES EMPRESAS (CODIGO)
);

##

EXERCICIO 14 VOOS

CREATE TABLE VOOS
(
  CODIGO INTEGER PRIMARY KEY NOT NULL,
  DESTINO INTEGER NOT NULL,
  PILOTO INTEGER NOT NULL,
  ORIGEM INTEGER NOT NULL,
  AVIAO INTEGER NOT NULL,
  SAIDA DATETIME NOT NULL,
  CHEGADA DATETIME NOT NULL,
  CONSTRAINT CODIGO_DESTINO FOREIGN KEY (DESTINO) REFERENCES CIDADES (CODIGO)
  CONSTRAINT CODIGO_PILOTO FOREIGN KEY (PILOTO) REFERENCES PILOTOS (BREVE)
  CONSTRAINT CODIGO_ORIGEM FOREIGN KEY (ORIGEM) REFERENCES CIDADES (CODIGO)
  CONSTRAINT CODIGO_AVIAO FOREIGN KEY (AVIAO) REFERENCES AVIOES (CODIGO)
);

##

EXERCICIO 15 RACAS

CREATE TABLE RACAS
(
  CODIGO SMALLINT PRIMARY KEY NOT NULL,
  NOME CHAR(30) NOT NULL
);

##

EXERCICIO 16 CORES

CREATE TABLE CORES
(
  CODIGO TINYINT PRIMARY KEY NOT NULL,
  NOME CHAR(20) NOT NULL
);

##

EXERCICIO 17 PRESCRICOES

CREATE TABLE PRESCRICOES
(
  MEDICAMENTO INTEGER PRIMARY KEY NOT NULL,
  ATENDIMENTO INTEGER PRIMARY KEY NOT NULL,
  QUANTIDADE TINYINT NOT NULL,
  CONSTRAINT CODIGO_MEDICAMENTO FOREIGN KEY (MEDICAMENTO) REFERENCES MEDICAMENTOS (CODIGO),
  CONSTRAINT CODIGO_ATENDIMENTO FOREIGN KEY (ATENDIMENTO) REFERENCES ATENDIMENTOS (CODIGO)
);

##
