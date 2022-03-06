-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Content` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Category_ID_uindex` (`ID`),
  UNIQUE KEY `Category_Name_uindex` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Автомобили','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ixbt.com%2Fnews%2F2022%2F02%2F25%2Fceny-na-avtomobili-v-rossii-skoro-vzletjat-na-20.html&psig=AOvVaw2FV4qlgaNLZdb_vN5bG7oe&ust=1646665625077000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNC1sdDhsfYCFQAAAAAdAAAAABAD'),(2,'Видеоигры','https://www.google.com/url?sa=i&url=https%3A%2F%2Fobrmos.ru%2Fnews%2Fgames%2Fnews_games_002.html&psig=AOvVaw22vM8KdX7WdXguS_cqWpKM&ust=1646665658026000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjEhODhsfYCFQAAAAAdAAAAABAD'),(3,'IT','https://www.google.com/url?sa=i&url=https%3A%2F%2Fklever.blog%2Ftypes-of-it-companies%2F&psig=AOvVaw08lqauA7wf6G8Kd-SdZ3KQ&ust=1646665677012000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNDegunhsfYCFQAAAAAdAAAAABAD');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Category` int NOT NULL,
  `Topic` int NOT NULL,
  `Themes` int NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Text` varchar(1024) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Messages_ID_uindex` (`ID`),
  KEY `messages_category__fk` (`Category`),
  KEY `messages_themes__fk` (`Themes`),
  KEY `messages_topic__fk` (`Topic`),
  CONSTRAINT `messages_category__fk` FOREIGN KEY (`Category`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_themes__fk` FOREIGN KEY (`Themes`) REFERENCES `themes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_topic__fk` FOREIGN KEY (`Topic`) REFERENCES `topic` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,3,1,'NaViGGaTOR2005','JOPA');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Category` int NOT NULL,
  `Topic` int NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Themes_ID_uindex` (`ID`),
  KEY `themes_category__fk` (`Category`),
  KEY `themes_topic__fk` (`Topic`),
  CONSTRAINT `themes_category__fk` FOREIGN KEY (`Category`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `themes_topic__fk` FOREIGN KEY (`Topic`) REFERENCES `topic` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,3,1,'С#',NULL),(2,1,2,'Запчасти',NULL),(3,3,3,'Биткоин',NULL),(4,2,4,'Battlefield',NULL),(5,2,5,'Limbo',NULL),(6,1,6,'Цены',NULL);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Category` int NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Content` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Topic_ID_uindex` (`ID`),
  KEY `topic_category__fk` (`Category`),
  CONSTRAINT `topic_category__fk` FOREIGN KEY (`Category`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,3,'Разработка',NULL),(2,1,'Рено',NULL),(3,3,'Крипта',NULL),(4,2,'Шутеры',NULL),(5,2,'Инди',NULL),(6,1,'Лада',NULL);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06 18:24:08
