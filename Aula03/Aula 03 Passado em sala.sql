-- Banco de dados Aula 03 
--vizualizar todos os BDs
status
-- Mostra os bancos de dados
show databases;
-- Cria um BD
create databese bd_ex_qui;
-- acessar o BD
use bd_ex_qui;
-- criando tabela
create table Livros(
    codigo smallint unsigned,
    isbn bigint unsigned,
    nome varchar(50),
    autor varchar(30),
    editora varchar(20),
    edicao tinyint unsigned,
    dt_publi date,
    idioma varchar(5),
    genero char(1),
    dimensao char(11),
    qtd_paginas smallint unsigned,
    formato char(1),
    setar char(1),
    qtd char(2),
    preco float(6,2)
    );
    -- vizualizar modelo conceitual da tabela
    desc livros;
    -- para apagar uma tabela
    drop table clientes;

-- criar tabela
create table clientes(
    id int NOT NULL AUTO_INCREMENT,
    nome varchar (40) NOT NULL,
    sexo enum ('M', 'F'),
    nascimento date,
    cidade varchar (20) DEFAULT 'Curitiba',
    uf char (2) DEFAULT 'PR',
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4;

-- Inserindo dados na tebela do BD
    INSERT INTO clientes (id, nome, sexo, nascimento, cidade, uf)
VALUES ('1', 'Ana', 'F', '1990-06-15', 'Curitiba', 'PR');

(default, 'Elaine', 'F', '1995-09-21', default, default),
(default, 'Fabio', 'M', '1995-10-22', 'Ponta Grossa', default),
(default, 'Gilberto', 'M', '1996-11-23', 'Santo Andre', 'SP');
INSERT INTO clientes VALUES
(default, 'Ana', 'F', '1990-06-15', 'Curitiba', 'PR'),
(default, 'Elaine', 'F', '1995-09-21', default, default),
(default, 'Fabio', 'M', '1995-10-22', 'Ponta Grossa', default),
(default, 'Gilberto', 'M', '1996-11-23', 'Santo Andre', 'SP');

-- Adicionando coluna
ALTER TABLE clientes
ADD email varchar(30);

-- apagar coluna

ALTER TABLE clientes
DROP COLUMN email;

-- adicionando atributo (campo) setor na tabela produtos

ALTER TABLE produtos
ADD setor varchar(20);

-- acrescentando dados na tabela produtos

UPDATE produtos
SET SETOR = 'Limpeza';

-- acrescentando dados na tabela clientes

UPDATE clientes
SET email = 'marcelo.d2@gmail.com'
where id = 1;

-- acrescentando dados na tabela clientes

UPDATE clientes
SET email = 'jp22@outlook.com'
where id = 2;