CREATE DATABASE  IF NOT EXISTS `assignment_bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `assignment_bank`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment_bank
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Balance_account` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Deleted_at` datetime DEFAULT NULL,
  `Client_ID` int NOT NULL,
  `account_type_id` int NOT NULL,
  `Branch_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `account_client_fk_idx` (`Client_ID`),
  KEY `account_account_types_fk_idx` (`account_type_id`),
  KEY `account_branch_id_idx` (`Branch_ID`),
  CONSTRAINT `account_account_types_fk` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`ID`),
  CONSTRAINT `account_branch_id` FOREIGN KEY (`Branch_ID`) REFERENCES `branches` (`ID`),
  CONSTRAINT `account_client_fk` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,330,'Active','2023-08-15 09:30:00',NULL,1,1,1),(2,724,'Active','2023-07-01 10:30:00',NULL,1,2,3),(3,915,'Active','2023-07-05 14:15:00',NULL,2,1,5),(4,6463,'Active','2023-07-12 09:00:00',NULL,3,2,7),(5,3832,'Active','2023-07-18 16:45:00',NULL,4,3,9),(6,546,'Active','2023-07-22 12:20:00',NULL,3,4,10),(7,220,'Active','2023-07-27 11:10:00',NULL,6,5,2),(8,256,'Active','2023-08-02 15:30:00',NULL,5,2,4),(9,1340,'Active','2023-08-08 08:45:00',NULL,6,9,6),(10,545,'Active','2023-08-14 13:00:00',NULL,7,10,8),(11,444,'Active','2023-08-20 17:25:00',NULL,8,6,10),(12,345,'Active','2023-08-25 09:50:00',NULL,9,7,2),(13,6424,'Active','2023-09-01 14:15:00',NULL,10,8,1),(14,5419,'Active','2023-09-07 10:00:00',NULL,11,5,6),(15,7899,'Active','2023-09-14 16:30:00',NULL,12,4,7),(16,4567,'Active','2023-09-21 12:45:00',NULL,13,3,8),(17,1234,'Active','2023-09-28 15:20:00',NULL,14,2,9),(18,788,'Active','2023-10-03 11:05:00',NULL,3,1,10),(19,4555,'Active','2023-10-09 09:40:00',NULL,5,4,1),(20,5000,'Active','2023-10-15 14:55:00',NULL,6,5,5),(21,2000,'Active','2023-10-22 10:25:00',NULL,2,6,7),(22,344,'Active','2023-07-10 09:15:00',NULL,3,7,9),(23,888,'Active','2023-07-18 14:30:00',NULL,6,8,1),(24,945,'Active','2023-07-23 11:45:00',NULL,1,1,2),(25,926,'Active','2023-07-28 16:20:00',NULL,3,2,4),(26,781,'Active','2023-08-02 10:30:00',NULL,5,3,5),(27,357,'Active','2023-08-09 15:45:00',NULL,7,4,8),(28,9999,'Active','2023-08-16 12:00:00',NULL,8,1,10),(29,4567,'Active','2023-08-24 17:15:00',NULL,9,5,5),(30,100,'Active','2023-08-29 09:30:00',NULL,1,9,8),(31,2000,'Active','2023-08-30 14:05:53',NULL,4,1,9),(32,70,'Active','2023-08-30 14:06:24',NULL,1,7,1),(33,20,'Active','2023-08-30 14:06:51',NULL,1,6,2),(34,80,'Active','2023-08-30 14:06:59',NULL,1,3,3),(35,880,'Active','2023-08-30 14:07:07',NULL,1,4,4),(36,880,'Active','2023-08-30 14:07:18',NULL,1,8,5),(37,880,'Active','2023-08-30 14:07:24',NULL,1,1,6),(38,80,'Active','2023-08-30 14:15:55',NULL,4,10,7),(39,820,'Active','2023-08-30 14:16:04',NULL,6,10,8),(40,620,'Active','2023-08-30 14:16:18',NULL,2,3,9),(41,440,'Active','2023-08-30 14:16:32',NULL,9,1,10),(42,40,'Active','2023-08-30 14:17:15',NULL,14,1,4),(43,200,'Active','2023-08-31 23:22:31',NULL,2,3,2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-28 15:38:00
