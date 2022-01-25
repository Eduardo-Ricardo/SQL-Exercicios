-------------------------------------------------------------------------------------------------------

/* - JOIN - */

select nome_marido,nome_esposa,dt_casa_marido_esposa 
from maridos,esposas
where id_marido = id_marido_fk;

select nome_marido,nome_esposa,dt_casa_marido_esposa 
from maridos
inner join esposas
on id_marido = id_marido_fk;

select nome_marido as Marido,nome_esposa as Esposa,dt_casa_marido_esposa as 'Data Casamento' 
from maridos
inner join esposas
on id_marido = id_marido_fk;

/* - PONTEIRAMENTO - */

--sem ponteiramento
select nome_marido,nome_esposa,dt_casa_marido_esposa 
from maridos
inner join esposas
on id_marido = id_marido_fk;

--com ponteiramento
select maridos.nome_marido,esposas.nome_esposa,esposas.dt_casa_marido_esposa 
from maridos
inner join esposas
on maridos.id_marido = esposas.id_marido_fk;

select m.nome_marido,e.nome_esposa,e.dt_casa_marido_esposa 
from maridos as m
inner join esposas as e
on m.id_marido = e.id_marido_fk;

/* - Projeção / Seleção / Junção - */

select m.nome_marido,e.nome_esposa,e.dt_casa_marido_esposa 
from maridos as m
inner join esposas as e
on m.id_marido = e.id_marido_fk
where e.dt_casa_marido_esposa >= '2000-01-01'
order by e.dt_casa_marido_esposa;

select c.nome_cli,c.sexo_cli,e.bairro_end,e.cidade_end,t.tipo_tel,t.numero_tel
from clientes as c
inner join enderecos as e
on c.id_cli = e.id_cli_fk
inner join telefones as t
on c.id_cli = t.id_cli_fk
where c.sexo_cli = 'M'
order by c.nome_cli;

---------------------------------------------------------------------

--Comandos DML (data manipulation language)

  --insert
  --select 
  --update 
  --delete

--Comandos DDL (data definition language)

  --create table
  --alter table (change, modify, add, drop column)
  --after e first (posição de inserção na tabela)
