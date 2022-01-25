CREATE DATABASE DB_UM_PARA_UM_QUINTA;

USE DB_UM_PARA_UM_QUINTA;

CREATE TABLE MARIDOS (
id_marido INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_marido VARCHAR(40) NOT NULL,
data_nasc_marido DATE
);

CREATE TABLE ESPOSAS (
id_esposa INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_marido_fk INTEGER NOT NULL UNIQUE,
nome_esposa VARCHAR(40) NOT NULL,
data_nasc_esposa DATE,
dt_casa_marido_esposa DATE NOT NULL,
FOREIGN KEY(id_marido_fk) REFERENCES MARIDOS (id_marido) on update cascade on delete cascade
);

insert into maridos(nome_marido,data_nasc_marido) values
('Leandro','1985-03-31'),
('João','1970-05-15'),
('José','1950-12-30');

insert into esposas(nome_esposa,data_nasc_esposa,id_marido_fk,dt_casa_marido_esposa) values
('Carolina','1982-10-09','1','2007-06-09'),
('Maria','1973-06-18','2','2000-01-15'),
('Maricota','1955-07-21','3','1975-03-05');

insert into esposas(nome_esposa,data_nasc_esposa,id_marido_fk,dt_casa_marido_esposa) values
('Jo','1990-12-31','4','2010-01-20');

insert into esposas(nome_esposa,data_nasc_esposa,id_marido_fk,dt_casa_marido_esposa) values
('Jo','1990-12-31','2','2010-01-20');

select dt_casa_marido_esposa,nome_esposa,nome_marido 
from esposas,maridos
where id_marido_fk = id_marido;

delete from maridos
where id_marido = 2;

--------------------------------------------------------------------------------------

-- JOIN --

-- SEM JOIN	
select dt_casa_marido_esposa,nome_esposa,nome_marido 
from esposas,maridos
where id_marido_fk = id_marido;

-- COM JOIN
select dt_casa_marido_esposa,nome_esposa,nome_marido 
from esposas
inner join maridos
on id_marido_fk = id_marido;

---------------------------------------------------------------------------------------

-- PONTEIRAMENTO --

drop table esposas;

CREATE TABLE ESPOSAS (
id_esposa INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_marido INTEGER NOT NULL UNIQUE,
nome_esposa VARCHAR(40) NOT NULL,
data_nasc_esposa DATE,
dt_casa_marido_esposa DATE NOT NULL,
FOREIGN KEY(id_marido) REFERENCES MARIDOS (id_marido) on update cascade on delete cascade
);

insert into esposas(nome_esposa,data_nasc_esposa,id_marido,dt_casa_marido_esposa) values
('Carolina','1982-10-09','1','2007-06-09'),
('Maria','1973-06-18','2','2000-01-15'),
('Maricota','1955-07-21','3','1975-03-05');

-- SEM PONTEIRAMENTO

select dt_casa_marido_esposa,nome_esposa,nome_marido 
from esposas
inner join maridos
on id_marido_fk = id_marido;

-- COM PONTEIRAMENTO

select esposas.dt_casa_marido_esposa,esposas.nome_esposa,maridos.nome_marido
from esposas
inner join maridos
on esposas.id_marido = maridos.id_marido;

select e.dt_casa_marido_esposa,e.nome_esposa,m.nome_marido
from esposas as e
inner join maridos as m
on e.id_marido = m.id_marido;

select e.dt_casa_marido_esposa,e.nome_esposa,m.nome_marido
from esposas e
inner join maridos m
on e.id_marido = m.id_marido
where e.dt_casa_marido_esposa >= '2000-01-01';

-----------------------------------------------------------------------------------

-- 1.SELEÇÃO - 2.PROJEÇÃO - 3.ORIGEM - 4.JUNÇÃO --

select 														/* PROJEÇÃO */
	e.dt_casa_marido_esposa AS 'Data Casamento',
	e.nome_esposa AS 'Esposa',
	m.nome_marido AS 'Marido'								
from esposas e												/*  ORIGEM  */
inner join maridos m										/*  JUNÇÃO  */
on e.id_marido = m.id_marido								/*          */
where e.dt_casa_marido_esposa >= '2000-01-01';				/* SELEÇÃO  */

-----------------------------------------------------------------------------------

--Comandos DML (data manipulation language)

  --insert
  --select 
  --update 
  --delete

--Comandos DDL (data definition language)

  --create table
  --alter table (change, modify, add, drop column)
  --after e first (posição de inserção na tabela)
  
-----------------------------------------------------------------------------------
  
-- Views --
 
CREATE or REPLACE VIEW vw_casamento
as
	select 														
		e.dt_casa_marido_esposa AS 'Data_Casamento',
		e.nome_esposa AS 'Esposa',
		m.nome_marido AS 'Marido'								
	from esposas e												
	inner join maridos m										
	on e.id_marido = m.id_marido
;
 
CREATE or REPLACE VIEW vw_casamento_2000
AS
	select *
	from vw_casamento
	where Data_Casamento >= '2000-01-01'
;

select v.Esposa,v.Marido 
from vw_casamento_2000 v 
order by v.Data_Casamento;
 
/*
Caso 1

#include <stdio.h>

int main(){

	int n1=0,n2=0,soma=0,resp=0;
	
	do{
		printf("Entre com dois numeros:");
		scanf("%i",&n1);
		scanf("%i",&n2);
	
		soma=n1+n2;
	
		printf("O valor da soma foi: %i",soma);
	
		printf("\nDeseja fazer uma nova soma? [1-SIM / 0-NAO] ");
		scanf("%i",&resp);
	} while(resp==1);
	
	return 0;
}

///////////////////////////////////////////////////////////////////////////////////////////

Caso 2

#include <stdio.h>

int n1=0,n2=0,soma=0;

int main(){

	f_entrada();
	return 0;
}

int f_entrada(){
	printf("Entre com dois numeros:");
	scanf("%i",&n1);
	scanf("%i",&n2);
	f_soma();
}

int f_soma(){
	soma=n1+n2;
	f_saida();
}

int f_saida(){
	int resp=0;
	printf("O valor da soma foi: %i",soma);
	printf("\nDeseja fazer uma nova soma? [1-SIM / 0-NAO] ");
	scanf("%i",&resp);
	if (resp == 1){
		f_entrada();
	}
	else{
		printf("Ate logo!");
	}
}
*/