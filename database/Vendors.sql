-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.31

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
  `addressId` varchar(36) NOT NULL,
  `employee_id` varchar(36) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `postal` varchar(10) DEFAULT NULL,
  `province` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `addresses_employee_id_index` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES ('1a918660-76a8-5a3f-b625-1a22c86bc249','1a918660-76a8-5a3f-b625-1a22c86bc249','Ojuv Place','M7E 4F7','AB','Joseseva',57.422030,-65.187740),('405e2d8a-1f19-5b4c-9775-263ca81b5269','405e2d8a-1f19-5b4c-9775-263ca81b5269','Bocbih Key','C6F 0B0','NB','Gownibi',105.395690,-54.108560);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeId` varchar(36) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  `birthday` date NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `phone` varchar(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`employeeId`),
  UNIQUE KEY `employees_employeeid_unique` (`employeeId`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('1a918660-76a8-5a3f-b625-1a22c86bc249','Maud','Moreno','male','mome@company.com',45,'1978-05-04',0,'(341) 309-1668','2024-10-03 11:37:23','2024-10-03 11:37:23'),('405e2d8a-1f19-5b4c-9775-263ca81b5269','Jim','Gordon','male','le@company.com',48,'1953-10-20',1,'(542) 489-5059','2024-10-03 11:37:23','2024-10-03 11:37:23');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `eventId` varchar(36) NOT NULL,
  `vendorId` varchar(36) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `eventType` varchar(20) DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `timeStamp` time DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('event1','Vodacom','(341) 309-1668','call','2022-01-01','10:00:00'),('event2','MTN','(542) 489-5059','call','2022-01-02','11:00:00'),('event3','Cell C','(474) 926-3520','call','2022-01-03','12:00:00'),('event4','Vodacom','(341) 309-1668','sms','2022-01-04','13:00:00'),('event5','MTN','(542) 489-5059','sms','2022-01-05','14:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `packageId` varchar(36) NOT NULL,
  `employeeId` varchar(36) NOT NULL,
  `vendorId` varchar(36) NOT NULL,
  `package_name` varchar(50) NOT NULL,
  `package_cost` decimal(10,2) NOT NULL,
  `contractStart` date NOT NULL,
  `contractEnd` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`packageId`),
  UNIQUE KEY `packages_vendorid_unique` (`vendorId`),
  UNIQUE KEY `packages_package_name_unique` (`package_name`),
  KEY `packages_employeeid_foreign` (`employeeId`),
  CONSTRAINT `packages_employeeid_foreign` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES ('1a918660-76a8-5a3f-b625-bggtt','405e2d8a-1f19-5b4c-9775-263ca81b5269','MTN','pack2',2492.85,'1997-01-21','1995-12-07','2024-10-03 11:45:17','2024-10-03 11:45:17'),('1a918660-76a8-5a3f-b625-rrbg','1a918660-76a8-5a3f-b625-1a22c86bc249','Vodacom','pack1',5307.39,'1946-02-09','2037-03-08','2024-10-03 11:45:17','2024-10-03 11:45:17');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendorId` varchar(36) NOT NULL,
  `vendorName` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES ('Cell C','Cell C','2024-10-03 11:36:49','2024-10-03 11:36:49'),('MTN','MTN','2024-10-03 11:36:49','2024-10-03 11:36:49'),('Vodacom','Vodacom','2024-10-03 11:36:49','2024-10-03 11:36:49');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-03 11:49:48
