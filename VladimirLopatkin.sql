-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: CherkasyElektroTrans
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daily_transport_log`
--

DROP TABLE IF EXISTS `daily_transport_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_transport_log` (
  `daily_transport_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Daily Transport Log ID',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Employe ID',
  `transport_id` int(10) unsigned NOT NULL COMMENT 'Transport ID',
  `income` int(10) NOT NULL COMMENT 'Income',
  `working_day` date NOT NULL COMMENT 'Working Day',
  PRIMARY KEY (`daily_transport_log_id`),
  KEY `DAILY_TRANSPORT_LOG_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`),
  KEY `DAILY_TRANSPORT_LOG_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  CONSTRAINT `DAILY_TRANSPORT_LOG_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON DELETE CASCADE,
  CONSTRAINT `DAILY_TRANSPORT_LOG_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Daily Transport Log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_transport_log`
--

LOCK TABLES `daily_transport_log` WRITE;
/*!40000 ALTER TABLE `daily_transport_log` DISABLE KEYS */;
INSERT INTO `daily_transport_log` VALUES (1,2,2,550,'2019-03-05'),(2,3,1,670,'2019-03-05'),(3,4,3,580,'2019-03-05'),(4,5,4,430,'2019-03-05'),(5,14,8,450,'2019-03-05'),(6,15,6,600,'2019-03-05'),(7,2,7,590,'2019-03-06'),(8,3,4,320,'2019-03-06'),(9,4,10,700,'2019-03-06'),(10,5,12,710,'2019-03-06'),(11,14,13,520,'2019-03-06'),(12,15,5,630,'2019-03-06'),(13,2,4,555,'2019-03-07'),(14,3,11,685,'2019-03-07'),(15,4,7,795,'2019-03-07'),(16,5,12,385,'2019-03-07'),(17,14,9,695,'2019-03-07'),(18,15,5,580,'2019-03-07'),(19,2,4,560,'2019-03-08'),(20,3,2,325,'2019-03-08'),(21,4,6,485,'2019-03-08'),(22,5,7,800,'2019-03-08'),(23,14,10,810,'2019-03-08'),(24,15,13,760,'2019-03-08'),(25,2,2,550,'2019-03-09'),(26,3,1,670,'2019-03-09'),(27,4,3,580,'2019-03-09'),(28,5,5,430,'2019-03-09'),(29,14,8,450,'2019-03-09'),(30,15,6,600,'2019-03-09');
/*!40000 ALTER TABLE `daily_transport_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `employe_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employe ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Position ID',
  `employe_first_name` varchar(127) NOT NULL COMMENT 'Employe First Name',
  `employe_last_name` varchar(127) NOT NULL COMMENT 'Employe Last Name',
  `dob` date NOT NULL COMMENT 'Date of Birth',
  `salary` decimal(8,2) NOT NULL COMMENT 'Salary',
  `employment_date` date NOT NULL COMMENT 'Employment Date',
  PRIMARY KEY (`employe_id`),
  KEY `EMPLOYE_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYE_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Employe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,1,'Rostislav','Gonchar','1975-07-05',15249.15,'1999-05-23'),(2,2,'Platon','Merkushev','1976-04-14',6751.25,'2004-09-20'),(3,2,'Evgenii','Grinevskiy','1975-10-17',7542.47,'2002-09-15'),(4,2,'Zinovii','Petrov','1977-03-18',8214.67,'2008-11-28'),(5,2,'Zufar','Gonchar','1979-01-11',5234.95,'2003-09-13'),(6,1,'Dina','Tereshchenko','1983-05-13',14241.35,'2001-06-18'),(7,5,'Oksana','Dorofeeva','1988-12-05',4254.12,'2003-11-24'),(8,5,'Inna','Savenko','1981-01-18',6552.33,'2005-04-12'),(9,3,'Vasilii','Sobolev','1979-09-14',9548.47,'2014-08-06'),(10,4,'Nikodim','Petrovskii','1989-02-22',4221.42,'2011-06-06'),(11,4,'Sofia','Chernova','1990-09-02',7661.15,'2006-06-14'),(12,6,'Albina','Gorodetska','1980-05-24',8522.34,'2011-08-07'),(13,6,'Malvina','Makarova','1989-06-18',4554.16,'2010-05-11'),(14,2,'Zhdan','Prokhorov','1977-11-30',6994.86,'2005-12-11'),(15,2,'Matvei','Gorobchuk','1982-04-15',7448.45,'2009-10-12'),(16,4,'ZHanna','Marochko','1986-02-11',5554.07,'2007-10-24');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Position Name',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Director'),(2,'Driver'),(3,'Mechanic'),(4,'Conductor'),(5,'dispatcher'),(6,'accountant');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_log`
--

DROP TABLE IF EXISTS `salary_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_log` (
  `salary_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary ID',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Employe ID',
  `monthly_salary` decimal(8,2) NOT NULL COMMENT 'Monthly Salary',
  `date_of_issue` date NOT NULL COMMENT 'Date Of Issue',
  PRIMARY KEY (`salary_log_id`),
  KEY `SALARY_LOG_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`),
  CONSTRAINT `SALARY_LOG_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_log`
--

LOCK TABLES `salary_log` WRITE;
/*!40000 ALTER TABLE `salary_log` DISABLE KEYS */;
INSERT INTO `salary_log` VALUES (1,1,14993.45,'2019-01-31'),(2,2,6122.55,'2019-01-31'),(3,3,9857.45,'2019-01-31'),(4,4,6442.45,'2019-01-31'),(5,5,7211.45,'2019-01-31'),(6,6,13456.54,'2019-01-31'),(7,7,10078.75,'2019-01-31'),(8,8,91241.73,'2019-01-31'),(9,9,8574.75,'2019-01-31'),(10,10,7862.42,'2019-01-31'),(11,11,9576.37,'2019-01-31'),(12,12,7548.36,'2019-01-31'),(13,13,6322.41,'2019-01-31'),(14,14,6785.45,'2019-01-31'),(15,15,7651.45,'2019-01-31'),(16,16,7354.45,'2019-01-31'),(17,1,15244.12,'2019-02-28'),(18,2,8547.12,'2019-02-28'),(19,3,7567.45,'2019-02-28'),(20,4,5241.45,'2019-02-28'),(21,5,3488.45,'2019-02-28'),(22,6,15687.73,'2019-02-28'),(23,7,10479.61,'2019-02-28'),(24,8,9537.73,'2019-02-28'),(25,9,7564.75,'2019-02-28'),(26,10,7564.85,'2019-02-28'),(27,11,7358.45,'2019-02-28'),(28,12,6453.71,'2019-02-28'),(29,13,4458.85,'2019-02-28'),(30,14,6884.02,'2019-02-28'),(31,15,9456.37,'2019-02-28'),(32,16,8537.57,'2019-02-28'),(33,1,16223.95,'2019-03-31'),(34,2,4577.54,'2019-03-31'),(35,3,8758.45,'2019-03-31'),(36,4,7856.45,'2019-03-31'),(37,5,8534.45,'2019-03-31'),(38,6,14683.85,'2019-03-31'),(39,7,10957.12,'2019-03-31'),(40,8,8675.96,'2019-03-31'),(41,9,6458.45,'2019-03-31'),(42,10,6784.12,'2019-03-31'),(43,11,7685.11,'2019-03-31'),(44,12,8631.47,'2019-03-31'),(45,13,9057.14,'2019-03-31'),(46,14,8770.12,'2019-03-31'),(47,15,8311.70,'2019-03-31'),(48,16,7961.10,'2019-03-31');
/*!40000 ALTER TABLE `salary_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport ID',
  `transport_name` varchar(63) NOT NULL COMMENT 'Transport Name',
  `car_number` varchar(63) NOT NULL COMMENT 'Car Number',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'trolley_bus_1','CA547'),(2,'trolley_bus_1A','CA854'),(3,'trolley_bus_3','CA428'),(4,'trolley_bus_4','CA657'),(5,'trolley_bus_4A','CA347'),(6,'trolley_bus_7','CA957'),(7,'trolley_bus_7A','CA247'),(8,'trolley_bus_8','CA347'),(9,'trolley_bus_8P','CA854'),(10,'trolley_bus_10','CA341'),(11,'trolley_bus_11','CA821'),(12,'trolley_bus_14','CA312'),(13,'trolley_bus_50','CA158');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 20:29:18
