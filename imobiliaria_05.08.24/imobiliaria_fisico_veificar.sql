-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Proprietário (
datanasc date,
endereco varchar,
cpf varchar,
nome varchar(255),
id_prop int PRIMARY KEY,
tel varchar,
rg varchar,
email varchar(255)
)

CREATE TABLE fiador (
nome varchar(255),
contato num,
rg varchar(20),
cpf varchar(30),
telefone varchar(20),
id_fiador varchar PRIMARY KEY
)

CREATE TABLE Corretor (
id_corretor int PRIMARY KEY,
cpf varchar(11),
bairro varchar(155),
rua varchar(155),
rg unique ,
datanasc date,
cidade varchar(155),
tel num,
contrato varchar(155),
nome varchar(155)
)

CREATE TABLE Inquilino (
id_inq int PRIMARY KEY,
datanasc date,
estado varchar(155),
rg varchar(155),
cpf varchar(11),
cidade varchar(155),
nome varchar(155),
rua varchar(155),
bairro varchar(155),
contato num,
id_imovel int
)


CREATE TABLE Imóvel (
id_imovel int PRIMARY KEY,
estado varchar(155),
bairro varchar(155),
num num,
cidade varchar(155),
rua varchar(155),
cep varchar,
complemento varchar,
id_prop int,
FOREIGN KEY(id_prop) REFERENCES Proprietário (id_prop)
)

CREATE TABLE info (
lavanderia bit,
cozinha int,
sacada bit,
garagem bit,
sala bit,
quintal bit,
quarto int,
vagasgaragem int,
condominio int,
extra varchar(255),
piscina bit,
churrasqueira bit,
id_imovel int,
FOREIGN KEY(id_imovel) REFERENCES Imóvel (id_imovel)
)

CREATE TABLE Aluguel (
preco num,
mensalidade num,
entrada num,
datapag date,
condicoes varchar(255)
)


CREATE TABLE Midia (
fotos varchar,
videos varchar
)

CREATE TABLE contata (
id_corretor int,
id_inq int,
FOREIGN KEY(id_corretor) REFERENCES Corretor (id_corretor),
FOREIGN KEY(id_inq) REFERENCES Inquilino (id_inq)
)

CREATE TABLE aluga (
id_imovel int,
id_corretor int,
FOREIGN KEY(id_imovel) REFERENCES Imóvel (id_imovel),
FOREIGN KEY(id_corretor) REFERENCES Corretor (id_corretor)
)

CREATE TABLE possui (
id_imovel int,
FOREIGN KEY(id_imovel) REFERENCES Imóvel (id_imovel)
)

-- Erro: Nome de tabela duplicado (este erro compromete a integridade referencial)!
CREATE TABLE possui (
id_fiador Texto(1),
id_inq int,
FOREIGN KEY(id_fiador) REFERENCES fiador (id_fiador),
FOREIGN KEY(id_inq) REFERENCES Inquilino (id_inq)
)

CREATE TABLE gerencia (
id_imovel int,
id_fiador Texto(1),
FOREIGN KEY(id_imovel) REFERENCES Imóvel (id_imovel),
FOREIGN KEY(id_fiador) REFERENCES fiador (id_fiador)
)

-- Erro: Nome de tabela duplicado (este erro compromete a integridade referencial)!
CREATE TABLE possui (
id_imovel int/*falha: chave estrangeira*/
)

ALTER TABLE Inquilino ADD FOREIGN KEY(id_imovel) REFERENCES Imóvel (id_imovel)
