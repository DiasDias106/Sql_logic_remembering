-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Nov-2024 às 17:48
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empregados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `empregado`
--

CREATE TABLE `empregado` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `funcao` enum('Presidente','Diretor','Analista','Vendedor','Escriturario') NOT NULL,
  `idchefe` int(11) DEFAULT NULL,
  `datacontrato` date NOT NULL,
  `salario` double NOT NULL,
  `comissao` double DEFAULT NULL,
  `iddepart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `empregado`
--

INSERT INTO `empregado` (`id`, `nome`, `funcao`, `idchefe`, `datacontrato`, `salario`, `comissao`, `iddepart`) VALUES
(7566, 'Joao', 'Diretor', 7839, '1981-12-03', 2975, NULL, 20),
(7736, 'Joao', 'Escriturario', 7839, '1981-12-03', 10275, 300, 20),
(7766, 'Joao', 'Vendedor', 7839, '1981-12-03', 2975, 0, 20),
(7782, 'Carlos', 'Diretor', 7839, '1981-12-03', 2450, NULL, 10),
(7839, 'Frederico', 'Presidente', NULL, '1981-12-03', 5000, NULL, 10),
(7966, 'Alex', 'Analista', 7839, '1981-12-03', 2975, 1510, 30);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
