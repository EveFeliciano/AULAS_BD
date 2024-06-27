-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE carro (
id_carro int PRIMARY KEY,
placa varchar(20),
marca varchar(20),
cor varchar(20),
porte varchar(30),
chassi varchar(60),
id_cliente int
)

CREATE TABLE cliente (
id_cliente int PRIMARY KEY,
nome varchar(50),
email varchar(30),
dataNasc varchar(20),
telefone varchar(20),
cpf varchar(40),
rg varchar(40),
rua varchar(50),
num varchar(20),
compl varchar(255),
bairro varchar(50),
cidade varchar(60),
estado varchar(50),
cep varchar(20)
)

CREATE TABLE ocorrencia (
id_ocorrencia int PRIMARY KEY,
data varchar(20),
hora varchar(30),
rua varchar(50),
bairro varchar(40),
cidade varchar(70),
desc varchar(200),
id_carro int,
id_tipo int,
FOREIGN KEY(id_carro) REFERENCES carro (id_carro)
)

CREATE TABLE tipo (
id_tipo int PRIMARY KEY,
tipo varchar(200)
)

ALTER TABLE carro ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
ALTER TABLE ocorrencia ADD FOREIGN KEY(id_tipo) REFERENCES tipo (id_tipo)
