-- criando o banco de dados escolar
CREATE database BD_Escola;

-- selecionar o banco de dados
use BD_Escola;

-- criar as tableas
CREATE TABLE Estudante (
Id_estudante INTEGER PRIMARY KEY not null auto_increment,
Nome_estudante VARCHAR(30) not null 
);

CREATE TABLE Diciplina (
Id_diciplina INTEGER PRIMARY KEY not null auto_increment,
Nome_diciplina VARCHAR(15) not null,
Ano_diciplina INTEGER not null
);

CREATE TABLE Nota (
Id_diciplina_fk INTEGER not null,
Id_estudante_fk INTEGER not null,
Id_nota INTEGER PRIMARY KEY not null auto_increment,
Nota_nota float not null,
FOREIGN KEY(Id_diciplina_fk) REFERENCES Diciplina (Id_diciplina) on delete cascade on update cascade,
FOREIGN KEY(Id_estudante_fk) REFERENCES Estudante (Id_estudante) on delete cascade on update cascade
);

-- inserindo registros tabela Estudante
insert into Estudante (Id_estudante, Nome_estudante) values
('1', 'Pedro'),
('2', 'Maria'),
('3', 'Joao'),
('4', 'Gustavo'),
('5', 'Leticia');

-- inserindo registros na tabela Diciplina
insert into Diciplina 
(Id_diciplina, Nome_diciplina, Ano_diciplina) values
('1', 'Banco de dados', '2'),
('2', 'Programacao de Computadores' , '1'),
('3', 'Eng Economica', '1'),
('4', 'Algoritmos', '3'),
('5', 'Sistemas de comunicacao', '3');


/* Aumentei a quantidade de caracteres
alter table Diciplina
change column Nome_diciplina Nome_diciplina varchar(30);
*/

-- inserindo registros na tabela Nota
insert into Nota
(Id_diciplina_fk, Id_estudante_fk, Id_nota, Nota_nota) values
('1', '1', default, '86'),
('2', '1', default, '51'),
('3', '1', default, '31'),
('4', '1', default, '12'),
('5', '1', default, '99');

insert into Nota
(Id_diciplina_fk, Id_estudante_fk, Id_nota, Nota_nota) values
('1', '2', default, '64'),
('2', '2', default, '53'),
('3', '2', default, '81'),
('4', '2', default, '79'),
('5', '2', default, '86');

insert into Nota
(Id_diciplina_fk, Id_estudante_fk, Id_nota, Nota_nota) values
('1', '3', default, '96'),
('2', '3', default, '16'),
('3', '3', default, '12'),
('4', '3', default, '70'),
('5', '3', default, '61');

insert into Nota
(Id_diciplina_fk, Id_estudante_fk, Id_nota, Nota_nota) values
('1', '4', default, '27'),
('2', '4', default, '78'),
('3', '4', default, '57'),
('4', '4', default, '39'),
('5', '4', default, '51');

insert into Nota
(Id_diciplina_fk, Id_estudante_fk, Id_nota, Nota_nota) values
('1', '5', default, '70'),
('2', '5', default, '86'),
('3', '5', default, '80'),
('4', '5', default, '42'),
('5', '5', default, '48');

-- 1. Mostrar todas as disciplinas do 3º ano

select Diciplina.Nome_diciplina, Diciplina.Ano_diciplina
from disciplina
where an = 3;

-- extra mostra todas os alunos que estão acima da media nas diciplinas do 3º ano

select d.Nome_diciplina, d.Ano_diciplina, n.nota_nota, e.Nome_estudante
from diciplina as d
inner join nota as n
inner join estudante as e
on (Ano_diciplina = 3) and (Nota_nota > 60) and Id_estudante = Id_estudante_fk and Id_diciplina = Id_diciplina_fk
order by Nome_diciplina, Nome_estudante;

-- 2. Mostrar todos os estudantes que cursam disciplinas do 1º ano

select d.Nome_diciplina, d.Ano_diciplina, e.Nome_estudante
from diciplina as d
inner join estudante as e
inner join nota as n
on Id_estudante = n.Id_estudante_fk and Id_diciplina = n.Id_diciplina_fk and Ano_diciplina = 1
order by Nome_diciplina, Nome_estudante;

-- 3. Mostrar os registros da tabela "notas"

select * from nota;

-- 4. Mostrar o nome do estudante e sua nota
-- 5. Mostrar o nome da disciplina, o nome do estudante e a sua nota

select e.Nome_estudante, d.Nome_diciplina, n.nota_nota, d.Ano_diciplina
from diciplina as d
inner join estudante as e
inner join nota as n
on e.Id_estudante = n.Id_estudante_fk and d.Id_diciplina = n.Id_diciplina_fk
order by e.Nome_estudante, d.Ano_diciplina, d.Nome_diciplina;

-- 6. Mostrar a média dos estudantes nas disciplinas

select d.Nome_diciplina, avg(n.nota_nota) as 'media dos estuandtes'
from diciplina as d
inner join nota as n
on d.Id_diciplina = n.Id_diciplina_fk
group by d.Nome_diciplina;