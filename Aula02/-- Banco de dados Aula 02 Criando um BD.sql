-- Banco de dados Aula 02 Criando um BD

-- vizualizar o BD atual
status
-- vizualizar os BDs
show databases;
-- definir o BD
use sakila
-- vizualizar os BDs
status
-- vizualizar todas as tabelas
show tables;
-- descrever a tabela conceitual
desc actor;
-- vizualizar os registros
select * from actor;
-- descrever a tabela conceitual
desc film;
-- vizualizar os registros
select * from film;
-- criar o bd
create database bd_quinta;
-- definir o bd
use bd bd_quinta;
create table PETS(
    nome varchar(20),
    endereco varchar(50),
    telefone char(14),
    tipo varchar(20),
    idade tinyint unsingend,
    sexo char(1),
    peso float(5,2)
    alergia varchar(30),
    comportamento varchar(10),
    raca varchar(20),
    altura float(3,2),
    porte char(1)
);