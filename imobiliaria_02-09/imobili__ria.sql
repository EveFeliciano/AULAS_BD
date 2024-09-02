-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2024 às 13:56
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
-- Banco de dados: `imobiliária`
--
CREATE DATABASE IF NOT EXISTS `imobiliária` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `imobiliária`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `id_aluguel` int(11) NOT NULL,
  `valor` decimal(4,2) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` int(11) DEFAULT NULL,
  `id_inquilino` int(11) DEFAULT NULL,
  `id_imovel` int(11) DEFAULT NULL,
  `id_corretor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

CREATE TABLE `corretor` (
  `CPF` varchar(14) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_corretor` int(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

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
-- Estrutura da tabela `fiador`
--

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
-- Estrutura da tabela `imovel`
--

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
-- Estrutura da tabela `inquilino`
--

CREATE TABLE `inquilino` (
  `telefone` varchar(255) DEFAULT NULL,
  `id_inquilino` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `id_fiador` int(11) DEFAULT NULL,
  `salario` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `id_midia` int(11) NOT NULL,
  `midias_digitais` varchar(255) DEFAULT NULL,
  `id_imovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

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
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`email`, `telefone`, `pix`, `agencia`, `banco`, `conta`, `quant_imovel`, `nome`, `id_prop`, `data_nasc`, `CPF`) VALUES
('joaosilva@gmail.com', '11987654321', 'pixjoao2024', '1234', 'Banco do Brasil', '123456-7', 3, 'João Silva', 1, '1985-07-20', '123.456.789-00'),
('mariapereira@yahoo.com.br', '11912345678', 'pixmaria2024', '5678', 'Itaú', '234567-8', 2, 'Maria Pereira', 2, '1990-08-15', '234.567.890-11'),
('carlosgomes@uol.com.br', '11345678901', 'pixcarlos2024', '9101', 'Bradesco', '345678-9', 1, 'Carlos Gomes', 3, '1975-05-30', '345.678.901-22'),
('anacarvalho@hotmail.com', '1122334455', 'pixana2024', '1122', 'Santander', '456789-0', 4, 'Ana Carvalho', 4, '1982-12-01', '456.789.012-33'),
('joseoliveira@gmail.com', '11987654321', 'pixjose2024', '2233', 'Caixa Econômica', '567890-1', 5, 'José Oliveira', 5, '1992-11-22', '567.890.123-44'),
('fernandasantos@bol.com.br', '1187654321', 'pixfernanda2024', '3344', 'HSBC', '678901-2', 6, 'Fernanda Santos', 6, '1988-03-10', '678.901.234-55'),
('robertoalves@gmail.com', '1176543210', 'pixroberto2024', '4455', 'Banrisul', '789012-3', 2, 'Roberto Alves', 7, '1995-01-25', '789.012.345-66'),
('patriciasouza@terra.com.br', '1165432109', 'pixpatricia2024', '5566', 'Sicredi', '890123-4', 3, 'Patrícia Souza', 8, '1982-06-17', '890.123.456-77'),
('lucasmartins@gmail.com', '1154321098', 'pixlucas2024', '6677', 'Banco do Nordeste', '901234-5', 4, 'Lucas Martins', 9, '1979-09-07', '901.234.567-88'),
('julianasilva@yahoo.com.br', '1143210987', 'pixjuliana2024', '7788', 'Banco da Amazônia', '012345-6', 1, 'Juliana Silva', 10, '1996-04-14', '012.345.678-99');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`id_aluguel`),
  ADD KEY `id_inquilino` (`id_inquilino`),
  ADD KEY `id_imovel` (`id_imovel`),
  ADD KEY `id_corretor` (`id_corretor`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`id_corretor`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_imovel` (`id_imovel`);

--
-- Índices para tabela `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`id_fiador`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id_imovel`),
  ADD KEY `id_prop` (`id_prop`);

--
-- Índices para tabela `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`id_inquilino`),
  ADD KEY `id_fiador` (`id_fiador`);

--
-- Índices para tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`id_midia`),
  ADD KEY `id_imovel` (`id_imovel`);

--
-- Índices para tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id_prop`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`id_inquilino`) REFERENCES `inquilino` (`id_inquilino`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`),
  ADD CONSTRAINT `aluguel_ibfk_3` FOREIGN KEY (`id_corretor`) REFERENCES `corretor` (`id_corretor`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`id_prop`) REFERENCES `proprietario` (`id_prop`);

--
-- Limitadores para a tabela `inquilino`
--
ALTER TABLE `inquilino`
  ADD CONSTRAINT `inquilino_ibfk_1` FOREIGN KEY (`id_fiador`) REFERENCES `fiador` (`id_fiador`);

--
-- Limitadores para a tabela `midias`
--
ALTER TABLE `midias`
  ADD CONSTRAINT `midias_ibfk_1` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id_imovel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
