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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1917 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autocomplete_entries`
--

LOCK TABLES `autocomplete_entries` WRITE;
/*!40000 ALTER TABLE `autocomplete_entries` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_record_history`
--

LOCK TABLES `health_record_history` WRITE;
/*!40000 ALTER TABLE `health_record_history` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`),
  UNIQUE KEY `test_name_UNIQUE` (`test_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_items`
--

LOCK TABLES `other_items` WRITE;
/*!40000 ALTER TABLE `other_items` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`patient_id`, `full_name`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `patient_contact_number`, `emergency_name`, `emergency_contact_number`, `emergency_relationship`, `created_at`, `photo`, `referred_by`) VALUES (2354,'s',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2025-12-03 00:32:50',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_backup`
--

LOCK TABLES `patients_backup` WRITE;
/*!40000 ALTER TABLE `patients_backup` DISABLE KEYS */;
INSERT INTO `patients_backup` (`backup_id`, `patient_id`, `full_name`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `patient_contact_number`, `emergency_name`, `emergency_contact_number`, `emergency_relationship`, `photo`, `deleted_at`) VALUES (344,2008,'Tolentino, Aaron Joshua M.','Calinog Iloilo','1995-11-25',30,'M','Single','09670277266','Arlene M Untaran. ','09670277266','Mother',NULL,'2025-12-03 00:28:27'),(345,2009,'Villarma, Genefer G.','Tagbak Jaro','1973-09-10',52,'F','Single','09308736313','','','',NULL,'2025-12-03 00:28:27'),(346,2010,'Piansay, Edgar Jr. V.','Lopez, Jaena, Norte','1972-03-26',53,'M','Single','09177962152','','','',NULL,'2025-12-03 00:28:27'),(347,2011,'Monares, Ma. Jazel C.','Pandac Pavia','1978-06-06',47,'F','Single','09940143448','','','',NULL,'2025-12-03 00:28:27'),(348,2012,'Velando, Lawrence Michael A.','Guadalupe Janiuay Iloilo','1995-11-24',29,'M','Single','09625393368','','','',NULL,'2025-12-03 00:28:27'),(349,2013,'Cachuela, Grace C.','45 R Dicen St Lapaz','1977-01-28',48,'F','Single','09216099508','','','',NULL,'2025-12-03 00:28:27'),(350,2014,'Pendon, Mary Annie B.','Bliss Caingin La Paz','2017-04-10',8,'F','Single','09106044529','Chona B Pendon. ','09106044529','Mother',NULL,'2025-12-03 00:28:27'),(351,2015,'Toong, Robert James T.','Tigbauan Iloilo','1988-02-07',37,'M','Single','09692445818',NULL,'','',NULL,'2025-12-03 00:28:27'),(352,2016,'Singh, Gurpreet D.','Mandurriao','1985-08-22',40,'M','Married','09158542669','','','',NULL,'2025-12-03 00:28:27'),(353,2017,'Jadan, Susan G.','Tacas Jaro','1959-11-21',65,'F','Married','09469474508','','','',NULL,'2025-12-03 00:28:27'),(354,2018,'Cabaya, Rex Jr. V.','San Isidro, Jaro','2007-03-17',18,'M','Single','09122757879','','','',NULL,'2025-12-03 00:28:27'),(355,2019,'Jarbadan, Juvan Jr. A.','Dumangas','2021-01-20',4,'M','Single','09429198954','','','',NULL,'2025-12-03 00:28:27'),(356,2020,'De Los Santos, Arjoe M.','Jaro','1998-03-10',27,'M','Married','09562937351','','','',NULL,'2025-12-03 00:28:27'),(357,2021,'Lubis, Judy N.','Pototan','1964-01-10',61,'F','Married','09500334401','','','',NULL,'2025-12-03 00:28:27'),(358,2022,'Cabuhay, John Vincent A.','Capiz','1988-04-28',37,'M','Single','09943283948','','','',NULL,'2025-12-03 00:28:27'),(359,2023,'Brillantes, Kristel Arianne S.','Btac. Nuevo','2007-07-20',18,'F','Single','09930908561','','','',NULL,'2025-12-03 00:28:27'),(360,2024,'Tobongbanua, Edzey P.','Pavia','2018-07-03',7,'M','Single','09673747124','','','',NULL,'2025-12-03 00:28:27'),(361,2025,'Co, Catherine B.','San Juaquin','1970-02-23',55,'F','Single','09262465898','','','',NULL,'2025-12-03 00:28:27'),(362,2026,'De Chavez, Emee D.','Passi City','1982-07-02',43,'F','Married','09398920923','','','',NULL,'2025-12-03 00:28:27'),(363,2027,'Cagampang, Quirico C.','Leon Iloilo','1973-08-24',52,'M','Married','09089575612','','','',NULL,'2025-12-03 00:28:27'),(364,2028,'Canas, Corazon C.','Maribong, Lambunao','1959-11-05',65,'F','Single','09956435605','','','',NULL,'2025-12-03 00:28:27'),(365,2029,'Salado, Leanne Ma. Abigail P.','Buenavista, Guimaras','2000-12-20',24,'F','Single','09691454698','','','',NULL,'2025-12-03 00:28:27'),(366,2030,'Infante, Dolores S.','Jaro','1934-03-25',91,'F','Widowed','09278170053','','','',NULL,'2025-12-03 00:28:27'),(367,2031,'Apura, Ariella A.','Anilao','2022-07-09',3,'F','Single','09308879061','','','',NULL,'2025-12-03 00:28:27'),(368,2032,'Zamudio, Larry G.','Molo, Iloilo City','1974-09-06',51,'M','Married','09466110131','','','',NULL,'2025-12-03 00:28:27'),(369,2033,'Alcantara, Ramil P.','Pavia','1969-02-27',56,'M','Married','09082770229','','','',NULL,'2025-12-03 00:28:27'),(370,2034,'Alanan, Thaniel O.','Lemery','1970-07-20',55,'M','Married','09625297499','','','',NULL,'2025-12-03 00:28:27'),(371,2035,'Nawanao, Cherrylyn A.','Lambunao','1994-07-22',31,'F','Single','09957342064','','','',NULL,'2025-12-03 00:28:27'),(372,2036,'Unternahrer, Johnny Mark A.','Molo, Iloilo City','1985-06-25',40,'M','Single','09628168203','','','',NULL,'2025-12-03 00:28:27'),(373,2037,'Dieminger, Karl Heinz W.','Jaro Iloilo City','1943-10-21',81,'M','Widowed','09307790431','','','',NULL,'2025-12-03 00:28:27'),(374,2038,'Quiling, Joevy C.','Balabag, Pavia','1975-04-21',50,'M','Married','09481625400','','','',NULL,'2025-12-03 00:28:27'),(375,2039,'Fagarita, Rhian Dhenniel S.','Sto. Nino, San Miguel, Iloilo','2011-11-02',13,'F','Single','09631271970','Rhea S Fagarita. ','09631271970','Mother',NULL,'2025-12-03 00:28:27'),(376,2040,'Seruelo, Maricris A.','Democracia, Jaro','1972-10-27',52,'F','Married','09300433372','','','',NULL,'2025-12-03 00:28:27'),(377,2041,'Suarez, Evelyn F.','Leganes, Iloilo','1964-01-21',61,'F','Single','09128763028','','','',NULL,'2025-12-03 00:28:27'),(378,2042,'Lorilla, Roi Yisrael P.','Jaro Iloilo City','2016-08-02',9,'M','Single','09603354986','','','',NULL,'2025-12-03 00:28:27'),(379,2043,'Yap, Rayner A.','Jaro Iloilo City','1976-10-01',49,'M','Married','09209611346','','','',NULL,'2025-12-03 00:28:27'),(380,2044,'Hiponia, Rhoan I.','Pavia, Iloilo','1989-12-18',35,'M','Married','09171793577','','','',NULL,'2025-12-03 00:28:27'),(381,2046,'Rosas, Leonora A.','Jaro Iloilo City','1976-05-28',49,'F','Married','09177960194','','','',NULL,'2025-12-03 00:28:27'),(382,2047,'Javier, Gilda C.','Jayme St. Jaro','1967-10-10',58,'F','Married','09109181848','','','',NULL,'2025-12-03 00:28:27'),(383,2049,'Banares, Karl Benjie D.','Arevalo, Iloilo City','1974-10-15',50,'M','Married','09778577200','','','',NULL,'2025-12-03 00:28:27'),(384,2050,'Cardinal, Kate Chriezl M.','Imbang, Passi','2013-09-13',12,'F','Single','09993798018','','','',NULL,'2025-12-03 00:28:27'),(385,2051,'Calaman, John Andy P.','Pavia, Iloilo','1990-01-08',35,'M','Married','09260678877','','','',NULL,'2025-12-03 00:28:27'),(386,2052,'Gambalan, Elynor Grace B.','La Paz','1984-01-24',41,'F','Married','09177220625','','','',NULL,'2025-12-03 00:28:27'),(387,2053,'Cantero, Monje Val C.','Leon Iloilo','1989-02-14',36,'M','Single','09352521784','','','',NULL,'2025-12-03 00:28:27'),(388,2054,'Celmar, Elmer Jr. A.','Dingle, Iloilo','2005-03-24',20,'M','Single','09099871932','','','',NULL,'2025-12-03 00:28:27'),(389,2055,'Kumar, Pardeep Jr. D.','Jaro Iloilo City','1988-05-08',37,'M','Single','09301274555','','','',NULL,'2025-12-03 00:28:27'),(390,2056,'Lagamon, Ronnie A.','Anilao, Iloilo','1960-04-03',65,'M','Single','09393245168','','','',NULL,'2025-12-03 00:28:27'),(391,2057,'Balagosa, John Irwin F.','Benedicto, Jaro','1995-06-08',30,'M','Single','09157576732','','','',NULL,'2025-12-03 00:28:27'),(392,2058,'Garcia, Aniela C.','La Paz','2008-12-05',16,'F','Single','09778038810','Evita C Garcia. ','','Mother',NULL,'2025-12-03 00:28:27'),(393,2059,'Bernal, Arnie A.','Cawayan, Carles','1973-06-17',52,'F','Married','09707148138','','','',NULL,'2025-12-03 00:28:27'),(394,2060,'Sibonga, Angelo L.','Cabatuan','2009-12-09',15,'M','Single','09917243969','Jasmine L Sibonga. ','09924123884','Mother',NULL,'2025-12-03 00:28:27'),(395,2061,'Castelo, John Martin D.','Tabuc Suba, Jaro','1996-10-02',29,'M','Single','09176277720','','','',NULL,'2025-12-03 00:28:27'),(396,2062,'Castelo, Joanne Marie D.','Tabuc Suba, Jaro','1959-10-21',65,'F','Married','09176277720','','','',NULL,'2025-12-03 00:28:27'),(397,2063,'Tayona, Jyra S.','Tacas Jaro','1991-03-01',34,'F','Single','09205073730','','','',NULL,'2025-12-03 00:28:27'),(398,2064,'Siason, Pedro D.','Commission Civil, Jaro','1947-12-23',77,'M','Married','09209454565','','','',NULL,'2025-12-03 00:28:27'),(399,2065,'Pongan, Jann Christian P.','Jaro Iloilo City','2005-01-24',20,'M','Single','09776697152','','','',NULL,'2025-12-03 00:28:27'),(400,2066,'Fabiana, Ma. Rena B.','Jaro Iloilo City','1970-09-29',55,'F','Married','09468611193','','','',NULL,'2025-12-03 00:28:27'),(401,2067,'Aguilano, Glenn B.','Binalbagan, Negros Occ','1989-03-03',36,'M','Married','09479718460','','','',NULL,'2025-12-03 00:28:27'),(402,2068,'Jimenez, Diego M.','Mandurriao','1951-09-24',74,'M','Married','09125470449','','','',NULL,'2025-12-03 00:28:27'),(403,2069,'Castronuevo, Antonio C.','Benedicto, Jaro','1957-06-13',68,'M','Married','09489785513','','','',NULL,'2025-12-03 00:28:27'),(404,2070,'Cardinal, Liezel M.','Passi City','1975-10-08',50,'F','Married','09993798018','','','',NULL,'2025-12-03 00:28:27'),(405,2071,'Arroyo, Tessie M.','Dumarao, Capiz','1956-07-06',69,'F','Married','09993798018','','','',NULL,'2025-12-03 00:28:27'),(406,2072,'Buzz, Duzy Jr. G.','Buntatala Jaro, Iloilo City','2002-04-27',23,'M','Single','09511365191','','','',_binary 'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0JFIF\0\0`\0`\0\0Ã¯Â¿Â½Ã¯Â¿Â½\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342Ã¯Â¿Â½Ã¯Â¿Â½\0C			\r\r2!!22222222222222222222222222222222222222222222222222Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Y\"\0Ã¯Â¿Â½Ã¯Â¿Â½\0\0\0\0\0\0\0\0\0\0\0	\nÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\0\0\0}\0!1AQa\"q2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#BÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½$3brÃ¯Â¿Â½	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\0\0\0\0\0\0\0	\nÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\0\0w\0!1AQaq\"2Ã¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	#3RÃ¯Â¿Â½brÃ¯Â¿Â½\n$4Ã¯Â¿Â½%Ã¯Â¿Â½\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\0\0?\0Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½AEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEÃ„Â«Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‚Â¢Ã¯Â¿Â½&Ã¯Â¿Â½.!Ã¯Â¿Â½GÃ¯Â¿Â½%FtÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½	o\\Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½vW.pAÃ¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃªÂªÂ°]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\rXÃªÂ¨Â¢Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½#AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¢â€“Â¾yÃ¯Â¿Â½Ã¯Â¿Â½Ã„Â©Ã¯Â¿Â½Ã¯Â¿Â½r+M:VM:	;yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½hWÃ¯Â¿Â½PÃÂ¬Ã¯Â¿Â½Ã¯Â¿Â½Ãâ€¦XÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@`xÃ¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‡Â¡Ã¯Â¿Â½Ã¯Â¿Â½$~hcÃ¯Â¿Â½Ã¯Â¿Â½G!kÃ¯Â¿Â½e\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Yf=+Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½4	Ã¯Â¿Â½ÃƒÂ¡Ã¯Â¿Â½Ã‰Â­8Ã¯Â¿Â½IÃ¯Â¿Â½ÃœÅ’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½$l25Ã¯Â¿Â½Ã¯Â¿Â½sÃˆÂ¶CÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½G*z\Z\0Ã¯Â¿Â½Ã¯Â¿Â½+>Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½%g[Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½A{PÃ¯Â¿Â½E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE2YÃ¯Â¿Â½Ã¯Â¿Â½wHÃ¯Â¿Â½GÃ¯Â¿Â½\09Ã¯Â¿Â½QÃ¯Â¿Â½\nÃ¯Â¿Â½2IÃ¯Â¿Â½^Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½jSÃ¯Â¿Â½\'KÃ¯Â¿Â½+Ã„Â²/YÃ¯Â¿Â½Ã’ÂºOxÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½K;\"Ã¯Â¿Â½BNÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½O	yXÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½MÃŠâ€™8<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½a	Ã¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½=r$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½P>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½E(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0+Ã‰Â¾.LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½+Ã¯Â¿Â½kÃ¯Â¿Â½~#Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½(\Z<Ã¯Â¿Â½Ã¯Â¿Â½lfÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GLÃ¯Â¿Â½Ã¯Â¿Â½ÃËœ`HÃ¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½Ã¯Â¿Â½(3Ã¯Â¿Â½vÃ¯Â¿Â½qÃ¯Â¿Â½5Ã¯Â¿Â½hw`ÃˆÅ¾Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½hi{Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½>B}*ÃÅ¸,,<Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\n=Ã¯Â¿Â½Ã¯Â¿Â½Wf}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Z\rZÃ¯Â¿Â½K\ZÃ¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½KÃ˜ËœÃ¯Â¿Â½sÃ¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½7=EiÃ¯Â¿Â½ uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½BFpÃ†ÂhÃ¯Â¿Â½9Ã‡Â½.Ã¯Â¿Â½nÃ™Â QIÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½d~T\0Ã¯Â¿Â½QE\0QE\0T77vÃ¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½j2ZF\0WÃ¯Â¿Â½|eÃ°Â¶â€œËœÃ¯Â¿Â½%Ã¯Â¿Â½SÃ¯Â¿Â½cÃ¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½ocÃ¯Â¿Â½Ã¯Â¿Â½IIÃ¯Â¿Â½GTQÃÅ½|Ã¯Â¿Â½|nÃ¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½-6Ã¯Â¿Â½Ã¯Â¿Â½MR0X1Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½/Ã¯Â¿Â½MwXg}GUÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+HvÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}Q}Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‚Â³Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½)sÃ¯Â¿Â½QÃ¯Â¿Â½,_<#<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½3[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãœâ€¢]Ã¯Â¿Â½!aÃ¯Â¿Â½@IÃ¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JdI-Ã¯Â¿Â½Ã¯Â¿Â½[y%Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½?G0Ã¯Â¿Â½/3Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½M#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½XÃ¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½V=oIÃ¯Â¿Â½Ã¯Â¿Â½kFÃ¯Â¿Â½OÃ¯Â¿Â½SÃ¯Â¿Â½3UÃŒË†tÃ¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½ÃªÂâ„¢yÃ¯Â¿Â½ÃŒÂ§cÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½@QE\0QE\0QEÃ¯Â¿Â½\0QMÃ¯Â¿Â½?\\RyÃ¯Â¿Â½Ã¯Â¿Â½EFd=Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Y\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\\gTÃ¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jvÃÂ®Co>Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½@Ã¯Â¿Â½K{Ã¯Â¿Â½Ã¯Â¿Â½Ã›Â Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½e$Ã¯Â¿Â½rÃ¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½XJÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½f|ÃœÅ½Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½L%$Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½XÃ¡Ââ€˜Ã¯Â¿Â½]Ã¯Â¿Â½\0Ã¯Â¿Â½$UÃ¯Â¿Â½Ã¯Â¿Â½Ã¦â€”Â®Ã¯Â¿Â½VÃ¯Â¿Â½zP}ÃœÂ¦YTÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½k]BBÃ¯Â¿Â½Ã¯Â¿Â½ZbKvÃ¯Â¿Â½[Ã¯Â¿Â½ Ã¯Â¿Â½ÃÂ¨(Ã¯Â¿Â½Ã¯Â¿Â½kcÃ¯Â¿Â½Ã¨Â¢Å 	\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½OÃ¯Â¿Â½[Ã„Â·={]x/Ã¯Â¿Â½$Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rlÃ¯Â¿Â½Ã¯Â¿Â½f+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,cÃ¯Â¿Â½V:N.Ã¯Â¿Â½JzÃ¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½mx>Ã¯Â¿Â½Ã¯Â¿Â½+|N8Ã¯Â¿Â½jkÃ¯Â¿Â½rÃ–Â¶tÃ¯Â¿Â½Idlc4Ã¯Â¿Â½Ã¯Â¿Â½HR6\'Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½ÃÅ½z\nvÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã›ÂÃ¯Â¿Â½VP9Ã¯Â¿Â½Ã¯Â¿Â½$95Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½sWÃ¯Â¿Â½Ã¯Â¿Â½\\tÃ¯Â¿Â½fÃ¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½93T\"Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½~OÃ¯Â¿Â½Ã“Æ’dÃ¯Â¿Â½jÃ¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½jDbWÃ¯Â¿Â½Ã¯Â¿Â½\0ZX\'Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QJOÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}qJ>Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã…Â³OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GÃˆâ„¢Ã‹Â¿Ã¯Â¿Â½G&Ã¯Â¿Â½_Ã„Â¿\ZÃ¯Â¿Â½Ã¯Â¿Â½L5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½O=Ã¯Â¿Â½Ã’Â·NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãšâ€œi9l{fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½}VÃ¯Â¿Â½+qÃ¯Â¿Â½Ã¯Â¿Â½	Ã‹Â·|Ã¯Â¿Â½MyÃ¯Â¿Â½Ã¯Â¿Â½:\\Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½iÃ¯Â¿Â½cÃ—Â¢Ã¯Â¿Â½ÃƒÂ©Ã¯Â¿Â½+ÃŠÂn/Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&rÃ¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½3hÃ¯Â¿Â½Kq5McTÃ—Â¦Ã¯Â¿Â½kÃ«â€ºÂ¶Ã¯Â¿Â½Ã¯Â¿Â½Ã¨Â£ÂUÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½8?Ã¯Â¿Â½JÃ¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½4F|vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~f;v\\eÃ¯Â¿Â½}3Z	Ã¯Â¿Â½N;\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã’Ëœ0{\nÃ¯Â¿Â½Ã¯Â¿Â½3@AÃ¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½[	Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½S;iÃ¯Â¿Â½Ã¯Â¿Â½cÃžÂ¢x\'ÃŸÂ­hÃ¯Â¿Â½-ÃÂ¨ÃÂ¡YÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½\ZÃ¯Â¿Â½1Ã¯Â¿Â½pvÃ¯Â¿Â½Ã†â€˜Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½PAy\rÃÅ Ã¯Â¿Â½OÃ¯Â¿Â½~,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½S{Ã¯Â¿Â½e<Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ãžâ„¢Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½Ã¡Å¸Å½\ZÃ¯Â¿Â½RÃ¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‡Â®:Ã—Â¨C4W,Ã¯Â¿Â½ÃˆÂ²FÃ¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½[`rG~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZkÃ¯Â¿Â½\rÃ¯Â¿Â½VÃ¯Â¿Â½nYÃ¯Â¿Â½r7Ã¯Â¿Â½Ã¯Â¿Â½KFÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½y=?ZÃ¯Â¿Â½#)SÃ¯Â¿Â½}qEq\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=L(Ã¯Â¿Â½i)Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½CÃ¯Â¿Â½\0Ã¯Â¿Â½]Ã¯Â¿Â½QÃ¯Â¿Â½V\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½\0zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*LÃ¯Â¿Â½Ã¯Â¿Â½\Z\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½U\\Ã¯Â¿Â½\"Ã¯Â¿Â½HxÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ei?.{Ã¯Â¿Â½	[Ã¯Â¿Â½jÃ”Å’7jÃ¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½pÃ¯Â¿Â½mÃ¯Â¿Â½YÃ¯Â¿Â½$Ã¯Â¿Â½!Ã¯Â¿Â½u\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½\0Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½Ãœâ€™Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½s]ÃŸÅ’Ã¯Â¿Â½ <s\\++Ã¯Â¿Â½Ã¯Â¿Â½\08Ã¯Â¿Â½Fk.Ã¯Â¿Â½ÃˆÂ¯RÃ¯Â¿Â½\"<Ã¯Â¿Â½FÃ¯Â¿Â½=cÃ¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½,G+]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½QÃ¯Â¿Â½*Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½?Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½ÃƒÂ¼UÃ¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½z\ZÃ¯Â¿Â½g+tÃ¯Â¿Â½UWÃ¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½ÃŒÂ¸5Ã¯Â¿Â½Ã¯Â¿Â½ZQÃ¯Â¿Â½ÃšÂ±.,\\KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½7ZÃ¯Â¿Â½Ã¯Â¿Â½%\"bCW=kÃ¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½0Ã¯Â¿Â½$yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãœâ€ uÃ’Å¸3Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½>Ã¯Â¿Â½pLÃ¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½3TFÃ¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½eÃ¯Â¿Â½#3Ã¯Â¿Â½z\ZÃ™Å P6Ã¯Â¿Â½X`Ã¯Â¿Â½Ã”Â«yÃ¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½4yÃ¯Â¿Â½lÃ”Å Ã¯Â¿Â½Ã¯Â¿Â½?Ã–Å“Ã¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½|_Ã¯Â¿Â½xGN7ZÃ¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½P//)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½76gÃ¯Â¿Â½8#Ã¯Â¿Â½Y]R4Ã¯Â¿Â½fcÃ¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½c6Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã†Å¸Ã¯Â¿Â½Ã¯Â¿Â½\0xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½M39[XÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½0dÃ¯Â¿Â½*Ã¯Â¿Â½FÃ¯Â¿Â½V>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½{Ã¯Â¿Â½FÃ¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½#dÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½pZÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½\0sÃšÂ´#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½0=jÃ¯Â¿Â½vÃ„Å½1Ã¯Â¿Â½SWaÃ¯Â¿Â½f\\Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½M )Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½0=Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½tNÃ¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½qXÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½jUXÃ¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½]Ã¯Â¿Â½0Ã¯Â¿Â½(7LÃˆâ„¢Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½<oÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½P\r{Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0ÃŸÂºÃ¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½\nÃ¯Â¿Â½dÃ¯Â¿Â½jÃ˜Å’Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½Ã“â€ Ã¯Â¿Â½Ã¯Â¿Â½=1\"Ã¯Â¿Â½@Ã¯Â¿Â½m|Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½[p#Ã¯Â¿Â½?Ã¯Â¿Â½i\0Ã¯Â¿Â½e8Ã¯Â¿Â½DzÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½QÃ¯Â¿Â½Z\0Ã†â€“Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\G$kÃªÂ§Â¦kjHÃâ€˜Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯ÂÆ’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½sFggÃ¯Â¿Â½ÃšÂ«Ã¯Â¿Â½\rhÃ¯Â¿Â½gi\0sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½G\"Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½@Ã¯Â¿Â½fÃ¯Â¿Â½*Ã¯Â¿Â½$lÃ¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½e=Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ubÃ¯Â¿Â½Ã¯Â¿Â½)-5Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½2zoÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã—Â¶Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vsÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½piÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_,Ã¯Â¿Â½OÃ¯Â¿Â½zÃ—â€š/ZÃ¯Â¿Â½n,[Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã—Å¡Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½/Ã’Â¼[Ã¯Â¿Â½%Ãâ€žÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã—Â¥Zw0Ã¯Â¿Â½\\MÃ¯Â¿Â½9Ã¯Â¿Â½R0;GÃ¯Â¿Â½Ã“Â¿Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½NBÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½r)Ã¯Â¿Â½E@Ã‘Æ’gÃ¯Â¿Â½3Ã¯Â¿Â½ naÃ¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½Z3Ã¯Â¿Â½\0Ã¦Â³Â¤QÃ¯Â¿Â½}Ã¯Â¿Â½JgÃ‡Å½Ã¯Â¿Â½cORÃ¯Â¿Â½^Ã¯Â¿Â½UÃ¯Â¿Â½XÃ–â€ Ã¯Â¿Â½wIÃ¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½w\\Ã¯Â¿Â½<Ã¯Â¿Â½x,Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½q*Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‹Â¶@Q{Ã¯Â¿Â½($Ã¯Â¿Â½SÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½5<WOÃ¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½wÃ¯Â¿Â½n\0Ã¯Â¿Â½Ã¯Â¿Â½\nGÃ¯Â¿Â½Ã¯Â¿Â½EQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½HkÃ¯Â¿Â½kÃ¯Â¿Â½<S0o_Ã¯Â¿Â½\0Ã¯Â¿Â½S@Ã¯Â¿Â½Ã…Â2\'Ã¯Â¿Â½gÃ¯Â¿Â½DÃ¯Â¿Â½bGÃœÂ¸ Ã¯Â¿Â½TÃ¯Â¿Â½2Ã„Â¸=Ã¯Â¿Â½Ã…ÂµÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½_5Ã¯Â¿Â½Ã†ÂÃ¯Â¿Â½Ã¯Â¿Â½yw9Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½\r5Ã¯Â¿Â½Ã¯Â¿Â½YbÃ¯Â¿Â½1Ã“Â½WÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½zd\nÃ¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½TnlÃ¯Â¿Â½Ã¯Â¿Â½9<P46Ã˜Â²Ã¯Â¿Â½Ã¯Â¿Â½Ã•â€ V<Uk[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½k\"vÃ¯Â¿Â½2Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½j7sTV\';FÃ¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½|%Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½1ZÃ¯Â¿Â½\"Ã‡ÂÃ¯Â¿Â½ YÃ¯Â¿Â½:Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½kÃ¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½E=Ã¯Â¿Â½Ã–Â­Ã¯Â¿Â½M}{3M4Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½ÃŽËœCÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½+JÃ¯Â¿Â½Ã¯Â¿Â½s8Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½,w5jÃ„Æ’QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RXÃ¯Â¿Â½Ã†Â¨9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½,Ã¯Â¿Â½ÃÂ·Ã¯Â¿Â½\0Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!WÃ¯Â¿Â½Ã¯Â¿Â½vÃâ€¹Ã¯Â¿Â½Ã¯Â¿Â½Ã¤Å¸Â Ã¯Â¿Â½Ã¯Â¿Â½n\nÃ¯Â¿Â½QÃ¯Â¿Â½\"A$Ã¯Â¿Â½\\uÃ¯Â¿Â½Ã¯Â¿Â½J|p*Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:Ã‚Â$Ã¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½\'Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½w0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9ZHÃ¯Â¿Â½fÃ¯Â¿Â½O	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rjÃ¯Â¿Â½Ã¯Â¿Â½sb1Ã¯Â¿Â½FÃ¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½{Ã†ÂªvÃ¯Â¿Â½r!Ã¯Â¿Â½LpÃ›â€”Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½	tÃ¯Â¿Â½Ã¯Â¿Â½GaÃ¯Â¿Â½Ã¯Â¿Â½:PfÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½@RÃ¯Â¿Â½YÃˆÅ½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½sZÃ¯Â¿Â½^tanÃ¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½+Ã¯Â¿Â½0P2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½w:?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½R}Ã¯Â¿Â½#pÃ¯Â¿Â½<~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½lÃ”Â§Ã¯Â¿Â½aqÃ¯Â¿Â½Ã¯Â¿Â½ÃÂRÃ¯Â¿Â½nMÃ¯Â¿Â½ÃžÂÃ¯Â¿Â½\0RhÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½vRÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½,}\rEpÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½36ÃÂ¸aÃ¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃƒÂ»LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½T%eÃ¯Â¿Â½1ÃŠÂ³\'LÃ¯Â¿Â½Ã¯Â¿Â½Ã‡â€™Ã”ÂrWÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½y%Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TsÃ¯Â¿Â½Ã¯Â¿Â½rN8Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½i\"dÃ¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½iÃŽÂ­~\\Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½r/FE*Ã¯Â¿Â½Yj->Ã¯Â¿Â½Ã¯Â¿Â½\0AÃ¯Â¿Â½aÃ¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½VS9*zÃ¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃÂÃ¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½^2Ã¯Â¿Â½Ã¯Â¿Â½4ÃŠÂ¶Ã¯Â¿Â½Ã¯Â¿Â½#2Ã›â€œÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½y!Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã™Æ’CÃ¯Â¿Â½VÃ¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½?-Ã¯Â¿Â½XLÃ¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½uNÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½jÃ¯Â¿Â½;Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã„â„¢Ã¯Â¿Â½VÃ¯Â¿Â½aÃ¯Â¿Â½dÃ¯Â¿Â½vÃ¯Â¿Â½8Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½,dÃ¯Â¿Â½NzÃ¯Â¿Â½uÃÂ¸rh\Z2\'Ã¯Â¿Â½iÃ‡Â½^Ã¯Â¿Â½eÃ¯Â¿Â½\0JSÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½\"QÃ¯Â¿Â½<Ã¯Â¿Â½RÃ¯Â¿Â½L#Ã¯Â¿Â½H\ZÃ¯Â¿Â½>1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½2Ã­ÂÂÃ¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½ÃœÅ½#eÃ¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½4ÃÂ½$Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½<W7Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½30Ã¯Â¿Â½zÃ¯Â¿Â½Ã‡Â·Ã¯Â¿Â½Ã¯Â¿Â½Bh\Z=Ã’Å (Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(C_9xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bCÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_;Ã¯Â¿Â½oÃ¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½YOÃ¯Â¿Â½kc\n{Ã¯Â¿Â½@9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fTÃ¯Â¿Â½:UXc*Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½GCg2Ã¯Â¿Â½Ã‘â€¦nÃ¯Â¿Â½Ã¯Â¿Â½cpÃ¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãˆâ€¢X1Ã¯Â¿Â½Ã¯Â¿Â½exn@#Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãœâ€¡=5VÃ¯Â¿Â½@Ã¯Â¿Â½,Ã¯Â¿Â½U4{Ã¯Â¿Â½`YÃ¯Â¿Â½%iÃ¯Â¿Â½h{Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½HÃ¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½sZ9Ã¯Â¿Â½XÃ¯Â¿Â½Ã’â€¢lgÃ¯Â¿Â½8Ã¯Â¿Â½*9Ã¯Â¿Â½CÃ¯Â¿Â½Ã¯Â¿Â½}MÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½Ã’Â¾bÃ¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½\\_\\Ã¯Â¿Â½\ZCÃ¯Â¿Â½#NÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½LEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½\\\\Ã¯Â¿Â½Ã¯Â¿Â½?\"Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½\ryTEÃ¯Â¿Â½Ã¯Â¿Â½j$Ã¯Â¿Â½Ã¯Â¿Â½erÃ¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½g\'Ã¯Â¿Â½K*Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã›â„¢\0pkZÃ¯Â¿Â½%;BÃ¯Â¿Â½=Ã¯Â¿Â½=Ã¯Â¿Â½ÃÂ·Ã¯Â¿Â½GoTÃ¯Â¿Â½OÃ¯Â¿Â½JÃ¯Â¿Â½}?Ã†Âµ-Ã¯Â¿Â½EÃœÅ½BÃ¯Â¿Â½>iOÃ¯Â¿Â½bÃ¯Â¿Â½TBÃ¯Â¿Â½|Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½E$k4Ã¯Â¿Â½Ã¯Â¿Â½P[Ã¯Â¿Â½Ã¯Â¿Â½taVÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½EÃžÅ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PTÃ¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½|Ã¯Â¿Â½\0Ã¯Â¿Â½QÃ¯Â¿Â½M\0gÃ¯Â¿Â½Ã¯Â¿Â½f*LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¥Â©Â¾Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½OeÃ–â€3Ã¯Â¿Â½[mÃ‹â€ž8Ã¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½@xÃ¯Â¿Â½\08Ã¯Â¿Â½\nQAÃ¯Â¿Â½Ã¯Â¿Â½Ã•ËœÃ¯Â¿Â½Ã¯Â¿Â½X63Ã¯Â¿Â½Ã¯Â¿Â½L(Ã¯Â¿Â½Ã¯Â¿Â½V>Ã¯Â¿Â½y*Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½.nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½20Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½ÃÂµFÃ¯Â¿Â½%uÃ¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½Ã’Â¬EiÃ¯Â¿Â½ÃœÂÃ¯Â¿Â½1E>Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½?xÃ¯Â¿Â½\"Y\ZÃ¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LcpqÃ¯Â¿Â½5$%Ã¯Â¿Â½luF*sulqsÃ¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½JabÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&)Ã¯Â¿Â½Ã¯Â¿Â½Ui\"Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GÃšÂµÃ¯Â¿Â½;Ã¯Â¿Â½fÃ¯Â¿Â½RÃ¯Â¿Â½Ã˜Â©Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½Ã•Â¯Ã¯Â¿Â½Ã‘â„¢zoÃ¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½{v.Ã¯Â¿Â½J78Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&	Ã¯Â¿Â½Ã¯Â¿Â½^Ã•Â¦Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½XÃœËœÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½M$Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:P\"Ã¯Â¿Â½Ã¯Â¿Â½)\"Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½*tÃ¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½ Ã¯Â¿Â½*Ã‘â€™aÃ¯Â¿Â½XKÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½U2)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã—Å \0Ã¯Â¿Â½H>MÃ¯Â¿Â½MÃ¯Â¿Â½+>Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½p:}kME?Ã¯Â¿Â½\'\r8oÃ¯Â¿Â½$Ã¯Â¿Â½$Ã¯Â¿Â½R Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½9Ã™Â¢Ã›Å“Ã®Â¾Å¸Ã¯Â¿Â½jÃÅ¾OÃ¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½HÃ¯Â¿Â½SÃ¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½hF@ uOÃ¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½(XqÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@w\0Ã›ÂºL\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½U;Ã¯Â¿Â½{;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&dua$RÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½,{Ã”Â§5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½>Ã¯Â¿Â½!3Ã¨Â¯â€ ~=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ãªâ€“Æ’mÃ¯Â¿Â½cÃ¯Â¿Â½qÃƒÂcÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½wÃ¯Â¿Â½_#Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½LjÃ¯Â¿Â½fAÃ¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rGOÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<bDe<FkDÃ¯Â¿Â½i+2Ã¯Â¿Â½Ã¯Â¿Â½W&Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½WÃŒÂÃ¯Â¿Â½eLÃ¯Â¿Â½d=Ã¯Â¿Â½Ã¯Â¿Â½9Ã›Â°~Ã“Â´Ã¯Â¿Â½Ã•â€¹LÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½17,Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½Cg7Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½AZÃ¦Â´Â9.nÃ¯Â¿Â½w\\Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½C\nkÃ¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?uqLÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½`Ã¯Â¿Â½c]_Ã¯Â¿Â½7Ã¯Â¿Â½\\(Ã¯Â¿Â½\0Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½rÃŽÂ½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½tQEÃ¯Â¿Â½Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Ã¯Â¿Â½tÃ¯Â¿Â½+Ã¯Â¿Â½uhÃ¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã—Â¹7Ã¯Â¿Â½oÃ¯Â¿Â½xÃ¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½.AÃ¯Â¿Â½P5Ã¯Â¿Â½_Ã¯Â¿Â½qÃ–Â Ã¯Â¿Â½Ã’Â¼Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zUÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½sSiÃ¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½4Ãˆâ€¡N*Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{tÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½VZÃ¯Â¿Â½6Ã¯Â¿Â½\nÃ¯Â¿Â½P2Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WqÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ImlÃ¯Â¿Â½\ZÃ¯Â¿Â½:sY7Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<w\r2ÃÂ£6wÃ–Å¡\\Ã¯Â¿Â½VÃ¯Â¿Â½B(,~Ã¯Â¿Â½5VÃ¯Â¿Â½Ãœâ€žÃ–Â±>\"Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½=FEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½\'Ã¯Â¿Â½;N=Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½<K{Ã¯Â¿Â½HIYÃ¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8QÃ¯Â¿Â½RYÃ¯Â¿Â½Ã¯Â¿Â½ÃÂ¸Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŽÂ¶]Ã¯Â¿Â½(Ã¯Â¿Â½ÃƒÅ¾+jÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½+#Ã¯Â¿Â½+QÃ¯Â¿Â½Ã¯Â¿Â½vvÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}}{Ã¯Â¿Â½GoÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TQÃ¯Â¿Â½>Ã¯Â¿Â½zÃ¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½>wÃŒâ€žÃ¯Â¿Â½BSWbÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½\0}Ã¯Â¿Â½CmÃ¯Â¿Â½,bÃ¯Â¿Â½Ã¯Â¿Â½Ã‹ÂÃ¯Â¿Â½jÃ¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½B\0u\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½#Ã¯Â¿Â½7w8Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½\0\ZFÃ¯Â¿Â½Ã¯Â¿Â½p:Ã¯Â¿Â½Ã¯Â¿Â½Ã’Â½Ã¯Â¿Â½Ã¯Â¿Â½)sÃ¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½jÃÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\"1Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½U\0Ã„â€¡Ã¯Â¿Â½Ã¯Â¿Â½jÃ˜Â³Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½pXÃ¯Â¿Â½Ã¯Â¿Â½Ã’Ëœ%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½cWÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½r>Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‡â€yÃ¯Â¿Â½/Ã¯Â¿Â½>Ã¯Â¿Â½+NiÃ¯Â¿Â½,Ã¯Â¿Â½S!Ã¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½UIÃ¯Â¿Â½Ã¯Â¿Â½LF\n)Ã¯Â¿Â½9cHi>Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½ÃŠÂ£Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½6Ã¯Â¿Â½L1Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½\"g\r\"Ã¯Â¿Â½$>Ã¯Â¿Â½Ã¯Â¿Â½Ã–Å“ZmÃ¯Â¿Â½]HÃ¯Â¿Â½{/oÃ†Âhd(9Ã¯Â¿Â½Ãâ€˜SÃ¯Â¿Â½Ã”Â¿oÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½-Ã¯Â¿Â½8BAÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½<cÃ¯Â¿Â½1hÃ¯Â¿Â½3X29{I1Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1/Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½zA*Ã¯Â¿Â½*Ã¯Â¿Â½qÃ¯Â¿Â½Ã‰â€¹Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã”â€Ã¯Â¿Â½#Ã¯Â¿Â½kÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ¶Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½]Ã¥Â¸Â·Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½?Wn4ylÃ¯Â¿Â½Ã¯Â¿Â½24~Ã¯Â¿Â½<\ZHÃ¯Â¿Â½!1Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½3fkgÃ¯Â¿Â½H?Q6Ã™ËœG:Ã¯Â¿Â½VÃ¯Â¿Â½Ãâ€š.-X,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½P#=Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½\\RNÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã‚Â¬|Ã’Â«ZMÃ¯Â¿Â½ÃŠÂ§Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½UÃŠâ„¢C Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½\0=hÃ¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½aÃŠâ€˜Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½bEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½r|Ã¯Â¿Â½=jÃÅ¡/Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½Ãâ€“ rÃ¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½WtÃ¯Â¿Â½Ã¯Â¿Â½iH	~?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½oPÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½fÃ¯Â¿Â½gq#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GzÃ—Â»QÃ¯Â¿Â½nÃ¯Â¿Â½V=Ã”Â6Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½ffÃ¯Â¿Â½`Ã¯Â¿Â½(qÃ¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|PoÃ¯Â¿Â½1&Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>S}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½Ã—Â°Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½\'JÃ¯Â¿Â½~Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½knÃ¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½\08Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½g5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1\"Ã¯Â¿Â½nÃ¯Â¿Â½/Ã¯Â¿Â½Ã–Â¶.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1G?{&wcRYÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½ *-G\nÃ¯Â¿Â½p1RÃ¯Â¿Â½#Ã¯Â¿Â½@R)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã£Â©â€ºÃ¯Â¿Â½Ã¯Â¿Â½pWÃŸÂ»Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\03Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jmÃ¯Â¿Â½Ãâ€œ\\7Ã¯Â¿Â½Ã¯Â¿Â½9;Ã¯Â¿Â½Ã¯Â¿Â½zS%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½\0Ã¯Â¿Â½#^w0/ t5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&\'Ã¯Â¿Â½y\ZC]OÃ¯Â¿Â½Ã¨Â¢Å dÃ¯Â¿Â½Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½x#Ã¯Â¿Â½5Ã¯Â¿Â½\0aÃ¯Â¿Â½}Ã¯Â¿Â½\0qÃ¯Â¿Â½Ã¯Â¿Â½Ã³Â§â€°Â\r~Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½h\ZÃ¯Â¿Â½lÃ“Â¤Ã¯Â¿Â½XcÃ¯Â¿Â½Ã‡Å¡Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½&\nÃ¯Â¿Â½\0fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½YGADXÃ¯Â¿Â½?8Ã¯Â¿Â½fÃ¯Â¿Â½rÃŠâ€¹	VÃ¯Â¿Â½ZÃ˜Å Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7@yÃ¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$wÃ¯Â¿Â½Ã¯Â¿Â½g>Ã¯Â¿Â½Ã¯Â¿Â½j;Ã¯Â¿Â½Ã¯Â¿Â½ÃœÂ¶1Ã¯Â¿Â½AÃ¯Â¿Â½ÃŽÂ¯vr?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½\0Ã¯Â¿Â½{0Ã¯Â¿Â½<zWÃ¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½6Ã¯Â¿Â½	Ã¯Â¿Â½%Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½f\rÃ¯Â¿Â½JÃ¯Â¿Â½Ãâ€¹Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã±Â½Â½Ë†Ã¯Â¿Â½4vVÃ¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½r@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TcÃ¯Â¿Â½Ã¯Â¿Â½Ã’Âº;~L{r}?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½DÃ‚Å’`zÃ¯Â¿Â½\0Ã¯Â¿Â½]]Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~uÃ¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½MÃ¯Â¿Â½	^sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?RÃ‚Å’dÃ˜Â¿xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=M:Ã¯Â¿Â½RÃ¯Â¿Â½y_Ã¯Â¿Â½V5}#XÃ¯Â¿Â½,1Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½4Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½4/.qÃ¯Â¿Â½m_vÃ¯Â¿Â½&Ã¯Â¿Â½Ã„Â¹\\6Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½({Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^{Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½rÃ¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½NXÃ¯Â¿Â½idEg4Ã¯Â¿Â½\0Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½WtDÃ¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½64Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½ \" Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.C=Ã¯Â¿Â½Ã¯Â¿Â½(ÃŒâ€˜tR:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŸÂ¼Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cA#Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½nsÃ•Å¡Ã¯Â¿Â½EÃ¯Â¿Â½HÃ˜Â¿Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½QÃ‚Âª]BÃ¯Â¿Â½Ã¯Â¿Â½\ra]^Ã‰Âª0UcÃ¯Â¿Â½?Ã¯Â¿Â½\Z Ã¯Â¿Â½EÃ¯Â¿Â½Ã¯Â¿Â½R8TCjÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tvÃ¯Â¿Â½Ã¯Â¿Â½?4Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½p+BÃ¯Â¿Â½KÃ¯Â¿Â½qÃ”Å¾Ã•Â¿Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½FÃ¯Â¿Â½wQÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½O0<Ã¡ÂºÅ’Ã¯Â¿Â½Ã¯Â¿Â½t\ZÃ¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½o6Ã¯Â¿Â½\"Ã¯Â¿Â½FÃ¯Â¿Â½e*KÃˆÂ¡Ã¯Â¿Â½Ã¯Â¿Â½Ã•â€˜}Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½H?Ã¯Â¿Â½Ã¯Â¿Â½iÃ™Â¢yÃ¯Â¿Â½-Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½lc`3Ã¯Â¿Â½\'Ã¯Â¿Â½kRÃ’Â¥IwEÃ¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½x5<Ã–â€”V,^Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½kÃ¯Â¿Â½1XÃ¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ct4Ã¯Â¿Â½fÃ¯Â¿Â½FmÃ¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½ZÃâ€¢dÃ¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½kÃ¯Â¿Â½>nÃ¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½-Ãâ€3\rÃ¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½\0\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½E2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZLÃ¯Â¿Â½rÃ¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½}*mJÃ¯Â¿Â½yk}j@eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KNÃ¯Â¿Â½<Oo1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4|Ã¯Â¿Â½jo*Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ³pÃ¯Â¿Â½sÃ¯Â¿Â½@j Ã¯Â¿Â½]Ã™Â¶F2@?Ã¯Â¿Â½c>Ã¯Â¿Â½.0FÃ‰â€”rÃ¯Â¿Â½\ZÃŽâ€˜<Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã˜Å Ã¯Â¿Â½vgÃ¯Â¿Â½Ã¯Â¿Â½L|Ã¯Â¿Â½>Ã’Â«I	3HÃ¯Â¿Â½NyÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃÅ Ã¯Â¿Â½4_\'z~Ã¯Â¿Â½Ã¯Â¿Â½I2Ã¯Â¿Â½	Ã¯Â¿Â½Ã‚Â Ã¯Â¿Â½mbxoÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½<Ã¯Â¿Â½Ã³Å’Æ’Å¾Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã•â€œÃ¯Â¿Â½#WC~Ã¯Â¿Â½L#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½<w:\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Y}Ã¯Â¿Â½GÃ¯Â¿Â½\ZfÃ¯Â¿Â½a~Ã„â€¦Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½F#Ã¯Â¿Â½AZ\'Ã¯Â¿Â½K\'mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uÃˆâ€ºÃ³Â¦â€°â€“Ã¯Â¿Â½Ã¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8e?\ZÃ¯Â¿Â½Ã¯Â¿Â½)`\0Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã–ÂÃ¯Â¿Â½Ã¯Â¿Â½ +CÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ™Å Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½fSÃ¯Â¿Â½SoÃ¯Â¿Â½)36Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½Ã§Å’Â¯ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½`Ã‹Âª]Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½[rWÃ¯Â¿Â½Ã¯Â¿Â½Rh\0`Ã¯Â¿Â½Ã¯Â¿Â½Ã¢Â¥Â´\'P;Ã¯Â¿Â½yÃ¯Â¿Â½vÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\\mÃ¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½uveÃ¯Â¿Â½<OqÃ¯Â¿Â½\0\\Ã¯Â¿Â½\0Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Ã¯Â¿Â½Ã¯Â¿Â½OÃ’Â¾}Ã¯Â¿Â½mKÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OO0Ã¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½OÃ’Â¼7Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rzÃ¯Â¿Â½Ã¦â€šâ€“Ã¯Â¿Â½H,bhÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½GÃ¯Â¿Â½mQLmEW;[Ã¯Â¿Â½>Ã¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½ÃŸâ€š(Ã¯Â¿Â½m]Ã¯Â¿Â½|Ã¯Â¿Â½Ã’Âº+K9Ã¯Â¿Â½6`NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½b{Ã¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½pJqUÃ¤Âºâ€˜[5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã›Â³Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½zÃ¯Â¿Â½kÃ¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃšÂ­Ã‡Â­Ã¯Â¿Â½GÃ¯Â¿Â½\0|Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½aGjXp@Ã‰Â¯Ã¯Â¿Â½uI|Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½Ã˜Å¡Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¦Â¶Ë†Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½\"Ã¯Â¿Â½lÃ¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½<1Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½C]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½f.Ã¯Â¿Â½Ã¯Â¿Â½+3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½K08Ã¯Â¿Â½76GÃ¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8 Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã›Â¾2Ã¯Â¿Â½`nÃ¯Â¿Â½:Ã¯Â¿Â½IÃ¯Â¿Â½9Ã¯Â¿Â½Ã—Å¡EÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½19*Ã¯Â¿Â½ÃšÂ¬Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½\'Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½H9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½O?Ã¯Â¿Â½\nÃ¯Â¿Â½Ã›Å¡\0uÃ¯Â¿Â½Ã¯Â¿Â½HN[Ã¯Â¿Â½Ã¯Â¿Â½\0&Ã¯Â¿Â½Ã¯Â¿Â½-eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½WÃ¯Â¿Â½_Ã¯Â¿Â½Uk2%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½i-Ã¯Â¿Â½Ã—Ây/\n\"xÃ‡Â­Ã¯Â¿Â½44K$Ã¯Â¿Â½43	Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã‹Â½nÃ¯Â¿Â½Ã¯Â¿Â½yP;F\0Ã¯Â¿Â½s7Ã¯Â¿Â½ÃÂ¿Ã¯Â¿Â½,Ã¯Â¿Â½yyÃ¯Â¿Â½Ã¯Â¿Â½jÃ®Å¸Â $rÃ¯â€˜Â·1Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½wbÃ¯Â¿Â½RÃ¯Â¿Â½igÃ¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+XÃ¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½LvÃ¯Â¿Â½#Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½:}N8Ã¯Â¿Â½Ã¯Â¿Â½T\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½ÃžË†Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½#QÃ‰ÂªÃ¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+2Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½|Ã¯Â¿Â½SÃ¯Â¿Â½Ogd.Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½~Ã¯Â¿Â½(%Ã¯Â¿Â½Ã¯Â¿Â½\0mÃ¯Â¿Â½[%\\Ã¯Â¿Â½jÃ¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dÃœÂ¹Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½v$2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2GÃ¯Â¿Â½FSÃ¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½~VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WSÃ¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½\0Ã—Â¨Ã¯Â¿Â½5Ã¯Â¿Â½oÃ¯Â¿Â½8VÃ¯Â¿Â½Ã‡Â®Ã›Â¸Ãƒâ‚¬%Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½qqÃ¯Â¿Â½Ã…Â¶Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½f Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½6i=Ã¯Â¿Â½u!Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃƒÂ¿Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½j0YÃ¯Â¿Â½+2Ã¯Â¿Â½Ã¯Â¿Â½aÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã†â€¡?Ã¯Â¿Â½0Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½ÃƒÂ®Ã¯Â¿Â½q@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{IÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZHÃ¯Â¿Â½uBzÃ¯Â¿Â½/Ã¯Â¿Â½Ã¬â€”Â©pÃ¯Â¿Â½Ã¯Â¿Â½~TÃ¯Â¿Â½Ã¯Â¿Â½i*-Ã…Â»Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãšâ„¢+Ã¯Â¿Â½3p9b3Ã¯Â¿Â½\"Ã¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uosÃ¯Â¿Â½Ã¯â€¢Âª;Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½0}Ã¯Â¿Â½Ã¯Â¿Â½\0?Ã¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LI:Ã¯Â¿Â½DÃ¯Â¿Â½Ã¯Â¿Â½Z\0cDÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½pÃ¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½-Ã¯Â¿Â½jÃ’Â¼aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½TÃ¥â€žÂµÃ¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½zÃ¯Â¿Â½ÃžÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½|Ã„ÂªÃ¯Â¿Â½bcÃ¯Â¿Â½ \\Ã¯Â¿Â½Ã¯Â¿Â½+EÃ¯Â¿Â½)Ã¯Â¿Â½{lqÃ¯Â¿Â½YÃ¯Â¿Â½+Ã¥Â¤Å ÃŒâ€¡rÃ¯Â¿Â½{P-Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½MuÃ¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã®Â¿â„¢Ã¯Â¿Â½EÃ¯Â¿Â½S Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½p[Ã¯Â¿Â½VJ\rÃ¯Â¿Â½7Ã¯Â¿Â½hÃžÂ¾-Ã¯Â¿Â½UHÃ¯Â¿Â½R513Ã¨ÂÆ’Ã¯Â¿Â½\"OÃ¯Â¿Â½!Ã¯Â¿Â½-ÃŠÂ¿AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¨â€°â€šÃ¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½kÃˆâ€°Ã¯Â¿Â½cÃ¯Â¿Â½ Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½%RÃ¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‡Â¸Ã¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½]Ã¯Â¿Â½Y^Ã¯Â¿Â½~jbg7Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½M Ã¯Â¿Â½\0vÃ¯Â¿Â½kÃŽÂµ\rFYcRÃ¯Â¿Â½Ã¯Â¿Â½\'5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½s4 pÃ¯Â¿Â½9Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½C#Ã¯Â¿Â½%$Ã¯Â¿Â½Ã—Â¥Ã¯Â¿Â½mÃ¯Â¿Â½$Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã—Â,Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½ÃŸâ‚¬Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½M\"Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0!WÃÂ¾9Ã¯Â¿Â½[\\nÃ¯Â¿Â½Ã¢Â¾Æ’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fFÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½0>Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5-Ã¯Â¿Â½Ãœâ€˜Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¬Â¯â€ \ZXÃ¯Â¿Â½Ã¯Â¿Â½6}hÃ¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3rÃ¯Â¿Â½Ã¯Â¿Â½1\'Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½3^Ã¯Â¿Â½Ã¯Â¿Â½$KÃ¯Â¿Â½\"cÃ¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½LNÃ¯Â¿Â½=Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0ÃˆÂ¢Ã¯Â¿Â½cbÃ›ÂºÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½{WM3Ãƒâ€”Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½M|Ã¯Â¿Â½(\"Ã¯Â¿Â½	Ã¯Â¿Â½	5Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½yÃ¯Â¿Â½!>Ã›Â?ÃŠÂ¼3QÃ¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Q\'Ã¯Â¿Â½Ã¯Â¿Â½IhÃ™Â«Ã¯Â¿Â½Y|Ã¯Â¿Â½AÃ—ÂÃ¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0]wÃ¯Â¿Â½Ã™Å Ã¯Â¿Â½Ã¯Â¿Â½,{~Ã¯Â¿Â½Ã—â„¢Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½,_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½<WÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½ PqÃ¯Â¿Â½\ZÃ¯Â¿Â½ThÃ¯Â¿Â½Ã¯Â¿Â½@}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½m.zÃ¯Â¿Â½Ã¯Â¿Â½})Ã–Â®SÃ¯Â¿Â½9Ã¯Â¿Â½F}*BÃ¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½zC&]Ã¯Â¿Â½Ã¯Â¿Â½\09Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½m.g<Ã¯Â¿Â½1PO~Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½#bÃ¯Â¿Â½Ã¯Â¿Â½M9xÃ¯Â¿Â½mÃ¯Â¿Â½~fÃ¯Â¿Â½ÃžÂ¾Ã¯Â¿Â½Ã¯Â¿Â½,IÃ¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½OÃÅ½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã–Â¬Ã¯Â¿Â½f#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½GÃ¯Â¿Â½Go\\Ã¯Â¿Â½S9Ã¯Â¿Â½D6Ã¯Â¿Â½}}jÃ–â„¢Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½@-Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½GÃ¯Â¿Â½\0]AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\nÃ¯Â¿Â½,~LxÃ«Å’Â±Ã¯Â¿Â½Ã¯Â¿Â½Ã›Âµ<*oT;FOÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0nÃ¯Â¿Â½6#Ã¯Â¿Â½UN2}h\rÃ¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½<Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*]Ã¯Â¿Â½7Ã¯Â¿Â½\0\\Ã¯Â¿Â½ÃÂ©Ã¯Â¿Â½Ã¯Â¿Â½X%UÃ¯Â¿Â½#ÃŠÅ¸mÃ¯Â¿Â½[fÃ¯Â¿Â½/Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½KBÃ¯Â¿Â½5ÃÂ·Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kZÃ˜â€¦}Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¬Å¾â€¢U5Ã¯Â¿Â½b@Ã¯Â¿Â½[wv,?Ã‚Â¢Ã¯Â¿Â½Ã¯Â¿Â½C#W|u Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½g#^TÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½T\0:Ã¯Â¿Â½bÃ¯Â¿Â½Ã‹Â®NYÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½\\Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½W#?{Ã¯Â¿Â½\0Ã¯Â¿Â½OÃ¯Â¿Â½0TÃ¯Â¿Â½Ã¯Â¿Â½ÃˆÂ­dÃ¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½	\rÃ–Â°Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½JiÃ¯Â¿Â½UÃ¯Â¿Â½ÃƒÂº;F=Ã¯Â¿Â½*WErÃ¯Â¿Â½Ã¯Â¿Â½Ã¬Â®Â¬Ã¯Â¿Â½i1*Ã¯Â¿Â½yXÃ¯Â¿Â½?ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LUq0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W-Ã¯Â¿Â½}EÃ¯Â¿Â½K	Ã¯Â¿Â½b:gÃ¯Â¿Â½Ã¯Â¿Â½VMÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½~eÃ¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½3#lÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½oÃ¯Â¿Â½MFKf8Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½TÃ¯Â¿Â½pÃ¯Â¿Â½Ã¯Â¿Â½zeÃ¯Â¿Â½Ã›Â»Ã¯Â¿Â½dNHÃ¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½	-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	\"<$Ã¯Â¿Â½ ZÃ¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½\\Ã›â€™6Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã–Â£Ã¯Â¿Â½Ã¯Â¿Â½M7(>e?6Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dIÃ¯Â¿Â½Ãžâ‚¬!?Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½F~Ã¯Â¿Â½?Ã¯Â¿Â½GÃ¯Â¿Â½2Ã¯Â¿Â½ÃÂÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½xÃ¯Â¿Â½\0B8\0Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½c@Ã¯Â¿Â½Ã¯Â¿Â½/-Ã¯Â¿Â½H\'+Ã¯Â¿Â½?Ã¯Â¿Â½zÃ‹Â¸Ã¯Â¿Â½3Ã¯Â¿Â½nÃ¯Â¿Â½*Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½u$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ³â€˜â€™Å’TÃ¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½&`Ã¯Â¿Â½3,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\n=OJÃ¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½^aÃ¯Â¿Â½zÃ–â€“Ã¯Â¿Â½({Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½R?,8Ã¯Â¿Â½&Ã¯Â¿Â½=LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\" Ã¯Â¿Â½OÃ¯Â¿Â½vÃ¯Â¿Â½;Ã¯Â¿Â½XÃ¯Â¿Â½6Ã¯Â¿Â½B:]Ã¯Â¿Â½JÃ¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½$Ãâ€¡uÃ¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½\0Ã¯Â¿Â½k]Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½_iÃ¯Â¿Â½^qÃ¯Â¿Â½\0~Ã–Â»Ã«Ëœâ€°Ã¯Â¿Â½5kcÃ¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½:fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½=rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½:Ã–â€¢Ã¯Â¿Â½AeÃ¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½K<Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½ÃŒÂ«Ã¯Â¿Â½\ryÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½-:9cTUÃƒâ„¢>b;Ã¯Â¿Â½Ã¯Â¿Â½MVÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\nÃ¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½5Ã¯Â¿Â½,\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.0Ã¯Â¿Â½\ryUÃ¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½sÃ’Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½CÃ¯Â¿Â½U Ã¯Â¿Â½p(ÃÂ¨Ã¯Â¿Â½Ã¯Â¿Â½QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Ã¯Â¿Â½xÃ¯Â¿Â½CMQ!Ã¯Â¿Â½Ã¯Â¿Â½ewW[UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HIÃ¯Â¿Â½#Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/|;3Ã¯Â¿Â½Ã¯Â¿Â½#bC`+Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½2\\K/Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½u{Ã¯Â¿Â½Ã¯Â¿Â½[VÃ¯Â¿Â½6Ã¯Â¿Â½=EoÃ©Å¡Å½Ã¯Â¿Â½Ã¯Â¿Â½hV-^Ã¯Â¿Â½!ycÃ¯Â¿Â½E<jÃ¯Â¿Â½H]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½%8Ã¯Â¿Â½Ã­â€¦Â­Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½ !XÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½NÃ¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½F[QÃ¯Â¿Â½P/Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½,WÃ¯Â¿Â½[;zVÃ¯Â¿Â½Ã¯Â¿Â½yv\\HÃ¡Â½Â«*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½G7Ã¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½>HTÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½kÃ¯Â¿Â½oÃ¯Â¿Â½Z[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½Ã«Å¾â‚¬WÃ¯Â¿Â½|@Ã¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½e?Ã¯Â¿Â½Ã¯Â¿Â½\0*Ã¯Â¿Â½UÃ¯Â¿Â½@Ã¯Â¿Â½]Ã¯Â¿Â½YÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½Ã“Â	VÃ¯Â¿Â½u>Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã„ÂºeÃ¯Â¿Â½)Ã¯Â¿Â½\"VÃ¯Â¿Â½Ã¯Â¿Â½^iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ«Ã¯Â¿Â½IÃ¯Â¿Â½#3x~);Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½jBÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ qÃ¯Â¿Â½UÃ¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½9>Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½PÃ¯Â¿Â½+\ZgÃ“Æ’Ã¯Â¿Â½R+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½fb3Ã¯Â¿Â½Ã’ÂÃ¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.r}Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}j!Ã”â€¦Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½nÃ¯Â¿Â½EbÃ¯Â¿Â½ÃŠâ€”ÃŠÂ´fÃ¯Â¿Â½YjÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½R/nÃ¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½Ã“Â´Ã™ÂÃ¯Â¿Â½KjÃ¯Â¿Â½v5%Ã¯Â¿Â½67Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½COÃ¯Â¿Â½Ã¯Â¿Â½[Ãˆâ€¦Ã…Â«~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½edRF$7Ã¯Â¿Â½Ã¯Â¿Â½o^Ã¯Â¿Â½4Ã¯Â¿Â½r<gÃ¯Â¿Â½BAÃ¯Â¿Â½s2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãâ€ Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½TSPÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Yr7Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½;Ã¯Â¿Â½;Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5nÃ¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½3ÃŸÅ½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½k(Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½\'pÃ¯Â¿Â½\0hÃ¯Â¿Â½w\Z.Ã¯Â¿Â½Ã¯Â¿Â½Ã„ÂªÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½Ã‘â€“Ã¯Â¿Â½kÃ¯Â¿Â½$qi1FpÃ¯Â¿Â½CUÃ¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½\ZeGl`VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<zRÃ¯Â¿Â½\"(+Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½y[c8YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½O tÃ¯Â¿Â½Ã¯Â¿Â½shÃ¯Â¿Â½@1Ã¯Â¿Â½Ã–Å’Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½SÃ¯Â¿Â½I#V\n;U(Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ´Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½ LÃ¯Â¿Â½P@*\rBKXÃ¯Â¿Â½s(JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½ÃžÂ¸]cU{Ã¯Â¿Â½0BÃ¯Â¿Â½Ã¯Â¿Â½R9Ã¯Â¿Â½Ã¯Â¿Â½\0^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½\'Ã¯Â¿Â½,	#Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½3Ã¯Â¿Â½}Ã¯Â¿Â½:VÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jKÃ¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½DÃ¯Â¿Â½gqÃ¯Â¿Â½Ã¯Â¿Â½5ZÃ¯Â¿Â½RmFÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SkÃ¯Â¿Â½3Ã¯Â¿Â½oLÃ¯Â¿Â½>Ã¯Â¿Â½;nÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9@Ã„Æ’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½,lÃ¯Â¿Â½>f#Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½.}Ã¯Â¿Â½Ã¯Â¿Â½Jbf\\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½bÃ¯Â¿Â½4Ã‹â€°Ã¯Â¿Â½&qÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½EDÃ¯Â¿Â½W8Ã£Å¡â€¦w1P$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½.ÃÂfÃ¯Â¿Â½Ã¯Â¿Â½DUPNwFÃ¯Â¿Â½}(Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½!Ã¯Â¿Â½1>Ã¯Â¿Â½\ZÃ‰Â¼Ã¯Â¿Â½ÃŠÂ¶Ã¯Â¿Â½v8Ã¯Â¿Â½Ã–Â¤Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2AX>)Ã¯Â¿Â½Ã¯Â¿Â½i2Ã¯Â¿Â½Ã¯Â¿Â½$kÃ¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Yn_Ã¯Â¿Â½Z6@Ã¯Â¿Â½/&Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½R1Ã¯Â¿Â½TVUÃ‹ÂµÃ¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½LBÃ¯Â¿Â½FJnÃ¯Â¿Â½,kjÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½I!lÃ¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&ÃˆÂ¡Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½LiGÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã„ÂºÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‹ÂsÃ¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½0s^MÃ¯Â¿Â½@:>Ã¯Â¿Â½tGÃ¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½zÃ–Â¶Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½sÃ—â€”Ã¯Â¿Â½3	Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Es(Ã¯Â¿Â½DÃ¯Â¿Â½Ã¯Â¿Â½h%Ã¯Â¿Â½Ã±â€ Â¤â€“Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã•Â¯Ã¯Â¿Â½\Z{Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½EmÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½q}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‹â€ Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HfÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½s9Ã¯Â¿Â½3Ã¯Â¿Â½O<-}Ã¯Â¿Â½Ã¯Â¿Â½Ã…Â¬Ã¯Â¿Â½#laÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½0Ã¯Â¿Â½<Ã¯Â¿Â½0*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã’Â­mÃ¯Â¿Â½7GÃ¯Â¿Â½rÃ¯Â¿Â½(Ã¯Â¿Â½AEPEPEPEPEPEPEPEPEPEPEPEPEPFÃ¯Â¿Â½Ã¯Â¿Â½#TÃ¯Â¿Â½Ã¯Â¿Â½EÃÂ¢Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$fÃ¯Â¿Â½|1Ã¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½k^Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½d\rXÃ¯Â¿Â½%Ã¯Â¿Â½ÃÂ¾D`{(5Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½\0`Ã¯Â¿Â½wÃ¯Â¿Â½&<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½9$^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½}kÃ¯Â¿Â½-/LÃ¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½ \ZE-Ã¯Â¿Â½{Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½?}e+|Ã¯Â¿Â½BÃ¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½o4Ã—Â¶Ã¯Â¿Â½%3Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½#D0xn\rxÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½gÃ¢â€¹Â»}Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½*foGqÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{GfÃ¯Â¿Â½1Ã¯Â¿Â½Q]VÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½H$vÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½VfÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½VÃ¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½Ã‰â€¹9Ã¯Â¿Â½sPlÃ¯Â¿Â½m?Ã¯Â®Â®6*Ã¯Â¿Â½\0vÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã‡Â>Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UY\"/ko\0Ã¯Â¿Â½&Ã¯Â¿Â½BsÃ¯Â¿Â½+MÃ¯Â¿Â½H5h\ZÃ¯Â¿Â½0Ã¯Â¿Â½7AÃ¯Â¿Â½(Ã¯Â¿Â½7XÃ¯Â¿Â½Ã¯Â¿Â½ÃÂÃ¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½&n6Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dYpC7V)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yWÃ¯Â¿Â½Ã¯Â¿Â½H?Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7%Ã¯Â¿Â½?#Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½|YÃ¯Â¿Â½^ZKkmÃ¯Â¿Â½K!~Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã”Â¶~2Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0ÃŒâ„¢9Ã‡Â¨Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½5?Ã¯Â¿Â½Ã¯Â¿Â½/mÃ¯Â¿Â½(zÃ¯Â¿Â½ÃžÂ²Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/)Ã¯Â¿Â½Ã‹Â·Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½6_\\Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aÃ—Â·Ã“Â­?NÃ¯Â¿Â½WÃ¯Â¿Â½mÃ¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½2;+{Ã¯Â¿Â½2-Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½1v0Ã¯Â¿Â½Ã–Â´mwÃ¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½nvÃ¯Â¿Â½#WSuÃ¯Â¿Â½Ã¯Â¿Â½\0iiÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^9Ã¯Â¿Â½Ã¯Â¿Â½Ã¬â€ ÂÃ¯Â¿Â½Ã¯Â¿Â½Ã‰â€”Ã¯Â¿Â½Ã¯Â¿Â½PÃ‚â€œZÃ¯Â¿Â½fzÃ¯Â¿Â½Ã¯Â¿Â½lÃâ€¡,ztÃ¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0.Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½uÃ¯Â¿Â½]&Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?uÃ¯Â¿Â½Ã¯Â¿Â½)YÃ¯Â¿Â½Ã¯Â¿Â½NÃ¥Â¡Â«,kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½8\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0JÃ¯Â¿Â½Ã¯Â¿Â½A/Ã¯Â¿Â½4`Ã¯Â¿Â½JÃ˜Â¬Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½I6)Ã¯Â¿Â½ÃšÂÃ¯Â¿Â½pzÃ¯Â¿Â½oÃ¯Â¿Â½9Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½wVÃ¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½cUÃ¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½:Ã¯Â¿Â½Ã—Å¡Ã¯Â¿Â½Ã‘â€¹OBÃ¯Â¿Â½Ã¯Â¿Â½h)]Ã¯Â¿Â½6*\\_MÃ¯Â¿Â½kÃ¯Â¿Â½Vl3cwÃ¯Â¿Â½Ã¯Â¿Â½t7Ã¯Â¿Â½dÃ¯Â¿Â½mnCÃ¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½V\ZÃÂ¥Ã¯Â¿Â½JÃ¯Â¿Â½n5&Ã¯Â¿Â½Ã¯Â¿Â½SNÃ¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½YÃ¯Â¿Â½$Ã¯Â¿Â½wOOÃ¯Â¿Â½2lÃ¯Â¿Â½,ZÃ¯Â¿Â½f=]cÃ¯Â¿Â½Ã¯Â¿Â½Ã’Â·EQÃ¯Â¿Â½Ã¯Â¿Â½X`Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½,{AÃ¯Â¿Â½=kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½Ãˆâ€š#<]Ã¯Â¿Â½Ã¯Â¿Â½Ã–Âº{?hÃ¯Â¿Â½iÃ¯Â¿Â½MFÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½\0Ã—Â¤RjÃ¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãˆâ€¹;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½G{\0Ã¯Â¿Â½Ãâ€š7Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UNÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Y|Ã¯Â¿Â½/Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rrx\ZÃˆÂª0\'#Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã—Ë†cÃ“Â $t*AÃ¯Â¿Â½MEsÃ†Â¥	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½o3Ã¯Â¿Â½K#qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½nOwKÃ¯Â¿Â½i`Ã¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½2 Ã¯Â¿Â½oÃ¯Â¿Â½<~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½eÃŽâ€°m&NYÃ¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½f%Ã¯Â¿Â½Ã¯Â¿Â½d|Ã‘â‚¬*b{%Ã¯Â¿Â½Ã¯Â¿Â½cÃ˜Â½OÃ¯Â¿Â½XÃ‘Â­ZB>cÃ¯Â¿Â½Ã’ÂªGK*Ã¯Â¿Â½9=uÃ¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½y\'Ã¯Â¿Â½2{P%Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½8+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½[\Z;Ã¯Â¿Â½lÃ¯Â¿Â½|\rÃ¯Â¿Â½Q~Ã¯Â¿Â½Ã¯Â¿Â½\rFSusÃ¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rÃ¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½-wÃ¯Â¿Â½Ã¯Â¿Â½Ao~Ã¯Â¿Â½Ã¯Â¿Â½|\"Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½F?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½\nFÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½BiÃ¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½h.Ã¯Â¿Â½ÃˆÂ³Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½	*Ã–Â¨Ã¯Â¿Â½ PÃ¯Â¿Â½.y$VÃ¯Â¿Â½Ã¯Â¿Â½2\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½\0Ã¡Â¦ÂÃ¯Â¿Â½F\rÃ¯Â¿Â½Ã¯Â¿Â½FLrbpÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?+)YuWÃ¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½\0^Ã¯Â¿Â½EÃžâ€¡Ã¯Â¿Â½m@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½?@+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0(Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<IsÃ¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Id`:Ã¯Â¿Â½LÃ¯Â¿Â½nG5]Ã¯Â¿Â½Ã¯Â¿Â½Ã’Â¼Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã‹â€ Ã¯Â¿Â½-Ã‚Â¤Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½^Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½uXÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½aÃ¯Â¿Â½:MhiiÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½bÃ¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½Ã¦Âºâ€º[pÃ¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½=NÃ¯Â¿Â½Ã–Â»Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aÃ”Å“fÃ¯Â¿Â½:Ã¯Â¿Â½\n)Ã“Â¡Ã¯Â¿Â½X$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½MÃ¯Â¿Â½66Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Q\\Ã¯Â¿Â½\0Ã¯Â¿Â½uÃ‹ÂFÃ¯Â¿Â½,Ã¯Â¿Â½CÃ¯Â¿Â½Ã¯Â¿Â½enÃ¯Â¿Â½KEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½O?Ã¯Â¿Â½M#9NÃ¯Â¿Â½ÃˆÂ¹Ã¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\ZÃ¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½DÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OjÃ¯Â¿Â½MÃ¯Â¿Â½IÃ¯Â¿Â½#Ã¯Â¿Â½HÃ¯Â¿Â½X.zÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½_XÃ¯Â¿Â½F2Ã¯Å¾Å =Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½%6Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½OZÃ¯Â¿Â½`Ã¯Â¿Â½FÃ¯Â¿Â½e_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½6Ã‘Å“$yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½V+Ã¯Â¿Â½-Ã¯Â¿Â½qÃ¯Â¿Â½ygzqHfF$Ã¯Â¿Â½N:tÃ¯Â¿Â½Ã¯Â¿Â½\0\ZÃŽÂ¹Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½]Ã›Å¸Ã¯Â¿Â½y taÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½68_hÃ‚ÂªÃ¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½phÃ¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,0&NÃ¯Â¿Â½Ã¯Â¿Â½Z7Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½GulJNÃ¯Â¿Â½Ã¯Â¿Â½\nyÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ»Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½yÃ¯Â¿Â½Ã“Â¯TÃ¯Â¿Â½_Ã¯Â¿Â½kbÃ¯Â¿Â½Ã¯Â¿Â½ eS Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wQ,~MÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½u)xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½WiÃ¯Â¿Â½Ã¯Â¿Â½!3\"ÃŠÂ¸Ã¯Â¿Â½}\rwZVÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½:Ã¯Â¿Â½),}Ã¯Â¿Â½:Ã¯Â¿Â½-;tÃ¯Â¿Â½]IbÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½W7Ã¯Â¿Â½\"Ã¯Â¿Â½9/cZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½K1pÃ¯Â¿Â½mÃ¯Â¿Â½nÃ¯Â¿Â½pOÃ¯Â¿Â½ZÃ¯Â¿Â½+Ã¯Â¿Â½bkÃ¯Â¿Â½y%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~HÃ¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½;\nÃ¯Â¿Â½wÃ¯Â¿Â½|BÃ¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½EÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½rKÃ¯Â¿Â½jÃ¯Â¿Â½Ã˜Â¢Ã¯Â¿Â½4RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŸÂ Ã¯Â¿Â½Ã¯Â´â€”Ã¯Â¿Â½Ã¯Â¿Â½f7>Q=Ã¯Â¿Â½Ã¯Â¿Â½Ã’Â¨Ã¯Â¿Â½\\Ã¯Â¿Â½EÃ¯Â¿Â½Ã¯Â¿Â½Df[Ã¯Â¿Â½YfmÃ¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½f\\\\Icxd Ky\' >rÃ¯Â¿Â½Ã•Â½)wÃ¯Â¿Â½ZÃ¯Â¿Â½f{Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½eÃ¯Â¿Â½i\ZYÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#]\rÃ¯Â¿Â½Ã¯Â¿Â½\ZdÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½[YÃ¯Â¿Â½\nÃ¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½jy`Ã¯Â¿Â½Ã¯Â¿Â½&fÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃŠÂ±Ã¯Â¿Â½Ã¯Â¿Â½A Ã¯Â¿Â½KzÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{FQH*_Ã¯Â¿Â½Ã¯Â¿Â½*nZEhÃ¯Â¿Â½qÃ¯Â¿Â½Ã›Â°Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W?Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]KMÃ¯Â¿Â½JXjÃ¯Â¿Â½Ã¯Â¿Â½Ã„Æ’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½i Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½|Ã„Â¦QÃ¯Â¿Â½VVÃ™Â´Ã¯Â¿Â½8Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½m]Ã”Â Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3+Ã¯Â¿Â½@7,Ã¯Â¿Â½psWÃ¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½aÃ¯Â¿Â½w;[Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½pÃ¯Â¿Â½Ã¯Â¿Â½)uÃ¯Â¿Â½tCQÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½,.Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½&`\Zb[Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½sz]Ã¯Â¿Â½Ã¯Â¿Â½\\FÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.?\ZÃ¯Â¿Â½uÃ¯Â¿Â½[]Ã–â€˜Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½;k_Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½\r}\Z\"Ã¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½sqÃ¯Â¿Â½Ã¯Â¿Â½N_Ã¯Â¿Â½1Ã¯Â¿Â½X3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½<QÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½+2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ«*Ã¯Â¿Â½JgÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½DIÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½x/LÃ¯Â¿Â½d1Ã¯Â¿Â½Ã¯Â¿Â½+ÃˆÂ§Ã¯Â¿Â½v?Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½_ZtÃ¯Â¿Â½E\nÃ¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½337SV`SÃ¯Â¿Â½Ã¯Â¿Â½,W Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xi\0Ã¯Â¿Â½bnÃ¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Mz7Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\n[\ZÃ¯Â¿Â½QE2Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'RÃ¯Â¿Â½z5yÃË†0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã†â€œ*\"XÃˆÂ¡UÃ¯Â¿Â½	Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GcÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½E6W8Ã¯Â¿Â½Y>9Ã¯Â¿Â½Ã¯Â¿Â½EfÃ¯Â¿Â½832FOÃ¯Â¿Â½<Ã¯Â¿Â½ZWzsÃ¯Â¿Â½;w[srÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½xrÃ¯Â¿Â½SÃ¯Â¿Â½yMÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½= y[\0BÃ¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½E#Ã¯Â¿Â½!XYw2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã†ÂmÃ¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½i4Ã¯Â¿Â½ÃÂ§Ã¯Â¿Â½C(\"LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tÃ¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½TÃ¯Â¿Â½jÃ¯Â¿Â½ÃƒÂ§Ã‹Å½)\'Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½e1;CjÃ¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½RsÃ¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½GEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W;Ã¯Â¿Â½YoÃ¯Â¿Â½pÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã–Â¤)sÃ¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã©Â¡â€ž|Ã¯Â¿Â½Ã¯Â¿Â½B_Ã©â‚¬ÂÃ¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½u<TfÃ¯Â¿Â½>Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½i\nÃ¯Â¿Â½T!Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½\'Ã¯Â¿Â½Ã…Â½Ã¯Â¿Â½\\Ã¯Â¿Â½J	^Ã™Â fÃ¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½HxÃ¯Â¿Â½Ã¯Â¿Â½gdÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?/Ã¯Â¿Â½XÃ¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½EÃ¯Â¿Â½/Ã¯Â¿Â½ÃÂ¼Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½ÃŸÂ­o$Ã¯Â¿Â½[;Ã¯Â¿Â½%Ã¯Â¿Â½O9wj}Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã‰Â·SÃ¯Â¿Â½Ã¯Â¿Â½ImÃ¯Â¿Â½nc4\rÃ¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½{Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Q^X-Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½ÃŒâ€˜Ã¯Â¿Â½Ã¯Â¿Â½W\rÃ¯Â¿Â½Ã¯Â¿Â½yfÃ¯Â¿Â½}Ã¯Â¿Â½ÃÂ¸cÃ¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½iYjÃ¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½f\\Ã¯Â¿Â½Ã¯Â¿Â½ÃŠâ€¹FÃ¯Â¿Â½Ã¯Â¿Â½Ã„Â¥c-Ã¯Â¿Â½7Ã¯Â¿Â½GuÃ¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!]3!FÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŽÂ¹}>0Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½ÃÂ¶}Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aAÃ¯Â¿Â½76>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½MUÃ¯Â¿Â½Ã¯Â¿Â½pÃ¯Â¿Â½9\0Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã™ÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½Mt~12XMq	Ã¯Â¿Â½Ã¯Â¿Â½sX,$Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½99?Ã¯Â¿Â½Ã¯Â¿Â½MÃžÂ¥{Ã¯Â¿Â½y.Ã¯Â¿Â½Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½N	\'Ã¯Â¿Â½;W\"+k{9NÃ¯Â¿Â½Ã¯Â¿Â½CLÃžâ€¹Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½l5FÃŸâ€”Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½T1$Ã¯Â¿Â½ÃŠÂ¡o~Ã¯Â¿Â½Ã¯Â¿Â½M\nZÃ¯Â¿Â½kS\Z+2Ã¯Â¿Â½Ã¯Â¿Â½Ã•Â¥Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½ZÃ¯Â¿Â½=Ã¯Â¿Â½]Ã¯Â¿Â½4Ã¯Â¿Â½HÃ¯Â¿Â½8Ã¯Â¿Â½<Ã¯Â¿Â½q#Ã›Â½ZÃ¯Â¿Â½Ã¯Â¿Â½KeÃ¯Â¿Â½Ã¯Â¿Â½Ã„â€œIÃ¯Â¿Â½eÃ¯Â¿Â½_Ã‚Â$(Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½hWÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã—â€šÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã†ÂªÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YwÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½\rÃ¯Â¿Â½!ÃŠÂ©Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½;Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½XX^Ã”ÂºoÃ¯Â¿Â½-aÃ¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½g#8Ã¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1XcÃ¯Â¿Â½u~Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½uÃ¯Â¿Â½(kQDÃ¯Â¿Â½Ã¯Â¿Â½Ã¬Ââ€”Ã¯Â¿Â½Ã¯Â¿Â½`=+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Y#mÃ¯Â¿Â½ t\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,0gÃŠâ€¦Ã¯Â¿Â½Ã¯Â¿Â½5]#VÃ¯Â¿Â½NÃ¯Â¿Â½~4Ã…Â¹/Ã¯Â¿Â½u	Ã¯Â¿Â½Ã¯Â¿Â½K[Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½gÃ¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½]ny7!X#CÃ¯Â¿Â½Ã•Â·Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ•ÂNÃ¯Â¿Â½lÃ„â€“iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½%Ã¯Â¿Â½2-58bÃ¯Â¿Â½EÃ¯Â¿Â½QÃ¯Â¿Â½\0Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½A,Ã¯Â¿Â½Y>Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½=TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rY9Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fLÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LW)I&ViÃ¯Â¿Â½ca}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½gÃ¯Â¿Â½KPÃ¯Â¿Â½Ã¯Â¿Â½ÃŠÂ¿(Ã¯Â¿Â½Ã—Â°|Ã¯Â¿Â½|Ã¯Â¿Â½\'QÃ¯Â¿Â½$FÃ¯Â¿Â½QÃ‘â€¢GQÃ¯Â¿Â½Ã¯Â¿Â½?\nÃ¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½yy>Ã¯Â¿Â½Ã¯Â¿Â½s	Ã¯Â¿Â½Ã¯Â¿Â½+~Ã¯Â¿Â½1R+&Ã¯Â¿Â½B;\ZÃ¯Â¿Â½$sÃ¯Â¿Â½ÃÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½nÃ¯Â¿Â½n?Ã™Â®2Ã¯Â¿Â½ÃŽÂ¼bÃ¯Â¿Â½]Ã¯Â¿Â½AÃ¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½)=\r\n(Ã¯Â¿Â½Ã¯Â¿Â½!EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP^qÃ¯Â¿Â½)}~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½.Ã¯Â¿Â½MEÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OLÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½R	Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½PF6Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ãâ€Ã¤â€°â€Ã¯Â¿Â½ Ã’Â±JV<^,@Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã†Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#?Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ¦+?,Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½Ã†â‚¬Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½*kÃ¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½\n3]Ã¯Â¿Â½Ã¯Â¿Â½5UÃ”Æ’g$Ã¯Â¿Â½c\\DCÃ¯Â¿Â½uÃ¯Â¿Â½rÃ¯Â¿Â½Ã¯Â¿Â½zU-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½s7*Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½WIÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½e0ÃŒâ€ºÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½i8Ã¯Â¿Â½Ã¯Â¿Â½>vJÃ¯Â¿Â½Ã¦Â¥Å CÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½d\rÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½1Ã¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½CÃ¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½5Ã¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HcÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½9Ã¯Â¿Â½CPÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½n#Ã¯Â¿Â½Ã¯Â¿Â½d(Ã¯Â¿Â½(Ã¯Â¿Â½v&.Ã¯Â¿Â½Ã¯Â¿Â½v#Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½0Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W7Ã¯Â¿Â½Lr-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Eu\ZÃ¯Â¿Â½Ã¯Â¿Â½48XÃ¯Â¿Â½SÃ¯Â¿Â½aÃ¯Â¿Â½\0Ãžâ€¡5Ã¯Â¿Â½:Z^Ã¯Â¿Â½0@Ã¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½63Ã¯Â¿Â½Ã¯Â¿Â½\"SÃ¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½gÃ¯Â¿Â½u6Ã¯Â¿Â½mÃ¯Â¿Â½@WÃ¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½]rGÃ¯Â¿Â½Ã¯Â¿Â½V,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XtÃ†Å’Ã¯Â¿Â½Ã¯Â¿Â½ÃŽÂ&zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2iÃ¯Â¿Â½6vÃ¯Â¿Â½J,4Ã¯Â¿Â½_Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½Ã¯Â¿Â½i\0uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&OÃ¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½C[:DÃ¯Â¿Â½af@;Ã¯Â¿Â½nOÃ¯Â¿Â½}KÃ¯Â¿Â½8Ã¯Â¿Â½}BÃ¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½2/ÃŒÂ§Ã¯Â¿Â½biÃ¯Â¿Â½\'Ã¯Â¿Â½D Ã¯Â¿Â½	RÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½2][1u]Ã¯Â¿Â½qÃ¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½o-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½VÃ–Â¢kÃ¯Â¿Â½F8CÃ¯Â¿Â½fÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‘Â£Ã¯Â¿Â½;Ã¯Â¿Â½M-Ã¯Â¿Â½_-Ã“Â¡F=Ã¯Â¿Â½SÃ¯Â¿Â½8Ã¯Â¿Â½_;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¥Â´Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-`Ã¯Â¿Â½.`ÃÂ¸Ã¯Â¿Â½C+Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã‚Â´Ã¯Â¿Â½KÃ¯Â¿Â½i\Z?Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½TÃ¯Â¿Â½<Ã¯Â¿Â½?bÃ¯Â¿Â½$cÃ¯Â¿Â½\0Ã¯Â¿Â½a.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã…Å¾Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ”ÂµÃ¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WmÃ¯Â¿Â½]Ã¯Â¿Â½X\'Ã¯Â¿Â½Ã¯Â¿Â½\0fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Z&Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã„Â±Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½O\n?ÃÂ­:tanUÃ¯Â¿Â½vÃ¯Â¿Â½\0Ã¯Â¿Â½:3Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½m\"Ã¯Â¿Â½Ã¯Â¿Â½1;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½zÃ¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã§ÂÅ“*C3Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tuS]eÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½sjHÃ¯Â¿Â½\"HÃ¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½+YÃ¯Â¿Â½G\nÃ¯Â¿Â½Ã¯Â¿Â½pqÃ¯Â¿Â½dÃ¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãƒâ€“\Zd\\I>Ã–â€Ã¯Â¿Â½@(\ZÃ¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,\nÃ¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã–ÂÃ¯Â¿Â½[kHÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃŽÂ±Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½2zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½!Ã‚â‚¬Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½WÃ›â€™yÃ¯Â¿Â½\0Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KbÃ¯Â¿Â½Ã¯Â¿Â½b?\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zRTÃ¯Â¿Â½Rjl_6Ã¯Â¿Â½8Ã¯Â¿Â½D$Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½YrÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~ Ã¯Â¿Â½ÃŠÅ’Ã¯Â¿Â½#Ã¯Â¿Â½=kÃ¯Â¿Â½Ã–Ë†]WÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½Ok`oÃ¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½Ã‚Æ’Ã¯Â¿Â½SDÃ¯Â¿Â½8Ã¯Â¿Â½rHÃ¯Â¿Â½_Tx3GÃ¯Â¿Â½\0Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½!/?Ã¯Â¿Â½ÃœÂ·Ã¯Â¿Â½MxÃ¯Â¿Â½Ã¯Â¿Â½/Ã‹Â­kÃ¯Â¿Â½MqÃ¯Â¿Â½5Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½aÃŠÂ§Ã¯Â¿Â½?Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃžÂ¶)Ã¯Â¿Â½Ã›ËœÃ¯Â¿Â½YÃ¯Â¿Â½.|Ã¯Â¿Â½Ã¯Â¿Â½CWÃ¯Â¿Â½dP	Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ãâ€šÃ¯Â¿Â½Ã¯Â¿Â½C9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½F\Z,oÃ¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½\ZDÃšËœÃ¯Â¿Â½Ã†â€¦QA!EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP\\^Ã¯Â¿Â½pcÃ¯Â¿Â½n\ZÃ¯Â¿Â½+ÃŽÂµYÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½NpqÃ¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½bm^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã›Â«}Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½%^ÃœÂ´Ã–Å¾dKtZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½C}q$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1Ã†â€žÃ¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,EI$u vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½\"%=vÃ¯Â¿Â½ps]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½ÃšÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\nÃ¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‰Â¬ÃŽâ€žMÃ¢ÂÂµ:3\\2Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½5Ã¯Â¿Â½[]Ã¬â„¢â€Ã¯Â¿Â½:Ã®ÂµË†Ã¯Â¿Â½+-Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½p1^_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãžâ€™x\0Ã•Â£Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½O6Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½WÃ–Â±Ã¯Â¿Â½AVSÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Q&Ã¯Â¿Â½4mÃ¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½tuÃ¯Â¿Â½Ã¯Â¿Â½^.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nVÃŽâ€œÃ¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0**gÃžÂ«_Ã¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ™Â?Ã¯Â¿Â½YÃ¯Â¿Â½wvÃ¯Â¿Â½TÃ¯Â¿Â½ y\"Ã¯Â¿Â½\"Ã¯Â¿Â½KvÃ¯Â¿Â½Y_Ã¯Â¿Â½,Ã¯Â¿Â½H\\Ã¯Â¿Â½!Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½}((Ã¯Â¿Â½qÃ¯Â¿Â½&Ã¯Â¿Â½Ãªâ€žâ€™Ã¯Â¿Â½,*Ã¯Â¿Â½Ã¯Â¿Â½_JÃ‰Å¸]Ã¯Â¿Â½Ã¯Â¿Â½Q\nÃ¯Â¿Â½Ã¯Â¿Â½Ã›Â¢Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½*FyÃ¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã–Â·4Ã¯Â¿Â½lÃ¥Â¶ËœÃ¯Â¿Â½:Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½ÃƒÂ°Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½0$ Ã¯Â¿Â½Ã¯Â¿Â½\0JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½.2Ã¯Â¿Â½Ã¯Â¿Â½WcÃ¯Â¿Â½Ã¯Â¿Â½Ã¢Â³Â­-Ã¯Â¿Â½Ã¯Â¿Â½ sÃ¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã•Â¡Ã¯Â¿Â½ÃˆÂ¶ZbÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½(\ZÃ¯Â¿Â½Ã¯Â¿Â½:zÃ‰ÂªÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‹â€“Ã¯Â¿Â½/Ã¯Â¿Â½Ã’ÂºÃ¯Â¿Â½o$!PÃ¯Â¿Â½#n\'=9Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½G\"8Ã¯Â¿Â½@g=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ts5Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¯Â¿Â½h/QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WcÃ¯Â¿Â½Ã¯Â¿Â½;q\\l5Ã¯Â¿Â½Ã¯Â¿Â½2dÃ¯Â¿Â½~HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½/Ã¯Â¿Â½7Ã¯Â¿Â½Ãâ‚¬Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½v\ZÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½OÃ¯Â¿Â½2Ã¯Â¿Â½Ã¯Â¿Â½*hÃ¯Â¿Â½n4Ã¯Â¿Â½Ã–Â¤Ã¯Â¿Â½	#[eÃ¯Â¿Â½8ESÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½;NdÃ¯Â¿Â½Ã¯Â¿Â½k)Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ã’Â²Ã¯Â¿Â½HÃ¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‹â€Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½XÃ¯Â¿Â½oÃ¯Â¿Â½fG7Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½ÃÂ¼Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½O]Ã¯Â¿Â½02\ZÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½\\~\"Ã¯Â¿Â½Ã¡Å’ÂºÃ¯Â¿Â½Ã¯Â¿Â½pÃ¯Â¿Â½@.Ã¯Â¿Â½qÃ¯Â¿Â½dÃ¯Â¿Â½iZk B>Ã¯Â¿Â½LÃ¯Â¿Â½>bÃ¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½JÃ¯Â¿Â½LÃ¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½( vÃ¦Â¸Â·Ã¯Â¿Â½Ã¯Â¿Â½YTÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kOMÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½v ÃÅ“z~Ã¯Â¿Â½GGÃ¯Â¿Â½<Ã¯Â¿Â½\'Ã¯Â¿Â½^?Ã†Â­jWÃ¯Â¿Â½]Ãˆâ€°;Ã¯Â¿Â½ÃÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¢Â²Â¬dÃ¯Â¿Â½PÃ¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½6\0Ã¯Â¿Â½RkÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½I*Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½HeÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½TÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŒÂ¨Ã¯Â¿Â½Ã¯Â¿Â½uQÃ¯Â¿Â½D9Ã¯Â¿Â½\\Ã¯Â¿Â½Rh1KÃ¯Â¿Â½Ã¯Â¿Â½vO\0Ã¯Â¿Â½)Ã¯Â¿Â½}OPÃ¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½|Ã¯Â¿Â½J^~\\Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½US+Ã¯Â¿Â½Ã¯Â¿Â½\\}Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½lÃ¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½z5|Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½D?Ã¯Â¿Â½sQÃ¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½:Ã¯Â¿Â½=Ã¯Â¿Â½&Ã¯Â¿Â½pÃ¯Â¿Â½\"fÃ¯Â¿Â½Ã…â€¢	Ã¯Â¿Â½N*Ã¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GJÃ¯Â¿Â½CgÃ¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½tGÃ¯Â¿Â½1ZÃ¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½0/Ã¯Â¿Â½MÃ¯Â¿Â½6_v\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½/sÃ¯Â¿Â½evbÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã†â€º+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã›ÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½dÃ¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½^wN})Ã¯Â¿Â½Ã¯Â¿Â½v	^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ³Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½Ã‡Å“WeÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½hQEQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0!!TÃ¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½MÃžÂ¿y.2Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zMÃ¯Â¿Â½+9r0>Ã¯Â¿Â½Ã¯Â¿Â½(mZÃ¯Â¿Â½F142Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½BÃ¯Â¿Â½Rr%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½W0Ã¯Â¿Â½Ã¯Â¿Â½DÃ¯Â¿Â½nÃ¯Â¿Â½,9Ã¯Â¿Â½kÃ¯Â¿Â½~(iÃ¯Â¿Â½4;]IdÃ¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1eo^BsÃ¯Â¿Â½@osÃ¯Â¿Â½fÃ¯Â¿Â½gL]Ã¯Â¿Â½mYÃ¯Â¿Â½P@?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½(p2Ã¯Â¿Â½Ã¯Â¿Â½?JÃ¯Â¿Â½Ã¯Â¿Â½!%Ã¯Â¿Â½Ã¯Â¿Â½Ã‡â€œÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZEcÃ¯Â¿Â½Ã¯Â¿Â½RQx@Ã¯Â¿Â½mÃ¯Â¿Â½Ã„â€”SÃ¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½qÃ¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ã‰ÂÃ¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½ZÃ¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½wcÃ¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½a}`Ã¯Â¿Â½Ã¯Â¿Â½Ãâ€™,Ã¯Â¿Â½Ã¯Â¿Â½!?Ã¯Â¿Â½	Ã¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½!Ã¯Â¿Â½OÃ¯Â¿Â½IÃ¯Â¿Â½vÃ¯Â¿Â½Ãâ€™Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rWÃˆÂ¹qEF9Ã¯Â¿Â½Ã¯Â¿Â½[\r<#rÃ¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ml|Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½K\Z[qÃ¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½\\/ÃÂ¸Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã„Â­Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½\0\nÃ¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{daÃ¯Â¿Â½fÃ¯Â¿Â½d5xÃ¯Â¿Â½@Ã¯Â¿Â½6Ã¯Â¿Â½ai	Ã¯Â¿Â½Ã¯Â¿Â½Ã—Â¡Ã¯Â¿Â½GÃ¯Â¿Â½Ã¦Â³Â²Ã¯Â¿Â½VÃ¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½bcÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|;Ã¯Â¿Â½XJ+tÃœÂ½Ã¯Â¿Â½Ã¯Â¿Â½+OZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½o,JqÃ‡Â¹Ã¯Â¿Â½G5Ã¯Â¿Â½5tÃ¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½KGdÃ¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½ uÃ¯Â¿Â½pWRÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ek#Ã¯Â¿Â½Ã„Å¡Ã¯Â¿Â½ocÃ¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½JÃ‚Â¥Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½C:=4Ã¯Â¿Â½Ã¯Â¿Â½xZÃ¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½	bTg8Ã¯Â¿Â½YÃ¯Â¿Â½xÃ¯Â¿Â½~Ã¯Â¿Â½R;HÃ¯Â¿Â½Ã¯Â¿Â½	XÃ•Â»Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¤Â·â€ 5,7gÃ¯Â¿Â½ÃÂ¾k.Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃÂ´r*Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã–Âµ[Ã¯Â¿Â½Ã¯Â¿Â½~5Ã¯Â¿Â½nÃ¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ«Ã¯Â¿Â½,ZqqÃ•â€™PÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½+{o>CÃ¯Â¿Â½@TÃ¯Â¿Â½Ã¯Â¿Â½GjtW1Ãªâ€“Â·s\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½BÃ¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã™ÂtÃ¯Â¿Â½nX\rÃ¯Â¿Â½JÃ¯Â¿Â½\0G8Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½_Ã¯Â¿Â½<~\\Ã¯Â¿Â½Ã‚Âµ-Ã¯Â¿Â½ccÃ¯Â¿Â½\00Ã¯Â¿Â½Ã¯Â¿Â½$RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\r63=Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Q\\Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã‹ËœÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½Ã’Â½Ã¯Â¿Â½J{Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½ZÃ¯Â¿Â½\rÃ¯Â¿Â½Ã¯Â¿Â½f0.Xg*0is\rSÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½R:Ã¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½\0>iuoÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½Ã”Æ’!Ã¯Â¿Â½IQEÃ¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KIbÃ¯Â¿Â½Ã™Å¡)Ã¯Â¿Â½cÃ¯Â¿Â½pÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½ÃŽÂ§y}o\n^Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½[Ã¯Â¿Â½Ã•Â¤#7l9Ã¯Â¿Â½8Ã¯Â¿Â½_Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ½_8NÃ¯Â¿Â½Ã¯Â¿Â½=iÃ¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã‰ÂºÃ¯Â¿Â½.RXÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yl}Ã¯Â¿Â½Ã¯Â¿Â½o\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½8dbÃ¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ãƒâ€žtÃ¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½p9Ã¯Â¿Â½&Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½BÃ¡Â¤Å 6oÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bqÃ¯Â¿Â½BÃÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½O3Ã¯Â¿Â½pxÃ¯Â¿Â½@Ã¯Â¿Â½E`Ã¯Â¿Â½JDÃ¯Â¿Â½(?Ã¯Â¿Â½@Ã™â€˜Ã¯Â¿Â½FÃ¯Â¿Â½CÃ¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½pfHfÃ¯Â¿Â½6Ã¯Â¿Â½,vÃ¯Â¿Â½+NÃ¥â€ÂÃ¯Â¿Â½6Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½pNÃ¯Â¿Â½Ã¯Â¿Â½S&ÃšÅ 48]Ã„â€œÃ¯Â¿Â½Ã¯Â¿Â½p5zÃ¯Â¿Â½ÃˆÂ¼Ã¯Â¿Â½cZÃ¯Â¿Â½(Ã¯Â¿Â½ xÃ¯Â¿Â½zÃ¯Â¿Â½YÃ¯Â¿Â½Rd2Ã¯Â¿Â½3Ã¯Â¿Â½rs^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½/Ã¯Â¿Â½4- Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½`{\nqÃ¯Â¿Â½3Ã¯Â¿Â½GA!Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½!JÃ¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½GUÃ¯Â¿Â½aQHwÃ…Â³on\rYÃ¯Â¿Â½Ã¯Â¿Â½jMÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃÂ»CÃ¯Â¿Â½9Ã¯Â¿Â½Ã¯Â¿Â½\\NÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½\\yÃ¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½QEÃ¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã‚Â¹Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½25Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\r}kRSsÃ¯Â¿Â½xÃ¯Â¿Â½DC.{fÃ¯Â¿Â½bYÃ¯Â¿Â½Ã¯Â¿Â½f5Ã¯Â¿Â½mÃ¯Â¿Â½Ã‹â€”Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1AHÃ¯Â¿Â½Ã¯Â¿Â½\r/Ã¯Â¿Â½{Ãƒâ€”:q`E2{09Ã¯Â¿Â½Ã¯Â¿Â½kIÃ¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½#pÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0\nÃ¯Â¿Â½Ã¯Â¿Â½Ã˜Â°Ã¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Z	.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7#Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½TI\ZÃ“â€¢Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½<Ã¯Â¿Â½]NÃ¯Â¿Â½Ã¯Â¿Â½i#Ã¯Â¿Â½HÃ¯Â¿Â½Ã„â€¹Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã˜Â­Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½L~Ã¯Â¿Â½\":Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:NÃ¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½U\\Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã‡Â·Ã¯Â¿Â½nÃˆÂ¦ÃÂ¢Ã¯Â¿Â½Ã¯Â¿Â½ÃƒÂ©Ã¯Â¿Â½E^Ã¯Â¿Â½G)yÃ¯Â¿Â½AitÃ¯Â¿Â½`Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RYÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½6`Ã¯Â¿Â½ ;Ã¯Â¿Â½h vÃ¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½,~32Ã„â€ HÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½\0UÃ¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½Ã±Â¤â€œâ€ Ã¯Â¿Â½x?0Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½&x#Ã¯Â¿Â½Ã¯Â¿Â½%0JF1Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½DÃ¯Â¿Â½YDÃ¯Â¿Â½IÃ¯Â¿Â½$VÃ¯Â¿Â½cÃ¯Â¿Â½@Ã–Â®Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]ÃŽâ€œÃ¯Â¿Â½FÃ¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½<0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4gÃ¦Å’â€ Ã¯Â¿Â½3\\UÃ¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½k7L\ZHÃ¯Â¿Â½	Ã¯Â¿Â½[o{Ã¯Â¿Â½xzÃ¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½)XÃ¯Â¿Â½+Ã¯Â¿Â½qwÃ¯Â¿Â½o<E\ZÃ¯Â¿Â½$Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã…ÂªÃ‚â€˜Ã¯Â¿Â½PDÃ¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#SÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½dkÃ¯Â¿Â½Ã¯Â¿Â½YO/Ã¯Â¿Â½3Ã¯Â¿Â½~Ã¯Â¿Â½ks	;#ÃÂ¼=Ã¯Â¿Â½iWI.mÃ¯Â¿Â½Ã¯Â¿Â½q;Ã¯Â¿Â½Ã¯Â¿Â½8ÃŠÅ½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ‰Â¾ÃÂ¦YfY$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yWHÃ¯Â¿Â½GÃ¯Â¿Â½szUÃ¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½&Ã•â€ºnÃ¯Â¿Â½s]_Ã›Â¯Ã¯Â¿Â½Ã”Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½	Ã¯Â¿Â½GÃ¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã˜ÂµÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]UÃ¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½eÃ¯Â¿Â½CÃ¯Â¿Â½=Ã¯Â¿Â½WKÃ¯Â¿Â½xZÃ¯Â¿Â½Ã¯Â¿Â½~1Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã†Â¡Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uOxzÃ¯Â¿Â½TÃ¯Â¿Â½WÃ¯Â¿Â½X-Ã¯Â¿Â½qQ.9Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã“Â³Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_GÃ¯Â¿Â½tRÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½:Ã•Â«.BÃ¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½e0Ã¯Â¿Â½OÃ¯Â¿Â½O]Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½gI\'Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½a6Ã¯Â¿Â½LmÃ¯Â¿Â½n?Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nVÃ¯Â¿Â½\0bÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½hvÃ¯Â¿Â½f[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½Ã”Å¡&Ã¯Â¿Â½Ã¯Â¿Â½mÃ„Â³^Ã¯Â¿Â½Ã„â‚¬|Ã¯Â¿Â½SÃ¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½\\HngÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½^kÃ¯Â¿Â½6Ã¯Â¿Â½ 6Ã¯Â¿Â½ÃšÅ’Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½^OÃ¯Â¿Â½tÃ¯Â¿Â½Ã¯Â¿Â½|1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ \';Ã¯Â¿Â½Ã¯Â¿Â½E9Ã‰â€ºzÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½F=3Ã¯Â¿Â½W5}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½*XÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½meoÃ¯Â¿Â½Y<Ã¯Â¿Â½!Ã¯Â¿Â½wf?Ã’â„¢Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-biXÃ¯Â¿Â½cÃ¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½\\Ã¯Â¿Â½Ã¯Â¿Â½)<Ã¯Â¿Â½ÃÂÃ‚Â­mZÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½8T.Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½?Ã†ÂÃ¯Â¿Â½eÃ¯Â¿Â½3\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½WKy9Ã¯Â¿Â½ehÃ‘â€™Ã¯Â¿Â½\0`HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?Ã¯Â·Â¹Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã­Å Â«`Ã¯Â¿Â½KÃ¯Â¿Â½=	Ã¯Â¿Â½qVu	Ã¯Â¿Â½LÃ¯Â¿Â½(%Ã¯Â¿Â½nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~0Ã¯Â¿Â½0iÃÂ°3Ã¯Â¿Â½$Ã¯Â¿Â½\0u}Ã¯Â¿Â½\0Ã¯Â¿Â½RÃ”â€¡Ã¯Â¿Â½Ã¯Â¿Â½ÃŽÂ«Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã’â€™Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÂ¶\'Ã¯Â¿Â½l|Ã¯Â¿Â½Ã¯Â¿Â½?:Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½Ã’Â¡Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>>5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½ÃžÂ¬43Ã¯Â¿Â½dÃ¯Â¿Â½Ã¯Â¿Â½Z%cÃ¯Â¿Â½NÃ¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½IUÃ¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½EÃ¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã‚Â/mÃ¯Â¿Â½A<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½4Ã¯Â¿Â½QÃ¯Â¿Â½#Ã¯Â¿Â½m>Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½QEiÃ¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\r\'Ã¯Â¿Â½vÃ¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½JÃŸÂ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(\0Ã¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½I=Ã¯Â¿Â½Ã¯Â¿Â½<aÃ¯Â¿Â½YÃ¯Â¿Â½Z[]WÃ¯Â¿Â½;ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-|Ã¯Â¿Â½Ã¯Â¿Â½Jw19=(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½Ã•Â®\ZKÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½]Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½QÃ¯Â¿Â½ÃŸâ€¡:ÃŽÂ´Ã¯Â¿Â½Ã¯Â¿Â½XÃâ€¢Ã¯Â¿Â½%Ã¯Â¿Â½~cÃ¯Â¿Â½ZÃ¯Â¿Â½oÃ¯Â¿Â½7JÃ¯Â¿Â½Ã¯Â¿Â½ [Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã¯Â¿Â½Q00Ã¯Â¿Â½pYÃ¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½FE!Ã¯Â¿Â½.AÃªâ€˜Å’Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½]eÃ¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½gl\nÃ¯Â¿Â½ÃƒÂ»Ã¯Â¿Â½Ã¯Â¿Â½OuÃ¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½g=Ã¯Â¿Â½4)W\\uÃ¯Â¿Â½Ã¯Â¿Â½@Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=dÃ¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½oÃ¯Â¿Â½YÃ¯Â¿Â½FÃ¯Â¿Â½IÃ¯Â¿Â½UÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OKÃ¯Â¿Â½Ã¯Â¿Â½,dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½?QÃ¯Â¿Â½kÃ¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½WÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½2[?Ã¯Â¿Â½Ã¯Â¿Â½_oÃ¯Â¿Â½:Ã¯Â¿Â½QÃ¯Â¿Â½uSÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½(I<p^+Ã¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½O@\r;GÃ¯Â¿Â½};R6wLÃ¯Â¿Â½6?Ã¯Â¿Â½rxÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½/Ã¯Â¿Â½-Ã¯Â¿Â½!ÃšÂÃ¯Â¿Â½Ã¯Â¿Â½~Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\rÃ‚Â­Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½g6CÃ¯Â¿Â½j\rluÃšÂ¦Ã¯Â¿Â½Ã¯Â¿Â½QÃ¯Â¿Â½+cÃ¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½gÃ‘Â¥MÃ¯Â¿Â½Ã¯Â¿Â½\0<Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ›â€ Ã¯Â¿Â½PÃ¯Â¿Â½Ã¯Â¿Â½6Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½O5Ã¯Â¿Â½jÃ¯Â¿Â½]9Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½Ã¯Â¿Â½P}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½gXn\"Ã¯Â¿Â½sÃ¯Â¿Â½#Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½0Ã“Â®Ã¢Â»Â´Ã¯Â¿Â½z_Ã¯Â¿Â½8Ã¯Â¿Â½Ã¯Â¿Â½8cÃ¯Â¿Â½_.Ã¯Â¿Â½%p*Ã‚Â¹Ã¯Â¿Â½gÃ¯Â¿Â½r[Ã¯Â¿Â½DÃ¥Â¡â€”Ã¯Â¿Â½^{Ã¯Â¿Â½)Ã¯Â¿Â½	Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½hmÃ¯Â¿Â½,Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[zÃ¯Â¿Â½mbÃ¯Â¿Â½*6#Ã¯Â¿Â½Ã¯Â¿Â½sÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã„Â²Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã–â€žÃ¯Â¿Â½jÃ¯Â¿Â½Ã¯Â¿Â½Ã­Ë†Å¸Ã¯Â¿Â½P+Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5ÃœÂÃ¯Â¿Â½Ã¯Â¿Â½}<Ã¯Â¿Â½\rÃœÂ²Ã¯Â¿Â½GÃ¯Â¿Â½8Ã¯Â¿Â½fÃ¯Â¿Â½{Ã¯Â¿Â½P?ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Xm(Ã¯Â¿Â½Ã¯Â¿Â½axÃ¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½LÃ•Â¥Ã¯Â¿Â½Ã¯Â¿Â½ÃŸÂ½b-2{Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½PÃ¯Â¿Â½2Ã¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|Ã¯Â¿Â½Ãœâ€¢]OPÃ¯Â¿Â½;Ã¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½{CÃ¯Â¿Â½aÃ¯Â¿Â½m:Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½%Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã—Æ’[,Ã¯Â¿Â½RÃ¯Â¿Â½tÃ¯Â¿Â½u=BÃ¯Â¿Â½{q%+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½..)j7Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½GÃ¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½2Ã¯Â¿Â½KÃ¯Â¿Â½Ã¯Â¿Â½ ÃŒâ€˜Ã¯Â¿Â½Ã¯Â¿Â½-Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½\0fÃ¯Â¿Â½<Ã¯Â¿Â½xÃ¯Â¿Â½ki?Ã¯Â¿Â½<JÃ¯Â¿Â½qLÃ¯Â¿Â½\ZÃ¯Â¿Â½#Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½;V%Ã¯Â¿Â½Ã¯Â¿Â½!ÃŽâ€ºÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½mp>Ã¯Â¿Â½Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½I\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xeÃ¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½M5rZÃ¯Â¿Â½ZAÃ¯Â¿Â½Ã«Â§â€¡[6Ã¯Â¿Â½ÃŸÂ»Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½fÃ¯Â¿Â½\rÃ¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½GGÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½\0\08Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½xv^Ã¯Â¿Â½pHÃ¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½kbyÃ¯Â¿Â½>Ã¯Â¿Â½,%Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½XpÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ Ã¯Â¿Â½$Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=QÃ¯Â¿Â½Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\\Ã¥Â¶Â§l4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½ Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½Ã¯Â¿Â½uo\Z+Ã›Â¥Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½Ã‚Â«Ã¯Â¿Â½xÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½r@^M`^Ã¯Â¿Â½ooÃ¯Â¿Â½Ã¯Â¿Â½qÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¦Â§Â²Ã¯Â¿Â½eKÃ¦Â¹Â¹CnÃ¯Â¿Â½2Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½\ZÃ¯Â¿Â½ÃŒÂªÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'\0Ã¯Â¿Â½\0WEoÃ¯Â¿Â½Ã¯Â¿Â½slÃ¯Â¿Â½^LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½W!Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{{hÃ¯Â¿Â½Ã¯Â¿Â½!T Ã¯Â¿Â½1HÃ¯Â¿Â½v$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½#>Ã¯Â¿Â½CZTÃ¯Â¿Â½Ã¯Â¿Â½X ?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½]L,mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½!Ã¯Â¿Â½Ã¯Â¿Â½6\r;Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã’ÂÃ¯Â¿Â½^Ã¯Â¿Â½Ã•Â¿Ã¯Â¿Â½Ã¯Â¿Â½/-Ã¯Â¿Â½Ã¯Â¿Â½W+wÃ¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½=Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½EÃ¯Â¿Â½\"@ÃŽÂ©<Ã¯Â¿Â½Ã¯Â¿Â½k/DÃ¯Â¿Â½oÃ¯Â¿Â½gÃ¯Â¿Â½}Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½quÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½j)5Ã¯Â¿Â½^Ã¯Â¿Â½Ã¯Â¿Â½1Ã–Å¡Ã¯Â¿Â½6xÃ¯Â¿Â½Ã“â€ºÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½5Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½KÃ¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½XÃ¯Â¿Â½$Ã¯Â¿Â½4Ã¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½{Ã¯Â¿Â½Ã“Â­RÃ¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½0Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½fÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½I#Ã¯Â¿Â½5=Ã¯Â¿Â½6Ã¯Â¿Â½+]Ã¯Â¿Â½$t<Ã¯Â¿Â½Ã¯Â¿Â½\Z]Ã¥â€¡Â\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½]5Ã¯Â¿Â½Ã‡â€°Ã¯Â¿Â½Ã¯Â¿Â½nIB\r^Ã¯Â¿Â½Ã¯Â¿Â½\rCIÃ¯Â¿Â½-Ã¯Â¿Â½<Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½IÃ¯Â¿Â½Ã¯Â¿Â½{\ZÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½V.^Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½xÃ—Â´mGÃ¯Â¿Â½WÃ¯Â¿Â½XÃ¯Â¿Â½PÃ¯Â¿Â½`Ã¯Â¿Â½_Ã¯Â¿Â½PhÃ¯Â¿Â½KÃ¯Â¿Â½oÃ¯Â¿Â½\"Ã¯Â¿Â½Ã¯Â¿Â½pÃ¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã—Âº,Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½Ã›ÂS\'Ã¯Â¿Â½Mze\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0xÃ¯Â¿Â½<\'Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½oelÃÂÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½WÃ¯Â¿Â½xd$Ã¯Â¿Â½\'Ã›Â¯G>lÃƒâ€¦>Ã¯Â¿Â½ÃšÂ»Ã¯Â¿Â½(w\0\0\0vQE\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½9msÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½HgÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½mnv1>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^MÃ¯Â¿Â½Ã¯Â¿Â½WRÃ¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½UÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã‘ÂµÃ¯Â¿Â½dÃ¯Â¿Â½=	Ã¯Â¿Â½kÃ¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½KÃ¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½?RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,v3.Ã¯Â¿Â½dlnR?*dÃ¯Â¿Â½iNvzÃ¯Â¿Â½yNÃ¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½vLÃ¯Â¿Â½Ã¯Â¿Â½lÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RLq\"Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½ÃŽÂ£wÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½@.Ã¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½0Ã¯Â¿Â½I=Ã¯Â¿Â½kÃ¯Â¿Â½ZÃ©Â¶Â¹RÃ¯Â¿Â½U-Ã¯Â¿Â½HÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½JÃÂ¦Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ObÃ¯Â¿Â½Ã¯Â¿Â½Ã‰Â­ Ã¯Â¿Â½Ã¯Â¿Â½)Ã¯Â¿Â½Ã¯Â¿Â½ `Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½{Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½ZuO%Ã¯Â¿Â½vÃ¯Â¿Â½xÃ†Â²Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½%b{=JB\0Ã¯Â¿Â½dcÃ¯Â¿Â½&Ã¯Â¿Â½dCpXÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã‘ÂµÃ¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½mNpÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã†Ât8o\ZÃ¯Â¿Â½I.Ã¯Â¿Â½Ã¯Â¿Â½_Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½clvÃ¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½\\Ã¡Å¾Â¤ZÃ¯Â¿Â½ilWQÃ¯Â¿Â½Ã¯Â¿Â½Ã¥Â£ÂÃ¯Â¿Â½+4yÃ¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½y&Ã¯Â¿Â½a%Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½*Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½;/|aÃ¯Â¿Â½oÃ¯Â¿Â½Ã¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½.Ã¯Â¿Â½Ã¯Â¿Â½DÃ¯Â¿Â½MÃ¯Â¿Â½F0Ã¯Â¿Â½Ã¯Â¿Â½~\"kÃ¯Â¿Â½>Kk-DÃ¯Â¿Â½Ã¯Â¿Â½RyÃ¯Â¿Â½8Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½Ã«â€˜Å½Ã¯Â¿Â½Z6`p@Ã¯Â¿Â½Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^ZÃ¯Â¿Â½@^Ã¯Â¿Â½Ã‰Â¦Ã¯Â¿Â½1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã”Â¬Ã¯Â¿Â½Ã¯Â¿Â½rP6F7gÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½wÃ¢Â¯â€¹|5fÃ¯Â¿Â½vzÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½Ã¯Â¿Â½ÃŽÂ¢@Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½AÃ¯Â¿Â½mFÃ¯Â¿Â½>Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½,$Ã¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½Ã˜â€ Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZÃªâ€“Âº=Ã¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½IVIBBÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½^Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\ZÃ¯Â¿Â½Ã¯Â¿Â½\rÃ¯Â¿Â½$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½-\ZÃ¯Â¿Â½Ã¯Â¿Â½NÃ¯Â¿Â½(TÃ¯Â¿Â½_Ã¯Â¿Â½jÃ¯Â¿Â½tÃ¯Â¿Â½UÃ¯Â¿Â½A#Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\'Ã¯Â¿Â½wgLaÃ¯Â¿Â½L{Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½7?Ã¯Â¿Â½Ã¯Â¿Â½CÃ‹Âo%2GÃ¯Â¿Â½AÃ¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½\"Ã¯Â¿Â½^Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½`Ã¯Â¿Â½sÃ¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½FÃ¯Â¿Â½Ã¯Â¿Â½Ã“â€œBÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½cK(Ã¯Â¿Â½o!Ã¯Â¿Â½>oÃ¯Â¿Â½Ã–Å¾Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½:Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½OA]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½]Ã¯Â¿Â½\'Ã¯Â¿Â½Ã¯Â¿Â½Ãâ€ºÃ¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½(Ã”Â¨Ã¯Â¿Â½p9jM\"Ã”ÂÃ¯Â¿Â½CMÃ°Â½Â½ÂÃ¯Â¿Â½yÃ¯Â¿Â½HGVÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½\0Ã¯Â¿Â½|ÃÅ’PÃ¯Â¿Â½NYÃ¯Â¿Â½yvÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½1j>(Ã”â€ Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½-5cÃ¯Â¿Â½bÃ¯Â¿Â½Ã¯Â¿Â½?Ã¯Â¿Â½Ã¯Â¿Â½dnÃ¯Â¿Â½Ã¯Â¿Â½eÃ¯Â¿Â½kvÃ¯Â¿Â½j#RÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½V8Ã¯Â¿Â½Ã§â€˜Ân;Ã¯Â¿Â½Ã¯Â¿Â½OÃ¯Â¿Â½S,~Ã¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½pAÃ¯Â¿Â½%Ã¯Â¿Â½Ã¯Â¿Â½Dz\0?Ã¯Â¿Â½5Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jsmo{#CÃ¯Â¿Â½	$Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½UÃ¯Â¿Â½ÃŒÂXÃ¯Â¿Â½Ã¯Â¿Â½7Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½4Ã¯Â¿Â½2?Ã¯Â¿Â½~\\\nÃ¯Â¿Â½m?MÃ¯Â¿Â½Ã¯Â¿Â½mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;xpÃ¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½+Ã¯Â¿Â½Ã¯Â¿Â½ESQE\0QE\0QE\0V/Ã¯Â¿Â½|1Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½L{-BÃ¯Â¿Â½$Ã¯Â¿Â½|Ã¯Â¿Â½}AÃ¯Â¿Â½Ã¯Â¿Â½(Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½gÃ¯Â¿Â½>9{iÃ¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½ÃÂª\\ Ã¯Â¿Â½}F}\r{P\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\n(Ã¯Â¿Â½Ã¯Â¿Â½\nÃ¯Â¿Â½x3QÃ¯Â¿Â½Ã„Â·\ZÃ¯Â¿Â½Ã¯Â¿Â½jÃ¯Â¿Â½YÃ¯Â¿Â½(yR\"7G(Ã¯Â¿Â½qÃ¯Â¿Â½p?kÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŠÅ’Ã¯Â¿Â½]Ã¯Â¿Â½Ã¯Â¿Â½ZÃ¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½Ã¯Â¿Â½~TÃ¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½HÃ¯Â¿Â½@Ã¯Â¿Â½HÃ¯Â¿Â½4Ã¯Â¿Â½Ã¯Â¿Â½gSmÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½v\rÃ¯Â¿Â½}]$qÃŠÂ»dEu=Ã¯Â¿Â½dVÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½kÃ¯Â¿Â½7Ã¯Â¿Â½tbLmÃ¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½<Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã„Â¼ikq.3!;Pz]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½pÃ¯Â¿Â½9Ã¯Â¿Â½?OÃ¯Â¿Â½\0UtÃ¯Â¿Â½Ã¯Â¿Â½9Ã¯Â¿Â½gÃ¯Â¿Â½,/Ã¯Â¿Â½Ã¤Ââ€ºrÃ¯Â¿Â½Ã¯Â¿Â½\"X{dZ2xKWt ]Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½<Ã¯Â¿Â½_Ã¯Â¿Â½\0Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½w4U!Ã¯Â¿Â½yÃ¯Â¿Â½dÃ¯Â¿Â½\0gÃ¯Â¿Â½JYnYÃ¯Â¿Â½;|Ã¯Â¿Â½Ã¯Â¿Â½zÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½tQÃ¯Â¿Â½@9Ã¯Â¿Â½Ã¯Â¿Â½w0|?Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã…Â¨Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½8Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½jm}-Ã¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½CÃ¯Â¿Â½RÃ¯Â¿Â½PsEÃ¯Â¿Â½wÃ¯Â¿Â½%\\Ã¯Â¿Â½-2Ã¯Â¿Â½yRK+?t(=+NÃ¯Â¿Â½4Ã¯Â¿Â½AE\\\0iÃ¯Â¿Â½Ã¯Â¿Â½WVÃ¯Â¿Â½noÃ™Â²6KÃ¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½50Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½Ã¯Â¿Â½}Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½3Q}qlÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½~nÃ¯Â¿Â½JÃ¯Â¿Â½Ã¯Â¿Â½	Ã¯Â¿Â½*Ã¯Â¿Â½iÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ vÃ¯Â¿Â½SÃ¯Â¿Â½k+JÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½v#Ã¯Â¿Â½|Ã¯Â¿Â½Ã¯Â¿Â½1\'Ã”Å“Ã¢Â»Â½;HÃ¯Â¿Â½mÃ¯Â¿Â½!Ã¯Â¿Â½]Ã¯Â¿Â½X)Ã¯Â¿Â½(\0Ã¯Â¿Â½\0Ã¯Â¿Â½T;Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½0o&7ZÃ¯Â¿Â½Ã¯Â¿Â½BÃ¯Â¿Â½T\rÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½>/Ã§ÂÂ±Ã¯Â¿Â½Ã¯Â¿Â½cÃ¯Â¿Â½~Ã¯Â¿Â½QÃ¯Â¿Â½Ã¯Â¿Â½l-Ã¯Â¿Â½Ã¯Â¿Â½yÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½SÃ¯Â¿Â½~Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½MÃ¯Â¿Â½Ã¯Â¿Â½dÃ¯Â¿Â½=Ã¯Â¿Â½Ã¯Â¿Â½LÃ¯Â¿Â½{IEÃ¯Â¿Â½Ã¯Â¿Â½FÃ¯Â¿Â½SÃ¯Â¿Â½Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½^pÃ¯Â¿Â½Ã¯Â¿Â½veÃ¯Â¿Â½$tÃ¯Â¿Â½Ã¯Â¿Â½uÃ¯Â¿Â½jZÃžÅ¾mÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½CÃ¯Â¿Â½?Ã¯Â¿Â½GÃ¯Â¿Â½Ã¯Â¿Â½&Ã¯Â¿Â½Ã®Å“Ë†nÃ¯Â¿Â½[Ã¯Â¿Â½Ã¯Â¿Â½;Ã¯Â¿Â½fÃ¯Â¿Â½[?Ã¯Â¿Â½*Ã¯Â¿Â½YÃ¯Â¿Â½Ã¯Â¿Â½DÃ¯Â¿Â½|Ã¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½sDÃ¯Â¿Â½;Ã¯Â¿Â½\0GÃ¯Â¿Â½_Ã–ÂµtÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½g\'Ã¯Â¿Â½FyÃ¯Â¿Â½~rÃ¯Â¿Â½^Ã¯Â¿Â½gÃ¯Â¿Â½Ã¯Â¿Â½VÃ¯Â¿Â½mtÃ¯Â¿Â½hÃ¯Â¿Â½cn;h!$Ã¯Â¿Â½qÃ¯Â¿Â½Ã”ÂªG Ã¯Â¿Â½vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½|CÃ¯Â¿Â½#Ã¯Â¿Â½Ã¯Â¿Â½c$vÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½RÃ¯Â¿Â½rAÃ¯Â¿Â½Ã¯Â¿Â½s^Ã¯Â¿Â½Ã¯Â¿Â½\rYx[GÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½rÃ¯Â¿Â½ziÃ¯Â¿Â½Ãžâ€¢Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½*Ã¯Â¿Â½HÃ¯Â¿Â½sr\n(Ã¯Â¿Â½Ã¯Â¿Â½EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPRÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½s4IÃ¯Â¿Â½Ã¯Â¿Â½?ÃŽËœÃ¯Â¿Â½hÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½aÃË†Ã¯Â¿Â½\"Ã¯Â¿Â½Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Ã¯Â¿Â½Ã¯Â¿Â½','2025-12-03 00:28:27'),(407,2073,'Esquera, Raymundo E.','Mandurriao','1949-01-23',76,'M','Widowed','09053359540','','','',NULL,'2025-12-03 00:28:27'),(408,2074,'Aligonero, Larryboy D.','La Paz','1981-04-13',44,'M','Married','09511771244','','','',NULL,'2025-12-03 00:28:27'),(409,2075,'Sondia, Dwight Derek S.','Bacolod ','1999-11-30',25,'M','Single','09565314879','','','',NULL,'2025-12-03 00:28:27'),(410,2076,'Torres, Felix O.','Jaro Iloilo City','1935-11-20',89,'M','Married','09276477560','','','',NULL,'2025-12-03 00:28:27'),(411,2077,'Garbino, Salvacion C.','Hechanova, Jaro Iloilo','1952-02-22',73,'F','Married','09222079350','','','',NULL,'2025-12-03 00:28:27'),(412,2078,'Espada, GenelynT.','San. Miguel, Iloilo','1984-08-14',41,'F','Married','09638925771','','','',NULL,'2025-12-03 00:28:27'),(413,2079,'Lupera, Joenery C.','Balabago, Jaro Iloilo City','1982-03-03',43,'M','Married','09182101120','','','',NULL,'2025-12-03 00:28:27'),(414,2080,'Luceno, Leona M.','Leganes, Iloilo','1986-09-10',39,'F','Married','09177177239','','','',NULL,'2025-12-03 00:28:27'),(415,2081,'Cuben, Renato  P.','San. Miguel, Iloilo','1972-05-17',53,'M','Married','09212824545','','','',NULL,'2025-12-03 00:28:27'),(416,2082,'Jardeloza, Ma. Wella Lou  A.','Landheights Ville, Jaro','1990-06-28',35,'F','Single','09209727009','','','',NULL,'2025-12-03 00:28:27'),(417,2083,'De La Fuente, Pearly  G.','Carles, Iloilo','1978-07-18',47,'F','Married','09517043785','','','',NULL,'2025-12-03 00:28:27'),(418,2084,'Aris, Mayrel  P.','Lj Ledesma, Jaro','2002-05-10',23,'F','Single','09660538306','','','',NULL,'2025-12-03 00:28:27'),(419,2085,'Narte, Krisxan  B.','La Paz','2001-09-16',24,'F','Single','09055197085','','','',NULL,'2025-12-03 00:28:27'),(420,2086,'Legaspi, Rubina  P.','Concepcion, Iloilo','1971-12-08',53,'F','Married','09218837702','','','',NULL,'2025-12-03 00:28:27'),(421,2087,'Epistola, Jose Kenneth  R.','Kabankalan, Neg Occ.','1996-11-03',28,'M','Single','09618242810','','','',NULL,'2025-12-03 00:28:27'),(422,2088,'Sison, Alona  M.','San. Miguel, Iloilo','1977-10-16',48,'F','Married','09984069524','','','',NULL,'2025-12-03 00:28:27'),(423,2089,'Esgrina, Beljohn  G.','Igbaras, Iloilo','1996-12-25',28,'M','Single','09273962860','','','',NULL,'2025-12-03 00:28:27'),(424,2090,'Stuertz, Rosalla  C.','Mandurriao','1967-06-11',58,'F','Widowed','09171244680','','','',NULL,'2025-12-03 00:28:27'),(425,2091,'Aguihap, Kyross Daniel  G.','Jaro Iloilo City','2018-11-11',6,'M','Single','09952319571','','','',NULL,'2025-12-03 00:28:27'),(426,2092,'Consumo, Joviewin  C.','Baldoza, La Paz','1995-11-21',29,'F','Single','09108504468','','','',NULL,'2025-12-03 00:28:27'),(427,2093,'Diosana, Honey Pearl  A.','Lapuz, Iloilo','1992-04-24',33,'F','Single','09514120091','','','',NULL,'2025-12-03 00:28:27'),(428,2094,'Casuyo, Erlinda  S.','Duenas, Iloilo','1957-09-09',68,'F','Single','09104357859','','','',NULL,'2025-12-03 00:28:27'),(429,2095,'Luna, Angela  P.','Sta. Barbara','2002-03-15',23,'F','Single','09630778485','','','',NULL,'2025-12-03 00:28:27'),(430,2096,'Recote, Jocelyn  B.','Bakhaw, Mandurriao','2000-02-03',25,'F','Married','09943615948','Recote, Leonard  B.','09942711918','Husband',NULL,'2025-12-03 00:28:27'),(431,2097,'artus,romar v','Tabuc Suba, Jaro','1992-12-23',32,'M','Married','09107222379','','','',NULL,'2025-12-03 00:28:27'),(432,2098,'Taguibe, Braeden Mark  B.','Btac. Nuevo','2007-05-17',18,'M','Single','09934857173','','','',NULL,'2025-12-03 00:28:27'),(433,2099,'Armada, Josephine  S.','Badiangan, Iloilo','1955-12-23',69,'F','Married','09310548273','','','',NULL,'2025-12-03 00:28:27'),(434,2100,'Armada, Shenry  S.','Badiangan, Iloilo','1993-11-21',31,'M','Single','09310548273','','','',NULL,'2025-12-03 00:28:27'),(435,2101,'Omagtang, Elna Mae  L.','Ticud, La Paz','1985-04-18',40,'F','Married','09669076938','','','',NULL,'2025-12-03 00:28:27'),(436,2102,'Arendain, Aisha Zoe  D.','Bo.Obrero, Lapuz','2018-08-18',7,'F','Single','09949835748','Arendain, Albert John  E.','09949835748','Father',NULL,'2025-12-03 00:28:27'),(437,2103,'Jumayao, Nilda  L.','Balantang, Jaro','1959-07-13',66,'F','Married','09760547310','','','',NULL,'2025-12-03 00:28:27'),(438,2104,'Gumban, John  A.','Pavia, Iloilo','1978-09-02',47,'M','Married','09365604120','','','',NULL,'2025-12-03 00:28:27'),(439,2105,'Lequip, Zendrake  L.','Janiuay, Iloilo','2015-09-17',10,'M','Single','09306481548','','','',NULL,'2025-12-03 00:28:27'),(440,2106,'Sta. Ana, Alianna Thalia  O.','Fajardo, Jaro Iloilo','2000-10-11',25,'F','Single','09272065078','','','',NULL,'2025-12-03 00:28:27'),(441,2107,'Girao, Ron Dave  P.','Rumbang, Pototan','2019-07-08',6,'M','Single','09126698795','','','',NULL,'2025-12-03 00:28:27'),(442,2108,'Gambito, John Francis  G.','Millan Sibunag, Guimaras','1986-07-06',39,'M','Married','09620797407','','','',NULL,'2025-12-03 00:28:27'),(443,2109,'Factuar, Renz Phylis  G.','Tacas Jaro','1991-08-26',34,'M','Married','09196201194','','','',NULL,'2025-12-03 00:28:27'),(444,2111,'Saballa, Melinda  F.','Benedicto, Jaro','1956-08-28',69,'F','Married','09122791777','','','',NULL,'2025-12-03 00:28:27'),(445,2112,'Gonzales, Violenda  L.','E. Lopez St. Jaro','1945-07-27',80,'F','Widowed','09695099464','','','',NULL,'2025-12-03 00:28:27'),(446,2113,'Espino, Gloria  D.','Pavia, Iloilo','1944-09-04',81,'F','Widowed','09457653857','','','',NULL,'2025-12-03 00:28:27'),(447,2114,'Tacsagon, Rongie  C.','Tubungan, Iloilo','1988-03-29',37,'F','Married','09173152044','','','',NULL,'2025-12-03 00:28:27'),(448,2115,'Suarez, Vin Enrique  A.','Sta. Barbara','2019-03-02',6,'M','Single','09108296897','','','',NULL,'2025-12-03 00:28:27'),(449,2116,'Bides, Rose Raquel  Z.','Camalig, Jaro Iloilo','1976-02-02',49,'F','Married','09086300359','','','',NULL,'2025-12-03 00:28:27'),(450,2117,'Zambra, Candice  P.','Camalig, Jaro Iloilo','2020-02-02',5,'F','Single','09086300359','','','',NULL,'2025-12-03 00:28:27'),(451,2118,'Catalan, Rosalinda  P.','Pavia, Iloilo','1957-09-30',68,'F','Widowed','09286162100','','','',NULL,'2025-12-03 00:28:27'),(452,2119,'Abalos, Lucia  T.','Tubungan, Iloilo','1978-10-07',47,'F','Married','09994100216','','','',NULL,'2025-12-03 00:28:27'),(453,2120,'Aldea, Athena Gabrielle  B.','Jaro Iloilo City','2017-09-12',8,'F','Single','09562755171','','','',NULL,'2025-12-03 00:28:27'),(454,2121,'Alde, Ma. Luisa  L.','Tiring, Cabatuan','1973-01-03',52,'F','Married','09062992817','Alde, Joel  S.','','Husband',NULL,'2025-12-03 00:28:27'),(455,2122,'Aldea, Reynaldo  G.','Tinadtaran, Buenavista, Guimaras','1953-09-11',72,'M','Married','09095448242','','','',NULL,'2025-12-03 00:28:27'),(456,2123,'Alegoro, Ashera Rheejhen  G.','San Roque, Jaro Iloilo','2013-10-18',12,'F','Single','09308334755','','','',NULL,'2025-12-03 00:28:27'),(457,2124,'Aguirre, Bronze Romar  L.','Lanit, Jaro','1999-06-15',26,'M','Single','09309774436','','','',NULL,'2025-12-03 00:28:27'),(458,2125,'Aguirre, Ronnie  G.','Brgy. Banica, Roxas Capiz','1976-09-19',49,'M','Married','09052176228','','','',NULL,'2025-12-03 00:28:27'),(459,2126,'Aguirre, Jay Mahelle  L.','Passi City','1984-07-13',41,'F','Married','09915358311','','','',NULL,'2025-12-03 00:28:27'),(460,2127,'Aguirre, Cezar  C.','R. Mapa St. Tabucan, Mandurriao','1956-12-09',68,'M','Married','09288723307','Llemos, Cynthia  ','09202401024','',NULL,'2025-12-03 00:28:27'),(461,2128,'Aguirre, Ignacio  Jr. G.','Balantang, Jaro','1968-10-31',56,'M','Married','09303006089','','','',NULL,'2025-12-03 00:28:27'),(462,2129,'Pedregosa, Lv Marie  C.','Tina, Badiangan Iloilo','2005-12-11',19,'F','Single','09127039053','Pedregosa, Vilma  C.','','Mother',NULL,'2025-12-03 00:28:27'),(463,2130,'Braganza, Edelyn  L.','Balabag, New Lucena','1998-03-21',27,'F','Single','09667167102','','','',NULL,'2025-12-03 00:28:27'),(464,2131,'Cervatos, Yzra Marielle  I.','Dingle, Iloilo','2001-10-14',24,'F','Single','09301910235','','','',NULL,'2025-12-03 00:28:27'),(465,2132,'Siaotong, Romeo  M.','Don Francisco Vill. Jaro','1940-07-23',85,'M','Widowed','09127798402','','','',NULL,'2025-12-03 00:28:27'),(466,2133,'Bendicion, Simelle Joyce  F.','San. Miguel, Iloilo','1998-10-03',27,'F','Single','09956404004','','','',NULL,'2025-12-03 00:28:27'),(467,2134,'Penafiel, Jhian Paulo  ','Brgy. Sambag, Jaro Iloilo','2008-01-26',17,'M','Single','09630427477','Janay, Elenita  ','','Aunt',NULL,'2025-12-03 00:28:27'),(468,2135,'Fabiana, Ma. Rena  B.','Jaro Iloilo City','1970-09-29',55,'F','Married','09468611193','','','',NULL,'2025-12-03 00:28:27'),(469,2136,'Buaron, Imaelyn  A.','Estancia, Iloilo','1996-11-13',28,'F','Single','09167881293','','','',NULL,'2025-12-03 00:28:27'),(470,2137,'Dinson, Jerry Jose  D.','Brgy. Katilingban, Molo Iloilo City','1967-11-07',57,'M','Married','09078109890','','','',NULL,'2025-12-03 00:28:27'),(471,2138,'Cordero, Keenan  H.','Jaro Iloilo City','1978-02-23',47,'M','Married','09685523079','','','',NULL,'2025-12-03 00:28:27'),(472,2139,'Jereza, Edmundo  M.','Cuartero, Jaro Iloilo City','1931-11-16',93,'M','Married','09814107853','','','',NULL,'2025-12-03 00:28:27'),(473,2140,'Gumban, Sofia Renee  B.','Bakhaw, Mandurriao','2012-05-25',13,'F','Single','09464129821','','','',NULL,'2025-12-03 00:28:27'),(474,2141,'Hulleza, Christopher  S.','Brgy. Anuang, Cabatuan','1976-12-25',48,'M','Married','09301287747','','','',NULL,'2025-12-03 00:28:27'),(475,2142,'Gumapas, Ethan Kiel  G.','Alimodian, Iloilo','2018-04-01',7,'M','Single','09197565655','Gumapas, Kristine Ann  ','','Mother',NULL,'2025-12-03 00:28:27'),(476,2143,'Austria, Francis Gabriel  P.','Molo, Iloilo City','2007-06-16',18,'M','Single','09178778058','','','',NULL,'2025-12-03 00:28:27'),(477,2144,'Austria, Romano  E.','Molo, Iloilo City','1978-03-09',47,'M','Married','09178778058','','','',NULL,'2025-12-03 00:28:27'),(478,2145,'Areno, Mary Joy  M.','Tapacon, Bingawan, Iloilo','1990-09-27',35,'F','Married','09303576870','','','',NULL,'2025-12-03 00:28:27'),(479,2146,'Mejia, Enrico Paul  T.','Alta Tierra, Jaro','2020-05-15',5,'M','Single','09778539401','','','',NULL,'2025-12-03 00:28:27'),(480,2147,'Mejia, Paul Johnrick  T.','Alta Tierra, Jaro Iloilo','2016-12-04',8,'M','Single','09778539401','','','',NULL,'2025-12-03 00:28:27'),(481,2148,'Iscala, Emelie  A.','M.H. Del Pilar, Jaro','1956-01-26',69,'F','Married','09208202884','','','',NULL,'2025-12-03 00:28:27'),(482,2149,'Austria, Sofia  P.','Infante, Molo Iloilo','1981-09-14',44,'F','Married','09228766617','','','',NULL,'2025-12-03 00:28:27'),(483,2150,'Miranda, Jake  O.','Tamocol, Badiangan','2025-11-29',0,'M','Single','09305775360','','','',NULL,'2025-12-03 00:28:27'),(484,2151,'De Pedro, Marie Claudale  G.','Benedicto, Jaro','1979-08-02',46,'F','Single','09275965122','','','',NULL,'2025-12-03 00:28:27'),(485,2153,'Esmeralda, Charlie Shayne  A.','Ortiz Street Iloilo City','2006-12-20',18,'M','Single','09291660349','','','',NULL,'2025-12-03 00:28:27'),(486,2154,'De Pedro, Marie Claudale  D.','Brgy. Benedicto, Jaro Iloilo City','1979-08-02',46,'F','Married','09275965122','','','',NULL,'2025-12-03 00:28:27'),(487,2155,'Mendoza, Ninfa  C.','Jaro Iloilo City','1958-10-14',67,'F','Married','09107873433','','','',NULL,'2025-12-03 00:28:27'),(488,2156,'Barron, Vincent  A.','Brgy. Ortiz Iloilo City','1946-11-25',78,'M','Married','09684173861','','','',NULL,'2025-12-03 00:28:27'),(489,2157,'Destacamento, Reydel  B.','Brgy. Rojas. Ajuy Iloilo','1986-08-03',39,'M','Single','09665032028','','','',NULL,'2025-12-03 00:28:27'),(490,2158,'Bungubung, Huden Ray  T.','Parara Sur, Tigbauan, Iloilo','1977-11-18',47,'M','Married','09394679434','','','',NULL,'2025-12-03 00:28:27'),(491,2159,'Victoria, Arthur  A.','Iloilo City','1985-02-28',40,'M','Single','09423374638','','','',NULL,'2025-12-03 00:28:27'),(492,2160,'Villegas, Joemar  Jr. D.','Quintin Salas, Jaro Iloilo City','1987-04-01',38,'M','Married','09097468144','','','',NULL,'2025-12-03 00:28:27'),(493,2161,'Dionio, Marieta  L.','Dacutan, Dumangas','1953-04-23',72,'F','Widowed','09957236819','','','',NULL,'2025-12-03 00:28:27'),(494,2162,'Bernas, Samuel  O.','Balabag, Dumangas','1958-01-14',67,'M','Married','09219396144','','','',NULL,'2025-12-03 00:28:27'),(495,2163,'Gulmatico, Ma. Catherine  A.','Linayuan, Badiangan Iloilo','1964-03-09',61,'F','Single','09603120090','','','',NULL,'2025-12-03 00:28:27'),(496,2164,'Caumban, Jayme  A.','E. Lopez St. Jaro','1956-10-10',69,'M','Married','09284513707','','','',NULL,'2025-12-03 00:28:27'),(497,2165,'Balsamo, Ma. Mina. Zofia  A.','Nipa, San Dionisio, Iloilo','2011-11-28',13,'F','Single','09670519799','Balsamo, Hernalyn  ','','Mother',NULL,'2025-12-03 00:28:27'),(498,2166,'Cabello, Arieh Nathaniel  D.','Cabatuan','2013-12-17',11,'M','Single','09055274969','','','',NULL,'2025-12-03 00:28:27'),(499,2167,'Boctil, Rizal  B.','Calinog Iloilo','1985-09-08',40,'M','Married','09953559662','','','',NULL,'2025-12-03 00:28:27'),(500,2168,'Daquinan, Christian Vic  C.','Calinog Iloilo','2011-05-20',14,'M','Single','09087264561','','','',NULL,'2025-12-03 00:28:27'),(501,2169,'Labarigo, May  S.','Lambunao','1977-01-31',48,'F','Married','09502076479','','','',NULL,'2025-12-03 00:28:27'),(502,2170,'Pineda, Eliza  J.','Cabatuan','1980-01-23',45,'F','Married','09667015277','','','',NULL,'2025-12-03 00:28:27'),(503,2171,'Casio, Porferio  Jr. B.','Dumangas','1992-06-22',33,'M','Single','09859480605','','','',NULL,'2025-12-03 00:28:27'),(504,2172,'Gayomali, Jeonar  L.','Sta. Barbara, Iloilo','1975-01-14',50,'M','Married','09394658460','','','',NULL,'2025-12-03 00:28:27'),(505,2173,'Buni, Trisha Anne  E.','Pavia, Iloilo','2001-11-21',23,'F','Single','09981816170','','','',NULL,'2025-12-03 00:28:27'),(506,2174,'Rabin, Jandy  S.','Bungsuan, Dumarao Capiz','1999-01-13',26,'M','Single','09278256835','','','',NULL,'2025-12-03 00:28:27'),(507,2175,'Pruto, Romie  A.','Lambunao, Iloilo','1977-03-11',48,'M','Married','09216953740','','','',NULL,'2025-12-03 00:28:28'),(508,2176,'Pueda, Airien  H.','Lanit, Jaro','1983-06-02',42,'F','Married','09462627347','','','',NULL,'2025-12-03 00:28:28'),(509,2177,'Capalla, Victoria  L.','Jaro Iloilo City','1945-06-27',80,'F','Widowed','09266520719','','','',NULL,'2025-12-03 00:28:28'),(510,2178,'Araojo, Lance Gabriel  S.','San Isidro, Jaro','2009-12-30',15,'M','Single','09462294641','','','',NULL,'2025-12-03 00:28:28'),(511,2179,'Henarios, Joebert  H.','Balabago, Jaro Iloilo City','1977-07-29',48,'M','Married','09079136940','','','',NULL,'2025-12-03 00:28:28'),(512,2180,'Fuertes, Alexa Khimdreyn  E.','Sta. Cruz Arevalo Iloilo City','2002-09-19',23,'F','Single','09234040540','','','',NULL,'2025-12-03 00:28:28'),(513,2181,'Nagar, Heira Joy  D.','Buyu-An, Tigbauan, Iloilo','2003-03-12',22,'F','Single','09157236417','','','',NULL,'2025-12-03 00:28:28'),(514,2182,'Gumban, Ralphy  S.','San Juan Blvd, Molo','1986-06-18',39,'M','Married','09093017757','','','',NULL,'2025-12-03 00:28:28'),(515,2183,'Gumban, Ma. Clarrenil  P.','Bakhaw, Mandurriao','1985-09-26',40,'F','Single','09959010457','','','',NULL,'2025-12-03 00:28:28'),(516,2184,'Gumban, Rene  P.','Bakhaw, Mandurriao','1980-09-15',45,'M','Married','09081602919','','','',NULL,'2025-12-03 00:28:28'),(517,2185,'Gumban, Reneil Aron  P.','Bakhaw, Mandurriao','2021-04-29',4,'M','Single','09081602919','','','',NULL,'2025-12-03 00:28:28'),(518,2186,'Gumban, Precious  B.','Bakhaw, Mandurriao','1987-03-27',38,'F','Married','09464129821','','','',NULL,'2025-12-03 00:28:28'),(519,2187,'Gutierrez, Mearch Vincent  S.','Ungka, Pavia','2002-04-23',23,'M','Single','09296720154','','','',NULL,'2025-12-03 00:28:28'),(520,2188,'Gustilo, Orly John  S.','Balabag, Dumangas','1988-01-13',37,'M','Married','09105611357','','','',NULL,'2025-12-03 00:28:28'),(521,2189,'Gupiteo, Ralph  D.','Sambag, Jaro','1991-05-12',34,'M','Married','09686762444','','','',NULL,'2025-12-03 00:28:28'),(522,2190,'Gumboc, Khaled  G.','Botong, Oton','2021-01-09',4,'M','Single','09997655389','','','',NULL,'2025-12-03 00:28:28'),(523,2191,'Gilapay, Lydia  T.','Alimodian, Iloilo','1953-07-17',72,'F','Married','09506011105','','','',NULL,'2025-12-03 00:28:28'),(524,2192,'Jangit, Janris  S.','Tacas Jaro','2006-01-29',19,'M','Single','09940466825','','','',NULL,'2025-12-03 00:28:28'),(525,2193,'Hopilos, Gil  T.','Napnud, Leganes','1942-09-01',83,'M','Married','09093813248','','','',NULL,'2025-12-03 00:28:28'),(526,2194,'Geraldoy, Miguel Oliver  T.','Pavia, Iloilo','2003-05-29',22,'M','Single','09278314423','','','',NULL,'2025-12-03 00:28:28'),(527,2195,'Sondon, Akhila Key  S.','Rumbang, Pototan','2019-11-11',6,'F','Single','09493230125','','','',NULL,'2025-12-03 00:28:28'),(528,2196,'Pendon, Mary Janet  P.','Duenas, Iloilo','1973-10-09',52,'F','Single','09518641836','','','',NULL,'2025-12-03 00:28:28'),(529,2197,'Geraldoy, Robelyn  T.','E. Lopez St. Jaro','1973-01-11',52,'F','Married','09278314423','','','',NULL,'2025-12-03 00:28:28'),(530,2198,'Hermocillas, Kylah Faith  L.','Calumpang, Molo Iloilo','2012-09-06',13,'F','Single','09667760867','Hormicillas, Rose  ','','Mother',NULL,'2025-12-03 00:28:28'),(531,2199,'Tuares, Christian  R.','Parara Sur, Tigbauan, Iloilo','1985-09-20',40,'M','Married','09286302691','','','',NULL,'2025-12-03 00:28:28'),(532,2200,'Tuando, Mary Ann  M.','Batad, Iloilo','1983-11-19',41,'F','Married','09088103823','','','',NULL,'2025-12-03 00:28:28'),(533,2201,'Tuala, Divine Grace  C.','Badiangan, Iloilo','1997-01-23',28,'F','Single','09664937232','','','',NULL,'2025-12-03 00:28:28'),(534,2202,'Tuante, Sidnne Blue  D.','Tigbauan Iloilo','2016-07-15',9,'M','Single','09466388282','','','',NULL,'2025-12-03 00:28:28'),(535,2203,'Porras, Zachary Jeff  M.','San Matias, Dingle','2024-03-27',1,'M','Single','09072093898','Porras, Divine Grace  ','','Mother',NULL,'2025-12-03 00:28:28'),(536,2204,'Tiano, Cesar  V.','Bacolod ','1970-06-05',55,'M','Single','09279504108','','','',NULL,'2025-12-03 00:28:28'),(537,2205,'Tabuada, Analyn  J.','Tacas Jaro','1973-03-02',52,'F','Married','09202727047','','','',NULL,'2025-12-03 00:28:28'),(538,2206,'Habawel, Erynn Dominique  G.','Oton, Iloilo','2016-07-18',9,'F','Single','09205253237','','','',NULL,'2025-12-03 00:28:28'),(539,2207,'Habawel, Chardelle Athena  G.','Oton, Iloilo','2014-05-20',11,'F','Single','09054104130','','','',NULL,'2025-12-03 00:28:28'),(540,2208,'Naranjilla, Lorenzo  C.','Mandurriao','1946-03-21',79,'M','Married','09086093093','','','',NULL,'2025-12-03 00:28:28'),(541,2209,'Samaniego, Juana  L.','Talaba, Badiangan','1939-03-29',86,'F','Married','09162781864','','','',NULL,'2025-12-03 00:28:28'),(542,2210,'Caro, Adeline Joy  H.','Calaparan, Arevalo, Iloilo City','2018-05-16',7,'F','Single','09086028436','Hurtada, Pinky  ','','Mother',NULL,'2025-12-03 00:28:28'),(543,2211,'Castronuevo, Rex  M.','Pob. Bingawan, Iloilo','1971-09-23',54,'M','Married','09664956521','','','',NULL,'2025-12-03 00:28:28'),(544,2212,'Belicaria, Virgilio  N.','Brgy. Sambag, Zarraga, Iloilo','1970-11-30',54,'M','Married','09497806199','','','',NULL,'2025-12-03 00:28:28'),(545,2213,'Caminian, Archie  T.','Brgy. Balabag, Pavia, Iloilo','1980-12-27',44,'M','Married','09776870418','Caminian, Imee Marie  ','','Wife',NULL,'2025-12-03 00:28:28'),(546,2214,'Cancel, Lv Marie  F.','Oton, Iloilo','1993-08-01',32,'F','Single','09127935854','','','Wife',NULL,'2025-12-03 00:28:28'),(547,2215,'Carton, Jayson Mark  M.','Aganan, Pavia','1989-12-09',35,'M','Single','09452756524','','','Wife',NULL,'2025-12-03 00:28:28'),(548,2216,'Bretana, John Philip  S.','Cabugao Norte Sta. Barbara Iloilo','1993-05-07',32,'M','Married','09630426908','','','Wife',NULL,'2025-12-03 00:28:28'),(549,2217,'Bernadas, Marvin Donne  B.','Jaro Iloilo City','1990-12-21',34,'M','Single','09951084297','','','Wife',NULL,'2025-12-03 00:28:28'),(550,2218,'Basito, Jennifer  E.','Btac. Nuevo, Iloilo','1992-07-15',33,'M','Single','09672987366','','','Wife',NULL,'2025-12-03 00:28:28'),(551,2219,'Casador, Ma. Jelith  S.','Caranas, Janiuay','1969-08-20',56,'F','Married','09099003744','','','',NULL,'2025-12-03 00:28:28'),(552,2220,'Camarista, Emmanuel Teodoro  D.','Mina, Iloilo','2014-01-21',11,'M','Single','09165675550','','','',NULL,'2025-12-03 00:28:28'),(553,2221,'Camarista, Teodoro  C.','Mina, Iloilo','1959-04-17',66,'M','Married','09165675550','','','',NULL,'2025-12-03 00:28:28'),(554,2222,'Batac, Virgilio  B.','Tabugon, Dingle, Iloilo','1952-04-07',73,'M','Married','09109226608','','','',NULL,'2025-12-03 00:28:28'),(555,2223,'Basence, Andre Allan  M.','Alta Tierra, Jaro Iloilo','2011-04-06',14,'M','Single','09613076405','','','',NULL,'2025-12-03 00:28:28'),(556,2224,'Brasileno, Ruth  G.','Mandurriao','1965-12-29',59,'F','Married','09897766543','','','',NULL,'2025-12-03 00:28:28'),(557,2225,'Huyaban, Arley  P.','Leganes, Iloilo','1984-03-06',41,'M','Married','09437096407','','','',NULL,'2025-12-03 00:28:28'),(558,2226,'Husmillo, Liza  H.','San Isidro, Jaro','1977-02-08',48,'F','Married','09095228524','','','',NULL,'2025-12-03 00:28:28'),(559,2227,'Husmillo, Marlon  H.','San Isidro, Jaro','1980-09-17',45,'M','Married','09386575781','','','',NULL,'2025-12-03 00:28:28'),(560,2228,'Hugo, Beberly  R.','Sta. Barbara, Iloilo','1982-10-12',43,'F','Married','09686655361','','','',NULL,'2025-12-03 00:28:28'),(561,2229,'Hugo, Mateo Jose  D.','Buhang, Jaro','2011-05-07',14,'M','Single','09171192329','','','',NULL,'2025-12-03 00:28:28'),(562,2230,'Hugo, Relina  D.','Buhang, Jaro','1976-07-25',49,'F','Married','09278472864','','','',NULL,'2025-12-03 00:28:28'),(563,2231,'Huenda, Irish Grace  V.','Passi City','1995-10-25',30,'F','Single','09506314927','','','',NULL,'2025-12-03 00:28:28'),(564,2232,'Huelar, Dorothy Joy  H.','South Fundidor, Molo','1983-10-06',42,'F','Single','09394682277','','','',NULL,'2025-12-03 00:28:28'),(565,2233,'Hudtohan, Renee  C.','North Fundidor, Molo','1950-07-30',75,'F','Widowed','09156246977','','','',NULL,'2025-12-03 00:28:28'),(566,2234,'Hubo, Richard  L.','Alta Tierra, Jaro Iloilo','1972-08-19',53,'M','Married','09282777053','','','',NULL,'2025-12-03 00:28:28'),(567,2235,'Hubero, Joan Kesse  L.','Mandurriao','1993-09-09',32,'F','Married','09175024822','','','',NULL,'2025-12-03 00:28:28'),(568,2236,'Hubag, Cheryl  B.','Pavia, Iloilo','1979-02-17',46,'F','Married','09217611420','','','',NULL,'2025-12-03 00:28:28'),(569,2237,'Hortillosa, Dennis  L.','Mansaya, Lapuz, Iloilo','1950-12-30',74,'M','Married','09206554073','','','',NULL,'2025-12-03 00:28:28'),(570,2238,'Hopillos, Hans Christian  R.','Napnud, Leganes','2005-12-22',19,'M','Single','09093813248','','','',NULL,'2025-12-03 00:28:28'),(571,2239,'Honorario, Darleen  L.','Igbaras, Iloilo','1985-08-29',40,'F','Single','09614812410','','','',NULL,'2025-12-03 00:28:28'),(572,2240,'Honorario, Vilma  L.','Igbaras, Iloilo','1953-02-23',72,'F','Widowed','09062257601','','','',NULL,'2025-12-03 00:28:28'),(573,2241,'Hong, Ziqing  L.','La Paz, Iloilo City','2020-05-11',5,'F','Single','09277711710','','','',NULL,'2025-12-03 00:28:28'),(574,2242,'Hondrade, Jude Kenneth  L.','Balabag, Pavia','1988-10-28',37,'M','Married','09981983453','','','',NULL,'2025-12-03 00:28:28'),(575,2243,'Buenaflor, John  B.','Barotac Viejo, Iloilo','1969-06-24',56,'M','Married','09684218616','','','',NULL,'2025-12-03 00:28:28'),(576,2244,'De La Cruz, Airene  A.','Tacas Jaro','1988-02-09',37,'F','Married','09090311569','','','',NULL,'2025-12-03 00:28:28'),(577,2245,'Vilonero, Kim John  M.','Batad, Iloilo','1993-03-25',32,'M','Single','09274918347','','','',NULL,'2025-12-03 00:28:28'),(578,2246,'Capaniarihan, Estrella  G.','Desamparados, Jaro Iloilo','1973-05-21',52,'F','Single','09817679548','','','',NULL,'2025-12-03 00:28:28'),(579,2247,'Cuenca, Kent Ivan  D.','Jaro Iloilo City','2003-12-30',21,'M','Single','09288187180','','','',NULL,'2025-12-03 00:28:28'),(580,2248,'Calama-An, Adam Macwil  C.','Sarapan, Passi City','2017-02-02',8,'M','Single','09957497985','','','',NULL,'2025-12-03 00:28:28'),(581,2249,'Bernal, Kezzia  A.','Carles, Iloilo','2010-04-17',15,'F','Single','09707148138','','','',NULL,'2025-12-03 00:28:28'),(582,2250,'Cuenca, Rodita  D.','Jaro Iloilo City','1973-11-15',52,'F','Married','09255443219','','','',NULL,'2025-12-03 00:28:28'),(583,2251,'Hojilla, Constancia  M.','Balabago, Jaro Iloilo City','1936-09-14',89,'F','Married','09503255456','','','',NULL,'2025-12-03 00:28:28'),(584,2252,'Hojilla, Roselle Mae  K.','E. Lopez St. Jaro','1998-04-13',27,'F','Single','09103603440','','','',NULL,'2025-12-03 00:28:28'),(585,2253,'Hisugan, Perfecto  Jr. H.','Pavia, Iloilo','1972-01-08',53,'M','Married','09198699568','','','',NULL,'2025-12-03 00:28:28'),(586,2254,'Cuben, Hannah Crislyn  P.','San. Miguel, Iloilo','2006-06-13',19,'F','Single','09212001588','','','',NULL,'2025-12-03 00:28:28'),(587,2255,'Guycoa, Ram Cedrick  G.','Cabatuan','2015-01-27',10,'M','Single','09452641350','','','',NULL,'2025-12-03 00:28:28'),(588,2256,'Guzman, Cristina  F.','Balabago, Jaro Iloilo City','1955-09-29',70,'F','Married','09064255927','','','',NULL,'2025-12-03 00:28:28'),(589,2257,'Palotes, Erica  N.','Rizal, Lapuz Sur, Iloilo City','2002-02-11',23,'F','Single','09083482881','','','',NULL,'2025-12-03 00:28:28'),(590,2258,'Remegio, Cassey Allana  M.','Passi City','2013-02-14',12,'F','Single','09125473927','','','',NULL,'2025-12-03 00:28:28'),(591,2259,'Pimentel, Kathrynn  P.','North Metropolis, Jaro Iloilo City','1993-03-04',32,'F','Single','09060112425','','','',NULL,'2025-12-03 00:28:28'),(592,2260,'Armada, Edwin  A.','Jaro Iloilo City','1969-10-22',56,'M','Married','09625878483','','','',NULL,'2025-12-03 00:28:28'),(593,2261,'Torres, Philina  D.','Mandurriao','1948-07-04',77,'F','Married','09127747279','','','',NULL,'2025-12-03 00:28:28'),(594,2262,'Landero, Michelle  M.','Poblacion, Leganes','1990-12-10',34,'F','Single','09127747279','','','',NULL,'2025-12-03 00:28:28'),(595,2263,'Cubar, Cheny Jen  E.','Barotac Nuevo, Iloilo','1997-11-19',27,'F','Single','09627721142','','','',NULL,'2025-12-03 00:28:28'),(596,2264,'Serojano, Nita  D.','Cagbang, Oton','1975-06-03',50,'F','Married','09078316728','','','',NULL,'2025-12-03 00:28:28'),(597,2265,'Borci, Albert John  H.','Compania, Molo','2005-08-24',20,'M','Single','09105053593','','','',NULL,'2025-12-03 00:28:28'),(598,2266,'Chu, Nannah  T.','La Paz, Iloilo City','1982-06-16',43,'F','Married','09184022625','','','',NULL,'2025-12-03 00:28:28'),(599,2267,'Barte, Aimee Marie  S.','Jaro Iloilo City','2000-04-21',25,'F','Single','09279534945','','','',NULL,'2025-12-03 00:28:28'),(600,2268,'Garcia, Prince Joemarie  G.','Pavia, Iloilo','2015-12-12',9,'M','Single','09095269168','','','',NULL,'2025-12-03 00:28:28'),(601,2269,'Loriega, France Raeven  M.','Cabanga-An, Badiangan','2013-04-01',12,'M','Single','09127575000','','','',NULL,'2025-12-03 00:28:28'),(602,2270,'Pedrajas, Novie  P.','Pototan, Iloilo','1957-11-28',67,'M','Married','09774178257','','','',NULL,'2025-12-03 00:28:28'),(603,2271,'Marquez, Genalyn  A.','Ajuy, Iloilo','1976-02-20',49,'F','Married','09707891388','','','',NULL,'2025-12-03 00:28:28'),(604,2272,'Toriaga, Sweeth Zhel  R.','Mandurriao','1999-10-19',26,'F','Single','09686491000','','','',NULL,'2025-12-03 00:28:28'),(605,2273,'Pablo, Ana Rose  O.','Brgy. Fatima, Jaro','1988-11-05',37,'F','Single','09156181130','','','',NULL,'2025-12-03 00:28:28'),(606,2274,'Hermano, April Love  G.','Jayme St. Jaro','1989-04-06',36,'F','Married','09463056154','','','',NULL,'2025-12-03 00:28:28'),(607,2275,'Hembra, Stella Marie  H.','Jaro Iloilo City','1982-09-10',43,'F','Married','09494246251','','','',NULL,'2025-12-03 00:28:28'),(608,2276,'Hechanova, Nelda  B.','Jaro Iloilo City','1969-09-17',56,'F','Married','09199777147','','','',NULL,'2025-12-03 00:28:28'),(609,2277,'Palonpon, Leanard Anthony  J.','Jaro Iloilo City','1998-07-07',27,'M','Single','09565287854','','','',NULL,'2025-12-03 00:28:28'),(610,2278,'Santuyo, Resty  D.','Ajuy, Iloilo','1995-10-29',30,'M','Single','09955654172','','','',NULL,'2025-12-03 00:28:28'),(611,2279,'Blance, Reynaldo  B.','Sambag, Jaro','1953-08-23',72,'M','Married','09303658049','','','',NULL,'2025-12-03 00:28:28'),(612,2280,'Taleon, Mary Veian  T.','Brgy. Amiroy, Mina','2023-11-14',2,'F','Single','09157738093','','','',NULL,'2025-12-03 00:28:28'),(613,2281,'Sarabia, Rene  Sr. S.','394 E Lopez St Jaro','1954-07-17',71,'M','Widowed','09083088888','','','',NULL,'2025-12-03 00:28:28'),(614,2282,'Lapidante, Maria Teresa  A.','Simon Ledesma, Jaro','1970-09-19',55,'F','Married','09983520610','','','',NULL,'2025-12-03 00:28:28'),(615,2283,'Nolasco, Melina  D.','Jaro Iloilo City','1963-11-27',61,'F','Widowed','09175354296','','','',NULL,'2025-12-03 00:28:28'),(616,2284,'Pagaran, Renz Bryan  T.','San Juaquin, Iloilo','1993-04-24',32,'M','Single','09563922380','','','',_binary 'Ã¿Ã˜Ã¿Ã \0JFIF\0\0`\0`\0\0Ã¿Ã›\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342Ã¿Ã›\0C			\r\r2!!22222222222222222222222222222222222222222222222222Ã¿Ã€\0\0Ã€\0Ã€\"\0Ã¿Ã„\0\0\0\0\0\0\0\0\0\0\0	\nÃ¿Ã„\0Âµ\0\0\0}\0!1AQa\"q2Ââ€˜Â¡#BÂ±ÃRÃ‘Ã°$3brâ€š	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÆ’â€žâ€¦â€ â€¡Ë†â€°Å â€™â€œâ€â€¢â€“â€”Ëœâ„¢Å¡Â¢Â£Â¤Â¥Â¦Â§Â¨Â©ÂªÂ²Â³Â´ÂµÂ¶Â·Â¸Â¹ÂºÃ‚ÃƒÃ„Ã…Ã†Ã‡ÃˆÃ‰ÃŠÃ’Ã“Ã”Ã•Ã–Ã—Ã˜Ã™ÃšÃ¡Ã¢Ã£Ã¤Ã¥Ã¦Ã§Ã¨Ã©ÃªÃ±Ã²Ã³Ã´ÃµÃ¶Ã·Ã¸Ã¹ÃºÃ¿Ã„\0\0\0\0\0\0\0\0	\nÃ¿Ã„\0Âµ\0\0w\0!1AQaq\"2ÂBâ€˜Â¡Â±Ã	#3RÃ°brÃ‘\n$4Ã¡%Ã±\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzâ€šÆ’â€žâ€¦â€ â€¡Ë†â€°Å â€™â€œâ€â€¢â€“â€”Ëœâ„¢Å¡Â¢Â£Â¤Â¥Â¦Â§Â¨Â©ÂªÂ²Â³Â´ÂµÂ¶Â·Â¸Â¹ÂºÃ‚ÃƒÃ„Ã…Ã†Ã‡ÃˆÃ‰ÃŠÃ’Ã“Ã”Ã•Ã–Ã—Ã˜Ã™ÃšÃ¢Ã£Ã¤Ã¥Ã¦Ã§Ã¨Ã©ÃªÃ²Ã³Ã´ÃµÃ¶Ã·Ã¸Ã¹ÃºÃ¿Ãš\0\0\0?\0Ã­@ dÃ±RÃ„Ã£	ÃžÂ¼fÂ¹_Â²Â©Ã«Å Ã–Ã’cÃ²Ã¸Ã¸â€¡ÃµÂ¨IÃœÃ…:Å¡â€\ZÂMIÅ¡ÃÃ˜â„¢[Å â€UÃ”Ã”Å haMrÃŸ?â€¦/Ã›Ã»Â°9Ã¿\0Ã‡MtÃŠi&â€š+Ë†Ãš9Â£Yâ€ \nÂ°Ãˆ4Ã€Ã²Ã¾)i6â€“Q@-Â®Â¥(Å Â¹Ã›ÂÃ€ÃºTÃ°Â¶\"â€˜Ââ€œÂ£ÃžÂ¾{Æ’Ã—Ã´Â¯XÆ’FÂ±Â·Ã¿\0UmÃ®FY1Ãƒ2Â®Nj]7Â©ÂÂ±ÂVy_ÂµvÃ¦Ã“Ãƒ7Â®OLÂ©oÃ¤)/Ã¼KÃ¢ÃoLÅ¡ÃŠO	]Â¬s.Ã’Ã‚~â€ Â½â€šÃ™Â­nÂ´Ãƒ*Æ’â€šc`Ã€N*ÃšDÂ£Â·Ã©U\Z4Ã–Â©Â£\rÃÃ­%Â¤:UÂ©â€¢\Z9)Â¹`Â©Ãš2\rh+dUeÃ€\\TÂâ€ +VÂ®hNÂâ€œY+Â©5Ã–Â³6Å¸Â«Aâ€™BÃ‰Â¸ÂqÃ¯VÂ¥â€ ÃµW&Ã¶Ã˜Ã™Â·oÃ¾.â€™JÃ¦rÅ¡Z2Ã¡â€?ZÃ¥Ãµ4Â®ÂÃ¬ne\\Ã‰zÂ»Ã©â€;â„¢5ÂÂ¨Ã†|â‚¬I$Ã­$uÂ«zÂ¢!4Ã¥dq\ZÂ´eÃ¬Â®Q~Ã³FÃ€~FÂ¦Â·ÂI\ZÂºÅ¸â€¢â€ GÃ’Â¥Â»_â„¢Â³Ã“5CHÃœ4Ã«PÃ¸Ãœ\"PÃ˜ÃµÃ€ÃÃ«\\ÃNÃžâ€ Ã”Â¼ÃŸÃ<Ã»loÃ°Â®Ã®Ã–woÃšÃ­\nNÃ¦SÂ¸Ã´Ãƒ\ZÃ a}Å qÃ·â€¹Â _Ã…â‚¬?Â¡Â®Ã«Ãƒ`\\hÃ³#sÃ¥\\Å“ÂªÂ©Ã¾Âµm^\'\rtÃšâ€™DÂ©KIÂ®ÃžI7â€¦,vÂ¶Ã•Ã§wÃŒ|Â·\'Â·5Ã¨ÂºÃ£Â¥Â¾Â0^20Ã”Ã—Å¡ÃžÅ¸ÃÂ· de=4+&ÃÂ¡Ã¾Y/Ã£ÃZâ‚¬\"Å“**Ã±Ã˜bÂªâ€”Â>Ã¼Ë†Â¿Ã¯043Ã‚Ã›Â¼Â¹Â£sÂÃ¡pÂ­$Ã•ÃŠLÃ˜Zâ€™Â FÃ Tâ„¢Â­\rIAÂ©Ã”S\'4ÂiÃ´F2)Ã‡Å’Ã“Å Ã±Â¿â€¹Â¥Ã°Ã¤!,Â²IÂÂ¥T1ÃˆÂ±Ã­Ã“&Â¼YÃ±^Â«Â¨Ãª^ÃÃž3\\HÂ¡N\0PrLÃ—[Ã±â€ºXOÃ¸Jâ€“Ã‰I&Ãž\0Â¤gÂ£7ÃŒxÃºmÂ¯7Â°Ã“nÃµÅ½ÃˆÃ˜â€ ÃªM\nÃ›Â²y\\Ã™ÃšÃ¸?Ã„WÃ—Ã°â€°5mÃ¢wQ6Ã‡Ã›Â¹wsÃ­Â:WÃÂºâ€”Â»Å½+â„¢.a2Â«Ã…$â€žTÂ¢Å¾Â Ã¹Â¯â€Â®Â´kÃ½ Ãƒ<Ã°1â€¹vwFkÃ›Ã¾Ã«iÅ Ã®Ã…Ã™wÃ¦Â ÃÃ Ã¿\01ÃºÃ•Ã©-HIÃ‚VgÂ¬Â«qÃ’ÂÂ¿ÃšÅ¡:PÃ;Å¡:xÃ›Ã±Ã¬ceÅ½Ã¯Ã‰Ã”ZÃ¨Â®6Â·ÃŠÃ‘â€“Ã’Â°#PÂ¿`cÃ’m>DÃ¼â„¢Ã´Â­Ã½Â¤Â¶Ã€Â¹ Ã¢Ë†Å“â€¢Ã¯rÂ»ÃˆÃ™Ã˜Â Ã´Ã…bÃªÂÃ¾Ã®P;3:Ãš`Ã»Ã±Å½Â¼sÃšÂªjqdÃ‹Ã€Ã»ÃÃ¾5Â¯â€˜â€¢Ã<Â½3VVâ€“\n[mÃŽvÃ‰ @Ã¬mjkÃˆÂ5Ã‚Ã â€”Ã¹â‚¬ÃŸÃ–Â¹Ã§Â­Â2Ã›aâ€¢Â¿Âºâ€¦â€¡Ã”r?â€¢w~Ââ€ºKÃ˜â€”Â¨doÃ#ÃºW\Zâ€°3t`AÃ¼kÂ­Ã°dÃ¦_4s-Â¨sÃ¸cÃ¼kEÃ°Â³Å ÂºÃ·â€ xÂ¿PÆ’MÂ°Å’\\ÃŽâ€˜!cÂÃ‡Â®=?:Ã²Â½GÃ…Ã¶â„¢-RkÂ§Ã‚Ã­_ÃŒÃ³ÃºWÂ¯Ã¸â€¡Ã‚Ã–(ÂµÅ½ÃžÃªI!hÃ)*â€˜ÃµÂ¨Â¯Å¸Ãµ{$Ã’oÃ¯,â€¢Ã¼ÃÃ¯â„¢Å’nÃšÃ„gÃ¸Â®Y\'kÅ¡`egÃ‹ÃB[eÂ Â¥Â¦Ã†ÃˆAÃ¾Ã³ÃžÂ¬Â¬0ÂÃ¹dÂ¿Ë†ÃXBÂ«ÂUW+Ã˜cÃ’Â´D+\ZQÅ¾L*Â¬mÃ€Â©Ã”Ã•â€ºÂ­OU\rSÃ†ÃœÃ2Ã¢tÂ¥\'Å’Ã”jÃ‡â€¦Ã…\0|Ã…Ã£Â»wÂ¹Ã¸Â£ÂªÃ‡)-â€°Ã³ÃÃ·vÅ’~ËœÂ«ÃšiKwPÂ£oniÃ¸Ã¢Ã’4Ã¸â€ºÂ«O#Ã£Ã²brÃ‡Â¶QGÃ´Â¬Ë†.Ã­Hvâ‚¬Â«â€¢ ÃµÃ¼Ã«9Ã¯czVQ=\nÃƒJâ€¡Ã„\ZÂ¸Â³mÂ¬Ã®ÃƒÅ½Å’:VÃ‚Ã¤Â¸Ã“|wâ€ÃƒcÂ²9uÃ‡Oâ€¢Â¸Ã¼Ã†k[Ãƒ$Ã“lÂ¤Â¶â€žÃ‹Ã»Ã‡8*Ãµ?Ã¤VÂ¤:j[|dÂ³ÂºË†Ã…Â¤â€™Ã±Ã«Â´Æ’ÃºÃ–â€ÃÂ´1Â©Â¬ÂOJÂ¤â€œQ)Ã¦Â¦Å½Â­e\\Ã¾Ã¯Ã†\ZDÅ¸ÃžÅ½dÃ¿\0Ã‡sÃ½+Â¥ÂÃ€â€¢ÃˆÃ8ÃŽF+ÂÃ”â€ 5Ã\nOÃºxâ€˜Ã£Å¸Ã©[Ã€â€˜Â´â€šxÂªÂ¶â€¡%YÃ²ÃŒâ€™Ã£cÅ’ddtÃ·Â¬Ã›Ã¶O&I;sÃŸÃ©VÃ§Â#ÂABIÃ†6Ã´Â¬MfÃ§Ã¤â€˜Å“1Ãâ€œN>ÃªÂ¹7Ã¦â„¢Ã…Ãª$Æ’RÃºÃ©sÃ·Å Ãˆ?ÂÃ½â€“Â¶Ã®Â¹fÂ¬1â€˜Â©Ã‰Å¸Ã¢â€°1Ã¸Ã¿\0\\ÃÃªzpÃ˜Ã”â€¦Â¾`}Ã«Â£Ã°\\ËœÃ”Â¡â€¹?Ã$#Ã¾Å¸Ã¾&Â¹Ë†ÃÃ©[^â€ºÃ‰Ã—-Ã‡Ã·n\nÃ¿\0ÃŸ|Ã¿\0Ã¬ÃµÂ¬vg5uÃ¯&wÃ†,	Ã¹Â³Å’WÃZÃ²Â´Ãšâ€¢Ã£ÃµÃŒÂ®OÃ¦kÃ©kâ€ ÃšÃ#Ã°S%Â¾â€šÂ¾cÃ”Ã®yÅ’,Ã‡&Â°Â©kY`\"â€Ã¤zÃ©*Æ’.ÃGÂ¹Ã…:9Â¢pÃªâ€œ#1^Å Ã Ã¿\0#\\ÃšÃ› ?t}kGNMÂ³=zU+â€“Â¶:â€ºÃ¥JÂ[Å¡Â¥Â-~â€¢8jÂ³rÃ˜jâ€˜ÂªÂ§Â£R}%Â§Â³Ã¦Â©Â©Â©AÂ Ã¸Â¦\"> Â½eÃ‹*Ãd\n9ÃˆÃžqÃ¹Ã¼Ã«â€¡Ã°ÃµÂ²ÃkpÃ›ËœÃšÃÃ€aÅ“Ã§Å“WÂ xÃ§d^+Ã”â€¹Â a9â€¹â€š?Ã©â€™ÂÃ©YÂ¾Ã“aâ€œÃ„1Â±@v0Ãˆ?ÃŠÂ³â€Â­Â¹Â¼#Â¢dzUÂµÃ…Â§ÂÂ¯`X!tâ€ž8HÃ¦0^â‚¬Ã¡ÃˆÃ<Ã³ÃšÂ½Fw0Ã¸â€¹AÃ•â„¢0Âi$n22Ã‘ÂÂÃ»Ã¨Å¸Â 5Ãkâ€“Ã‘\\Ã¸Â³d*Ã¢%CÂ»Ã³Å½~Â¸9Ã§Ã«]fÂ¥o=ÃˆÃÂ°Â¿vMâ€™z1Â°Ã¾`~t^Ã›kÂµsÂ©<gÂ­WÂ¤CÅ Ã2Â¦Â¯Ã¾Â»Lâ€œÃ»â€”Â©ÃºÂ«/ÃµÂ­Â¾Æ’ÂÂ©[ÃwhÃ™Ã£IÃ£â€“9c2â€šW*Ã€Ã³Å½yÂ»|@Ã£qÂ½Ã’Ã£Ã¿\0Â·IÃ¿\0j\nÃ‘UÃ¡\'+Â¤_Â¸ Å¸ÃŽÂ¹ÃUÆ’6AÃ¾~Â¦â€“Ãµ|@x\ZÃ•Â¢Ã¿\0Ã—=?ÃºÂYi\rÃ¬bC{|Ã—r1Ã¡Å’Jâ‚¬@:â„¢ÃKFÅ“Â£+Â³&Ã¨|Ã†Â±&Ã£Râ€¹Ã¾Â¹Â¿Ã£ÃŠÃ–Ã­ÃŸÃž5â€¦yâ€˜ulGy\nÅ¸Â¦Ã–?ÃŒ\nÃ§gÂ©\râ€¹ÃÅ¡Â­Ã©â€œÃ½â€ºRW\'Ã®Ã‹Â¹Ã¶Ã Ã¬Â¦Â©@~aNÅ’Ã¢Ã¹Ã”ÃµxÂ¾_Ã¸	9Ã¿\0Ãâ€¦ic^7GÂ¨kÃ’tÂ½Mâ€”â€š-Ã¤lÃ¿\0Ã€IÂ¯â€ºÃ¤EÅ¡rdÃ¥AÃ zÃ—Â¼Ã«Ãž!Âµâ€”Nâ€™Ãž76Ã¥\n!Ã¡r1Ã‰Â¯Å¸evYH â€šsÅ¡Ã†Iâ„¢Ã¡4rgÂ¬Â¬Ã¹gÅ¸Â©4Ã°UXÂFOeÃ¿\0Ã«SsKÂ´gÅ’Ã£â‚¬{Ã¿\0?Ã¤jâ€°Ã”Â¹nÃ™ÂOÂµZST-â€º0\'Ã’Â­Â«Vâ€ Ã¥Âj@jÂ¸jzÅ¡@ZVÃ¢Â¤VÂªÃŠyÂ©Ã–ÂÅ¾iÃ±*ÃŸÃŠÃ•Ã¡Â¹ÃÃ›$JsÅ½2	~ËœÂ®cÃƒ7ÂÃ¦Â¡Ã²+Ã¦ÃŽYcÃÃ°ÃˆË†vÂ·Ã OÃ©^â€¦Ã±6Ã•Â¦Ã°Ã‚NÂ`ËœnÃ¶R1Ã¼Ã±^MÃ¡Ã‰empÃ›Â¡Ã‚Ã‹ks9Ã¨L/Â·Ã¿\0ÃÃ¼+7iXÃ–2Â´Ã\"ÃªkÂ¨Ã©WÂ·3yÃ€Ã¥wmÃPI`Â°Ã‰Ã…zÂ°_5Â¡â€qÃ¹Ã—â€“Ã©/Âªtâ€Â¹Å¡ÃžÃ¦Ã’Y	Ãœâ„¢ÃŸÃ€Ã Ã§Â·\'Ã³5ÃªVMÂ¸Å¾Ã»F)}Â«Ã´.Ã¦Å¾Â¦Â¢Ã4ÃµÃª+Â¡â€œ/ZYdj\"Ã›jâ€œ5NVFn7!ÂÂ²IÂ¬Ã‰Ã¹ÃhHx5Å¸5bÃ˜WÅ¸zÂ°5#Â±câ€œÃ»Â²Â¯ÃªvÃ¿\0ZÃŸÂ½Ã»Ã•ÂÂªqlÃÅ’Ã¬`Ã¿\0Ã·Ã‰ÃÃ½*Ë†lYâ€žÃ²*Â©\Z=jÃ‡\0Ã¹Â©ÃµÃˆVÃ¿\0Ã™jHÂAÂ©Ã¥.leVÃ¡sÃ´eeÃ¾Â¢Â®\"ÂªÂ´4lÃcEPÂÃ¦1Ã»Â½YÂrÃž,ÃÂ®Ã´Â»Ã¯Â´ÃjÃ±CuÃ»Ã…$p	Ãª=Â|{Ã—Â­Ã¸OHÂ´M0ÃŸÃ¹jfâ€¢ËœnH9==tÃ‘^BÂ¶Ã“ÃÂ« \nÃ¨ÃªHÃ´\"Â©Â¤Ã´<Ã¹WtÃ¥Â¢<XÂ¬Â¯Ã¾Â²iÅ¸Ã½Ã§&Â¯iPË†Ã®@Å’Æ’Ã¼ÂÃ¹Ã¾â€¡Â¥Xâ€˜Â¬Ã†Â¦Ë†GoDÃ¤)=OÂ¥dÂ´fÃ¶ÃÂ³hÃŸÂ¸OÂ¥^VÃ©YvmÃ»â€ÃºVâ€šÅ¾â€¢Â¡Âª-RÂ¯ZÂ®â€¡Å¡â€ºw4NÂ¦Â§VÂª`Ã“Ã¦Â¹â€ Ã–ÃÃ®.%HÂ¡Âw<Å½Ã˜UÃ¦Ââ€°Â­Ã›E{Â _Ã›MÂ.H{dÃ€â‚¬\nÃ°JÅ¸Ã°â€¢Ã©Ã±Â±\0KrÂ±Ã¸Ã›Ã½kÂ³Ã±ÂÃ—WÃ³-Ã´Ã©lÃ˜Â´pÂ¶\nâ„¢Å Ã Â³â€˜Ã½Ãž@_Ã¸}ÂilÃ‘xâ€™ÃÃ”Ã Â­ÃœdÃŸbÂ¦Ã¾Ãµâ€¡`Ã™ÃªÃžÂ¸Â°MlqÂªÃÃ†ÃÃ¶Â»Ã—kÂ¦Ã«V6B/Â®â€“Ã®ËœÃ¹F@BÂ¾01Â»AÃ§Â¡9Â¯5Ã°Ã’Ã\rÃ•Ã’Ã†â€ºOÅ“ÃÂrw\ZÂ¹Ã±\nÃ½FÆ’c\0|Ã›ÂÂ´{\0FÃÂ­E%ÃRÃQÃš=â€¡Â½<qÃ|Ã»Â¡Ã¼KÃ—4â€°Ã„/tnÃ­TacÂ¹Ã°?ÃžÃ»Ã=Ã±^Â§Ã¡Â¿Ã©Â¾!eÂ·*mÂ¯Ã¢69WÃ¿\0uÂ½}Ë†Ã¼Ã«Â²TÂ¥sÅ¡5Â£\'gÂ¡Ã•ÃˆÃµ	4Å¡C\\Ã­â€ºÃŠxÂª0\0Ã¦Â®Ã‹Ã’Â³nsÅ â€™ldÃžÅ¡Ã‚Ã•WÃŒÂ°Â¸\\Ã£18ÃÂ¦TÅ ÃœÂ¹SÃeOÅ’`Ã”Â³jd0HUÃ—Â£Å ~Â¡Ã¾Â¢3Ã¿\0M\"9Ã´ÃƒÂ®CTÃ´ÃÃ¹Ã›Hâ€Â®[Â¾lÃ©Ã“Ã¢6Ã‡Ã—ÂÃ¥Vâ€šÂ¦Ã‡Â¤Ã¸5Ã¼ÃŸM2Ã‘ÃŽp=Ë†Ã½zÃšCÂ´Ã†Fr[Å¡Ã§~Kâ€Ã”\"Ã¶FÃ¸Ã°?Ã’ÂºFwÂ±Ã¹Ã³Å Ã‘osÃŠÃ„FÃ’R<Â¨Ã´Â¦ÂH#Ãˆ<V,Â·Â·Ã¦0LÂªâ„¢Ã¬Â¨?Â®im$Å“ÃŽÂ¦IÃ¤aÅ¾â€¦Â¸Ã¾uâ€“Â§RfÃ…Â«Ã¾Ã­yÃ¯Z1Â¿JÃŠÂ·\'Â§Â£?\ZÂ¼ÂÅ ÃÃ™l_VÂ©Ã³TÃ•Ã¸Â©Uâ€°#Å Â«Ã«â€“:Å¾Ã—Â·Ã²Ã¬Å’pÂªYÃ›Ã‘GÂ¯Ã¹5Ã¢.Ã±Ã–Â¡Ã¢i<Â¶sobÂ­ËœÃ­Â£n3ÃªÃ‡Ã¸ÂÃ©Ã¨AÃ£?>Â¿Â­I*Â»}â€“\"RÃQÃŸÂ§Â¯Ã¤;W*Ã§â€œZF)jÃŒâ€ºr~FÂ«Ãž5Â¤Ãºy>D â€˜Ã«Â¸â€“?Â£cÃ°Â­=5V]nÃŽHÃŽTÃœ#Ã­Â¸VÂ¨Â¦;Â¤Ã´Ã¯Ã¼Ã¢SÃ½jÃ§â€ .|EÂ¦Ã‚Ã¥â€“Ãª4Ã›Ã©â€“Â¦pÂ»Âº.Å“Ã¬Â¬Ã¶=Gu}rÃ¦ÃFÃ­23mÃ†Â²<oÂ¬Ã‡Â¨Ã¸â€š;hË†Ã²,â€”`Ã‡MÃ§Â¯Ã´Ã¼Â«.Ã¿\0Ã„Ã¦\rFÃ¸Ã˜!GioaÃ“â€œÃ’Â¹Â¯4â€,I,ÃŽ2sÃ–Â«MÃ†\\Ã²\"ÂµNhÂ¨Ã„Å¡I6MÂ´Ã¿\0qÃÃ´Ã¾â€¢{EÃ”ÃžÃžxÃ™\\â€ 3(G#â€˜Ã¹Ã–5Ã„â€žÃÃ½ÂÃÃ‘c&\'Æ’=Â§_Ã¦?Ã‚Âº]KHÃƒÃ™Ãž\'Ã•^Ã•Ã†Â·Â¢AxqÃ¦Ââ€™P;8Ã«Ã¹Ã°\ZÃ–5Ã¥?\nÂµsÃ½Â£yÂ§Â³|â€™ eÃ¿\0|r@Ã¼	Ã¿\0Â¾kÃ•MrUÂ,Å¡FÃ´Â¥ÃÃ™Æ’\"Â¨JÂµÂ Ã½*Å“Ã•â€˜MËœÃ—â€¹Ã–Â±\'Ã¦Â·o:VÃ½MK4Â¦ÃŒÃ­?Ã¥â€¦â€â€˜Ã”}Â+Dâ€¦xâ€šÂ·Ã<\ZÃÂ´$Mrâ„¢$Â§Ã·Â¿Ã¶jÃÃÃ®ÂÃ”:hÂ¹Ã¬u\r.	ÂºÃšÃ‡â„¢lÃƒÂ¨Ã›Ã¾&Â»Â¨n\ZF7Ã¿\0*Ã³Oâ€¡Â³lÃ—mcÃÂ¦â€¡Ã°]Ã€Ã¨5Ã¨Ã‘|Â·â€™â€¦n7+TÃµGâ„¢]ÃšÃ‡Å’Ã‰dÃŒÃ¿\03(ÃžÂÂºÃ…\"ÂÃ¤Â¶Ã¡Å’\ny|Å¡â€ I0Ã«Ã¬sÃevt\"}4â€ºËœÃ·Ã†\\|Ã¤#()Ã·Ã©ÃÂ§Ã¥Z;Ã†Ã£Å½9Ã¢Â±Â´GÃ•z&qÅ“Æ’Ã›Ãª}?ÃºÃµÂ¢\\Ã¯lÃµÃ5Â¯BÃ£Â¹m^Â¨xâ€¹Pm?ÃƒZÂÃ’Â¶Ã—KwÃ˜sÃ‘Ë†Ã‚Å¸ÃŒÅ Â°Â\\ÃŸÃ„)Ã¶x.Ã±Ã¿\0XÃ‘Â¯Ã¾>Ã´Â¢Ã…Â½ÂsÂ»Å¸jcvÃºQÅ¡CÃVÂ­ÃœÃ\ZÂºÃ¤gÃÂ²â€ºÂ´Â¶pÅ¸Ã»Ã¥Ã¿\0Ã¬Âµ?Æ’T7Å’tâ€“=\"Â¸YÂÃ¼Ã§Ã¿\0Ã™jMJ??Ãƒ\Z=Ã’ÂÃµk%Â³umÃ£?â€žÂ£Ã²Â¤Ã°Â°Ã²$Ã•5Ã€Â³Ã“Ã¦*Ã‡Â wRÃ¾9Ã’ÂªJÃŽÃ¤\'xÂ³(9â€œ21%Ëœâ€™h<,CÃ•Ã³LÂâ€Å¸)Ã¿\0WÃ¬jÃ–Ã‚Ã«b)Ã«Å’ÃºÃ’BJÃ¡â€¡gR?ZOÃ¹n?ÃžÂ§Ã›Ã°Ã¤Å¸Ã `ÃŸâ€“k=Ã™{#Â¿Ã°Â¡Ã¶?Ãƒ9lmÂ»E\'Ã½â€œË†Ã˜Ã¾LkÃ¨C_,Ã¨R0[[â€˜dÃ«Ã—ÃºWÃ”0NÂ·6Â±NÂ£*B3E}RdQÃ‘Â´:Nâ€¢JjÂ¶Ã§Ã¥ÂªrÃ´Â®VjÃŒÂ»ÃÂ»X3Ãµ5Â½wÃ·MaOÃ”Ã”Â²Ã©Â³&#Â¶Ã¶Ã¡=vÃ‰Ã¹ÂÂ¿Ã»-hÂ¯(GÂ¨Â¬ÃƒÃ²ÃªmÃ¾ÃœKÂÃ¸	?Ã¼UhÃ„iÂ£V]Ã°â€ÃžGË†Â \\Ã£eÃ¨_Ã»Ã¬Æ’Ã¿\0Â³Ã—Â¬Ã²Â¯Ã¥Ã?Å¾kÃ…tÃ¹ÂÂ®Â±3uÃ£â€ºÃ´Ã¿\0dÂ¯iÂ¿%.Ã·ÃƒZ_fyXÂ­#~ÃŒÃ°VÃ–â€”Ã¾Y[ÃˆÃŸÃ¯Â¿Ã£Q&Â¥u-Ã”`G\ZÃƒÃ”Å¾Â¿QQKÃ¶PMÃŽÂ¥kÂ°mÃ‡Ã²Ã£P[ÃªÃºDâ€”â€˜Ã…jÃ—wnXÃ‡{Å¾\n\'O2Ã¨lÃ©slÂµIâ€™@UÃ¦cÃ˜Ã¤0Ã¾?Â§{ÃHYFk\'KPâ€“P\"Ã¤bl`ÃµÃ¿\0ÃµUÃ¸Å“\0>â€¢Â¡Â¤MnkËœÃ¸Å½IÃ°â€¹Ã£Ã¾{&kÂ¡GÃ¢Â¹Å¸Ë†râ€¦Ã°â€ºÂ©Ã¾9â€˜GÃ—â€œÃ½)Â¢Å¾Ã‡â€˜\r!Â¥Ã‡â€ Â©Ë†Ã­Ã´\r9Âµ\r.Ã£DÂºÅ¡>Ã’â€°si+ÃŠ\nÂ¬Â«ÂÂµÂ¶Ã§â€“NÃ¾â€šÂ¤Ã”44Ã°Ã®â€žÃš-ÃŽÂ¥fÂ·â€”Â³Ã¹â€”oâ€ºÃ„qÃ†Â¢}KdÅ¸Ã¸\rgÃge%Â¬	%Ã¦Ã‹Â¡\ZÃ¼â€¦â€Ã§Â¯\'#SÃ¬kÂ§Ã™Ã¯gÃ»9Ã»BÂ©Ã‚ÂÂ¿{Ã—Â¡8Ã«Ã˜Ã¾5Â¤ÂÃ‘Å’VÂ¦Ââ€“Å¸Â£Â´Â°Â£ÃŸO+â€“Ã‰;q$pyÃ¦AÃ¿\0=ÃµÅ½â„¢gnÃ¯5Â®Â¤:i#Ãš7|Ã¾Â vÃ²ÃÃ§TÃ–Ã¦Ã¼Ë†Ã¢Ë†ÃˆÃ€,Â¯â€,	Ã $qâ€˜â€˜K|â€œg4â€™<Ã„Ã­&0Â«â€¦ÃMÂ¸â€ Â1ÃZIÂ»XmkrÂ¶Â£-Æ’`Ã˜ÃšËœâ€˜Ã¤%KÂ¾[hÃ¬G8Ã¼Ãªâ€šÃ¼Â¯7Ã“ÃºÅ %cÃ¿\0Ã”)dÅ¡QÃª\r%ÃœÂ·Ã˜Ã—ÃÃ®nÃ˜Ã¿\0~FÂ¾ÂÃ°}Ã Â½Ã°vâ€œ.yÃ‰ÃºÂ¨Ã›Ã½+Ã¦Â½2_*\0Â¹Ã»Ã…ËœÃ¾@Â{Å¸Ã‚Â»Ã7Ãƒf\'&-Â®3Ã¨ÃƒÃ»)Ã¼ÃªÂª+Ã’^F1vÂªÃ¼ÃŽÃ¥ÂR^â€ Â­1Ã¢ÂªÃ‹ÃžÂ¹\râ„¢â€”uÃŠÅ¡ÃƒÂ¸Ã»Ã†Â·.:\ZÃƒÂ¹Ã»Ã†â€œ*5ÃÃ†Â¥	Ã‡9>Ã¹R?â€˜Â«Ã‘~ÂµBÃ·Ã¾>mNÃºÃ’	Ã¶Ã˜ÃŸÃ½jÂ·Ã©IÂ±Ë†qÂ«9?Ã²Ã’Ã¼â€ºÃ¿\0Å Â¯kÃ³>Ã‘Â¤YN|Ã˜â€°Ã‡Â°5Ã¢2ÂºÅ“Ã´Ã™\"ÂÂ©ÃšÂ¡Â¯iÃ°Ã´Â¢Ã£Ã‚Å¡q\'Ã¾YÃ¬Ã¿\0Â¾IÃ’Âµ[v\"<Ã‘â€™<3Ã­~Ã’Ã¿\0Ã”ÃšÃ™;ÂÃ¶LÃ§ÃµÃÅ I<vâ€ºD6Z|Ã¬Â½\0Ã€ÂÃÃ¡XÂ©c\ZÂâ€“?Ã’Â¦KCâ€˜Ã²ÂUvmÃ¬â€”VjÃ›<Â±$Å½WÃ¤â€˜Ã²â€¦â€¡^Â¼Å½zÅ’Ã»Ã£5b2x9Ã­TcÃ¹Â¯Â¡Â«)\'Ã©HÃ‘+\Z	\'kÂÃ¸Â>tKhÂ³Ã·Â®~JÃ†ÂºA\'Â½q?Ã§ÃœÅ¡|@Ã·v?Ã¸Ã®?Â­47Â±ÃƒvÂ¦Å¾Â´Ã¡ÃœR\ZÂ©lJ:Â«Â*ÃtÃ§â„¢ÃÃ¤Thâ€°bp9G\\ÃµÃÃ¤~Â²Ãµqa?â€Â»7\02	9Ã®~`:Ã–Ã¾â€ºrâ€”Å¡d Ã¤yjÂ©ÃˆÃB?ÃÃ¿\0Â¬Ã–Gâ€°Â¤Â¬G!9ÃŒKÃ—Ã±Â®Â¹Ã(&sBoÂÂ Ã“Â§ÂQZ9ÃÂ¬Ã‹Ã—Â° Ã´Ã©Ã©Ã’Â­<â€šÃž5Ã–PÃ‘Å“yâ€šF8ÃÃ¬;ÃºÃ—<Å½Ã’Å¾1Â¸\ZÃªÃ§S}Â¥Ã926~Â,Ã¾Â¦Å“c(ÂµÃ˜uÅ’â€œÃ®rÃ·sÂ¤Ã’|â‚¬â€¦ÃœM\'Ã¯Ã®Å“Ã¾TÂ·v2ZÃ¼Ã„â€ ]Ã›IÂ9Â¹GoÃ¶k;;Â´Ã‹mhÃÃˆ%Ã›ÂÃ½Ã”Ã‡Ã³Â¯`Ã¸e{Ã¶kÃ‹H	Ã‚ÃoÂ°Ã§Ã—Ã¯Ã¥ÂÃ†Â¼YO<wÃ¢Â½ÃƒWmÃš\\CÃ·Â¡ ÂÃªAÃ¾UTÃ½Ã¨Â´g_Ãœj^gÂ¼Â·JÂ«/JÂ²Ã‡ÂÃ±ÂªÂ²Å¾\rq[SvfÃœÃ´5â€¡uÃ·Ã«fÃ¥Â¸5â€¦vÃ 7Zâ„¢\'RÃˆHÃ˜vâ€¢?RÃµÂ©Ã¢nâ€¢Â¦ÃlÂ¦ÂÅ“ykÂ¿Ã¾Ã¹Ã§ÃºSÂ¡jHÃŸÂ Â·Â§mÃÂ£vÃ¤Å¸Âª0Ã¾xÂ¯ZÃ°DÂ¦_\nÃ†Ã¿\0U;Â§Ã§â€ Ã¿\0Ã™Â«Ãˆ5mÃ‚(X}9Ã´ÃƒÅ’Ã¾â€¢Ãª?\rd2hâ€”ÃÃ·\'Ã¹Â¨Ã»-kQÃ…U]Â´yhâ€šâ€šyÂªÂ±Â½Ã…Ã¹Ã“ÃƒÃ±P3â‚¬Ã–ÂÃ‡\rDâ€¢Ã‚xÃ¦mÃºÂ¥Â¼cÂ¢ÃƒÅ¸Ã„Â±Ã¿\0\nÃ¬â€žâ€¢Ã€xÂ²O3]qÃ½Ã„UÃ½3Ã½h@ÃŒNÃ€Ã“OZrÃ´Ã…4ÃµÂª{Å½â€ºÃƒâ€¦ZÃâ€˜Ë†ÃpÃ¦+?YÂµdÃ”v&YqÃ²Å¡M2Ã¹- ÂÂ¿Å’Â¯Ã–Â¯j:ÂÂµÃŒ\nÃ±?ÃŽÃ¤R99Ã¾Âv^2Â¦â€œg-Â¥\ZÂÂ¤sÃ‡*Ã¼ÃµÂµÂ¥jÃ‚ÃŸÃŒÃ³9;~_sÅ½+6WCsÂ¸ Ã†9â„¢Å Ã½ÃxÂ¬pwFÃ’Å Å¡Â³/Ã^Ã¬ÃŠâ€ÃfÃ±Ã©NÂ±Â´kÃ»Â«{4mÂ­q\"BÃ¶,Ã€Zc#IÂ§Ã¯Â§Z[KÅ¸Â²\\Ã›\\ÃŒRÂ£Ã¾D\ZÂ©_wÃ˜â€žÂº.Ã¥)Ã­Ã¤ÂµÂ¼â€“ÃšAÃ»Ã˜Â¤1Â°Â Ã Ã—Â´Ã¼0Ã°Â£=Â¿Ã¶Â¦Â£Ã²Ë†Ã†Ã¸ =IÃ¾Ã³zAÃ¾OÃ£Ã‹5Â°Ã¸Æ’vÃˆÂ£!\'SÅ½Ã¤aÂÃ¢Ã€Å¸Ã†Â½CÃ¡Ã¤â€™Â½Â I>Ã©3\\nÂ¬Â¢Â¬Å½ÂµF2Â3:â€°.â€˜x-ÃÂ¥gÃœj1â€¡Ã˜Â§.FBÃ§â€œÃ´Ã«â„¢â€¹]Ã²ÂµÂ %Â£ÃšQÂ½GÂ¸Â­â„¢&Â½|Â>Â·Ã†ÃœÂÂ²Â®WÃ¾Ã·ÂÃ¢)Â«Tn;ÃŒÃ³ÃÃ·c`r1ÂÂ¨8#Ã²Â¬Ã«â€¹T&â€™8ÃuÃœz~<*Ã“â€¹EÃ±â€ Â¨Ã›RÃ•mÃµfeAÃ¼Ã‹~BÂ®Ã›Ã¼%{Â§k\ZÃ‹9Ã®Â)b>Å½ÃŸÃ¼MW)â€¡3ÃªÃŽPÂ¾Â±Â$ÂÃ§IÃ‘â€â€šÂ±eÂ·Â¯OÃ–Â¬Ã©Ã©%Ã¶â€º&Â¡2xËœ#Â³>ÃµÃ«zwÃƒÃiÃ›HÃ“VÃ¥Ã‡Ã±Ã1â€œ?Ã°Ã²Ã¾â€¢gÃ†Â¶Ã±Â¯Âo#Å 4ÂcUQ@Â½\0Ã¶Â¥(Ã™\\Ã–ÂMlâ„¢Ã£zÅ½NÅ¾Ã­Ã”ÂªÂ¶>Â»IÃŠÂ½;Ã€<Â«Ã¨Ã“\0Â²+dwÃ?Ã£^jÃ€=Å¾Ã®Ã®Ã¾_Ã–Â»â€ Â·dâ€žÂ½-Â§#ÃŸ\0Ã”Ã‡bk|gÅ¡fâ€ºÂºËœ[Â£/[XÃ‘0vÃˆ#Ãžâ€¢â€ºÅ Â¯Â¿Ã§#Ã’â€šÃ¼uÂ¨lÃ–$Â»Â«?WÂµÂ·Â¹Â°ÂÂ¤â€ 6â€˜c%\\Â¨Ãœ1Ã¯Ã–Â§Ã³yÃ«QÃÂ¶Ã«)Ã‡Â¬mÃ¼Âª\\Å HÃ‰Ã‘|\'m~Ãªfâ€“`Â¸Ã¤!\0Ã¾Â¢Â³|QÂ¥ZÃ©7k\rÂ°|dÃ¤Â»dÃ—yÃ¡DF}+â€œÃ¸Æ’â€¹]ÃšGnâ€*IÂ»3JÂ°QÃ˜Ã‚â€ Ã™Å¾Ã‰Ã‡â€¢\'â€¡Ã–ËœÃ¶ÃÃ”`Ã†JÃ¤â€¡Ã–Å¸o|cÂ±xcÂâ€”ÃŽjCuÃ¶â€¹BÅ½ÃŒXÃ·5Ã©\'â€˜ÃÃ¯&Ã†Ã‰$Q^nÃ²Ë†RËœ!~ÂµQ%ÂlË†Ã€Ã¼Ã‡ Ã•ÃÂ°],4Â¶sÂ¡\rÂÂ¹vÃ£Â³Ã—Ã½Ã†Ã¼ÂX>Â½Å½	%Â¸â€™BKdÃ°XÅ“cÃ¤=Ã½=k9IÃœÂ´â€¢Âµ3VÃ§Ã‹Âµ1Ã‰ÃÃÅ¾Ã†Â¢fÃŠ Ãµ5Ã™Ã‚!Â£Â´Ã‡mÂ«Â½Ã¥Ã’Å’â€¡TÃ²Ã¡Qâ€¢â€“9Ãˆ]Ã™8\'ÂAâ€œ\\Q\08\0Ã¤PÃ¤Ã¬5kÃ¨zâ€¡Å½Ã¼Â»Ã½IÃ”â€“ÃŒÂ¦Ã¢ÃƒÃ¿\0B5Ã¨~Ã¬Ã¿\0â€¦xÃÂ¶Â¡&Â¨lLÅ¸Ã²Ã­nÂ°Ãª\'ÃºÃ£Ã°Â¯hÃ°\"Ã¢Ã‚Â¹*?yÂ£Â®\ZR8â€ºÃŸÃkÂ²Â§Ã·fuÃ¾uÂ£jÃŸÂ¾CY:Â³Æ’Â¯\\8Ã¨nâ€ºÃµcWÂ­dÃ‹+â€˜Ã«WÂ¡ÃTÃ¶	KÂºÃ”Æ’Ã©[â€”W)k3HÂ¡Ë†Ã¹Tâ€˜â€œÃ´Ãµ5Ã‹Ã¸:\\Ã‡ÂQ]yD,Â¨,:9Â­byÃ²ÃœdK<â€ž$rm;Ã™pÃ’Â©Ã¸Â±Å¾Ã•â‚¬ÃªÂ¶ÃŽÃ¿\0Ã·ÃˆÃÃ´Â­*Æ’Râ€¹Ã­:Â¡3Ã¦[ÂºÃ£ÃªÂ¤Sâ€“Â¨Ã–â€œÂ³>ÂµËœÃe*Å¾Â¡sÃ¹s]Ãƒâ€¹ÂÅ¡ÂÂ ÃI\"Oâ„¢EpÃº[Ã½Ã¥Ãµ~uÃ‘Ã¸*Ã£ÃˆÃ•bÃ§Ë†Ã®â€Ã¾xcÃ¿\0Â¡VQ5Â¯Â£LÃ¿Ã™','2025-12-03 00:28:28'),(617,2285,'Lupo, Jonathan  J.','Lopez Jaena St , Jaro Iloilo City','1972-11-23',52,'M','Married','09183317696','','','',NULL,'2025-12-03 00:28:28'),(618,2286,'Santuyo, Hepshebah  D.','Ajuy, Iloilo','1999-08-11',26,'F','Single','09271351338','','','',NULL,'2025-12-03 00:28:28'),(619,2287,'Hautea, Jida  A.','Democracia, Jaro','1976-04-05',49,'F','Married','09983729433','Hautea, Roy  Q.','09298008506','Husband',NULL,'2025-12-03 00:28:28'),(620,2288,'Habana, Leonila  P.','Burgos, La Paz Iloilo','1929-01-17',96,'F','Widowed','09896754432','','','',NULL,'2025-12-03 00:28:28'),(621,2289,'Habana, Justin Kyle  B.','E. Lopez St. Jaro','2013-08-02',12,'M','Single','09194066766','','','',NULL,'2025-12-03 00:28:28'),(622,2290,'Hablado, Vince Caezar  L.','Alimodian, Iloilo','2011-09-04',14,'M','Single','09773347446','','','',NULL,'2025-12-03 00:28:28'),(623,2291,'Guzman, Elyn  P.','M.H. Del Pilar, Jaro','1991-01-02',34,'F','Married','09454337376','','','',NULL,'2025-12-03 00:28:28'),(624,2292,'Guzman, Jeru Germain  P.','M.H. Del Pilar, Jaro','1991-02-27',34,'M','Married','09454337376','','','',NULL,'2025-12-03 00:28:28'),(625,2293,'Guzon, Joy  J.','Paglaum Vill, Bacolod City','1976-05-07',49,'F','Single','09956673576','','','',NULL,'2025-12-03 00:28:28'),(626,2294,'Habana, Bien Anthony  B.','Jaro Iloilo City','2005-08-02',20,'M','Single','09964532541','','','',NULL,'2025-12-03 00:28:28'),(627,2295,'Hallares, Samedi Rean Byne  G.','Brgy. Trapiche, Oton Iloilo','2006-10-28',19,'M','Single','09276944952','','','',NULL,'2025-12-03 00:28:28'),(628,2296,'Hallares, Ethan  F.','Cubay, Jaro Iloilo','2021-01-09',4,'M','Single','09504238438','','','',NULL,'2025-12-03 00:28:28'),(629,2297,'Habana, Ronald Justice  B.','E. Lopez St. Jaro','1980-11-29',44,'M','Married','09194066766','','','',NULL,'2025-12-03 00:28:28'),(630,2298,'Hallegado, Lourdes  P.','Tabuc Suba, Jaro','1972-02-11',53,'F','Married','09072273637','','','',NULL,'2025-12-03 00:28:28'),(631,2299,'Hanada, Tomomi  D.','Jaro Iloilo City','1997-10-16',28,'F','Single','09989617873','','','',NULL,'2025-12-03 00:28:28'),(632,2300,'Harder, Beberly  L.','Parc Regency, Ungka Iloilo','1980-12-17',44,'F','Married','09295640849','','','',NULL,'2025-12-03 00:28:28'),(633,2301,'Haresco, Sorpresa  P.','Caingin, La Paz, Iloilo City','1952-04-01',73,'F','Married','09219572940','','','',NULL,'2025-12-03 00:28:28'),(634,2302,'Haresco, Melquiades  P.','Caingin, La Paz Iloilo City','1949-05-30',76,'M','Married','09219572940','','','',NULL,'2025-12-03 00:28:28'),(635,2303,'Harder, Ronnie  T.','Brgy. Buhang, Jaro Iloilo City','1953-11-18',72,'M','Married','09297897536','','','',NULL,'2025-12-03 00:28:28'),(636,2304,'Hautea, Ma. Felicia Nina  A.','Democracia, Jaro','2009-09-18',16,'F','Single','09298008506','','','',NULL,'2025-12-03 00:28:28'),(637,2305,'Helican, Ben Joseph  P.','Ceminario, Jaro Iloilo City','2003-09-07',22,'M','Single','09993092201','','','',NULL,'2025-12-03 00:28:28'),(638,2306,'Hechanova, Serafin  Jr. J.','San Dionisio, Iloilo','1966-08-26',59,'M','Married','09687345013','','','',NULL,'2025-12-03 00:28:28'),(639,2307,'Hellares, Daisy Rose  S.','Bakhaw, Mandurriao','1995-12-17',29,'F','Single','09074304295','','','',NULL,'2025-12-03 00:28:28'),(640,2308,'Hechanova, Isabel  S.','San Dionisio, Iloilo','1991-07-17',34,'F','Married','09058779059','','','',NULL,'2025-12-03 00:28:28'),(641,2309,'Hechanova, Stephanie  C.','Mandurriao, Iloilo City','1993-11-19',32,'F','Single','09163030273','','','',NULL,'2025-12-03 00:28:28'),(642,2310,'Hermogenes, Crystal  M.','Sara, Iloilo','2002-08-14',23,'F','Single','09065411823','','','',NULL,'2025-12-03 00:28:28'),(643,2311,'Hermano, Xyzzy Anyth  J.','Leganes, Iloilo','2014-06-06',11,'F','Single','09085672341','','','',NULL,'2025-12-03 00:28:28'),(644,2312,'Hermano, Zabina Lynne  I G.','Tigbauan Iloilo','2013-10-14',12,'F','Single','09078418535','','','',NULL,'2025-12-03 00:28:28'),(645,2313,'Betita, Chona  F.','Dumarao, Capiz','1976-11-30',48,'F','Married','09502889329','','','',NULL,'2025-12-03 00:28:28'),(646,2314,'Grafil, Regie  L.','Brgy Milan Lemery Iloilo','1995-02-04',30,'M','Single','09267072764','','','',NULL,'2025-12-03 00:28:28'),(647,2315,'Salmorin, Ryan  T.','Poblacion, Malay Aklan','2001-06-16',24,'M','Single','09098691642','','','',NULL,'2025-12-03 00:28:28'),(648,2316,'Dinson, Allen Rose  O.','Brgy. Katilingban, Molo Iloilo City','1973-11-11',52,'F','Married','09173037607','','','',NULL,'2025-12-03 00:28:28'),(649,2317,'Patriarca, Lorline  P.','Leganes, Iloilo','1963-12-29',61,'F','Widowed','09399390669','','','',NULL,'2025-12-03 00:28:28'),(650,2318,'Dator, Luis Julio  B.','Alta Tierra, Jaro Iloilo','2012-12-22',12,'M','Single','09081692080','','','',NULL,'2025-12-03 00:28:28'),(651,2319,'Herrera, Jonathan  T.','Pandac Pavia','1976-08-28',49,'M','Married','09615276167','','','',NULL,'2025-12-03 00:28:28'),(652,2320,'Hernia, Evelyn  G.','Bakhaw, Mandurriao','1956-01-17',69,'F','Widowed','09284253823','','','',NULL,'2025-12-03 00:28:28'),(653,2321,'Hernia, Ferdinand  S.','Quintin Salas, Jaro Iloilo City','1976-01-03',49,'M','Married','09171143283','','','',NULL,'2025-12-03 00:28:28'),(654,2322,'Hernia, Ma. Coleen  S.','Quintin Salas, Jaro Iloilo City','1976-07-29',49,'F','Married','09228440729','','','',NULL,'2025-12-03 00:28:28'),(655,2323,'Hernando, Zenia  B.','Alta Tierra, Jaro Iloilo','1959-06-07',66,'F','Married','09987257849','','','',NULL,'2025-12-03 00:28:28'),(656,2324,'Herva, Jonalyn  E.','Brgy. Ingore La Paz, Iloilo City','1979-11-25',45,'F','Married','09454563118','','','',NULL,'2025-12-03 00:28:28'),(657,2325,'Hervas, Franklin  L.','Passi City','1986-04-23',39,'M','Married','09128003335','','','',NULL,'2025-12-03 00:28:28'),(658,2326,'Hierro, Annalyn  D.','Westwood Subd, Mandurriao, Iloilocity','1982-02-25',43,'F','Married','09294582559','','','',NULL,'2025-12-03 00:28:28'),(659,2327,'Hifarva, Arya Marthel  R.','Dumarao, Capiz','2022-04-26',3,'F','Single','09300925031','','','',NULL,'2025-12-03 00:28:28'),(660,2328,'Fuentes, Patricia  H.','Bacolod City','1996-03-05',29,'F','Married','09335114330','','','',NULL,'2025-12-03 00:28:28'),(661,2329,'Alejandrino, Clarice  H.','Bacolod City','1994-09-09',31,'F','Married','09089634431','','','',NULL,'2025-12-03 00:28:28'),(662,2330,'Hilado, John Lloyd  D.','Tabuc Suba, Jaro','2008-07-12',17,'M','Single','09700973930','','','',NULL,'2025-12-03 00:28:28'),(663,2331,'Hilado, Denise  D.','Bacolod City','2000-05-30',25,'F','Single','09998015228','','','',NULL,'2025-12-03 00:28:28'),(664,2332,'Segovia, Alexander Paul  D.','Mandurriao, Iloilo City','1989-03-29',36,'M','Single','09153306222','','','',NULL,'2025-12-03 00:28:28'),(665,2333,'Hilario, Edah Marie  D.','Democracia, Jaro','2004-05-18',21,'F','Single','09158076415','','','',NULL,'2025-12-03 00:28:28'),(666,2334,'Hilarde, Jhon Mark  S.','Progreso, Ajuy Iloilo','1997-06-12',28,'M','Single','09922860378','','','',NULL,'2025-12-03 00:28:28'),(667,2335,'Hila-Os, Segundina  P.','Lanit, Jaro Iloilo City','1960-01-15',65,'M','Married','09298866888','','','',NULL,'2025-12-03 00:28:28'),(668,2336,'Hiponia, Alberto  Iii D.','Pavia, Iloilo','2008-02-24',17,'M','Single','09094086107','','','',NULL,'2025-12-03 00:28:28'),(669,2337,'Hiponia, Ace Christian  D.','Brgy. Bito-On, Jaro Iloilo City','2009-07-19',16,'M','Single','09988501246','','','',NULL,'2025-12-03 00:28:28'),(670,2338,'Hipolito, Bianrenz Benedict  F.','Valenzuela, Pasay City','1997-06-06',28,'M','Single','09064095989','','','',NULL,'2025-12-03 00:28:28'),(671,2339,'Hinayhinay, Joseph  A.','Tagbak Jaro','1961-03-03',64,'M','Married','09394052452','','','',NULL,'2025-12-03 00:28:28'),(672,2340,'Hisanza, John Michael  H.','Buhang, Jaro','2009-08-28',16,'M','Single','09088752116','','','',NULL,'2025-12-03 00:28:28'),(673,2341,'Hisanza, John Clarence  H.','Buhang, Jaro','2006-11-12',19,'M','Single','09088752116','','','',NULL,'2025-12-03 00:28:28'),(674,2342,'Hiponia, Angelino  P.','Brgy. Palaga Miag-Ao, Iloilo','1964-12-15',60,'M','Married','09668274641','','','',NULL,'2025-12-03 00:28:28'),(675,2343,'Hisanza, April Joy  H.','Buhang, Jaro','1980-04-05',45,'F','Married','09088752116','','','',NULL,'2025-12-03 00:28:28'),(676,2344,'Hofilena, Avryl Bryce  J.','Bakhaw, Mandurriao','2009-09-20',16,'F','Single','09932801972','','','',NULL,'2025-12-03 00:28:28'),(677,2345,'Horne, Kenneth  S.','Lapuz, Iloilo','1956-06-10',69,'M','Single','09293184994','','','',NULL,'2025-12-03 00:28:28'),(678,2346,'Cordero, Alwen  A.','Lopez Jaena St , Jaro Iloilo City','1962-09-24',63,'M','Married','09175659759','','','',NULL,'2025-12-03 00:28:28'),(679,2347,'Infante, Ruperto  P.','Brgy. Man-It, Passi City','1955-01-04',70,'M','Married','09397143093','','','',NULL,'2025-12-03 00:28:28'),(680,2348,'Soldevilla, Dennis  D.','Cubay, Jaro Iloilo','1970-10-05',55,'M','Married','09498137775','','','',NULL,'2025-12-03 00:28:28'),(681,2349,'Caballero, Florence  T.','Bakhaw, Mandurriao','1994-03-07',31,'F','Single','09939748251','','','',NULL,'2025-12-03 00:28:28'),(682,2350,'Mainar, Maria Lina  B.','Pototan, Iloilo','1957-09-05',68,'F','Married','09291971898','','','',NULL,'2025-12-03 00:28:28'),(683,2351,'Donayre, Kyle Vincent  S.','Lapuz Norte, Iloilo City','1957-08-24',68,'M','Single','09501344962','','','',NULL,'2025-12-03 00:28:28'),(684,2352,'Jaraba, Stephen  D.','Tagbak Jaro','2000-12-02',25,'M','Single','09511321121','','','',NULL,'2025-12-03 00:28:28'),(685,2353,'s',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'2025-12-03 00:32:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_other`
--

LOCK TABLES `prescription_other` WRITE;
/*!40000 ALTER TABLE `prescription_other` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`setting_id`, `setting_key`, `setting_value`, `description`, `created_at`, `updated_at`) VALUES (21,'default_currency','PHP','Default currency of the system','2025-09-12 17:11:00','2025-09-12 17:11:00'),(22,'currency_symbol','P','Currency symbol for displaying prices','2025-09-12 17:11:00','2025-10-18 04:26:37'),(23,'invoice_prefix','INV','Prefix used when generating invoice numbers','2025-09-12 17:11:00','2025-09-12 17:11:00'),(52,'allow_negative_stock','0',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(53,'low_stock_threshold','10',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(54,'clinic_name','JOEBERT M. VILLANUEVA, MD, FPSO-HNS',NULL,'2025-09-24 08:17:22','2025-12-02 11:25:43'),(55,'clinic_address','RM 208 Medical Arts Bldg,. Iloilo Mission Hospital, Iloilo City',NULL,'2025-09-24 08:17:22','2025-12-02 11:25:43'),(56,'clinic_tel','(003)3200315 local: 6014',NULL,'2025-09-24 08:17:22','2025-12-02 11:28:27'),(57,'clinic_mobile','09179700202 / 0917711077',NULL,'2025-09-24 08:17:22','2025-12-02 11:28:27'),(58,'clinic_hours','Monday- Saturday, 11:00 AM - 2:00 PM',NULL,'2025-09-24 08:17:22','2025-12-02 11:26:45'),(59,'clinic_affiliations','St. Paul\'s Hospital, Iloilo Doctor\'s Hospital, Iloilo Mission Hospital, Western Visayas Medical Center, West Visayas State Uni. Med Center, Medicus Ambulatory, Metro Iloilo Hospital & Med. Center Inc.',NULL,'2025-09-24 08:17:22','2025-10-17 04:52:11'),(60,'report_header','ENT CLINIC ',NULL,'2025-09-24 08:17:22','2025-10-01 12:03:16'),(61,'report_footer','','MA. CANDIE PEARL O. BASCOS-VILLENA, MD. FPSO-HNS','2025-09-24 08:17:22','2025-10-08 22:41:18'),(62,'date_format','yyyy-MM-dd',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(63,'time_format','hh:mm tt',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(64,'printer_name	','XP-58',NULL,'2025-09-24 08:17:22','2025-10-08 13:47:14'),(65,'markup_percentage','50',NULL,'2025-09-24 08:17:22','2025-09-24 08:17:22'),(66,'clinic_subtitle','DISEASE OF EARS, NOSE & THROAT HEAD AND NECK SURGERY\\nMAXILLOFACIAL AND PLASTIC SURGERY',NULL,'2025-09-24 08:28:15','2025-12-02 11:29:38'),(67,'clinic_email','cpbascosmd@yahoo.com',NULL,'2025-09-24 08:42:52','2025-10-08 23:26:47'),(68,'license_number','99566','LIC. NO. 99566','2025-09-25 06:27:50','2025-10-08 13:47:14'),(82,'ptr','',NULL,'2025-10-08 13:47:14','2025-11-29 04:22:22'),(83,'stwo','',NULL,'2025-10-08 13:47:14','2025-11-29 04:22:22'),(84,'land_mark','(Front of Robinsons Jaro)',NULL,'2025-10-17 03:21:44','2025-10-17 03:23:13'),(85,'printer_name','XP-58 (copy 1)',NULL,'2025-10-17 06:09:04','2025-10-17 07:17:12'),(88,'base_path','\\\\server\\Shared',NULL,'2025-10-27 01:43:40','2025-11-29 03:54:07'),(92,'doctor_name','JOEBERT M. VILLANUEVA, M.D.',NULL,'2025-12-02 10:48:29','2025-12-02 11:46:49');
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
INSERT INTO `user` (`user_id`, `username`, `password`, `full_name`, `role`) VALUES (1,'a','a','Receptionistssss','Receptionist'),(2,'d','d','BASCOS','Doctor'),(3,'admin','admin','Admin','Admin'),(4,'janet','janet','Janet','Receptionist');
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
-- Temporary view structure for view `v_autocomplete_entries_monthly`
--

DROP TABLE IF EXISTS `v_autocomplete_entries_monthly`;
/*!50001 DROP VIEW IF EXISTS `v_autocomplete_entries_monthly`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_autocomplete_entries_monthly` AS SELECT 
 1 AS `snapshot_month`,
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
/*!50001 VIEW `v_autocomplete_entries` AS with recursive `seq` as (select 1 AS `n` union all select (`seq`.`n` + 1) AS `n + 1` from `seq` where (`seq`.`n` < 200)), `all_consult` as (select `consultation`.`consultation_id` AS `consultation_id`,'chief_complaint' AS `column_name`,`consultation`.`chief_complaint` AS `raw_value` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'history' AS `history`,`consultation`.`history` AS `history` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'ear_exam' AS `ear_exam`,`consultation`.`ear_exam` AS `ear_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'nose_exam' AS `nose_exam`,`consultation`.`nose_exam` AS `nose_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'throat_exam' AS `throat_exam`,`consultation`.`throat_exam` AS `throat_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'others_exam' AS `others_exam`,`consultation`.`others_exam` AS `others_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'diagnosis' AS `diagnosis`,`consultation`.`diagnosis` AS `diagnosis` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'recommendations' AS `recommendations`,`consultation`.`recommendations` AS `recommendations` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'maxillofacial_exam' AS `maxillofacial_exam`,`consultation`.`maxillofacial_exam` AS `maxillofacial_exam` from `consultation` union all select `consultation`.`consultation_id` AS `consultation_id`,'head_and_neck_exam' AS `head_and_neck_exam`,`consultation`.`head_and_neck_exam` AS `head_and_neck_exam` from `consultation` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'past_medical_history' AS `past_medical_history`,`health_record_history`.`past_medical_history` AS `past_medical_history` from `health_record_history` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'allergies' AS `allergies`,`health_record_history`.`allergies` AS `allergies` from `health_record_history` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'family_history' AS `family_history`,`health_record_history`.`family_history` AS `family_history` from `health_record_history` union all select `health_record_history`.`consultation_id` AS `consultation_id`,'personal_social_history' AS `personal_social_history`,`health_record_history`.`personal_social_history` AS `personal_social_history` from `health_record_history`), `normalized` as (select `all_consult`.`consultation_id` AS `consultation_id`,`all_consult`.`column_name` AS `column_name`,trim(both ',' from trim(regexp_replace(regexp_replace(regexp_replace(replace(replace(replace(`all_consult`.`raw_value`,char(13),' '),char(10),' '),';',','),'\\s+',' '),',+',','),'^,|,$',''))) AS `norm_value` from `all_consult` where ((`all_consult`.`raw_value` is not null) and (trim(`all_consult`.`raw_value`) <> ''))), `tokens` as (select `normalized`.`consultation_id` AS `consultation_id`,`normalized`.`column_name` AS `column_name`,trim(regexp_substr(`normalized`.`norm_value`,'[^,]+',1,`s`.`n`)) AS `token`,`s`.`n` AS `seq_no`,((1 + length(`normalized`.`norm_value`)) - length(replace(`normalized`.`norm_value`,',',''))) AS `token_count` from (`normalized` join `seq` `s` on((`s`.`n` <= ((1 + length(`normalized`.`norm_value`)) - length(replace(`normalized`.`norm_value`,',','')))))) where ((`normalized`.`norm_value` is not null) and (trim(`normalized`.`norm_value`) <> ''))), `processed` as (select `t`.`consultation_id` AS `consultation_id`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then `t`.`token` else NULL end) AS `emitted_obs` from `tokens` `t` where (`t`.`seq_no` = 1) union all select `t`.`consultation_id` AS `consultation_id`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then (case when (`p`.`pending_obs` is not null) then concat(`p`.`pending_obs`,', ',`t`.`token`) else `t`.`token` end) else `p`.`pending_obs` end) AS `emitted_obs` from (`tokens` `t` join `processed` `p` on(((`t`.`consultation_id` = `p`.`consultation_id`) and (`t`.`column_name` = `p`.`column_name`) and (`t`.`seq_no` = (`p`.`seq_no` + 1)))))), `observations` as (select `processed`.`consultation_id` AS `consultation_id`,`processed`.`column_name` AS `column_name`,`processed`.`emitted_obs` AS `obs` from `processed` where (`processed`.`emitted_obs` is not null) union all select `processed`.`consultation_id` AS `consultation_id`,`processed`.`column_name` AS `column_name`,`processed`.`pending_obs` AS `pending_obs` from `processed` where ((`processed`.`pending_obs` is not null) and (`processed`.`seq_no` = `processed`.`token_count`))) select `observations`.`column_name` AS `column_name`,concat(upper(left(`observations`.`obs`,1)),lower(substr(`observations`.`obs`,2))) AS `value`,count(0) AS `count` from `observations` where ((`observations`.`obs` is not null) and (trim(`observations`.`obs`) <> '')) group by `observations`.`column_name`,`value` order by `observations`.`column_name`,`count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_autocomplete_entries_monthly`
--

/*!50001 DROP VIEW IF EXISTS `v_autocomplete_entries_monthly`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_autocomplete_entries_monthly` AS with recursive `seq` as (select 1 AS `n` union all select (`seq`.`n` + 1) AS `n` from `seq` where (`seq`.`n` < 200)), `all_consult` as (select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'ear_exam' AS `column_name`,`c`.`ear_exam` AS `raw_value` from `consultation` `c` union all select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'nose_exam' AS `column_name`,`c`.`nose_exam` AS `raw_value` from `consultation` `c` union all select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'throat_exam' AS `column_name`,`c`.`throat_exam` AS `raw_value` from `consultation` `c` union all select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'maxillofacial_exam' AS `column_name`,`c`.`maxillofacial_exam` AS `raw_value` from `consultation` `c` union all select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'head_and_neck_exam' AS `column_name`,`c`.`head_and_neck_exam` AS `raw_value` from `consultation` `c` union all select `c`.`consultation_id` AS `consultation_id`,date_format(`c`.`consultation_date`,'%Y-%m') AS `snapshot_month`,'others_exam' AS `column_name`,`c`.`others_exam` AS `raw_value` from `consultation` `c`), `normalized` as (select `ac`.`consultation_id` AS `consultation_id`,`ac`.`snapshot_month` AS `snapshot_month`,`ac`.`column_name` AS `column_name`,trim(both ',' from trim(regexp_replace(regexp_replace(regexp_replace(replace(replace(replace(`ac`.`raw_value`,char(13),' '),char(10),' '),';',','),'\\s+',' '),',+',','),'^,|,$',''))) AS `norm_value` from `all_consult` `ac` where ((`ac`.`raw_value` is not null) and (trim(`ac`.`raw_value`) <> ''))), `tokens` as (select `n`.`consultation_id` AS `consultation_id`,`n`.`snapshot_month` AS `snapshot_month`,`n`.`column_name` AS `column_name`,trim(regexp_substr(`n`.`norm_value`,'[^,]+',1,`seq`.`n`)) AS `token`,`seq`.`n` AS `seq_no`,((1 + length(`n`.`norm_value`)) - length(replace(`n`.`norm_value`,',',''))) AS `token_count` from (`normalized` `n` join `seq` on((`seq`.`n` <= ((1 + length(`n`.`norm_value`)) - length(replace(`n`.`norm_value`,',','')))))) where ((`n`.`norm_value` is not null) and (trim(`n`.`norm_value`) <> ''))), `processed` as (select `t`.`consultation_id` AS `consultation_id`,`t`.`snapshot_month` AS `snapshot_month`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then `t`.`token` else NULL end) AS `emitted_obs` from `tokens` `t` where (`t`.`seq_no` = 1) union all select `t`.`consultation_id` AS `consultation_id`,`t`.`snapshot_month` AS `snapshot_month`,`t`.`column_name` AS `column_name`,`t`.`seq_no` AS `seq_no`,`t`.`token_count` AS `token_count`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then NULL else `t`.`token` end) AS `pending_obs`,(case when (upper(`t`.`token`) in ('AS','AD','AU')) then (case when (`p`.`pending_obs` is not null) then concat(`p`.`pending_obs`,', ',`t`.`token`) else `t`.`token` end) else `p`.`pending_obs` end) AS `emitted_obs` from (`tokens` `t` join `processed` `p` on(((`t`.`consultation_id` = `p`.`consultation_id`) and (`t`.`snapshot_month` = `p`.`snapshot_month`) and (`t`.`column_name` = `p`.`column_name`) and (`t`.`seq_no` = (`p`.`seq_no` + 1)))))), `observations` as (select `processed`.`consultation_id` AS `consultation_id`,`processed`.`snapshot_month` AS `snapshot_month`,`processed`.`column_name` AS `column_name`,`processed`.`emitted_obs` AS `obs` from `processed` where (`processed`.`emitted_obs` is not null) union all select `processed`.`consultation_id` AS `consultation_id`,`processed`.`snapshot_month` AS `snapshot_month`,`processed`.`column_name` AS `column_name`,`processed`.`pending_obs` AS `obs` from `processed` where ((`processed`.`pending_obs` is not null) and (`processed`.`seq_no` = `processed`.`token_count`))) select `observations`.`snapshot_month` AS `snapshot_month`,`observations`.`column_name` AS `column_name`,concat(upper(left(`observations`.`obs`,1)),lower(substr(`observations`.`obs`,2))) AS `value`,count(0) AS `count` from `observations` where ((`observations`.`obs` is not null) and (trim(`observations`.`obs`) <> '')) group by `observations`.`snapshot_month`,`observations`.`column_name`,`value` order by `observations`.`snapshot_month`,`observations`.`column_name`,`count` desc */;
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

-- Dump completed on 2025-12-03 12:54:25
