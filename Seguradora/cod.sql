CREATE DATABASE seguradora;
USE seguradora;


CREATE TABLE cliente (
id_cliente int PRIMARY KEY AUTO_INCREMENT,
nome varchar(50) not null,
email varchar(30) unique not null,
dataNasc varchar(20) not null,
telefone varchar(20) not null,
cpf varchar(40) unique not null, 
rg varchar(40) unique not null,
rua varchar(50),
num varchar(20),
compl varchar(255),
bairro varchar(50),
cidade varchar(60),
estado varchar(50),
cep varchar(20)
);

CREATE TABLE carro (
id_carro int PRIMARY KEY AUTO_INCREMENT,
placa varchar(20) not null,
marca varchar(20) not null,
modelo varchar(20) not null,
cor varchar(20),
porte varchar(30),
chassi varchar(60),
id_cliente int,
FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE tipo (
id_tipo int PRIMARY KEY AUTO_INCREMENT,
tipo varchar(200)
);

CREATE TABLE ocorrencia (
id_ocorrencia int PRIMARY KEY AUTO_INCREMENT,
data varchar(20),
hora varchar(30),
rua varchar(50),
bairro varchar(40),
cidade varchar(70),
desc varchar(60),
id_carro int,
id_tipo int,
FOREIGN KEY(id_carro) REFERENCES carro (id_carro),
FOREIGN KEY(id_tipo) REFERENCES tipo (id_tipo)
);
