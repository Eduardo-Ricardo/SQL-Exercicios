-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

create database Avaliacao_2_bi;

use Avaliacao_2_bi;

CREATE TABLE Projetos (
Id_prj BIGINT(10) PRIMARY KEY not null auto_increment,
Nome_prj VARCHAR(20) not null,
data_inicio_prj DATETIME not null,
Id_recurso BIGINT(10)not null,
data_fim_prj DATETIME not null,
Dias_Semana_prj DATETIME not null
);

CREATE TABLE Alocacoes (
Id_aloc BIGINT(10) PRIMARY KEY not null auto_increment,
Dias_semana_prj DATETIME not null,
Id_prj BIGINT(10),
Matricula_func BIGINT(10),
);

CREATE TABLE Funcionarios (
Matricula_func BIGINT(10) PRIMARY KEY not null auto_increment,
Nome_func VARCHAR(25 ) not null,
Data_admissao DATETIME not null,
Cargo_func VARCHAR(15 ) not null
);



create TABLE Recursos (
Id_recurso BIGINT(10) PRIMARY KEY not null auto_increment,
Tipo_recurso VARCHAR(10)not null,
Valor_mensal_recurso_prj float(8,2 )not null
);
ALTER TABLE Projetos ADD FOREIGN KEY(Id_recurso) REFERENCES Recursos (Id_recurso) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Alocacoes ADD FOREIGN KEY(Matricula_func) REFERENCES Funcionarios (Matricula_func) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Alocacoes ADD FOREIGN KEY(Id_prj) REFERENCES Projetos (Id_prj) ON UPDATE CASCADE ON DELETE CASCADE;

-- exercicio 3


insert into Recursos(Id_recurso, Tipo_recurso, Valor_mensal_recurso_prj) values
(default, 'big', '1000.00'),
(default, 'small', '200.25');

insert into Projetos(id_prj, Nome_prj, data_iinicio_prj, Id_recurso, data_fim_prj, Dias_Semana_prj) values
(default, 'projeto bd', '2021-11-25', '1', '2021-12-25', '13'),
(default, 'projeto bd no gas', '2021-11-26', '2', '2021-12-25', '17');

insert into Funcionarios(Matricula_func, Nome_func, Data_admissao, Cargo_func) values
(default, 'eduardo', '2001-01-18', 'Ti'),
(default, 'renam', '2008-05-30', 'ti');

insert into Alocacoes(Id_aloc, Dias_Semana_prj, id_prj, Matricula_func) values
('1', '13', '1', '1'),
('2', '17', '2', '2');


--exercicio 4

select f.Nome_func, p.Nome_prj 
from Funcionarios as f
inner join Projetos as p
inner join Alocacoes as a
on a.Id_prj = p.id_prj and a.Matricula_func = f.Matricula_func;


