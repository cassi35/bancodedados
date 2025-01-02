-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: seguro_carro_hospital_universidade
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Exame`
--

DROP TABLE IF EXISTS `Exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exame` (
  `exame_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`exame_id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `Exame_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `Paciente` (`paciente_id`),
  CONSTRAINT `Exame_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `Medico` (`medico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exame`
--

LOCK TABLES `Exame` WRITE;
/*!40000 ALTER TABLE `Exame` DISABLE KEYS */;
INSERT INTO `Exame` VALUES (1,'2023-04-01','Eletrocardiograma',1,1),(2,'2023-05-05','Exame de pele',2,2),(3,'2023-06-10','Raio-X',3,3);
/*!40000 ALTER TABLE `Exame` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 20:15:18
