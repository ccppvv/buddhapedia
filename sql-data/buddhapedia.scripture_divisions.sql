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
-- Table structure for table `scripture_divisions`
--

DROP TABLE IF EXISTS `scripture_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripture_divisions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `part` varchar(32) DEFAULT NULL,
  `range` varchar(256) DEFAULT NULL,
  `page` varchar(256) DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `created_at` varchar(19) DEFAULT NULL,
  `updated_at` varchar(19) DEFAULT NULL,
  `order` mediumint(9) DEFAULT NULL,
  `resource_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripture_divisions`
--

LOCK TABLES `scripture_divisions` WRITE;
/*!40000 ALTER TABLE `scripture_divisions` DISABLE KEYS */;
INSERT INTO `scripture_divisions` VALUES (1,1,'阿含部','[第1-2卷]','（0001-0151）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',1,NULL),(2,1,'本缘部','[第3-4卷]','（0152-0219）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',2,NULL),(3,1,'般若部','[第5-8卷]','（0220-0261）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',3,NULL),(4,1,'法华部·华严部','[第9-10卷]','（0262-0277）（0278-0309）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',4,NULL),(5,1,'宝积部·涅槃部','[第11-12卷]','（0310-0373）（0374-0396）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',5,NULL),(6,1,'大集部','[第13卷]','（0397-0424）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',6,NULL),(7,1,'经集部','[第14-17卷]','（0425-0847）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',7,NULL),(8,1,'密教部','[第18-21卷]','（0848-1420）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',8,NULL),(9,1,'律部','[第22-24卷]','（1421-1504）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',9,NULL),(10,1,'释经论部·毗昙部','[第25-29卷]','（1505-1535）（1536-1563）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',10,NULL),(11,1,'中观部·瑜伽部','[第30-31卷]','（1564-1578）（1579-1627）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',11,NULL),(12,1,'论集部','[第32卷]','（1628-1692）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',12,NULL),(13,1,'经疏部','[第33-39卷]','（1693-1803）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',13,NULL),(14,1,'律疏部·论疏部','[第40-44卷]','（1804-1815）（1816-1850）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',14,NULL),(15,1,'诸宗部','[第45-48卷]','（1851-2025）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',15,NULL),(16,1,'史传部','[第49-52卷]','（2026-2120）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',16,NULL),(17,1,'事汇部·外教部·目录部','[第53-55卷]','（2121-2136）（2137-2144）（2145-2184）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',17,NULL),(18,1,'续经疏部','[第56-61卷]','（2185-2245）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',18,NULL),(19,1,'续律疏部·续论疏部','[第62-70卷]','（2246-2248）（2249-2295）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',19,NULL),(20,1,'续诸宗部','[第70-84卷]','（2296-2700）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',20,NULL),(21,1,'悉昙部','[第84卷]','（2701-2731）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',21,NULL),(22,1,'古逸部·疑似部','[第85卷]','（2732-2864）（2865-2920）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',22,NULL),(23,3,'嘉兴藏（新文丰版）录入佛经',' ',' ','tibetan-scriptures','','2021-01-23 03:29:58','2021-01-23 03:29:58',1,NULL),(24,4,'历代藏经补辑',' ',' ','tibetan-scriptures','','2021-01-23 03:32:21','2021-01-23 03:32:21',1,NULL),(25,5,'国家图书馆善本佛典',' ',' ','tibetan-scriptures','','2021-01-23 03:32:30','2021-01-23 03:32:30',1,NULL),(26,6,'正史佛教资料类编',' ',' ','tibetan-scriptures','','2021-01-23 03:34:32','2021-01-23 03:34:32',1,NULL),(29,6,'藏外佛教文献',' ',' ','tibetan-scriptures','','2021-01-23 03:43:13','2021-01-23 03:43:13',2,NULL),(30,6,'北朝佛教石刻拓片百品',' ',' ','tibetan-scriptures','','2021-01-23 03:43:13','2021-01-23 03:43:13',3,NULL),(31,11,'经论解释',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',1,'resource'),(32,11,'大德开示',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',2,'resource'),(33,11,'佛法入门',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',3,'resource'),(34,12,'佛乐、梵唱、经咒念诵','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',1,'resource'),(35,12,'天宁寺唱诵','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',2,'resource'),(36,12,'Flash动画','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',3,'resource'),(37,13,'【大正新修大藏经】 -- 阿含部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',1,'resource'),(38,13,'【大正新修大藏经】 -- 本缘部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',2,'resource'),(39,13,'【大正新修大藏经】 -- 般若部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',3,'resource'),(40,13,'【大正新修大藏经】 -- 法华部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',4,'resource'),(41,13,'【大正新修大藏经】 -- 华严部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',5,'resource'),(42,13,'【大正新修大藏经】 -- 宝积部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',6,'resource'),(43,13,'【大正新修大藏经】 -- 涅槃部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',7,'resource'),(44,13,'【大正新修大藏经】 -- 大集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',8,'resource'),(45,13,'【大正新修大藏经】 -- 经集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',9,'resource'),(46,13,'【大正新修大藏经】 -- 密教部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',10,'resource'),(47,13,'【大正新修大藏经】 -- 律部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',11,'resource'),(48,13,'【大正新修大藏经】 -- 释经论部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',12,'resource'),(49,13,'【大正新修大藏经】 -- 毗昙部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',13,'resource'),(50,13,'【大正新修大藏经】 -- 中观部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',14,'resource'),(51,13,'【大正新修大藏经】 -- 瑜伽部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',15,'resource'),(52,13,'【大正新修大藏经】 -- 论集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',16,'resource'),(53,13,'【大正新修大藏经】 -- 经疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',17,'resource'),(54,13,'【大正新修大藏经】 -- 律疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',18,'resource'),(55,13,'【大正新修大藏经】 -- 诸宗部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',19,'resource'),(56,13,'【大正新修大藏经】 -- 史传部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',20,'resource'),(57,13,'【大正新修大藏经】 -- 事汇部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',21,'resource'),(58,13,'【大正新修大藏经】 -- 目录部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',22,'resource'),(59,13,'【大正新修大藏经】 -- 续经疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',23,'resource'),(60,13,'【大正新修大藏经】 -- 续诸宗部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',24,'resource'),(61,13,'【大正新修大藏经】 -- 古逸部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',25,'resource'),(62,13,'【卍新纂续藏经编号】 -- 使用其他藏经编号的写本','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',26,'resource'),(63,13,'【译传(5000-8000)】 -- 使用大正藏5000之后的空余号码自行编号的部分','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',27,'resource'),(64,13,'【撰著(8001-)】 -- 使用大正藏5000之后的空余号码自行编号的部分','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',28,'resource'),(65,14,'梵文学习网页链接','','','language-learn','','2021-01-31 09:18:55','2021-01-31 09:18:55',1,'resource'),(66,14,'梵文詞典相關網站彙集','','','language-learn','','2021-01-31 09:18:55','2021-01-31 09:18:55',2,'resource'),(67,15,'藏文拼音教材','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',1,'resource'),(68,15,'藏文语法教材','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',2,'resource'),(69,15,'讲课录音','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',3,'resource'),(70,15,'网站链接','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',4,'resource'),(71,15,'藏文詞典網站彙集','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',5,'resource'),(72,16,'巴利文学习网页链接','','','language-learn','','2021-01-31 09:21:01','2021-01-31 09:21:01',1,''),(73,16,'巴利文詞典網站彙集','','','language-learn','','2021-01-31 09:21:01','2021-01-31 09:21:01',2,'');
/*!40000 ALTER TABLE `scripture_divisions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-31 21:26:35