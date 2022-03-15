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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Members'),(2,'Moderator');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (34,1,28),(29,1,35),(36,1,39),(30,1,42),(35,1,43),(31,1,46),(32,1,49),(33,1,50),(1,2,25),(2,2,26),(3,2,27),(4,2,28),(5,2,29),(6,2,30),(7,2,31),(8,2,32),(9,2,33),(10,2,34),(11,2,35),(12,2,36),(13,2,37),(14,2,38),(15,2,39),(16,2,40),(17,2,41),(18,2,42),(19,2,43),(20,2,44),(21,2,45),(22,2,46),(23,2,47),(24,2,48),(25,2,49),(26,2,50),(27,2,51),(28,2,52);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',3,'add_logentry'),(2,'Can change log entry',3,'change_logentry'),(3,'Can delete log entry',3,'delete_logentry'),(4,'Can view log entry',3,'view_logentry'),(5,'Can add permission',4,'add_permission'),(6,'Can change permission',4,'change_permission'),(7,'Can delete permission',4,'delete_permission'),(8,'Can view permission',4,'view_permission'),(9,'Can add group',5,'add_group'),(10,'Can change group',5,'change_group'),(11,'Can delete group',5,'delete_group'),(12,'Can view group',5,'view_group'),(13,'Can add user',6,'add_user'),(14,'Can change user',6,'change_user'),(15,'Can delete user',6,'delete_user'),(16,'Can view user',6,'view_user'),(17,'Can add content type',1,'add_contenttype'),(18,'Can change content type',1,'change_contenttype'),(19,'Can delete content type',1,'delete_contenttype'),(20,'Can view content type',1,'view_contenttype'),(21,'Can add session',2,'add_session'),(22,'Can change session',2,'change_session'),(23,'Can delete session',2,'delete_session'),(24,'Can view session',2,'view_session'),(25,'Can add category model',7,'add_categorymodel'),(26,'Can change category model',7,'change_categorymodel'),(27,'Can delete category model',7,'delete_categorymodel'),(28,'Can view category model',7,'view_categorymodel'),(29,'Add category',7,'can_add_category'),(30,'Update category',7,'can_update_category'),(31,'Delete category',7,'can_delete_category'),(32,'Can add topic model',8,'add_topicmodel'),(33,'Can change topic model',8,'change_topicmodel'),(34,'Can delete topic model',8,'delete_topicmodel'),(35,'Can view topic model',8,'view_topicmodel'),(36,'Add topic',8,'can_add_topic'),(37,'Update topic',8,'can_update_topic'),(38,'Delete topic',8,'can_delete_topic'),(39,'Can add themes model',9,'add_themesmodel'),(40,'Can change themes model',9,'change_themesmodel'),(41,'Can delete themes model',9,'delete_themesmodel'),(42,'Can view themes model',9,'view_themesmodel'),(43,'Add theme',9,'can_add_theme'),(44,'Update theme',9,'can_update_theme'),(45,'Delete theme',9,'can_delete_theme'),(46,'Can add messages model',10,'add_messagesmodel'),(47,'Can change messages model',10,'change_messagesmodel'),(48,'Can delete messages model',10,'delete_messagesmodel'),(49,'Can view messages model',10,'view_messagesmodel'),(50,'Add message',10,'can_add_message'),(51,'Update message',10,'can_update_message'),(52,'Delete message',10,'can_delete_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$9SwoDdCuLIhq8EzntHeNiq$XyvnSY45o2u/PeLvxySbciyDZ6dhyH0DZbkD+viqRXI=','2022-03-15 12:26:01.155162',1,'admin','','','dan.bylgakov79@gmail.com',1,1,'2022-03-15 10:29:03.364315'),(2,'pbkdf2_sha256$320000$nNh4TvNXp55b9mPFw5FZEz$ZoyElLvMovjPGObKADyP/sMFO9VcvheUvWyresCnzFk=','2022-03-15 12:35:10.358151',0,'ivan','','','',0,1,'2022-03-15 10:32:48.000000'),(3,'pbkdf2_sha256$320000$fZ8RlJyOThgKKh9Ha7eNka$TJPLFYVQIZHnJ26r8SMGb+u/y/czTuaqJ0QED5VTSmY=','2022-03-15 12:24:29.386853',0,'peter','','','',0,1,'2022-03-15 10:35:54.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Автомобили','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ixbt.com%2Fnews%2F2022%2F02%2F25%2Fceny-na-avtomobili-v-rossii-skoro-vzletjat-na-20.html&psig=AOvVaw2FV4qlgaNLZdb_vN5bG7oe&ust=1646665625077000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNC1sdDhsfYCFQAAAAAdAAAAABAD'),(2,'Видеоигры','https://www.google.com/url?sa=i&url=https%3A%2F%2Fobrmos.ru%2Fnews%2Fgames%2Fnews_games_002.html&psig=AOvVaw22vM8KdX7WdXguS_cqWpKM&ust=1646665658026000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjEhODhsfYCFQAAAAAdAAAAABAD'),(3,'IT','https://www.google.com/url?sa=i&url=https%3A%2F%2Fklever.blog%2Ftypes-of-it-companies%2F&psig=AOvVaw08lqauA7wf6G8Kd-SdZ3KQ&ust=1646665677012000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNDegunhsfYCFQAAAAAdAAAAABAD'),(8,'Экономика','2');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crudapp_categorymodel`
--

DROP TABLE IF EXISTS `crudapp_categorymodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crudapp_categorymodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Content` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crudapp_categorymodel`
--

LOCK TABLES `crudapp_categorymodel` WRITE;
/*!40000 ALTER TABLE `crudapp_categorymodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `crudapp_categorymodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-15 10:31:43.139935','1','Members',1,'[{\"added\": {}}]',5,1),(2,'2022-03-15 10:32:48.311693','2','ivan',1,'[{\"added\": {}}]',6,1),(3,'2022-03-15 10:33:55.628305','2','ivan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(4,'2022-03-15 10:35:03.304531','2','Moderator',1,'[{\"added\": {}}]',5,1),(5,'2022-03-15 10:35:54.888887','3','peter',1,'[{\"added\": {}}]',6,1),(6,'2022-03-15 10:36:08.195818','3','peter',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(7,'2022-03-15 10:36:37.566560','2','ivan',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',6,1),(8,'2022-03-15 10:36:43.477276','2','ivan',2,'[]',6,1),(9,'2022-03-15 11:49:21.415165','2','Moderator',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',5,1),(10,'2022-03-15 11:50:07.912212','1','Members',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',5,1),(11,'2022-03-15 11:54:22.558010','2','Moderator',2,'[]',5,1),(12,'2022-03-15 12:22:36.885844','2','Moderator',2,'[]',5,1),(13,'2022-03-15 12:23:47.352018','1','Members',2,'[]',5,1),(14,'2022-03-15 12:26:41.293541','1','Members',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',5,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'auth','user'),(1,'contenttypes','contenttype'),(7,'crudapp','categorymodel'),(10,'messagesapp','messagesmodel'),(2,'sessions','session'),(9,'themesapp','themesmodel'),(8,'topicapp','topicmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-15 10:07:19.652616'),(2,'sessions','0001_initial','2022-03-15 10:14:41.168963'),(3,'auth','0001_initial','2022-03-15 10:21:15.075380'),(4,'admin','0001_initial','2022-03-15 10:21:15.235403'),(5,'admin','0002_logentry_remove_auto_add','2022-03-15 10:21:15.251397'),(6,'admin','0003_logentry_add_action_flag_choices','2022-03-15 10:21:15.263383'),(7,'contenttypes','0002_remove_content_type_name','2022-03-15 10:26:43.544903'),(8,'auth','0002_alter_permission_name_max_length','2022-03-15 10:26:43.623490'),(9,'auth','0003_alter_user_email_max_length','2022-03-15 10:26:43.663788'),(10,'auth','0004_alter_user_username_opts','2022-03-15 10:26:43.670824'),(11,'auth','0005_alter_user_last_login_null','2022-03-15 10:26:43.748971'),(12,'auth','0006_require_contenttypes_0002','2022-03-15 10:26:43.765038'),(13,'auth','0007_alter_validators_add_error_messages','2022-03-15 10:26:43.780688'),(14,'auth','0008_alter_user_username_max_length','2022-03-15 10:26:43.864201'),(15,'auth','0009_alter_user_last_name_max_length','2022-03-15 10:26:43.937750'),(16,'auth','0010_alter_group_name_max_length','2022-03-15 10:26:43.969457'),(17,'auth','0011_update_proxy_permissions','2022-03-15 10:26:43.985111'),(18,'auth','0012_alter_user_first_name_max_length','2022-03-15 10:26:44.064761'),(19,'crudapp','0001_initial','2022-03-15 10:26:44.094935');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('slzmm1qv6obamnvchfpm3w13eso23gej','.eJxVjMsOwiAQRf-FtSECw8ul-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rdOxZI6J0ChjFLGQIxgRYpUwIEEiE56Y5QuGpMWoCEXZzP54kXxngx7fwDV6zeP:1nU6OM:8Rm238NnWIwJmFF9_Qe4IU7H2GLHpdzKp3of3MGYG2A','2022-03-29 12:35:10.362223');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,3,1,'NaViGGaTOR2005','JOPA'),(2,3,1,1,'NaViGGaTOR2005','JOPA'),(3,1,2,2,'ivan','dasdas');
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
  `Category` int DEFAULT NULL,
  `Topic` int NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Themes_ID_uindex` (`ID`),
  KEY `themes_category__fk` (`Category`),
  KEY `themes_topic__fk` (`Topic`),
  CONSTRAINT `themes_category__fk` FOREIGN KEY (`Category`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `themes_topic__fk` FOREIGN KEY (`Topic`) REFERENCES `topic` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,3,1,'Java','1'),(2,1,2,'Шины','1'),(3,3,3,'Биткоин',NULL),(4,2,4,'Battlefield',NULL),(5,2,5,'Limbo',NULL),(6,1,6,'Цены',NULL),(8,3,1,'C#','1'),(16,1,2,'Руль','1');
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
  `Content` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Topic_ID_uindex` (`ID`),
  KEY `topic_category__fk` (`Category`),
  CONSTRAINT `topic_category__fk` FOREIGN KEY (`Category`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,3,'Веб-разработка','1'),(2,1,'Пижо','1'),(3,3,'Крипта',NULL),(4,2,'Шутеры',NULL),(5,2,'Инди',NULL),(6,1,'Тойта','https://www.google.com/url?sa=i&url=https%3A%2F%2F1prime.ru%2Farticles%2F20171228%2F828306883.html&psig=AOvVaw2BxNb6SDsLsAwKnb9SX1-C&ust=1646740721682000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiViLD5s_YCFQAAAAAdAAAAABAD'),(8,1,'БМВ','2'),(11,8,'Макроэкономика','2');
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

-- Dump completed on 2022-03-15 15:37:56
