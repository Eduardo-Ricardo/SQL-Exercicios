create database bd_locadora_qui;

/* Define o banco de dados locadora como o banco de dados atual */
use bd_locadora_qui;

/* Cria a tabela filmes */
create table filmes(
	id int not null auto_increment,
    titulo varchar (50) not null,
	genero enum ('Ação', 'Animação', 'Comédia', 'Drama', 'Romance', 'Suspense', 'Terror'),
    ano year,
    duracao tinyint unsigned,
    pais varchar(20),
    classificacao varchar(5),
	primary key(id)
);

/* Descreve a estrutura da tabela filmes*/
describe filmes;

/* Insere registros na tabela filmes */
insert into filmes
(titulo, genero, ano, duracao, pais, classificacao)
values
('O Garoto', 'Comédia', '1921', '53', 'Estados Unidos', 'Livre'),
('Uma Sombra na Nuvem', 'Ação', '2020', '79', 'Estados Unidos', '14'),
('Toy Story', 'Animação', '1995', '81', 'Estados Unidos', 'Livre'),
('A Família Addams', 'Animação', '2019', '84', 'Canadá', 'Livre'),
('Lucy', 'Ação', '2014', '85', 'Alemanha', '16'),
('Minha Mãe é Uma Peça: O Filme', 'Comédia', '2013', '85', 'Brasil', '12'),
('O Mentiroso', 'Comédia', '1997', '86', 'Estados Unidos', 'Livre'),
('Ameaça no Espaço', 'Ação', '2020', '92', 'Canadá', '16'),
('Monstros S.A.', 'Animação', '2001', '92', 'Estados Unidos', 'Livre'),
('Teu Mundo Não Cabe Nos Meus Olhos', 'Drama', '2018', '93', 'Brasil', '10'),
('Meu Malvado Favorito', 'Animação', '2010', '93', 'Estados Unidos', 'Livre'),
('Missão Cupido', 'Romance', '2017', '94', 'Brasil', '14'),
('Pé Pequeno', 'Animação', '2018', '94', 'Estados Unidos', 'Livre'),
('Sexta-Feira 13: Bem-Vindo A Crystal Lake', 'Terror', '2009', '94', 'Estados Unidos', '18'),
('Alguém Como Você', 'Romance', '2001', '95', 'Estados Unidos', '12'),
('A Hora do Pesadelo ', 'Terror', '2010', '95', 'Estados Unidos', '14'),
('Um Tio Quase Perfeito', 'Comédia', '2016', '96', 'Brasil', 'Livre'),
('O Sol Também é uma Estrela', 'Romance', '2019', '96', 'Estados Unidos', '12'),
('15 Minutos De Guerra', 'Drama', '2018', '97', 'Bélgica', '14'),
('Premonição', 'Terror', '2000', '98', 'Canadá', '14'),
('John Wick - De Volta Ao Jogo', 'Suspense', '2014', '98', 'China', '16'),
('Como Treinar o Seu Dragão', 'Animação', '2010', '98', 'Estados Unidos', 'Livre'),
('Carrie, A Estranha ', 'Terror', '1976', '98', 'Estados Unidos', '16'),
('Amor em Obras', 'Romance', '2019', '98', 'Nova Zelândia', '10'),
('Madrugada Dos Mortos', 'Terror', '2004', '100', 'Canadá', '18'),
('A Vigilante Do Amanhã: Ghost In The Shell', 'Ação', '2017', '100', 'China', '14'),
('Procurando Nemo', 'Animação', '2003', '100', 'Estados Unidos', 'Livre'),
('Minha Vida Em Marte', 'Comédia', '2018', '102', 'Brasil', '12'),
('Uma Segunda Chance Para Amar', 'Comédia', '2019', '103', 'Estados Unidos', '12'),
('Ela Dança, Eu Danço', 'Romance', '2006', '103', 'Estados Unidos', '12'),
('Curtindo A Vida Adoidado', 'Comédia', '1986', '104', 'Estados Unidos', '12'),
('Desejo De Matar', 'Suspense', '2018', '104', 'Estados Unidos', '18'),
('O Exterminador Do Futuro', 'Ação', '1984', '106', 'Estados Unidos', '14'),
('Cidades De Papel', 'Drama', '2015', '106', 'Estados Unidos', '12'),
('Sequestro Internacional', 'Ação', '2019', '108', 'Estados Unidos', '14'),
('Psicose', 'Suspense', '1960', '108', 'Estados Unidos', '14'),
('Central Do Brasil', 'Drama', '1998', '109', 'Brasil', '12'),
('As Férias Da Minha Vida', 'Comédia', '2006', '109', 'Estados Unidos', '10'),
('Um Tira No Jardim De Infância', 'Comédia', '1990', '109', 'Estados Unidos', '12'),
('Lugares Escuros', 'Drama', '2015', '109', 'Estados Unidos', '16'),
('A Bela E A Fera', 'Romance', '2014', '110', 'Alemanha', '12'),
('Top Gun - Ases Indomáveis', 'Ação', '1986', '110', 'Estados Unidos', 'Livre'),
('Como Eu Era Antes De Você', 'Romance', '2016', '110', 'Estados Unidos', '12'),
('Assalto ao Banco da Espanha', 'Ação', '2020', '113', 'Espanha', '14'),
('Procura-se', 'Suspense', '2020', '113', 'Estados Unidos', '16'),
('Velocidade Máxima', 'Ação', '1994', '114', 'Estados Unidos', '14'),
('Os Incríveis', 'Animação', '2004', '115', 'Estados Unidos', 'Livre'),
('Um Bom Ano', 'Romance', '2006', '115', 'Estados Unidos', '10'),
('A Vida É Bela', 'Drama', '1997', '115', 'Itália', 'Livre'),
('Carros', 'Animação', '2006', '117', 'Estados Unidos', 'Livre'),
('O Rei Leão', 'Animação', '2019', '118', 'Estados Unidos', 'Livre'),
('Beleza Americana', 'Drama', '1999', '118', 'Estados Unidos', '18'),
('Doentes de Amor', 'Comédia', '2017', '119', 'Estados Unidos', '12'),
('O Exterminador Do Futuro: Gênesis', 'Ação', '2015', '122', 'Canadá', '12'),
('P.S. Eu Te Amo', 'Romance', '2007', '123', 'Estados Unidos', '12'),
('Estrelas Além Do Tempo', 'Drama', '2016', '124', 'Estados Unidos', 'Livre'),
('A Cabana', 'Drama', '2017', '127', 'Estados Unidos', '12'),
('Parasita', 'Suspense', '2019', '131', 'Coréia do Sul', '16'),
('O Amor Não Tira Férias', 'Romance', '2006', '133', 'Estados Unidos', '10'),
('Forrest Gump', 'Drama', '1994', '137', 'Estados Unidos', '14');


--1. Selecione e demonstre o nome e o ano de todos os filmes de Comédia da tabela filmes.

--extra: ordenando os títulos de A .. Z
select titulo,ano from filmes
where genero = 'Comédia'
order by titulo;

--2. Selecione e demonstre todos os filmes que não são dos Estados Unidos.

select * from filmes
where NOT pais = 'Estados Unidos';

--3. Selecione e demonstre todos os filmes para 14 anos ou mais.

select * from filmes
where classificacao >= 14;

--4. selecione e demonstre todos os filmes de 2000 até os dias atuais.

select * from filmes
where ano > 1999;

--5. selecione e demonstre nome e duração dos filmes que variam entre 100 a 115 minutos.

select titulo,duracao from filmes
where (duracao >= 100 and duracao <= 115)
order by titulo;

--6. selecione e demonstre nome e genero dos filmes de suspense e terror.

select titulo, genero from filmes
where (genero = 'Terror' or genero = 'Suspense');

--7. selecione e demonstre titulo, genero, ano dos filmes de suspense ou terror de 2000 pra baixo.

select titulo, genero, ano from filmes
where (genero = 'Terror' or genero = 'Suspense') and ano < 2001;

--8. selecione todos filmes e demonstre na tabela no campo título modificar para Filme.

alter table filmes
change column filme titulo varchar(50);

select filme from filmes;

--9. selecione todos os filmes que possuem no meio do nome " de ".

select titulo,genero,ano from filmes
where titulo like '% de %';

--10. selecione e conte todos os filmes por genero. 

mysql> select genero,count(*) from filmes
    -> group by genero;
/*    
+----------+----------+
| genero   | count(*) |
+----------+----------+
| Comédia  |       10 |
| Ação     |       10 |
| Animação |       10 |
| Drama    |       10 |
| Romance  |       10 |
| Terror   |        5 |
| Suspense |        5 |
+----------+----------+
7 rows in set (0.17 sec)
*/

mysql> select genero,count(*) from filmes
    -> group by genero
    -> order by genero;
/*
+----------+----------+
| genero   | count(*) |
+----------+----------+
| Ação     |       10 |
| Animação |       10 |
| Comédia  |       10 |
| Drama    |       10 |
| Romance  |       10 |
| Suspense |        5 |
| Terror   |        5 |
+----------+----------+
7 rows in set (0.00 sec)
*/

--11. selecione na tabela filmes o ano do filme mais recente (ano).

select max(ano) from filmes;

--12. selecione na tabela filmes o ano do filme mais velho (ano).

select min(ano) from filmes;

-- extra
select 
	count(*) as 'QTD de Filmes',
	min(ano) as 'Ano mais Antigo',
	max(ano) as 'Ano mais Atual' 
from filmes;

--13. some todos os minutos do acervo de filmes.

select sum(duracao) from filmes;

--14. calcule a média da duração do filmes.

select avg(duracao) from filmes;

-- extra
select genero,sum(duracao) as 'soma (min)',avg(duracao) as 'media (min)' from filmes
group by genero;

--15. Seleção de genero com classificacao livre e que tenha mais 3 ou mais títulos.

select genero,count(titulo) from filmes
where classificacao = 'Livre'
group by genero having count(titulo) >= 3;