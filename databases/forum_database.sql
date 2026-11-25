-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Nov-2024 às 16:19
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdforum`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `idMensagem` int(11) NOT NULL,
  `assunto` varchar(45) NOT NULL,
  `mensagem` text NOT NULL,
  `dataMensagem` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`idMensagem`, `assunto`, `mensagem`, `dataMensagem`) VALUES
(1, 'BD-DDL', 'Como criar uma tabela utilizadondo...', '2024-11-06 15:05:21'),
(2, 'DB-DML', 'como inserir dados numa tabela...', '2024-11-06 15:06:26'),
(3, 'BD-DML-SELECT', 'Como posso selecionar os 10 primeiros...', '2024-11-06 15:07:11'),
(4, 'MSG1', 'MSG1MSG1MSG1MSG1MSG1', '2024-11-06 15:12:53'),
(5, 'MSG2', 'MSG2MSG2MSG2MSG2MSG2', '2024-11-06 15:12:53'),
(6, 'MSG3', 'MSG3MSG3MSG3MSG3MSG3MSG3', '2024-11-06 15:12:53'),
(7, 'MSG4', 'MSG4MSG4MSG4MSG4MSG4MSG4', '2024-11-06 15:12:53');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadore`
--

CREATE TABLE `utilizadore` (
  `idutilizadores` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `login` varchar(16) NOT NULL,
  `password` varchar(256) NOT NULL,
  `perfil` enum('O','A','C','') NOT NULL DEFAULT 'O'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizadore`
--

INSERT INTO `utilizadore` (`idutilizadores`, `nome`, `login`, `password`, `perfil`) VALUES
(1, 'Ana', 'Ana', '123', 'A'),
(3, 'Pedro', 'Pedro', '123', 'O'),
(4, 'Maria', 'Maria', '123', 'O');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`idMensagem`);

--
-- Índices para tabela `utilizadore`
--
ALTER TABLE `utilizadore`
  ADD PRIMARY KEY (`idutilizadores`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `idMensagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `utilizadore`
--
ALTER TABLE `utilizadore`
  MODIFY `idutilizadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
