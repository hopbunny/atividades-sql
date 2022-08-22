-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: trabalho_leilao
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comprador`
--

DROP TABLE IF EXISTS `comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador` (
  `ID_COMPRADOR` int(11) NOT NULL,
  `ENDEREÇO_ENTREGA` varchar(150) DEFAULT NULL,
  `ID_MEMBRO` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMPRADOR`),
  KEY `ID_MEMBRO_FK` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador`
--

LOCK TABLES `comprador` WRITE;
/*!40000 ALTER TABLE `comprador` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gera`
--

DROP TABLE IF EXISTS `gera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gera` (
  `NUMERO` int(11) NOT NULL,
  `ID_VENDEDOR` int(11) NOT NULL,
  `ID_COMPRADOR` int(11) NOT NULL,
  KEY `NUMERO_FK` (`NUMERO`),
  KEY `ID_VENDEDOR_FK` (`ID_VENDEDOR`),
  KEY `ID_COMPRADOR_FK` (`ID_COMPRADOR`),
  CONSTRAINT `ID_COMPRADOR_FK` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `comprador` (`ID_COMPRADOR`),
  CONSTRAINT `ID_VENDEDOR_FK` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`),
  CONSTRAINT `NUMERO_FK` FOREIGN KEY (`NUMERO`) REFERENCES `nota_fiscal` (`NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gera`
--

LOCK TABLES `gera` WRITE;
/*!40000 ALTER TABLE `gera` DISABLE KEYS */;
/*!40000 ALTER TABLE `gera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens` (
  `ID_NUMERO` int(11) NOT NULL,
  `PRECO_INICIAL` float NOT NULL,
  `INCREMENTO_LANCE` float NOT NULL,
  `DATA_INICIAL` datetime NOT NULL,
  `DATA_FINAL` datetime NOT NULL,
  `DESCRICAO` varchar(200) DEFAULT NULL,
  `CLASSIFICACAO` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lance`
--

DROP TABLE IF EXISTS `lance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lance` (
  `PRECO` float NOT NULL,
  `HORA` time NOT NULL,
  `ID_NUMERO` int(11) NOT NULL,
  `ID_COMPRADOR` int(11) NOT NULL,
  KEY `ID_NUMERO_FK` (`ID_NUMERO`),
  KEY `ID_COMPRADOR_FK2` (`ID_COMPRADOR`),
  CONSTRAINT `ID_COMPRADOR_FK2` FOREIGN KEY (`ID_COMPRADOR`) REFERENCES `comprador` (`ID_COMPRADOR`),
  CONSTRAINT `ID_NUMERO_FK` FOREIGN KEY (`ID_NUMERO`) REFERENCES `itens` (`ID_NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lance`
--

LOCK TABLES `lance` WRITE;
/*!40000 ALTER TABLE `lance` DISABLE KEYS */;
/*!40000 ALTER TABLE `lance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro`
--

DROP TABLE IF EXISTS `membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membro` (
  `ID_MEMBRO` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SENHA` varchar(50) NOT NULL,
  `TELEFONE` varchar(12) NOT NULL,
  `ENDEREÇO` varchar(150) NOT NULL,
  PRIMARY KEY (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro`
--

LOCK TABLES `membro` WRITE;
/*!40000 ALTER TABLE `membro` DISABLE KEYS */;
/*!40000 ALTER TABLE `membro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_fiscal` (
  `NUMERO` int(11) NOT NULL,
  `PONTUACAO` int(11) NOT NULL,
  `COMENTARIO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `ID_NUMERO` int(11) NOT NULL,
  `ID_VENDEDOR` int(11) NOT NULL,
  KEY `ID_NUMERO_FK2` (`ID_NUMERO`),
  KEY `ID_VENDEDOR_FK2` (`ID_VENDEDOR`),
  CONSTRAINT `ID_NUMERO_FK2` FOREIGN KEY (`ID_NUMERO`) REFERENCES `itens` (`ID_NUMERO`),
  CONSTRAINT `ID_VENDEDOR_FK2` FOREIGN KEY (`ID_VENDEDOR`) REFERENCES `vendedor` (`ID_VENDEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `ID_VENDEDOR` int(11) NOT NULL,
  `ENCAMINHAMENTO` int(11) NOT NULL,
  `CONTA_BANCARIA` varchar(30) NOT NULL,
  `ID_MEMBRO` int(11) NOT NULL,
  PRIMARY KEY (`ID_VENDEDOR`),
  KEY `ID_MEMBRO_FK2` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK2` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23  8:50:18
