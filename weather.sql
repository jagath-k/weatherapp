-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: weather
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `banglore`
--

DROP TABLE IF EXISTS `banglore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banglore` (
  `date` date DEFAULT NULL,
  `sunrise` varchar(30) DEFAULT NULL,
  `sunset` varchar(30) DEFAULT NULL,
  `temparature` varchar(30) DEFAULT NULL,
  `humidity` varchar(30) DEFAULT NULL,
  `pressure` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banglore`
--

LOCK TABLES `banglore` WRITE;
/*!40000 ALTER TABLE `banglore` DISABLE KEYS */;
INSERT INTO `banglore` VALUES ('2023-05-01','05:44 AM','06:49 PM','29','54','1005'),('2023-05-02','05:43 AM','06:50 PM','28','67','1006');
/*!40000 ALTER TABLE `banglore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delhi`
--

DROP TABLE IF EXISTS `delhi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delhi` (
  `date` date DEFAULT NULL,
  `sunrise` varchar(30) DEFAULT NULL,
  `sunset` varchar(30) DEFAULT NULL,
  `temparature` varchar(30) DEFAULT NULL,
  `humidity` varchar(30) DEFAULT NULL,
  `pressure` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delhi`
--

LOCK TABLES `delhi` WRITE;
/*!40000 ALTER TABLE `delhi` DISABLE KEYS */;
INSERT INTO `delhi` VALUES ('2023-05-01','05:41 AM','06:56 PM','24','59','1007'),('2023-05-02','05:40 AM','06:57 PM','25','73','1009');
/*!40000 ALTER TABLE `delhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goa`
--

DROP TABLE IF EXISTS `goa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goa` (
  `date` date DEFAULT NULL,
  `sunrise` varchar(30) DEFAULT NULL,
  `sunset` varchar(30) DEFAULT NULL,
  `temparature` varchar(30) DEFAULT NULL,
  `humidity` varchar(30) DEFAULT NULL,
  `pressure` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goa`
--

LOCK TABLES `goa` WRITE;
/*!40000 ALTER TABLE `goa` DISABLE KEYS */;
INSERT INTO `goa` VALUES ('2023-05-01','06:11 AM','06:52 PM','29','79','1007'),('2023-05-02','06:10 AM','06:52 PM','29','81','1008');
/*!40000 ALTER TABLE `goa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mumbai`
--

DROP TABLE IF EXISTS `mumbai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mumbai` (
  `date` date DEFAULT NULL,
  `sunrise` varchar(30) DEFAULT NULL,
  `sunset` varchar(30) DEFAULT NULL,
  `temparature` varchar(30) DEFAULT NULL,
  `humidity` varchar(30) DEFAULT NULL,
  `pressure` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mumbai`
--

LOCK TABLES `mumbai` WRITE;
/*!40000 ALTER TABLE `mumbai` DISABLE KEYS */;
INSERT INTO `mumbai` VALUES ('2023-05-01','06:11 AM','07:01 PM','29','67','1007'),('2023-05-02','06:10 AM','07:01 PM','29','63','1008');
/*!40000 ALTER TABLE `mumbai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES (1,'jagathgamer001@gmail.com','devil'),(2,'jagadeeshkbncollege@gmail.com','yamini'),(3,'jagadeesh2425.k@gmail.com','jaggu1'),(4,'jagath.official.1@gmail.com','official'),(5,'noorjahanshaik9990@gmail.com','noor'),(6,'jagadeeshdev09@gmail.com','dev123'),(7,'yamini.adduri12@gmail.com','yams'),(8,'206541@siddharthamahila.ac.in','one'),(9,'avinashtungala35@gmail.com','avi'),(10,'asudheerios@gmail.com','ask@123');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vijayawada`
--

DROP TABLE IF EXISTS `vijayawada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vijayawada` (
  `date` date DEFAULT NULL,
  `sunrise` varchar(30) DEFAULT NULL,
  `sunset` varchar(30) DEFAULT NULL,
  `temparature` varchar(30) DEFAULT NULL,
  `humidity` varchar(30) DEFAULT NULL,
  `pressure` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vijayawada`
--

LOCK TABLES `vijayawada` WRITE;
/*!40000 ALTER TABLE `vijayawada` DISABLE KEYS */;
INSERT INTO `vijayawada` VALUES ('2023-05-01','05:43 AM','06:26 PM','25','83','1007'),('2023-05-02','05:43 AM','06:27 PM','27','89','1010');
/*!40000 ALTER TABLE `vijayawada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02 15:57:08
