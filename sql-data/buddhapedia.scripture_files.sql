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
-- Table structure for table `scripture_files`
--

DROP TABLE IF EXISTS `scripture_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripture_files` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `resource_id` mediumint(9) NOT NULL,
  `resource_type` varchar(32) NOT NULL,
  `created_at` varchar(19) DEFAULT NULL,
  `file_type` varchar(32) NOT NULL,
  `updated_at` varchar(19) DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `file_hash` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripture_files`
--

LOCK TABLES `scripture_files` WRITE;
/*!40000 ALTER TABLE `scripture_files` DISABLE KEYS */;
INSERT INTO `scripture_files` VALUES (120,6769,'scriptures','2021-03-20 05:19:43','image','2021-03-20 05:19:43','微信图片_20210319172056.jpg','022d723813e4c514d9e9be7c019bf656.jpg'),(142,0,'scriptures','2021-03-20 05:54:08','other','2021-03-20 05:54:08','�-\Z��*�_4ca5ea39-ebdf-4ecd-9cf8-5cf3fda282b0.png','48693029ddb4589716460dc2389ce8ab.png'),(143,0,'scriptures','2021-03-20 05:54:08','other','2021-03-20 05:54:08','��.jpg','5e8c90a6f83542b363293062989675bd.jpg'),(144,6769,'scriptures','2021-03-20 05:54:22','image','2021-03-20 05:54:22','微信截图_20210319224101.jpg','c9da75cbbd3e4405afeaa0b850919716.jpg'),(145,6769,'scriptures','2021-03-20 05:54:55','image','2021-03-20 05:54:55','微信截图_20210320135441.jpg','2aa0edbdc81051c95049d0144a4f5502.jpg'),(146,6769,'scriptures','2021-03-20 06:04:05','audio','2021-03-20 06:04:05','远走高飞.mp3','925b81f04f50bb17bb727ba0e60c7177.mp3'),(147,6769,'scriptures','2021-03-20 06:04:35','audio','2021-03-20 06:04:35','赵照-火车开往落日.mp3','3438a86f93aebd116ed04e32a2d8dffd.mp3'),(148,6769,'scriptures','2021-03-20 06:04:49','audio','2021-03-20 06:04:49','周二珂 - 告白气球.mp3','e52f6c9febdf3ef5efe40207410103e8.mp3'),(149,6769,'scriptures','2021-03-20 06:04:59','video','2021-03-20 06:04:59','wx_camera_1614943973767.mp4','527d82b237aca47a93669feb281eb1dc.mp4'),(150,6769,'scriptures','2021-03-20 06:05:05','video','2021-03-20 06:05:05','wx_camera_1615037655713.mp4','ed77cd6ff41d5fe06c1a806637ac1b15.mp4'),(151,6769,'scriptures','2021-03-20 06:05:28','other','2021-03-20 06:05:28','远走高飞.zip','b6e89ee6cb0a2f3c7b03cec4bb646f7e.zip'),(152,0,'scriptures','2021-03-21 02:56:20','image','2021-03-21 02:56:20','微信图片_20210319172056.jpg','022d723813e4c514d9e9be7c019bf656.jpg'),(153,0,'scriptures','2021-03-21 02:57:36','image','2021-03-21 02:57:36','1111111微信图片_20210319172056.jpg','ee6ac0e44e2a0099338dbc8103c73835.jpg'),(154,0,'scriptures','2021-03-21 02:59:26','image','2021-03-21 02:59:26','11111111微信图片_20210319172056.jpg','86ff817ba1336bc264419d615505b2e7.jpg'),(155,0,'scriptures','2021-03-21 03:01:21','image','2021-03-21 03:01:21','112111111微信图片_20210319172056.jpg','ace166d2b715c58cec325f43b1afca20.jpg'),(156,6770,'scriptures','2021-03-21 03:02:28','image','2021-03-21 03:02:28','112111111微信图片_20210319172056.jpg','ace166d2b715c58cec325f43b1afca20.jpg'),(157,1545,'scriptures','2021-03-21 03:25:13','image','2021-03-21 03:25:13','22112111111微信图片_20210319172056.jpg','235bb8b5cf42a27a5110325e8d5862ab.jpg'),(158,6767,'scriptures','2021-03-21 05:33:26','image','2021-03-21 05:33:26','a47eca4afd4dd97fdd55023c4a2b9e47.jpeg','b2a2c5fe77f3d2f08c0e892960452dc7.jpeg'),(160,6767,'scriptures','2021-03-21 05:59:46','video','2021-03-21 05:59:46','红动中国设计网视频短片素材22.mp4','4c6429ae567434b572dbe5268a71709d.mp4'),(161,6767,'scriptures','2021-03-21 06:22:48','image','2021-03-21 06:22:48','a47eca4afd4dd97fdd55023c4a2b9e.jpeg','63d89d8d956140a3eaefa72dd7ee2a0b.jpeg'),(163,6767,'scriptures','2021-03-21 06:48:41','audio','2021-03-21 06:48:41','colors.mp3','6fd6b9f16d8a426d96d90fd2551d6294.mp3'),(164,853,'scriptures','2021-03-21 08:00:14','image','2021-03-21 08:00:14','a47eca4afd4dd97fdd55023c4a2b9e.jpeg','63d89d8d956140a3eaefa72dd7ee2a0b.jpeg'),(165,853,'scriptures','2021-03-21 08:00:24','audio','2021-03-21 08:00:24','colors.mp3','6fd6b9f16d8a426d96d90fd2551d6294.mp3');
/*!40000 ALTER TABLE `scripture_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-08 17:49:15
