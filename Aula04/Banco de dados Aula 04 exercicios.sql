-- Exercicio 01 

-- Crie um banco de dados que seja capaz de suportar o processo da clínica da Dra Bella. 
Create database Dra_Bella;
---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 02

/*
Insira os seguintes pacientes na tabela referente ao quadro 1
+----------------+----------------+---------------+----------------------------+------------------------+--------------+----------+----+
| CPF            | Nome           | Telefone      | Email                      | Endereço               | Bairro       | Cidade   | UF |
+----------------+----------------+---------------+----------------------------+------------------------+--------------+----------+----+
| 345.567.890-00 | Maria da Silva | 41 98765 8456 | msilva@gmail.com           | Rua das Margaridas, 33 | Pilarzinho   | Curitiba | PR |
+----------------+----------------+---------------+----------------------------+------------------------+--------------+----------+----+
| 123.654.987-11 | Ana do Santos  | 41 98990 1234 | anasantos@gmail.com        | Rua Alegria, 234       | Santo Inácio | Curitiba | PR |
+----------------+----------------+---------------+----------------------------+------------------------+--------------+----------+----+
| 321.543.654-22 | Ana dos Santos | 41 98423 5456 | ana_dos_santos@hotmail.com | Rua 21 de Abril, 1430  | Alto da XV   | Curitiba | PR |
+----------------+----------------+---------------+----------------------------+------------------------+--------------+----------+----+

*/
-- Selecionar banco de dados
use Dra_Bella

-- Criar tabela Clientes
create table clientes(
    CPF char(14) NOT NULL,
    Nome varchar(30) NOT NULL,
    Telefone char(15) NOT NULL,
    Email varchar(30),
    Endereco varchar(50),
    Bairro varchar(15),
    Cidade varchar(15) default 'Curitiba',
    UF char(2) default 'UF',
    PRIMARY KEY(CPF)
)

-- Inserir dados
INSERT INTO clientes (CPF, Nome, Telefone, Email, Endereco, Bairro, Cidade, uf)VALUES
('345.567.890-00', 'Maria da Silva', '41 98765 8456', 'msilva@gmail.com', 'Rua das Margaridas, 33', 'Pilarzinho', 'Curitiba', 'PR'),
('123.654.987-11', 'Ana do Santos', '41 98990 1234', 'antos@gmail.com', 'Rua Alegria, 234', 'Santo Inácio', 'Curitiba', 'PR'),
('321.543.654-22', 'Ana dos Santos', '41 98423 5456', 'ana_dos_santos@hotmail.com', 'Rua 21 de Abril, 1430', 'Alto da XV', 'Curitiba', 'PR');
---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 03

/*
Insira os seguintes procedimentos na tabela referente ao quadro 2
+-----------------+----------------------+---------+
| CodProcedimento | Procedimento         | Preço   |
+-----------------+----------------------+---------+
| 1               | Laser facial         | 3500,00 |
+-----------------+----------------------+---------+
| 2               | Laser mãos           | 2500,00 |
+-----------------+----------------------+---------+
| 3               | Peeling químico face | 1200,00 |
+-----------------+----------------------+---------+
| 4               | Peeling químico mãos | 800,00  | 
+-----------------+----------------------+---------+
*/

create table Procedimentos(
    CodProcedimento smallint unsigned AUTO_INCREMENT,
    Procedimento VARCHAR(30),
    Preco float(6,2) NOT NULL,
    PRIMARY key (CodProcedimento)
);

INSERT into Procedimentos(CodProcedimento, Procedimento, preco)VALUES
(default, 'Laser Facial', '3500.00'),
(default, 'Laser Mãos', '2500.00'),
(default, 'Peeling Químico Face', '1200.00'),
(default, 'Peeling Químico Mãos', '800.00');

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 04

-- Crie o campo CodPaciente e habilite chave primária e auto_increment na tabela referente ao quadro 1. 
-- ja foi feito acima.

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 05

-- Elabore um script que altere os telefone do cliente cpf 345.567.890-00 para 41 98765 8455
-- Na tabela clientes
UPDATE Clientes
set telefone = '41 98765 8455'
where cpf = '345.567.890-00';

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 06

-- Elabore um script que altere o endereço da cliente Ana do Santos, Cpf 321.543.654-22, para "Rua 21 de Abril, 4130”. 
-- Na tabela Clientes
UPDATE Clientes
set Endereco = 'Rua 21 de Abril, 4130'
where cpf = '321.543.654-22';

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 07

-- O nome da cliente cpf 123.654.987-11 está errado. O correto é “Ana Maria Barbosa dos Santos”. Elabore o script que realiza esse ajuste.
-- Na tabela Clientes
UPDATE clientes
set nome = 'Ana Maria Barbosa dos Santos'
where cpf = '123.654.987-11';

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 08

-- Alterar o preço do Peeling Químico Mão para 900,00
-- Na tabela Procedimentos
UPDATE procedimentos
set preco = 900.00
where CodProcedimento = 4;

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===

---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===---===
-- Exercicio 09 

-- Crie o Backup do Banco de dados 
-- No CMD do Windowscd 
cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysql -u root -p

--Digite sua senha

-- Abra um segundo Cmd
-- Entre na pasta de instalação do MySQL
cd C:\Program Files\MySQL\MySQL Server 8.0\bin
-- Depois digite o comando (Deixo o caminho com aspas pois evita erros).
mysqldump -u root -p Dra_Bella > "C:\Users\eduri\Documents\Faculdade\2° Semestre\Banco de Dados Prof. Vasco. Quinta-Feira\Aula 04\bkp Dra_Bella22102021.sql"