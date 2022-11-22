
use gerenciamento;

CREATE TABLE `telefone` (
  `cod_telefone` int NOT NULL,
  `numero` int NOT NULL,
  `DDD` int NOT NULL,
  `DDI` int NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `data_de_cadastro` date NOT NULL,
  PRIMARY KEY (`cod_telefone`));
  
  CREATE TABLE `pais` (
  `cod_pais` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `data_de_cadastro` date NOT NULL,
  `situacao` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_pais`));

CREATE TABLE `endereco` (
  `cod_endereco` int NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `cep` int NOT NULL,
  `data_de_cadastro` date NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `cod_pais` int NOT NULL,
  PRIMARY KEY (`cod_endereco`),
  KEY `cod_pais_idx` (`cod_pais`),
  CONSTRAINT `cod_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`));
  
  CREATE TABLE `fornecedor` (
  `cnpj` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(50) NOT NULL,
  `email` varchar(45) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `data_de_cadastro` date NOT NULL,
  `cod_telefone` int NOT NULL,
  `cod_endereco` int NOT NULL,
  PRIMARY KEY (`cnpj`),
  KEY `cod_endereco_idx` (`cod_endereco`),
  KEY `cod_telefone_idx` (`cod_telefone`),
  CONSTRAINT `cod_endereco` FOREIGN KEY (`cod_endereco`) REFERENCES `endereco` (`cod_endereco`),
  CONSTRAINT `cod_telefone` FOREIGN KEY (`cod_telefone`) REFERENCES `telefone` (`cod_telefone`));
  
  CREATE TABLE `materia_prima` (
  `cod_materia` int NOT NULL,
  `tipo_tecido` varchar(45) NOT NULL,
  `quantidade` int NOT NULL,
  `tamanho` double NOT NULL,
  `estampa` varchar(45) NOT NULL,
  `cnpj` int NOT NULL,
  PRIMARY KEY (`cod_materia`),
  KEY `cnpj_idx` (`cnpj`),
  CONSTRAINT `cnpj` FOREIGN KEY (`cnpj`) REFERENCES `fornecedor` (`cnpj`));
  
  CREATE TABLE `produto` (
  `codigo` int NOT NULL,
  `valor_custo` int NOT NULL,
  `valor_venda` int NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `tamanho` varchar(2) NOT NULL,
  `cod_materia` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cod_materia_idx` (`cod_materia`),
  CONSTRAINT `cod_materia` FOREIGN KEY (`cod_materia`) REFERENCES `materia_prima` (`cod_materia`));
  
  