-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/09/2024 às 04:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliária`
--
CREATE DATABASE IF NOT EXISTS `imobiliária` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `imobiliária`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
CREATE TABLE `aluguel` (
  `id_aluguel` int(11) NOT NULL,
  `valor` decimal(4,2) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` int(11) DEFAULT NULL,
  `id_inquilino` int(11) DEFAULT NULL,
  `id_imovel` int(11) DEFAULT NULL,
  `id_corretor` int(11) DEFAULT NULL,
  `aluguel` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `aluguel`
--

INSERT INTO `aluguel` (`id_aluguel`, `valor`, `data_inicio`, `data_fim`, `id_inquilino`, `id_imovel`, `id_corretor`, `aluguel`) VALUES
(1, 99.99, '2024-01-01', 2024, NULL, NULL, NULL, NULL),
(2, 99.99, '2024-02-01', 2024, NULL, NULL, NULL, NULL),
(3, 99.99, '2024-03-01', 2024, NULL, NULL, NULL, NULL),
(4, 99.99, '2024-04-01', 2024, NULL, NULL, NULL, NULL),
(5, 99.99, '2024-05-01', 2024, NULL, NULL, NULL, NULL),
(6, 99.99, '2024-06-01', 2024, NULL, NULL, NULL, NULL),
(7, 99.99, '2024-07-01', 2024, NULL, NULL, NULL, NULL),
(8, 99.99, '2024-08-01', 2024, NULL, NULL, NULL, NULL),
(9, 99.99, '2024-09-01', 2024, NULL, NULL, NULL, NULL),
(10, 99.99, '2024-10-01', 2024, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `corretor`
--

DROP TABLE IF EXISTS `corretor`;
CREATE TABLE `corretor` (
  `CPF` varchar(14) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_corretor` int(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `corretor`
--

INSERT INTO `corretor` (`CPF`, `data_nasc`, `nome`, `id_corretor`, `telefone`, `email`) VALUES
('123.456.789-01', '1980-01-15', 'Carmo Carlos', 1, '(11) 91234-5678', 'carmo.carlos@email.com'),
('234.567.890-12', '1985-02-20', 'Carmo Claudia', 2, '(21) 92345-6789', 'carmo.claudia@email.com'),
('345.678.901-23', '1990-03-25', 'José Silva', 3, '(31) 93456-7890', 'jose.silva@email.com'),
('456.789.012-34', '1975-04-30', 'Maria Oliveira', 4, '(41) 94567-8901', 'maria.oliveira@email.com'),
('567.890.123-45', '1982-05-10', 'Fernanda Almeida', 5, '(51) 95678-9012', 'fernanda.almeida@email.com'),
('678.901.234-56', '1995-06-15', 'Rafael Costa', 6, '(61) 96789-0123', 'rafael.costa@email.com'),
('789.012.345-67', '1988-07-20', 'Cristina Souza', 7, '(71) 97890-1234', 'cristina.souza@email.com'),
('890.123.456-78', '1992-08-25', 'Ana Beatriz', 8, '(81) 98901-2345', 'ana.beatriz@email.com'),
('901.234.567-89', '1989-09-30', 'Bruno Martins', 9, '(91) 99012-3456', 'bruno.martins@email.com'),
('012.345.678-90', '1987-10-05', 'Camila Ferreira', 10, '(31) 90123-4567', 'camila.ferreira@email.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `CEP` varchar(9) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `uf` int(2) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `id_endereco` int(11) NOT NULL,
  `id_imovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fiador`
--

DROP TABLE IF EXISTS `fiador`;
CREATE TABLE `fiador` (
  `id_fiador` int(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imovel`
--

DROP TABLE IF EXISTS `imovel`;
CREATE TABLE `imovel` (
  `id_imovel` int(11) NOT NULL,
  `quant_banheiro` int(11) DEFAULT NULL,
  `quant_quarto` int(11) DEFAULT NULL,
  `piscina` bit(1) DEFAULT NULL,
  `garagem` bit(1) DEFAULT NULL,
  `lavanderia` bit(1) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `area` decimal(4,2) DEFAULT NULL,
  `id_prop` int(11) DEFAULT NULL,
  `quant_comodos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inquilino`
--

DROP TABLE IF EXISTS `inquilino`;
CREATE TABLE `inquilino` (
  `id_inquilino` int(11) NOT NULL,
  `id_fiador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inquilinoo`
--

DROP TABLE IF EXISTS `inquilinoo`;
CREATE TABLE `inquilinoo` (
  `id_inquilinoo` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `inquilinoo`
--

INSERT INTO `inquilinoo` (`id_inquilinoo`, `email`, `nome`, `data_nasc`, `CPF`, `celular`, `salario`) VALUES
('INQ006', 'joana.silva@email.com', 'Joana Silva', '1987-03-25', '678.901.234-55', 0, 2500),
('INQ007', 'lucas.martins@email.com', 'Lucas Martins', '1991-07-14', '789.012.345-66', 0, 3000),
('INQ008', 'patricia.oliveira@email.com', 'Patricia Oliveira', '1984-11-30', '890.123.456-77', 0, 2800),
('INQ009', 'roberto.pereira@email.com', 'Roberto Pereira', '1980-06-05', '901.234.567-88', 0, 3200),
('INQ010', 'elisabete.souza@email.com', 'Elisabete Souza', '1993-09-20', '012.345.678-99', 0, 2700);

-- --------------------------------------------------------

--
-- Estrutura para tabela `midias`
--

DROP TABLE IF EXISTS `midias`;
CREATE TABLE `midias` (
  `id_midia` int(11) NOT NULL,
  `midias_digitais` varchar(255) DEFAULT NULL,
  `id_imovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
CREATE TABLE `proprietario` (
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `pix` varchar(20) DEFAULT NULL,
  `agencia` varchar(50) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `conta` varchar(50) DEFAULT NULL,
  `quant_imovel` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_prop` int(11) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `proprietario`
--

INSERT INTO `proprietario` (`email`, `telefone`, `pix`, `agencia`, `banco`, `conta`, `quant_imovel`, `nome`, `id_prop`, `data_nasc`, `CPF`) VALUES
('carlos.araujo@email.com', '(11) 91234-5678', NULL, NULL, NULL, NULL, NULL, 'Carlos Araújo', 0, NULL, NULL),
('joaosilva@gmail.com', '(11) 1987654321', 'pixjoao2024', '1234', 'Banco do Brasil', '123456-7', 3, 'João Silva', 1, '1985-07-20', '123.456.789-00'),
('mariapereira@yahoo.com.br', '(11) 1912345678', 'pixmaria2024', '5678', 'Itaú', '234567-8', 2, 'Maria Pereira', 2, '1990-08-15', '234.567.890-11'),
('carlosgomes@uol.com.br', '(11) 1345678901', 'pixcarlos2024', '9101', 'Bradesco', '345678-9', 1, 'Carlos Gomes', 3, '1975-05-30', '345.678.901-22'),
('anacarvalho@hotmail.com', '(11) 122334455', 'pixana2024', '1122', 'Santander', '456789-0', 4, 'Ana Carvalho', 4, '1982-12-01', '456.789.012-33'),
('joseoliveira@gmail.com', '(11) 1987654321', 'pixjose2024', '2233', 'Caixa Econômica', '567890-1', 5, 'José Oliveira', 5, '1992-11-22', '567.890.123-44'),
('fernandasantos@bol.com.br', '(11) 187654321', 'pixfernanda2024', '3344', 'HSBC', '678901-2', 6, 'Fernanda Santos', 6, '1988-03-10', '678.901.234-55'),
('robertoalves@gmail.com', '(11) 176543210', 'pixroberto2024', '4455', 'Banrisul', '789012-3', 2, 'Roberto Alves', 7, '1995-01-25', '789.012.345-66'),
('patriciasouza@terra.com.br', '(11) 165432109', 'pixpatricia2024', '5566', 'Sicredi', '890123-4', 3, 'Patrícia Souza', 8, '1982-06-17', '890.123.456-77'),
('lucasmartins@gmail.com', '(11) 154321098', 'pixlucas2024', '6677', 'Banco do Nordeste', '901234-5', 4, 'Lucas Martins', 9, '1979-09-07', '901.234.567-88'),
('julianasilva@yahoo.com.br', '(11) 143210987', 'pixjuliana2024', '7788', 'Banco da Amazônia', '012345-6', 1, 'Juliana Silva', 10, '1996-04-14', '012.345.678-99');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`id_aluguel`),
  ADD KEY `id_inquilino` (`id_inquilino`),
  ADD KEY `id_imovel` (`id_imovel`),
  ADD KEY `id_corretor` (`id_corretor`);

--
-- Índices de tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`id_corretor`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_imovel` (`id_imovel`);

--
-- Índices de tabela `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`id_fiador`);

--
-- Índices de tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id_imovel`),
  ADD KEY `id_prop` (`id_prop`);

--
-- Índices de tabela `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`id_inquilino`),
  ADD KEY `id_fiador` (`id_fiador`);

--
-- Índices de tabela `inquilinoo`
--
ALTER TABLE `inquilinoo`
  ADD PRIMARY KEY (`id_inquilinoo`);

--
-- Índices de tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id_midia`),
  ADD KEY `id_imovel` (`id_imovel`);

--
-- Índices de tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id_prop`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`id_inquilino`) REFERENCES `inquilino` (`id_inquilino`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`),
  ADD CONSTRAINT `aluguel_ibfk_3` FOREIGN KEY (`id_corretor`) REFERENCES `corretor` (`id_corretor`);

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`);

--
-- Restrições para tabelas `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`id_prop`) REFERENCES `proprietario` (`id_prop`);

--
-- Restrições para tabelas `inquilino`
--
ALTER TABLE `inquilino`
  ADD CONSTRAINT `inquilino_ibfk_1` FOREIGN KEY (`id_fiador`) REFERENCES `fiador` (`id_fiador`);

--
-- Restrições para tabelas `midias`
--
ALTER TABLE `midias`
  ADD CONSTRAINT `midias_ibfk_1` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
