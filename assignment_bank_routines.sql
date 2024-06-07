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
-- Dumping routines for database 'assignment_bank'
--
/*!50003 DROP PROCEDURE IF EXISTS `OPEN_ACCOUNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OPEN_ACCOUNT`(a_type int, balance int, c_id int,branch_id int)
BEGIN
	IF 10 > (select count(ID) from account where Client_ID = c_id)
	THEN
	INSERT INTO account(account_type_id,Balance_account,Client_ID,Status,Created_at,Branch_ID)values(a_type,balance,c_id,'Active',now(),branch_id);
	ELSE
    SELECT
    ROW_NUMBER() OVER (ORDER BY ID) AS 'Number',
    CONCAT('You have already 10 accounts ', 
           ROW_NUMBER() OVER (ORDER BY ID), '  account: ') 
            'Notice ( You can not open more than 10 Accounts !)', ID as Account_ID,Client_ID ,  account_type_id  FROM account where Client_ID = c_id;
    
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer`(Amount int,Source_ID int,Destination_ID int, t_type int )
BEGIN
    -- Calculate the total amount including transaction fee
     Declare Amount_fees int;
     SET Amount_fees =  (SELECT Transaction_fee FROM transaction_type WHERE ID = t_type);
     IF Amount_fees + Amount <= (Select Balance_account from account where ID =Source_ID) AND t_type= 4
    THEN
        UPDATE account SET Balance_account = Balance_account - Amount_fees-Amount WHERE ID = Source_ID;
        UPDATE account SET Balance_account = Balance_account + Amount WHERE ID = Destination_ID;
	elseif Amount_fees + Amount <= (Select Balance_account from account where ID =Source_ID) AND t_type= 3
    then 
        UPDATE account SET Balance_account = Balance_account + Amount-Amount_fees WHERE ID = Source_ID;
    elseif Amount_fees + Amount <= (Select Balance_account from account where ID =Source_ID) AND t_type= 1
    then
         UPDATE account SET Balance_account = Balance_account - Amount_fees-Amount WHERE ID = Source_ID;
	elseif t_type = 5
    then 
      set  Amount_fees = (Select Balance_account from account where ID =Source_ID);
	elseif Amount_fees + Amount > (Select Balance_account from account where ID =Source_ID)
	then 
       select "You have not sufficient balance!";
	END IF;
    IF t_type =  3
    then
       insert into transactions( Date_issued,Amount_Transactions,Deposit,Destination_Account_ID,Source_Account_ID,Transactions_type_ID,Withdraw,Transfer) values(now(),Amount,Amount-Amount_fees,NULL,Source_ID,t_type,0,0);
	ELSEIF t_type =  1
    then
       insert into transactions( Date_issued,Amount_Transactions,Withdraw,Destination_Account_ID,Source_Account_ID,Transactions_type_ID,Deposit,Transfer) values(now(),Amount,Amount-Amount_fees,NULL,Source_ID,t_type,0,0);
    ELSEIF t_type =  4
    then
       insert into transactions( Date_issued,Amount_Transactions,Deposit,Destination_Account_ID,Source_Account_ID,Transactions_type_ID,Withdraw,Transfer) values(now(),Amount,0,Destination_ID,Source_ID,t_type,0,Amount);
    ELSEIF t_type =  5
    then
       insert into transactions( Date_issued,Amount_Transactions,Withdraw,Destination_Account_ID,Source_Account_ID,Transactions_type_ID,Deposit,Transfer,Total_Balance) values(now(),0,0,NULL,Source_ID,t_type,0,0,Amount);

 END IF;
 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-28 15:38:00
