-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Fev-2021 às 20:22
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_tarefa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcoes`
--

CREATE TABLE `tb_funcoes` (
  `fnc_cod` int(11) NOT NULL,
  `fnc_nome` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grupo`
--

CREATE TABLE `tb_grupo` (
  `grp_cod` int(11) NOT NULL,
  `grp_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_log`
--

CREATE TABLE `tb_log` (
  `log_cod` int(11) NOT NULL,
  `log_descricao` varchar(100) DEFAULT NULL,
  `log_dta_registro` datetime NOT NULL,
  `log_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tarefas`
--

CREATE TABLE `tb_tarefas` (
  `tar_cod` int(11) NOT NULL,
  `tar_titulo` varchar(50) NOT NULL,
  `tar_dta_criacao` datetime NOT NULL,
  `tar_dta_inicio` datetime NOT NULL,
  `tar_dta_termino` datetime NOT NULL,
  `tar_status` varchar(32) NOT NULL,
  `tar_descricao` varchar(100) NOT NULL,
  `tar_grupo` int(11) DEFAULT NULL,
  `tar_usuario_responsavel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `usu_cod` int(11) NOT NULL,
  `usu_nome` varchar(100) NOT NULL,
  `usu_cpf` varchar(32) NOT NULL,
  `usu_senha` varchar(32) NOT NULL,
  `usu_funcao_principal` int(11) DEFAULT NULL,
  `usu_funcao_secundaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  ADD PRIMARY KEY (`fnc_cod`);

--
-- Índices para tabela `tb_grupo`
--
ALTER TABLE `tb_grupo`
  ADD PRIMARY KEY (`grp_cod`);

--
-- Índices para tabela `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`log_cod`),
  ADD KEY `FK_log_usuario` (`log_usuario`);

--
-- Índices para tabela `tb_tarefas`
--
ALTER TABLE `tb_tarefas`
  ADD PRIMARY KEY (`tar_cod`),
  ADD KEY `FK_tar_grupo` (`tar_grupo`),
  ADD KEY `FK_tar_usuario_responsavel` (`tar_usuario_responsavel`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`usu_cod`),
  ADD UNIQUE KEY `usu_cpf` (`usu_cpf`),
  ADD KEY `FK_usu_funcao_principal` (`usu_funcao_principal`),
  ADD KEY `FK_usu_funcao_secundaria` (`usu_funcao_secundaria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  MODIFY `fnc_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_grupo`
--
ALTER TABLE `tb_grupo`
  MODIFY `grp_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `log_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tarefas`
--
ALTER TABLE `tb_tarefas`
  MODIFY `tar_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `usu_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_log`
--
ALTER TABLE `tb_log`
  ADD CONSTRAINT `FK_log_usuario` FOREIGN KEY (`log_usuario`) REFERENCES `tb_usuario` (`usu_cod`);

--
-- Limitadores para a tabela `tb_tarefas`
--
ALTER TABLE `tb_tarefas`
  ADD CONSTRAINT `FK_tar_grupo` FOREIGN KEY (`tar_grupo`) REFERENCES `tb_grupo` (`grp_cod`),
  ADD CONSTRAINT `FK_tar_usuario_responsavel` FOREIGN KEY (`tar_usuario_responsavel`) REFERENCES `tb_usuario` (`usu_cod`);

--
-- Limitadores para a tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `FK_usu_funcao_principal` FOREIGN KEY (`usu_funcao_principal`) REFERENCES `tb_funcoes` (`fnc_cod`),
  ADD CONSTRAINT `FK_usu_funcao_secundaria` FOREIGN KEY (`usu_funcao_secundaria`) REFERENCES `tb_funcoes` (`fnc_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
