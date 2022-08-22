-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: trabalho_beisebol
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
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbitro` (
  `ID_MEMBRO` int(11) NOT NULL,
  KEY `ID_MEMBRO_FK` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dirigente`
--

DROP TABLE IF EXISTS `dirigente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirigente` (
  `ID_MEMBRO` int(11) NOT NULL,
  KEY `ID_MEMBRO_FK3` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK3` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirigente`
--

LOCK TABLES `dirigente` WRITE;
/*!40000 ALTER TABLE `dirigente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dirigente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `ID_EQUIPE` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `LIGA` varchar(50) NOT NULL,
  `CIDADE` varchar(20) NOT NULL,
  `DIVISAO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_EQUIPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogadores` (
  `ID_MEMBRO` int(11) NOT NULL,
  KEY `ID_MEMBRO_FK4` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK4` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogo` (
  `ID_JOGO` int(11) NOT NULL,
  `DATA_JOGO` date NOT NULL,
  `PONTUACAO` float NOT NULL,
  `VENCEDOR` varchar(20) NOT NULL,
  `PERDEDOR` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_JOGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancadores`
--

DROP TABLE IF EXISTS `lancadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lancadores` (
  `MCG` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancadores`
--

LOCK TABLES `lancadores` WRITE;
/*!40000 ALTER TABLE `lancadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `lancadores` ENABLE KEYS */;
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
  `SOBRENOME` varchar(100) DEFAULT NULL,
  `DATA_NASC` date NOT NULL,
  `LOCAL_NASC` varchar(40) NOT NULL,
  `ID_EQUIPE` int(11) NOT NULL,
  PRIMARY KEY (`ID_MEMBRO`),
  KEY `ID_EQUIPE_FK2` (`ID_EQUIPE`),
  CONSTRAINT `ID_EQUIPE_FK2` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`)
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
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `ID_MEMBRO` int(11) NOT NULL,
  KEY `ID_MEMBRO_FK2` (`ID_MEMBRO`),
  CONSTRAINT `ID_MEMBRO_FK2` FOREIGN KEY (`ID_MEMBRO`) REFERENCES `membro` (`ID_MEMBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tem`
--

DROP TABLE IF EXISTS `tem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tem` (
  `EQUIPE_VENCEDOR` varchar(20) NOT NULL,
  `EQUIPE_PERDEDORA` varchar(20) NOT NULL,
  `ID_EQUIPE` int(11) NOT NULL,
  `ID_JOGO` int(11) NOT NULL,
  KEY `ID_EQUIPE_FK` (`ID_EQUIPE`),
  KEY `ID_JOGO_FK` (`ID_JOGO`),
  CONSTRAINT `ID_EQUIPE_FK` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`),
  CONSTRAINT `ID_JOGO_FK` FOREIGN KEY (`ID_JOGO`) REFERENCES `jogo` (`ID_JOGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tem`
--

LOCK TABLES `tem` WRITE;
/*!40000 ALTER TABLE `tem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23  8:49:37
