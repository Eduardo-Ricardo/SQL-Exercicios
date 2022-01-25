-- Criar branco de dados bd empresa
CREATE  database bd_empresa;

-- selecionar bd
use bd_empresa;

-- criar tabelas
CREATE TABLE Departamentos (
Departamento_Id char(4) PRIMARY KEY not null,
Departamento VARCHAR(20) not null
);

CREATE TABLE Itens (
Item_Id char(4) PRIMARY KEY not null,
Item VARCHAR(20) not null
);

CREATE TABLE Requisicoes (
Req_Id char(4) PRIMARY KEY,    
Departamento_Id char(4) not null,
FOREIGN KEY(Departamento_Id) REFERENCES Departamentos (Departamento_Id) on update cascade on delete cascade,
Item_Id char(4) not null,
FOREIGN KEY(Item_Id) REFERENCES Itens (Item_Id) on delete cascade on update cascade,
Qtd float (6,2),
Preco_Unit float (6,2)
);


-- inserir registros nos campos
insert into departamentos (Departamento_Id, Departamento) values
('D001', 'RH'),
('D002','Financeiro'),
('D003', 'Produção'),
('D004', 'TI');

insert into Itens (Item_Id, Item) values
('I001', 'Papel'),
('I002', 'Caneta'),
('I003', 'NoteBook'),
('I004', 'Impressora');

insert into Requisicoes (Req_Id, Departamento_Id, Item_Id, Qtd, Preco_Unit) values
('Q001', 'D002', 'I001', '500', '0.3'),
('Q002', 'D004', 'I002', '40', '2.5'),
('Q003', 'D001', 'I003', '5', '3000'),
('Q004', 'D001', 'I004', '2', '650');

create or REPLACE view RequisicoesTotal
as
    select 
        r.Req_Id, d.Departamento_Id, 
        i.Item_Id, i.Item, r.Qtd, 
        r.Preco_Unit, 
        (r.Qtd * r.Preco_Unit) as Total
    from Itens as i
    inner join Requisicoes as r
    inner join departamentos as d
    on d.Departamento_Id = r.Departamento_Id and i.Item_Id = r.Item_Id
;
