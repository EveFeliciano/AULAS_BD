-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/06/2024 às 17:42
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `prodvinho`
--
CREATE DATABASE IF NOT EXISTS `prodvinho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prodvinho`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `casta`
--

DROP TABLE IF EXISTS `casta`;
CREATE TABLE `casta` (
  `codCasta` int(11) NOT NULL,
  `casta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `casta`
--

INSERT INTO `casta` (`codCasta`, `casta`) VALUES
(1, 'Touriga Nacional'),
(2, 'Tinta Roriz'),
(3, 'Tinta Barroca');

-- --------------------------------------------------------

--
-- Estrutura para tabela `casta_vinho`
--

DROP TABLE IF EXISTS `casta_vinho`;
CREATE TABLE `casta_vinho` (
  `codVinho` int(11) DEFAULT NULL,
  `codCasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor`
--

DROP TABLE IF EXISTS `produtor`;
CREATE TABLE `produtor` (
  `produtorid` int(11) NOT NULL,
  `nomeProd` varchar(50) DEFAULT NULL,
  `moradaProd` varchar(50) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `codregiao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtor`
--

INSERT INTO `produtor` (`produtorid`, `nomeProd`, `moradaProd`, `telefone`, `email`, `codregiao`) VALUES
(1, 'Qt. Vallado', 'Régua', '254323147', 'vallado@mail.telepac.pt', 1),
(3, 'Finagra', 'Reguengos', '266509270', 'esporao@esporao.com', 2),
(4, 'Dão Sul', NULL, NULL, NULL, 3),
(6, 'Kolheita Ideias', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `regiao`
--

DROP TABLE IF EXISTS `regiao`;
CREATE TABLE `regiao` (
  `idregiao` int(11) NOT NULL,
  `descriregiao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `regiao`
--

INSERT INTO `regiao` (`idregiao`, `descriregiao`) VALUES
(1, 'Dão'),
(2, 'Alenteijo'),
(3, 'Douro'),
(4, 'Etec MCM'),
(5, 'Fazenda da Etec'),
(7, 'Fazenda Sul Cíntia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vinho`
--

DROP TABLE IF EXISTS `vinho`;
CREATE TABLE `vinho` (
  `vinhoId` int(11) NOT NULL,
  `nomeVinho` varchar(30) DEFAULT NULL,
  `ano_vinho` int(11) DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `grau` decimal(7,2) DEFAULT NULL,
  `preco` decimal(7,2) DEFAULT NULL,
  `codProdutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vinho`
--

INSERT INTO `vinho` (`vinhoId`, `nomeVinho`, `ano_vinho`, `cor`, `grau`, `preco`, `codProdutor`) VALUES
(1, 'Esporão Reserva', 2004, 'Tinto', 14.50, 18.50, 3),
(2, 'Quinta do Vallado', 2004, 'Tinto', 14.00, 6.50, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `casta`
--
ALTER TABLE `casta`
  ADD PRIMARY KEY (`codCasta`);

--
-- Índices de tabela `casta_vinho`
--
ALTER TABLE `casta_vinho`
  ADD KEY `codVinho` (`codVinho`),
  ADD KEY `codCasta` (`codCasta`);

--
-- Índices de tabela `produtor`
--
ALTER TABLE `produtor`
  ADD PRIMARY KEY (`produtorid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `codregiao` (`codregiao`);

--
-- Índices de tabela `regiao`
--
ALTER TABLE `regiao`
  ADD PRIMARY KEY (`idregiao`);

--
-- Índices de tabela `vinho`
--
ALTER TABLE `vinho`
  ADD PRIMARY KEY (`vinhoId`),
  ADD KEY `codProdutor` (`codProdutor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `casta`
--
ALTER TABLE `casta`
  MODIFY `codCasta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtor`
--
ALTER TABLE `produtor`
  MODIFY `produtorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `regiao`
--
ALTER TABLE `regiao`
  MODIFY `idregiao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vinho`
--
ALTER TABLE `vinho`
  MODIFY `vinhoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `casta_vinho`
--
ALTER TABLE `casta_vinho`
  ADD CONSTRAINT `casta_vinho_ibfk_1` FOREIGN KEY (`codVinho`) REFERENCES `vinho` (`vinhoId`),
  ADD CONSTRAINT `casta_vinho_ibfk_2` FOREIGN KEY (`codCasta`) REFERENCES `casta` (`codCasta`);

--
-- Restrições para tabelas `produtor`
--
ALTER TABLE `produtor`
  ADD CONSTRAINT `produtor_ibfk_1` FOREIGN KEY (`codregiao`) REFERENCES `regiao` (`idregiao`);

--
-- Restrições para tabelas `vinho`
--
ALTER TABLE `vinho`
  ADD CONSTRAINT `vinho_ibfk_1` FOREIGN KEY (`codProdutor`) REFERENCES `produtor` (`produtorid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
