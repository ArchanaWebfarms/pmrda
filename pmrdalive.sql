-- MySQL dump 10.14  Distrib 5.5.65-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pmrdadb
-- ------------------------------------------------------
-- Server version	5.5.65-MariaDB

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
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(15) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(15) DEFAULT '0',
  `comments` varchar(1000) DEFAULT NULL,
  `complaintstatus` varchar(100) DEFAULT NULL,
  `FinancialYear` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4,
  `STATE` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` int(10) unsigned DEFAULT NULL,
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` int(10) unsigned DEFAULT NULL,
  `dept_name_h` longtext CHARACTER SET utf8mb4,
  `objectives` longtext COLLATE utf8_bin,
  `objectives_h` longtext COLLATE utf8_bin,
  `functions` longtext COLLATE utf8_bin,
  `functions_h` longtext COLLATE utf8_bin,
  `projects` longtext COLLATE utf8_bin,
  `projects_h` longtext COLLATE utf8_bin,
  `roles_and_responsibility` longtext COLLATE utf8_bin,
  `roles_and_responsibility_h` longtext COLLATE utf8_bin,
  `achievements` longtext COLLATE utf8_bin,
  `achievements_h` longtext COLLATE utf8_bin,
  `salient_features` longtext COLLATE utf8_bin,
  `salient_features_h` longtext COLLATE utf8_bin,
  `other_title` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `other_title_h` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `other_content` longtext COLLATE utf8_bin,
  `other_content_h` longtext COLLATE utf8_bin,
  `delete_approval_status` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `delete_approval_comment` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `create_approval_status` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `create_approved_by` varchar(1000) COLLATE utf8_bin DEFAULT '0',
  `create_approval_date` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `create_approval_comment` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `description_h` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `entry_log`
--

DROP TABLE IF EXISTS `entry_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_id` varchar(45) DEFAULT NULL,
  `title` longtext,
  `Attachment_id` varchar(45) DEFAULT NULL,
  `Type` varchar(1000) DEFAULT NULL,
  `table_name` varchar(45) DEFAULT NULL,
  `MODIFIED_ON` varchar(45) DEFAULT NULL,
  `title_h` longtext CHARACTER SET utf8mb4,
  `status` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_log`
--

LOCK TABLES `entry_log` WRITE;
/*!40000 ALTER TABLE `entry_log` DISABLE KEYS */;
INSERT INTO `entry_log` VALUES (599,'110','University Flyover Traffic Congestion Report	',NULL,'NEWS','tbl_news','2020-09-17 21:45:56','विद्यापीठ उड्डाणपूल वाहतूक कोंडी अहवाल','A',NULL),(602,'275','ssss','0','CIRCULERS','tbl_notices','2020-09-18 12:56:43','एस','D',NULL),(610,'92','Appointment of a private agency for Demolition of any type of illegal construction in PMR area with required machinary and man power along with Videogrphy work.','0','TENDER','tbl_tender','2021-01-22 00:23:15','??? ??????? ???? ????? ??????? ???&laquo;&copy;?????? ???? ????&acute;? ?? ?&frac34;?&copy; ??&Iacute;???????&laquo;???? ?????&Euml;???????? ???? ?&frac34;???? ????????? ???????? ? ???&Iacute;??? ?. ????????&frac12;?????? ????? ??&Acirc;??????&macr;? ???????? ?????? ? ??????-?&Aacute;????? ?????? ???????????.','A',NULL);
/*!40000 ALTER TABLE `entry_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (29,'Ravina','8830641410','ravinassonawane@gmail.com','engg','engg','2020-09-04',0,NULL,0,'pending',NULL,'91'),(30,'Ravina Sonawane','8830641410','ravinassonawane@gmail.com','PMRDA ','pune','2020-09-10',0,NULL,0,'pending',NULL,'91'),(31,'yashashree m','9970292531','yashashreecse@gmail.com','aa','aa','2020-09-11',0,NULL,0,'pending',NULL,'91'),(32,'yashashree m','9970292531','yashashreecse@gmail.com','aa','aa','2020-09-11',0,NULL,0,'pending',NULL,'91'),(33,'Ravina Sonawane','8830641410','ravina.sonawane@vidyaonline.in','PMRDA','PMRDA','2021-01-22',0,NULL,0,'pending',NULL,'91'),(34,'Popat  Hulge','9637180884','pophu667@gmail.com','home build up ','In gram panchayat, house building work is to be considered','2021-01-22',0,NULL,0,'pending',NULL,'91');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_year`
--

DROP TABLE IF EXISTS `financial_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_year` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `financialYear` varchar(45) DEFAULT NULL,
  `currentStatus` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `CREATED_ON` datetime DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT NULL,
  `MODIFIED_ON` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_FINACIAL_YEAR` (`financialYear`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_year`
--

LOCK TABLES `financial_year` WRITE;
/*!40000 ALTER TABLE `financial_year` DISABLE KEYS */;
INSERT INTO `financial_year` VALUES (1,'2019-2020','No','A','2018-06-14 00:00:00','2','2018-06-20 17:00:41','2','Current Year'),(3,'2020-2021','YES','A','2018-06-14 19:29:57','2',NULL,'0','pppppp'),(7,'2021-2022','No','A','2018-06-15 16:33:53','2','2018-06-15 16:37:00','2','xxxxxx'),(8,'2022-2023','No','A','2018-06-20 15:44:24','2',NULL,'0','kkkkkkkkk');
/*!40000 ALTER TABLE `financial_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_TYPE` varchar(255) DEFAULT NULL,
  `MODULE_CATEGORY` varchar(255) DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (2,'WHAT\'S NEW',NULL,'2005-05-20','1','2005-05-20','1'),(3,'TENDERS NOTICE',NULL,'2005-05-20','1','2005-05-20','1'),(6,'NOTIFICATIONS',NULL,'2005-05-20','2',NULL,'0'),(9,'PROJECT',NULL,'2005-05-20','0',NULL,'0'),(10,'CUREENT OPENINGS',NULL,'2005-05-20','0',NULL,'0'),(11,'DEPARTMENTS',NULL,'2005-05-20','0',NULL,'0');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `MODULE_ID` bigint(20) NOT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (6,'CREATE_TENDERS',3,NULL,'1',NULL,'1'),(7,'UPDATE_TENDERS',3,NULL,'1',NULL,'1'),(8,'VIEW_TENDERS',3,NULL,'1',NULL,'1'),(9,'DELETE_TENDERS',3,NULL,'1',NULL,'1'),(10,'CREATE_NOTIFICATIONS',6,NULL,'0',NULL,'0'),(11,'VIEW_NOTIFICATIONS',6,NULL,'0',NULL,'0'),(12,'UPDATE_NOTIFICATIONS',6,NULL,'0',NULL,'0'),(13,'DELETE_NOTIFICATIONS',6,NULL,'0',NULL,'0'),(17,'CREATE_NEWS',2,NULL,'0',NULL,'0'),(18,'VIEW_NEWS',2,NULL,'0',NULL,'0'),(19,'UPDATE_NEWS',2,NULL,'0',NULL,'0'),(20,'DELETE_NEWS',2,NULL,'0',NULL,'0'),(21,'CREATE_PROJECT',9,'2020-08-21','0','2020-08-21','0'),(22,'VIEW_PROJECT',9,'2020-08-21','0','2020-08-21','0'),(23,'UPDATE_PROJECT',9,'2020-08-21','0','2020-08-21','0'),(24,'DELETE_PROJECT',9,'2020-08-21','0','2020-08-21','0'),(25,'CREATE_OPENING',10,NULL,'0',NULL,'0'),(26,'VIEW_OPENING',10,NULL,'0',NULL,'0'),(27,'UPDATE_OPENING',10,NULL,'0',NULL,'0'),(28,'DELETE_OPENING',10,NULL,'0',NULL,'0'),(29,'CLOSED_OPENING',10,NULL,'0',NULL,'0'),(30,'CREATE_DEPARTMENT',11,NULL,'0',NULL,'0'),(31,'VIEW_DEPARTMENT',11,NULL,'0',NULL,'0'),(32,'UPDATE_DEPARTMENT',11,NULL,'0',NULL,'0'),(33,'DELETE_DEPARTMENT',11,NULL,'0',NULL,'0');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_TYPE` varchar(45) DEFAULT NULL,
  `ROLE_CATEGORY` varchar(45) DEFAULT 'ASSOCIATE',
  `ROLE_DESCRIPTION` varchar(45) DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT '0',
  `STATUS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (22,'SUPERADMIN','ASSOCIATE','Super Admin','2020-08-21','36',NULL,'0','D'),(23,'ADMIN','ASSOCIATE','Admin','2020-08-21','36',NULL,'0','A'),(24,'USER','ASSOCIATE','User','2020-08-21','36',NULL,'0','A'),(25,'test','ASSOCIATE','test1','2020-09-12','36',NULL,'0','D'),(26,'abc','ASSOCIATE','abc','2020-09-21','36',NULL,'0','D');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attachment`
--

DROP TABLE IF EXISTS `tbl_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attachment` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) DEFAULT NULL,
  `module_type` varchar(100) DEFAULT NULL,
  `attachment_name` varchar(100) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `galary_cate_id` int(11) DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT '0',
  `FinancialYear` bigint(20) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `title` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `extension` varchar(100) DEFAULT NULL,
  `taluka_id` int(11) DEFAULT NULL,
  `title_h` varchar(1000) DEFAULT NULL,
  `opening_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `FK_FY` (`FinancialYear`),
  CONSTRAINT `FK_FY` FOREIGN KEY (`FinancialYear`) REFERENCES `financial_year` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2158 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attachment`
--

LOCK TABLES `tbl_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_attachment` DISABLE KEYS */;
INSERT INTO `tbl_attachment` VALUES (2140,0,'English Attachment','ShriSuhasDiwase.png','/opt/tomcat/webapps/ROOT/staticResources/Department/ShriSuhasDiwase.png',0,'A',NULL,'0',NULL,'0',NULL,'DEPARTMENT',NULL,NULL,'png',NULL,NULL,NULL,NULL,27),(2141,0,NULL,'cm.png','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/cm.png',0,'A',NULL,'0',NULL,'0',NULL,'LEADERSHIP',NULL,NULL,'png',NULL,NULL,NULL,1,NULL),(2142,0,NULL,'AjitPawar.jpg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/AjitPawar.jpg',0,'A',NULL,'0',NULL,'0',NULL,'LEADERSHIP',NULL,NULL,'jpg',NULL,NULL,NULL,2,NULL),(2143,0,NULL,'Shri Suhas Diwase.jpeg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Shri Suhas Diwase.jpeg',0,'A',NULL,'0',NULL,'0',NULL,'LEADERSHIP',NULL,NULL,'jpeg',NULL,NULL,NULL,3,NULL),(2144,0,NULL,'Smt. Kavita Dwevedi_w.png','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Smt. Kavita Dwevedi_w.png',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'png',NULL,NULL,NULL,4,NULL),(2145,0,NULL,'Shri. Shrihari Khurd_w.png','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Shri. Shrihari Khurd_w.png',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'png',NULL,NULL,NULL,5,NULL),(2146,0,NULL,'Kharwardkar.jpg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Kharwardkar.jpg',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'jpg',NULL,NULL,NULL,6,NULL),(2147,0,NULL,'Girkar_w.png','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Girkar_w.png',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'png',NULL,NULL,NULL,7,NULL),(2148,0,NULL,'Ashtekar_w2.png','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Ashtekar_w2.png',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'png',NULL,NULL,NULL,8,NULL),(2149,0,NULL,'Kharwardkar.jpg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Kharwardkar.jpg',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'jpg',NULL,NULL,NULL,9,NULL),(2150,0,NULL,'Shri. Devendra Potphode.jpg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Shri. Devendra Potphode.jpg',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'jpg',NULL,NULL,NULL,10,NULL),(2151,0,NULL,'Dr. Pravinkumar Devre 2_w2.jpg','/opt/tomcat/webapps/ROOT/staticResources/LeadershipCoreTeam/Dr. Pravinkumar Devre 2_w2.jpg',0,'A',NULL,'0',NULL,'0',NULL,'CORE TEAM',NULL,NULL,'jpg',NULL,NULL,NULL,11,NULL),(2152,92,'English Attachment','TNo07TenderNotice.pdf','/opt/tomcat/webapps/ROOT/staticResources/Tenders/TNo07TenderNotice.pdf',0,'A','2021-01-21','0',NULL,'0',3,'TENDER',' 07 For FY 2020-2021 ','240','pdf',NULL,NULL,NULL,NULL,NULL),(2153,92,'Marathi Attachment','TNo07DTP.pdf','/opt/tomcat/webapps/ROOT/staticResources/Tenders/TNo07DTP.pdf',0,'A','2021-01-21','0',NULL,'0',3,'TENDER',' 07 For FY 2020-2021 ','5052','pdf',NULL,NULL,NULL,NULL,NULL),(2154,93,'English Attachment','???????? ?????????.pdf','/opt/tomcat/webapps/ROOT/staticResources/Tenders/???????? ?????????.pdf',0,'A','2021-01-21','0',NULL,'0',3,'TENDER','tender','45','pdf',NULL,NULL,NULL,NULL,NULL),(2155,93,'Marathi Attachment','???????? ?????????.pdf','/opt/tomcat/webapps/ROOT/staticResources/Tenders/???????? ?????????.pdf',0,'A','2021-01-21','0',NULL,'0',3,'TENDER','tender','45','pdf',NULL,NULL,NULL,NULL,NULL),(2156,0,NULL,NULL,NULL,0,NULL,NULL,'0',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2157,0,NULL,NULL,NULL,0,NULL,NULL,'0',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_current_opening`
--

DROP TABLE IF EXISTS `tbl_current_opening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_current_opening` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(1000) DEFAULT NULL,
  `total_vacancy` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `opening_status` varchar(45) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `post_h` varchar(1000) DEFAULT NULL,
  `opening_status_h` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `approval_status` varchar(45) DEFAULT NULL,
  `approved_by` varchar(1000) DEFAULT '0',
  `approved_date` varchar(45) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `delete_approval_status` varchar(45) DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) DEFAULT NULL,
  `delete_approval_comment` varchar(1000) DEFAULT NULL,
  `total_vacancy_h` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_current_opening`
--

LOCK TABLES `tbl_current_opening` WRITE;
/*!40000 ALTER TABLE `tbl_current_opening` DISABLE KEYS */;
INSERT INTO `tbl_current_opening` VALUES (9,'Junior Engineer',5,'D','Opened',55,'2020-09-07',36,'2020-09-07','कनिष्ठ अभियंता','उघडले',29,'Approved','Akshay Khatu','2020-09-15 16-48-20','Approved','Deactivate',36,'2020-09-15 16-58-39','','५'),(10,'Engineer',5,'A','Opened',36,'2020-09-21',0,NULL,'अभियंता','उघडले',29,'Approved','Akshay Khatu','2020-09-21 11-40-58','','Active',0,NULL,NULL,'५');
/*!40000 ALTER TABLE `tbl_current_opening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department_contact`
--

DROP TABLE IF EXISTS `tbl_department_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_department_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `dept_office_id` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `contact_no` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `name_h` varchar(500) DEFAULT NULL,
  `contact_no_h` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department_contact`
--

LOCK TABLES `tbl_department_contact` WRITE;
/*!40000 ALTER TABLE `tbl_department_contact` DISABLE KEYS */;
INSERT INTO `tbl_department_contact` VALUES (1,27,1,'Mr. Yogesh Bhosale','9823338271','ad.pmrda@gmail.com','A','श्री. योगेश भोसले','९८२३३३८२७१'),(2,27,2,'Mr. Yogesh Bhosale','9823338271','ad.pmrda@gmail.com','A','श्री. योगेश भोसले','९८२३३३८२७१'),(3,27,3,'Mr. Yogesh Bhosale','9823338271','ad.pmrda@gmail.com','A','श्री. योगेश भोसले','९८२३३३८२७१'),(4,27,4,'Mr. Sanjeev Jalindre (Public Information Officer)','8888885567','ad.pmrda@gmail.com','A','श्री. संजीव जालिंद्रे (सार्वजनिक माहिती अधिकारी)','८८८८८८५५६७'),(5,27,4,'Mr. Yogesh Bhosale (Appellate officer)','9823338271','ad.pmrda@gmail.com','A','श्री. योगेश भोसले (अपील अधिकारी)','९८२३३३८२७१'),(6,27,5,'Mr. Sanjeev Jalindre (Public Information Officer)','8888885567','ad.pmrda@gmail.com','A','श्री. संजीव जालिंद्रे (जनसंपर्क अधिकारी)','८८८८८८५५६७'),(7,27,5,'Mr. Yogesh Bhosale (Appellate officer)','9823338271','ad.pmrda@gmail.com','A','श्री. योगेश भोसले  (अपील अधिकारी)','९८२३३३८२७१'),(8,28,1,'Shri. Mangesh Butke','9421675367','cafopmrda@gmail.com','A','श्री. मंगेश बुटके','९४२१६७५३६७'),(9,28,2,'Shri. Suresh Bhong','7276737935','cafopmrda@gmail.com','A','श्री. सुरेश भोंग','७२७६७३७९३५'),(10,28,3,'Shri. Suresh Bhong','7276737935','cafopmrda@gmail.com','A','श्री. सुरेश भोंग','७२७६७३७९३५'),(11,28,4,'Shri. Mangesh Butke','9421675367','cafopmrda@gmail.com','A','श्री. मंगेश बुटके','९४२१६७५३६७'),(12,28,5,'Shri. Shrihari Khurd, CAFO','9822967909','cafopmrda@gmail.com','A','श्री. श्रीहरी खुर्द, सीएएफओ','९८२२९६७९०९'),(13,29,1,'Smt Rashmi Patil','9823375678','cepmrda@gmail.com','A','श्रीमती. रश्मी पाटील','९८२३३७५६७८'),(14,29,2,'Smt. Rashmi Patil','9823375678','cepmrda@gmail.com','A','श्रीमती. रश्मी पाटील','९८२३३७५६७८'),(15,29,2,'Shri. Bharat Kumar Baviskar','27659855','cepmrda@gmail.com','A','श्री. भारत कुमार बाविस्कर','२७६५९८५५'),(16,29,2,'Shri . S.P. Kumbhar','9421204449','cepmrda@gmail.com','A','श्री. एस.पी. कुंभार','९४२१२०४४४९'),(17,29,2,'Smt. Pallavi Sonavane','27659855','cepmrda@gmail.com','A','श्रीमती. पल्लवी सोनवणे','२७६५९८५५'),(18,29,3,'Smt. Rashmi Patil','9823375678','cepmrda@gmail.com','A','Smt. Rashmi Patil','९८२३३७५६७८'),(19,29,3,'Shri. Bharat Kumar Baviskar','27659855','cepmrda@gmail.com','A','श्री. भारत कुमार बाविस्कर','२७६५९८५५'),(20,29,3,'Shri. S.P. Kumbhar','9421204449','cepmrda@gmail.com','A','श्री. एस.पी. कुंभार','९४२१२०४४४९'),(21,29,3,'Smt. Pallavi Sonavane','27659855','cepmrda@gmail.com','A','श्रीमती. पल्लवी सोनवणे','२७६५९८५५'),(22,29,4,'Smt. Rajshree Diwan','27659855','cepmrda@gmail.com','A','श्रीमती. राजश्री दिवाण','२७६५९८५५'),(23,29,4,'Shri. Bharat Kumar Baviskar','27659855','cepmrda@gmail.com','A','श्री. भारत कुमार बाविस्कर','२७६५९८५५'),(24,29,4,'Smt. Dipali Wani','27659855','cepmrda@gmail.com','A','श्रीमती. दिपाली वणी','२७६५९८५५'),(25,29,5,'Smt. Rajshree Diwan','27659855','cepmrda@gmail.com','A','श्रीमती. राजश्री दिवाण','२७६५९८५५'),(26,29,5,'Shri. Bharat Kumar Baviskar','27659855','cepmrda@gmail.com','A','श्री. भारत कुमार बाविस्कर','२७६५९८५५'),(27,29,5,'Smt. Dipali Wani','27659855','cepmrda@gmail.com','A','श्रीमती. दिपाली वणी','२७६५९८५५'),(28,30,1,'Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','9922423122','lnepmrda@gmail.com','A','सौ शिल्पा करमरकर, डीवायसीईओ आणि उपजिल्हाधिकारी','९९२२४२३१२२'),(29,30,2,'Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','9922423122','lnepmrda@gmail.com','A','सौ शिल्पा करमरकर, डीवायसीईओ आणि उपजिल्हाधिकारी','९९२२४२३१२२'),(30,30,3,'Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','9922423122','lnepmrda@gmail.com','A','सौ शिल्पा करमरकर, डीवायसीईओ आणि उपजिल्हाधिकारी','९९२२४२३१२२'),(31,30,4,'Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','9922423122','lnepmrda@gmail.com','A','सौ शिल्पा करमरकर, डीवायसीईओ आणि उपजिल्हाधिकारी','९९२२४२३१२२'),(32,30,5,'Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','9922423122	','lnepmrda@gmail.com','A','Mrs. Shilpa Karmarkar, DYCEO & Deputy Collector','९९२२४२३१२२'),(33,31,1,'Mrs. Bhagyshree Dhavalsankh','25933333','planning.dept@pmrda.gov.in','A','श्रीमती भाग्यश्री ढवळसांख','२५९३३३३३'),(34,31,2,'Mrs. Poonam Nikumbh','25933333','planning.dept@pmrda.gov.in','A','श्रीमती पूनम निकुंभ','२५९३३३३३'),(35,31,3,'Mrs. Poonam Nikumbh','25933333','planning.dept@pmrda.gov.in','A','श्रीमती पूनम निकुंभ','२५९३३३३३'),(36,31,4,'Mrs. Poonam Nikumbh','25933333','planning.dept@pmrda.gov.in','A','श्रीमती पूनम निकुंभ','२५९३३३३३'),(37,31,5,'Mrs. Poonam Nikumbh','25933333','planning.dept@pmrda.gov.in','A','श्रीमती पूनम निकुंभ','२५९३३३३३'),(38,32,1,'Shri. Krupal Singh Gaherwar (Deputy Planner)','9881872895','gaherwar.krupal80@gmail.com','A','श्री. कृपालसिंग गेहेरवार (उप नियोजक)','९८८१८७२८९५'),(39,32,2,'Shri. Krupal Singh Gaherwar (Deputy Planner)','9881872895','gaherwar.krupal80@gmail.com','A','श्री. कृपालसिंग गेहेरवार (उप नियोजक)','९८८१८७२८९५'),(40,32,3,'Shri. Krupal Singh Gaherwar (Deputy Planner)','9881872895','gaherwar.krupal80@gmail.com','A','श्री. कृपालसिंग गेहेरवार (उप नियोजक)','९८८१८७२८९५'),(41,32,4,'Shri. Krupal Singh Gaherwar (Deputy Planner)','9881872895	','gaherwar.krupal80@gmail.com','A','Shri. Krupal Singh Gaherwar (Deputy Planner)','९८८१८७२८९५'),(42,32,5,'Shri. Krupal Singh Gaherwar (Deputy Planner)','9881872895','gaherwar.krupal80@gmail.com','A','श्री. कृपालसिंग गेहेरवार (उप नियोजक)','९८८१८७२८९५'),(43,33,1,'Mrs. Geeta Dalavi','9921048557','illegalconstructions.pmrda@gmail.com','A','श्रीमती गीता दळवी','९९२१०४८५५७'),(44,33,2,'Mr. Gadre','27659855','illegalconstructions.pmrda@gmail.com','A','श्री गद्रे','२७६५९८५५'),(45,33,3,'Mr. Gadre','27659855','illegalconstructions.pmrda@gmail.com','A','श्री गद्रे','२७६५९८५५'),(46,33,4,'Mr. Bhanudas Shinde','27659855','illegalconstructions.pmrda@gmail.com','A','श्री भानुदास शिंदे','२७६५९८५५'),(47,33,5,'Mr. Bhanudas Shinde','27659855','illegalconstructions.pmrda@gmail.com','A','श्री भानुदास शिंदे','२७६५९८५५'),(48,34,1,'Mr. Sujit Manohar Patil','8983213101','fireofficer.pmrda@gmail.com','A','श्री सुजित मनोहर पाटील','८९८३२१३१०१'),(49,34,2,'Mr. Sujit Manohar Patil','8983213101','fireofficer.pmrda@gmail.com','A','श्री सुजित मनोहर पाटील','८९८३२१३१०१'),(50,34,3,'Mr. Sujit Manohar Patil','8983213101','fireofficer.pmrda@gmail.com','A','श्री सुजित मनोहर पाटील','८९८३२१३१०१'),(51,34,4,'Mr. Sujit Manohar Patil','8983213101','fireofficer.pmrda@gmail.com','A','श्री सुजित मनोहर पाटील','८९८३२१३१०१'),(52,34,5,'Mr. Sujit Manohar Patil','8983213101','fireofficer.pmrda@gmail.com','A','श्री सुजित मनोहर पाटील','८९८३२१३१०१');
/*!40000 ALTER TABLE `tbl_department_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department_office`
--

DROP TABLE IF EXISTS `tbl_department_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_department_office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `name_h` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department_office`
--

LOCK TABLES `tbl_department_office` WRITE;
/*!40000 ALTER TABLE `tbl_department_office` DISABLE KEYS */;
INSERT INTO `tbl_department_office` VALUES (1,'Nodal Officer','A','नोडल अधिकारी'),(2,'Aaple Sarkar','A','आपले सरकार'),(3,'Central Public Grievance Redress and Monitoring System (CPGRAM)','A','केंद्रीय सार्वजनिक तक्रार निवारण व देखरेख प्रणाली (सीपीजीआरएएम)'),(4,'Right to Information (RTI)','A','माहितीचा अधिकार (आरटीआय)'),(5,'Right to Service (RTS)','A','सेवा हक्क (आरटीएस)');
/*!40000 ALTER TABLE `tbl_department_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_designation`
--

DROP TABLE IF EXISTS `tbl_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_designation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_BY` int(10) DEFAULT '0',
  `CREATED_ON` date DEFAULT NULL,
  `MODIFIED_BY` int(10) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `state` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `designation_h` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_designation`
--

LOCK TABLES `tbl_designation` WRITE;
/*!40000 ALTER TABLE `tbl_designation` DISABLE KEYS */;
INSERT INTO `tbl_designation` VALUES (9,'Commissioner','Commissioner',16,'2018-08-22',16,'2018-08-24','A',0,'आयुक्त'),(10,'Addl./Joint Commissioner','Addl./Joint Commissioner',16,'2018-08-22',0,NULL,'A',0,'अपर / संयुक्त आयुक्त'),(11,'Dy. Commissioner','Dy. Commissioner',16,'2018-08-22',0,NULL,'A',0,'उप आयुक्त'),(12,'Assistant Commissioners','Assistant Commissioners',16,'2018-08-22',0,NULL,'A',4,'सहायक आयुक्त'),(13,'Superintendents','Superintendents',16,'2018-08-22',0,NULL,'A',5,'अधीक्षक'),(14,'Inspectors','Inspectors',16,'2018-08-22',0,NULL,'A',6,'निरीक्षक');
/*!40000 ALTER TABLE `tbl_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_enquiry`
--

DROP TABLE IF EXISTS `tbl_enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_enquiry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `subject` longtext,
  `description` longtext,
  `created_date` varchar(45) DEFAULT NULL,
  `replay_by` int(11) DEFAULT NULL,
  `replay_date` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_enquiry`
--

LOCK TABLES `tbl_enquiry` WRITE;
/*!40000 ALTER TABLE `tbl_enquiry` DISABLE KEYS */;
INSERT INTO `tbl_enquiry` VALUES (11,'Ravina','8830641410','ravinassonawane@gmail.com',27,'ok','ok','2020-09-04',0,NULL,'pending','91'),(12,'ravina','8830641410','ravinassonawane@gmail.com',27,'ok','ok','2020-09-04',0,NULL,'pending','91'),(13,'Ravina Sonawane','8830641410','ravinassonawane@gmail.com',27,'PMRDA ','pmrda','2020-09-10',0,NULL,'pending','91'),(14,'Gaurang V Bhadage ','8446895057','bhadage_gaurang@yahoo.in',NULL,'Current openings','Res. sir, I need information related to current openings in PMRDA. In careers tab showing 5 number of vacancies but description is not available. Please provide me recruitment / vacancy details. Thanking you ','2021-01-22',0,NULL,'pending','91');
/*!40000 ALTER TABLE `tbl_enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_galarycategory`
--

DROP TABLE IF EXISTS `tbl_galarycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_galarycategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `galary_cate_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_BY` int(20) DEFAULT '0',
  `CREATED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) COLLATE utf8_bin DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `type` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `FinancialYear` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galarycategory`
--

LOCK TABLES `tbl_galarycategory` WRITE;
/*!40000 ALTER TABLE `tbl_galarycategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_galarycategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leadership_coreteam`
--

DROP TABLE IF EXISTS `tbl_leadership_coreteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_leadership_coreteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `position` varchar(1000) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `description` longtext,
  `created_by` int(11) DEFAULT NULL,
  `craeted_date` varchar(45) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `updated_date` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `initial` varchar(45) DEFAULT NULL,
  `initial_h` varchar(45) DEFAULT NULL,
  `name_h` varchar(1000) DEFAULT NULL,
  `position_h` varchar(1000) DEFAULT NULL,
  `description_h` longtext,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_leadership_coreteam`
--

LOCK TABLES `tbl_leadership_coreteam` WRITE;
/*!40000 ALTER TABLE `tbl_leadership_coreteam` DISABLE KEYS */;
INSERT INTO `tbl_leadership_coreteam` VALUES (1,'Shri. Uddhav Thackeray','Hon. Chief Minister, Maharashtra &amp; Chairman',NULL,'Hon\'ble Chief Minister, Government of Maharashtra is Chairman of the Authority, which is the highest policy making body of PMRDA.<br>\r\nThe world is getting highly urbanized with an unprecedented rate of growth in urbanization. The continents of Asia and Africa are going to witness maximum growth in urban agglomerations during next 3 to 4 decades. In tune with this global phenomenon, Maharashtra, the State with the highest level of industrialization in India is also registering rapid urbanization.<br>\r\nWith a view to facilitate orderly development in the State and to make it a power-house of employment and wealth generation, I have given very high priority to channelize urbanization on right trajectory by harnessing natural potentials of the entire State. As a part of this larger picture, we have created a Metropolitan Authority for Pune Region to develop it as one of the main growth centre that we are developing all across Maharashtra.<br>\r\nWith such centres, I am confident that, Maharashtra could lead the next spurt of economic activity and make Indian presence felt in the international arena.',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'Shri. Uddhav Thackeray','Hon. Chief Minister, Maharashtra &amp; Chairman','Hon\'ble Chief Minister, Government of Maharashtra is Chairman of the Authority, which is the highest policy making body of PMRDA.<br>\r\nThe world is getting highly urbanized with an unprecedented rate of growth in urbanization. The continents of Asia and Africa are going to witness maximum growth in urban agglomerations during next 3 to 4 decades. In tune with this global phenomenon, Maharashtra, the State with the highest level of industrialization in India is also registering rapid urbanization.<br>\r\nWith a view to facilitate orderly development in the State and to make it a power-house of employment and wealth generation, I have given very high priority to channelize urbanization on right trajectory by harnessing natural potentials of the entire State. As a part of this larger picture, we have created a Metropolitan Authority for Pune Region to develop it as one of the main growth centre that we are developing all across Maharashtra.<br>\r\nWith such centres, I am confident that, Maharashtra could lead the next spurt of economic activity and make Indian presence felt in the international arena.','LEADER'),(2,'Shri. Ajit Pawar','Guardian Minister of Pune',NULL,'Pune is one of the important and rapidly growing cities in the country, and hence, its planned development is required. Many people come to Pune for the purpose of employment and the State Government has set up PMRDA to pursue the city&amp;rsquo;s planned development. PMRDA shall certainly provide an enabling platform to their aspirations and make Pune a premium international investment destination.<br>',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'Shri. Ajit Pawar','Guardian Minister of Pune','Pune is one of the important and rapidly growing cities in the country, and hence, its planned development is required. Many people come to Pune for the purpose of employment and the State Government has set up PMRDA to pursue the city&amp;rsquo;s planned development. PMRDA shall certainly provide an enabling platform to their aspirations and make Pune a premium international investment destination.<br>','LEADER'),(3,'Shri. Suhas Diwase (I.A.S)','Hon. Metropolitan Commissioner',NULL,'Metropolitan Commissioner is an appointee by the Government of Maharashtra. He heads the office of PMRDA <br> which consists of the functional Divisions namely Engineering, Building Permission, Planning, Illegal Construction (Prevention), Lands &amp;amp; Estate, Accounts &amp;amp; Finance, Administration, Centre for Excellence, Private &amp;amp; Foreign Direct Investment, Fire.<br>\r\nPune is the cultural capital of Maharashtra. It has contributed immensely in the Indian freedom struggle as well as in the rejuvenation of traditions. It is home to some of the country&amp;rsquo;s best educational institutions and is aptly called the &amp;ldquo;Oxford of the East&amp;rdquo;. In the last few decades, the automobile industry and the Information Technology Industry have provided immense employment opportunities. For young Indians, Pune is the most popular destination to work and live. For retired and age-olds, it is the most pleasant and peaceful station in the sun-set phase of their lives. Really, Pune offers something to everybody, and this is embodied in the Marathi phrase &amp;ldquo;???? ???? ??? ???&amp;rdquo;.<br>\r\nPune Metropolitan Region (PMR) is spread over an area of more than 7300 Sq. Kms, which is the third largest Metro region in the country after National Capital Region (NCR) and Bengaluru &amp;ndash; Mysuru Metro Corridor. Therefore, it is essential to manage the urban growth and provide for major infrastructure and civic amenities. For this purpose, the State Government of Maharashtra has established the Pune Metropolitan Region Development Authority (PMRDA) in March, 2015.<br>\r\nThe PMRDA team is committed to bridge the infrastructure gaps as well as to prepare the Development Plan for the next 40 to 50 years. At the same time, the proposed Pune Ring Road Project as well as the Metro Project would help ease out the traffic and the transportation network in the region. PMRDA is making an endeavour to work in co-ordination with Pune Municipal Corporation, Pimpri-Chinchwad Municipal Corporation and Urban Local Bodies for infrastructure development. The views and opinions of industry associations, business forums, citizen groups and academicians are always welcome as it helps to make policy and projects more realistic. Let us work together to make the Pune Metro Region the &amp;lsquo;Most Liveable&amp;rsquo; city in India.',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'Shri. Suhas Diwase (I.A.S)','Hon. Metropolitan Commissioner','Metropolitan Commissioner is an appointee by the Government of Maharashtra. He heads the office of PMRDA <br> which consists of the functional Divisions namely Engineering, Building Permission, Planning, Illegal Construction (Prevention), Lands &amp;amp; Estate, Accounts &amp;amp; Finance, Administration, Centre for Excellence, Private &amp;amp; Foreign Direct Investment, Fire.<br>\r\nPune is the cultural capital of Maharashtra. It has contributed immensely in the Indian freedom struggle as well as in the rejuvenation of traditions. It is home to some of the country&amp;rsquo;s best educational institutions and is aptly called the &amp;ldquo;Oxford of the East&amp;rdquo;. In the last few decades, the automobile industry and the Information Technology Industry have provided immense employment opportunities. For young Indians, Pune is the most popular destination to work and live. For retired and age-olds, it is the most pleasant and peaceful station in the sun-set phase of their lives. Really, Pune offers something to everybody, and this is embodied in the Marathi phrase &amp;ldquo;???? ???? ??? ???&amp;rdquo;.<br>\r\nPune Metropolitan Region (PMR) is spread over an area of more than 7300 Sq. Kms, which is the third largest Metro region in the country after National Capital Region (NCR) and Bengaluru &amp;ndash; Mysuru Metro Corridor. Therefore, it is essential to manage the urban growth and provide for major infrastructure and civic amenities. For this purpose, the State Government of Maharashtra has established the Pune Metropolitan Region Development Authority (PMRDA) in March, 2015.<br>\r\nThe PMRDA team is committed to bridge the infrastructure gaps as well as to prepare the Development Plan for the next 40 to 50 years. At the same time, the proposed Pune Ring Road Project as well as the Metro Project would help ease out the traffic and the transportation network in the region. PMRDA is making an endeavour to work in co-ordination with Pune Municipal Corporation, Pimpri-Chinchwad Municipal Corporation and Urban Local Bodies for infrastructure development. The views and opinions of industry associations, business forums, citizen groups and academicians are always welcome as it helps to make policy and projects more realistic. Let us work together to make the Pune Metro Region the &amp;lsquo;Most Liveable&amp;rsquo; city in India.','LEADER'),(4,'Smt. Kavita Dwivedi','Additional Commissioner &amp; Additional CEO',27,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'???????. ????? ????????','???????? ?????? ??? ???????? ????? ????????? ???????','NA','CORE TEAM'),(5,'Shri. Shrihari Khurd','Chief Accounts &amp; Finance Officer',28,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ??????? ?????','????? ???? ? ????? ???????','NA','CORE TEAM'),(6,'Shri. Vivek Kharwadkar','Chief Engineer',29,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ????? ??????','????? ???????','NA','CORE TEAM'),(7,'Shri. Abhiraj Girkar','Joint Director, Town Planning &amp; Metropolitan Planner ',31,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ?????? ?????','????????, ??????? ? ?????? ??????','NA','CORE TEAM'),(8,'Shri. Nilesh Ashtekar','Superintendent of Police ',33,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ????? ???????','????? ???????','NA','CORE TEAM'),(9,'Shri. Vivek Kharwadkar','Metropolitan Planner',32,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ????? ??????','?????? ??????','NA','CORE TEAM'),(10,'Shri. Devendra Potphode','Chief Fire Officer',34,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ???????? ???????','????? ???????? ???????','NA','CORE TEAM'),(11,'Shri. Pravinkumar Devre','Additional Commissioner',30,'NA',36,'2020-08-14',36,'2021-01-22','A',NULL,NULL,'????. ??????????? ?????','???????? ??????','NA','CORE TEAM');
/*!40000 ALTER TABLE `tbl_leadership_coreteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_metadata`
--

DROP TABLE IF EXISTS `tbl_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `publish_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_metadata`
--

LOCK TABLES `tbl_metadata` WRITE;
/*!40000 ALTER TABLE `tbl_metadata` DISABLE KEYS */;
INSERT INTO `tbl_metadata` VALUES (7,'metadata aa','metadata metadata metadata ','metadata ','metadatametadata.com ','D',NULL),(8,'VIP room','VIP room','VIP room','VIP room','D',NULL),(9,'VIP room','VIP room','VIP room','VIP room','D',NULL),(10,'VIP room','c','c','c','D',NULL);
/*!40000 ALTER TABLE `tbl_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_news`
--

DROP TABLE IF EXISTS `tbl_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_news` (
  `NewsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` text CHARACTER SET utf8mb4,
  `Subtitle` text CHARACTER SET utf8mb4,
  `Description` longtext CHARACTER SET utf8mb4,
  `PublishDate` date DEFAULT NULL,
  `Tags` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Attachment_id` int(20) DEFAULT NULL,
  `CREATED_BY` int(20) DEFAULT '0',
  `CREATED_ON` date DEFAULT NULL,
  `MODIFIED_BY` int(20) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `Approved` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4,
  `NewsPaper` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ApprovedDate` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ApprovalBy` varchar(45) DEFAULT NULL,
  `title_h` longtext CHARACTER SET utf8mb4,
  `FinancialYear` bigint(20) DEFAULT NULL,
  `newspaper_h` longtext,
  `url` varchar(500) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description_h` longtext,
  `delete_approval_status` varchar(45) DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) DEFAULT NULL,
  `delete_approval_comment` varchar(1000) DEFAULT NULL,
  `PublishDate_h` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NewsID`),
  KEY `FK_FINANTIAL_ID_idx` (`FinancialYear`),
  CONSTRAINT `FK_FINANTIAL_ID` FOREIGN KEY (`FinancialYear`) REFERENCES `financial_year` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_news`
--

LOCK TABLES `tbl_news` WRITE;
/*!40000 ALTER TABLE `tbl_news` DISABLE KEYS */;
INSERT INTO `tbl_news` VALUES (102,'Bhoomi Pujan of various development works of PMRDA',' Bhoomi Pujan of various development works of PMRDA',' Bhoomi Pujan of various development works of PMRDA','2019-06-04',NULL,NULL,36,'2020-06-26',NULL,NULL,'Approved',NULL,'D','Approved','Lokmat','2020-07-30 19-06-53','admin','पीएमआरडीएच्या विविध विकासकामांचे भूमिपूजन',3,'लोकमत',NULL,NULL,NULL,'Active',36,'2020-08-26','',NULL),(104,'Demolition of Pune University & E-Square Flyover and Traffic Diversion planning','Demolition of Pune University & E-Square Flyover and Traffic Diversion planning','Demolition of Pune University & E-Square Flyover and Traffic Diversion planning','2020-06-16',NULL,NULL,36,'2020-07-30',NULL,NULL,'Approved',NULL,'A','Approved','NA','2020-09-15 16-18-06','Akshay Khatu','पुणे विद्यापीठ आणि ई-स्क्वेअर फ्लायओव्हर आणि ट्रॅफिक डायव्हर्शन नियोजन पाडणे',3,'NA',NULL,NULL,'','Active',0,NULL,NULL,'१६-०६-२०२०'),(105,'PMRDA approves 29,000 houses','PMRDA approves 29,000 houses','PMRDA approves 29,000 houses','2018-08-10',NULL,NULL,36,'2020-07-30',NULL,NULL,'Approved',NULL,'A','Approved','lokmat','2020-09-15 16-18-06','Akshay Khatu','पीएमआरडीएच्या २९ हजार घरांना मंजुरी',3,'lokamt',NULL,NULL,'','Active',0,NULL,NULL,'१०-०८-२०१८'),(106,'VIP room newss',NULL,'zcx','2020-07-02',NULL,NULL,36,'2020-08-06',NULL,NULL,'Approved',NULL,'D','abc',NULL,'2020-08-06 15-49-45','admin','abc',3,NULL,'pmrda_news','NEWS','zc','Active',0,NULL,NULL,NULL),(107,'VIP room',NULL,'njlkkkl','2020-07-02',NULL,NULL,36,'2020-08-06',NULL,NULL,'Approved',NULL,'D','',NULL,'2020-08-06 15-49-45','admin','abc',3,NULL,'pmrda_news','NEWS','cdv','Active',0,NULL,NULL,NULL),(108,'todays news',NULL,'asdfghjkl','2020-08-13',NULL,NULL,36,'2020-08-11',NULL,NULL,'Approved',NULL,'D','',NULL,'2020-08-11 20-06-31','admin','todays news',3,NULL,'pmrda_news','NEWS','asdfghjkl','Deactivate',36,'2020-08-13','',NULL),(109,'construction in pune ',NULL,'Building material is material used for construction','2020-09-01',NULL,NULL,36,'2020-08-27',NULL,NULL,'Approved',NULL,'A','yes',NULL,'2020-09-15 16-18-06','Akshay Khatu',' पुण्यात बांधकाम',3,NULL,'pmrda_news','NEWS','बांधकाम साहित्याचा वापर बांधकामांसाठी वापरली जाणारी सामग्री आहे','Active',0,NULL,NULL,'०१-०९-२०२०'),(110,'University Flyover Traffic Congestion Report	',NULL,'','2020-02-20',NULL,NULL,36,'2020-09-03',NULL,NULL,'Approved',NULL,'A','Approved',NULL,'2020-09-17 11-38-46','Akshay Khatu','विद्यापीठ उड्डाणपूल वाहतूक कोंडी अहवाल',3,NULL,'pmrda_news','NEWS','','Active',0,NULL,NULL,'२०-०२-२०२०');
/*!40000 ALTER TABLE `tbl_news` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_news_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_news` FOR EACH ROW BEGIN
IF (NEW.Approved like 'Approved') THEN
delete from entry_log where table_name ='tbl_news';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Table structure for table `tbl_notices`
--

DROP TABLE IF EXISTS `tbl_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4,
  `description` text CHARACTER SET utf8mb4,
  `date` date DEFAULT NULL,
  `type` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `department_ID` bigint(20) DEFAULT '0',
  `tags` text CHARACTER SET utf8,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_BY` varchar(45) CHARACTER SET utf8 DEFAULT '0',
  `CREATED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) CHARACTER SET utf8 DEFAULT '0',
  `MODIFIED_ON` datetime DEFAULT NULL,
  `attachment_ID` bigint(20) DEFAULT '0',
  `publishStatus` varchar(65) CHARACTER SET utf8 DEFAULT NULL,
  `ApprovalBy` varchar(45) CHARACTER SET utf8 DEFAULT '0',
  `Comments` text CHARACTER SET utf8,
  `ApprovedDate` datetime DEFAULT NULL,
  `FinancialYear` bigint(20) DEFAULT NULL,
  `STATE` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `DesignationId` bigint(20) unsigned DEFAULT NULL,
  `title_h` longtext CHARACTER SET utf8mb4,
  `url` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `closing_date` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `delete_approval_status` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `delete_approval_comment` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `description_h` longtext COLLATE utf8_bin,
  `date_h` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `subtype` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `subtype_h` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `application_received` int(11) DEFAULT '0',
  `application_disposed` int(11) DEFAULT '0',
  `application_pending` int(11) DEFAULT '0',
  `application_received_h` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `application_disposed_h` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `application_pending_h` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_NOTICE_DEPT` (`department_ID`),
  KEY `FK_FINANCIAL_YEAR_idx` (`FinancialYear`),
  KEY `FK_DESIGNATION_idx` (`DesignationId`),
  CONSTRAINT `FK_DESIGNATION` FOREIGN KEY (`DesignationId`) REFERENCES `tbl_designation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FINANCIAL_YEAR` FOREIGN KEY (`FinancialYear`) REFERENCES `financial_year` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notices`
--

LOCK TABLES `tbl_notices` WRITE;
/*!40000 ALTER TABLE `tbl_notices` DISABLE KEYS */;
INSERT INTO `tbl_notices` VALUES (251,'Section 4 (1) of the Right to Information Act, 2005','NA','2020-07-10','RTI',29,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:28:23',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१)','pmrda_rti',NULL,'Active',0,NULL,NULL,'','१०-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(252,'Section 4 (1) of the Right to Information Act, 2005','NA','2020-07-16','RTI',32,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:28:03',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१)','pmrda_rti',NULL,'Active',0,NULL,NULL,'','१६-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(253,'Section 4 (1) of the Right to Information Act, 2005','NA','2020-07-18','RTI',27,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:27:46',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१)','pmrda_rti',NULL,'Active',0,NULL,NULL,'','१८-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(254,'Section 4 (1) of the Right to Information Act, 2005','NA','2020-07-19','RTI',31,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','','2020-10-23 12:05:08',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१)','pmrda_rti',NULL,'Active',0,NULL,NULL,'','१९-०७-२०२०',NULL,NULL,100,80,20,'१००','८०','२०'),(255,'Section 4 (1) of the Right to Information Act, 2005','NA','2020-07-20','RTI',34,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:27:08',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१)','pmrda_rti',NULL,'Active',0,NULL,NULL,'','२०-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(256,'Section 4 (1) of the Right to Information Act, 2005 Engineering Department No.2','NA','2020-07-21','RTI',34,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:26:03',3,'A',NULL,'माहिती अधिकार अधिनियम, २००५ कलम ४ (१) अभियांत्रिकी विभाग क्र.२','pmrda_rti',NULL,'Active',0,NULL,NULL,'','२१-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(257,' To request information under RTI, contact the concerned officers of Pune Metropolitan Region Development Authority','NA','2020-07-25','RTI',26,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:29:18',3,'A',NULL,'RTI अंतर्गत माहिती मागविण्यासाठी पुणे महानगर प्रदेश विकास प्राधिकरण कार्यालयातील विभागनिहाय संबधित अधिकाऱ्यांशी संपर्क साधावा','pmrda_rti',NULL,'Active',0,NULL,NULL,'','२५-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(258,'RTI Act 2005	','NA','2020-07-26','RTI',26,NULL,'NOTICE','36','2020-07-06','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:26:36',3,'A',NULL,'RTI Act 2005','pmrda_rti',NULL,'Active',0,NULL,NULL,'','२६-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(259,'DPDC Act 1998','a','1998-08-18','STATE GOV GR',31,NULL,'NOTICE','36','2020-07-20','0',NULL,0,'Approved','admin','','2020-07-20 15:24:18',3,'D',NULL,'DPDC Act 1998','central_gov','13-02-2021','Active',0,NULL,NULL,NULL,NULL,'Acts','कायदे',0,0,0,NULL,NULL,NULL),(260,'DPDC Act 1998','','1998-07-01','STATE GOV GR',31,NULL,'NOTICE','36','2020-07-20','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:30:33',3,'A',NULL,'डीपीडीसी कायदा 1998','state_gov',NULL,'Active',0,NULL,NULL,'','१९९८','Acts','कायदे',0,0,0,NULL,NULL,NULL),(261,'Standardized Development Control and Promotion Regulations for Regional plans in Maharashtra','','2013-07-01','STATE GOV GR',31,NULL,'NOTICE','36','2020-07-20','0',NULL,0,'Approved','Akshay Khatu','','2020-10-23 12:02:44',3,'A',NULL,'महाराष्ट्रातील प्रादेशिक योजनांसाठी प्रमाणित विकास नियंत्रण व प्रोत्साहन नियमन','state_gov',NULL,'Active',0,NULL,NULL,'','२०१३','Rules','नियम',0,0,0,NULL,NULL,NULL),(262,'Maharashtra Regional and Town Planning Act, 1966','','2015-11-26','STATE GOV GR',31,NULL,'NOTICE','36','2020-07-20','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:25:48',3,'A',NULL,'महाराष्ट्र प्रादेशिक व नगररचना कायदा, 1966','state_gov',NULL,'Active',0,NULL,NULL,'','२०१५','Acts','कायदे',0,0,0,NULL,NULL,NULL),(263,'Development Control and Promotion Regulations for PMRDA(DCRP-2018)','','2018-07-01','STATE GOV GR',31,NULL,'NOTICE','36','2020-07-20','0',NULL,0,'Approved','Akshay Khatu','','2020-10-23 12:13:04',3,'A',NULL,'पीएमआरडीए (डीसीआरपी -2018) साठी विकास नियंत्रण आणि जाहिरात नियमन','state_gov',NULL,'Active',0,NULL,NULL,'','२०१८','Rules','नियम',0,0,0,NULL,NULL,NULL),(264,'Hinjawadi - Shivajinagar Metro Line-3, Private Land Requirement - PCMC area','','2020-07-03','CIRCULERS',29,NULL,'NOTICE','36','2020-07-31','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:25:05',3,'A',NULL,'हिंजवडी - शिवाजीनगर मेट्रो लाईन -3, खाजगी जमीन आवश्यकता- पीसीएमसी क्षेत्र','pmrda_circulars',NULL,'Active',0,NULL,NULL,'','०३-०७-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(265,'Hinjawadi - Shivajinagar Metro Line-3, Private Land Requirement - PCMC area.','Notice for Public','2020-07-03','CIRCULERS',29,NULL,'NOTICE','36','2020-07-31','0',NULL,0,'Approved','admin','','2020-07-31 14:34:44',3,'D',NULL,'हिंजवडी - शिवाजीनगर मेट्रो लाईन -3, खाजगी जमीन आवश्यकता- पीसीएमसी क्षेत्र.','pmrda_circulars','','Active',0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL),(266,'Regarding blocking the entry of citizens to the Aundh and Akurdi offices of the Authority in connection with preventive measures to prevent the spread of Corona virus.','Covid 19','2020-03-17','CIRCULERS',27,NULL,'NOTICE','36','2020-07-31','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:24:50',3,'A',NULL,'कोरोना विषाणू चा प्रादुर्भाव रोखण्यासाठी प्रतिबंधात्मक उपाययोजना करणेचे अनुषंगाने प्राधिकरणाच्या औंध व आकुर्डी कार्यालयात नागरिकांना प्रवेश बंद करणेबाबत.','pmrda_circulars',NULL,'Active',0,NULL,NULL,'','१७-०३-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(267,'Lockdown Guidelines issued by  GoM ','','2020-07-01','CENTRAL GOV GR',26,NULL,'NOTICE','36','2020-07-31','0',NULL,0,'Approved','Akshay Khatu','Approved','2020-09-15 16:24:36',3,'A',NULL,'लॉकडाउन मार्गदर्शकतत्त्वे','central_gov',NULL,'Active',0,NULL,NULL,'','२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(273,'Art gallery rent  ','Art gallery rent  ','2020-10-01','STATE GOV GR',26,NULL,'NOTICE','36','2020-09-10','0',NULL,0,'Approved','admin','','2020-09-10 17:05:02',3,'D',NULL,'Art gallery rent  ','state_gov',NULL,'Deactivate',36,'2020-09-10','','Art gallery rent  ','२०२०','Acts','कायदे',0,0,0,NULL,NULL,NULL),(274,'Notification under Section 11 (1) of the Right to Fair Compensation and Transparency in Land Acquisition, Rehabilitation and Resettlement Act, 2013 and 2018 as per Maharashtra Act No. 97 (Maharashtra Amendment) Act 2018','','2020-09-23','CIRCULERS',29,NULL,'NOTICE','36','2020-09-16','0',NULL,0,'Approved','Akshay Khatu','','2020-09-17 17:27:09',3,'A',NULL,'भूमिसंपादन, पुनर्वसन व पुनर्वसाहत करताना उचित भरपाई मिळण्याचा आणि पारदर्शकतेचा हक्क अधिनियम, २०१३ व सन २०१८ चा महाराष्ट्र अधिनियम क्रमांक ९७ नुसारच्या ( महाराष्ट्र सुधारणा) अधिनियम २०१८ अन्वये कलम ११(१) खालील अधिसूचना.','pmrda_circulars',NULL,'Active',0,NULL,NULL,'','२३-०९-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(275,'ssss','ss','2020-09-16','CIRCULERS',31,NULL,'NOTICE','36','2020-09-18','0',NULL,0,'Approved','Akshay Khatu','','2020-09-18 12:55:00',3,'D',NULL,'एस','pmrda_circulars',NULL,'Deactivate',36,'2020-09-18','','एस','१६-०९-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(276,'Test','testing<script>alert(1)</script>','2020-09-10','PRESS NOTES',26,NULL,'NOTICE','36','2020-09-21','0',NULL,0,'Pending',NULL,NULL,NULL,3,'D',NULL,'चाचणी','press_notes',NULL,'Active',0,NULL,NULL,'चाचणी','१०-०९-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL),(277,'Testing','test123','2020-06-09','POLICIES',27,NULL,'NOTICE','36','2020-09-21','0',NULL,0,'Approved','Akshay Khatu','app','2021-01-08 12:24:11',3,'D',NULL,'चाचणी','pmrda_rti',NULL,'Deactivate',36,'2021-01-18','Deactive','चाचणी 123','०९-०६-२०२०',NULL,NULL,0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_notices` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_notices_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_notices` FOR EACH ROW BEGIN
IF (NEW.type like 'CIRCULERS')
THEN
IF (NEW.type not  like 'HISTORY OF POSTING')
THEN
IF (NEW.publishStatus like 'Approved') THEN
delete from entry_log where table_name ='tbl_notices';
END IF;
END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_general_ci ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_notices_AFTER_UPDATE` AFTER UPDATE ON `tbl_notices` FOR EACH ROW BEGIN
DECLARE table_name varchar(45);
IF (NEW.type like 'CIRCULERS')
THEN
IF (new.type not  like 'HISTORY OF POSTING')
THEN
IF (NEW.publishStatus like 'Approved')
THEN
SET table_name = 'tbl_notices';
INSERT INTO  entry_log (title_id,title,Attachment_id,Type,table_name,MODIFIED_ON,title_h,status) values(NEW.id,NEW.title,NEW.attachment_ID,NEW.type,table_name,NOW(),NEW.title_h,NEW.STATE);
END IF;
IF (NEW.publishStatus like 'Reject')
THEN
update entry_log set status = 'D' where title_id = old.id;

END IF;
IF (NEW.publishStatus like 'Pending')
THEN
update entry_log set status = 'D' where title_id = old.id;

END IF;
END IF;
END IF;

IF(OLD.STATE <> NEW.STATE)
THEN
update entry_log set status = NEW.STATE where title_id = old.id;
END IF;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Table structure for table `tbl_project`
--

DROP TABLE IF EXISTS `tbl_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8,
  `date` date DEFAULT NULL,
  `specification` longtext CHARACTER SET utf8,
  `projectCordinator` longtext,
  `description` longtext,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `approvedStatus` varchar(45) DEFAULT NULL,
  `approved_by` varchar(45) DEFAULT NULL,
  `approved_on` varchar(45) DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `project_status` longtext,
  `title_h` longtext,
  `specification_h` longtext,
  `projectCordinator_h` longtext,
  `description_h` longtext,
  `project_status_h` longtext,
  `contact` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `scope_of_work` longtext,
  `scope_of_work_h` longtext,
  `delete_approval_status` varchar(45) DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) DEFAULT NULL,
  `delete_approval_comment` varchar(1000) DEFAULT NULL,
  `contact_h` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_project`
--

LOCK TABLES `tbl_project` WRITE;
/*!40000 ALTER TABLE `tbl_project` DISABLE KEYS */;
INSERT INTO `tbl_project` VALUES (45,'Hinjawadi to Shivajinagar Metro','2020-09-22','','Project is in preliminary stage.','During last Financial Year 2017-18, the State Government has approved implementation of this project on Deign, Build, Finance, Operate, Transfer (DBFOT) model with Public Private Partnership (PPP) on 09/02/2018. Government of India has also granted in- principle approval to 20 % Viability Gap Fund (VGF) allocation to this project on 07/03/2018 in the 30th meeting of the Empowered Committee.<br>\r\n Thereafter, series of activities sequentially being implemented for project commissioning as enumerated below in the financial year 2018-19:\r\n <ul><li>The project has been declared as “Vital Important Urban Transport Project” by the Government of Maharashtra on 18/07/2018</li>\r\n <li>On 31/07/2018, 5.6 Hectares of Land available at Survey No. 4/1/1, Balewadi, Pune with Revenue Department was transferred by Government of Maharashtra to PMRDA without any Realization & Revenue taxes on out-right ownership basis</li>\r\n <li>The Metro Project is published upon recommendation by the State Government to the Central Government for Gazette Notification publication on September 18th, 2018 under the\r\n <ul>\r\n <li> The Metro Railways (Construction of Works) Act, 1978, </li>\r\n <li> The Metro Railways (Operation and Maintenance) Act, 2002</li>\r\n <li> The Metro Railways Amendment Act, 2009</li></ul></li>\r\n <li>Letter of Award (LoA) has been issued to TRIL Urban Transport Private Limited and Siemens Project Ventures GmbH (TRIL UTPL+SPVG) on 03/10/2018</li>\r\n <li>Special Purpose Vehicle (SPV) company “Pune IT City Metro Rail Limited” was registered on 14/03/2019 under the Companies Act & Rules 2014</li>\r\n <li>Contribution of State Government’s Viability Gap Fund (VGF) amounts to this project in the form of transfer of Land in possession of Government Polytechnic, Pune, 10 Hectares 60 R, Dairy Development Board, 7 Hectares 14 R, and Pune Gramin Police & Wireless Communication System, 4 Hectares 17 R was approved wide State Government Resolution dated 27/08/2019.</li>\r\n <li>Concession Agreement and Schedules are signed between Special Purpose Vehicle (SPV) company “Pune IT City Metro Rail Limited” and Pune Metropolitan Region Development Authority, Pune on 20/09/2019</li>\r\n <li>Land acquisition for proposed car-depot at village Maan - out of the 13 Hectares 20 R, approximately 7.1 Hectares is already acquired. Process of balance land acquisition is under progress.</li>\r\n <li>Proposals of ROW (Right of Way) Land acquisition for Station, Viaduct, Staircase, Entry-Exit is submitted to the concerned State and Central Government Agencies. This land will be handed over to PMRDA on priority basis.</li>\r\n <li>As per the agreed schedule, the project will be completed by March 2023 through concessionaire \"Pune IT City Metro Rail Limited.\"</li>\r\n </ul>',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-22','3',36,'2020-09-22','',' हिंजवडी ते शिवाजीनगर मेट्रो','','Project is in preliminary stage.','During last Financial Year 2017-18, the State Government has approved implementation of this project on Deign, Build, Finance, Operate, Transfer (DBFOT) model with Public Private Partnership (PPP) on 09/02/2018. Government of India has also granted in- principle approval to 20 % Viability Gap Fund (VGF) allocation to this project on 07/03/2018 in the 30th meeting of the Empowered Committee.<br>\r\n Thereafter, series of activities sequentially being implemented for project commissioning as enumerated below in the financial year 2018-19:\r\n <ul><li>The project has been declared as “Vital Important Urban Transport Project” by the Government of Maharashtra on 18/07/2018</li>\r\n <li>On 31/07/2018, 5.6 Hectares of Land available at Survey No. 4/1/1, Balewadi, Pune with Revenue Department was transferred by Government of Maharashtra to PMRDA without any Realization & Revenue taxes on out-right ownership basis</li>\r\n <li>The Metro Project is published upon recommendation by the State Government to the Central Government for Gazette Notification publication on September 18th, 2018 under the\r\n <ul>\r\n <li> The Metro Railways (Construction of Works) Act, 1978, </li>\r\n <li> The Metro Railways (Operation and Maintenance) Act, 2002</li>\r\n <li> The Metro Railways Amendment Act, 2009</li></ul></li>\r\n <li>Letter of Award (LoA) has been issued to TRIL Urban Transport Private Limited and Siemens Project Ventures GmbH (TRIL UTPL+SPVG) on 03/10/2018</li>\r\n <li>Special Purpose Vehicle (SPV) company “Pune IT City Metro Rail Limited” was registered on 14/03/2019 under the Companies Act & Rules 2014</li>\r\n <li>Contribution of State Government’s Viability Gap Fund (VGF) amounts to this project in the form of transfer of Land in possession of Government Polytechnic, Pune, 10 Hectares 60 R, Dairy Development Board, 7 Hectares 14 R, and Pune Gramin Police & Wireless Communication System, 4 Hectares 17 R was approved wide State Government Resolution dated 27/08/2019.</li>\r\n <li>Concession Agreement and Schedules are signed between Special Purpose Vehicle (SPV) company “Pune IT City Metro Rail Limited” and Pune Metropolitan Region Development Authority, Pune on 20/09/2019</li>\r\n <li>Land acquisition for proposed car-depot at village Maan - out of the 13 Hectares 20 R, approximately 7.1 Hectares is already acquired. Process of balance land acquisition is under progress.</li>\r\n <li>Proposals of ROW (Right of Way) Land acquisition for Station, Viaduct, Staircase, Entry-Exit is submitted to the concerned State and Central Government Agencies. This land will be handed over to PMRDA on priority basis.</li>\r\n <li>As per the agreed schedule, the project will be completed by March 2023 through concessionaire \"Pune IT City Metro Rail Limited.\"</li>\r\n </ul>','','','','','','Active',0,NULL,NULL,''),(46,'Pune Ring Road','2020-10-01','','Project is in preliminary stage','Government of Maharashtra had approved the proposal of Pune Ring Road outside Pune and Pimpri Municipal Corporation in Pune District Regional Plan vide notification Dated 25/11/1997 for width 90 metres. Subsequently, the Government notified via a notification dated 07/09/2013, a new Road Network has been approved in the area around 10 km outside the boundary of Pune, Pimpri - Chinchwad Municipal Corporation.<br>\r\nThe length of the Pune Ring Road project is approximately 128.08 km. The total project cost including land acquisition cost of ₹ 5800 Crore is projected to be ₹ 17,412 Crore based on 2015-16 schedule of rates.<br>\r\n<b>Salient Features of the Pune Ring Road</b>\r\n<ul>\r\n<li>Total Length: 128.08 km</li>\r\n<li>Right of Way: 110.0 metre</li>\r\n<li>Main Carriageway: 4 + 4 lanes</li>\r\n<li>Service Road: 2 + 2 lanes</li>\r\n<li>Railway Over Bridge: 3 Nos.</li>\r\n<li>Flyovers: 6 Nos.</li>\r\n<li>Tunnels: 3.75 km</li>\r\n<li>Major Bridges: 18 Nos.</li>\r\n<li>Minor Bridges: 5 Nos.</li>\r\n<li>Box Culverts: 200 Nos.</li>\r\n<li>Elevated Corridor/Structures: 52 Nos.</li>\r\n</ul>\r\n<p>PMRDA has decided to execute this project in three phases i.e. Nagar Road to Satara Road, Satara Road to Mumba –Pune Express way and Mumbai–Pune Express way to Nagar Road. It is proposed that priority be given to start work from Nagar Road to Satara Road.</p>\r\n',36,'2020-09-02','A','Approved','Akshay Khatu','2020-10-01','3',36,'2020-10-01','For the entire length of Pune Ring Road, the Private and Government Land required is 1408.88 Hectares.<br>\r\nLand acquisition is in progress through Town Planning Scheme, F.S.I. /T.D.R., Direct Purchase, to hand over Government land in lieu of Private Land wherever it is possible.<br>\r\nAdministrative approval of ₹ 17,412 crore was granted to Pune Ring Road. Work Order is given to the consultants on 01/07/2017 to prepare Detailed Project Report (DPR).<br>\r\nThe joint measurement & alignment marking on site is in process.','पुणे रिंग रोड','','Project is in preliminary stage','Government of Maharashtra had approved the proposal of Pune Ring Road outside Pune and Pimpri Municipal Corporation in Pune District Regional Plan vide notification Dated 25/11/1997 for width 90 metres. Subsequently, the Government notified via a notification dated 07/09/2013, a new Road Network has been approved in the area around 10 km outside the boundary of Pune, Pimpri - Chinchwad Municipal Corporation.<br>\r\nThe length of the Pune Ring Road project is approximately 128.08 km. The total project cost including land acquisition cost of ₹ 5800 Crore is projected to be ₹ 17,412 Crore based on 2015-16 schedule of rates.<br>\r\n<b>Salient Features of the Pune Ring Road</b>\r\n<ul>\r\n<li>Total Length: 128.08 km</li>\r\n<li>Right of Way: 110.0 metre</li>\r\n<li>Main Carriageway: 4 + 4 lanes</li>\r\n<li>Service Road: 2 + 2 lanes</li>\r\n<li>Railway Over Bridge: 3 Nos.</li>\r\n<li>Flyovers: 6 Nos.</li>\r\n<li>Tunnels: 3.75 km</li>\r\n<li>Major Bridges: 18 Nos.</li>\r\n<li>Minor Bridges: 5 Nos.</li>\r\n<li>Box Culverts: 200 Nos.</li>\r\n<li>Elevated Corridor/Structures: 52 Nos.</li>\r\n</ul>\r\n<p>PMRDA has decided to execute this project in three phases i.e. Nagar Road to Satara Road, Satara Road to Mumba –Pune Express way and Mumbai–Pune Express way to Nagar Road. It is proposed that priority be given to start work from Nagar Road to Satara Road.</p>\r\n','For the entire length of Pune Ring Road, the Private and Government Land required is 1408.88 Hectares.<br>\r\nLand acquisition is in progress through Town Planning Scheme, F.S.I. /T.D.R., Direct Purchase, to hand over Government land in lieu of Private Land wherever it is possible.<br>\r\nAdministrative approval of ₹ 17,412 crore was granted to Pune Ring Road. Work Order is given to the consultants on 01/07/2017 to prepare Detailed Project Report (DPR).<br>\r\nThe joint measurement & alignment marking on site is in process.','','','The main purpose of the Pune Ring Road is to divert the heavy vehicular traffic thereby reducing the traffic congestion in the city of Pune. Also the suburban area will be developed and will be connected to the main road. Now Government of Maharashtra, via notification dated 14/06/2016 has declared PMRDA as the developing authority for the Ring Road.','The main purpose of the Pune Ring Road is to divert the heavy vehicular traffic thereby reducing the traffic congestion in the city of Pune. Also the suburban area will be developed and will be connected to the main road. Now Government of Maharashtra, via notification dated 14/06/2016 has declared PMRDA as the developing authority for the Ring Road.','Active',0,NULL,NULL,''),(47,'Mahalunge – Maan TP Scheme','2020-09-02','Lowest Bidder (M/s- Larsen & Turbo Limited) Final offer is under acceptance.\r\n','Contract to M/s- Larsen & Turbo Limited (Final offer is under acceptance.)','<ul>\r\n<li> The Pune metropolitan Region Development Authority (PMRDA) has planned to develop the first Town Planning (TP) scheme at Mahalunge – Maan, Taluka – Mulshi.</li>\r\n<li> The Scheme is approved by Maharashtra Regional & Town Planning (MRTP) Ac,t 1966 Clause 60(1) Dated 05/08/2017.</li>\r\n<li> It is published in the Gazette on dates 17-23/08/2017 and in Newspapers Lokmat and the Indian Express dated 09/08/2017.</li>\r\n<li> The Scheme is Administratively Approved by Authority Assembly dated 05/08/2017 vide resolution No. 2 for ₹ 616.90 Crore.</li>\r\n<li>The Scheme consists of following Infrastructure Facilities:<br>\r\nRoads, Culvert/Bridges, Storm Water Drains, Potable Recycled Water Supply with Overhead Tanks, Sewer Network & Treatment Plants, Power & ICT Ducts, Power Supply Distribution Network, Substations, Street Lighting, SCADA & Instrumentation, Information & Communication Trench etc.\r\n</li>\r\n<li> The scheme is spread over an area of 250.26 Hectares in Mahalunge & Maan Villages.</li>\r\n<li>Estimated Population considered for Design & Construction of facilities is 2, 86,562.</li>\r\n<li> Plot area allocated to private owners is around 50.40 % & Average FSI considered is “3’’. </li>\r\n<li> Scheme is technically sanctioned by tender & technical committee on 09/01/2019 for ₹ 502.48 Cr. </li>\r\n</ul>',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','<ul>\r\n<li> EPC tender floated on 15/01/2019.</li>\r\n<li> Tendering process has been completed. Three bidders responded to tender out of which two are qualified as per eligibility criteria and evaluation of Financial Bids has commenced on 26/09/2019. Tender approval & other process is in progress.</li>\r\n<li> Lowest Bidders (M/s- Larsen & Turbo Limited) final offer is under acceptance.</li>\r\n</ul>','म्हाळुंगे - माण उपनगर (टीपी) योजना','Lowest Bidder (M/s- Larsen & Turbo Limited) Final offer is under acceptance.\r\n','Contract to M/s- Larsen & Turbo Limited (Final offer is under acceptance.)','<ul>\r\n<li> The Pune metropolitan Region Development Authority (PMRDA) has planned to develop the first Town Planning (TP) scheme at Mahalunge – Maan, Taluka – Mulshi.</li>\r\n<li> The Scheme is approved by Maharashtra Regional & Town Planning (MRTP) Ac,t 1966 Clause 60(1) Dated 05/08/2017.</li>\r\n<li> It is published in the Gazette on dates 17-23/08/2017 and in Newspapers Lokmat and the Indian Express dated 09/08/2017.</li>\r\n<li> The Scheme is Administratively Approved by Authority Assembly dated 05/08/2017 vide resolution No. 2 for ₹ 616.90 Crore.</li>\r\n<li>The Scheme consists of following Infrastructure Facilities:<br>\r\nRoads, Culvert/Bridges, Storm Water Drains, Potable Recycled Water Supply with Overhead Tanks, Sewer Network & Treatment Plants, Power & ICT Ducts, Power Supply Distribution Network, Substations, Street Lighting, SCADA & Instrumentation, Information & Communication Trench etc.\r\n</li>\r\n<li> The scheme is spread over an area of 250.26 Hectares in Mahalunge & Maan Villages.</li>\r\n<li>Estimated Population considered for Design & Construction of facilities is 2, 86,562.</li>\r\n<li> Plot area allocated to private owners is around 50.40 % & Average FSI considered is “3’’. </li>\r\n<li> Scheme is technically sanctioned by tender & technical committee on 09/01/2019 for ₹ 502.48 Cr. </li>\r\n</ul>','<ul>\r\n<li> EPC tender floated on 15/01/2019.</li>\r\n<li> Tendering process has been completed. Three bidders responded to tender out of which two are qualified as per eligibility criteria and evaluation of Financial Bids has commenced on 26/09/2019. Tender approval & other process is in progress.</li>\r\n<li> Lowest Bidders (M/s- Larsen & Turbo Limited) final offer is under acceptance.</li>\r\n</ul>','','','<ul>\r\n<li>Road Works : 18.820 km (Excluding MIDC, PWD Road) </li>\r\n<li>Minor Box/Culvert:  4 Nos. </li>\r\n<li>Solar PV Panels:  1 Nos. </li>\r\n<li>Tree Plantation:  13,000 Nos. </li>\r\n<li>Water Distribution Network:  36.02 km (Potable Water) </li>\r\n<li>Recycle Water Network:  35.010 km </li>\r\n<li>Elevated Reservoir:  2.67 ML + 1.55 ML (4 Tanks)</li>\r\n<li>Sewer Network Line:  42.39 km </li>\r\n<li>Trench Duct Length (Single):  70.230 km </li>\r\n<li>Storm Water Drainage Line	:  45.5 km </li>\r\n<li>Rain Water Harvesting Points:  100 Nos. </li>\r\n<li>Electrical Substation Total 6 nos. Now proposed 1 No. </li>\r\n<li>Electrical Distribution:  28 km </li>\r\n<li>Smart Street Lighting:  1,648 Nos </li>\r\n</ul>','<ul>\r\n<li>Road Works : 18.820 km (Excluding MIDC, PWD Road) </li>\r\n<li>Minor Box/Culvert:  4 Nos. </li>\r\n<li>Solar PV Panels:  1 Nos. </li>\r\n<li>Tree Plantation:  13,000 Nos. </li>\r\n<li>Water Distribution Network:  36.02 km (Potable Water) </li>\r\n<li>Recycle Water Network:  35.010 km </li>\r\n<li>Elevated Reservoir:  2.67 ML + 1.55 ML (4 Tanks)</li>\r\n<li>Sewer Network Line:  42.39 km </li>\r\n<li>Trench Duct Length (Single):  70.230 km </li>\r\n<li>Storm Water Drainage Line	:  45.5 km </li>\r\n<li>Rain Water Harvesting Points:  100 Nos. </li>\r\n<li>Electrical Substation Total 6 nos. Now proposed 1 No. </li>\r\n<li>Electrical Distribution:  28 km </li>\r\n<li>Smart Street Lighting:  1,648 Nos </li>\r\n</ul>','Active',0,NULL,NULL,NULL),(48,'Indrayani Riverfront','2020-09-02','Indrayani riverfront development P.F.R, report is prepared. WAPCOS contractor is appointed for preparation & getting approval from competent authority P.F.R. is submitted to the state government of Maharashtra for further approval.\r\n','','PMRDA proposes to undertake development works of Indrayani River with reference to pollution to Abolement, Riverfront development, flood migration & navigation system and tourism development.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','Pre-feasibility reports are prepared and submitted to government of Maharashtra for further recommendation to NRDC.\r\n','इंद्रायणी तटाग्र','Indrayani riverfront development P.F.R, report is prepared. WAPCOS contractor is appointed for preparation & getting approval from competent authority P.F.R. is submitted to the state government of Maharashtra for further approval.\r\n','','PMRDA proposes to undertake development works of Indrayani River with reference to pollution to Abolement, Riverfront development, flood migration & navigation system and tourism development.','Pre-feasibility reports are prepared and submitted to government of Maharashtra for further recommendation to NRDC.\r\n','','','Block cost estimate for implementation of development of plan amount to Rs. 1587 crore.\r\n','Block cost estimate for implementation of development of plan amount to Rs. 1587 crore.\r\n','Active',0,NULL,NULL,NULL),(49,'Yerwada Building','2020-09-02','','','The proposed PMRDA Corporate Office Building at Yerwada, Pune is an artfully-tuned structure for efficiency and comfort. This 10-storeyed (25,100 sq. mtrs.) Green Office Building (IGBC – PLATINUM rated) will house operational functions for a rapidly growing organization which has a distinct approach towards sustainable growth of the Pune Metropolitan Region (PMR). The proposed site is well connected to the nearest Airport /Railway Station and major cities through road networks. The Proposed Corporate office building will be accessible by two separate entrances at P01 level (first podium level – entry level).<br>\r\nLower Ground Level and Four Podiums above will cater to Parking requirements for the Office Building and for the citizens visiting the facility. The floor above podium P04 level would have the citizen waiting lobby and other facilities such as Bank, Library, Canteen, Business Centre, Multipurpose Hall, Meeting Hall, Departmental Office areas and other allied facilities. The upper three office floors (L02-L04) would cater to the Office requirement of 15 departments under PMRDA and the top floor (L05) would have office facility for Authority office, Commissioner’s Office & Additional Commissioner’s Office, Board Room and guest room facility.<br>\r\nThe Building harnesses a passive and active energy concept. The building’s orientation maximizes eastern and western daylight, to minimize the western exposure, 1.2 m of green balcony (landscaped balcony) has been proposed towards the western side of the building. The balcony would avoid direct penetration of light and heat into the office areas. Photovoltaic system will further mitigate energy consumption. The result is a healthier environment that downsizes the building’s mechanical system.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','','येरवडा इमारत','','','The proposed PMRDA Corporate Office Building at Yerwada, Pune is an artfully-tuned structure for efficiency and comfort. This 10-storeyed (25,100 sq. mtrs.) Green Office Building (IGBC – PLATINUM rated) will house operational functions for a rapidly growing organization which has a distinct approach towards sustainable growth of the Pune Metropolitan Region (PMR). The proposed site is well connected to the nearest Airport /Railway Station and major cities through road networks. The Proposed Corporate office building will be accessible by two separate entrances at P01 level (first podium level – entry level).<br>\r\nLower Ground Level and Four Podiums above will cater to Parking requirements for the Office Building and for the citizens visiting the facility. The floor above podium P04 level would have the citizen waiting lobby and other facilities such as Bank, Library, Canteen, Business Centre, Multipurpose Hall, Meeting Hall, Departmental Office areas and other allied facilities. The upper three office floors (L02-L04) would cater to the Office requirement of 15 departments under PMRDA and the top floor (L05) would have office facility for Authority office, Commissioner’s Office & Additional Commissioner’s Office, Board Room and guest room facility.<br>\r\nThe Building harnesses a passive and active energy concept. The building’s orientation maximizes eastern and western daylight, to minimize the western exposure, 1.2 m of green balcony (landscaped balcony) has been proposed towards the western side of the building. The balcony would avoid direct penetration of light and heat into the office areas. Photovoltaic system will further mitigate energy consumption. The result is a healthier environment that downsizes the building’s mechanical system.','','','','','','Active',0,NULL,NULL,NULL),(50,'Wagholi Fire Station','2020-09-02','Completed','In house','A Fire Station at Wagholi location is mainly constructed to provide fire and emergency services to people residing in Wagholi that are located at nearby villages or industries.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','The Construction of Wagholi Fire Station has been completed. ','वाघोली अग्निशमन केंद्र','Completed','In house','A Fire Station at Wagholi location is mainly constructed to provide fire and emergency services to people residing in Wagholi that are located at nearby villages or industries.','The Construction of Wagholi Fire Station has been completed. ','','','The scope of this project is to construct a centrally located Fire Station under the Fire Act Guidelines with an aim to prevent fires and safeguard the lives of people and protect the property from fires.','The scope of this project is to construct a centrally located Fire Station under the Fire Act Guidelines with an aim to prevent fires and safeguard the lives of people and protect the property from fires.','Active',0,NULL,NULL,NULL),(51,'Chhatrapati Sambhajiraje International Airport ','2020-09-02','Project is in preliminary stage.\r\n','Project is in preliminary stage.','An SPV is formed for Chhatrapati Sambhajiraje International Airport at Pune (Purandar) Dist. Pune.<br>\r\nA total 2,832 Hectares of Land is notified for Chhatrapati Sambhajiraje International Airport Pune Purandar from the Villages Vanpuri, Kumbharvalan and Udachi Wadi under PMRDA jurisdiction and Ekatpur, Munjawadi, Khanwadi and Pargaon Villages outside PMRDA jurisdiction. For this notified area of 2,832 Hectares. Maharashtra Government has appointed Maharashtra Airport Development Co. Ltd. (MADCL) as Special Planning Authority (SPA) vide Government of Maharashtra, Urban Development Department No. TPS/1818/808/18/UD-13 Dated 13/07/2018. Also, as per Government of Maharashtra, General Administration Department, No.AVN-1008/CR-569/28A Dated 27/02/2019, MADCL has been appointed as Nodal Agency. Presently, Detailed Project Report (DPR) for Airport is in progress by consultant M/s. Dorsh Consultant (India) Pvt. Ltd, appointed by MADCL.<br>\r\nCurrently, the total expenditure for the work of Purandar Airport is expected to be Rs 3,513 Crore, for which the Maharashtra Government has decided to establish a Special Purpose Vehicle (SPV/SPE). In the SPV, Capital will be shared by CIDCO (51%), MADCL (19%) and PMRDA (15%).<br>\r\nAccording to this PMRDA has proposed to invest a Capital of Rs. 526.95 Crore for the development of Pune (Purandar) International Airport. Administrative Approval is sanctioned for the share of PMRDA’s part as approved in Hon’ Authority Meeting No.6 dated 8th March 2019.<br>\r\nOut of total capital share of 600.00 Cr. PMRDA has deposited Rs.7.50 Crore in October 2019. ',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','7.5Crore deposited by PMRDA on 24/10/2019\r\n','छत्रपती संभाजीराजे अंतराष्ट्रीय विमानतळ','Project is in preliminary stage.\r\n','Project is in preliminary stage.','An SPV is formed for Chhatrapati Sambhajiraje International Airport at Pune (Purandar) Dist. Pune.<br>\r\nA total 2,832 Hectares of Land is notified for Chhatrapati Sambhajiraje International Airport Pune Purandar from the Villages Vanpuri, Kumbharvalan and Udachi Wadi under PMRDA jurisdiction and Ekatpur, Munjawadi, Khanwadi and Pargaon Villages outside PMRDA jurisdiction. For this notified area of 2,832 Hectares. Maharashtra Government has appointed Maharashtra Airport Development Co. Ltd. (MADCL) as Special Planning Authority (SPA) vide Government of Maharashtra, Urban Development Department No. TPS/1818/808/18/UD-13 Dated 13/07/2018. Also, as per Government of Maharashtra, General Administration Department, No.AVN-1008/CR-569/28A Dated 27/02/2019, MADCL has been appointed as Nodal Agency. Presently, Detailed Project Report (DPR) for Airport is in progress by consultant M/s. Dorsh Consultant (India) Pvt. Ltd, appointed by MADCL.<br>\r\nCurrently, the total expenditure for the work of Purandar Airport is expected to be Rs 3,513 Crore, for which the Maharashtra Government has decided to establish a Special Purpose Vehicle (SPV/SPE). In the SPV, Capital will be shared by CIDCO (51%), MADCL (19%) and PMRDA (15%).<br>\r\nAccording to this PMRDA has proposed to invest a Capital of Rs. 526.95 Crore for the development of Pune (Purandar) International Airport. Administrative Approval is sanctioned for the share of PMRDA’s part as approved in Hon’ Authority Meeting No.6 dated 8th March 2019.<br>\r\nOut of total capital share of 600.00 Cr. PMRDA has deposited Rs.7.50 Crore in October 2019. ','7.5Crore deposited by PMRDA on 24/10/2019\r\n','','','Financial involvement\r\n','Financial involvement\r\n','Active',0,NULL,NULL,NULL),(52,'Pune Mumbai Hyperloop','2020-09-03','Project is in preliminary stage.\r\n',' Consortium of DP World FZE and Hyperloop Technologies INC','Pune - Mumbai Hyperloop Project is a proposed state-of-the-art transport project connecting two metropolitan cities of Pune and Mumbai with the Hyperloop Technology, reducing the travel time between Pune and Mumbai to approximately 30 minutes. Hyperloop is based on the concept of specially designed passenger pods, travelling rapidly through a partial vacuum environment through sealed tubes. This technology operates on electric propulsion and magnetic levitation. As the project is based on newer technology, to assess the technical and financial feasibility, the project is proposed to be developed by the Swiss Challenge Method in accordance with Maharashtra Infrastructure Development Enabling Authority Act, 2018.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-03','Consortium of DP World FZE and Hyperloop Technologies INC is declared as Original Project Proponent and undertaking according to Maha IDEA, Clause no. 5 (1-A) is submitted to the Maharashtra Infrastructure Development Enabling Authority. Information about availability of land is sought from various authorities.','पुणे मुंबई हायपरलूप','Project is in preliminary stage.\r\n',' Consortium of DP World FZE and Hyperloop Technologies INC','Pune - Mumbai Hyperloop Project is a proposed state-of-the-art transport project connecting two metropolitan cities of Pune and Mumbai with the Hyperloop Technology, reducing the travel time between Pune and Mumbai to approximately 30 minutes. Hyperloop is based on the concept of specially designed passenger pods, travelling rapidly through a partial vacuum environment through sealed tubes. This technology operates on electric propulsion and magnetic levitation. As the project is based on newer technology, to assess the technical and financial feasibility, the project is proposed to be developed by the Swiss Challenge Method in accordance with Maharashtra Infrastructure Development Enabling Authority Act, 2018.','Consortium of DP World FZE and Hyperloop Technologies INC is declared as Original Project Proponent and undertaking according to Maha IDEA, Clause no. 5 (1-A) is submitted to the Maharashtra Infrastructure Development Enabling Authority. Information about availability of land is sought from various authorities.','+1(512)2168037',' Naushad@hyperloop-one.com','<ul>\r\n<li>It is proposed to implement the project for the distance of 117.50 km between Mumbai - Pune (Wakad to Kurla BKC).</li>\r\n<li>There are two phases for implementation. The first phase of the project of 11.80 Km is proposed as a pilot project in the Pune Metropolitan Area. Rest of the project (Wakad to Kurla BKC) will be implemented during the second phase. </li>\r\n<li>The pilot project will be implemented in three years and the rest of the project will be completed in eight years. </li>\r\n<li>Proposed speed of the Hyperloop Project is 496 kmph and the distance from Pune to Mumbai will be covered in half an hour.</li>\r\n<li>Apart from the cost of land acquisition, all the cost of implementing the project will be spent through private participation. The government will bear the cost of land acquisition.</li>\r\n<li>The development and implementation of the project under Maharashtra Infrastructure Development Enabling Authority Act, 2018 is proposed to be undertaken by the Pune Metropolitan Region Development Authority (PMRDA).</li>\r\n<li>Following the recommendation of the competent authority of Maharashtra Infrastructure Development, the Government of Maharashtra has issued the G.R.No. PRD-3318 / CR103 / NV 7, Dated 02/11/2018, Provisional Approval has been given to declare the Pune-Mumbai Hyperloop as \"Infrastructure Project\" and has temporarily declared the consortium of DP World FZE and Hyperloop Technologies INC as the Original Project Proponent.</li>\r\n<li>Subsequently, vide the letter from the Urban Development Department no. PRD-3318 / CR103 / NV 7, Dated 17/09/2019, the consortium of DP World FZE (lead member of the team) and Hyperloop Technologies INC is announced as the Original Project Proponent for the Pune–Mumbai Hyperloop Project. It has also been mentioned in this manifesto that this Declaration will come into force from the day the amended undertaking is submitted, according to Maha IDEA, Clause no. 5(1-A) is submitted to the Maharashtra Infrastructure Development Enabling Authority. </li>\r\n</ul>','<ul>\r\n<li>It is proposed to implement the project for the distance of 117.50 km between Mumbai - Pune (Wakad to Kurla BKC).</li>\r\n<li>There are two phases for implementation. The first phase of the project of 11.80 Km is proposed as a pilot project in the Pune Metropolitan Area. Rest of the project (Wakad to Kurla BKC) will be implemented during the second phase. </li>\r\n<li>The pilot project will be implemented in three years and the rest of the project will be completed in eight years. </li>\r\n<li>Proposed speed of the Hyperloop Project is 496 kmph and the distance from Pune to Mumbai will be covered in half an hour.</li>\r\n<li>Apart from the cost of land acquisition, all the cost of implementing the project will be spent through private participation. The government will bear the cost of land acquisition.</li>\r\n<li>The development and implementation of the project under Maharashtra Infrastructure Development Enabling Authority Act, 2018 is proposed to be undertaken by the Pune Metropolitan Region Development Authority (PMRDA).</li>\r\n<li>Following the recommendation of the competent authority of Maharashtra Infrastructure Development, the Government of Maharashtra has issued the G.R.No. PRD-3318 / CR103 / NV 7, Dated 02/11/2018, Provisional Approval has been given to declare the Pune-Mumbai Hyperloop as \"Infrastructure Project\" and has temporarily declared the consortium of DP World FZE and Hyperloop Technologies INC as the Original Project Proponent.</li>\r\n<li>Subsequently, vide the letter from the Urban Development Department no. PRD-3318 / CR103 / NV 7, Dated 17/09/2019, the consortium of DP World FZE (lead member of the team) and Hyperloop Technologies INC is announced as the Original Project Proponent for the Pune–Mumbai Hyperloop Project. It has also been mentioned in this manifesto that this Declaration will come into force from the day the amended undertaking is submitted, according to Maha IDEA, Clause no. 5(1-A) is submitted to the Maharashtra Infrastructure Development Enabling Authority. </li>\r\n</ul>','Active',0,NULL,NULL,'+१(५१२)२१६८०३७'),(53,'Augmentation to Wagholi water supply scheme','2020-09-02','Indrayani riverfront development P.F.R, report is prepared. WAPCOS contractor is appointed for preparation & getting approval from competent authority P.F.R. is submitted to the state government of Maharashtra for further approval.','Project is in preliminary stage.','PMRDA proposes to undertake development works of Indrayani River with reference to pollution to Abolement, Riverfront development, flood migration & navigation system and tourism development.\r\n',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','Pre-feasibility reports are prepared and submitted to government of Maharashtra for further recommendation to NRDC.','वाघोली पाणी पुरवठा योजनेचे आवर्धन ','Indrayani riverfront development P.F.R, report is prepared. WAPCOS contractor is appointed for preparation & getting approval from competent authority P.F.R. is submitted to the state government of Maharashtra for further approval.','Project is in preliminary stage.','PMRDA proposes to undertake development works of Indrayani River with reference to pollution to Abolement, Riverfront development, flood migration & navigation system and tourism development.\r\n','Pre-feasibility reports are prepared and submitted to government of Maharashtra for further recommendation to NRDC.','','','Block cost estimate for implementation of development of plan amount to Rs. 1,587 Crore.','Block cost estimate for implementation of development of plan amount to Rs. 1,587 Crore.','Active',0,NULL,NULL,NULL),(54,'Master Plan of Water Supply, Sewage, Storm Water in PMR ','2020-09-02','Preparation of Master Plan of Water Supply, Sewage is in Progress.\r\n','Project is in preliminary stage.','Implementation of Master Plan of Water Supply, Sewage and Solid Waste.\r\n',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','Preparation of Master Plan of Water Supply, Sewage is in progress.\r\n','पुणे महानगर प्रदेशामध्ये पाणी पुरवठा, सांडपाणी व्यवस्था, पावसाच्या अतिरिक्त पाण्यासाठी मार्गदर्शक योजना ','Preparation of Master Plan of Water Supply, Sewage is in Progress.\r\n','Project is in preliminary stage.','Implementation of Master Plan of Water Supply, Sewage and Solid Waste.\r\n','Preparation of Master Plan of Water Supply, Sewage is in progress.\r\n','','','Master Plan of Water Supply, Sewage, Storm Water, Solid Waste Management in PMR.\r\n','Master Plan of Water Supply, Sewage, Storm Water, Solid Waste Management in PMR.\r\n','Active',0,NULL,NULL,NULL),(55,'Town Planning Scheme via EOI','2020-10-01','It is in its Preliminary Stage, and undergoing the process of site selection','2000-watt smart city association','Town Planning scheme through Expression of Interest is one of the first initiative in India. MOU is executed between 2000-Watt Smart City Association of Swiss Government and Maharashtra State Government.<br>\r\nThrough this project, PMRDA intends to adopt elements of carbon neutrality and energy efficiency in its approach towards planning and development of PMR. \r\n',36,'2020-09-02','A','Approved','Akshay Khatu','2020-10-01','3',36,'2020-10-01','It is in preliminary stage\r\n','इओआय मार्फत नगर रचना योजना ','It is in its Preliminary Stage, and undergoing the process of site selection','2000-watt smart city association','Town Planning scheme through Expression of Interest is one of the first initiative in India. MOU is executed between 2000-Watt Smart City Association of Swiss Government and Maharashtra State Government.<br>\r\nThrough this project, PMRDA intends to adopt elements of carbon neutrality and energy efficiency in its approach towards planning and development of PMR. ','It is in preliminary stage\r\n','+41712741540','info@2000wsc.org','<ul>\r\n<li>Model Land Development of 1 sq.km, with a Carbon Neutral Neighborhood for over 10,000 inhabitants to be developed first, as a proof of concept.</li>\r\n<li>A vital urban mix of Residential Buildings and Offices, Shops, Restaurants and Public Facilities promoting a Green City.</li>\r\n<li>Concept proposes to offer its residents a maximum of quality and minimum resources consumption through:\r\n<ul>\r\n<li>High Density</li>\r\n<li>Minimized Embedded Energy</li>\r\n<li>Zero Carbon Operation</li>\r\n<li>Mixed use, Including Habitation, Offices Shops, Restaurants, Senior Living</li>\r\n<li>School, Day Care facilities</li>\r\n<li>Excellent Mobility</li>\r\n</ul></li></ul>\r\n<p>Based on above concept, PMRDA has initiated town planning schemes through Expression of Interest (EOI)</p>','<ul>\r\n<li>Model Land Development of 1 sq.km, with a Carbon Neutral Neighborhood for over 10,000 inhabitants to be developed first, as a proof of concept.</li>\r\n<li>A vital urban mix of Residential Buildings and Offices, Shops, Restaurants and Public Facilities promoting a Green City.</li>\r\n<li>Concept proposes to offer its residents a maximum of quality and minimum resources consumption through:\r\n<ul>\r\n<li>High Density</li>\r\n<li>Minimized Embedded Energy</li>\r\n<li>Zero Carbon Operation</li>\r\n<li>Mixed use, Including Habitation, Offices Shops, Restaurants, Senior Living</li>\r\n<li>School, Day Care facilities</li>\r\n<li>Excellent Mobility</li>\r\n</ul></li></ul>\r\n<p>Based on above concept, PMRDA has initiated town planning schemes through Expression of Interest (EOI)</p>','Active',0,NULL,NULL,'+४१ ७१ २७४ १५ ४०'),(56,'Development Plan ','2020-09-02','Prepared existing land use of PMR','Project is in preliminary stage.','Development Plan is one of the Largest Planning Assignments of the State covering an area of 6166.30 sq. km. including 817 villages. Its aim is to make PMR the Prime Economic Hub of India, aiding in achieving PMR’s mission of an International Premium Investment Destination. Its vision is to promote employment and make it the most habitable region for all.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-02','Preparation of Development Plan is in process.\r\n','विकास योजना','Prepared existing land use of PMR','Project is in preliminary stage.','Development Plan is one of the Largest Planning Assignments of the State covering an area of 6166.30 sq. km. including 817 villages. Its aim is to make PMR the Prime Economic Hub of India, aiding in achieving PMR’s mission of an International Premium Investment Destination. Its vision is to promote employment and make it the most habitable region for all.','Preparation of Development Plan is in process.\r\n','','','<ul>\r\n<li>Preparation of Vision Documents, Draft Development Plan and Implementation of Strategy for Pune Metropolitan Region.</li>\r\n<li>Prepare Development Plan using GIS based mapping and network formation through high resolution Arial image.</li>\r\n</ul>','<ul>\r\n<li>Preparation of Vision Documents, Draft Development Plan and Implementation of Strategy for Pune Metropolitan Region.</li>\r\n<li>Prepare Development Plan using GIS based mapping and network formation through high resolution Arial image.</li>\r\n</ul>','Active',0,NULL,NULL,NULL),(57,'Pradhan Mantri Awas Yojana (PMAY)','2020-09-22','','Rudrabhishek Enterprises Ltd','Pradhan Mantri Awas Yojana is an initiative by the Government of India in which affordable housing will be provided to the urban poor, has three schemes introduced under it:\r\n<ul>\r\n<li>Credit Link Subsidy Scheme (CLSS)</li>\r\n<li>Affordable Housing Projects (AHP/PDD)</li>\r\n<li>Beneficiary Lead Construction (BLC)</li>\r\n</ul>\r\n<div style=\"overflow:auto;\">\r\n<table border=\"1\">\r\n<tr>\r\n                                 			<th style=\"width:5%;\">Scheme</th>\r\n                                 			<th style=\"width:15%;\">Type of Component</th>\r\n                                 			<th style=\"width:10%;\">Maximum Area of construction</th>\r\n                                 			<th style=\"width:15%;\">Maximum Subsidy</th>\r\n                                 			<th style=\"width:20%;\">Eligibility for the scheme</th>\r\n                                 			<th style=\"width:35%;\">Document to be submitted with the application</th>\r\n                                 		</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">CLSS</td>\r\n<td>Generating affordable housing for economically weaker section and low-income groups through loan attached interest subsidy</td>\r\n<td>Up to 200 sq. mtrs. carpet area</td>\r\n<td>Loan up to ₹ 9 lacs at 4% discount rate or a loan up to ₹ 12 lakh at 3% discount rate  </td>\r\n<td>For the family whose annual income is up to 18 lakhs and living as a tenant/joint family/ homeless/reservation affected area/in the inappropriate area</td>\r\n<td>\r\n<ul>\r\n<li>Income Certificate (self-certified)</li>\r\n<li>Affidavit along with the application</li>\r\n<li>Aadhar Card</li>\r\n<li>Photocopy of pass book of the applicant’s name</li>\r\n<li>Resident Certificate signed by respective honorable corporators</li>\r\n<li>PAN card</li>\r\n<li>Land Ownership Proof if it is to be built on your own land</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">AHP/PDD</td>\r\n<td>Creating affordable housing systems in partnership with a private or Government developer.</td>\r\n<td>Up to 30 sq. mtrs. carpet area</td>\r\n<td>₹ 2.50 lac</td>\r\n<td>For the family whose annual income is less than 3 lakhs living as a tenant/joint family/homeless/reservation affected area/in the inappropriate place.</td>\r\n<td>\r\n<ul>\r\n<li>Income certificate (self-certified)</li>\r\n<li>Affidavit along with the application</li>\r\n<li>Aadhar Card</li>\r\n<li>Photocopy of pass book of the applicant’s name.</li>\r\n<li>Resident certificate signed by respective honorable corporators.</li>\r\n<li>Rental receipt</li>\r\n<li>PAN card</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">BLC</td>\r\n<td>Grant for building a house to individual in Economically Weaker Sections</td>\r\n<td>Up to 30 sq. m. carpet area</td>\r\n<td>₹ 2.50 lac</td>\r\n<td>For the family for less than 3 lakhs of annual income living as the tenant/joint family/homeless/reservation affected area/in the appropriate place..</td>\r\n<td>\r\n<ul>\r\n<li>Income certificate (self-certified)</li>\r\n<li>Affidavit along with the application</li>\r\n<li>Aadhar Card</li>\r\n<li>Photocopy of pass book of the applicant’s name.</li>\r\n<li>Resident certificate signed by respective honorable corporators</li>\r\n<li>Proof of ownership</li>\r\n<li>Photographs with the proposed construction site of the applicant.</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</table>\r\n</div>',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-22','3',36,'2020-09-22','The work under PMAY (BLC) vertical was paced up in the end of July 2019 after the commencement of work from the new consultants on 26/07/2019. At the beginning of the work from the new consultants, around 11,500 online applications were received under BLC vertical of PMAY, out of which DPRs of 5,668 beneficiaries were already sanctioned from CSMC.<br>\r\nThe work commenced with rigorous publicity campaigning programs, as a result today, number of online as well as offline BLC vertical applications sharply rose to around 80,000.\r\nParallel to the campaigning programs, data validation of new applications begun along with building and training local village level teams. By the end of August 2019, a team of around 150 local village surveyors along with coordinator in each Taluka were trained and assigned to work on data validation and re-validation of old DPRs along with GPS photographs of each beneficiary.<br>\r\nWithin 25 days of work, new DPRs of 9528 beneficiaries including 7 Talukas were submitted in SLSMC, which were sanctioned in 46th CSMC on 29/08/ 2019.<br>\r\nMIS entries of ‘Patra’ beneficiaries were done on the MIS portal. As of date, entries of around 14,650 beneficiaries have been completed on the central MIS portal. Funds of ₹ 13.71 Crores have been received by MHASA in PMAY-PMRDA bank account on 08/01/2020. Construction of houses in Kondhawale Village of Mulshi Taluka has already commenced. Further, building plans of around 1,286 beneficiaries from Bhor (895), Purandar (201), Haveli (54), Mulshi (43) and Velhe (93) Talukas have been prepared. Building plan approval along with the final filing for these beneficiaries is under process.','प्रधान मंत्री आवास योजना (पीएमएवाय)','','Rudrabhishek Enterprises Ltd','प्रधानमंत्री आवास योजना हा भारत सरकारचा एक उपक्रम आहे ज्यामध्ये शहरी गरीब लोकांना परवडणारी घरे उपलब्ध करुन देण्यात येतील.<br>\r\nत्याअंतर्गत मुख्यतः schemes योजना सुरू केल्या आहेत:\r\n<ol>\r\n<li>क्रेडिट लिंक सबसिडी योजना (सीएलएसएस)</li>\r\n<li>परवडणारी गृहनिर्माण प्रकल्प (एएचपी / पीडीडी)</li>\r\n<li>लाभार्थी लीड कन्स्ट्रक्शन (बीएलसी)</li>\r\n</ol>\r\n<div style=\"overflow:auto;\">\r\n<table border=\"1\">\r\n<tr>\r\n<th style=\"width:5%;\">योजना</th>\r\n<th style=\"width:15%;\">घटकांचा प्रकार</th>\r\n<th style=\"width:10%;\">बांधकामाचे जास्तीत जास्त क्षेत्र</th>\r\n<th style=\"width:15%;\">जास्तीत जास्त अनुदान</th>\r\n<th style=\"width:20%;\">योजनेसाठी पात्रता</th>\r\n<th style=\"width:35%;\">अर्जासह सादर करावयाचे कागदपत्र</th>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">सीएलएसएस</td>\r\n<td>कर्ज संलग्न व्याज अनुदानाद्वारे आर्थिकदृष्ट्या दुर्बल घटक आणि निम्न-उत्पन्न गटातील लोकांना परवडणारी घरे निर्मिती</td>\r\n<td>200 चौरस मीटर पर्यंत चटई क्षेत्र</td>\r\n<td>9 लाखांपर्यंत कर्ज 4% सूट दर किंवा 3% सवलतीच्या दराने 12 लाख रुपयांपर्यंतचे कर्ज</td>\r\n<td>ज्या कुटुंबाचे वार्षिक उत्पन्न १ lakhs लाखांपर्यंत आहे आणि भाडेकरू / संयुक्त कुटुंब / बेघर / आरक्षण बाधित क्षेत्र / अनुचित क्षेत्रात राहतात अशा कुटुंबासाठी</td>\r\n<td>\r\n<ul>\r\n<li>मिळकत प्रमाणपत्र (स्वयं-प्रमाणित)</li>\r\n<li>अर्जासोबत प्रतिज्ञापत्र</li>\r\n<li>आधार कार्ड</li>\r\n<li>अर्जदाराच्या नावाच्या पास बुकची झेरॉक्स प्रत</li>\r\n<li>संबंधित सन्माननीय नगरसेवकांनी स्वाक्षरी केलेले निवासी प्रमाणपत्र</li>\r\n<li>पॅन कार्ड</li>\r\n<li>आपल्या स्वत: च्या जमिनीवर ते तयार करायचे असल्यास जमीन मालकीचा पुरावा</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">एएचपी / पीडीडी</td>\r\n<td>खाजगी किंवा सरकारी विकसकासह भागीदारीत परवडणारी गृहनिर्माण प्रणाली तयार करणे.</td>\r\n<td>30 चौरस मीटर पर्यंत चटई क्षेत्र</td>\r\n<td>रु. 2.50 लाख</td>\r\n<td>भाडेकरू / संयुक्त कुटुंब / बेघर / आरक्षण बाधित क्षेत्र / योग्य ठिकाणी म्हणून राहणा annual्या वार्षिक उत्पन्नाच्या 3 लाखांपेक्षा कमी कुटुंबासाठी.</td>\r\n<td>\r\n<ul>\r\n<li>मिळकत प्रमाणपत्र (स्वयं-प्रमाणित)</li>\r\n<li>अर्जासोबत प्रतिज्ञापत्र</li>\r\n<li>आधार कार्ड</li>\r\n<li>अर्जदाराच्या नावाच्या पास बुकची झेरॉक्स प्रत</li>\r\n<li>संबंधित सन्माननीय नगरसेवकांनी स्वाक्षरी केलेले निवासी प्रमाणपत्र.</li>\r\n<li>भाडे पावती</li>\r\n<li>पॅन कार्ड</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align:center;\">बीएलसी</td>\r\n<td>आर्थिकदृष्ट्या कमकुवत विभागात स्वतंत्रपणे घर बांधण्यासाठी अनुदान</td>\r\n<td>30 चौरस मीटर पर्यंत चटई क्षेत्र</td>\r\n<td>रु. 2.50 लाख</td>\r\n<td>भाडेकरू / संयुक्त कुटुंब / बेघर / आरक्षण बाधित क्षेत्र / योग्य ठिकाणी म्हणून राहणा annual्या वार्षिक उत्पन्नाच्या 3 लाखांपेक्षा कमी कुटुंबासाठी.</td>\r\n<td>\r\n<ul>\r\n<li>मिळकत प्रमाणपत्र (स्वयं-प्रमाणित)</li>\r\n<li>अर्जासोबत प्रतिज्ञापत्र</li>\r\n<li>आधार कार्ड</li>\r\n<li>अर्जदाराच्या नावाच्या पास बुकची झेरॉक्स प्रत</li>\r\n<li>संबंधित सन्माननीय नगरसेवकांनी स्वाक्षरी केलेले निवासी प्रमाणपत्र</li>\r\n<li>मालकीचा पुरावा</li>\r\n<li>अर्जदाराच्या प्रस्तावित बांधकाम साइटसह छायाचित्रे.</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</table>\r\n</div>','The work under PMAY (BLC) vertical was paced up in the end of July 2019 after the commencement of work from the new consultants on 26/07/2019. At the beginning of the work from the new consultants, around 11,500 online applications were received under BLC vertical of PMAY, out of which DPRs of 5,668 beneficiaries were already sanctioned from CSMC.<br>\r\nThe work commenced with rigorous publicity campaigning programs, as a result today, number of online as well as offline BLC vertical applications sharply rose to around 80,000.\r\nParallel to the campaigning programs, data validation of new applications begun along with building and training local village level teams. By the end of August 2019, a team of around 150 local village surveyors along with coordinator in each Taluka were trained and assigned to work on data validation and re-validation of old DPRs along with GPS photographs of each beneficiary.<br>\r\nWithin 25 days of work, new DPRs of 9528 beneficiaries including 7 Talukas were submitted in SLSMC, which were sanctioned in 46th CSMC on 29/08/ 2019.<br>\r\nMIS entries of ‘Patra’ beneficiaries were done on the MIS portal. As of date, entries of around 14,650 beneficiaries have been completed on the central MIS portal. Funds of ₹ 13.71 Crores have been received by MHASA in PMAY-PMRDA bank account on 08/01/2020. Construction of houses in Kondhawale Village of Mulshi Taluka has already commenced. Further, building plans of around 1,286 beneficiaries from Bhor (895), Purandar (201), Haveli (54), Mulshi (43) and Velhe (93) Talukas have been prepared. Building plan approval along with the final filing for these beneficiaries is under process.','7011843627','Samarth.gangwar@repl.global','PMRDA was appointed as the implementing agency for PMAY (Urban) on 22/12/2017. As the implementing agency, PMRDA is responsible for assessment of housing demand under the 4 verticals of PMAY. After demand assessment, PMRDA is responsible for implementation of AHP/PPP Vertical & BLC Vertical of PMAY.<br>\r\nUnder the AHP/PPP Vertical, PMRDA alone or in partnership with private developers, develop EWS group housing after approval of project from Central Government. After construction of EWS, houses are allotted to the beneficiaries through lottery system.<br>\r\nUnder the BLC Vertical of PMAY, PMRDA finalizes the EWS beneficiaries having self-owned land and gets their beneficiary lists sanctioned through DPR from the Centre. PMRDA then provides the approved building plans to the beneficiaries and starts the construction, after which the construction by the beneficiary is monitored and funds at different stages are directly transferred to beneficiary’s account.','PMRDA was appointed as the implementing agency for PMAY (Urban) on 22/12/2017. As the implementing agency, PMRDA is responsible for assessment of housing demand under the 4 verticals of PMAY. After demand assessment, PMRDA is responsible for implementation of AHP/PPP Vertical & BLC Vertical of PMAY.<br>\r\nUnder the AHP/PPP Vertical, PMRDA alone or in partnership with private developers, develop EWS group housing after approval of project from Central Government. After construction of EWS, houses are allotted to the beneficiaries through lottery system.<br>\r\nUnder the BLC Vertical of PMAY, PMRDA finalizes the EWS beneficiaries having self-owned land and gets their beneficiary lists sanctioned through DPR from the Centre. PMRDA then provides the approved building plans to the beneficiaries and starts the construction, after which the construction by the beneficiary is monitored and funds at different stages are directly transferred to beneficiary’s account.','Active',0,NULL,NULL,'७०११८४३६२७'),(58,'Land Monetization','2020-09-03','₹ 36.22 Crore auction',' Ernst and Young LLP','A private agency has been appointed to assess the land transferred to Pune Metropolitan Region Development Authority. With the help of these activities, survey of the land acquired by the Government as a source of Fund Raising, determining the business purpose in view of the market situation and maximum funding through PPP model will be prepared by the RFP and the process for development of the project will be carried out by same. The mechanism has been entrusted with the four plots received by the then Government.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-03','On going','भू मुद्रीकरण','₹ 36.22 Crore auction',' Ernst and Young LLP','A private agency has been appointed to assess the land transferred to Pune Metropolitan Region Development Authority. With the help of these activities, survey of the land acquired by the Government as a source of Fund Raising, determining the business purpose in view of the market situation and maximum funding through PPP model will be prepared by the RFP and the process for development of the project will be carried out by same. The mechanism has been entrusted with the four plots received by the then Government.','On going',' 889800778',' Kunal.raval@in.ey.com','The government land monetization is a source of funding for the construction of the important project','The government land monetization is a source of funding for the construction of the important project','Active',0,NULL,NULL,'८८९८००७७८'),(59,'Record Room','2020-09-03','<ul>\r\n<li>Scanned Files – 3,723 </li>\r\n<li>Classification Files – 7,500</li>\r\n<li>Indexing – 48,900</li>\r\n</ul>','EQL Business Solutions Pvt. Ltd','From the scanning of the Pune Metropolitan Region Development Authority, today, software for scanning, indexing and preserving up to 40 lakh 25 thousand pages has been registered by registering the files registered in the records of the Authority. The work has been entrusted to the institute and 23,84,271 records of the Authority are in the works and by December 2020, the entire archive room digitization will be completed. This will facilitate the preservation and availability of authority records in the updated records.',36,'2020-09-02','A','Approved','Akshay Khatu','2020-09-15','3',36,'2020-09-03','On going','अभिलेख कक्ष','<ul>\r\n<li>Scanned Files – 3,723 </li>\r\n<li>Classification Files – 7,500</li>\r\n<li>Indexing – 48,900</li>\r\n</ul>','EQL Business Solutions Pvt. Ltd','From the scanning of the Pune Metropolitan Region Development Authority, today, software for scanning, indexing and preserving up to 40 lakh 25 thousand pages has been registered by registering the files registered in the records of the Authority. The work has been entrusted to the institute and 23,84,271 records of the Authority are in the works and by December 2020, the entire archive room digitization will be completed. This will facilitate the preservation and availability of authority records in the updated records.','On going',' 09373936677','info@eqlsoft.com','In PMRDA, Scanned Files/Records/Maps are required to be saved in the Record Room.\r\n','In PMRDA, Scanned Files/Records/Maps are required to be saved in the Record Room.\r\n','Active',0,NULL,NULL,'०९३७३९३६६७७'),(65,'Demo Project','2020-10-29','12221','Demo','1.	Tuned\r\n2.	SELinux\r\n3.	SSH login: Remove default admin and create SSH login\r\n4.	Separate Disk Partitions For Linux System\r\n5.	Separation of the operating system files from user files may result into a better and secure system. Make sure the following filesystems are mounted on separate partitions:\r\n/usr\r\n/home\r\n/var and /var/tmp\r\n/tmp\r\n6.	Disk Quotas\r\nMake sure disk quota is enabled for all users. To implement disk quotas, use the following steps:\r\n7.	FirewallD:\r\nOpen port:\r\n•	1433\r\n8.	Auto Weekly Snapshots\r\n',36,'2020-10-29','D','Approved','Akshay Khatu','2020-10-29','3',36,'2020-10-29','Completed','?????????????','12221','Demo','1.	Tuned\r\n2.	SELinux\r\n3.	SSH login: Remove default admin and create SSH login\r\n4.	Separate Disk Partitions For Linux System\r\n5.	Separation of the operating system files from user files may result into a better and secure system. Make sure the following filesystems are mounted on separate partitions:\r\n/usr\r\n/home\r\n/var and /var/tmp\r\n/tmp\r\n6.	Disk Quotas\r\nMake sure disk quota is enabled for all users. To implement disk quotas, use the following steps:\r\n7.	FirewallD:\r\nOpen port:\r\n•	1433\r\n8.	Auto Weekly Snapshots\r\n','completed','9923829241','parishmtr@gmail.com','1.	Tuned\r\n2.	SELinux\r\n3.	SSH login: Remove default admin and create SSH login\r\n4.	Separate Disk Partitions For Linux System\r\n5.	Separation of the operating system files from user files may result into a better and secure system. Make sure the following filesystems are mounted on separate partitions:\r\n/usr\r\n/home\r\n/var and /var/tmp\r\n/tmp\r\n6.	Disk Quotas\r\nMake sure disk quota is enabled for all users. To implement disk quotas, use the following steps:\r\n7.	FirewallD:\r\nOpen port:\r\n•	1433\r\n8.	Auto Weekly Snapshots\r\n','1.	Tuned\r\n2.	SELinux\r\n3.	SSH login: Remove default admin and create SSH login\r\n4.	Separate Disk Partitions For Linux System\r\n5.	Separation of the operating system files from user files may result into a better and secure system. Make sure the following filesystems are mounted on separate partitions:\r\n/usr\r\n/home\r\n/var and /var/tmp\r\n/tmp\r\n6.	Disk Quotas\r\nMake sure disk quota is enabled for all users. To implement disk quotas, use the following steps:\r\n7.	FirewallD:\r\nOpen port:\r\n•	1433\r\n8.	Auto Weekly Snapshots\r\n','Deactivate',36,'2021-01-22','','9923829241');
/*!40000 ALTER TABLE `tbl_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_project_features`
--

DROP TABLE IF EXISTS `tbl_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_project_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `feature` longtext,
  `feature_h` longtext,
  `status` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_on` varchar(45) DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `modified_on` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_project_features`
--

LOCK TABLES `tbl_project_features` WRITE;
/*!40000 ALTER TABLE `tbl_project_features` DISABLE KEYS */;
INSERT INTO `tbl_project_features` VALUES (20,30,'The scope of this project is to construct a centrally located station under the fire act guidelines with an aim to protect people from fire.','या प्रकल्पाची व्याप्ती अग्निशामक कायद्याच्या मार्गदर्शनाखाली मध्यवर्ती ठिकाणी असलेले स्टेशन बांधणे आहे ज्यायोगे लोकांना आगीपासून वाचविता येईल.','A',NULL,'2020-07-03',NULL,NULL),(21,30,'The main goal is to prevent fire at the first place and save more no of people and property.','प्रथम ठिकाणी आग रोखणे आणि लोक व मालमत्तांपेक्षा जास्त लोकांना वाचविणे हे मुख्य लक्ष्य आहे.','A',NULL,'2020-07-03',NULL,NULL),(22,32,'Block cost estimate for implementation of development of plan amount to Rs. 1587 crore.','योजनेच्या रकमेच्या रु. 1587 कोटी आहे.','A',NULL,'2020-07-03',NULL,NULL),(23,33,'Road Works = 18.820 km (Excluding MIDC, PWD Road)','रोड वर्क्स = 18.820 किमी (एमआयडीसी वगळता, पीडब्ल्यूडी रोड)','A',NULL,'2020-07-03',NULL,NULL),(24,33,'Minor Box/Culvert = 4 Nos.','किरकोळ पेटी / शेती = 4 क्रमांक','A',NULL,'2020-07-03',NULL,NULL),(25,33,'Solar PV Panels = 1 Nos.','सौर पीव्ही पॅनेल = 1 क्रमांक','A',NULL,'2020-07-03',NULL,NULL),(26,33,'Tree Plantation = 13,000 Nos.','वृक्षारोपण = १,000,०००','A',NULL,'2020-07-03',NULL,NULL),(27,33,'Water Distribution Network = 36.02 km (Potable Water)','पाणी वितरण नेटवर्क = .0 36.०२ किमी (पिण्यायोग्य पाणी)','A',NULL,'2020-07-03',NULL,NULL),(28,33,'Recycle Water Network = 35.010 km','रीसायकल वॉटर नेटवर्क = 35.010 किमी','A',NULL,'2020-07-03',NULL,NULL),(29,33,'Elevated Reservoir = 2.67 ML + 1.55 ML (4 Tanks)','उन्नत जलाशय = 2.67 एमएल + 1.55 एमएल (4 टाक्या)','A',NULL,'2020-07-03',NULL,NULL),(30,33,'Sewer Network Line = 42.39 km','सीवर नेटवर्क लाइन = 42.39 किमी','A',NULL,'2020-07-03',NULL,NULL),(31,33,'Trench Duct Length (Single) = 70.230 km','खंदक नलिका लांबी (एकल) = 70.230 किमी','A',NULL,'2020-07-03',NULL,NULL),(32,33,'Storm Water Drainage Line = 45.5 km','वादळ पाणी निचरा लाइन = 45.5 किमी','A',NULL,'2020-07-03',NULL,NULL),(33,33,'Rain Water Harvesting Points = 100 Nos.','रेन वॉटर हार्वेस्टिंग पॉईंट्स = 100 क्रमांक','A',NULL,'2020-07-03',NULL,NULL),(34,33,'Electrical Substation Total 6 nos. Now proposed 1 No.','इलेक्ट्रिकल सबस्टेशन एकूण 6 क्रमांक आता प्रस्तावित १ क्र.','A',NULL,'2020-07-03',NULL,NULL),(35,33,'Electrical Distribution = 28 km','विद्युत वितरण = 28 किमी','A',NULL,'2020-07-03',NULL,NULL),(36,33,'Smart Street Lighting = 1,648 Nos','स्मार्ट स्ट्रीट लाइटिंग = 1,648 क्रमांक','A',NULL,'2020-07-03',NULL,NULL),(37,34,'The main purpose of the Pune Ring Road is to divert the heavy vehicular traffic thereby reducing the traffic congestion, in the city of Pune. Also the suburban area will be developed and will be connected to the main road. Now Government of Maharashtra, via notification dated 14/06/2016 declared that PMRDA as developing authority for Ring Road.','पुणे रिंगरोडचा मुख्य हेतू म्हणजे पुणे शहरातील वाहतुकीची कोंडी कमी करणार्‍या अवजड वाहनांना वळविणे. तसेच उपनगरी भाग विकसित केला जाईल आणि मुख्य रस्त्यासह जोडला जाईल. आता महाराष्ट्र शासनाने दिनांक १/0/०6/२०१ notification च्या अधिसूचनेद्वारे घोषित केले की पीएमआरडीए रिंग रोडला विकसनशील प्राधिकरण म्हणून घोषित करते.','A',NULL,'2020-07-03',NULL,NULL);
/*!40000 ALTER TABLE `tbl_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rti_applications`
--

DROP TABLE IF EXISTS `tbl_rti_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_rti_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_received` int(11) DEFAULT '0',
  `application_disposed` int(11) DEFAULT '0',
  `application_pending` int(11) DEFAULT '0',
  `application_received_h` varchar(500) DEFAULT NULL,
  `application_disposed_h` varchar(500) DEFAULT NULL,
  `application_pending_h` varchar(500) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `updated_on` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rti_applications`
--

LOCK TABLES `tbl_rti_applications` WRITE;
/*!40000 ALTER TABLE `tbl_rti_applications` DISABLE KEYS */;
INSERT INTO `tbl_rti_applications` VALUES (3,100,80,20,'१००','८०','२०','2020-10-23',36,NULL,0);
/*!40000 ALTER TABLE `tbl_rti_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_taluka`
--

DROP TABLE IF EXISTS `tbl_taluka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_taluka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taluka` varchar(1000) DEFAULT NULL,
  `total_villages` int(11) DEFAULT NULL,
  `remark` longtext,
  `status` varchar(45) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` varchar(45) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` varchar(45) DEFAULT NULL,
  `taluka_h` varchar(1000) DEFAULT NULL,
  `remark_h` longtext,
  `total_villages_h` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_taluka`
--

LOCK TABLES `tbl_taluka` WRITE;
/*!40000 ALTER TABLE `tbl_taluka` DISABLE KEYS */;
INSERT INTO `tbl_taluka` VALUES (4,'Velhe',52,'','A',36,'2020-07-17',36,'2020-09-03','वेल्हे','','५२'),(5,'Purandar',38,'','A',36,'2020-07-17',36,'2020-09-03','पुरंदर','','३८'),(6,'Shirur',68,'Ganegaon Burunjawadi(Split)','A',36,'2020-07-17',36,'2020-09-03','शिरूर','गणेगाव बुरुंजवाडी (स्प्लिट)','६८'),(7,'Mulashi',144,'','A',36,'2020-07-17',36,'2020-09-03','मुलाशी','','१४४'),(8,'Maval',189,'','A',36,'2020-07-17',36,'2020-09-03','मावळ','','१८९'),(9,'Khed',114,'','A',36,'2020-07-17',36,'2020-09-03','खेड','','११४'),(10,'Haveli',108,'Ahire(Split Up)','A',36,'2020-07-17',36,'2020-09-03','हवेली','अहिरे (स्प्लिट-अप)','१०८'),(11,'Bhor',53,'','A',36,'2020-07-17',36,'2020-09-03','भोर','','५३'),(12,'Daund',51,'','A',36,'2020-07-17',36,'2020-09-03','दौंड','','५१'),(13,'ngp',1,'asdfgh','D',36,'2020-08-11',36,'2020-08-11','ngp','',NULL),(14,'test',48,'','D',36,'2020-08-31',0,NULL,'test','',NULL),(15,'test',10,'test','D',36,'2020-09-11',0,NULL,'test','test','१०');
/*!40000 ALTER TABLE `tbl_taluka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tender`
--

DROP TABLE IF EXISTS `tbl_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `subTitle` mediumtext,
  `openingDate` varchar(45) DEFAULT NULL,
  `closingDate` varchar(45) DEFAULT NULL,
  `description` longtext,
  `publish_Date` date DEFAULT NULL,
  `publishStatus` varchar(60) DEFAULT NULL,
  `department_ID` bigint(20) DEFAULT NULL,
  `tags` mediumtext,
  `attachment_ID` bigint(20) DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT '0',
  `ApprovalBy` varchar(45) DEFAULT '0',
  `Comments` mediumtext,
  `ApprovedDate` datetime DEFAULT NULL,
  `FinancialYear` bigint(20) DEFAULT NULL,
  `title_h` longtext,
  `url` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `delete_approval_status` varchar(45) DEFAULT NULL,
  `delete_approved_by` int(11) DEFAULT '0',
  `delete_approval_date` varchar(45) DEFAULT NULL,
  `delete_approval_comment` varchar(1000) DEFAULT NULL,
  `publish_time` varchar(45) DEFAULT NULL,
  `closing_time` varchar(45) DEFAULT NULL,
  `opening_time` varchar(45) DEFAULT NULL,
  `subTitle_h` mediumtext,
  `description_h` longtext,
  `publish_Date_h` varchar(45) DEFAULT NULL,
  `openingDate_h` varchar(45) DEFAULT NULL,
  `closingDate_h` varchar(45) DEFAULT NULL,
  `publish_time_h` varchar(45) DEFAULT NULL,
  `closing_time_h` varchar(45) DEFAULT NULL,
  `opening_time_h` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_DEPARTMENT` (`department_ID`),
  KEY `INDEX_FINANCIALYEAR` (`FinancialYear`),
  CONSTRAINT `FK_DEPARTMENT` FOREIGN KEY (`department_ID`) REFERENCES `tender_department` (`id`),
  CONSTRAINT `FK_FINANTIALYEAR` FOREIGN KEY (`FinancialYear`) REFERENCES `financial_year` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tender`
--

LOCK TABLES `tbl_tender` WRITE;
/*!40000 ALTER TABLE `tbl_tender` DISABLE KEYS */;
INSERT INTO `tbl_tender` VALUES (79,'Supply Installation Commissioning of 50 MTPD mixed waste processing plant at Wagholi and its operation and maintenance for a period of 10 years.','[57 For FY 2019-2020][2020_PMRDA_555532_1]','30-10-2020','18-06-2020','Supply Installation Commissioning of 50 MTPD mixed waste processing plant at Wagholi and its operation and maintenance for a period of 10 years.','2020-03-13','Archived',27,NULL,0,'A','2020-06-26','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'वाघोली येथे M० एमटीपीडी मिश्रित कचरा प्रक्रिया प्रकल्प पुरवठा स्थापना आणि त्याकरिता दहा वर्षांच्या कालावधीत देखभाल व देखभाल.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','[57 For FY 2019-2020][2020_PMRDA_555532_1]','','१३-०३-२०२०','३०-१०-२०२०','१८-०६-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(80,'Up-gradation of Network Infrastructure, Setting up Network Operations Centre (NoC), LAN Network and Wi-Fi Access Points at PMRDA','[37 For FY 2019-2020][2019_PMRDA_521165_1]','21-01-2020','20-01-2020','NA','2019-12-16','Archived',33,NULL,0,'A','2020-07-06','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,' नेटवर्क इन्फ्रास्ट्रक्चरचे अपग्रेडेशन, पीएमआरडीए येथे नेटवर्क ऑपरेशन्स सेंटर (एनओसी) सेट करणे, लॅन नेटवर्क आणि वाय-फाय Pक्सेस पॉइंट्स','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','[37 For FY 2019-2020][2019_PMRDA_521165_1]','','१६-१२-२०१९','२१-०१-२०२०','२०-०१-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(81,'Improvement To M.D.R.102 From S.H. 119 to Supe Khurd Road of 1.500 Kms Length Tal.-Purandar ,Dist.-Pune.','[39 For FY 2019-2020][2019_PMRDA_524747_1]','18-01-2020','17-01-2020','NA','2019-12-24','Archived',31,NULL,0,'A','2020-07-06','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'एस.एच. पासून एम.डी.आर.102 पर्यंत सुधारणा १ 119 ०० ते १e०० किलोमीटर लांबीचा सुपे खुर्द रोड ता. पुरंदर, जि.पुणे.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','[39 For FY 2019-2020][2019_PMRDA_524747_1]','','२४-१२-२०१९','१८-०१-२०२०','१७-०१-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(82,'Augmentation to Mahalunge Village Water Supply Scheme Part B Ta. Mulshi Dist. Pune.','[50 For FY 2019-2020][2020_PMRDA_548723_1]','11-03-2020','09-03-2020','NA','2020-02-13','Archived',29,NULL,0,'A','2020-07-07','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'महालुंगे गाव पाणीपुरवठा योजना भाग ब ता. ता. मुळशी जि. पुणे.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','[50 For FY 2019-2020][2020_PMRDA_548723_1]','','१३-०२-२०२०','११-०३-२०२०','०९-०३-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(83,'Appointment of Consultant for, work out quantities and assesment of solid waste for Biomining on Gat no.1419 of Wagholi Village Tq-Haveli Dist-Pune.','[54 For FY 2019-2020][2020_PMRDA_556397_1]','11-03-2020','09-03-2020','NA','2020-02-27','Archived',34,NULL,0,'A','2020-07-07','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'वाघोली गाव ता. हवेली जि.पुणे येथील गट क्र .१19 १ on वर बायोमिनिंगसाठी घनकच waste्याचे प्रमाणन व कामकाजासाठी सल्लागाराची नेमणूक.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','[54 For FY 2019-2020][2020_PMRDA_556397_1]','','२७-०२-२०२०','११-०३-२०२०','०९-०३-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(84,'Emergency EOI for Providing Covid-19 Infrastructure Facility','2 For FY 2020-2021','31-07-2020','30-07-2020','test','2020-07-24','Archived',27,NULL,0,'A','2020-07-30','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'Emergency EOI for Providing Covid-19 Infrastructure Facility','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:00','12:00','12:00','2 For FY 2020-2021','','२४-०७-२०२०','३१-०७-२०२०','३०-०७-२०२०','१२:०० AM','१२:०० AM','१२:०० AM'),(85,'Request for Quotation (RFQ) for Design, Development, Customization, Implementation & Maintenance of web-based eTapal & File Tracking System for PMRDA.','RFQ No. 02 FY 2020-21','04-08-2020','04-08-2020','test','2020-07-28','Approved',33,NULL,0,'D','2020-07-31','36',NULL,'0','admin','approved','2020-07-31 13:51:04',1,'Request for Quotation (RFQ) for Design, Development, Customization, Implementation & Maintenance of web-based eTapal & File Tracking System for PMRDA.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'00:00','00:00','00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'Request for Quotation (RFQ) for Design, Development, Customization, Implementation & Maintenance of web-based eTapal & File Tracking System for PMRDA.','RFQ No. 02 FY 2020-21','01-10-2020','30-09-2020','Request for Quotation (RFQ) for Design, Development, Customization, Implementation & Maintenance of web-based eTapal & File Tracking System for PMRDA.','2020-09-01','Archived',33,NULL,0,'A','2020-07-31','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'Request for Quotation (RFQ) for Design, Development, Customization, Implementation & Maintenance of web-based eTapal & File Tracking System for PMRDA.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'8:00','15:00','15:00','RFQ No. 02 FY 2020-21','','०१-०९-२०२०','०१-१०-२०२०','३०-०९-२०२०','०८:०० स.','३:०० दु.','३:०० दु.'),(87,'construction tender','001','29-11-2020','29-11-2020','abcdefg','2020-11-20','Archived',27,NULL,0,'A','2020-07-31','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'बांधकाम निविदा','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'14:00','15:00','15:30','००१','','२०-११-२०२०','२९-११-२०२०','२९-११-२०२०','२:०० दु.','३:०० दु.','३:३० दु.'),(88,'Tendar ','xccc','12-08-2020','16-09-2020','zcx fg','2020-08-27','Approved',27,NULL,0,'D','2020-08-10','36',NULL,'0','admin','','2020-08-10 11:03:05',3,'af','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'00:00','00:00','00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'tender notices','tender','29-08-2020','28-08-2020','asdf','2020-08-27','Archived',27,NULL,0,'A','2020-08-12','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'tender notices','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'1:30','2:30','12:00','tender','','२७-०८-२०२०','२९-०८-२०२०','२८-०८-२०२०','०१:३० AM','०२:३० AM','१२:०० AM'),(90,'new tender notices for builder ','18','17-12-2020','16-12-2020','new tender notices for builder ','2020-11-24','Archived',27,NULL,0,'A','2020-08-27','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'बिल्डरसाठी नवीन निविदा सूचना ','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'13:29','15:00','18:30','१८ ','','२४-११-२०२०','१७-१२-२०२०','१६-१२-२०२०','१:२९ दु.','३:०० दु.','६:३० दु.'),(91,'Emergency EOI for Providing Operator facility to Covid-19 Hospital','3 For FY 2020-2021','02-01-2021','01-01-2021','','2020-09-20','Archived',29,NULL,0,'A','2020-09-16','36',NULL,'0','AkshayKhatu','Archived','2021-01-22 21:15:46',3,'??????????800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'10:00','16:00','17:00','3 For FY 2020-2021','','??-??-????','??-??-????','01-01-2021','??:?? ?.','?:?? ??.','?:?? ??.'),(92,'Appointment of a private agency for Demolition of any type of illegal construction in PMR area with required machinary and man power along with Videogrphy work.','2021_PMRDA_637472_1','05-02-2021','04-02-2021','Appointment of a private agency for Demolition of any type of illegal construction in PMR area with required machinary and man power along with Videogrphy work.','2021-01-21','Approved',30,NULL,0,'A','2021-01-22','36',NULL,'0','AkshayKhatu','app','2021-01-22 00:23:15',3,'??? ??????? ???? ????? ??????? ???&laquo;&copy;?????? ???? ????&acute;? ?? ?&frac34;?&copy; ??&Iacute;???????&laquo;???? ?????&Euml;???????? ???? ?&frac34;???? ????????? ???????? ? ???&Iacute;??? ?. ????????&frac12;?????? ????? ??&Acirc;??????&macr;? ???????? ?????? ? ??????-?&Aacute;????? ?????? ???????????.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'10:00','17:00','17:00','2021_PMRDA_637472_1','Appointment of a private agency for Demolition of any type of illegal construction in PMR area with required machinary and man power along with Videogrphy work.','??-??-????','??-??-????','04-02-2021','??:?? ?.','?:?? ??.','?:?? ??.'),(93,'?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','01-02-2021','30-01-2021','?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','2021-01-23','Pending',27,NULL,0,'D','2021-01-22','36',NULL,'0',NULL,NULL,NULL,3,'?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','pmrda_tenders','TENDERS','Active',0,NULL,NULL,'12:38','12:38','12:38','?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','?????????? 800 ????????? ????? ????????????? ???? ???????? ???????? ? ????????? ???????? ?????? ???? ????.','??-??-????','??-??-????','30-01-2021','??:?? ?.','??:?? ?.','??:?? ?.');
/*!40000 ALTER TABLE `tbl_tender` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_tender_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_tender` FOR EACH ROW BEGIN
IF (NEW.publishStatus like 'Approved') THEN
delete from entry_log where table_name ='tbl_tender';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_general_ci ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_bin ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_tender_AFTER_UPDATE` AFTER UPDATE ON `tbl_tender` FOR EACH ROW BEGIN
DECLARE table_name varchar(45);
DECLARE type varchar(45);
IF (NEW.publishStatus like 'Approved')
THEN
SET table_name = 'tbl_tender';
SET type = 'TENDER';
INSERT INTO  entry_log (title_id,title,Attachment_id,Type,table_name,MODIFIED_ON,title_h,status) values(NEW.id,NEW.title,NEW.attachment_ID,type,table_name,NOW(),NEW.title_h,new.state);
END IF;
IF(OLD.state <> NEW.state)
THEN
update entry_log set status = NEW.state where title_id = old.id;
END IF;
IF (NEW.publishStatus like 'Reject')
THEN
update entry_log set status = 'D' where title_id = old.id;

END IF;
IF (NEW.publishStatus like 'Pending')
THEN
update entry_log set status = 'D' where title_id = old.id;

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pmrdadb` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Table structure for table `tbl_user_otp`
--

DROP TABLE IF EXISTS `tbl_user_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_otp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otp` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_otp`
--

LOCK TABLES `tbl_user_otp` WRITE;
/*!40000 ALTER TABLE `tbl_user_otp` DISABLE KEYS */;
INSERT INTO `tbl_user_otp` VALUES (3,417110,51),(4,136878,53);
/*!40000 ALTER TABLE `tbl_user_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userlogininfo`
--

DROP TABLE IF EXISTS `tbl_userlogininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_userlogininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `logoutTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userlogininfo`
--

LOCK TABLES `tbl_userlogininfo` WRITE;
/*!40000 ALTER TABLE `tbl_userlogininfo` DISABLE KEYS */;
INSERT INTO `tbl_userlogininfo` VALUES (218,'36','Thu Mar 07 17:18:14 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(219,'42','Thu Mar 07 17:18:14 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(220,'42','Thu Mar 07 17:18:14 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(221,'36','Thu Mar 07 18:32:03 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(222,'36','Tue Mar 12 17:12:14 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(223,'42','Tue Mar 12 17:12:14 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(224,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(225,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(226,'42','Wed Mar 13 10:09:48 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(227,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(228,'43','Wed Mar 13 10:09:48 IST 2019','aplesh',NULL),(229,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(230,'42','Wed Mar 13 10:09:48 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(231,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(232,'42','Wed Mar 13 10:09:48 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(233,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(234,'42','Wed Mar 13 10:09:48 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(235,'42','Wed Mar 13 10:09:48 IST 2019','news','Wed Mar 13 10:09:48 IST 2019'),(236,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(237,'36','Wed Mar 13 10:09:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(238,'36','Wed Mar 13 11:39:03 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(239,'36','Wed Mar 13 11:45:48 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(240,'36','Wed Mar 13 11:51:00 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(241,'36','Wed Mar 13 11:54:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(242,'36','Wed Mar 13 11:55:24 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(243,'36','Wed Mar 13 11:57:28 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(244,'36','Wed Mar 13 11:58:51 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(245,'36','Wed Mar 13 12:07:52 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(246,'36','Wed Mar 13 12:11:40 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(247,'36','Wed Mar 13 12:27:39 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(248,'36','Mon Mar 18 21:40:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(249,'36','Mon Mar 18 21:40:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(250,'36','Mon Mar 18 21:48:47 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(251,'36','Mon Mar 18 21:50:58 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(252,'36','Mon Mar 18 21:52:23 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(253,'36','Tue Mar 19 10:30:24 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(254,'36','Tue Mar 19 12:58:55 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(255,'36','Tue Mar 19 13:25:57 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(256,'36','Tue Mar 19 15:23:37 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(257,'36','Tue Mar 19 17:51:39 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(258,'36','Tue Mar 19 18:03:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(259,'36','Tue Mar 19 18:04:56 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(260,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(261,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(262,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(263,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(264,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(265,'36','Tue Mar 19 18:50:07 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(266,'36','Fri Mar 22 21:08:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(267,'36','Fri Mar 22 21:08:20 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(268,'36','Sat Mar 23 13:58:06 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(269,'36','Sun Mar 24 03:01:11 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(270,'36','Sun Mar 24 03:01:11 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(271,'36','Sun Mar 24 03:01:11 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(272,'42','Sun Mar 24 03:01:11 IST 2019','news',NULL),(273,'42','Sun Mar 24 03:01:11 IST 2019','news',NULL),(274,'36','Thu Mar 28 10:36:31 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(275,'36','Thu Apr 04 17:01:34 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(276,'36','Thu Apr 04 17:01:34 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(277,'36','Thu Apr 04 17:01:34 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(278,'36','Thu Apr 04 17:01:34 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(279,'36','Thu Apr 04 17:01:34 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(280,'36','Sun Apr 14 23:18:02 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(281,'36','Mon Apr 15 11:51:56 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(282,'36','Thu Apr 18 11:26:50 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(283,'36','Fri Apr 19 19:01:43 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(284,'36','Wed Apr 24 13:02:25 IST 2019','admin','Wed Apr 24 13:02:25 IST 2019'),(285,'47','Wed Apr 24 13:02:25 IST 2019','PROUser','Wed Apr 24 13:02:25 IST 2019'),(286,'47','Wed Apr 24 13:02:25 IST 2019','PROUser','Wed Apr 24 13:02:25 IST 2019'),(287,'47','Wed Apr 24 13:02:25 IST 2019','PROUser','Wed Apr 24 13:02:25 IST 2019'),(288,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(289,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(290,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(291,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(292,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(293,'44','Wed Apr 24 13:02:25 IST 2019','SUAdmin','Wed Apr 24 13:02:25 IST 2019'),(294,'44','Wed Apr 24 13:02:25 IST 2019','SUAdmin','Wed Apr 24 13:02:25 IST 2019'),(295,'45','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(296,'46','Wed Apr 24 13:02:25 IST 2019','DEPUser',NULL),(297,'44','Wed Apr 24 13:02:25 IST 2019','SUAdmin','Wed Apr 24 13:02:25 IST 2019'),(298,'48','Wed Apr 24 13:02:25 IST 2019','DEAdmin','Wed Apr 24 13:02:25 IST 2019'),(299,'49','Wed Apr 24 13:02:25 IST 2019','DEAdmin',NULL),(300,'36','Wed Apr 24 13:02:25 IST 2019','admin',NULL),(301,'36','Fri May 10 11:44:50 IST 2019','admin',NULL),(302,'36','Mon May 13 12:10:41 IST 2019','admin',NULL),(303,'36','Mon May 13 12:29:15 IST 2019','admin',NULL),(304,'36','Mon May 13 13:00:04 IST 2019','admin',NULL),(305,'36','Mon May 13 13:00:04 IST 2019','admin',NULL),(306,'36','Mon May 13 13:00:04 IST 2019','admin',NULL),(307,'36','Fri May 17 01:45:15 IST 2019','admin',NULL),(308,'36','Fri May 17 01:45:15 IST 2019','admin',NULL),(309,'36','Fri May 17 01:45:15 IST 2019','admin',NULL),(310,'36','Fri May 17 01:45:15 IST 2019','admin',NULL),(311,'36','Fri May 17 01:45:15 IST 2019','admin',NULL),(312,'36','Thu Jun 06 11:59:32 IST 2019','admin',NULL),(313,'36','Thu Jun 06 11:59:32 IST 2019','admin',NULL),(314,'36','Thu Jun 06 11:59:32 IST 2019','admin',NULL),(315,'36','Thu Jun 06 11:59:32 IST 2019','admin',NULL),(316,'36','Fri Sep 06 00:12:55 PDT 2019','admin',NULL),(317,'36','Fri Sep 06 00:12:55 PDT 2019','admin',NULL),(318,'36','Fri Sep 06 01:31:31 PDT 2019','admin',NULL),(319,'36','Fri Sep 06 22:32:06 PDT 2019','admin',NULL),(320,'36','Fri Sep 06 22:32:06 PDT 2019','admin',NULL),(321,'36','Fri Sep 06 23:14:42 PDT 2019','admin',NULL),(322,'36','Fri Sep 06 23:21:32 PDT 2019','admin',NULL),(323,'36','Fri Sep 06 23:25:48 PDT 2019','admin',NULL),(324,'36','Sat Sep 07 00:12:25 PDT 2019','admin',NULL),(325,'36','Sat Sep 07 00:33:47 PDT 2019','admin',NULL),(326,'36','Sat Sep 07 00:36:14 PDT 2019','admin',NULL),(327,'36','Sat Sep 07 04:09:56 PDT 2019','admin',NULL),(328,'36','Sat Sep 07 04:09:56 PDT 2019','admin',NULL),(329,'36','Sat Sep 07 11:19:41 PDT 2019','admin',NULL),(330,'36','Sat Sep 07 22:33:43 PDT 2019','admin',NULL),(331,'36','Sat Sep 07 22:33:43 PDT 2019','admin',NULL),(332,'36','Sat Sep 07 22:33:43 PDT 2019','admin',NULL),(333,'36','Sun Sep 08 00:54:05 PDT 2019','admin',NULL),(334,'36','Mon Sep 09 02:46:18 PDT 2019','admin',NULL),(335,'36','Mon Sep 09 02:51:16 PDT 2019','admin',NULL),(336,'36','Mon Sep 09 02:51:16 PDT 2019','admin',NULL),(337,'36','Mon Sep 09 03:04:03 PDT 2019','admin',NULL),(338,'36','Mon Sep 09 03:11:17 PDT 2019','admin',NULL),(339,'36','Mon Sep 09 03:16:15 PDT 2019','admin',NULL),(340,'36','Mon Sep 09 03:19:39 PDT 2019','admin',NULL),(341,'36','Mon Sep 09 03:29:59 PDT 2019','admin',NULL),(342,'36','Mon Sep 09 03:37:56 PDT 2019','admin',NULL),(343,'36','Mon Sep 09 03:40:44 PDT 2019','admin',NULL),(344,'36','Mon Sep 09 03:46:39 PDT 2019','admin',NULL),(345,'36','Mon Sep 09 03:49:48 PDT 2019','admin',NULL),(346,'36','Mon Sep 16 03:57:12 PDT 2019','admin',NULL),(347,'36','Mon Sep 16 05:36:47 PDT 2019','admin',NULL),(348,'36','Mon Sep 16 22:46:32 PDT 2019','admin',NULL),(349,'36','Tue Sep 17 00:34:37 PDT 2019','admin',NULL),(350,'36','Tue Sep 17 04:29:33 PDT 2019','admin',NULL),(351,'36','Tue Sep 17 06:06:17 PDT 2019','admin',NULL),(352,'36','Tue Sep 17 06:47:19 PDT 2019','admin',NULL),(353,'36','Tue Sep 17 23:07:24 PDT 2019','admin',NULL),(354,'36','Tue Sep 17 23:31:42 PDT 2019','admin',NULL),(355,'36','Wed Sep 18 00:01:07 PDT 2019','admin',NULL),(356,'36','Wed Sep 18 00:02:20 PDT 2019','admin',NULL),(357,'36','Wed Sep 18 00:07:00 PDT 2019','admin',NULL),(358,'36','Wed Sep 18 00:10:34 PDT 2019','admin',NULL),(359,'36','Wed Sep 18 00:16:49 PDT 2019','admin',NULL),(360,'36','Wed Sep 18 00:27:55 PDT 2019','admin',NULL),(361,'36','Wed Sep 18 00:36:22 PDT 2019','admin',NULL),(362,'36','Wed Sep 18 01:14:30 PDT 2019','admin',NULL),(363,'36','Wed Sep 18 01:14:30 PDT 2019','admin',NULL),(364,'36','Wed Sep 18 01:14:30 PDT 2019','admin',NULL),(365,'36','Wed Sep 18 02:45:40 PDT 2019','admin',NULL),(366,'36','Wed Sep 18 02:54:48 PDT 2019','admin',NULL),(367,'36','Wed Sep 18 03:42:27 PDT 2019','admin',NULL),(368,'36','Wed Sep 18 03:55:44 PDT 2019','admin',NULL),(369,'36','Wed Sep 18 04:07:25 PDT 2019','admin',NULL),(370,'36','Wed Sep 18 04:24:46 PDT 2019','admin',NULL),(371,'36','Wed Sep 18 04:34:45 PDT 2019','admin',NULL),(372,'36','Wed Sep 18 06:06:39 PDT 2019','admin',NULL),(373,'36','Wed Sep 18 06:17:05 PDT 2019','admin',NULL),(374,'36','Wed Sep 18 06:26:43 PDT 2019','admin',NULL),(375,'36','Wed Sep 18 06:32:47 PDT 2019','admin',NULL),(376,'36','Wed Sep 18 22:57:33 PDT 2019','admin',NULL),(377,'36','Wed Sep 18 22:57:33 PDT 2019','admin',NULL),(378,'36','Wed Sep 18 23:28:19 PDT 2019','admin',NULL),(379,'36','Thu Sep 19 00:04:28 PDT 2019','admin',NULL),(380,'36','Thu Sep 19 00:24:28 PDT 2019','admin',NULL),(381,'36','Thu Sep 19 00:50:59 PDT 2019','admin',NULL),(382,'36','Thu Sep 19 01:07:24 PDT 2019','admin',NULL),(383,'36','Thu Sep 19 01:07:24 PDT 2019','admin',NULL),(384,'36','Thu Sep 19 02:59:42 PDT 2019','admin',NULL),(385,'36','Thu Sep 19 02:59:42 PDT 2019','admin',NULL),(386,'36','Thu Sep 19 02:59:42 PDT 2019','admin',NULL),(387,'36','Thu Sep 19 05:34:11 PDT 2019','admin',NULL),(388,'36','Thu Sep 19 05:34:11 PDT 2019','admin',NULL),(389,'36','Thu Sep 19 23:17:59 PDT 2019','admin',NULL),(390,'36','Sat Sep 21 01:19:57 PDT 2019','admin',NULL),(391,'36','Sat Sep 21 02:57:28 PDT 2019','admin',NULL),(392,'36','Sat Sep 21 03:59:13 PDT 2019','admin',NULL),(393,'36','Sat Sep 21 04:21:31 PDT 2019','admin',NULL),(394,'36','Sat Sep 21 04:21:31 PDT 2019','admin',NULL),(395,'36','Sat Sep 21 04:31:35 PDT 2019','admin',NULL),(396,'36','Sat Sep 21 04:42:10 PDT 2019','admin',NULL),(397,'36','Sat Sep 21 05:03:38 PDT 2019','admin',NULL),(398,'36','Sat Sep 21 05:07:33 PDT 2019','admin',NULL),(399,'36','Sat Sep 21 05:07:33 PDT 2019','admin',NULL),(400,'36','Wed Nov 27 15:15:58 IST 2019','admin',NULL),(401,'36','Thu Nov 28 13:22:53 IST 2019','admin',NULL),(402,'36','Thu Nov 28 13:28:24 IST 2019','admin',NULL),(403,'36','Thu Nov 28 13:35:30 IST 2019','admin',NULL),(404,'36','Thu Nov 28 13:40:35 IST 2019','admin',NULL),(405,'36','Thu Nov 28 14:39:42 IST 2019','admin',NULL),(406,'36','Thu Nov 28 14:39:42 IST 2019','admin',NULL),(407,'36','Thu Nov 28 14:39:42 IST 2019','admin',NULL),(408,'36','Thu Nov 28 18:03:51 IST 2019','admin',NULL),(409,'36','Fri Nov 29 10:34:47 IST 2019','admin',NULL),(410,'36','Fri Nov 29 12:58:18 IST 2019','admin',NULL),(411,'36','Fri Nov 29 13:06:17 IST 2019','admin',NULL),(412,'36','Fri Nov 29 13:26:01 IST 2019','admin',NULL),(413,'36','Fri Nov 29 13:30:12 IST 2019','admin',NULL),(414,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(415,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(416,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(417,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(418,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(419,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(420,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(421,'36','Fri Nov 29 15:01:13 IST 2019','admin',NULL),(422,'36','Fri Nov 29 15:59:34 IST 2019','admin',NULL),(423,'36','Fri Nov 29 16:03:12 IST 2019','admin',NULL),(424,'36','Fri Nov 29 16:03:12 IST 2019','admin',NULL),(425,'36','Fri Nov 29 16:03:12 IST 2019','admin',NULL),(426,'36','Fri Nov 29 16:03:12 IST 2019','admin',NULL),(427,'36','Fri Nov 29 16:19:24 IST 2019','admin',NULL),(428,'36','Fri Nov 29 16:19:24 IST 2019','admin',NULL),(429,'36','Fri Nov 29 16:19:24 IST 2019','admin',NULL),(430,'36','Fri Nov 29 16:26:01 IST 2019','admin',NULL),(431,'36','Fri Nov 29 17:09:12 IST 2019','admin',NULL),(432,'36','Fri Nov 29 17:09:12 IST 2019','admin',NULL),(433,'36','Fri Nov 29 17:29:06 IST 2019','admin',NULL),(434,'36','Fri Nov 29 17:29:06 IST 2019','admin',NULL),(435,'36','Fri Nov 29 17:44:59 IST 2019','admin',NULL),(436,'36','Fri Nov 29 17:50:22 IST 2019','admin',NULL),(437,'36','Fri Nov 29 17:57:48 IST 2019','admin',NULL),(438,'36','Sat Nov 30 11:59:34 IST 2019','admin',NULL),(439,'36','Sat Nov 30 12:17:35 IST 2019','admin',NULL),(440,'36','Sat Nov 30 12:24:37 IST 2019','admin',NULL),(441,'36','Sat Nov 30 12:35:40 IST 2019','admin',NULL),(442,'36','Sat Nov 30 12:35:40 IST 2019','admin',NULL),(443,'36','Sat Nov 30 12:35:40 IST 2019','admin',NULL),(444,'36','Sat Nov 30 15:35:34 IST 2019','admin',NULL),(445,'36','Tue Dec 03 11:40:22 IST 2019','admin',NULL),(446,'36','Tue Dec 03 12:45:16 IST 2019','admin',NULL),(447,'36','Tue Dec 03 12:45:16 IST 2019','admin',NULL),(448,'36','Tue Dec 03 12:45:16 IST 2019','admin',NULL),(449,'36','Tue Dec 03 12:45:16 IST 2019','admin',NULL),(450,'36','Tue Dec 03 12:45:16 IST 2019','admin',NULL),(451,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(452,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(453,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(454,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(455,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(456,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(457,'36','Tue Dec 03 17:50:00 IST 2019','admin',NULL),(458,'36','Tue Dec 03 18:04:42 IST 2019','admin',NULL),(459,'36','Tue Dec 03 18:04:42 IST 2019','admin',NULL),(460,'36','Tue Dec 03 18:04:42 IST 2019','admin',NULL),(461,'36','Tue Dec 03 18:04:42 IST 2019','admin',NULL),(462,'36','Tue Dec 03 18:14:25 IST 2019','admin',NULL),(463,'36','Tue Dec 03 18:14:25 IST 2019','admin',NULL),(464,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(465,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(466,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(467,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(468,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(469,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(470,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(471,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(472,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(473,'36','Tue Dec 03 18:25:02 IST 2019','admin',NULL),(474,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(475,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(476,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(477,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(478,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(479,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(480,'36','Wed Dec 04 10:32:56 IST 2019','admin',NULL),(481,'36','Wed Dec 04 12:01:14 IST 2019','admin',NULL),(482,'36','Wed Dec 04 12:01:14 IST 2019','admin',NULL),(483,'36','Wed Dec 04 13:04:11 IST 2019','admin',NULL),(484,'36','Wed Dec 04 13:08:21 IST 2019','admin',NULL),(485,'36','Wed Dec 04 13:11:39 IST 2019','admin',NULL),(486,'36','Wed Dec 04 13:13:23 IST 2019','admin',NULL),(487,'36','Wed Dec 04 13:19:53 IST 2019','admin',NULL),(488,'36','Wed Dec 04 13:21:54 IST 2019','admin',NULL),(489,'36','Wed Dec 04 13:25:16 IST 2019','admin',NULL),(490,'36','Wed Dec 04 13:27:33 IST 2019','admin',NULL),(491,'36','Wed Dec 04 13:29:26 IST 2019','admin',NULL),(492,'36','Wed Dec 04 13:29:26 IST 2019','admin',NULL),(493,'36','Wed Dec 04 15:14:40 IST 2019','admin',NULL),(494,'36','Wed Dec 04 15:19:17 IST 2019','admin',NULL),(495,'36','Wed Dec 04 15:21:22 IST 2019','admin',NULL),(496,'36','Wed Dec 04 15:31:36 IST 2019','admin',NULL),(497,'36','Wed Dec 04 15:31:36 IST 2019','admin',NULL),(498,'36','Wed Dec 04 15:51:26 IST 2019','admin',NULL),(499,'36','Wed Dec 04 16:09:13 IST 2019','admin',NULL),(500,'36','Wed Dec 04 17:58:39 IST 2019','admin',NULL),(501,'36','Wed Dec 04 18:03:42 IST 2019','admin',NULL),(502,'36','Thu Dec 05 10:56:10 IST 2019','admin',NULL),(503,'36','Thu Dec 05 11:05:44 IST 2019','admin',NULL),(504,'36','Thu Dec 05 11:10:35 IST 2019','admin',NULL),(505,'36','Thu Dec 05 11:14:19 IST 2019','admin',NULL),(506,'36','Thu Dec 05 11:30:55 IST 2019','admin',NULL),(507,'36','Thu Dec 05 11:50:33 IST 2019','admin',NULL),(508,'36','Thu Dec 05 12:04:14 IST 2019','admin',NULL),(509,'36','Thu Dec 05 12:04:14 IST 2019','admin',NULL),(510,'36','Thu Dec 05 12:10:38 IST 2019','admin',NULL),(511,'36','Thu Dec 05 12:19:37 IST 2019','admin',NULL),(512,'36','Thu Dec 05 12:29:35 IST 2019','admin',NULL),(513,'36','Thu Dec 05 13:12:15 IST 2019','admin',NULL),(514,'36','Thu Dec 05 13:12:15 IST 2019','admin',NULL),(515,'36','Thu Dec 05 13:42:07 IST 2019','admin',NULL),(516,'36','Thu Dec 05 15:08:58 IST 2019','admin',NULL),(517,'36','Thu Dec 05 15:08:58 IST 2019','admin',NULL),(518,'36','Thu Dec 05 15:08:58 IST 2019','admin',NULL),(519,'36','Thu Dec 05 17:01:04 IST 2019','admin',NULL),(520,'36','Thu Dec 05 17:08:37 IST 2019','admin',NULL),(521,'36','Thu Dec 05 17:15:59 IST 2019','admin',NULL),(522,'36','Thu Dec 05 17:19:22 IST 2019','admin',NULL),(523,'36','Thu Dec 05 17:22:14 IST 2019','admin',NULL),(524,'36','Thu Dec 05 18:08:21 IST 2019','admin',NULL),(525,'36','Thu Dec 05 18:24:04 IST 2019','admin',NULL),(526,'36','Thu Dec 05 18:28:17 IST 2019','admin',NULL),(527,'36','Thu Dec 05 18:35:24 IST 2019','admin',NULL),(528,'36','Thu Dec 05 18:38:27 IST 2019','admin',NULL),(529,'36','Thu Dec 05 18:43:03 IST 2019','admin',NULL),(530,'36','Thu Dec 05 18:51:00 IST 2019','admin',NULL),(531,'36','Fri Dec 06 10:44:44 IST 2019','admin',NULL),(532,'36','Fri Dec 06 10:44:44 IST 2019','admin',NULL),(533,'36','Fri Dec 06 11:01:25 IST 2019','admin',NULL),(534,'36','Fri Dec 06 11:07:22 IST 2019','admin',NULL),(535,'36','Fri Dec 06 11:16:54 IST 2019','admin',NULL),(536,'36','Fri Dec 06 11:16:54 IST 2019','admin',NULL),(537,'36','Fri Dec 06 11:57:20 IST 2019','admin',NULL),(538,'36','Fri Dec 06 12:02:22 IST 2019','admin',NULL),(539,'36','Fri Dec 06 12:02:22 IST 2019','admin',NULL),(540,'36','Fri Dec 06 12:02:22 IST 2019','admin',NULL),(541,'36','Fri Dec 06 12:19:24 IST 2019','admin',NULL),(542,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(543,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(544,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(545,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(546,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(547,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(548,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(549,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(550,'36','Fri Dec 06 12:22:29 IST 2019','admin',NULL),(551,'36','Fri Dec 06 12:26:32 IST 2019','admin',NULL),(552,'36','Fri Dec 06 12:26:32 IST 2019','admin',NULL),(553,'36','Fri Dec 06 12:33:17 IST 2019','admin',NULL),(554,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(555,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(556,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(557,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(558,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(559,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(560,'36','Fri Dec 06 12:36:05 IST 2019','admin',NULL),(561,'36','Fri Dec 06 12:49:40 IST 2019','admin',NULL),(562,'36','Fri Dec 06 12:51:29 IST 2019','admin',NULL),(563,'36','Fri Dec 06 12:57:47 IST 2019','admin',NULL),(564,'36','Fri Dec 06 13:16:06 IST 2019','admin',NULL),(565,'36','Fri Dec 06 14:36:59 IST 2019','admin',NULL),(566,'36','Fri Dec 06 14:50:14 IST 2019','admin',NULL),(567,'36','Fri Dec 06 14:58:28 IST 2019','admin',NULL),(568,'36','Fri Dec 06 15:01:16 IST 2019','admin',NULL),(569,'36','Fri Dec 06 15:42:11 IST 2019','admin',NULL),(570,'36','Fri Dec 06 15:48:42 IST 2019','admin',NULL),(571,'36','Fri Dec 06 15:51:59 IST 2019','admin',NULL),(572,'36','Fri Dec 06 15:59:13 IST 2019','admin',NULL),(573,'36','Fri Dec 06 16:01:27 IST 2019','admin',NULL),(574,'36','Fri Dec 06 16:05:52 IST 2019','admin',NULL),(575,'36','Fri Dec 06 16:05:52 IST 2019','admin',NULL),(576,'36','Fri Dec 06 16:12:00 IST 2019','admin',NULL),(577,'36','Fri Dec 06 16:23:04 IST 2019','admin',NULL),(578,'36','Fri Dec 06 16:23:04 IST 2019','admin',NULL),(579,'36','Fri Dec 06 16:23:04 IST 2019','admin',NULL),(580,'36','Fri Dec 06 16:28:57 IST 2019','admin',NULL),(581,'36','Fri Dec 06 16:32:01 IST 2019','admin',NULL),(582,'36','Fri Dec 06 16:34:42 IST 2019','admin',NULL),(583,'36','Fri Dec 06 16:36:47 IST 2019','admin',NULL),(584,'36','Fri Dec 06 16:39:35 IST 2019','admin',NULL),(585,'36','Fri Dec 06 16:42:19 IST 2019','admin',NULL),(586,'36','Fri Dec 06 16:54:59 IST 2019','admin',NULL),(587,'36','Fri Dec 06 16:54:59 IST 2019','admin',NULL),(588,'36','Fri Dec 06 16:59:12 IST 2019','admin',NULL),(589,'36','Fri Dec 06 16:59:12 IST 2019','admin',NULL),(590,'36','Fri Dec 06 17:02:14 IST 2019','admin',NULL),(591,'36','Fri Dec 06 17:02:14 IST 2019','admin',NULL),(592,'36','Fri Dec 06 17:03:21 IST 2019','admin',NULL),(593,'36','Fri Dec 06 17:03:21 IST 2019','admin',NULL),(594,'36','Fri Dec 06 17:03:21 IST 2019','admin',NULL),(595,'36','Fri Dec 06 17:13:51 IST 2019','admin',NULL),(596,'36','Fri Dec 06 17:16:08 IST 2019','admin',NULL),(597,'36','Fri Dec 06 17:19:45 IST 2019','admin',NULL),(598,'36','Fri Dec 06 17:22:02 IST 2019','admin',NULL),(599,'36','Fri Dec 06 17:32:54 IST 2019','admin',NULL),(600,'36','Fri Dec 06 18:12:05 IST 2019','admin',NULL),(601,'36','Fri Dec 06 18:15:45 IST 2019','admin',NULL),(602,'36','Fri Dec 06 18:18:02 IST 2019','admin',NULL),(603,'36','Fri Dec 06 18:18:02 IST 2019','admin',NULL),(604,'36','Fri Dec 06 18:40:11 IST 2019','admin',NULL),(605,'36','Fri Dec 06 18:43:46 IST 2019','admin',NULL),(606,'36','Fri Dec 06 18:46:25 IST 2019','admin',NULL),(607,'36','Fri Dec 06 18:51:54 IST 2019','admin',NULL),(608,'36','Fri Dec 06 18:53:01 IST 2019','admin',NULL),(609,'36','Sat Dec 07 10:47:02 IST 2019','admin',NULL),(610,'36','Sat Dec 07 16:55:22 IST 2019','admin',NULL),(611,'36','Sat Dec 07 17:46:52 IST 2019','admin',NULL),(612,'36','Sat Dec 07 17:46:52 IST 2019','admin',NULL),(613,'36','Sat Dec 07 17:46:52 IST 2019','admin',NULL),(614,'36','Sat Dec 07 17:46:52 IST 2019','admin',NULL),(615,'36','Sat Dec 07 17:46:52 IST 2019','admin',NULL),(616,'36','Sat Dec 07 18:43:38 IST 2019','admin',NULL),(617,'36','Mon Dec 09 23:23:25 PST 2019','admin',NULL),(618,'36','Thu Dec 12 21:22:13 PST 2019','admin',NULL),(619,'36','Thu Dec 12 21:22:13 PST 2019','admin',NULL),(620,'36','Thu Dec 12 21:22:13 PST 2019','admin',NULL),(621,'36','Thu Dec 12 21:22:13 PST 2019','admin',NULL),(622,'36','Mon Dec 16 22:00:06 PST 2019','admin',NULL),(623,'36','Mon Dec 16 22:00:06 PST 2019','admin',NULL),(624,'36','Mon Dec 16 22:00:06 PST 2019','admin',NULL),(625,'36','Sun Dec 22 17:27:47 PST 2019','admin',NULL),(626,'36','Thu Dec 26 01:45:38 PST 2019','admin',NULL),(627,'36','Tue Dec 31 23:56:20 PST 2019','admin',NULL),(628,'36','Wed Jan 01 00:07:01 PST 2020','admin',NULL),(629,'36','Wed Jan 01 00:07:01 PST 2020','admin',NULL),(630,'36','Wed Jan 01 11:04:53 PST 2020','admin',NULL),(631,'36','Mon Jan 06 05:04:01 PST 2020','admin',NULL),(632,'36','Sun Jan 12 23:47:22 PST 2020','admin',NULL),(633,'36','Sun Jan 12 23:47:22 PST 2020','admin',NULL),(634,'36','Wed Feb 12 05:21:20 PST 2020','admin',NULL),(635,'36','Sun Mar 01 21:23:39 PST 2020','admin',NULL),(636,'36','Sun Mar 01 21:23:39 PST 2020','admin',NULL),(637,'36','Mon Jun 01 02:13:41 PDT 2020','admin',NULL),(638,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(639,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(640,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(641,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(642,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(643,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(644,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(645,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(646,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(647,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(648,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(649,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(650,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(651,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(652,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(653,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(654,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(655,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(656,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(657,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(658,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(659,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(660,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(661,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(662,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(663,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(664,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(665,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(666,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(667,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(668,'36','Fri Jun 19 05:27:27 PDT 2020','admin',NULL),(669,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(670,'36','Thu Jun 25 22:37:59 PDT 2020','admin',NULL),(671,'36','Tue Jun 23 00:10:43 PDT 2020','admin',NULL),(672,'36','Thu Jun 25 22:37:59 PDT 2020','admin',NULL),(673,'36','Thu Jun 25 22:37:59 PDT 2020','admin',NULL),(674,'36','Fri Jun 26 11:32:34 IST 2020','admin',NULL),(675,'36','Fri Jun 26 12:02:07 IST 2020','admin',NULL),(676,'36','Fri Jun 26 12:02:07 IST 2020','admin',NULL),(677,'36','Fri Jun 26 12:02:07 IST 2020','admin',NULL),(678,'36','Fri Jun 26 12:02:07 IST 2020','admin',NULL),(679,'36','Sun Jun 28 15:44:48 IST 2020','admin',NULL),(680,'36','Mon Jun 29 12:02:39 IST 2020','admin',NULL),(681,'36','Wed Jul 01 16:40:09 IST 2020','admin',NULL),(682,'36','Wed Jul 01 16:40:09 IST 2020','admin',NULL),(683,'36','Wed Jul 01 16:40:09 IST 2020','admin',NULL),(684,'36','Wed Jul 01 16:40:09 IST 2020','admin',NULL),(685,'36','Thu Jul 02 11:48:03 IST 2020','admin',NULL),(686,'36','Thu Jul 02 11:48:03 IST 2020','admin',NULL),(687,'36','Thu Jul 02 14:24:04 IST 2020','admin',NULL),(688,'36','Thu Jul 02 14:24:04 IST 2020','admin',NULL),(689,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(690,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(691,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(692,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(693,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(694,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(695,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(696,'36','Thu Jul 02 18:51:26 IST 2020','admin',NULL),(697,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(698,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(699,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(700,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(701,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(702,'36','Fri Jul 03 16:22:09 IST 2020','admin',NULL),(703,'36','Fri Jul 03 19:16:27 IST 2020','admin',NULL),(704,'36','Fri Jul 03 19:16:27 IST 2020','admin',NULL),(705,'36','Fri Jul 03 19:16:27 IST 2020','admin',NULL),(706,'36','Sat Jul 04 19:28:21 IST 2020','admin',NULL),(707,'36','Mon Jul 06 15:17:01 IST 2020','admin',NULL),(708,'36','Mon Jul 06 18:32:21 IST 2020','admin',NULL),(709,'36','Mon Jul 06 18:32:21 IST 2020','admin',NULL),(710,'36','Mon Jul 06 18:32:21 IST 2020','admin',NULL),(711,'36','Mon Jul 06 18:32:21 IST 2020','admin',NULL),(712,'36','Mon Jul 06 18:32:21 IST 2020','admin',NULL),(713,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(714,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(715,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(716,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(717,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(718,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(719,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(720,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(721,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(722,'36','Wed Jul 08 16:52:23 IST 2020','admin',NULL),(723,'36','Fri Jul 10 18:13:25 IST 2020','admin',NULL),(724,'36','Fri Jul 10 18:13:25 IST 2020','admin',NULL),(725,'36','Fri Jul 10 18:13:25 IST 2020','admin',NULL),(726,'36','Fri Jul 10 18:13:25 IST 2020','admin',NULL),(727,'36','Sat Jul 11 15:58:33 IST 2020','admin',NULL),(728,'36','Sat Jul 11 15:58:33 IST 2020','admin',NULL),(729,'36','Sat Jul 11 15:58:33 IST 2020','admin',NULL),(730,'36','Sat Jul 11 15:58:33 IST 2020','admin',NULL),(731,'36','Sat Jul 11 15:58:33 IST 2020','admin',NULL),(732,'36','Tue Jul 14 12:32:47 IST 2020','admin',NULL),(733,'36','Tue Jul 14 12:32:47 IST 2020','admin',NULL),(734,'36','Fri Jul 17 14:36:42 IST 2020','admin',NULL),(735,'36','Fri Jul 17 14:36:42 IST 2020','admin',NULL),(736,'36','Sat Jul 18 16:57:35 IST 2020','admin',NULL),(737,'36','Sat Jul 18 16:57:35 IST 2020','admin',NULL),(738,'36','Mon Jul 20 18:05:16 IST 2020','admin',NULL),(739,'36','Mon Jul 20 18:05:16 IST 2020','admin',NULL),(740,'36','Fri Jul 24 17:50:29 IST 2020','admin',NULL),(741,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(742,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(743,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(744,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(745,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(746,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(747,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(748,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(749,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(750,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(751,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(752,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(753,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(754,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(755,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(756,'36','Sat Jul 25 12:10:14 IST 2020','admin',NULL),(757,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(758,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(759,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(760,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(761,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(762,'36','Thu Jul 30 14:56:12 IST 2020','admin',NULL),(763,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(764,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(765,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(766,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(767,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(768,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(769,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(770,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(771,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(772,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(773,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(774,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(775,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(776,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(777,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(778,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(779,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(780,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(781,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(782,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(783,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(784,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(785,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(786,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(787,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(788,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(789,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(790,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(791,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(792,'36','Thu Jul 30 19:06:54 IST 2020','admin',NULL),(793,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(794,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(795,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(796,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(797,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(798,'50','Fri Jul 31 17:58:04 IST 2020','db',NULL),(799,'50','Fri Jul 31 17:58:04 IST 2020','db',NULL),(800,'50','Fri Jul 31 17:58:04 IST 2020','db',NULL),(801,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(802,'50','Fri Jul 31 17:58:04 IST 2020','db',NULL),(803,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(804,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(805,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(806,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(807,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(808,'36','Fri Jul 31 17:58:04 IST 2020','admin',NULL),(809,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(810,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(811,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(812,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(813,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(814,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(815,'36','Mon Aug 03 19:20:33 IST 2020','admin',NULL),(816,'36','Tue Aug 04 19:58:27 IST 2020','admin',NULL),(817,'36','Tue Aug 04 19:58:27 IST 2020','admin',NULL),(818,'36','Tue Aug 04 19:58:27 IST 2020','admin',NULL),(819,'36','Tue Aug 04 19:58:27 IST 2020','admin',NULL),(820,'36','Wed Aug 05 18:05:00 IST 2020','admin',NULL),(821,'36','Wed Aug 05 18:21:56 IST 2020','admin',NULL),(822,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(823,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(824,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(825,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(826,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(827,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(828,'36','Wed Aug 05 19:39:17 IST 2020','admin',NULL),(829,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(830,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(831,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(832,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(833,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(834,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(835,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(836,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(837,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(838,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(839,'36','Thu Aug 06 15:49:47 IST 2020','admin',NULL),(840,'36','Fri Aug 07 19:56:06 IST 2020','admin',NULL),(841,'36','Fri Aug 07 19:56:06 IST 2020','admin',NULL),(842,'36','Fri Aug 07 19:56:06 IST 2020','admin',NULL),(843,'36','Fri Aug 07 19:56:06 IST 2020','admin',NULL),(844,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(845,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(846,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(847,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(848,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(849,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(850,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(851,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(852,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(853,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(854,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(855,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(856,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(857,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(858,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(859,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(860,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(861,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(862,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(863,'36','Sat Aug 08 18:59:05 IST 2020','admin',NULL),(864,'36','Tue Aug 11 20:06:33 IST 2020','admin',NULL),(865,'36','Tue Aug 11 20:06:33 IST 2020','admin',NULL),(866,'36','Tue Aug 11 20:06:33 IST 2020','admin',NULL),(867,'36','Tue Aug 11 20:06:33 IST 2020','admin',NULL),(868,'36','Thu Aug 13 11:33:37 IST 2020','admin',NULL),(869,'36','Thu Aug 13 11:33:37 IST 2020','admin',NULL),(870,'36','Thu Aug 13 11:33:37 IST 2020','admin',NULL),(871,'36','Fri Aug 14 15:00:53 IST 2020','admin',NULL),(872,'36','Fri Aug 14 15:00:53 IST 2020','admin',NULL),(873,'36','Fri Aug 14 15:00:53 IST 2020','admin',NULL),(874,'36','Fri Aug 14 15:00:53 IST 2020','admin',NULL),(875,'36','Tue Aug 18 12:28:32 IST 2020','admin',NULL),(876,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(877,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(878,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(879,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(880,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(881,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(882,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(883,'36','Wed Aug 19 17:16:46 IST 2020','admin',NULL),(884,'36','Thu Aug 20 20:16:17 IST 2020','admin',NULL),(885,'36','Thu Aug 20 20:16:17 IST 2020','admin',NULL),(886,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(887,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(888,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(889,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(890,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(891,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(892,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(893,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(894,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(895,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(896,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(897,'36','Fri Aug 21 09:09:21 IST 2020','admin',NULL),(898,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(899,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(900,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(901,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(902,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(903,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(904,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(905,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(906,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(907,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(908,'52','Wed Aug 26 13:54:43 IST 2020','archana',NULL),(909,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(910,'52','Wed Aug 26 13:54:43 IST 2020','archana',NULL),(911,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(912,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(913,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(914,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(915,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(916,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(917,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(918,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(919,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(920,'51','Wed Aug 26 13:54:43 IST 2020','User1',NULL),(921,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(922,'36','Wed Aug 26 13:54:43 IST 2020','admin',NULL),(923,'51','Wed Aug 26 15:40:24 IST 2020','User1',NULL),(924,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(925,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(926,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(927,'51','Wed Aug 26 15:40:24 IST 2020','User1',NULL),(928,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(929,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(930,'51','Wed Aug 26 15:40:24 IST 2020','User1',NULL),(931,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(932,'53','Wed Aug 26 15:40:24 IST 2020','User2',NULL),(933,'53','Wed Aug 26 15:40:24 IST 2020','User2',NULL),(934,'53','Wed Aug 26 15:40:24 IST 2020','User2',NULL),(935,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(936,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(937,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(938,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(939,'36','Wed Aug 26 15:40:24 IST 2020','admin',NULL),(940,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(941,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(942,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(943,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(944,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(945,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(946,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(947,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(948,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(949,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(950,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(951,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(952,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(953,'36','Thu Aug 27 13:29:21 IST 2020','admin',NULL),(954,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(955,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(956,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(957,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(958,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(959,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(960,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(961,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(962,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(963,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(964,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(965,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(966,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(967,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(968,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(969,'54','Fri Aug 28 11:11:11 IST 2020','yashashree',NULL),(970,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(971,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(972,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(973,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(974,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(975,'54','Fri Aug 28 11:11:11 IST 2020','yashashree',NULL),(976,'54','Fri Aug 28 11:11:11 IST 2020','yashashree',NULL),(977,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(978,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(979,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(980,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(981,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(982,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(983,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(984,'36','Fri Aug 28 11:11:11 IST 2020','admin',NULL),(985,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(986,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(987,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(988,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(989,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(990,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(991,'36','Sat Aug 29 11:07:43 IST 2020','admin',NULL),(992,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(993,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(994,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(995,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(996,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(997,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(998,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(999,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1000,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1001,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1002,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1003,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1004,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1005,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1006,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1007,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1008,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1009,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1010,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1011,'51','Sat Aug 29 19:36:28 IST 2020','User1',NULL),(1012,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1013,'51','Sat Aug 29 19:36:28 IST 2020','User1',NULL),(1014,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1015,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1016,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1017,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1018,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1019,'51','Sat Aug 29 19:36:28 IST 2020','User1',NULL),(1020,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1021,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1022,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1023,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1024,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1025,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1026,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1027,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1028,'36','Sat Aug 29 19:36:28 IST 2020','admin',NULL),(1029,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1030,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1031,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1032,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1033,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1034,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1035,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1036,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1037,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1038,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1039,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1040,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1041,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1042,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1043,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1044,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1045,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1046,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1047,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1048,'36','Thu Sep 03 11:25:12 IST 2020','admin',NULL),(1049,'51','Thu Sep 03 11:25:12 IST 2020','User1',NULL),(1050,'51','Thu Sep 03 11:25:12 IST 2020','User1',NULL),(1051,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1052,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1053,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1054,'51','Fri Sep 04 10:47:48 IST 2020','User1',NULL),(1055,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1056,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1057,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1058,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1059,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1060,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1061,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1062,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1063,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1064,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1065,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1066,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1067,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1068,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1069,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1070,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1071,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1072,'36','Fri Sep 04 10:47:48 IST 2020','admin',NULL),(1073,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1074,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1075,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1076,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1077,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1078,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1079,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1080,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1081,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1082,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1083,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1084,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1085,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1086,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1087,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1088,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1089,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1090,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1091,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1092,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1093,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1094,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1095,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1096,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1097,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1098,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1099,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1100,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1101,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1102,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1103,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1104,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1105,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1106,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1107,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1108,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1109,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1110,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1111,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1112,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1113,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1114,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1115,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1116,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1117,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1118,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1119,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1120,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1121,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1122,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1123,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1124,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1125,'55','Sat Sep 05 19:05:51 IST 2020','ravina',NULL),(1126,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1127,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1128,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1129,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1130,'36','Sat Sep 05 19:05:51 IST 2020','admin',NULL),(1131,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1132,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1133,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1134,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1135,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1136,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1137,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1138,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1139,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1140,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1141,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1142,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1143,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1144,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1145,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1146,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1147,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1148,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1149,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1150,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1151,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1152,'51','Tue Sep 08 13:01:16 IST 2020','User1',NULL),(1153,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1154,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1155,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1156,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1157,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1158,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1159,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1160,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1161,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1162,'36','Tue Sep 08 13:01:16 IST 2020','admin',NULL),(1163,'36','Thu Sep 10 19:19:05 IST 2020','admin',NULL),(1164,'36','Fri Sep 11 10:46:43 IST 2020','admin',NULL),(1165,'36','Fri Sep 11 10:46:43 IST 2020','admin',NULL),(1166,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1167,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1168,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1169,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1170,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1171,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1172,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1173,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1174,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1175,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1176,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1177,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1178,'36','Fri Sep 11 17:14:15 IST 2020','admin',NULL),(1179,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1180,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1181,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1182,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1183,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1184,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1185,'36','Mon Sep 14 19:07:45 IST 2020','admin',NULL),(1186,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1187,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1188,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1189,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1190,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1191,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1192,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1193,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1194,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1195,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1196,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1197,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1198,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1199,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1200,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1201,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1202,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1203,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1204,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1205,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1206,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1207,'36','Tue Sep 15 16:18:08 IST 2020','admin',NULL),(1208,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1209,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1210,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1211,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1212,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1213,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1214,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1215,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1216,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1217,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1218,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1219,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1220,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1221,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1222,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1223,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1224,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1225,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1226,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1227,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1228,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1229,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1230,'51','Thu Sep 17 11:38:49 IST 2020','User1',NULL),(1231,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1232,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1233,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1234,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1235,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1236,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1237,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1238,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1239,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1240,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1241,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1242,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1243,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1244,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1245,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1246,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1247,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1248,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1249,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1250,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1251,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1252,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1253,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1254,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1255,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1256,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1257,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1258,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1259,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1260,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1261,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1262,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1263,'36','Thu Sep 17 11:38:49 IST 2020','admin',NULL),(1264,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1265,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1266,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1267,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1268,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1269,'36','Tue Sep 22 12:32:41 IST 2020','admin',NULL),(1270,'36','Tue Sep 22 16:34:06 IST 2020','admin',NULL),(1271,'36','Tue Sep 22 16:34:06 IST 2020','admin',NULL),(1272,'36','Tue Sep 22 16:34:06 IST 2020','admin',NULL),(1273,'36','Tue Sep 22 16:34:06 IST 2020','admin',NULL),(1274,'36','Wed Sep 30 10:50:11 IST 2020','admin',NULL),(1275,'36','Wed Sep 30 10:50:11 IST 2020','admin',NULL),(1276,'36','Wed Sep 30 10:50:11 IST 2020','admin',NULL),(1277,'36','Wed Sep 30 20:18:15 IST 2020','admin',NULL),(1278,'36','Thu Oct 01 12:20:12 IST 2020','admin',NULL),(1279,'36','Sat Oct 03 19:35:30 IST 2020','admin',NULL),(1280,'36','Sat Oct 03 19:35:30 IST 2020','admin',NULL),(1281,'36','Wed Oct 14 12:14:19 IST 2020','admin',NULL),(1282,'36','Wed Oct 14 12:14:19 IST 2020','admin',NULL),(1283,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1284,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1285,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1286,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1287,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1288,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1289,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1290,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1291,'36','Sat Oct 17 20:20:19 IST 2020','admin',NULL),(1292,'36','Tue Oct 20 11:00:59 IST 2020','admin',NULL),(1293,'36','Tue Oct 20 11:00:59 IST 2020','admin',NULL),(1294,'36','Tue Oct 20 11:00:59 IST 2020','admin',NULL),(1295,'36','Tue Oct 20 11:00:59 IST 2020','admin',NULL),(1296,'36','Tue Oct 20 17:07:21 IST 2020','admin',NULL),(1297,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1298,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1299,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1300,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1301,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1302,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1303,'36','Thu Oct 22 19:22:40 IST 2020','admin',NULL),(1304,'36','Fri Oct 23 15:46:06 IST 2020','admin',NULL),(1305,'36','Fri Oct 23 15:46:06 IST 2020','admin',NULL),(1306,'36','Fri Oct 23 15:46:06 IST 2020','admin',NULL),(1307,'36','Fri Oct 23 15:46:06 IST 2020','admin',NULL),(1308,'36','Fri Oct 23 15:46:06 IST 2020','admin',NULL),(1309,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1310,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1311,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1312,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1313,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1314,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1315,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1316,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1317,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1318,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1319,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1320,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1321,'36','Mon Oct 26 11:25:10 IST 2020','admin',NULL),(1322,'36','Tue Nov 10 12:02:15 IST 2020','admin',NULL),(1323,'36','Tue Nov 24 12:07:55 IST 2020','admin',NULL),(1324,'36','Tue Nov 24 12:07:55 IST 2020','admin',NULL),(1325,'36','Tue Nov 24 12:07:55 IST 2020','admin',NULL),(1326,'36','Tue Nov 24 12:07:55 IST 2020','admin',NULL),(1327,'36','Sat Nov 28 18:46:05 IST 2020','admin',NULL),(1328,'36','Sat Nov 28 18:46:05 IST 2020','admin',NULL),(1329,'36','Sat Nov 28 18:46:05 IST 2020','admin',NULL),(1330,'36','Mon Dec 07 15:52:17 IST 2020','admin',NULL),(1331,'36','Mon Dec 14 12:29:15 IST 2020','admin',NULL),(1332,'36','Mon Dec 28 14:45:37 IST 2020','admin',NULL),(1333,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1334,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1335,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1336,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1337,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1338,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1339,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1340,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1341,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1342,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1343,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1344,'36','Thu Dec 31 17:55:49 IST 2020','admin',NULL),(1345,'36','Mon Jan 04 16:01:04 IST 2021','admin',NULL),(1346,'36','Tue Jan 05 11:38:17 IST 2021','admin',NULL),(1347,'36','Tue Jan 05 11:38:17 IST 2021','admin',NULL),(1348,'36','Tue Jan 05 11:38:17 IST 2021','admin',NULL),(1349,'36','Tue Jan 05 12:27:53 IST 2021','admin',NULL),(1350,'36','Tue Jan 05 14:41:00 IST 2021','admin',NULL),(1351,'36','Tue Jan 05 14:41:00 IST 2021','admin',NULL),(1352,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1353,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1354,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1355,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1356,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1357,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1358,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1359,'36','Fri Jan 08 11:45:50 IST 2021','admin',NULL),(1360,'36','Tue Jan 12 11:30:42 IST 2021','admin',NULL),(1361,'36','Tue Jan 12 11:30:42 IST 2021','admin',NULL),(1362,'36','Tue Jan 12 11:30:42 IST 2021','admin',NULL),(1363,'36','Tue Jan 12 11:30:42 IST 2021','admin',NULL),(1364,'36','Tue Jan 12 11:30:42 IST 2021','admin',NULL),(1365,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1366,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1367,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1368,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1369,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1370,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1371,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1372,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1373,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1374,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1375,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1376,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1377,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1378,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1379,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1380,'36','Thu Jan 14 15:26:32 IST 2021','admin',NULL),(1381,'36','Sun Jan 17 21:35:30 IST 2021','admin',NULL),(1382,'36','Sun Jan 17 21:45:47 IST 2021','admin',NULL),(1383,'36','Sun Jan 17 21:45:47 IST 2021','admin',NULL),(1384,'36','Sun Jan 17 21:45:47 IST 2021','admin',NULL),(1385,'36','Sun Jan 17 21:45:47 IST 2021','admin',NULL),(1386,'36','Sun Jan 17 21:45:47 IST 2021','admin',NULL),(1387,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1388,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1389,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1390,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1391,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1392,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1393,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1394,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1395,'36','Mon Jan 18 16:28:58 IST 2021','admin',NULL),(1396,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1397,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1398,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1399,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1400,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1401,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1402,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1403,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1404,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1405,'36','Thu Jan 21 22:26:43 IST 2021','admin',NULL),(1406,'36','Fri Jan 22 23:05:39 IST 2021','admin',NULL);
/*!40000 ALTER TABLE `tbl_userlogininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_video`
--

DROP TABLE IF EXISTS `tbl_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `title_h` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `link` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_video`
--

LOCK TABLES `tbl_video` WRITE;
/*!40000 ALTER TABLE `tbl_video` DISABLE KEYS */;
INSERT INTO `tbl_video` VALUES (4,'Ring Road','रिंग रोड','A',36,'2020-08-06 15-49-45','https://www.youtube.com/embed/bOTKemntuZg'),(5,'test','test','D',36,'2020-08-06 15-49-45','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/M3OpPbALIL8\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),(6,'An Introduction to PMRDA','पीएमआरडीएचा परिचय','A',36,'2020-08-06 15-49-45','https://www.youtube.com/embed/M3OpPbALIL8'),(7,'PMRDA Town Planning Scheme','पीएमआरडीए नगर रचना योजना','A',36,'2020-08-06 15-49-45','https://www.youtube.com/embed/pDHFlQ0mZmM'),(8,'VIP room','abc','D',36,'2020-08-08 18-59-03','b');
/*!40000 ALTER TABLE `tbl_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_visitor_counter`
--

DROP TABLE IF EXISTS `tbl_visitor_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_visitor_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `datewise_count` int(11) DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_visitor_counter`
--

LOCK TABLES `tbl_visitor_counter` WRITE;
/*!40000 ALTER TABLE `tbl_visitor_counter` DISABLE KEYS */;
INSERT INTO `tbl_visitor_counter` VALUES (5,'2020-07-30',45,45),(6,'2020-07-31',173,218),(7,'2020-08-01',53,271),(8,'2020-08-03',20,291),(9,'2020-08-04',42,333),(10,'2020-08-05',30,363),(11,'2020-08-06',26,389),(12,'2020-08-07',52,441),(13,'2020-08-08',7,448),(15,'2020-08-09',1,449),(16,'2020-08-10',37,486),(17,'2020-08-11',32,518),(18,'2020-08-12',14,532),(19,'2020-08-13',50,582),(20,'2020-08-14',6,588),(21,'2020-08-16',1,589),(22,'2020-08-17',9,598),(23,'2020-08-18',13,611),(24,'2020-08-19',11,622),(25,'2020-08-20',34,656),(26,'2020-08-21',5,661),(27,'2020-08-23',5,666),(28,'2020-08-24',14,680),(29,'2020-08-25',20,700),(30,'2020-08-26',77,777),(31,'2020-08-27',64,841),(32,'2020-08-28',221,1062),(33,'2020-08-29',67,1129),(34,'2020-08-31',121,1250),(35,'2020-09-01',12,1262),(36,'2020-09-02',96,1358),(37,'2020-09-03',157,1515),(38,'2020-09-04',221,1736),(39,'2020-09-05',20,1756),(40,'2020-09-06',8,1764),(41,'2020-09-07',208,1972),(42,'2020-09-08',119,2091),(43,'2020-09-09',83,2174),(44,'2020-09-10',97,2271),(45,'2020-09-11',77,2348),(46,'2020-09-12',23,2371),(47,'2020-09-14',30,2401),(48,'2020-09-15',86,2487),(49,'2020-09-16',24,2511),(50,'2020-09-17',38,2549),(51,'2020-09-18',4,2553),(52,'2020-09-19',8,2561),(53,'2020-09-20',1,2562),(54,'2020-09-21',50,2612),(55,'2020-09-22',50,2662),(56,'2020-09-23',2,2664),(57,'2020-09-24',9,2673),(58,'2020-09-25',30,2703),(59,'2020-09-28',3,2706),(60,'2020-09-29',15,2721),(61,'2020-09-30',34,2755),(62,'2020-10-01',10,2765),(63,'2020-10-02',1,2766),(64,'2020-10-03',5,2771),(65,'2020-10-05',22,2793),(66,'2020-10-06',5,2798),(67,'2020-10-07',16,2814),(68,'2020-10-09',22,2836),(69,'2020-10-10',1,2837),(70,'2020-10-12',35,2872),(71,'2020-10-13',78,2950),(73,'2020-10-14',82,3032),(74,'2020-10-17',66,3098),(75,'2020-10-19',71,3169),(76,'2020-10-20',17,3186),(77,'2020-10-21',23,3209),(78,'2020-10-22',3,3212),(79,'2020-10-23',68,3280),(80,'2020-10-24',6,3286),(81,'2020-10-26',71,3357),(82,'2020-10-27',10,3367),(83,'2020-10-28',9,3376),(84,'2020-10-29',8,3384),(85,'2020-11-01',1,3385),(86,'2020-11-03',5,3390),(87,'2020-11-04',3,3393),(88,'2020-11-05',3,3396),(89,'2020-11-06',8,3404),(90,'2020-11-08',7,3411),(91,'2020-11-09',18,3429),(92,'2020-11-10',1,3430),(93,'2020-11-11',3,3433),(94,'2020-11-12',2,3435),(95,'2020-11-14',1,3436),(96,'2020-11-17',2,3438),(97,'2020-11-23',6,3444),(98,'2020-11-24',2,3446),(99,'2020-11-25',9,3455),(100,'2020-11-26',15,3470),(101,'2020-11-27',9,3479),(102,'2020-11-30',3,3482),(103,'2020-12-01',5,3487),(104,'2020-12-02',3,3490),(105,'2020-12-03',4,3494),(106,'2020-12-04',3,3497),(107,'2020-12-07',4,3501),(108,'2020-12-08',3,3504),(109,'2020-12-09',2,3506),(110,'2020-12-10',4,3510),(111,'2020-12-11',10,3520),(112,'2020-12-14',4,3524),(113,'2020-12-15',2,3526),(114,'2020-12-17',1,3527),(115,'2020-12-19',3,3530),(117,'2020-12-21',2,3532),(118,'2020-12-22',2,3534),(119,'2020-12-24',3,3537),(120,'2020-12-28',1,3538),(121,'2020-12-29',1,3539),(122,'2020-12-30',5,3544),(123,'2020-12-31',215,3759),(124,'2021-01-01',7,3766),(125,'2021-01-04',5,3771),(126,'2021-01-05',9,3780),(127,'2021-01-06',2,3782),(128,'2021-01-08',6,3788),(129,'2021-01-09',6,3794),(130,'2021-01-11',1,3795),(131,'2021-01-11',1,3795),(132,'2021-01-12',3,3798),(133,'2021-01-14',15,3813),(134,'2021-01-15',26,3839),(135,'2021-01-16',22,3861),(136,'2021-01-17',2,3863),(137,'2021-01-18',18,3881),(138,'2021-01-19',11,3892),(139,'2021-01-20',3,3895),(140,'2021-01-21',10,3905),(141,'2021-01-22',1039,4944);
/*!40000 ALTER TABLE `tbl_visitor_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tender_department`
--

DROP TABLE IF EXISTS `tender_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tender_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `state` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(15) CHARACTER SET utf8 DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(15) CHARACTER SET utf8 DEFAULT '0',
  `dept_name_h` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tender_department`
--

LOCK TABLES `tender_department` WRITE;
/*!40000 ALTER TABLE `tender_department` DISABLE KEYS */;
INSERT INTO `tender_department` VALUES (27,'Engineering Department','Engineering Department','A','2019-01-24','36',NULL,'0','अभियांत्रिकी विभाग'),(28,'Building Permission Department','Building Permission Department','A','2019-01-24','36',NULL,'0','इमारत परवानगी विभाग'),(29,'Planning Department','Planning Department','A','2019-01-24','36',NULL,'0','नियोजन विभाग'),(30,'Illegal Construction Department','Illegal Construction Department','A','2019-01-24','36',NULL,'0','बेकायदेशीर बांधकाम विभाग'),(31,'Land and Estate Department','Land and Estate Department','A','2019-01-24','36',NULL,'0','जमीन व मालमत्ता विभाग'),(32,'Accounts and Finance Department','Accounts and Finance Department','A','2019-01-24','36',NULL,'0','लेखा आणि वित्त विभाग'),(33,'Administration Department','Administration Department','A','2019-01-24','36',NULL,'0','प्रशासन विभाग'),(34,'Centre for Excellence','Centre for Excellence','A','2019-01-24','36',NULL,'0','उत्कृष्टतेसाठी केंद्र'),(35,'Private and Foreign Direct Investment Department','Private and Foreign Direct Investment Department','A','2019-01-24','36',NULL,'0','खाजगी आणि परकीय थेट गुंतवणूक विभाग'),(36,'Fire Department','Fire Department','A','2019-01-24','36',NULL,'0','अग्निशमन विभाग'),(38,'abc','xcv','D','2020-08-11','36',NULL,'0','abc'),(39,'eee','test','D','2020-08-28','36',NULL,'0','ईई'),(40,'test','test','D','2020-09-15','36',NULL,'0','test'),(41,'f','f','D','2020-09-21','36',NULL,'0','f');
/*!40000 ALTER TABLE `tender_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL,
  `PERMISSION_ID` bigint(20) DEFAULT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(150) COLLATE utf8_unicode_ci DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(150) COLLATE utf8_unicode_ci DEFAULT '0',
  `STATUS` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'D',
  PRIMARY KEY (`ID`),
  KEY `FK_PERMISSION` (`PERMISSION_ID`),
  KEY `FK_USER` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_PERMISSION` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (178,51,17,'2020-08-26','36',NULL,'0','A'),(179,51,18,'2020-08-26','36',NULL,'0','A'),(180,51,19,'2020-08-26','36',NULL,'0','A'),(181,51,20,'2020-08-26','36',NULL,'0','A'),(182,51,6,'2020-08-26','36',NULL,'0','A'),(183,51,7,'2020-08-26','36',NULL,'0','A'),(184,51,8,'2020-08-26','36',NULL,'0','A'),(185,51,9,'2020-08-26','36',NULL,'0','A'),(186,51,10,'2020-08-26','36',NULL,'0','A'),(187,51,11,'2020-08-26','36',NULL,'0','A'),(188,51,12,'2020-08-26','36',NULL,'0','A'),(189,51,13,'2020-08-26','36',NULL,'0','A'),(190,53,17,'2020-08-26','36',NULL,'0','A'),(191,53,18,'2020-08-26','36',NULL,'0','A'),(192,53,19,'2020-08-26','36',NULL,'0','A'),(193,53,20,'2020-08-26','36',NULL,'0','A'),(194,53,6,'2020-08-26','36',NULL,'0','A'),(195,53,7,'2020-08-26','36',NULL,'0','A'),(196,53,8,'2020-08-26','36',NULL,'0','A'),(197,53,9,'2020-08-26','36',NULL,'0','A'),(198,53,10,'2020-08-26','36',NULL,'0','A'),(199,53,11,'2020-08-26','36',NULL,'0','A'),(200,53,12,'2020-08-26','36',NULL,'0','A'),(201,53,13,'2020-08-26','36',NULL,'0','A'),(202,53,21,'2020-08-26','36',NULL,'0','A'),(203,53,22,'2020-08-26','36',NULL,'0','A'),(204,53,23,'2020-08-26','36',NULL,'0','A'),(205,53,24,'2020-08-26','36',NULL,'0','A'),(206,53,25,'2020-08-26','36',NULL,'0','A'),(207,53,26,'2020-08-26','36',NULL,'0','A'),(208,53,27,'2020-08-26','36',NULL,'0','A'),(209,53,28,'2020-08-26','36',NULL,'0','A'),(210,53,29,'2020-08-26','36',NULL,'0','A'),(211,53,30,'2020-08-26','36',NULL,'0','A'),(212,53,31,'2020-08-26','36',NULL,'0','A'),(213,53,32,'2020-08-26','36',NULL,'0','A'),(214,53,33,'2020-08-26','36',NULL,'0','A'),(215,54,17,'2020-08-28','36',NULL,'0','A'),(216,54,18,'2020-08-28','36',NULL,'0','A'),(217,54,19,'2020-08-28','36',NULL,'0','A'),(218,54,20,'2020-08-28','36',NULL,'0','A'),(219,51,21,'2020-08-31','36',NULL,'0','A'),(220,51,22,'2020-08-31','36',NULL,'0','A'),(221,51,23,'2020-08-31','36',NULL,'0','A'),(222,51,24,'2020-08-31','36',NULL,'0','A'),(223,51,30,'2020-08-31','36',NULL,'0','A'),(224,51,31,'2020-08-31','36',NULL,'0','A'),(225,51,32,'2020-08-31','36',NULL,'0','A'),(226,51,33,'2020-08-31','36',NULL,'0','A'),(227,51,25,'2020-08-31','36',NULL,'0','A'),(228,51,26,'2020-08-31','36',NULL,'0','A'),(229,51,27,'2020-08-31','36',NULL,'0','A'),(230,51,28,'2020-08-31','36',NULL,'0','A'),(231,51,29,'2020-08-31','36',NULL,'0','A'),(232,55,17,'2020-09-07','36',NULL,'0','A'),(233,55,18,'2020-09-07','36',NULL,'0','A'),(234,55,19,'2020-09-07','36',NULL,'0','A'),(235,55,20,'2020-09-07','36',NULL,'0','A'),(236,55,6,'2020-09-07','36',NULL,'0','A'),(237,55,7,'2020-09-07','36',NULL,'0','A'),(238,55,8,'2020-09-07','36',NULL,'0','A'),(239,55,9,'2020-09-07','36',NULL,'0','A'),(240,55,10,'2020-09-07','36',NULL,'0','A'),(241,55,11,'2020-09-07','36',NULL,'0','A'),(242,55,12,'2020-09-07','36',NULL,'0','A'),(243,55,13,'2020-09-07','36',NULL,'0','A'),(244,55,21,'2020-09-07','36',NULL,'0','A'),(245,55,22,'2020-09-07','36',NULL,'0','A'),(246,55,23,'2020-09-07','36',NULL,'0','A'),(247,55,24,'2020-09-07','36',NULL,'0','A'),(248,55,25,'2020-09-07','36',NULL,'0','A'),(249,55,26,'2020-09-07','36',NULL,'0','A'),(250,55,27,'2020-09-07','36',NULL,'0','A'),(251,55,28,'2020-09-07','36',NULL,'0','A'),(252,55,29,'2020-09-07','36',NULL,'0','A'),(253,55,30,'2020-09-07','36',NULL,'0','A'),(254,55,31,'2020-09-07','36',NULL,'0','A'),(255,55,32,'2020-09-07','36',NULL,'0','A'),(256,55,33,'2020-09-07','36',NULL,'0','A');
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(155) DEFAULT NULL,
  `FIRST_NAME` varchar(150) DEFAULT NULL,
  `LAST_NAME` varchar(150) DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  `EMAIL` varchar(150) DEFAULT NULL,
  `ADDRESS` varchar(150) DEFAULT NULL,
  `MOBILE_NO` varchar(150) DEFAULT NULL,
  `CONTACT_NO` varchar(150) DEFAULT NULL,
  `PASSWORD` varchar(150) NOT NULL,
  `CREATED_ON` date DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT '0',
  `MODIFIED_ON` date DEFAULT NULL,
  `MODIFIED_BY` varchar(45) DEFAULT '0',
  `STATE` varchar(150) DEFAULT NULL,
  `pass_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (36,'admin','Akshay','Khatu',23,'akshaykhatu3@gmail.com','pachad','7756929045','7756929045','$2a$10$HPnfDWYRfOcL.OLtNFQrVOuwVl7m/32OInVAcBCAy48FuslwaPhLC','2018-10-25','2',NULL,'0','A','PERMANENT'),(51,'User1','Dev','B',24,'bhatt.devashish@gmail.com','xyz','8087399845','8087399845','$2a$10$y6clASYcm9J1RNr7kbiUQeX1tgNJWTGKpVGfbm6XD26c4p8GO80PS','2020-08-26','36',NULL,'0','A','PERMANENT'),(52,'archana','Archana','Shinde',24,'archanawpt1@gmail.com','Pune','8830048975','8909878909','$2a$10$SIO/gDT/yyi0QQjaZSWWR.Q72mK8vgDuzifqK//q4qLYRzLoz23hm','2020-08-26','36',NULL,'0','A','PERMANENT'),(53,'User2','Ravina','Sonawane',24,'ravinassonawane@gmail.com','pune','8830641410','9146129514','$2a$10$2cufhvj8jiTzSFxlVFJlc.9Caz0J36Okn8k/D6STt2x/uUJ3hDtxC','2020-08-26','36',NULL,'0','D','PERMANENT'),(54,'yashashree','yashashree&lt;script&gt;alert(1)&lt;/script&gt;','m',24,'yashashreecse@gmail.com','pune','9970292531','9970292531','$2a$10$1sTWYY9aIi4AT7y5EoU7aukIBLmAmQISan7ZD2UrpXdA4Ji96A2py','2020-08-28','36',NULL,'0','A','TEMPORARY'),(55,'ravina<script>alert(\"xss1\")</script>','Ravina<script>alert(1)</script>','Sonawane<script>alert(\"15thJan xss2\")</script>',24,'ravinassonawane@gmail.com','pune<script>alert(\"xss3\")</script>','8830641410','9146129514','$2a$10$VR.y7OqZaDAL7UfdTDbDsO.qvFTd2xORkzpWzADMVKd0edu2/MLNG','2020-09-07','36',NULL,'0','D','PERMANENT');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 23:07:05
