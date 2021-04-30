-- MySQL dump 10.13  Distrib 5.6.28, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: buddhapedia
-- ------------------------------------------------------
-- Server version	5.6.28

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
-- Table structure for table `scripture_directories`
--

DROP TABLE IF EXISTS `scripture_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripture_directories` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `created_at` varchar(19) DEFAULT NULL,
  `page` varchar(256) NOT NULL,
  `updated_at` varchar(19) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `resource_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripture_directories`
--

LOCK TABLES `scripture_directories` WRITE;
/*!40000 ALTER TABLE `scripture_directories` DISABLE KEYS */;
INSERT INTO `scripture_directories` VALUES (1,0,'大正新修大藏经','2021-01-23 02:10:52','tibetan-scriptures','2021-02-21 07:02:37',1,'scripture'),(2,0,'卍新纂续藏经','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',1,'scripture'),(3,0,'嘉兴藏（新文丰版）录入佛经','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',2,'scripture'),(4,0,'历代藏经补辑','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',3,'scripture'),(5,0,'国家图书馆善本佛典','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',4,'scripture'),(6,0,'近代新编文献','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',5,'scripture'),(7,0,'梵文、巴利文、藏文大藏经','2021-01-23 02:10:52','tibetan-scriptures','2021-01-23 02:10:52',6,'resource'),(8,0,'汉传佛教典籍','2021-01-23 11:47:28','outside-tibetan-scriptures','2021-01-23 11:47:28',0,'resource'),(9,0,'藏传佛教典籍','2021-01-23 11:47:28','outside-tibetan-scriptures','2021-01-23 11:47:28',1,'resource'),(10,0,'南传佛教典籍','2021-01-23 11:47:28','outside-tibetan-scriptures','2021-01-23 11:47:28',2,'resource'),(11,0,'排版佛典','2021-01-23 11:47:28','outside-tibetan-scriptures','2021-01-23 11:47:28',3,''),(12,0,'声乐法宝','2021-01-24 01:58:21','buddhist-symbolism','2021-01-24 01:58:21',0,''),(13,0,'图像法宝','2021-01-24 01:58:21','buddhist-symbolism','2021-01-24 01:58:21',1,''),(14,0,'梵文学习','2021-01-31 09:15:14','language-learn','2021-01-31 09:15:14',0,''),(15,0,'藏文学习','2021-01-31 09:15:14','language-learn','2021-01-31 09:15:14',1,''),(16,0,'巴利文学习','2021-01-31 09:15:14','language-learn','2021-01-31 09:15:14',2,''),(17,0,'碑帖法宝','2021-04-30 11:13:14','buddhist-symbolism','2021-04-30 11:13:14',3,'');
/*!40000 ALTER TABLE `scripture_directories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 21:22:52
