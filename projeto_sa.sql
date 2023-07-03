-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 01-Jul-2023 às 16:53
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
-- Banco de dados: `projeto_sa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `boleto`
--

CREATE TABLE `boleto` (
  `id_boleto` int(11) NOT NULL,
  `data_emissao_boleto` datetime NOT NULL,
  `numero_boleto` varchar(48) NOT NULL,
  `valor_boleto` float NOT NULL,
  `boleto_pago` tinyint(4) NOT NULL,
  `data_pagamento_boleto` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carinho`
--

CREATE TABLE `carinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `id_cartao` int(11) NOT NULL,
  `numero_cartao` char(4) NOT NULL,
  `nome_cartao` varchar(45) NOT NULL,
  `data_validade` date NOT NULL,
  `id_cartao_bandeira` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao_bandeira`
--

CREATE TABLE `cartao_bandeira` (
  `id_cartao_bandeira` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `bandeira` varchar(20) NOT NULL,
  `id_cartao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numeroresidencial` int(11) NOT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL,
  `id_entrega_status` int(11) NOT NULL,
  `data_entrega_inicio` datetime NOT NULL,
  `valor_frete` float NOT NULL,
  `codigo_rastreio` varchar(15) DEFAULT NULL,
  `id_endereco` int(11) NOT NULL,
  `id_transportadora` int(11) NOT NULL,
  `id_telefone` int(11) NOT NULL,
  `data_entrega_previsao` datetime NOT NULL,
  `entrega_concluida` tinyint(4) NOT NULL,
  `data_entrega_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `id_itenspedido` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_fiscal`
--

CREATE TABLE `nota_fiscal` (
  `id_nota_fiscal` int(11) NOT NULL,
  `data_emissao_nota` datetime NOT NULL,
  `numero_nota` int(11) NOT NULL,
  `valor_nota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_pagamento_tipo` int(11) NOT NULL,
  `parcelado` tinyint(4) DEFAULT NULL,
  `quantidade_parcelas` int(11) DEFAULT NULL,
  `id_boleto` int(11) DEFAULT NULL,
  `pagamento_confirmado` tinyint(4) NOT NULL,
  `data_pagamento_confirmado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `data` date NOT NULL,
  `total` int(11) NOT NULL,
  `form_pag` int(11) NOT NULL,
  `id_entrega` int(11) DEFAULT NULL,
  `id_nota_fiscal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_tem_produto`
--

CREATE TABLE `pedido_tem_produto` (
  `id_produto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `desconto` tinyint(4) NOT NULL,
  `valor_desconto` float DEFAULT NULL,
  `id_pedido_tem_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` int(11) NOT NULL,
  `rota` varchar(100) NOT NULL,
  `id_produto_subcategoria` int(11) NOT NULL,
  `id_produto_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `id_produto_categoria` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao_categoria` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `cpf` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `data_nascimento` int(11) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `nome`, `sobrenome`, `cpf`, `email`, `senha`, `data_nascimento`, `sexo`, `id_endereco`, `id_estado`) VALUES
(123, 'leticia', 'oliveira', 138441879, 'hora@gmail.com', '123456', 13012006, 'f', 89237345, 6446);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`id_boleto`),
  ADD UNIQUE KEY `numero_boleto` (`numero_boleto`);

--
-- Índices para tabela `carinho`
--
ALTER TABLE `carinho`
  ADD PRIMARY KEY (`id_carrinho`);

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`id_cartao`),
  ADD UNIQUE KEY `numero_cartao` (`numero_cartao`);

--
-- Índices para tabela `cartao_bandeira`
--
ALTER TABLE `cartao_bandeira`
  ADD KEY `fk_cartao` (`id_cartao`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_estado` (`id_estado`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Índices para tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`id_itenspedido`);

--
-- Índices para tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD PRIMARY KEY (`id_nota_fiscal`),
  ADD UNIQUE KEY `numero_nota` (`numero_nota`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_entrega` (`id_entrega`),
  ADD KEY `fk_nota_fiscal` (`id_nota_fiscal`);

--
-- Índices para tabela `pedido_tem_produto`
--
ALTER TABLE `pedido_tem_produto`
  ADD PRIMARY KEY (`id_pedido_tem_produto`),
  ADD KEY `fk_pedido` (`id_pedido`),
  ADD KEY `fk_produto` (`id_produto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_produto_categoria` (`id_produto_categoria`);

--
-- Índices para tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD PRIMARY KEY (`id_produto_categoria`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carinho`
--
ALTER TABLE `carinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `id_itenspedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cartao_bandeira`
--
ALTER TABLE `cartao_bandeira`
  ADD CONSTRAINT `fk_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `cartao` (`id_cartao`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_entrega` FOREIGN KEY (`id_entrega`) REFERENCES `entrega` (`id_entrega`),
  ADD CONSTRAINT `fk_nota_fiscal` FOREIGN KEY (`id_nota_fiscal`) REFERENCES `nota_fiscal` (`id_nota_fiscal`);

--
-- Limitadores para a tabela `pedido_tem_produto`
--
ALTER TABLE `pedido_tem_produto`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_produto_categoria`) REFERENCES `produto_categoria` (`id_produto_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
