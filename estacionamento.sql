-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Set-2024 às 14:08
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--
CREATE DATABASE IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `estacionamento`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `andar`
--

DROP TABLE IF EXISTS `andar`;
CREATE TABLE `andar` (
  `codlugar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `andar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cpf` varchar(20) NOT NULL,
  `dtnasc` datetime DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `dtnasc`, `nome`) VALUES
('012.210.345-66', '1986-10-10 00:00:00', 'Tiago Silva'),
('012.345.678-99', '1978-02-14 00:00:00', 'Felipe Carvalho'),
('123.321.456-77', '1993-01-23 00:00:00', 'Beatriz Lima'),
('123.456.789-00', '1985-06-15 00:00:00', 'Ana Souza'),
('234.432.567-88', '1987-05-14 00:00:00', 'Gustavo Andrade'),
('234.567.890-11', '1990-08-22 00:00:00', 'Carlos Silva'),
('345.543.678-99', '1994-06-30 00:00:00', 'Juliana Costa'),
('345.678.901-22', '1983-12-30 00:00:00', 'Maria Oliveira'),
('456.654.789-00', '1980-07-16 00:00:00', 'Ricardo Almeida'),
('456.789.012-33', '1975-03-05 00:00:00', 'João Santos'),
('567.765.890-11', '1991-08-09 00:00:00', 'Amanda Freitas'),
('567.890.123-44', '1992-07-11 00:00:00', 'Patrícia Costa'),
('678.876.901-22', '1989-09-25 00:00:00', 'Eduardo Martins'),
('678.901.234-55', '1988-09-21 00:00:00', 'Rafael Almeida'),
('789.012.345-66', '1995-11-12 00:00:00', 'Fernanda Pereira'),
('789.987.012-33', '1992-11-18 00:00:00', 'Simone Rocha'),
('890.098.123-44', '1984-12-02 00:00:00', 'Marcelo Carvalho'),
('890.123.456-77', '1981-04-19 00:00:00', 'Lucas Pereira'),
('901.109.234-55', '1996-03-20 00:00:00', 'Larissa Oliveira'),
('901.234.567-88', '1996-10-29 00:00:00', 'Juliana Martins');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estaciona`
--

DROP TABLE IF EXISTS `estaciona`;
CREATE TABLE `estaciona` (
  `codest` int(11) NOT NULL,
  `horaentrada` datetime DEFAULT NULL,
  `horasaida` datetime DEFAULT NULL,
  `dataentrada` datetime DEFAULT NULL,
  `datasaida` datetime DEFAULT NULL,
  `placa` int(11) DEFAULT NULL,
  `codlugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

DROP TABLE IF EXISTS `modelo`;
CREATE TABLE `modelo` (
  `codmodelo` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`codmodelo`, `modelo`) VALUES
(1, 'Fusca'),
(2, 'Civic'),
(3, 'Corolla'),
(4, 'Uno'),
(5, 'Gol'),
(6, 'Focus'),
(7, 'Cruze'),
(8, 'Sandero'),
(9, 'Onix'),
(10, 'Kwid'),
(11, 'Fit'),
(12, 'Jetta'),
(13, 'Astra'),
(14, 'Argo'),
(15, 'Siena'),
(16, 'Polo'),
(17, 'Fusion'),
(18, 'Hilux'),
(19, 'Ranger'),
(20, 'WR-V');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE `veiculo` (
  `placa` int(11) NOT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `codmodelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`codlugar`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`codest`),
  ADD KEY `placa` (`placa`),
  ADD KEY `codlugar` (`codlugar`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codmodelo`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `codmodelo` (`codmodelo`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`codlugar`) REFERENCES `andar` (`codlugar`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codmodelo`) REFERENCES `modelo` (`codmodelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
