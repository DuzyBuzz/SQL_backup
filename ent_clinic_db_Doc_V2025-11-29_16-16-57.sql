-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ent_clinic_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ent_clinic_db`
--

/*!40000 DROP DATABASE IF EXISTS `ent_clinic_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ent_clinic_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ent_clinic_db`;

--
-- Table structure for table `admitting_orders`
--

DROP TABLE IF EXISTS `admitting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitting_orders` (
  `admitting_order_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `diagnosis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chief_complaints` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vital_signs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `diet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `iv_fluids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `laboratory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `imaging` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nursing_instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `special_instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admitting_order_id`),
  KEY `fk_patient_id` (`patient_id`),
  CONSTRAINT `fk_admitting_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitting_orders`
--

LOCK TABLES `admitting_orders` WRITE;
/*!40000 ALTER TABLE `admitting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `admitting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `follow_up_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `follow_up_date` date NOT NULL,
  `note` text,
  PRIMARY KEY (`follow_up_id`),
  KEY `appointments_ibfk_1` (`patient_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `attachment_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_type` enum('Image','Video') NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `fk_attachments_consultation` (`consultation_id`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attachments_consultation` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autocomplete_entries`
--

DROP TABLE IF EXISTS `autocomplete_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autocomplete_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `column_name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1886 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autocomplete_entries`
--

LOCK TABLES `autocomplete_entries` WRITE;
/*!40000 ALTER TABLE `autocomplete_entries` DISABLE KEYS */;
INSERT INTO `autocomplete_entries` (`id`, `column_name`, `value`) VALUES (1884,'history','RECENT '),(1885,'history','SAD ');
/*!40000 ALTER TABLE `autocomplete_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_autocomplete_entries_no_duplicates` BEFORE INSERT ON `autocomplete_entries` FOR EACH ROW BEGIN
    -- Check for existing entry with same column_name and value (case-insensitive)
    IF EXISTS (
        SELECT 1
        FROM autocomplete_entries
        WHERE LOWER(column_name) = LOWER(NEW.column_name)
          AND LOWER(value) = LOWER(NEW.value)
        LIMIT 1
    ) THEN
        -- Prevent insert silently by setting NEW.id to NULL (auto_increment field)
        SET NEW.id = NULL;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `billing_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  `fee` decimal(10,2) DEFAULT '0.00',
  `procedure_amount` decimal(10,2) DEFAULT '0.00',
  `medcert_amount` decimal(10,2) DEFAULT '0.00',
  `subtotal_amount` decimal(10,2) DEFAULT '0.00',
  `discount_percent` int DEFAULT '0',
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `total_amount` decimal(10,2) DEFAULT '0.00',
  `amount_paid` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) DEFAULT '0.00',
  `note` text,
  `procedures` varchar(100) DEFAULT NULL,
  `discount_name` varchar(45) DEFAULT NULL,
  `payment_status` varchar(40) DEFAULT 'UNPAID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `consultation_id` (`consultation_id`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `billing_before_insert` BEFORE INSERT ON `billing` FOR EACH ROW BEGIN
    -- If total_amount is 0 or discount_percent is 100, mark as fully paid
    IF NEW.total_amount = 0.00 OR NEW.discount_percent = 100 THEN
        SET NEW.payment_status = 'FULLY PAID';
        SET NEW.balance = 0.00;
        SET NEW.amount_paid = NEW.total_amount;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `billing_payments`
--

DROP TABLE IF EXISTS `billing_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `change_due` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `billing_id` (`billing_id`),
  CONSTRAINT `billing_payments_ibfk_1` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_payments`
--

LOCK TABLES `billing_payments` WRITE;
/*!40000 ALTER TABLE `billing_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_billing_payment_delete` AFTER DELETE ON `billing_payments` FOR EACH ROW BEGIN
    DECLARE v_total_paid DECIMAL(10,2);
    DECLARE v_balance DECIMAL(10,2);

    -- 1. Recompute total paid AFTER the delete
    SELECT IFNULL(SUM(amount), 0)
    INTO v_total_paid
    FROM billing_payments
    WHERE billing_id = OLD.billing_id;

    -- 2. Update amount_paid
    UPDATE billing
    SET amount_paid = v_total_paid
    WHERE billing_id = OLD.billing_id;

    -- 3. Compute new balance
    SELECT total_amount - v_total_paid
    INTO v_balance
    FROM billing
    WHERE billing_id = OLD.billing_id;

    -- 4. Update balance
    UPDATE billing
    SET balance = v_balance
    WHERE billing_id = OLD.billing_id;

    -- 5. Update payment status
    UPDATE billing
    SET payment_status = 
        CASE
            WHEN v_total_paid = 0 THEN 'UNPAID'
            WHEN v_balance = 0 THEN 'FULLY PAID'
            ELSE 'PARTIALLY PAID'
        END
    WHERE billing_id = OLD.billing_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `billing_with_patient`
--

DROP TABLE IF EXISTS `billing_with_patient`;
/*!50001 DROP VIEW IF EXISTS `billing_with_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `billing_with_patient` AS SELECT 
 1 AS `patient_name`,
 1 AS `billing_id`,
 1 AS `consultation_id`,
 1 AS `fee`,
 1 AS `procedures`,
 1 AS `procedure_amount`,
 1 AS `medcert_amount`,
 1 AS `subtotal_amount`,
 1 AS `discount_name`,
 1 AS `discount_percent`,
 1 AS `discount_amount`,
 1 AS `total_amount`,
 1 AS `amount_paid`,
 1 AS `balance`,
 1 AS `note`,
 1 AS `payment_status`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `patient_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultation` (
  `consultation_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `consultation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `chief_complaint` text,
  `history` text,
  `ear_exam` text,
  `nose_exam` text,
  `throat_exam` text,
  `diagnosis` text,
  `recommendations` text,
  `notes` text,
  `follow_up_date` date DEFAULT NULL,
  `follow_up_notes` text,
  `age` int DEFAULT NULL,
  `neck_exam` text,
  `doctor_id` int DEFAULT NULL,
  `others_exam` text,
  `procedures` varchar(100) DEFAULT NULL,
  `maxillofacial_exam` text,
  `head_and_neck_exam` text,
  PRIMARY KEY (`consultation_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
INSERT INTO `consultation` (`consultation_id`, `patient_id`, `doctor_name`, `consultation_date`, `chief_complaint`, `history`, `ear_exam`, `nose_exam`, `throat_exam`, `diagnosis`, `recommendations`, `notes`, `follow_up_date`, `follow_up_notes`, `age`, `neck_exam`, `doctor_id`, `others_exam`, `procedures`, `maxillofacial_exam`, `head_and_neck_exam`) VALUES (464,2353,'2','2025-11-29 16:11:28','','SAD','','','','','','',NULL,'',22,NULL,NULL,'',NULL,'','');
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_autocomplete` AFTER INSERT ON `consultation` FOR EACH ROW BEGIN
    DECLARE line TEXT;
    DECLARE pos INT;
    DECLARE next_pos INT;
    DECLARE col_value TEXT;

    -- ===================== HELPER BLOCK =====================
    -- Processes each column with bullet points and user errors

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- just continue on errors (safety)
    END;

    -- ----------------- FUNCTION TO PROCESS A COLUMN -----------------
    -- We inline it for each column
    SET col_value = NEW.chief_complaint;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            -- Clean line: remove leading bullet and spaces
            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            -- Ignore invalid lines (empty or only bullet)
            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                -- Only insert if it does not exist yet
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'chief_complaint'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('chief_complaint', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- Repeat for other columns -----------------
    SET col_value = NEW.history;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'history'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('history', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- Repeat for ear_exam -----------------
    SET col_value = NEW.ear_exam;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'ear_exam'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('ear_exam', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- Repeat for nose_exam -----------------
    SET col_value = NEW.nose_exam;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'nose_exam'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('nose_exam', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- Repeat for throat_exam -----------------
    SET col_value = NEW.throat_exam;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'throat_exam'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('throat_exam', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- diagnosis -----------------
    SET col_value = NEW.diagnosis;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'diagnosis'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('diagnosis', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- recommendations -----------------
    SET col_value = NEW.recommendations;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'recommendations'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('recommendations', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- notes -----------------
    SET col_value = NEW.notes;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'notes'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('notes', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

    -- ----------------- follow_up_notes -----------------
    SET col_value = NEW.follow_up_notes;
    IF col_value IS NOT NULL AND TRIM(col_value) <> '' THEN
        SET pos = 1;
        WHILE pos <= CHAR_LENGTH(col_value) DO
            SET next_pos = LOCATE('\n', col_value, pos);
            IF next_pos = 0 THEN
                SET line = SUBSTRING(col_value, pos);
                SET pos = CHAR_LENGTH(col_value) + 1;
            ELSE
                SET line = SUBSTRING(col_value, pos, next_pos - pos);
                SET pos = next_pos + 1;
            END IF;

            SET line = TRIM(line);
            IF LEFT(line,2) = 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢ ' THEN
                SET line = TRIM(SUBSTRING(line,3));
            END IF;

            IF line <> '' AND line <> 'ÃƒÂ¢Ã‚â‚¬Ã‚Â¢' THEN
                IF NOT EXISTS (
                    SELECT 1 FROM ent_clinic_db.autocomplete_entries
                    WHERE column_name = 'follow_up_notes'
                      AND value = CONCAT(line,' ')
                ) THEN
                    INSERT INTO ent_clinic_db.autocomplete_entries(column_name, value)
                    VALUES ('follow_up_notes', CONCAT(line,' '));
                END IF;
            END IF;
        END WHILE;
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_consultation_insert` AFTER INSERT ON `consultation` FOR EACH ROW BEGIN
    -- Insert the health_record snapshot into health_record_history
    INSERT INTO `health_record_history` (
        consultation_id,
        patient_id,
        past_medical_history,
        family_history,
        personal_social_history,
        bp,
        temperature,
        pr,
        rr,
        ht,
        wt,
        general_appearance,
        skin,
        head_and_face,
        eyes,
        neck,
        chest_lungs,
        heart,
        abdomen,
        extremities,
        neurologic,
        created_at,
        updated_at,
        allergies
    )
    SELECT
        NEW.consultation_id,
        hr.patient_id,
        hr.past_medical_history,
        hr.family_history,
        hr.personal_social_history,
        hr.bp,
        hr.temperature,
        hr.pr,
        hr.rr,
        hr.ht,
        hr.wt,
        hr.general_appearance,
        hr.skin,
        hr.head_and_face,
        hr.eyes,
        hr.neck,
        hr.chest_lungs,
        hr.heart,
        hr.abdomen,
        hr.extremities,
        hr.neurologic,
        hr.created_at,
        hr.updated_at,
        hr.allergies
    FROM `health_record` AS hr
    WHERE hr.patient_id = NEW.patient_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_consultation_set_done` AFTER INSERT ON `consultation` FOR EACH ROW BEGIN
    UPDATE queue
    SET 
        status = 'Done',
        finished_at = NOW()
    WHERE patient_id = NEW.patient_id
      AND status = 'Examining';   -- only change if currently examining
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dispense_prescription`
--

DROP TABLE IF EXISTS `dispense_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispense_prescription` (
  `dispense_id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `invoice_item_id` int NOT NULL,
  `dispensed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dispense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispense_prescription`
--

LOCK TABLES `dispense_prescription` WRITE;
/*!40000 ALTER TABLE `dispense_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispense_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_pe`
--

DROP TABLE IF EXISTS `general_pe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_pe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pe_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_pe`
--

LOCK TABLES `general_pe` WRITE;
/*!40000 ALTER TABLE `general_pe` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_pe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_record`
--

DROP TABLE IF EXISTS `health_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_record` (
  `health_record_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `past_medical_history` text,
  `family_history` text,
  `personal_social_history` text,
  `bp` varchar(20) DEFAULT NULL,
  `temperature` varchar(20) DEFAULT NULL,
  `pr` varchar(20) DEFAULT NULL,
  `rr` varchar(20) DEFAULT NULL,
  `ht` varchar(20) DEFAULT NULL,
  `wt` varchar(20) DEFAULT NULL,
  `general_appearance` varchar(255) DEFAULT NULL,
  `skin` varchar(255) DEFAULT NULL,
  `head_and_face` varchar(255) DEFAULT NULL,
  `eyes` varchar(255) DEFAULT NULL,
  `neck` varchar(255) DEFAULT NULL,
  `chest_lungs` varchar(255) DEFAULT NULL,
  `heart` varchar(255) DEFAULT NULL,
  `abdomen` varchar(255) DEFAULT NULL,
  `extremities` varchar(255) DEFAULT NULL,
  `neurologic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `consultation_id` int DEFAULT NULL,
  `allergies` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`health_record_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_record`
--

LOCK TABLES `health_record` WRITE;
/*!40000 ALTER TABLE `health_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_record_history`
--

DROP TABLE IF EXISTS `health_record_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_record_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `past_medical_history` text,
  `family_history` text,
  `personal_social_history` text,
  `bp` varchar(50) DEFAULT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `pr` varchar(10) DEFAULT NULL,
  `rr` varchar(10) DEFAULT NULL,
  `ht` varchar(10) DEFAULT NULL,
  `wt` varchar(10) DEFAULT NULL,
  `general_appearance` text,
  `skin` text,
  `head_and_face` text,
  `eyes` text,
  `neck` text,
  `chest_lungs` text,
  `heart` text,
  `abdomen` text,
  `extremities` text,
  `neurologic` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `allergies` text,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_record_history`
--

LOCK TABLES `health_record_history` WRITE;
/*!40000 ALTER TABLE `health_record_history` DISABLE KEYS */;
INSERT INTO `health_record_history` (`history_id`, `consultation_id`, `patient_id`, `past_medical_history`, `family_history`, `personal_social_history`, `bp`, `temperature`, `pr`, `rr`, `ht`, `wt`, `general_appearance`, `skin`, `head_and_face`, `eyes`, `neck`, `chest_lungs`, `heart`, `abdomen`, `extremities`, `neurologic`, `created_at`, `updated_at`, `allergies`, `recorded_at`) VALUES (81,NULL,2352,'','','','','','','','','','','','','','','','','','','','2025-11-29 15:36:34','2025-11-29 15:36:34','','2025-11-29 07:36:34'),(82,NULL,2353,'','','','','','','','','','','','','','','','','','','','2025-11-29 16:13:55','2025-11-29 16:13:55','','2025-11-29 08:13:55');
/*!40000 ALTER TABLE `health_record_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `invoice_item_id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `prescription_id` int DEFAULT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_invoice_item_insert` AFTER INSERT ON `invoice_items` FOR EACH ROW BEGIN
    -- Only proceed if the inserted row has a prescription_id
    IF NEW.prescription_id IS NOT NULL THEN
        -- Insert prescription data into dispense_prescription
        INSERT INTO dispense_prescription (prescription_id, patient_id, item_id, quantity, invoice_item_id)
        SELECT p.prescription_id, p.patient_id, p.item_id, p.quantity, NEW.invoice_item_id
        FROM prescription p
        WHERE p.prescription_id = NEW.prescription_id;

        -- Only delete if the insert affected 1 row
        IF ROW_COUNT() = 1 THEN
            DELETE FROM prescription WHERE prescription_id = NEW.prescription_id;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `invoice_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `net_total` decimal(10,2) DEFAULT NULL,
  `amount_received` decimal(10,2) DEFAULT '0.00',
  `change_due` decimal(10,2) DEFAULT '0.00',
  `invoice_type` varchar(20) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `discount_percent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issued_medical_certificate`
--

DROP TABLE IF EXISTS `issued_medical_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issued_medical_certificate` (
  `medical_certificate_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  `requester` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medical_certificate_id`),
  UNIQUE KEY `uq_consultation` (`consultation_id`),
  CONSTRAINT `issued_medical_certificate_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued_medical_certificate`
--

LOCK TABLES `issued_medical_certificate` WRITE;
/*!40000 ALTER TABLE `issued_medical_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `issued_medical_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(100) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `strength` varchar(50) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `selling_price` decimal(10,2) DEFAULT '0.00',
  `description` text,
  `status` enum('active','disabled') NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `idx_items_generic_name` (`generic_name`),
  KEY `idx_items_brand_name` (`brand_name`),
  KEY `idx_items_strength` (`strength`),
  KEY `idx_items_dosage` (`dosage`),
  KEY `idx_items_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_requests`
--

DROP TABLE IF EXISTS `lab_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `test_ids` json NOT NULL,
  `request_date` date NOT NULL,
  `consultation_id` int DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `patient_id` (`patient_id`),
  KEY `fk_labrequests_consultation` (`consultation_id`),
  CONSTRAINT `fk_labrequests_consultation` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_requests`
--

LOCK TABLES `lab_requests` WRITE;
/*!40000 ALTER TABLE `lab_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_results`
--

DROP TABLE IF EXISTS `lab_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `consultation_id` int NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `result_text` text,
  `result_file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `consultation_id` (`consultation_id`),
  CONSTRAINT `lab_results_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_results`
--

LOCK TABLES `lab_results` WRITE;
/*!40000 ALTER TABLE `lab_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_tests`
--

DROP TABLE IF EXISTS `lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `test_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_tests`
--

LOCK TABLES `lab_tests` WRITE;
/*!40000 ALTER TABLE `lab_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_items`
--

DROP TABLE IF EXISTS `other_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(100) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `strength` varchar(50) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_items`
--

LOCK TABLES `other_items` WRITE;
/*!40000 ALTER TABLE `other_items` DISABLE KEYS */;
INSERT INTO `other_items` (`item_id`, `generic_name`, `brand_name`, `strength`, `dosage`, `description`, `category`, `created_at`, `updated_at`) VALUES (36,'[generic name]','[brand name]','[strength ]','[dosage]','','[category]','2025-11-29 16:12:20','2025-11-29 16:12:20');
/*!40000 ALTER TABLE `other_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_documents`
--

DROP TABLE IF EXISTS `patient_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_documents`
--

LOCK TABLES `patient_documents` WRITE;
/*!40000 ALTER TABLE `patient_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_scanned_doc`
--

DROP TABLE IF EXISTS `patient_scanned_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_scanned_doc` (
  `scanned_doc_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `file` longblob NOT NULL,
  `uploaded_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`scanned_doc_id`),
  KEY `idx_patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_scanned_doc`
--

LOCK TABLES `patient_scanned_doc` WRITE;
/*!40000 ALTER TABLE `patient_scanned_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_scanned_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `patient_contact_number` varchar(11) DEFAULT NULL,
  `emergency_name` varchar(150) DEFAULT NULL,
  `emergency_contact_number` varchar(11) DEFAULT NULL,
  `emergency_relationship` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `photo` longblob,
  `referred_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `idx_patients_full_name` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`patient_id`, `full_name`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `patient_contact_number`, `emergency_name`, `emergency_contact_number`, `emergency_relationship`, `created_at`, `photo`, `referred_by`) VALUES (2353,'Buzz, Duzy  D.','Ilolo City','2002-12-30',22,'F','Married','09511365191','','','','2025-11-29 08:11:14',NULL,'');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patients_before_insert_emergency_name_clean` BEFORE INSERT ON `patients` FOR EACH ROW BEGIN
    -- If emergency_name is NULL or length less than 6 characters, empty it
    IF NEW.emergency_name IS NULL OR CHAR_LENGTH(NEW.emergency_name) < 6 THEN
        SET NEW.emergency_name = '';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_patients_update` BEFORE UPDATE ON `patients` FOR EACH ROW BEGIN
    -- Only update age if birth_date is changed
    IF NEW.birth_date <> OLD.birth_date THEN
        IF NEW.birth_date IS NOT NULL THEN
            SET NEW.age = TIMESTAMPDIFF(YEAR, NEW.birth_date, CURDATE());
        ELSE
            SET NEW.age = NULL;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_patient_delete` BEFORE DELETE ON `patients` FOR EACH ROW BEGIN
    INSERT INTO patients_backup 
    (
        patient_id,
        full_name,
        address,
        birth_date,
        age,
        sex,
        civil_status,
        patient_contact_number,
        emergency_name,
        emergency_contact_number,
        emergency_relationship,
        photo
    )
    VALUES
    (
        OLD.patient_id,
        OLD.full_name,
        OLD.address,
        OLD.birth_date,
        OLD.age,
        OLD.sex,
        OLD.civil_status,
        OLD.patient_contact_number,
        OLD.emergency_name,
        OLD.emergency_contact_number,
        OLD.emergency_relationship,
        OLD.photo
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patients_backup`
--

DROP TABLE IF EXISTS `patients_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_backup` (
  `backup_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `patient_contact_number` varchar(20) DEFAULT NULL,
  `emergency_name` varchar(255) DEFAULT NULL,
  `emergency_contact_number` varchar(20) DEFAULT NULL,
  `emergency_relationship` varchar(50) DEFAULT NULL,
  `photo` longblob,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`backup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_backup`
--

LOCK TABLES `patients_backup` WRITE;
/*!40000 ALTER TABLE `patients_backup` DISABLE KEYS */;
INSERT INTO `patients_backup` (`backup_id`, `patient_id`, `full_name`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `patient_contact_number`, `emergency_name`, `emergency_contact_number`, `emergency_relationship`, `photo`, `deleted_at`) VALUES (3,2352,'Buzz, Duzzy  Jr. D.','Iloilo City','2002-10-20',23,'M','Single','09511365191','','','',NULL,'2025-11-29 07:43:09');
/*!40000 ALTER TABLE `patients_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sig` text,
  `consultation_id` int DEFAULT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_other`
--

DROP TABLE IF EXISTS `prescription_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_other` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `consultation_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `sig` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_prescription_other_patient` (`patient_id`),
  KEY `fk_prescription_other_consultation` (`consultation_id`),
  CONSTRAINT `fk_prescription_other_consultation` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prescription_other_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_other`
--

LOCK TABLES `prescription_other` WRITE;
/*!40000 ALTER TABLE `prescription_other` DISABLE KEYS */;
INSERT INTO `prescription_other` (`id`, `patient_id`, `consultation_id`, `item_id`, `quantity`, `sig`, `created_at`) VALUES (95,2353,464,36,1,'1 x a day if not constipated','2025-11-29 08:12:40');
/*!40000 ALTER TABLE `prescription_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `queue_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `queue_number` int NOT NULL,
  `status` enum('Examining','Waiting','Done','Skipped','Cancelled') DEFAULT 'Waiting',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `called_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_queue_status_update` BEFORE UPDATE ON `queue` FOR EACH ROW BEGIN
    -- When status is changed to "Done", set finished_at to current timestamp
    IF NEW.status = 'Done' THEN
        SET NEW.finished_at = NOW();
        SET NEW.called_at = NEW.called_at; -- preserve previous value

    -- When status is changed to "Examining", set called_at to current timestamp
    ELSEIF NEW.status = 'Examining' THEN
        SET NEW.called_at = NOW();
        SET NEW.finished_at = NEW.finished_at; -- preserve previous value

    -- Otherwise (Waiting, Skipped, Cancelled), clear both timestamps
    ELSE
        SET NEW.called_at = NULL;
        SET NEW.finished_at = NULL;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrals` (
  `referral_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `referring_doctor` varchar(255) DEFAULT NULL,
  `referral_type` text,
  `present_working_impression` text,
  `plan` text,
  `additional_info` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`referral_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_movements`
--

DROP TABLE IF EXISTS `return_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_movements` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_movements`
--

LOCK TABLES `return_movements` WRITE;
/*!40000 ALTER TABLE `return_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `tax_amount` decimal(10,2) DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL,
  `sale_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movements`
--

DROP TABLE IF EXISTS `stock_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_movements` (
  `movement_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `movement_type` varchar(40) NOT NULL,
  `quantity` int NOT NULL,
  `movement_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` datetime DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT '0.00',
  `user_id` int DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `reason` text,
  PRIMARY KEY (`movement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movements`
--

LOCK TABLES `stock_movements` WRITE;
/*!40000 ALTER TABLE `stock_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movements` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_stock_movements_insert` AFTER INSERT ON `stock_movements` FOR EACH ROW BEGIN
    -- 1. Adjust stock quantity based on movement type
    IF NEW.movement_type = 'IN' OR NEW.movement_type = 'RETURN' THEN
        -- Incoming stock increases quantity
        UPDATE items
        SET quantity = quantity + NEW.quantity
        WHERE item_id = NEW.item_id;
    ELSEIF NEW.movement_type = 'OUT' OR NEW.movement_type = 'WRITE-OFF' THEN
        -- Outgoing or written-off items decrease stock
        UPDATE items
        SET quantity = quantity - NEW.quantity
        WHERE item_id = NEW.item_id;
    END IF;

    -- 2. Insert into history log
    INSERT INTO stock_movements_history (
        movement_id, item_id, movement_type, quantity, expiration_date, 
        action_type, old_quantity, new_quantity
    )
    VALUES (
        NEW.movement_id, NEW.item_id, NEW.movement_type, NEW.quantity, NEW.expiration_date, 
        'INSERT', NULL, NEW.quantity
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_stock_movements_after_delete` AFTER DELETE ON `stock_movements` FOR EACH ROW BEGIN
    -- 1. Insert into history log
    INSERT INTO stock_movements_history (
        movement_id,
        item_id,
        movement_type,
        quantity,
        expiration_date,
        action_type,
        old_quantity,
        new_quantity
    )
    VALUES (
        OLD.movement_id,
        OLD.item_id,
        OLD.movement_type,
        OLD.quantity,
        OLD.expiration_date,
        'DELETE',
        OLD.quantity,
        NULL
    );

    -- 2. Adjust stock quantity
    IF OLD.movement_type = 'IN' OR OLD.movement_type = 'RETURN' THEN
        UPDATE items
        SET quantity = quantity - OLD.quantity
        WHERE item_id = OLD.item_id;
    ELSEIF OLD.movement_type = 'OUT' OR OLD.movement_type = 'WRITE-OFF' THEN
        UPDATE items
        SET quantity = quantity + OLD.quantity
        WHERE item_id = OLD.item_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stock_movements_history`
--

DROP TABLE IF EXISTS `stock_movements_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_movements_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `movement_id` int NOT NULL,
  `item_id` int NOT NULL,
  `movement_type` varchar(40) NOT NULL,
  `quantity` int NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `old_quantity` int DEFAULT NULL,
  `new_quantity` int DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movements_history`
--

LOCK TABLES `stock_movements_history` WRITE;
/*!40000 ALTER TABLE `stock_movements_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movements_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movements_log`
--

DROP TABLE IF EXISTS `stock_movements_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_movements_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `movement_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `movement_type` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `movement_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `deleted_by_user_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movements_log`
--

LOCK TABLES `stock_movements_log` WRITE;
/*!40000 ALTER TABLE `stock_movements_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movements_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) DEFAULT NULL,
  `setting_value` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`setting_id`, `setting_key`, `setting_value`, `description`, `created_at`, `updated_at`) VALUES (21,'default_currency','PHP','Default currency of the system','2025-09-12 17:11:00','2025-09-12 17:11:00'),(22,'currency_symbol','P','Currency symbol for displaying prices','2025-09-12 17:11:00','2025-10-18 04:26:37'),(23,'invoice_prefix','INV','Prefix used when generating invoice numbers','2025-09-12 17:11:00','2025-09-12 17:11:00'),(52,'allow_negative_stock','0',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(53,'low_stock_threshold','10',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(54,'clinic_name','JOEBERT M. VILLANUEVA, MD, FPSO-HNS',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(55,'clinic_address','',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(56,'clinic_tel','',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(57,'clinic_mobile','',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(58,'clinic_hours','',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(59,'clinic_affiliations','',NULL,'2025-09-24 08:17:22','2025-11-29 07:03:28'),(60,'report_header','ENT CLINIC ',NULL,'2025-09-24 08:17:22','2025-10-01 12:03:16'),(61,'report_footer','','','2025-09-24 08:17:22','2025-11-29 07:03:28'),(62,'date_format','yyyy-MM-dd',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(63,'time_format','hh:mm tt',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(64,'printer_name	','XP-58',NULL,'2025-09-24 08:17:22','2025-10-08 13:47:14'),(65,'markup_percentage','50',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(66,'clinic_subtitle','',NULL,'2025-09-24 08:28:15','2025-11-29 07:03:28'),(67,'clinic_email','',NULL,'2025-09-24 08:42:52','2025-11-29 07:03:28'),(68,'license_number','0097220','','2025-09-25 06:27:50','2025-11-29 07:03:28'),(82,'ptr','4817826',NULL,'2025-10-08 13:47:14','2025-11-29 07:03:28'),(83,'stwo','',NULL,'2025-10-08 13:47:14','2025-11-29 04:22:22'),(84,'land_mark','(Front of Robinsons Jaro)',NULL,'2025-10-17 03:21:44','2025-10-17 03:23:13'),(85,'printer_name','XP-58 (copy 1)',NULL,'2025-10-17 06:09:04','2025-10-17 07:17:12'),(88,'base_path','\\\\server-desktop\\ENT_Clinic_Attachments',NULL,'2025-10-27 01:43:40','2025-11-29 07:36:10');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `username`, `password`, `full_name`, `role`) VALUES (1,'a','a','Machiele','Receptionist'),(2,'d','d','Villanueva','Doctor'),(3,'admin','admin','Admin','Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_admitting_orders_with_patient`
--

DROP TABLE IF EXISTS `v_admitting_orders_with_patient`;
/*!50001 DROP VIEW IF EXISTS `v_admitting_orders_with_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_admitting_orders_with_patient` AS SELECT 
 1 AS `admitting_order_id`,
 1 AS `patient_id`,
 1 AS `patient_name`,
 1 AS `diagnosis`,
 1 AS `chief_complaints`,
 1 AS `vital_signs`,
 1 AS `diet`,
 1 AS `activity`,
 1 AS `medications`,
 1 AS `iv_fluids`,
 1 AS `laboratory`,
 1 AS `imaging`,
 1 AS `nursing_instructions`,
 1 AS `special_instructions`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_autocomplete_entries`
--

DROP TABLE IF EXISTS `v_autocomplete_entries`;
/*!50001 DROP VIEW IF EXISTS `v_autocomplete_entries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_autocomplete_entries` AS SELECT 
 1 AS `column_name`,
 1 AS `value`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_billing_with_patient_report`
--

DROP TABLE IF EXISTS `v_billing_with_patient_report`;
/*!50001 DROP VIEW IF EXISTS `v_billing_with_patient_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_billing_with_patient_report` AS SELECT 
 1 AS `Billing_ID`,
 1 AS `Consultation_ID`,
 1 AS `Patient_ID`,
 1 AS `Patient_Name`,
 1 AS `Fee`,
 1 AS `Discount_Percent`,
 1 AS `Discount_Amount`,
 1 AS `Total_Amount`,
 1 AS `Amount_Paid`,
 1 AS `Balance`,
 1 AS `Payment_Status`,
 1 AS `Note`,
 1 AS `Date_Billed`,
 1 AS `Updated_At`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_consultation_details`
--

DROP TABLE IF EXISTS `v_consultation_details`;
/*!50001 DROP VIEW IF EXISTS `v_consultation_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_consultation_details` AS SELECT 
 1 AS `consultation_id`,
 1 AS `patient_id`,
 1 AS `full_name`,
 1 AS `address`,
 1 AS `age`,
 1 AS `sex`,
 1 AS `civil_status`,
 1 AS `referred_by`,
 1 AS `consultation_date`,
 1 AS `chief_complaint`,
 1 AS `history`,
 1 AS `ear_exam`,
 1 AS `nose_exam`,
 1 AS `throat_exam`,
 1 AS `maxillofacial_exam`,
 1 AS `head_and_neck_exam`,
 1 AS `others_exam`,
 1 AS `diagnosis`,
 1 AS `recommendations`,
 1 AS `procedures`,
 1 AS `notes`,
 1 AS `follow_up_date`,
 1 AS `follow_up_notes`,
 1 AS `history_id`,
 1 AS `past_medical_history`,
 1 AS `family_history`,
 1 AS `personal_social_history`,
 1 AS `bp`,
 1 AS `temperature`,
 1 AS `pr`,
 1 AS `rr`,
 1 AS `ht`,
 1 AS `wt`,
 1 AS `general_appearance`,
 1 AS `skin`,
 1 AS `head_and_face`,
 1 AS `eyes`,
 1 AS `neck`,
 1 AS `chest_lungs`,
 1 AS `heart`,
 1 AS `abdomen`,
 1 AS `extremities`,
 1 AS `neurologic`,
 1 AS `allergies`,
 1 AS `recorded_at`,
 1 AS `history_created_at`,
 1 AS `history_updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detailed_dispensing_report`
--

DROP TABLE IF EXISTS `v_detailed_dispensing_report`;
/*!50001 DROP VIEW IF EXISTS `v_detailed_dispensing_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detailed_dispensing_report` AS SELECT 
 1 AS `Invoice_ID`,
 1 AS `Invoice_Date`,
 1 AS `Customer_Name`,
 1 AS `Prescription_ID`,
 1 AS `Item_ID`,
 1 AS `Generic_Name`,
 1 AS `Brand_Name`,
 1 AS `Strength`,
 1 AS `Dosage`,
 1 AS `Category`,
 1 AS `Quantity`,
 1 AS `Cost_Price`,
 1 AS `Unit_Price`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_exam_distribution`
--

DROP TABLE IF EXISTS `v_exam_distribution`;
/*!50001 DROP VIEW IF EXISTS `v_exam_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_exam_distribution` AS SELECT 
 1 AS `MonthNumber`,
 1 AS `MonthName`,
 1 AS `Year`,
 1 AS `EarCount`,
 1 AS `NoseCount`,
 1 AS `ThroatCount`,
 1 AS `OthersCount`,
 1 AS `DiagnosisCount`,
 1 AS `RecommendationsCount`,
 1 AS `MaxillofacialCount`,
 1 AS `HeadNeckCount`,
 1 AS `TotalConsults`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_lab_requests_with_tests`
--

DROP TABLE IF EXISTS `v_lab_requests_with_tests`;
/*!50001 DROP VIEW IF EXISTS `v_lab_requests_with_tests`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_lab_requests_with_tests` AS SELECT 
 1 AS `request_id`,
 1 AS `patient_id`,
 1 AS `consultation_id`,
 1 AS `test_ids`,
 1 AS `request_date`,
 1 AS `test_list`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_low_stock_report`
--

DROP TABLE IF EXISTS `v_low_stock_report`;
/*!50001 DROP VIEW IF EXISTS `v_low_stock_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_low_stock_report` AS SELECT 
 1 AS `Item_ID`,
 1 AS `Generic_Name`,
 1 AS `Brand_Name`,
 1 AS `Strength`,
 1 AS `Dosage`,
 1 AS `Category`,
 1 AS `Current_Stock`,
 1 AS `Cost_Price`,
 1 AS `Selling_Price`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_medical_certificate_details`
--

DROP TABLE IF EXISTS `v_medical_certificate_details`;
/*!50001 DROP VIEW IF EXISTS `v_medical_certificate_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_medical_certificate_details` AS SELECT 
 1 AS `medical_certificate_id`,
 1 AS `patient_name`,
 1 AS `patient_id`,
 1 AS `consultation_id`,
 1 AS `diagnosis`,
 1 AS `recommendations`,
 1 AS `chief_complaint`,
 1 AS `requester`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prescription_other_with_items`
--

DROP TABLE IF EXISTS `v_prescription_other_with_items`;
/*!50001 DROP VIEW IF EXISTS `v_prescription_other_with_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prescription_other_with_items` AS SELECT 
 1 AS `id`,
 1 AS `patient_id`,
 1 AS `consultation_id`,
 1 AS `item_id`,
 1 AS `quantity`,
 1 AS `sig`,
 1 AS `prescription_created_at`,
 1 AS `generic_name`,
 1 AS `brand_name`,
 1 AS `strength`,
 1 AS `dosage`,
 1 AS `category`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prescription_with_items`
--

DROP TABLE IF EXISTS `v_prescription_with_items`;
/*!50001 DROP VIEW IF EXISTS `v_prescription_with_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prescription_with_items` AS SELECT 
 1 AS `prescription_id`,
 1 AS `patient_id`,
 1 AS `item_id`,
 1 AS `quantity`,
 1 AS `sig`,
 1 AS `consultation_id`,
 1 AS `prescription_created_at`,
 1 AS `generic_name`,
 1 AS `brand_name`,
 1 AS `strength`,
 1 AS `dosage`,
 1 AS `category`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_referrals_with_patient_name`
--

DROP TABLE IF EXISTS `v_referrals_with_patient_name`;
/*!50001 DROP VIEW IF EXISTS `v_referrals_with_patient_name`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_referrals_with_patient_name` AS SELECT 
 1 AS `referral_id`,
 1 AS `patient_id`,
 1 AS `patient_name`,
 1 AS `referring_doctor`,
 1 AS `referral_type`,
 1 AS `present_working_impression`,
 1 AS `plan`,
 1 AS `additional_info`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sig_suggestions`
--

DROP TABLE IF EXISTS `v_sig_suggestions`;
/*!50001 DROP VIEW IF EXISTS `v_sig_suggestions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_sig_suggestions` AS SELECT 
 1 AS `item_id`,
 1 AS `sig`,
 1 AS `last_used`,
 1 AS `use_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock_movements`
--

DROP TABLE IF EXISTS `v_stock_movements`;
/*!50001 DROP VIEW IF EXISTS `v_stock_movements`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock_movements` AS SELECT 
 1 AS `movement_id`,
 1 AS `item_id`,
 1 AS `generic_name`,
 1 AS `brand_name`,
 1 AS `strength`,
 1 AS `dosage`,
 1 AS `item_category`,
 1 AS `movement_type`,
 1 AS `quantity`,
 1 AS `movement_date`,
 1 AS `expiration_date`,
 1 AS `unit_price`,
 1 AS `cost_price`,
 1 AS `reason`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock_near_expiry_report`
--

DROP TABLE IF EXISTS `v_stock_near_expiry_report`;
/*!50001 DROP VIEW IF EXISTS `v_stock_near_expiry_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock_near_expiry_report` AS SELECT 
 1 AS `Movement_ID`,
 1 AS `Item_ID`,
 1 AS `Generic_Name`,
 1 AS `Brand_Name`,
 1 AS `Strength`,
 1 AS `Dosage`,
 1 AS `Movement_Type`,
 1 AS `Quantity`,
 1 AS `Movement_Date`,
 1 AS `Expiration_Date`,
 1 AS `User_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock_on_hand_report`
--

DROP TABLE IF EXISTS `v_stock_on_hand_report`;
/*!50001 DROP VIEW IF EXISTS `v_stock_on_hand_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock_on_hand_report` AS SELECT 
 1 AS `Item_ID`,
 1 AS `Generic_Name`,
 1 AS `Brand_Name`,
 1 AS `Strength`,
 1 AS `Dosage`,
 1 AS `Category`,
 1 AS `Current_Stock`,
 1 AS `Cost_Price`,
 1 AS `Selling_Price`,
 1 AS `Status`,
 1 AS `Description`,
 1 AS `Created_At`,
 1 AS `Updated_At`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_write_off_report`
--

DROP TABLE IF EXISTS `v_write_off_report`;
/*!50001 DROP VIEW IF EXISTS `v_write_off_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_write_off_report` AS SELECT 
 1 AS `Write_Off_ID`,
 1 AS `Item_ID`,
 1 AS `Generic_Name`,
 1 AS `Brand_Name`,
 1 AS `Strength`,
 1 AS `Dosage`,
 1 AS `Quantity`,
 1 AS `Reason`,
 1 AS `Expiration_Date`,
 1 AS `Created_At`,
 1 AS `Updated_At`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_patients_with_documents`
--

DROP TABLE IF EXISTS `view_patients_with_documents`;
/*!50001 DROP VIEW IF EXISTS `view_patients_with_documents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_patients_with_documents` AS SELECT 
 1 AS `patient_id`,
 1 AS `full_name`,
 1 AS `has_documents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_queue_with_patients`
--

DROP TABLE IF EXISTS `view_queue_with_patients`;
/*!50001 DROP VIEW IF EXISTS `view_queue_with_patients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_queue_with_patients` AS SELECT 
 1 AS `Queue_ID`,
 1 AS `Patient_ID`,
 1 AS `Patient_Name`,
 1 AS `Address`,
 1 AS `Age`,
 1 AS `Sex`,
 1 AS `Civil_Status`,
 1 AS `Patient_Contact_Number`,
 1 AS `Emergency_Contact_Number`,
 1 AS `Queue_Number`,
 1 AS `Status`,
 1 AS `Queued_At`,
 1 AS `Finished_Time`,
 1 AS `Referred_By`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_queue_with_patients_original`
--

DROP TABLE IF EXISTS `view_queue_with_patients_original`;
/*!50001 DROP VIEW IF EXISTS `view_queue_with_patients_original`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_queue_with_patients_original` AS SELECT 
 1 AS `queue_id`,
 1 AS `patient_id`,
 1 AS `full_name`,
 1 AS `address`,
 1 AS `age`,
 1 AS `sex`,
 1 AS `civil_status`,
 1 AS `patient_contact_number`,
 1 AS `emergency_contact_number`,
 1 AS `queue_number`,
 1 AS `status`,
 1 AS `created_at`,
 1 AS `finished_at`,
 1 AS `referred_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `write_off_movements`
--

DROP TABLE IF EXISTS `write_off_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `write_off_movements` (
  `write_off_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`write_off_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `write_off_movements`
--

LOCK TABLES `write_off_movements` WRITE;
/*!40000 ALTER TABLE `write_off_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `write_off_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ent_clinic_db'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `cancel_old_waiting_queues` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `cancel_old_waiting_queues` ON SCHEDULE EVERY 1 DAY STARTS '2025-11-25 10:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE ent_clinic_db.queue
    SET status = 'Cancelled',
        updated_at = NOW()
    WHERE status = 'Waiting'
      AND DATE(created_at) < CURDATE()
      AND (finished_at IS NULL OR finished_at = '');
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'ent_clinic_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_billing_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_billing_payment`(
    IN p_billing_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_note VARCHAR(255)
)
BEGIN
    DECLARE v_total_paid DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_total_amount DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_balance DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_status VARCHAR(20) DEFAULT 'UNPAID';
    DECLARE v_change_due DECIMAL(10,2) DEFAULT 0.00;

    -- Handle any SQL exceptions by rolling back
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in add_billing_payment. Transaction rolled back.';
    END;

    -- Validate payment amount
    IF p_amount IS NULL OR p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount must be greater than 0';
    END IF;

    START TRANSACTION;

    -- Get billing total (lock row to avoid race conditions)
    SELECT total_amount
    INTO v_total_amount
    FROM ent_clinic_db.billing
    WHERE billing_id = p_billing_id
    FOR UPDATE;

    IF v_total_amount IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Billing record not found';
    END IF;

    -- Get total paid so far
    SELECT COALESCE(SUM(amount), 0.00)
    INTO v_total_paid
    FROM ent_clinic_db.billing_payments
    WHERE billing_id = p_billing_id;

    -- Calculate current balance before new payment
    SET v_balance = v_total_amount - v_total_paid;

    -- Calculate change_due for this payment
    IF p_amount > v_balance THEN
        SET v_change_due = p_amount - v_balance; -- excess payment
        SET v_balance = 0.00; -- after this payment, no balance left
    ELSE
        SET v_change_due = 0.00;
        SET v_balance = v_balance - p_amount;
    END IF;

    -- Insert into billing_payments (store balance & change_due here)
    INSERT INTO ent_clinic_db.billing_payments (
        billing_id,
        payment_date,
        amount,
        note,
        balance,
        change_due
    )
    VALUES (
        p_billing_id,
        NOW(),
        p_amount,
        p_note,
        v_balance,
        v_change_due
    );

    -- Update total paid (exclude change_due, since that's returned to patient)
    SET v_total_paid = v_total_paid + p_amount - v_change_due;

    -- Decide payment status
    IF v_total_paid = 0 THEN
        SET v_status = 'UNPAID';
    ELSEIF v_total_paid >= v_total_amount THEN
        SET v_status = 'FULLY PAID';
    ELSE
        SET v_status = 'PARTIALLY PAID';
    END IF;

    -- Update billing table
    UPDATE ent_clinic_db.billing
    SET amount_paid = v_total_paid,
        balance = v_balance,
        payment_status = v_status,
        updated_at = NOW()
    WHERE billing_id = p_billing_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStockMovement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStockMovement`(
    IN p_movement_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_item_id INT;
    DECLARE v_movement_type VARCHAR(50);
    DECLARE v_quantity INT;
    DECLARE v_movement_date DATE;
    DECLARE v_expiration_date DATE;
    DECLARE v_unit_price DECIMAL(10,2);

    -- Step 1: Fetch the movement details
    SELECT item_id, movement_type, quantity, movement_date, expiration_date, unit_price
    INTO v_item_id, v_movement_type, v_quantity, v_movement_date, v_expiration_date, v_unit_price
    FROM stock_movements
    WHERE movement_id = p_movement_id;

    -- Step 2: Insert into the log table
    INSERT INTO stock_movements_log(
        movement_id,
        item_id,
        movement_type,
        quantity,
        movement_date,
        expiration_date,
        unit_price,
        deleted_by_user_id
    )
    VALUES (
        p_movement_id,
        v_item_id,
        v_movement_type,
        v_quantity,
        v_movement_date,
        v_expiration_date,
        v_unit_price,
        p_user_id
    );

    -- Step 3: Delete from main table
    DELETE FROM stock_movements
    WHERE movement_id = p_movement_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_patient_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_patient_age`(IN patientId INT)
BEGIN
    UPDATE patients
    SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE())
    WHERE id = patientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `ent_clinic_db`
--

USE `ent_clinic_db`;

--
-- Final view structure for view `billing_with_patient`
--

/*!50001 DROP VIEW IF EXISTS `billing_with_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billing_with_patient` AS select `p`.`full_name` AS `patient_name`,`b`.`billing_id` AS `billing_id`,`b`.`consultation_id` AS `consultation_id`,`b`.`fee` AS `fee`,`b`.`procedures` AS `procedures`,`b`.`procedure_amount` AS `procedure_amount`,`b`.`medcert_amount` AS `medcert_amount`,`b`.`subtotal_amount` AS `subtotal_amount`,`b`.`discount_name` AS `discount_name`,`b`.`discount_percent` AS `discount_percent`,`b`.`discount_amount` AS `discount_amount`,`b`.`total_amount` AS `total_amount`,`b`.`amount_paid` AS `amount_paid`,`b`.`balance` AS `balance`,`b`.`note` AS `note`,`b`.`payment_status` AS `payment_status`,`b`.`created_at` AS `created_at`,`b`.`updated_at` AS `updated_at`,`b`.`patient_id` AS `patient_id` from (`billing` `b` join `patients` `p` on((`p`.`patient_id` = `b`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_admitting_orders_with_patient`
--

/*!50001 DROP VIEW IF EXISTS `v_admitting_orders_with_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_admitting_orders_with_patient` AS select `ao`.`admitting_order_id` AS `admitting_order_id`,`ao`.`patient_id` AS `patient_id`,`p`.`full_name` AS `patient_name`,`ao`.`diagnosis` AS `diagnosis`,`ao`.`chief_complaints` AS `chief_complaints`,`ao`.`vital_signs` AS `vital_signs`,`ao`.`diet` AS `diet`,`ao`.`activity` AS `activity`,`ao`.`medications` AS `medications`,`ao`.`iv_fluids` AS `iv_fluids`,`ao`.`laboratory` AS `laboratory`,`ao`.`imaging` AS `imaging`,`ao`.`nursing_instructions` AS `nursing_instructions`,`ao`.`special_instructions` AS `special_instructions`,`ao`.`created_at` AS `created_at` from (`admitting_orders` `ao` left join `patients` `p` on((`ao`.`patient_id` = `p`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_autocomplete_entries`
--

/*!50001 DROP VIEW IF EXISTS `v_autocomplete_entries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_autocomplete_entries` AS with recursive `seq` as (select 1 AS `n` union all select (`seq`.`n` + 1) AS `n + 1` from `seq` where (`seq`.`n` < 200)), `all_consult` as (select `consultation`.`consultation_id` AS `consultation_id`,'chief_complaint' AS `column_name`,`consultation`.`chief_complaint` AS `raw_value` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'history' AS `history`,`consultation`.`history` AS `history` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'ear_exam' AS `ear_exam`,`consultation`.`ear_exam` AS `ear_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'nose_exam' AS `nose_exam`,`consultation`.`nose_exam` AS `nose_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'throat_exam' AS `throat_exam`,`consultation`.`throat_exam` AS `throat_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'others_exam' AS `others_exam`,`consultation`.`others_exam` AS `others_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'diagnosis' AS `diagnosis`,`consultation`.`diagnosis` AS `diagnosis` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'recommendations' AS `recommendations`,`consultation`.`recommendations` AS `recommendations` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'maxillofacial_exam' AS `maxillofacial_exam`,`consultation`.`maxillofacial_exam` AS `maxillofacial_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'head_and_neck_exam' AS `head_and_neck_exam`,`consultation`.`head_and_neck_exam` AS `head_and_neck_exam` from `consultation` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'past_medical_history' AS `past_medical_history`,`health_record_history`.`past_medical_history` AS `past_medical_history` from `health_record_history` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'family_history' AS `family_history`,`health_record_history`.`family_history` AS `family_history` from `health_record_history` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'personal_social_history' AS `personal_social_history`,`health_record_history`.`personal_social_history` AS `personal_social_history` from `health_record_history`), `normalized` as (select `all_consult`.`consultation_id` AS `consultation_id`,`all_consult`.`column_name` AS `column_name`,trim(both ',' from trim(regexp_replace(regexp_replace(regexp_replace(replace(replace(replace(`all_consult`.`raw_value`,char(13),' '),char(10),' '),';',','),'\\s+',' '),',+',','),'^,|,$',''))) AS `norm_value` from `all_consult` where ((`all_consult`.`raw_value` is not null) and (trim(`all_consult`.`raw_value`) <> ''))), `tokens` as (select `normalized`.`consultation_id` AS `consultation_id`,`normalized`.`column_name` AS `column_name`,trim(regexp_substr(`normalized`.`norm_value`,'[^,]+',1,`s`.`n`)) AS `token`,`s`.`n` AS `seq_no`,((1 + length(`normalized`.`norm_value`)) - length(replace(`normalized`.`norm_value`,',',''))) AS `token_count` from (`normalized` join `seq` `s` on((`s`.`n` <= ((1 + length(`normalized`.`norm_value`)) - length(replace(`normalized`.`norm_value`,',','')))))) where ((`normalized`.`norm_value` is not null) and (trim(`normalized`.`norm_value`) <> ''))), `processed` as (select `t`.`consultation_id` AS `consultation_id`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then `t`.`token` else NULL end) AS `emitted_obs` from `tokens` `t` where (`t`.`seq_no` = 1) union all select `t`.`consultation_id` AS `consultation_id`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then (case when (`p`.`pending_obs` is not null) then concat(`p`.`pending_obs`,', ',`t`.`token`) else `t`.`token` end) else `p`.`pending_obs` end) AS `emitted_obs` from (`tokens` `t` join `processed` `p` on(((`t`.`consultation_id` = `p`.`consultation_id`) and (`t`.`column_name` = `p`.`column_name`) and (`t`.`seq_no` = (`p`.`seq_no` + 1)))))), `observations` as (select `processed`.`consultation_id` AS `consultation_id`,`processed`.`column_name` AS `column_name`,`processed`.`emitted_obs` AS `obs` from `processed` where (`processed`.`emitted_obs` is not null) union all select `processed`.`consultation_id` AS `consultation_id`,`processed`.`column_name` AS `column_name`,`processed`.`pending_obs` AS `pending_obs` from `processed` where ((`processed`.`pending_obs` is not null) and (`processed`.`seq_no` = `processed`.`token_count`))) select `observations`.`column_name` AS `column_name`,concat(upper(left(`observations`.`obs`,1)),lower(substr(`observations`.`obs`,2))) AS `value`,count(0) AS `count` from `observations` where ((`observations`.`obs` is not null) and (trim(`observations`.`obs`) <> '')) group by `observations`.`column_name`,`value` order by `observations`.`column_name`,`count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_billing_with_patient_report`
--

/*!50001 DROP VIEW IF EXISTS `v_billing_with_patient_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_billing_with_patient_report` AS select `billing_with_patient`.`billing_id` AS `Billing_ID`,`billing_with_patient`.`consultation_id` AS `Consultation_ID`,`billing_with_patient`.`patient_id` AS `Patient_ID`,`billing_with_patient`.`patient_name` AS `Patient_Name`,`billing_with_patient`.`fee` AS `Fee`,`billing_with_patient`.`discount_percent` AS `Discount_Percent`,`billing_with_patient`.`discount_amount` AS `Discount_Amount`,`billing_with_patient`.`total_amount` AS `Total_Amount`,`billing_with_patient`.`amount_paid` AS `Amount_Paid`,`billing_with_patient`.`balance` AS `Balance`,`billing_with_patient`.`payment_status` AS `Payment_Status`,`billing_with_patient`.`note` AS `Note`,`billing_with_patient`.`created_at` AS `Date_Billed`,`billing_with_patient`.`updated_at` AS `Updated_At` from `billing_with_patient` order by `billing_with_patient`.`created_at`,`billing_with_patient`.`billing_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_consultation_details`
--

/*!50001 DROP VIEW IF EXISTS `v_consultation_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consultation_details` AS select `c`.`consultation_id` AS `consultation_id`,`c`.`patient_id` AS `patient_id`,`p`.`full_name` AS `full_name`,`p`.`address` AS `address`,`c`.`age` AS `age`,`p`.`sex` AS `sex`,`p`.`civil_status` AS `civil_status`,`p`.`referred_by` AS `referred_by`,`c`.`consultation_date` AS `consultation_date`,`c`.`chief_complaint` AS `chief_complaint`,`c`.`history` AS `history`,`c`.`ear_exam` AS `ear_exam`,`c`.`nose_exam` AS `nose_exam`,`c`.`throat_exam` AS `throat_exam`,`c`.`maxillofacial_exam` AS `maxillofacial_exam`,`c`.`head_and_neck_exam` AS `head_and_neck_exam`,`c`.`others_exam` AS `others_exam`,`c`.`diagnosis` AS `diagnosis`,`c`.`recommendations` AS `recommendations`,`c`.`procedures` AS `procedures`,`c`.`notes` AS `notes`,`c`.`follow_up_date` AS `follow_up_date`,`c`.`follow_up_notes` AS `follow_up_notes`,`h`.`history_id` AS `history_id`,`h`.`past_medical_history` AS `past_medical_history`,`h`.`family_history` AS `family_history`,`h`.`personal_social_history` AS `personal_social_history`,`h`.`bp` AS `bp`,`h`.`temperature` AS `temperature`,`h`.`pr` AS `pr`,`h`.`rr` AS `rr`,`h`.`ht` AS `ht`,`h`.`wt` AS `wt`,`h`.`general_appearance` AS `general_appearance`,`h`.`skin` AS `skin`,`h`.`head_and_face` AS `head_and_face`,`h`.`eyes` AS `eyes`,`h`.`neck` AS `neck`,`h`.`chest_lungs` AS `chest_lungs`,`h`.`heart` AS `heart`,`h`.`abdomen` AS `abdomen`,`h`.`extremities` AS `extremities`,`h`.`neurologic` AS `neurologic`,`h`.`allergies` AS `allergies`,`h`.`recorded_at` AS `recorded_at`,`h`.`created_at` AS `history_created_at`,`h`.`updated_at` AS `history_updated_at` from ((`consultation` `c` left join `patients` `p` on((`p`.`patient_id` = `c`.`patient_id`))) left join `health_record_history` `h` on((`h`.`consultation_id` = `c`.`consultation_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detailed_dispensing_report`
--

/*!50001 DROP VIEW IF EXISTS `v_detailed_dispensing_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detailed_dispensing_report` AS select `i`.`invoice_id` AS `Invoice_ID`,`i`.`invoice_date` AS `Invoice_Date`,`i`.`customer_name` AS `Customer_Name`,`ii`.`prescription_id` AS `Prescription_ID`,`it`.`item_id` AS `Item_ID`,`it`.`generic_name` AS `Generic_Name`,`it`.`brand_name` AS `Brand_Name`,`it`.`strength` AS `Strength`,`it`.`dosage` AS `Dosage`,`it`.`category` AS `Category`,`ii`.`quantity` AS `Quantity`,`it`.`cost_price` AS `Cost_Price`,`ii`.`unit_price` AS `Unit_Price`,`ii`.`total_price` AS `Total` from ((`invoice_items` `ii` join `invoices` `i` on((`ii`.`invoice_id` = `i`.`invoice_id`))) join `items` `it` on((`ii`.`item_id` = `it`.`item_id`))) order by `i`.`invoice_date`,`i`.`invoice_id`,`it`.`generic_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_exam_distribution`
--

/*!50001 DROP VIEW IF EXISTS `v_exam_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_exam_distribution` AS with `months` as (select 1 AS `MonthNumber`,'January' AS `MonthName` union all select 2 AS `2`,'February' AS `February` union all select 3 AS `3`,'March' AS `March` union all select 4 AS `4`,'April' AS `April` union all select 5 AS `5`,'May' AS `May` union all select 6 AS `6`,'June' AS `June` union all select 7 AS `7`,'July' AS `July` union all select 8 AS `8`,'August' AS `August` union all select 9 AS `9`,'September' AS `September` union all select 10 AS `10`,'October' AS `October` union all select 11 AS `11`,'November' AS `November` union all select 12 AS `12`,'December' AS `December`) select `m`.`MonthNumber` AS `MonthNumber`,`m`.`MonthName` AS `MonthName`,year(`c`.`consultation_date`) AS `Year`,sum((case when ((`c`.`ear_exam` is not null) and (trim(`c`.`ear_exam`) <> '')) then 1 else 0 end)) AS `EarCount`,sum((case when ((`c`.`nose_exam` is not null) and (trim(`c`.`nose_exam`) <> '')) then 1 else 0 end)) AS `NoseCount`,sum((case when ((`c`.`throat_exam` is not null) and (trim(`c`.`throat_exam`) <> '')) then 1 else 0 end)) AS `ThroatCount`,sum((case when ((`c`.`others_exam` is not null) and (trim(`c`.`others_exam`) <> '')) then 1 else 0 end)) AS `OthersCount`,sum((case when ((`c`.`diagnosis` is not null) and (trim(`c`.`diagnosis`) <> '')) then 1 else 0 end)) AS `DiagnosisCount`,sum((case when ((`c`.`recommendations` is not null) and (trim(`c`.`recommendations`) <> '')) then 1 else 0 end)) AS `RecommendationsCount`,sum((case when ((`c`.`maxillofacial_exam` is not null) and (trim(`c`.`maxillofacial_exam`) <> '')) then 1 else 0 end)) AS `MaxillofacialCount`,sum((case when ((`c`.`head_and_neck_exam` is not null) and (trim(`c`.`head_and_neck_exam`) <> '')) then 1 else 0 end)) AS `HeadNeckCount`,count(`c`.`consultation_id`) AS `TotalConsults` from (`months` `m` left join `consultation` `c` on((month(`c`.`consultation_date`) = `m`.`MonthNumber`))) group by `m`.`MonthNumber`,`m`.`MonthName`,year(`c`.`consultation_date`) order by year(`c`.`consultation_date`),`m`.`MonthNumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lab_requests_with_tests`
--

/*!50001 DROP VIEW IF EXISTS `v_lab_requests_with_tests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lab_requests_with_tests` AS select `lr`.`request_id` AS `request_id`,`lr`.`patient_id` AS `patient_id`,`lr`.`consultation_id` AS `consultation_id`,`lr`.`test_ids` AS `test_ids`,`lr`.`request_date` AS `request_date`,(select group_concat(concat(`lt`.`category`,' - ',`lt`.`test_name`) order by `lt`.`category` ASC,`lt`.`test_name` ASC separator ', ') from `lab_tests` `lt` where json_contains(json_extract(`lr`.`test_ids`,'$'),cast(`lt`.`id` as json))) AS `test_list` from `lab_requests` `lr` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_low_stock_report`
--

/*!50001 DROP VIEW IF EXISTS `v_low_stock_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_low_stock_report` AS select `items`.`item_id` AS `Item_ID`,`items`.`generic_name` AS `Generic_Name`,`items`.`brand_name` AS `Brand_Name`,`items`.`strength` AS `Strength`,`items`.`dosage` AS `Dosage`,`items`.`category` AS `Category`,`items`.`quantity` AS `Current_Stock`,`items`.`cost_price` AS `Cost_Price`,`items`.`selling_price` AS `Selling_Price`,`items`.`description` AS `Description` from `items` where (`items`.`quantity` <= 10) order by `items`.`quantity`,`items`.`generic_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_medical_certificate_details`
--

/*!50001 DROP VIEW IF EXISTS `v_medical_certificate_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_medical_certificate_details` AS select `imc`.`medical_certificate_id` AS `medical_certificate_id`,`p`.`full_name` AS `patient_name`,`p`.`patient_id` AS `patient_id`,`imc`.`consultation_id` AS `consultation_id`,`c`.`diagnosis` AS `diagnosis`,`c`.`recommendations` AS `recommendations`,`c`.`chief_complaint` AS `chief_complaint`,`imc`.`requester` AS `requester`,`imc`.`created_at` AS `created_at` from ((`issued_medical_certificate` `imc` left join `consultation` `c` on((`c`.`consultation_id` = `imc`.`consultation_id`))) left join `patients` `p` on((`p`.`patient_id` = `c`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prescription_other_with_items`
--

/*!50001 DROP VIEW IF EXISTS `v_prescription_other_with_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prescription_other_with_items` AS select `po`.`id` AS `id`,`po`.`patient_id` AS `patient_id`,`po`.`consultation_id` AS `consultation_id`,`po`.`item_id` AS `item_id`,`po`.`quantity` AS `quantity`,`po`.`sig` AS `sig`,`po`.`created_at` AS `prescription_created_at`,`oi`.`generic_name` AS `generic_name`,`oi`.`brand_name` AS `brand_name`,`oi`.`strength` AS `strength`,`oi`.`dosage` AS `dosage`,`oi`.`category` AS `category` from (`prescription_other` `po` left join `other_items` `oi` on((`po`.`item_id` = `oi`.`item_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prescription_with_items`
--

/*!50001 DROP VIEW IF EXISTS `v_prescription_with_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prescription_with_items` AS select `p`.`prescription_id` AS `prescription_id`,`p`.`patient_id` AS `patient_id`,`p`.`item_id` AS `item_id`,`p`.`quantity` AS `quantity`,`p`.`sig` AS `sig`,`p`.`consultation_id` AS `consultation_id`,`p`.`created_at` AS `prescription_created_at`,`i`.`generic_name` AS `generic_name`,`i`.`brand_name` AS `brand_name`,`i`.`strength` AS `strength`,`i`.`dosage` AS `dosage`,`i`.`category` AS `category` from (`prescription` `p` left join `items` `i` on((`p`.`item_id` = `i`.`item_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_referrals_with_patient_name`
--

/*!50001 DROP VIEW IF EXISTS `v_referrals_with_patient_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_referrals_with_patient_name` AS select `r`.`referral_id` AS `referral_id`,`r`.`patient_id` AS `patient_id`,`p`.`full_name` AS `patient_name`,`r`.`referring_doctor` AS `referring_doctor`,`r`.`referral_type` AS `referral_type`,`r`.`present_working_impression` AS `present_working_impression`,`r`.`plan` AS `plan`,`r`.`additional_info` AS `additional_info`,`r`.`created_at` AS `created_at` from (`referrals` `r` left join `patients` `p` on((`r`.`patient_id` = `p`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sig_suggestions`
--

/*!50001 DROP VIEW IF EXISTS `v_sig_suggestions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sig_suggestions` AS select `all_prescriptions`.`item_id` AS `item_id`,lower(`all_prescriptions`.`sig`) AS `sig`,max(`all_prescriptions`.`created_at`) AS `last_used`,count(0) AS `use_count` from (select `prescription`.`item_id` AS `item_id`,`prescription`.`sig` AS `sig`,`prescription`.`created_at` AS `created_at` from `prescription` where ((`prescription`.`sig` is not null) and (`prescription`.`sig` <> '')) union all select `prescription_other`.`item_id` AS `item_id`,`prescription_other`.`sig` AS `sig`,`prescription_other`.`created_at` AS `created_at` from `prescription_other` where ((`prescription_other`.`sig` is not null) and (`prescription_other`.`sig` <> ''))) `all_prescriptions` group by `all_prescriptions`.`item_id`,lower(`all_prescriptions`.`sig`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock_movements`
--

/*!50001 DROP VIEW IF EXISTS `v_stock_movements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_movements` AS select `sm`.`movement_id` AS `movement_id`,`sm`.`item_id` AS `item_id`,`i`.`generic_name` AS `generic_name`,`i`.`brand_name` AS `brand_name`,`i`.`strength` AS `strength`,`i`.`dosage` AS `dosage`,`i`.`category` AS `item_category`,`sm`.`movement_type` AS `movement_type`,`sm`.`quantity` AS `quantity`,`sm`.`movement_date` AS `movement_date`,`sm`.`expiration_date` AS `expiration_date`,`sm`.`unit_price` AS `unit_price`,`sm`.`cost_price` AS `cost_price`,`sm`.`reason` AS `reason` from (`stock_movements` `sm` join `items` `i` on((`sm`.`item_id` = `i`.`item_id`))) order by `sm`.`movement_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock_near_expiry_report`
--

/*!50001 DROP VIEW IF EXISTS `v_stock_near_expiry_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_near_expiry_report` AS select `sm`.`movement_id` AS `Movement_ID`,`sm`.`item_id` AS `Item_ID`,`it`.`generic_name` AS `Generic_Name`,`it`.`brand_name` AS `Brand_Name`,`it`.`strength` AS `Strength`,`it`.`dosage` AS `Dosage`,`sm`.`movement_type` AS `Movement_Type`,`sm`.`quantity` AS `Quantity`,`sm`.`movement_date` AS `Movement_Date`,`sm`.`expiration_date` AS `Expiration_Date`,`sm`.`user_id` AS `User_ID` from (`stock_movements` `sm` join `items` `it` on((`sm`.`item_id` = `it`.`item_id`))) where ((`sm`.`expiration_date` is not null) and (`sm`.`expiration_date` <= (curdate() + interval 30 day))) order by `sm`.`expiration_date`,`sm`.`movement_date`,`sm`.`item_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock_on_hand_report`
--

/*!50001 DROP VIEW IF EXISTS `v_stock_on_hand_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock_on_hand_report` AS select `items`.`item_id` AS `Item_ID`,`items`.`generic_name` AS `Generic_Name`,`items`.`brand_name` AS `Brand_Name`,`items`.`strength` AS `Strength`,`items`.`dosage` AS `Dosage`,`items`.`category` AS `Category`,`items`.`quantity` AS `Current_Stock`,`items`.`cost_price` AS `Cost_Price`,`items`.`selling_price` AS `Selling_Price`,`items`.`status` AS `Status`,`items`.`description` AS `Description`,`items`.`created_at` AS `Created_At`,`items`.`updated_at` AS `Updated_At` from `items` order by `items`.`generic_name`,`items`.`brand_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_write_off_report`
--

/*!50001 DROP VIEW IF EXISTS `v_write_off_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_write_off_report` AS select `w`.`write_off_id` AS `Write_Off_ID`,`w`.`item_id` AS `Item_ID`,`it`.`generic_name` AS `Generic_Name`,`it`.`brand_name` AS `Brand_Name`,`it`.`strength` AS `Strength`,`it`.`dosage` AS `Dosage`,`w`.`quantity` AS `Quantity`,`w`.`reason` AS `Reason`,`w`.`expiration_date` AS `Expiration_Date`,`w`.`created_at` AS `Created_At`,`w`.`updated_at` AS `Updated_At` from (`write_off_movements` `w` join `items` `it` on((`w`.`item_id` = `it`.`item_id`))) order by `w`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_patients_with_documents`
--

/*!50001 DROP VIEW IF EXISTS `view_patients_with_documents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_patients_with_documents` AS select `p`.`patient_id` AS `patient_id`,`p`.`full_name` AS `full_name`,(case when (count(`d`.`id`) > 0) then true else false end) AS `has_documents` from (`patients` `p` left join `patient_documents` `d` on((`p`.`patient_id` = `d`.`patient_id`))) group by `p`.`patient_id`,`p`.`full_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_queue_with_patients`
--

/*!50001 DROP VIEW IF EXISTS `view_queue_with_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_queue_with_patients` AS select `q`.`queue_id` AS `Queue_ID`,`q`.`patient_id` AS `Patient_ID`,`p`.`full_name` AS `Patient_Name`,`p`.`address` AS `Address`,`p`.`age` AS `Age`,`p`.`sex` AS `Sex`,`p`.`civil_status` AS `Civil_Status`,`p`.`patient_contact_number` AS `Patient_Contact_Number`,`p`.`emergency_contact_number` AS `Emergency_Contact_Number`,`q`.`queue_number` AS `Queue_Number`,`q`.`status` AS `Status`,`q`.`created_at` AS `Queued_At`,`q`.`finished_at` AS `Finished_Time`,`p`.`referred_by` AS `Referred_By` from (`queue` `q` join `patients` `p` on((`q`.`patient_id` = `p`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_queue_with_patients_original`
--

/*!50001 DROP VIEW IF EXISTS `view_queue_with_patients_original`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_queue_with_patients_original` AS select `q`.`queue_id` AS `queue_id`,`q`.`patient_id` AS `patient_id`,`p`.`full_name` AS `full_name`,`p`.`address` AS `address`,`p`.`age` AS `age`,`p`.`sex` AS `sex`,`p`.`civil_status` AS `civil_status`,`p`.`patient_contact_number` AS `patient_contact_number`,`p`.`emergency_contact_number` AS `emergency_contact_number`,`q`.`queue_number` AS `queue_number`,`q`.`status` AS `status`,`q`.`created_at` AS `created_at`,`q`.`finished_at` AS `finished_at`,`p`.`referred_by` AS `referred_by` from (`queue` `q` join `patients` `p` on((`q`.`patient_id` = `p`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-29 16:16:58
