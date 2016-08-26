-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pybeltdb
-- ------------------------------------------------------
-- Server version	5.5.49-log

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_friends_users_idx` (`user_id`),
  CONSTRAINT `fk_friends_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`user_id`),
  KEY `fk_pokes_friends_idx` (`friend_id`),
  CONSTRAINT `fk_pokes_friends` FOREIGN KEY (`friend_id`) REFERENCES `friends` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Ricky Ratcliff','RickyUX','ricky@gmail.com','test','1983-07-01','2016-08-26 10:03:50',NULL),(3,'John Snow','King of the North','john@gmail.com','test','1980-12-31','2016-08-26 10:09:44',NULL),(4,'Veronica Ratcliff','Cooler','veronica@gmail.com','test','1985-01-10','2016-08-26 10:28:17',NULL),(5,'Dakota','The Dog','dakota@gmail.com','test','2007-08-11','2016-08-26 10:29:44',NULL),(8,'Lilah Ratcliff','Omaha','lilah@gmail.com','test','2010-10-16','2016-08-26 11:37:25',NULL),(9,'Shirley Ratcliff','Nebraska','shirley@gmail.com','test','1959-02-26','2016-08-26 11:39:28',NULL),(10,'Rick McDaniel','LAX','rickm@gmail.com','test','1982-08-22','2016-08-26 11:40:13',NULL),(11,'Arlen McDaniel','LAX2','arlen@gmail.com','test','1982-04-21','2016-08-26 11:40:35',NULL),(12,'Jameson McDaniel','Nephew','jameson@gmail.com','test','2015-07-11','2016-08-26 11:41:30',NULL),(13,'Rose Borja','RN Rose','rose@gmail.com','test','1959-10-10','2016-08-26 11:42:33',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pybeltdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-26 12:47:57
