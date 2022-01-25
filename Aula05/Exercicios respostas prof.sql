/* Verifica se autocommit está ativo ou não (1 para ativo, 0 para inativo. */
SELECT @@autocommit;

/* Força o MySQL a executar o commit automaticamente. */
SET autocommit = 1;

/* Cria o banco de dados "teste", caso o mesmo não exista. */
create database if not exists bd_teste_qui;

/* Seleciona o banco de dados para uso. */
use bd_teste_qui;

/* Cria a tabela de clientes. */
create table clientes(
	id int not null auto_increment,
    nome varchar(40),
    cidade varchar(30),
    primary key(id)
);

/* Mostra a estrutura da tabela de clientes. */
describe clientes;

/* Inclui 5 registros na tabela de clientes. */
insert into clientes
(nome, cidade)
values
('Ana', 'Curitiba'),
('Beatriz', 'Maringá'),
('Carolina', 'Londrina'),
('Denise', 'Umuarama'),
('Elaine', 'São José dos Pinhais');

/* Mostra os registros da tabela de clientes. */
select * from clientes;

------------------------------------------------------------------

/* inicia a transação */
start transaction;

/* apaga o cliente de id = 1 */
delete from clientes
where id = 1;

/* seleciona todos da tabela clientes */
select * from clientes;

/* desfaz a remoção do cliente de id = 1 */
rollback;

/* demonstra todos da tabela clientes novamente */
select * from clientes;

------------------------------------------------------------------

/* inicia a transação */
start transaction;

/* apaga o cliente de id = 1 */
delete from clientes
where id = 3;

/* seleciona todos da tabela clientes */
select * from clientes;

/* confirma no BD a remoção do cliente de id = 3 */
commit;

/* demonstra todos da tabela clientes novamente */
select * from clientes;

------------------------------------------------------------------

/* Inicia uma transação. */
start transaction;

/* Exclui o registro de id = 1 da tabela de clientes. */
delete from clientes where id = 1;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* Atribui um ponto de restauração da transação. */
savepoint ponto_restauracao;

/* Exclui o registro de id = 4 da tabela de clientes. */
delete from clientes where id = 4;

/* Exclui o registro de id = 5 da tabela de clientes. */
delete from clientes where id = 5;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* Desfaz as transações até o ponto de restauração. */
rollback to ponto_restauracao;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

------------------------------------------------------------------

/* Apagando com Delete From */

/* Inicia uma transação. */
start transaction;

/* Exclui o registro de id = 1 da tabela de clientes. */
delete from clientes;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* confirma no BD a remoção de todos os clientes */
commit;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* Inserindo um novo cliente - observar a ID - ficará com o valor 6*/
insert into clientes (nome, cidade)
values ('Leandro', 'Araucária');

/* Mostra os registros da tabela de clientes. */
select * from clientes;

------------------------------------------------------------------

/* Inicia uma transação. */
start transaction;

/* Exclui o registro de id = 1 da tabela de clientes. */
Truncate clientes;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* Desfaz a exclusão. */
rollback;

/* Mostra os registros da tabela de clientes. */
select * from clientes;

/* Inserindo um novo cliente - observar a ID - ficará com o valor 1 */
insert into clientes (nome, cidade)
values ('Leandro', 'Araucária');

/* Mostra os registros da tabela de clientes. */
select * from clientes;

------------------------------------------------------------------

-- Exercício feito em sala

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
select titulo,ano from filmes
where genero = 'Comédia';

--extra: ordenando os títulos de A .. Z
select titulo,ano from filmes
where genero = 'Comédia'
order by titulo;

--2. Selecione e demonstre todos os filmes que não são dos Estados Unidos.
select * from filmes
where pais != 'Estados Unidos';

--extra: Ordenando por país seguido do título
select * from filmes
where pais != 'Estados Unidos'
order by pais,titulo;

--3. Selecione e demonstre todos os filmes para 14 anos ou mais.
select * from filmes
where classificacao >= 14;

select * from filmes
where (classificacao >= '14' and classificacao != 'Livre');

select * from filmes
where (classificacao = '14' or classificacao = '16' or classificacao = '18');

select * from filmes
where (classificacao != '10' and classificacao != '12' and classificacao != 'Livre');

--4. selecione e demonstre todos os filmes de 2000 até os dias atuais.
select * from filmes
where ano >= 2000;

--5. selecione e demonstre nome e duração dos filmes que variam entre 100 a 115 minutos.
select titulo,duracao from filmes
where (duracao >= 100 and duracao <= 115);

--6. selecione e demonstre nome e genero dos filmes de suspense e terror.
select titulo,genero from filmes
where (genero = 'Suspense' or genero = 'Terror');

--extra: seleção pela posição do enum e ordenação por genero seguido do título
select titulo,genero from filmes
where (genero = 6 or genero = 7)
order by genero,titulo;

select titulo,genero from filmes
where (genero = 6 or genero = 7)
order by genero desc,titulo asc;

--7. selecione e demonstre titulo, genero, ano dos filmes de 
--   suspense ou terror de 2000 pra baixo.
select titulo,genero,ano from filmes
where ((genero = 'Suspense' or genero = 'Terror') and ano <= 2000);

select titulo,genero,ano from filmes
where ((genero = 'Suspense' or genero = 'Terror') and ano <= 2000)
order by genero;

--8. selecione todos filmes e demonstre na tabela no campo título modificar para Filme.
select titulo as filme from filmes;

--9. selecione todos os filmes que possuem no meio do nome " de ".
select titulo,genero,ano from filmes
where titulo like '% de %';

--extra:
/* quero inicio */
select titulo,genero,ano from filmes
where titulo like 'de%';

/* quero fim */ 
select titulo,genero,ano from filmes
where titulo like '%de';

/* quero meio */
select titulo,genero,ano from filmes
where titulo like '%de%';

/* não quero */
select titulo,genero,ano from filmes
where titulo not like '%de%';

--10. selecione e conte todos os filmes por genero. 
select genero,count(*) from filmes
group by genero;

select genero,count(*) from filmes
group by genero
order by genero;

--11. selecione na tabela filmes o ano do filme mais recente (ano).
select max(ano) from filmes;

--12. selecione na tabela filmes o ano do filme mais velho (ano).
select min(ano) from filmes;

--extra: Tabela com qtd total de filmes + ano mais antigo + ano mais recente
select 
	count(*) as 'QTD de Filmes',
	min(ano) as 'Ano mais Antigo',
	max(ano) as 'Ano mais Atual' 
from filmes;

--13. some todos os minutos do acervo de filmes.
select sum(duracao) from filmes;

--14. calcule a média da duração do filmes.
select avg(duracao) from filmes;

select genero,sum(duracao) as 'soma (min)',avg(duracao) as 'media (min)' from filmes
group by genero;

--15. Seleção de genero com classificacao livre e que tenha 3 ou mais títulos.
select genero,count(titulo) from filmes
where classificacao = 'Livre'
group by genero having count(titulo) >= 3;
