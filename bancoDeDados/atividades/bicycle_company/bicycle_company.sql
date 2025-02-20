-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: bicycle_company
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `street` tinytext DEFAULT NULL,
  `city` tinytext DEFAULT NULL,
  `state` tinytext DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `domestic_Customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,2,'1234 Elm St','Los Angeles','California','90001'),(2,3,'5678 Oak Ave','New York','New York','10001');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike`
--

DROP TABLE IF EXISTS `bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `cycle` enum('2','4') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `bike_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike`
--

LOCK TABLES `bike` WRITE;
/*!40000 ALTER TABLE `bike` DISABLE KEYS */;
INSERT INTO `bike` VALUES (1,1,'red','2'),(2,2,'blue','2'),(3,2,'orange','2'),(4,1,'yellow','4'),(5,3,'red','4');
/*!40000 ALTER TABLE `bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type` enum('foreign','domestic') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'foreign'),(2,'domestic'),(3,'domestic'),(4,'foreign'),(5,'foreign');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domestic_Customers`
--

DROP TABLE IF EXISTS `domestic_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domestic_Customers` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `domestic_Customers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domestic_Customers`
--

LOCK TABLES `domestic_Customers` WRITE;
/*!40000 ALTER TABLE `domestic_Customers` DISABLE KEYS */;
INSERT INTO `domestic_Customers` VALUES (2,'cassiano'),(3,'pedro');
/*!40000 ALTER TABLE `domestic_Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foreign_Customers`
--

DROP TABLE IF EXISTS `foreign_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foreign_Customers` (
  `id` int(11) NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `city` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `foreign_Customers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foreign_Customers`
--

LOCK TABLES `foreign_Customers` WRITE;
/*!40000 ALTER TABLE `foreign_Customers` DISABLE KEYS */;
INSERT INTO `foreign_Customers` VALUES (1,'dolar','bike_store','alabama','united state','99661'),(4,'dolar','bike_store','kansas','united_state','66423'),(5,'dolar','bike_store','georgia','united_state','30116');
/*!40000 ALTER TABLE `foreign_Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain_bike`
--

DROP TABLE IF EXISTS `mountain_bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mountain_bike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `cycling_team` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `mountain_bike_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain_bike`
--

LOCK TABLES `mountain_bike` WRITE;
/*!40000 ALTER TABLE `mountain_bike` DISABLE KEYS */;
INSERT INTO `mountain_bike` VALUES (1,4,'Team Red Bull Racing'),(2,4,'Team Trek-Segafredo'),(3,2,'Team Cannondale Factory Racing'),(4,1,'Team Specialized Racing');
/*!40000 ALTER TABLE `mountain_bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) DEFAULT NULL,
  `type` enum('bike','mountain_bike','both') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Speedster 3000','bike',299.99),(2,'Mountain X Pro','mountain_bike',499.99),(3,'All Terrain Beast','both',399.50),(4,'City Cruiser 200','bike',199.99),(5,'Trail Blazer XT','mountain_bike',349.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `request_type` enum('order','inquiry','return','exchange','repair','quote') NOT NULL,
  `request_content` text DEFAULT NULL,
  `product_type` enum('bike','mountain_bike','both') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,1,'order','Customer wants to buy a Speedster 3000 bike.','bike'),(2,2,2,'inquiry','Customer is inquiring about the Mountain X Pro mountain bike.','mountain_bike'),(3,3,3,'return','Customer wants to return the All Terrain Beast bike.','both'),(4,4,4,'exchange','Customer wants to exchange the City Cruiser 200 bike for another model.','bike'),(5,5,5,'repair','Customer needs a repair for the Trail Blazer XT mountain bike.','mountain_bike');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bicycle_company'
--

--
-- Dumping routines for database 'bicycle_company'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 15:26:26
