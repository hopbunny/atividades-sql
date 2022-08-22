-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: corridas
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
-- Table structure for table `bairros`
--

DROP TABLE IF EXISTS `bairros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairros` (
  `CODIGO` smallint(6) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairros`
--

LOCK TABLES `bairros` WRITE;
/*!40000 ALTER TABLE `bairros` DISABLE KEYS */;
INSERT INTO `bairros` VALUES (666,'CENTRO');
/*!40000 ALTER TABLE `bairros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carros`
--

DROP TABLE IF EXISTS `carros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carros` (
  `PLACA` char(7) NOT NULL,
  `ANO` decimal(4,0) DEFAULT NULL,
  `MODELO` char(10) DEFAULT NULL,
  `CAPACIDADE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`PLACA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros`
--

LOCK TABLES `carros` WRITE;
/*!40000 ALTER TABLE `carros` DISABLE KEYS */;
INSERT INTO `carros` VALUES ('123456A',1998,'CELTA',3);
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corridas`
--

DROP TABLE IF EXISTS `corridas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corridas` (
  `CORRIDA` int(11) NOT NULL,
  `CARRO` char(7) NOT NULL,
  `CNH` char(10) NOT NULL,
  `RUA_ORIGEM` int(11) NOT NULL,
  `BAIRRO_ORIGEM` smallint(6) NOT NULL,
  `RUA_DESTINO` int(11) DEFAULT NULL,
  `BAIRRO_DESTINO` smallint(6) DEFAULT NULL,
  `PASSAGEIRO` varchar(15) DEFAULT NULL,
  `VALOR` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`CORRIDA`),
  KEY `CODIGO_CARRO` (`CARRO`),
  KEY `CODIGO_CNH` (`CNH`),
  KEY `CODIGO_RUA` (`RUA_ORIGEM`),
  KEY `CODIGO_BAIRRO` (`BAIRRO_ORIGEM`),
  KEY `CODIGO_RUADESTINO` (`RUA_DESTINO`),
  KEY `CODIGO_BAIRRODESTINO` (`BAIRRO_DESTINO`),
  KEY `CODIGO_PASSAGEIRO` (`PASSAGEIRO`),
  CONSTRAINT `CODIGO_BAIRRO` FOREIGN KEY (`BAIRRO_ORIGEM`) REFERENCES `bairros` (`CODIGO`),
  CONSTRAINT `CODIGO_BAIRRODESTINO` FOREIGN KEY (`BAIRRO_DESTINO`) REFERENCES `bairros` (`CODIGO`),
  CONSTRAINT `CODIGO_CARRO` FOREIGN KEY (`CARRO`) REFERENCES `carros` (`PLACA`),
  CONSTRAINT `CODIGO_CNH` FOREIGN KEY (`CNH`) REFERENCES `motoristas` (`CNH`),
  CONSTRAINT `CODIGO_PASSAGEIRO` FOREIGN KEY (`PASSAGEIRO`) REFERENCES `passageiros` (`NOME`),
  CONSTRAINT `CODIGO_RUA` FOREIGN KEY (`RUA_ORIGEM`) REFERENCES `logradouros` (`CODIGO`),
  CONSTRAINT `CODIGO_RUADESTINO` FOREIGN KEY (`RUA_DESTINO`) REFERENCES `logradouros` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corridas`
--

LOCK TABLES `corridas` WRITE;
/*!40000 ALTER TABLE `corridas` DISABLE KEYS */;
INSERT INTO `corridas` VALUES (11,'123456A','B',666,666,666,666,'JOSÉ',10.80);
/*!40000 ALTER TABLE `corridas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logradouros`
--

DROP TABLE IF EXISTS `logradouros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logradouros` (
  `CODIGO` int(11) NOT NULL,
  `NOME` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouros`
--

LOCK TABLES `logradouros` WRITE;
/*!40000 ALTER TABLE `logradouros` DISABLE KEYS */;
INSERT INTO `logradouros` VALUES (666,'CENTRO');
/*!40000 ALTER TABLE `logradouros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoristas`
--

DROP TABLE IF EXISTS `motoristas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motoristas` (
  `CNH` char(10) NOT NULL,
  `NOME` char(30) NOT NULL,
  `NASCIMENTO` date DEFAULT NULL,
  PRIMARY KEY (`CNH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoristas`
--

LOCK TABLES `motoristas` WRITE;
/*!40000 ALTER TABLE `motoristas` DISABLE KEYS */;
INSERT INTO `motoristas` VALUES ('B','PEDRIN','1988-06-14');
/*!40000 ALTER TABLE `motoristas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passageiros`
--

DROP TABLE IF EXISTS `passageiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passageiros` (
  `NOME` varchar(40) NOT NULL,
  `TELEFONE` varchar(15) NOT NULL,
  PRIMARY KEY (`NOME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passageiros`
--

LOCK TABLES `passageiros` WRITE;
/*!40000 ALTER TABLE `passageiros` DISABLE KEYS */;
INSERT INTO `passageiros` VALUES ('JOSÉ','99999999');
/*!40000 ALTER TABLE `passageiros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06  9:35:47
