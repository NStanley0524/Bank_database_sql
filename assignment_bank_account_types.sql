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
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_types` (
  `ID` int NOT NULL,
  `Description_Type` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'Savings Account: A basic account for storing money and earning interest. It\'s suitable for individuals looking to save money over time.'),(2,'Student Account: Geared towards students, these accounts often have reduced fees and are designed to help students manage their finances during their educational years.'),(3,'Online Banking Account: These accounts are primarily accessed online, offering the convenience of managing finances through digital channels.'),(4,'Health Savings Account (HSA): A tax-advantaged account used in conjunction with a high-deductible health insurance plan to save for medical expenses.'),(5,'Business Account: Tailored for businesses, this type of account offers features like business check writing, merchant services, and various business-specific tools.'),(6,'Certificate of Deposit (CD): A time-bound savings account with a fixed interest rate and maturity date. Funds are locked for a specified period, and withdrawing before maturity may result in penalties.'),(7,'Money Market Account: Similar to a savings account but often offers higher interest rates. It may require a higher minimum balance and provides limited check-writing privileges.'),(8,'Checking Account: Also known as a current account, this is used for everyday transactions. It provides features like writing checks, making debit card transactions, and online bill payments.'),(9,'Trust Account: Managed by a trustee for the benefit of a beneficiary. These are often used for estate planning or managing assets for someone who can\'t do so themselves.'),(10,'Custodial Account: Managed by an adult on behalf of a minor or someone who is unable to manage their finances.');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
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
