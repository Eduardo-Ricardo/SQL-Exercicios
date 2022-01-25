create database BigBike;

use BigBike;

-- -----------------------------------------------------
-- Table `cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cargo` (
  `idcargo` INT NOT NULL AUTO_INCREMENT,
  `salario` FLOAT NOT NULL,
  `desc_cargo` TEXT NOT NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `funcionario` (
  `idfuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cargo_idcargo` INT NOT NULL,
  PRIMARY KEY (`idfuncionario`),
  INDEX `fk_funcionario_cargo_idx` (`cargo_idcargo` ASC) VISIBLE,
  CONSTRAINT `fk_funcionario_cargo`
    FOREIGN KEY (`cargo_idcargo`)
    REFERENCES `cargo` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bicicleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicicleta` (
  `idbicicleta` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idbicicleta`),
  INDEX `fk_bicicleta_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  CONSTRAINT `fk_bicicleta_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `informacoes_pessoais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `informacoes_pessoais` (
  `idinformacoes_pessoais` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(11) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idinformacoes_pessoais`),
  INDEX `fk_informacoes_pessoais_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  CONSTRAINT `fk_informacoes_pessoais_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prazo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prazo` (
  `idprazo` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `prazo_estimado` DATE NOT NULL,
  `duracao_em_horas` FLOAT NOT NULL,
  PRIMARY KEY (`idprazo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `manutencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manutencao` (
  `idmanutencao` INT NOT NULL AUTO_INCREMENT,
  `desc_servico` TEXT NOT NULL,
  `preco_orcado` FLOAT NOT NULL,
  `prazo_idprazo` INT NOT NULL,
  `bicicleta_idbicicleta` INT NOT NULL,
  `funcionario_idfuncionario` INT NOT NULL,
  PRIMARY KEY (`idmanutencao`),
  INDEX `fk_manutencao_prazo1_idx` (`prazo_idprazo` ASC) VISIBLE,
  INDEX `fk_manutencao_bicicleta1_idx` (`bicicleta_idbicicleta` ASC) VISIBLE,
  INDEX `fk_manutencao_funcionario1_idx` (`funcionario_idfuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_manutencao_prazo1`
    FOREIGN KEY (`prazo_idprazo`)
    REFERENCES `prazo` (`idprazo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manutencao_bicicleta1`
    FOREIGN KEY (`bicicleta_idbicicleta`)
    REFERENCES `bicicleta` (`idbicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manutencao_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estoque` (
  `idestoque` INT NOT NULL AUTO_INCREMENT,
  `nome_peca` VARCHAR(45) NOT NULL,
  `quantia_em_estoque` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestoque`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `preco_peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `preco_peca` (
  `idpreco_peca` INT NOT NULL AUTO_INCREMENT,
  `preco_compra_peca` FLOAT NOT NULL,
  `preco_venda_peca` FLOAT NOT NULL,
  PRIMARY KEY (`idpreco_peca`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venda` (
  `idvenda` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATE NOT NULL,
  `preco_orcado` FLOAT NOT NULL,
  `estoque_idestoque` INT NOT NULL,
  `preco_peca_idpreco_peca` INT NOT NULL,
  PRIMARY KEY (`idvenda`),
  INDEX `fk_venda_estoque1_idx` (`estoque_idestoque` ASC) VISIBLE,
  INDEX `fk_venda_preco_peca1_idx` (`preco_peca_idpreco_peca` ASC) VISIBLE,
  CONSTRAINT `fk_venda_estoque1`
    FOREIGN KEY (`estoque_idestoque`)
    REFERENCES `estoque` (`idestoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_preco_peca1`
    FOREIGN KEY (`preco_peca_idpreco_peca`)
    REFERENCES `preco_peca` (`idpreco_peca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pagamento` (
  `idpagamento` INT NOT NULL AUTO_INCREMENT,
  `forma_pagamento` VARCHAR(30) NOT NULL,
  `setor` VARCHAR(20) NOT NULL,
  `valor_pago` FLOAT NOT NULL,
  `data_pagamento` DATE NOT NULL,
  `manutencao_idmanutencao` INT,
  `venda_idvenda` INT,
  PRIMARY KEY (`idpagamento`),
  INDEX `fk_pagamento_manutencao1_idx` (`manutencao_idmanutencao` ASC) VISIBLE,
  INDEX `fk_pagamento_venda1_idx` (`venda_idvenda` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_manutencao1`
    FOREIGN KEY (`manutencao_idmanutencao`)
    REFERENCES `manutencao` (`idmanutencao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_venda1`
    FOREIGN KEY (`venda_idvenda`)
    REFERENCES `venda` (`idvenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- inserts

insert into cargo(salario, desc_cargo)
values
('5000', 'Dono'),
('1450', 'Atendente/Mecanico(a)');

select * from cargo;

insert into funcionario(nome, cargo_idcargo)
values
('Emanuel Francisco Borges Barbosa', '1'),
('Josue Oliveira', '2'),
('Jessica Fernandis', '2');

select * from funcionario;

insert into clientes(nome)
values
('Vinicius Junior'),
('Benjamim Sesko'),
('Pedro Marcos'),
('Alexandre de Moraes'),
('Youssoufa Moukoko'),
('Kevin Fight'),
('Chloe Moreira'),
('Yennefer Cirilla'),
('Gustavo Pedro'),
('Leonardo Glauck');

select * from clientes;

insert into informacoes_pessoais(telefone, clientes_idclientes)
values
('41995130737', '1'),
('31997865487', '1'),
('41997569089', '2'),
('41345678912', '5'),
('46998787654', '7'),
('46978641230', '8');

select * from informacoes_pessoais;

insert into bicicleta(marca, tipo, clientes_idclientes)
values
('CALOI', 'Bike de passeio', '1'),
('HERO', 'Bike de manobras', '2'),
('SMART', 'Bike elétrica', '5'),
('CALOI-PRO', 'Bike de corrida', '7'),
('CALOU', 'Bike de passeio', '8');

select * from bicicleta;

insert into estoque(nome_peca, quantia_em_estoque)
values
('Rolamento', '56'),
('Selim Preto', '5'),
('Quadro Esportivo', '3'),
('Pneu Aro 29 - Unidade', '12'),
('Graxa lubrificante', '5');

select * from estoque;

insert into preco_peca(preco_compra_peca, preco_venda_peca)
values
('25', '35'),
('100', '150'),
('1500', '2200'),
('50', '90'),
('70', '100');

select * from preco_peca;

insert into venda(data_venda, preco_orcado, estoque_idestoque, preco_peca_idpreco_peca)
values
('2021-03-21', '35', '1', '1'),
('2021-03-21', '300', '2', '2'),
('2021-04-10', '2200', '3', '3'),
('2021-04-21', '2200', '3', '4'),
('2021-05-02', '180', '4', '5');

select * from venda;

insert into prazo (data_inicio, data_entrega, prazo_estimado, duracao_em_horas)
values
('2020-03-20', '2020-03-30', '2020-03-30', '2'),
('2021-03-21', '2021-03-25', '2021-03-25', '0.5'),
('2021-04-15', '2021-04-25', '2021-04-25', '1.5'),
('2021-04-15', '2021-04-20', '2021-04-16', '0.25'),
('2021-05-01', '2021-05-21', '2021-05-11', '1');

select * from prazo;

insert into manutencao(desc_servico, preco_orcado, prazo_idprazo, funcionario_idfuncionario, bicicleta_idbicicleta)
values
('Troca de Pneu', '230', '1', '1', '1'),
('Troca de Selim', '200', '2', '2', '2'),
('Troca de Pneu', '230', '3', '3', '5'),
('Lubrificação dos eixos', '150', '4', '3', '4'),
('Troca de Pneu', '230', '5', '1', '3');

select * from manutencao;

insert into pagamento(forma_pagamento, setor, valor_pago, data_pagamento, venda_idvenda, manutencao_idmanutencao)
values
('Dinheiro', 'manutencao', '230', '2020-03-30', '1', NULL),
('Dinheiro', 'manutencao', '200', '2021-03-25', '2', NULL),
('Dinheiro', 'manutencao', '230', '2021-04-25', '3', NULL),
('Dinheiro', 'manutencao', '150', '2021-04-16', '4', NULL),
('Dinheiro', 'manutencao', '230', '2021-05-20', '5', NULL),
('Dinheiro', 'vendas', '35', '2021-03-21', NULL, '1'),
('Dinheiro', 'vendas', '300', '2021-03-21', NULL, '2'),
('Dinheiro', 'vendas', '2200', '2021-04-10', NULL, '3'),
('Dinheiro', 'vendas', '2200', '2021-04-21', NULL, '4'),
('Dinheiro', 'vendas', '180', '2021-05-02', NULL, '5');

select * from pagamento;


-- selects

select extract(DAY from data_pagamento) as dia, sum(valor_pago) as total from pagamento
group by dia;

select extract(MONTH from data_pagamento) as mes, sum(valor_pago) as total from pagamento
group by mes;

select extract(YEAR from data_pagamento) as ano, sum(valor_pago) as total from pagamento
group by ano;

select extract(DAY from p.data_inicio) as dia, count(DISTINCT m.bicicleta_idbicicleta) as total from manutencao as m inner join prazo as p on p.idprazo = m.idmanutencao 
group by dia;

select m.funcionario_idfuncionario as `id funcionario`, avg(p.duracao_em_horas) as `media em horas` from manutencao as m inner join prazo as p on p.idprazo = m.idmanutencao
group by m.funcionario_idfuncionario;

select c.desc_cargo as `cargo`, avg(p.duracao_em_horas) as `média de horas da manutenção`, avg(m.preco_orcado) as `valor médio do valor pago na
manutenção`, (c.salario / avg(p.duracao_em_horas)) as `valor médio pago em horas pro funcionário` from manutencao as m inner join prazo as p on m.idmanutencao = p.idprazo inner join cargo as c on c.idcargo = m.funcionario_idfuncionario
group by c.idcargo;

select setor, sum(valor_pago) as `quanto entra por setor` from pagamento
group by setor;

select sum(c.salario) as `custo total de funcionarios` from funcionario as f inner join cargo as c on c.idcargo = f.cargo_idcargo;

select v.estoque_idestoque as `id da peca no estoque`, ( (p.preco_venda_peca - p.preco_compra_peca) * count(v.estoque_idestoque) ) as lucro from preco_peca as p inner join venda as v on p.idpreco_peca = v.preco_peca_idpreco_peca 
group by v.estoque_idestoque;

select count(idprazo) as `numero de bikes fora do prazo` from prazo where data_entrega > prazo_estimado;


-- views

create or replace VIEW `caixa_por_dia`
AS
select extract(DAY from data_pagamento) as dia, sum(valor_pago) as total from pagamento
group by dia;

select * from `caixa_por_dia`;

create or replace VIEW `caixa_por_mes`
AS
select extract(MONTH from data_pagamento) as mes, sum(valor_pago) as total from pagamento
group by mes;

select * from `caixa_por_mes`;

create or replace VIEW `caixa_por_ano`
AS
select extract(YEAR from data_pagamento) as ano, sum(valor_pago) as total from pagamento
group by ano;

select * from `caixa_por_ano`;

create or replace VIEW `quantas_bikes_dia`
AS
select extract(DAY from p.data_inicio) as dia, count(DISTINCT m.bicicleta_idbicicleta) as total from manutencao as m inner join prazo as p on p.idprazo = m.idmanutencao 
group by dia;

select * from `quantas_bikes_dia`;

create or replace VIEW `media_horas_p/bike`
AS
select m.funcionario_idfuncionario as `id funcionario`, avg(p.duracao_em_horas) as `media em horas` from manutencao as m inner join prazo as p on p.idprazo = m.idmanutencao
group by m.funcionario_idfuncionario;

select * from `media_horas_p/bike`;

create or replace VIEW `medias`
AS
select c.desc_cargo as `cargo`, avg(p.duracao_em_horas) as `média de horas da manutenção`, avg(m.preco_orcado) as `valor médio do valor pago na
manutenção`, (c.salario / avg(p.duracao_em_horas)) as `valor médio pago em horas pro funcionário` from manutencao as m inner join prazo as p on m.idmanutencao = p.idprazo inner join cargo as c on c.idcargo = m.funcionario_idfuncionario
group by c.idcargo;

select * from `medias`;

create or replace VIEW `entrada_p/setor`
AS
select setor, sum(valor_pago) as `quanto entra por setor` from pagamento
group by setor;

select * from `entrada_p/setor`;

create or replace VIEW `custo_funcionarios`
AS
select sum(c.salario) as `custo total de funcionarios` from funcionario as f inner join cargo as c on c.idcargo = f.cargo_idcargo;

select * from `custo_funcionarios`;

create or replace VIEW `lucro_venda_pecas`
AS
select v.estoque_idestoque as `id da peca no estoque`, ( (p.preco_venda_peca - p.preco_compra_peca) * count(v.estoque_idestoque) ) as lucro from preco_peca as p inner join venda as v on p.idpreco_peca = v.preco_peca_idpreco_peca 
group by v.estoque_idestoque;

select * from `lucro_venda_pecas`;

create or replace VIEW `bikes_fora_prazo`
AS
select count(idprazo) as `numero de bikes fora do prazo` from prazo where data_entrega > prazo_estimado;

select * from `bikes_fora_prazo`;
