-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (arm64)
--
-- Host: localhost    Database: stalion
-- ------------------------------------------------------
-- Server version	8.0.29

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Категория',7,'add_category'),(26,'Can change Категория',7,'change_category'),(27,'Can delete Категория',7,'delete_category'),(28,'Can view Категория',7,'view_category'),(29,'Can add Купон',8,'add_coupon'),(30,'Can change Купон',8,'change_coupon'),(31,'Can delete Купон',8,'delete_coupon'),(32,'Can view Купон',8,'view_coupon'),(33,'Can add Корзина покупателя',9,'add_profile'),(34,'Can change Корзина покупателя',9,'change_profile'),(35,'Can delete Корзина покупателя',9,'delete_profile'),(36,'Can view Корзина покупателя',9,'view_profile');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$dtGOLFFGo38FroGvPqxrtm$op5iZdzsWYA+/nVy3+6RiVDnwK8Qow6tu4vEZRugv20=','2022-05-29 08:06:21.634038',1,'admin','','','admin@mail.com',1,1,'2022-05-14 12:27:56.696752'),(2,'pbkdf2_sha256$320000$WkaQD7GYSRdxVPclsyUUhA$Dn/2wXh2nENHyJjJK9KoXOV7S1Q7OV1NEzxHrq4RTs4=','2022-05-14 13:06:04.521415',0,'david','','','david@mail.com',0,1,'2022-05-14 13:03:18.860617'),(3,'pbkdf2_sha256$320000$Kz04ZdsNKIBbqUvzQQHCiA$tHXSDW1gCPLfgJZC3YqOL0ZGZ48pjkp/jJMrJ5yHrZU=','2022-05-29 08:08:27.019511',0,'tom','','','tom@gmail.com',0,1,'2022-05-29 08:08:18.057155');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-14 12:39:42.652027','1','Услуги',1,'[{\"added\": {}}]',7,1),(2,'2022-05-14 12:39:57.167371','2','Товары по купонам',1,'[{\"added\": {}}]',7,1),(3,'2022-05-14 12:40:08.686346','3','Красота',1,'[{\"added\": {}}]',7,1),(4,'2022-05-14 12:40:17.218648','4','Здоровье',1,'[{\"added\": {}}]',7,1),(5,'2022-05-14 12:40:26.054061','5','Еда',1,'[{\"added\": {}}]',7,1),(6,'2022-05-14 12:40:43.500685','6','Развлечения',1,'[{\"added\": {}}]',7,1),(7,'2022-05-14 12:40:55.701107','7','Электроника',1,'[{\"added\": {}}]',7,1),(8,'2022-05-14 12:41:10.838294','8','Бытовая техника',1,'[{\"added\": {}}]',7,1),(9,'2022-05-14 12:41:26.553992','9','Одежда',1,'[{\"added\": {}}]',7,1),(10,'2022-05-14 12:41:34.404054','9','Одежда',2,'[{\"changed\": {\"fields\": [\"Parent category\"]}}]',7,1),(11,'2022-05-14 12:42:09.636450','10','Цветы',1,'[{\"added\": {}}]',7,1),(12,'2022-05-14 12:42:23.485529','11','Телефоны',1,'[{\"added\": {}}]',7,1),(13,'2022-05-14 12:42:36.203265','12','Видеокарты',1,'[{\"added\": {}}]',7,1),(14,'2022-05-14 12:45:40.540593','1','Целый день посещения батутных парков Flip Fly',1,'[{\"added\": {}}]',8,1),(15,'2022-05-14 12:47:16.830283','2','Билет в детскую страну профессий Kidzania',1,'[{\"added\": {}}]',8,1),(16,'2022-05-14 12:48:40.205716','3','Всё меню и напитки в ресторане сети «Япоша»',1,'[{\"added\": {}}]',8,1),(17,'2022-05-14 12:49:44.141466','4','Всё меню кухни в трех ресторанах сети японской кухни «Планета суши» со скидкой 50%',1,'[{\"added\": {}}]',8,1),(18,'2022-05-14 12:50:50.252731','5','Блюда и разливные пенные напитки в ресторанах «Колбасофф»',1,'[{\"added\": {}}]',8,1),(19,'2022-05-14 12:52:17.189781','6','Лазерная коррекция зрения и госпитальный комплекс исследований для проведения операции в многопрофильном медицинском центре им. Святослава Федорова (4',1,'[{\"added\": {}}]',8,1),(20,'2022-05-14 12:53:43.164198','7','Отдых c 3-разовым питанием в санатории «Ерино»',1,'[{\"added\": {}}]',8,1),(21,'2022-05-14 12:55:23.010118','8','Премиум-SPA-программы в студии «Пани Беата»',1,'[{\"added\": {}}]',8,1),(22,'2022-05-14 12:56:44.056474','9','Косметическое отбеливание зубов в студии Zagar Studio',1,'[{\"added\": {}}]',8,1),(23,'2022-05-14 12:58:06.614278','10','Безлимитное посещение сеансов массажа R-Sleek в студии красоты Global SPA',1,'[{\"added\": {}}]',8,1),(24,'2022-05-14 12:59:35.154663','11','Мужская стрижка и моделирование бороды в барбершопе Stop',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','category'),(8,'main','coupon'),(9,'main','profile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-14 12:27:34.609922'),(2,'auth','0001_initial','2022-05-14 12:27:34.729723'),(3,'admin','0001_initial','2022-05-14 12:27:34.754145'),(4,'admin','0002_logentry_remove_auto_add','2022-05-14 12:27:34.757338'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-14 12:27:34.760428'),(6,'contenttypes','0002_remove_content_type_name','2022-05-14 12:27:34.777552'),(7,'auth','0002_alter_permission_name_max_length','2022-05-14 12:27:34.789837'),(8,'auth','0003_alter_user_email_max_length','2022-05-14 12:27:34.810161'),(9,'auth','0004_alter_user_username_opts','2022-05-14 12:27:34.813798'),(10,'auth','0005_alter_user_last_login_null','2022-05-14 12:27:34.825433'),(11,'auth','0006_require_contenttypes_0002','2022-05-14 12:27:34.826497'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-14 12:27:34.830038'),(13,'auth','0008_alter_user_username_max_length','2022-05-14 12:27:34.842414'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-14 12:27:34.853971'),(15,'auth','0010_alter_group_name_max_length','2022-05-14 12:27:34.860462'),(16,'auth','0011_update_proxy_permissions','2022-05-14 12:27:34.864272'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-14 12:27:34.876959'),(18,'main','0001_initial','2022-05-14 12:27:34.898824'),(19,'main','0002_profile','2022-05-14 12:27:34.948685'),(20,'main','0003_alter_profile_options','2022-05-14 12:27:34.952840'),(21,'sessions','0001_initial','2022-05-14 12:27:34.962101');
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
INSERT INTO `django_session` VALUES ('ehr1fgea8foj18v7gtzsl99huzsod1nx','.eJxVjEEOwiAQRe_C2hAZoYhL9z0DmRkGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxSuqiQB1-N0J-SN1AumO9Nc2tLvNEelP0TrseW5LndXf_Dgr28q0dWWQhHygbCgQMHoTB-CxHNwQOg4UUDDnvTp5CFoAzZ8Pk0SZrnXp_APwPODw:1nprTA:iAUV4Dbd6LroRWwRMiBi1ZUUB5p-kWxzlTiggAHWsqE','2022-05-28 13:06:04.523325'),('x7xf65zd0ob0sgdz47sygz9xkuzz146j','.eJxVjMsOwiAQRf-FtSHA8HTp3m8gwAxSNTQp7cr479qkC93ec859sZi2tcVt0BInZGcG7PS75VQe1HeA99RvMy9zX5cp813hBx38OiM9L4f7d9DSaN9akdRZFOGqTtZYryGDJ8LqJHoUQkpADWS9Vca4JAJAqFSUNNoGIM_eH8yYNuk:1nvDyN:IQaLOKl0VCv5N12XFj5UR6tKs44i4sSxWITeeEVjlyc','2022-06-12 08:08:27.021263');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_category_parent_category_id_bcccec19_fk_main_category_id` (`parent_category_id`),
  CONSTRAINT `main_category_parent_category_id_bcccec19_fk_main_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `main_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_category`
--

LOCK TABLES `main_category` WRITE;
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
INSERT INTO `main_category` VALUES (1,'Услуги',NULL),(2,'Товары по купонам',NULL),(3,'Красота',1),(4,'Здоровье',1),(5,'Еда',1),(6,'Развлечения',1),(7,'Электроника',2),(8,'Бытовая техника',2),(9,'Одежда',2),(10,'Цветы',2),(11,'Телефоны',7),(12,'Видеокарты',7);
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_coupon`
--

DROP TABLE IF EXISTS `main_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `condition` longtext NOT NULL,
  `description` longtext NOT NULL,
  `address` longtext NOT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_coupon_category_id_b23b19df_fk_main_category_id` (`category_id`),
  CONSTRAINT `main_coupon_category_id_b23b19df_fk_main_category_id` FOREIGN KEY (`category_id`) REFERENCES `main_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_coupon`
--

LOCK TABLES `main_coupon` WRITE;
/*!40000 ALTER TABLE `main_coupon` DISABLE KEYS */;
INSERT INTO `main_coupon` VALUES (1,'Целый день посещения батутных парков Flip Fly','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\nОдин купон действует для одного человека.\r\nВ течение дня один посетитель может использовать только один купон.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\n— Скидка 30% на целый день посещения батутного парка для взрослого или ребенка в будний день (630 руб. вместо 900 руб.)\r\n— Скидка 30% на целый день посещения батутного парка для взрослого или ребенка в выходной день (910 руб. вместо 1300 руб.)\r\n\r\nВ стоимость купона входит: посещение одного из батутных парков Flip Fly на выбор.\r\n\r\nВ батутном парке на ст. м. «Калужская» имеются следующие зоны физической активности:\r\n— 38 батутов;\r\n— 2 воздушные подушки;\r\n— 5 спортивных батутов;\r\n— фристайл-батут (5×5 м);\r\n— зона паркура и воздушных полотен;\r\n— стены Wall Run;\r\n— детская горка и лабиринты;\r\n— настольный теннис.','Прыжки на батуте — это веселое развлечение и интенсивная тренировка одновременно. Прыжки на батуте полезны для поддержания физической формы, они могут помочь скорректировать фигуру и сбросить лишние килограммы. А все потому, что во время занятий задействованы все группы мышц — это содействует довольно активному сжиганию жировой ткани.','Адресa\r\nВсе акции Flip Fly\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nКалужская \r\n\r\nг. Москва, ул. Обручева, д. 34/63, стр. 1\r\n\r\nс 10:00 до 22:00 ежедневно\r\n\r\n+7 (499) 490-14-90\r\nг. Мытищи, ул. Мира, стр. 51 (ТРЦ «Июнь», эт. -2)\r\n\r\nс 10:00 до 22:00 ежедневно\r\n\r\n+7 (499) 490-14-90',900.00,690.00,'2022-05-14 12:45:40.535394','photos/img1_Eo1u9Cj.jpeg',6),(2,'Билет в детскую страну профессий Kidzania','Для получения электронного билета в страну профессий, необходимо активировать купоны по ссылке.\r\nПосле активации купонов на адрес электронной почты поступят билеты для посещения страны профессий.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\n— Скидка 50% на билет (с 01.05.2022 по 31.05.2022) для взрослого (495 руб. вместо 990 руб.)\r\n— Скидка 50% на билет (с 01.05.2022 по 10.05.2022) для ребенка 4–16 лет (1195 руб. вместо 2390 руб.)\r\n— Скидка 50% на билет (с 11.05.2022 по 31.05.2022) для ребенка 4–16 лет (995 руб. вместо 1990 руб.)\r\n\r\nПрочие условия:\r\n— обращаем ваше внимание, что 15.05.2022 страна профессий работает с 16:00;\r\n— купоны необходимо активировать по ссылке до момента посещения страны профессий;\r\n— путешествие реализуется в формате свободного посещения профессий в соответствии с расписанием в течение всего дня;\r\n— купон распространяется на билеты категории комфорт;\r\n— билеты для малышей (дети от 2 до 3 лет) приобретаются на кассе страны профессий (профессии для малышей работают по расписанию, с которым можно ознакомиться на территории парка);\r\n— дети возраста до 1 года находятся бесплатно на территории страны профессий;\r\n— сопровождающие лица (старше 18 лет) допускаются в страну профессий по взрослым билетам при условии сопровождения ребенка до 16 лет;\r\n— дети младше 7 лет могут посещать страну профессий только в сопровождении взрослого;\r\n— если ребенок в возрасте от 7 лет остается на территории страны без сопровождающего, сопровождающий обязан предоставить информацию о ребенке и себе (путем заполнения стандартной анкеты-согласия), а также предоставить документ, удостоверяющий личность;\r\n— на территорию парка невозможен пронос своей еды и напитков;\r\n— перенос даты посещения и возврат активированных купонов возможен, необходимо обратиться в страну профессий по электронной почте events@kidzania.ru;','Страна профессий Kidzania приглашает детей и взрослых отвлечься от повседневных проблем в непринужденной обстановке. Для маленьких гостей это не только хорошее развлечение в кругу сверстников, но и время, проведенное с пользой для ума.','Адресa\r\nВсе акции Kidzania\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nЦСКА \r\n\r\nг. Москва, Ходынский бул., д. 4, эт. 4 (ТЦ «Авиапарк»)\r\n\r\nс 12:00 до 20:00 ежедневно\r\n\r\n+7 (495) 232-54-39 (доб. 4)',1500.00,1200.00,'2022-05-14 12:47:16.825477','photos/img2.jpeg',6),(3,'Всё меню и напитки в ресторане сети «Япоша»','Вы можете предъявить купон в электронном или распечатанном виде.\r\n\r\nКупон дает право скидки 50% на всё меню и 30% на напитки (включая алкогольные) без ограничения суммы чека.\r\n\r\nКупон действует в любой день в любое время работы ресторана.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\nОдин купон действует на одного человека.\r\nЕсли идете вдвоем или компанией, необходимо приобретать купон на каждого.\r\n\r\nАдрес ресторана, участвующего в акции: г. Москва, Столешников пер., д. 8 (ст. м. «Охотный ряд», телефон: +7 (966) 172-74-66).','«Япоша» — популярная сеть демократичных ресторанов с яркой и жизнеутверждающей концепцией. Особенность «Япоши» — оригинальное двойное меню — суши и антисуши. В первой половине меню можно выбрать популярные блюда адаптированной японской кухни, во второй — блюда европейской, русской и других кухонь разных стран мира. Смесь всех кулинарных хитов позволяет удовлетворять гастрономические пристрастия самых разных гостей.','Адресa\r\nВсе акции Япоша\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nОхотный ряд \r\n\r\nг. Москва, Столешников пер., д. 8\r\n\r\nвс-чт: с 12:00 до 00:00, пт-сб: с 12:00 до 06:00\r\n\r\n+7 (966) 172-74-66',500.00,110.00,'2022-05-14 12:48:40.202223','photos/img3.jpeg',5),(4,'Всё меню кухни в трех ресторанах сети японской кухни «Планета суши» со скидкой 50%','Вы можете предъявить купон в электронном или распечатанном виде.\r\n\r\nКупон дает право скидки 50% на всё меню кухни без ограничения суммы чека.\r\n\r\nКупон действует в любой день в любое время работы сети ресторанов.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\nОдин купон действует на одного человека.\r\nЕсли идете вдвоем или компанией, необходимо приобретать купон на каждого.\r\n\r\nДополнительно оплачивается на месте: для компаний от 8 человек в счет включается 10% за обслуживание.','Суши и роллы — это блюда японской кухни, которые традиционно готовятся из ароматного японского риса и свежей рыбы, однако туда добавляют и другие компоненты на усмотрение шефа. Для роллов чаще используют сушеные морские водоросли — нори, а также кладут внутрь всевозможные виды морепродуктов, курицу, мясо, икру, овощи, сливочный сыр, кунжут и другие продукты. В этом многообразии для каждого найдется подходящий вариант!','Адресa\r\nВсе акции Планета суши\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nПоиск адреса\r\nВведите адрес или метро\r\nЮго-Западная \r\n\r\nг. Москва, ул. Покрышкина, д. 4 (ТЦ «Звёздочка», эт. 2)\r\n\r\nпо предварительному бронированию\r\n\r\n+7 (968) 072-51-72\r\nБульвар адмирала Ушакова \r\n\r\nг. Москва, Веневская ул., д. 6 (ТЦ «Витте молл», эт. 3)\r\n\r\nпо предварительному бронированию\r\n\r\n+7 (916) 403-54-00\r\nг. Домодедово, Каширское ш., д. 3а (ТЦ «Торговый квартал», эт. 1)\r\n\r\nпо предварительному бронированию\r\n\r\n+7 (965) 223-14-66',1500.00,999.00,'2022-05-14 12:49:44.137892','photos/img4.jpeg',5),(5,'Блюда и разливные пенные напитки в ресторанах «Колбасофф»','Вы можете предъявить купон в электронном или распечатанном виде.\r\n\r\nКупон дает право скидки 50% на блюда из меню кухни и 30% на копчения, закуски, соленья, салаты, блюда на компанию, бургеры, горячие блюда и на все разливные пенные напитки.\r\n\r\nОбратите внимание: на 3 сорта пенных напитков скидка не распространяется (уточняйте у администраторов).\r\nКупон действует в любой день и в любое время работы ресторанов.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\nОдин купон действует на одно посещение ресторана, для повторного посещения ресторана по акции необходимо приобрести новый купон.\r\nЕсли идете вдвоем или компанией, необходимо приобретать купон на каждого.\r\nДля ребенка до 6 лет (включительно) дополнительный купон не требуется.\r\n\r\nАкция действует в ресторанах по следующим адреса','Сеть ресторанов «Колбасофф» приглашает всех ценителей ароматной еды и пенных напитков приятно провести время вместе с друзьями, второй половинкой или коллегами по работе. В заведениях сети вас встретят классическая обстановка английского паба, неформальная атмосфера, а также дружелюбные официанты, которые не прочь подсказать гостям блюдо с необычным, ярким вкусом. В интерьере заведений преобладают теплые тона, деревянные элементы, а также мягкое, комфортное для гостей освещение.','Адресa\r\nВсе акции Колбасофф\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nПоиск адреса\r\nВведите адрес или метро\r\nМарксистская \r\n\r\nг. Москва, Таганская ул., д. 21\r\n\r\nс 12:00 до 00:00 ежедневно\r\n\r\n+7 (495) 210-32-10\r\nОктябрьское Поле \r\n\r\nг. Москва, ул. Маршала Бирюзова, д. 32 (ТРЦ «Пятая Авеню», эт. 3)\r\n\r\nс 12:00 до 00:00 ежедневно\r\n\r\n+7 (495) 210-32-10\r\nПражская \r\n\r\nг. Москва, ул. Кировоградская, д. 13а (ТРЦ Columbus, эт. 4)\r\n\r\nс 12:00 до 00:00 ежедневно\r\n\r\n+7 (495) 210-32-10\r\nг. Москва, г. Зеленоград, пл. Юности, д. 2, стр. 1\r\n\r\nс 12:00 до 00:00 ежедневно\r\n\r\n+7 (495) 210-32-10',450.00,300.00,'2022-05-14 12:50:50.247918','photos/img5.jpeg',5),(6,'Лазерная коррекция зрения и госпитальный комплекс исследований для проведения операции в многопрофильном медицинском центре им. Святослава Федорова (4','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на комплексную медицинскую процедуру лазерной коррекции зрения двух глаз по технологии SuperLasik и госпитальных исследований для проведения операции.\r\n\r\nВ стоимость купона на комплексную процедуру лазерной коррекции зрения двух глаз по технологии SuperLasik и госпитальных исследований входят следующие медицинские услуги:\r\n— лазерная коррекция зрения двух глаз по технологии SuperLasik;\r\n— 3 консультации офтальмолога после коррекции зрения (на 1, 7 и 30 сутки после операции);\r\n— госпитальные исследования (забор биоматериала с последующей его передачей в лабораторию для проведения в ней лабораторных исследований на гепатит В, С, сифилис и ВИЧ).','Для поддержания зрения в хорошем состоянии нужно регулярно посещать офтальмолога, чтобы вовремя определить развитие глазных заболеваний, а также избежать осложнений.','Адресa\r\nВсе акции Многопрофильный медицинский центр им. Святослава Федорова\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nЦветной бульвар \r\n\r\nг. Москва, Садовая-Cамотёчная ул., д. 16, стр. 1\r\n\r\nпн-сб: с 09:00 до 21:00, вс: выходной\r\n\r\n+7 (495) 699-17-79, +7 (495) 699-46-13, +7 (925) 890-70-33',96000.00,46000.00,'2022-05-14 12:52:17.186675','photos/img6.jpeg',4),(7,'Отдых c 3-разовым питанием в санатории «Ерино»','Вы можете предъявить купон в электронном или распечатанном виде.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\nПроживание в течение 2 дней/1 ночи:\r\n— Скидка 36% на отдых с оздоровлением для двоих в течение 2 дней/1 ночи в номере категории стандарт однокомнатный с питанием «полный пансион» в любой день (4000 руб. вместо 6250 руб.)\r\n— Скидка 36% на отдых с оздоровлением для двоих в течение 2 дней/1 ночи в номере категории стандарт двухкомнатный с питанием «полный пансион» в любой день (4128 руб. вместо 6450 руб.)\r\n— Скидка 33% на отдых с оздоровлением для троих в течение 2 дней/1 ночи в номере категории стандарт трехкомнатный с питанием «полный пансион» в любой день (6231 руб. вместо 9300 руб.)\r\n— Скидка 37% на отдых с оздоровлением для двоих в течение 2 дней/1 ночи в номере категории улучшенный однокомнатный с питанием «полный пансион» в любой день (4315 руб. вместо 6850 руб.)\r\n— Скидка 39% на отдых с оздоровлением для двоих в течение 2 дней/1 ночи в номере категории полулюкс двухкомнатный с питанием «полный пансион» в любой день (4544 руб. вместо 7450 руб.)\r\n— Скидка 36% на отдых с оздоровлением для троих в течение 2 дней/1 ночи в номере категории полулюкс трехкомнатный с питанием «полный пансион» в любой день (6848 руб. вместо 10 700 руб.)\r\n\r\nПроживание в течение 3 дней/2 ночей:\r\n— Скидка 36% на отдых с оздоровлением для двоих в течение 3 дней/2 ночей в номере категории стандарт однокомнатный с питанием «полный пансион» в любой день (8000 руб. вместо 12 500 руб.)\r\n— Скидка 36% на отдых с оздоровлением для двоих в течение 3 дней/2 ночей в номере категории стандарт двухкомнатный с питанием «полный пансион» в любой день (8256 руб. вместо 12 900 руб.)\r\n— Скидка 33% на отдых с оздоровлением для троих в течение 3 дней/2 ночей в номере категории стандарт трехкомнатный с питанием «полный пансион» в любой день (12 462 руб. вместо 18 600 руб.)\r\n— Скидка 37% на отдых с оздоровлением для двоих в течение 3 дней/2 ночей в номере категории улучшенный однокомнатный с питанием «полный пансион» в любой день (8631 руб. вместо 13 700 руб.)\r\n— Скидка 39% на отдых с оздоровлением для двоих в течение 3 дней/2 ночей в номере категории полулюкс двухкомнатный с питанием «полный пансион» в любой день (8357 руб. вместо 13 700 руб.)\r\n— Скидка 36% на отдых с оздоровлением для троих в течение 3 дней/2 ночей в номере категории полулюкс трехкомнатный с питанием «полный пансион» в любой день (9536 руб. вместо 14 900 руб.)\r\n\r\nВ стоимость купона входит:\r\n— пребывание в номере выбранной категории;\r\n— питание (завтрак, обед, полдник, ужин, сонник);\r\n— посещение бассейна (1 сеанс в сутки на человека);\r\n— анимационные программы;\r\n— детская игровая комната;\r\n— консультация врача-терапевта.\r\n\r\nРасчетное время: заезд — в 17:00, выезд — до 15:00.\r\n\r\nПрочие условия:\r\n— акция не действует с 30.04.2022 по 03.05.2022 и с 07.05.2022 по 10.05.2022;\r\n— обязательно перед покупкой купона предварительно уточняйте по телефону +7 (495) 085-32-25 наличие интересующей вас категории номеров;\r\n— перед покупкой купона необходимо также позвонить в отдел бронирования по телефону +7 (495) 085-32-25 (для уточнения наличия мест на выбранную дату);\r\n— просьба не затягивать процедуру покупки купона и бронирования номера после предварительного уточнения наличия мест (для гарантированного получения номера на желаемую дату);\r\n— количество номеров по акции на каждую дату ограниченно (необходимо перед покупкой купона обязательно уточнять наличие мест);\r\n— после приобретения купона необходимо сообщить номер купона;\r\n— если участник акции не предупреждает об отмене своего визита за 24 часа до забронированной даты заезда, то купон считается использованным;\r\n— при заезде необходимо предъявить купон (при отсутствии купона санаторий вправе отказать в предоставлении услуг).','Отдых в санатории «Ерино» — возможность эмоционально перезагрузиться и оздоровиться. Здравница расположена в 18 км от Москвы. Лесной массив, неповторимые речные пейзажи, оборудованная парковая территория — здесь созданы все условия, чтобы забыть о шумных буднях.\r\n\r\nСанаторий состоит из 3 корпусов и 238 номеров. В каждом корпусе есть ресторан и зоны отдыха. В здравнице современная лечебно-диагностическая база, есть скважины с минеральной водой. Инфраструктура включает в себя бассейн и тренажерный зал. Для детей предусмотрена игровая комната.\r\n\r\nВ санатории «Ерино» вас ждет прекрасный отдых. Регулярно для отдыхающих проводятся анимационные программы, поэтому скучать не придется.','Адресa\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nг. Москва, Рязановское поселение, ​пос. Ерино, д. 1, к. 1 (вблизи г. Подольск)\r\n\r\nс 09:00 до 18:00 ежедневно\r\n\r\n+7 (495) 085-32-25',4500.00,3000.00,'2022-05-14 12:53:43.154834','photos/img7.jpeg',4),(8,'Премиум-SPA-программы в студии «Пани Беата»','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\nТонизирующая премиум-SPA-программа «Все в шоколаде» (180 мин.):\r\n— Скидка 64% на тонизирующую премиум-SPA-программу «Все в шоколаде» для одного (180 мин.) (2988 руб. вместо 8300 руб.)\r\n— Скидка 65% на тонизирующую премиум-SPA-программу «Все в шоколаде» для двоих (180 мин.) (5810 руб. вместо 16 600 руб.)','В основе всех SPA-процедур лежит использование натуральных природных материалов, таких как вода, соли, лечебные грязи, глина, растения и так далее.\r\n\r\nВсе эти натуральные вещества содействуют омоложению и оздоровлению тела. SPA-процедуры помогают ускорить обменные процессы и избавиться от воспалений, нормализуют водный баланс кожи и оказывают положительное воздействие на организм.\r\n\r\nВсевозможные обертывания, маски и пилинги очищают, питают и насыщают кожу необходимыми витаминами. Массаж способствует нормализации кровообращения, что ведет к улучшению метаболизма в тканях и удалению из них лишней жидкости. Таким образом, SPA-процедуры борются с целлюлитом и восстанавливают упругость кожи.','Адресa\r\nВсе акции Пани Беата\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nТретьяковская \r\n\r\nг. Москва, ул. Большая Ордынка, д. 9\r\n\r\nс 10:00 до последнего клиента ежедневно\r\n\r\n+7 (968) 490-66-00',8690.00,4000.00,'2022-05-14 12:55:23.002935','photos/img8.png',3),(9,'Косметическое отбеливание зубов в студии Zagar Studio','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\n— Скидка 61% на экспресс-отбеливание зубов на 2–4 тона (741 руб. вместо 1900 руб.)\r\n— Скидка 56% на отбеливание зубов «Медиум» на 6–10 тонов (1276 руб. вместо 2900 руб.)\r\n— Скидка 56% на экстраотбеливание зубов на 10–16 тонов (1540 руб. вместо 3500 руб.)\r\n\r\nВ стоимость купона входит:\r\n— определение оттенка зубов до отбеливания по специальной шкале Vita;\r\n— предварительная обработка зубов;\r\n— нанесение специального отбеливающего геля, который воздействует на зубную эмаль под действием холодного света;\r\n— определение по шкале Vita степени отбеливания.\r\nЭффект от отбеливания зубов сохраняется от 2 до 6 месяцев.','Белоснежная улыбка и здоровые зубы могут свидетельствовать о крепком здоровье. Те, кто заботится о состоянии зубов и регулярно посещает стоматолога, могут интересоваться тем, как сделать эмаль светлее. В таких случаях обращаются к профессиональному отбеливанию. Перед проведением процедуры рекомендуется вылечить кариес и удалить зубной камень. Отбеливание также проводится при пигментации эмали. Противопоказаниями к проведению процедуры могут стать чувствительность к горячему, холодному, кислому или соленому, наличие заболеваний полости рта и необходимость изменения формы или размера зубов.','Адресa\r\nВсе акции Zagar Studio\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nКитай-город \r\n\r\nг. Москва, ул. Маросейка, д. 6–8, стр. 1\r\n\r\nс 10:00 до 21:00 ежедневно\r\n\r\n+7 (966) 171-99-92',9990.00,7890.00,'2022-05-14 12:56:44.052712','photos/img9.jpeg',3),(10,'Безлимитное посещение сеансов массажа R-Sleek в студии красоты Global SPA','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\n— Скидка 90% на 3 месяца безлимитного посещения сеансов массажа R-Sleek (1590 руб. вместо 15 900 руб.)\r\n— Скидка 90% на 6 месяцев безлимитного посещения сеансов массажа R-Sleek (2090 руб. вместо 20 900 руб.)\r\n\r\nВозможный эффект от процедуры:\r\n— снижает объемы тела;\r\n— подтягивает кожу и убирает целлюлит;\r\n— способствует снижению веса;\r\n— создает эффект «сосудистой гимнастики»;\r\n— создает эффект массажа;\r\n— разглаживает структуру кожи;\r\n— снимает стресс и мышечные спазмы.','Плавные формы и сногсшибательные изгибы — мечта большинства современных женщин. Однако не каждая девушка похвастается идеальной фигурой. Красивая фигура — это всегда залог комплексной работы. Массаж является одним из важных элементов в программе снижения веса.\r\n\r\nС помощью массажера R-Sleek можно уменьшить целлюлит, улучшить кровообращение и нормализовать лимфоток. Курс процедур может помочь уменьшить объемы и буквально вылепить фигуру мечты. Сеансы показаны при целлюлите, локальных жировых отложениях, чувстве усталости, тяжести в ногах. В результате кожа станет подтянутой, вы избавитесь от лишней жидкости в организме и сможете лучше себя чувствовать.','Адресa\r\nВсе акции Global SPA\r\n\r\nПерейти на сайт партнера\r\nЮридическая информация о партнёре\r\nЮжная \r\n\r\nг. Москва, ул. Днепропетровская, д. 2 (ТРК «Глобал Сити»)\r\n\r\nс 09:00 до 22:00 ежедневно\r\n\r\n+7 (929) 978-87-46',15900.00,1590.00,'2022-05-14 12:58:06.609271','photos/img10.jpeg',4),(11,'Мужская стрижка и моделирование бороды в барбершопе Stop','Вы можете предъявить купон в электронном или распечатанном виде.\r\nОдин человек может купить неограниченное количество купонов для себя или в подарок.\r\n\r\nКупон действует на следующие виды услуг:\r\n\r\nМужская стрижка или моделирование бороды:\r\n— Скидка 50% на мужскую модельную стрижку (800 руб. вместо 1600 руб.)\r\n— Скидка 50% на моделирование бороды (500 руб. вместо 1000 руб.)\r\n— Скидка 50% на стрижку машинкой (400 руб. вместо 800 руб.)\r\n\r\nКомплексные услуги:\r\n— Скидка 51% на мужскую стрижку и моделирование бороды (1274 руб. вместо 2600 руб.)\r\n\r\nВ стоимость купона на мужскую стрижку входит:\r\n— подбор стиля;\r\n— мытье головы;\r\n— стрижка;\r\n— сушка;\r\n— укладка.','Мужские стрижки сегодня отличаются невероятным многообразием. Если раньше им был присущ консерватизм, то теперь каждый сезон появляются новые модели. Мужских причесок придумано огромное множество: модельные, креативные и, конечно же, классические. Как же выбрать среди них именно ту стрижку, которая подойдет вам?\r\n\r\nКлассические стрижки актуальны всегда — они выглядят изысканно и элегантно. А если вы хотите выделиться яркой внешностью, попробуйте сделать креативную прическу — экстраординарную и эпатажную.','Адресa\r\nВсе акции Stop\r\n\r\nЮридическая информация о партнёре\r\nБелорусская \r\n\r\nг. Москва, ул. Бутырский Вал, д. 2\r\n\r\nпо предварительной записи\r\n\r\n+7 (977) 271-32-00',800.00,400.00,'2022-05-14 12:59:35.149595','photos/img11.jpeg',3);
/*!40000 ALTER TABLE `main_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_profile`
--

DROP TABLE IF EXISTS `main_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile`
--

LOCK TABLES `main_profile` WRITE;
/*!40000 ALTER TABLE `main_profile` DISABLE KEYS */;
INSERT INTO `main_profile` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `main_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_profile_bought`
--

DROP TABLE IF EXISTS `main_profile_bought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile_bought` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `coupon_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_profile_bought_profile_id_coupon_id_a9dd388c_uniq` (`profile_id`,`coupon_id`),
  KEY `main_profile_bought_coupon_id_09f4ea4f_fk_main_coupon_id` (`coupon_id`),
  CONSTRAINT `main_profile_bought_coupon_id_09f4ea4f_fk_main_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `main_coupon` (`id`),
  CONSTRAINT `main_profile_bought_profile_id_2711caab_fk_main_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `main_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile_bought`
--

LOCK TABLES `main_profile_bought` WRITE;
/*!40000 ALTER TABLE `main_profile_bought` DISABLE KEYS */;
INSERT INTO `main_profile_bought` VALUES (2,1,2),(1,2,7);
/*!40000 ALTER TABLE `main_profile_bought` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_profile_cart`
--

DROP TABLE IF EXISTS `main_profile_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `coupon_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_profile_cart_profile_id_coupon_id_956b9465_uniq` (`profile_id`,`coupon_id`),
  KEY `main_profile_cart_coupon_id_52eee2eb_fk_main_coupon_id` (`coupon_id`),
  CONSTRAINT `main_profile_cart_coupon_id_52eee2eb_fk_main_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `main_coupon` (`id`),
  CONSTRAINT `main_profile_cart_profile_id_b46ffee6_fk_main_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `main_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile_cart`
--

LOCK TABLES `main_profile_cart` WRITE;
/*!40000 ALTER TABLE `main_profile_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_profile_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-09 16:34:41
