-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: awseb-e-kjywjhzu8p-stack-awsebrdsdatabase-eqsp4bnalizd.chttsa0blrl0.us-east-1.rds.amazonaws.com    Database: ebdb
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Attendee`
--

DROP TABLE IF EXISTS `Attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendee` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `attendee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendee`
--

LOCK TABLES `Attendee` WRITE;
/*!40000 ALTER TABLE `Attendee` DISABLE KEYS */;
INSERT INTO `Attendee` VALUES (39,'',''),(40,'City, Uni of London','I love football'),(50,'test','updated test'),(66,'','I love cats');
/*!40000 ALTER TABLE `Attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendee_Contact_Event_Organizer`
--

DROP TABLE IF EXISTS `Attendee_Contact_Event_Organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendee_Contact_Event_Organizer` (
  `contact_organizer_form_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(128) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_sent` varchar(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `attendee_id` int DEFAULT NULL,
  `organizer_id` int DEFAULT NULL,
  PRIMARY KEY (`contact_organizer_form_id`),
  KEY `attendee_id` (`attendee_id`),
  KEY `event_id` (`event_id`),
  KEY `organizer_id` (`organizer_id`),
  CONSTRAINT `Attendee_Contact_Event_Organizer_ibfk_1` FOREIGN KEY (`attendee_id`) REFERENCES `Attendee` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Attendee_Contact_Event_Organizer_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Attendee_Contact_Event_Organizer_ibfk_3` FOREIGN KEY (`organizer_id`) REFERENCES `Event_Organizer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendee_Contact_Event_Organizer`
--

LOCK TABLES `Attendee_Contact_Event_Organizer` WRITE;
/*!40000 ALTER TABLE `Attendee_Contact_Event_Organizer` DISABLE KEYS */;
INSERT INTO `Attendee_Contact_Event_Organizer` VALUES (3,'Event schedule','When does the event end?','2023-04-19','Hi, it ends at 9pm',52,40,1);
/*!40000 ALTER TABLE `Attendee_Contact_Event_Organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendee_Tags`
--

DROP TABLE IF EXISTS `Attendee_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendee_Tags` (
  `tag_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `attendee_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendee_tags_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Attendee` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendee_Tags`
--

LOCK TABLES `Attendee_Tags` WRITE;
/*!40000 ALTER TABLE `Attendee_Tags` DISABLE KEYS */;
INSERT INTO `Attendee_Tags` VALUES (8,40),(8,66),(12,66);
/*!40000 ALTER TABLE `Attendee_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact_Form`
--

DROP TABLE IF EXISTS `Contact_Form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact_Form` (
  `contact_form_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(128) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_sent` varchar(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`contact_form_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `contact_form_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact_Form`
--

LOCK TABLES `Contact_Form` WRITE;
/*!40000 ALTER TABLE `Contact_Form` DISABLE KEYS */;
INSERT INTO `Contact_Form` VALUES (7,'Thanks','Hi, I really appreciate your work.','2023-04-19',NULL,40);
/*!40000 ALTER TABLE `Contact_Form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(100) NOT NULL,
  `date_created` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `status` enum('created','progress','closed') NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `short_description_pinned` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Event_Organizer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (51,'Amazon Cloud Computing','4be94849','2023-04-19','Learn about cloud computing with Patrik','2023-04-27','2023-05-04','14:00','','progress','San Francisco, CA',39,'Cloud Computing'),(52,'Theory of Computation','59f52f14','2023-04-19','Lecture about Turing machine','2023-04-26','2023-05-03','20:41','','created','Oakden',1,'Bring your laptop.');
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_Members`
--

DROP TABLE IF EXISTS `Event_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_Members` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `time_joined` varchar(30) NOT NULL,
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_members_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_Members`
--

LOCK TABLES `Event_Members` WRITE;
/*!40000 ALTER TABLE `Event_Members` DISABLE KEYS */;
INSERT INTO `Event_Members` VALUES (40,51,'04/23/2023 11:41:29 pm'),(40,52,'04/19/2023 05:21:25 pm'),(66,52,'04/23/2023 10:48:12 pm');
/*!40000 ALTER TABLE `Event_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_Organizer`
--

DROP TABLE IF EXISTS `Event_Organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_Organizer` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `plan_type` enum('free','bronze','gold','diamond') DEFAULT 'free',
  `events_remaining` int DEFAULT '3',
  `api_key` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `event_organizer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_Organizer`
--

LOCK TABLES `Event_Organizer` WRITE;
/*!40000 ALTER TABLE `Event_Organizer` DISABLE KEYS */;
INSERT INTO `Event_Organizer` VALUES (1,'MyStudentWellbeing','free',45,NULL),(39,NULL,'free',50,'5fce3473d49db416dba08d85d9599b7f9664777920c1509da8b5a01fae10'),(50,NULL,'free',50,'3bfa12a758316c1b1e92ee246ed7a71892318521d84ae2855467a1c7a8e8');
/*!40000 ALTER TABLE `Event_Organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `time_sent` varchar(50) NOT NULL,
  `message_body` varchar(255) NOT NULL,
  `priority` tinyint(1) DEFAULT '0',
  `subgroup_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `is_private` bit(1) DEFAULT b'0',
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `subgroup_id` (`subgroup_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`subgroup_id`) REFERENCES `Subgroup` (`subgroup_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (217,'04/19/2023 05:33:06 pm','Hi Everyone',0,NULL,40,52,_binary '\0'),(369,'04/23/2023 10:48:31 pm','Hi, Waleed. How are you?',0,NULL,66,52,_binary '\0'),(370,'04/23/2023 10:49:06 pm','I\'m fine thanks. What about you?',0,NULL,40,52,_binary '\0'),(371,'04/23/2023 10:49:13 pm','I\'m good. Can we talk in private?',0,NULL,66,52,_binary '\0'),(372,'04/23/2023 10:49:22 pm','Yes!!',0,NULL,40,52,_binary '\0'),(373,'04/23/2023 10:49:53 pm','Hi, Waleed. I saw that you like Computer Science, what programming languages do you like/know?',0,NULL,66,52,_binary ''),(374,'04/23/2023 10:50:13 pm','HI Andrea, I love Java. What about you?',0,NULL,40,52,_binary ''),(375,'04/23/2023 10:50:59 pm','Can anyone help me with ex1? I can\'t understand the x variable meaning. Thanks',0,23,66,52,_binary '\0');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Private_Message`
--

DROP TABLE IF EXISTS `Private_Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Private_Message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `receiver_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `private_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `private_message_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `Message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Private_Message`
--

LOCK TABLES `Private_Message` WRITE;
/*!40000 ALTER TABLE `Private_Message` DISABLE KEYS */;
INSERT INTO `Private_Message` VALUES (373,40,66),(374,66,40);
/*!40000 ALTER TABLE `Private_Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subgroup`
--

DROP TABLE IF EXISTS `Subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subgroup` (
  `subgroup_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_activity` varchar(20) DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`subgroup_id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `subgroup_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subgroup`
--

LOCK TABLES `Subgroup` WRITE;
/*!40000 ALTER TABLE `Subgroup` DISABLE KEYS */;
INSERT INTO `Subgroup` VALUES (23,'exercise 1','help with ex1','2023-04-28','12:44','',12,'a301',52,50);
/*!40000 ALTER TABLE `Subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subgroup_Members`
--

DROP TABLE IF EXISTS `Subgroup_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subgroup_Members` (
  `user_id` int NOT NULL,
  `subgroup_id` int NOT NULL,
  `time_joined` varchar(50) NOT NULL,
  PRIMARY KEY (`subgroup_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `subgroup_members_ibfk_1` FOREIGN KEY (`subgroup_id`) REFERENCES `Subgroup` (`subgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subgroup_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subgroup_Members`
--

LOCK TABLES `Subgroup_Members` WRITE;
/*!40000 ALTER TABLE `Subgroup_Members` DISABLE KEYS */;
INSERT INTO `Subgroup_Members` VALUES (40,23,'04/22/2023 01:54:50 pm'),(66,23,'04/23/2023 10:50:36 pm');
/*!40000 ALTER TABLE `Subgroup_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscription_Request`
--

DROP TABLE IF EXISTS `Subscription_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subscription_Request` (
  `subscription_request_id` int NOT NULL AUTO_INCREMENT,
  `plan_type` enum('bronze','gold','diamond') NOT NULL,
  `status` enum('waiting for payment','completed','declined','processing') NOT NULL,
  `is_paid` bit(1) NOT NULL,
  `date_created` varchar(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`subscription_request_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `subscription_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Event_Organizer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscription_Request`
--

LOCK TABLES `Subscription_Request` WRITE;
/*!40000 ALTER TABLE `Subscription_Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subscription_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (8,'Computer Science','Subject'),(9,'Maths','Subject'),(10,'Football','Sports'),(11,'Cricket','Sports'),(12,'Hip Hop','Music'),(13,'Rock','Music');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('attendee','supervisor','organizer','admin') NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'waleed','hassan','hassanwaleedev@gmail.com','833f3cdbcdd7ce4dc4cd7481fcec9df5',NULL,'admin'),(39,'Amazon','Uk','amazon@organizer.com','f5f8f6d587f2ca16648e4c22a095986b',NULL,'organizer'),(40,'waleed','hassan','waleed.hassan0120@gmail.com','b7ce8294183a0f2a6092b6cb2f17b9b5','https://aplus-network-app.s3.amazonaws.com/profile_pictures/644014ef4d2c1.jpeg','attendee'),(50,'php','unit','test@test.test','098f6bcd4621d373cade4e832627b4f6',NULL,'attendee'),(66,'Andrea','Giapponesi','andrea@cremo.com','8d28898f353eda472701f2b68d2a8cdb','https://aplus-network-app.s3.amazonaws.com/profile_pictures/6445a77c48086.jpeg','supervisor');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 16:22:26
