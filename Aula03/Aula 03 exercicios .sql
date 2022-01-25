-- Criar banco de dados exercicios
create database EXERCICIOS;
-- Selecionar BD
use EXERCICIOS;
/*
Crie as tabelas a seguir
TABELA CLIENTES
+---+-----------+------+-----+-----+-----------+----------+
|ID |Nome(*)    |Idade |Sexo |Peso |Bairro     |Celular(*)|
+---+-----------+------+-----+-----+-----------+----------+
|1  |Marcelo    |52    |M    |90   |Novo Mundo |99111-1111|
+---+-----------+------+-----+-----+-----------+----------+
|2  |João Pedro |21    |M    |77,5 |Água Verde |99222-2222|
+---+-----------+------+-----+-----+-----------+----------+
|3  |Angélica   |29    |F    |68   |Rebouças   |99333-3333|
+---+-----------+------+-----+-----+-----------+----------+

ID		INT-UNSIGNED-AUTO_INCREMENT
									
Nome(*)		VARCHAR-(40)-NOT NULL
						
Idade(*)	TINYINT-UNSIGNED-NOT NULL	
									
Sexo		ENUM-'M', 'F'
						
Peso		FLOAT-(6,3)
				
Bairro		VARCHAR-(25)	
						
Celular(*)	CHAR-(15)-NOT NULL	(__)_ ____-____
*/
-- Criar tabela clientes
create table Clientes(
    ID int unsigned AUTO_INCREMENT,
    Nome varchar(40) NOT NULL,
    Idade tinyint unsigned NOT NULL,
    Sexo enum ('M', 'F'),
    Peso float(6,3),
    Bairro varchar(25),
    Celular char(15) NOT NULL,
    PRIMARY KEY (ID)
)DEFAULT CHARSET = utf8;
-- Adicionar os dados
INSERT INTO clientes (ID, Nome, Idade, Sexo, Peso, Bairro, Celular)VALUES
(default, 'Marcelo', '52', 'M', '90', 'Novo Mundo', '(41)99111-1111'),
(default, 'João Pedro', '21', 'M', '77.5', 'Água Verde', '(41)99222-2222'),
(default, 'Angélica', '29', 'F', '68', 'Rebouças', '(41)99333-3333');

/*
TABELA Produtos
+---+----------------+-----------+---------+------------------+-------------------------------+
|ID |NOME(*)         |ESTOQUE(*) |PRECO(*) |FUNCIONARIO(*)    |OBSERVACAO                     |
+---+----------------+-----------+---------+------------------+-------------------------------+
|1  |Sabão em pó     |100        |9        |Alcir Jr.         |                               |
+---+----------------+-----------+---------+------------------+-------------------------------+
|2  |Sabão em barra  |277        |4,5      |Maria Rita Amorim |Algumas barras estão avariadas.|
+---+----------------+-----------+---------+------------------+-------------------------------+
|3  |Vanish em pó 1Kg|70         |45       |Alcir Jr.         |                               |
+---+----------------+-----------+---------+------------------+-------------------------------+
TABLE PRODUTOS 

ID		INT UNSIGNED AUTO_INCREMENT 

NOME(*) 	VARCHAR(25) NOT NULL

ESTOQUE(*) 	SMALLINT NOT NULL

PRECO(*) 	FLOAT(6,2) NOT NULL

FUNCIONARIO(*)	VARCHAR(40) NOT NULL 

OBSERVACAO	VARCHAR(80)

*/
-- Criar tabela Produtos
create table Produtos(
    ID int unsigned AUTO_INCREMENT,
    Nome varchar(25) NOT NULL,
    Estoque smallint NOT NULL,
    Preco float(6,2) NOT NULL,
    Funcionario varchar(40) NOT NULL,
    OBS VARCHAR(80),
    PRIMARY KEY (ID)
);
-- Inserindo dados
INSERT INTO Produtos(ID, Nome, Estoque, Preco, Funcionario, OBS) VALUES
(default, 'Sabão em Pó', '100', '9', 'Alceir Jr.', ''),
(default, 'Sabão em Barra', '277', '4.5', 'Maria Rita Amorin', 'Algumas barras estão avariadas.'),
(default, 'Vanish em pó 1Kg', '70', '45', 'Alcir Jr.', '');

--====---====---====---====---====---====---====---====---====---====---====---====---====---====---====---
-- EXERCICO 02
-- ALTERAR AS COLUNAS DAS TABELAS

-- Na tabela clientes
-- Eliminar coluna bairro e adicionar coluna e-mail.
alter table clientes
drop COLUMN Bairro;

alter table clientes
ADD email varchar(30);

-- inserir dados na coluna email marcelo.d2@gmail.com / jp22@outlook.com
UPDATE clientes
set email = 'marcelo.d2@gmail.com'
where ID = 4;

UPDATE clientes
set email = 'jp22@outlook.com'
where ID = 5;

-- Na tabela Produtos
-- Criar coluna "setor"
alter table produtos
ADD setor varchar(15);

-- Inserir dados na coluna setor
UPDATE produtos
set setor = 'limpeza'
where id > 0;
--====---====---====---====---====---====---====---====---====---====---====---====---====---====---====---
-- EXERCICO 03
-- Atualizar a tabela

-- Na tabela clientes
-- inserir dados na coluna email 'angel@hotmail.com'
UPDATE clientes
set email = 'angel@hotmail.com'
where id = 6;

-- Na tabela produtos
-- Atualizar dados na coluna estoque no ID 2 para 257 e na coluna preco no ID 3 para 40
UPDATE produtos
set estoque = 257
where id = 2;

UPDATE produtos
set preco = 40
where id = 3;
--====---====---====---====---====---====---====---====---====---====---====---====---====---====---====---
-- EXERCICO 04
-- Visualizando dados na tabela

-- Na tabela clientes
-- Buscar clientes que possuem peso menor que 75Kg.
select * from clientes
where peso > 75;

-- Buscar clientes que possuem idade até 30 anos.
select * from clientes
where idade <= 30;

-- Na tabela produtos
-- Buscar produtos que no campo observação esteja nulo.
select * from produtos
where OBS IS NULL;

-- Buscar produtos que possuem estoque maior ou igual a 100.
select * from produtos
where estoque >= 100;

--====---====---====---====---====---====---====---====---====---====---====---====---====---====---====---
-- EXERCICO 05
-- Apagando dados da tabela

-- Na tabela clientes
-- Eliminar o registro com ID = 2
delete from clientes
where id = 2;

-- Na tabela produtos
-- Eliminar todos os registros
delete from produtos
where id > 0;