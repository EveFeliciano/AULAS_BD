-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE proprietario (
email varchar(255),
telefone varchar(20),
pix varchar(20),
agencia varchar(50),
banco varchar(50),
conta varchar(50),
quant_imovel int,
nome varchar(255),
id_prop int PRIMARY KEY,
data_nasc date,
CPF varchar(14)
)

CREATE TABLE imovel (
id_imovel int PRIMARY KEY,
quant_banheiro int,
quant_quarto int,
piscina bit,
garagem bit,
lavanderia bit,
extra varchar(255),
area decimal(4,2),
id_prop int,
FOREIGN KEY(id_prop) REFERENCES proprietario (id_prop)
)

CREATE TABLE endereco (
CEP varchar(9),
uf int(2),
cidade varchar(255),
bairro varchar(255),
rua verchar(255),
num int,
id_endereco int PRIMARY KEY,
complemento varchar(255),
id_imovel int,
FOREIGN KEY(id_imovel) REFERENCES imovel (id_imovel)
)

CREATE TABLE midias (
id_midia int PRIMARY KEY,
midias_digitais varchar(255),
id_imovel int,
FOREIGN KEY(id_imovel) REFERENCES imovel (id_imovel)
)

CREATE TABLE aluguel (
id_aluguel int PRIMARY KEY,
data_inicio date,
data_fim int,
valor decimal(4,2),
id_imovel int,
id_inquilino int,
id_corretor int,
FOREIGN KEY(id_imovel) REFERENCES imovel (id_imovel)
)

CREATE TABLE inquilino (
data_nasc date,
nome varchar(255),
id_inquilino int PRIMARY KEY,
email varchar(255),
telefone varchar(255),
CPF varchar(14),
id_fiador int
)

CREATE TABLE fiador (
CPF varchar(14),
email varchar(255),
telefone varchar(20),
id_fiador int PRIMARY KEY,
nome varchar(255),
data_nasc date
)

CREATE TABLE corretor (
data_nasc date,
nome varchar(255),
id_corretor int PRIMARY KEY,
email varchar(255),
telefone varchar(20),
CPF varchar(14)
)

ALTER TABLE aluguel ADD FOREIGN KEY(id_inquilino) REFERENCES inquilino (id_inquilino)
ALTER TABLE aluguel ADD FOREIGN KEY(id_corretor) REFERENCES corretor (id_corretor)
ALTER TABLE inquilino ADD FOREIGN KEY(id_fiador) REFERENCES fiador (id_fiador)
