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
  `whole_link` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripture_divisions`
--

LOCK TABLES `scripture_divisions` WRITE;
/*!40000 ALTER TABLE `scripture_divisions` DISABLE KEYS */;
INSERT INTO `scripture_divisions` VALUES (1,1,'阿含部','[第1-2卷]','（0001-0151）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',1,'scripture','1#http://www.fodian.net/utf8-j/t01-j.zip,2#http://www.fodian.net/utf8-j/t02-j.zip;1#http://www.fodian.net/01-ahan/01/t01-f.zip,2#http://www.fodian.net/01-ahan/02/t02-f.zip'),(2,1,'本缘部','[第3-4卷]','（0152-0219）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',2,'scripture','3#http://www.fodian.net/utf8-j/t03-j.zip,4#http://www.fodian.net/utf8-j/t04-j.zip;3#http://www.fodian.net/02-benyuan/03/t03-f.zip,4#http://www.fodian.net/02-benyuan/04/t04-f.zip'),(3,1,'般若部','[第5-8卷]','（0220-0261）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',3,'scripture','5#http://www.fodian.net/utf8-j/t05-j.zip,6#http://www.fodian.net/utf8-j/t06-j.zip,7#http://www.fodian.net/utf8-j/t07-j.zip,8#http://www.fodian.net/utf8-j/t08-j.zip;5#http://www.fodian.net/03-boruo/05/t05-f.zip,6#http://www.fodian.net/03-boruo/06/t06-f.zip,7#http://www.fodian.net/03-boruo/07/t07-f.zip,8#http://www.fodian.net/03-boruo/08/t08-f.zip'),(4,1,'法华部·华严部','[第9-10卷]','（0262-0277）（0278-0309）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',4,'scripture','9#http://www.fodian.net/utf8-j/t09-j.zip,10#http://www.fodian.net/utf8-j/t10-j.zip;9#http://www.fodian.net/04-fahua/09/t09-f.zip,10#http://www.fodian.net/04-fahua/10/t10-f.zip'),(5,1,'宝积部·涅槃部','[第11-12卷]','（0310-0373）（0374-0396）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',5,'scripture','11#http://www.fodian.net/utf8-j/t11-j.zip,12#http://www.fodian.net/utf8-j/t12-j.zip;11#http://www.fodian.net/05-baoji/11/t11-f.zip,12#http://www.fodian.net/05-baoji/12/t12-f.zip'),(6,1,'大集部','[第13卷]','（0397-0424）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',6,'scripture','13#http://www.fodian.net/utf8-j/t13-j.zip;13#http://www.fodian.net/06-daji/13/t13-f.zip'),(7,1,'经集部','[第14-17卷]','（0425-0847）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',7,'scripture','14#http://www.fodian.net/utf8-j/t14-j.zip,15#http://www.fodian.net/utf8-j/t15-j.zip,16#http://www.fodian.net/utf8-j/t16-j.zip,17#http://www.fodian.net/utf8-j/t17-j.zip;14#http://www.fodian.net/07-jingji/14/t14-f.zip,15#http://www.fodian.net/07-jingji/15/t15-f.zip,16#http://www.fodian.net/07-jingji/16/t16-f.zip,17#http://www.fodian.net/07-jingji/17/t17-f.zip'),(8,1,'密教部','[第18-21卷]','（0848-1420）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',8,'scripture','18#http://www.fodian.net/utf8-j/t18-j.zip,19#http://www.fodian.net/utf8-j/t19-j.zip,20#http://www.fodian.net/utf8-j/t20-j.zip,21#http://www.fodian.net/utf8-j/t21-j.zip;18#http://www.fodian.net/08-mijiao/18/t18-f.zip,19#http://www.fodian.net/08-mijiao/19/t19-f.zip,20#http://www.fodian.net/08-mijiao/20/t20-f.zip,21#http://www.fodian.net/08-mijiao/21/t21-f.zip'),(9,1,'律部','[第22-24卷]','（1421-1504）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',9,'scripture','22#http://www.fodian.net/utf8-j/t22-j.zip,23#http://www.fodian.net/utf8-j/t23-j.zip,24#http://www.fodian.net/utf8-j/t24-j.zip;22#http://www.fodian.net/09-lubu/22/t22-f.zip,23#http://www.fodian.net/09-lubu/23/t23-f.zip,24#http://www.fodian.net/09-lubu/24/t24-f.zip'),(10,1,'释经论部·毗昙部','[第25-29卷]','（1505-1535）（1536-1563）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',10,'scripture','25#http://www.fodian.net/utf8-j/t25-j.zip,26#http://www.fodian.net/utf8-j/t26-j.zip,27#http://www.fodian.net/utf8-j/t27-j.zip,28#http://www.fodian.net/utf8-j/t28-j.zip,29#http://www.fodian.net/utf8-j/t29-j.zip;25#http://www.fodian.net/10-shijinglun/25/t25-f.zip,26#http://www.fodian.net/10-shijinglun/26/t26-f.zip,27#http://www.fodian.net/10-shijinglun/27/t27-f.zip,28#http://www.fodian.net/10-shijinglun/28/t28-f.zip,29#http://www.fodian.net/10-shijinglun/29/t29-f.zip'),(11,1,'中观部·瑜伽部','[第30-31卷]','（1564-1578）（1579-1627）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',11,'scripture','30#http://www.fodian.net/utf8-j/t30-j.zip,31#http://www.fodian.net/utf8-j/t31-j.zip;#30http://www.fodian.net/11-zhongguan/30/t30-f.zip,#31http://www.fodian.net/11-zhongguan/31/t31-f.zip'),(12,1,'论集部','[第32卷]','（1628-1692）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',12,'scripture','32#http://www.fodian.net/utf8-j/t32-j.zip;32#http://www.fodian.net/12-lunji/32/t32-f.zip'),(13,1,'经疏部','[第33-39卷]','（1693-1803）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',13,'scripture','33#http://www.fodian.net/utf8-j/t33-j.zip,34#http://www.fodian.net/utf8-j/t34-j.zip,35#http://www.fodian.net/utf8-j/t35-j.zip,36#http://www.fodian.net/utf8-j/t36-j.zip,37#http://www.fodian.net/utf8-j/t37-j.zip,38#http://www.fodian.net/utf8-j/t38-j.zip,39#http://www.fodian.net/utf8-j/t39-j.zip;33#http://www.fodian.net/13-jingshu/33/t33-f.zip,34#http://www.fodian.net/13-jingshu/34/t34-f.zip,35#http://www.fodian.net/13-jingshu/35/t35-f.zip,36#http://www.fodian.net/13-jingshu/36/t36-f.zip,37#http://www.fodian.net/13-jingshu/37/t37-f.zip,38#http://www.fodian.net/13-jingshu/38/t38-f.zip,39#http://www.fodian.net/13-jingshu/39/t39-f.zip'),(14,1,'律疏部·论疏部','[第40-44卷]','（1804-1815）（1816-1850）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',14,'scripture','40#http://www.fodian.net/utf8-j/t40-j.zip,41#http://www.fodian.net/utf8-j/t41-j.zip,42#http://www.fodian.net/utf8-j/t42-j.zip,43#http://www.fodian.net/utf8-j/t43-j.zip,44#http://www.fodian.net/utf8-j/t44-j.zip;40#http://www.fodian.net/14-lushu/40/t40-f.zip,41#http://www.fodian.net/14-lushu/41/t41-f.zip,42#http://www.fodian.net/14-lushu/42/t42-f.zip,43#http://www.fodian.net/14-lushu/43/t43-f.zip,44#http://www.fodian.net/14-lushu/44/t44-f.zip'),(15,1,'诸宗部','[第45-48卷]','（1851-2025）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',15,'scripture','45#http://www.fodian.net/utf8-j/t45-j.zip,46#http://www.fodian.net/utf8-j/t46-j.zip,47#http://www.fodian.net/utf8-j/t47-j.zip,48#http://www.fodian.net/utf8-j/t48-j.zip;45#http://www.fodian.net/15-zhuzong/45/t45-f.zip,46#http://www.fodian.net/15-zhuzong/46/t46-f.zip,47#http://www.fodian.net/15-zhuzong/47/t47-f.zip,48#http://www.fodian.net/15-zhuzong/48/t48-f.zip'),(16,1,'史传部','[第49-52卷]','（2026-2120）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',16,'scripture','49#http://www.fodian.net/utf8-j/t49-j.zip,50#http://www.fodian.net/utf8-j/t50-j.zip,51#http://www.fodian.net/utf8-j/t51-j.zip,52#http://www.fodian.net/utf8-j/t52-j.zip;49#http://www.fodian.net/16-shizhuan/49/t49-f.zip,50#http://www.fodian.net/16-shizhuan/50/t50-f.zip,51#http://www.fodian.net/16-shizhuan/51/t51-f.zip,52#http://www.fodian.net/16-shizhuan/52/t52-f.zip'),(17,1,'事汇部·外教部·目录部','[第53-55卷]','（2121-2136）（2137-2144）（2145-2184）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',17,'scripture','53#http://www.fodian.net/utf8-j/t53-j.zip,54#http://www.fodian.net/utf8-j/t54-j.zip,55#http://www.fodian.net/utf8-j/t55-j.zip;53#http://www.fodian.net/17-shihui/53/t53-f.zip,54#http://www.fodian.net/17-shihui/54/t54-f.zip,55#http://www.fodian.net/17-shihui/55/t55-f.zip'),(18,1,'续经疏部','[第56-61卷]','（2185-2245）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',18,'scripture','56#http://www.fodian.net/utf8-j/t56-j.zip,57#http://www.fodian.net/utf8-j/t57-j.zip,58#http://www.fodian.net/utf8-j/t58-j.zip,59#http://www.fodian.net/utf8-j/t59-j.zip,60#http://www.fodian.net/utf8-j/t60-j.zip,61#http://www.fodian.net/utf8-j/t61-j.zip;56#http://www.fodian.net/dzz-trad/t56-f.7z,57#http://www.fodian.net/dzz-trad/t57-f.7z,58#http://www.fodian.net/dzz-trad/t58-f.7z,59#http://www.fodian.net/dzz-trad/t59-f.7z,60#http://www.fodian.net/dzz-trad/t60-f.7z,61#http://www.fodian.net/dzz-trad/t61-f.7z'),(19,1,'续律疏部·续论疏部','[第62-70卷]','（2246-2248）（2249-2295）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',19,'scripture','62#http://www.fodian.net/utf8-j/t62-j.zip,63#http://www.fodian.net/utf8-j/t63-j.zip,64#http://www.fodian.net/utf8-j/t64-j.zip,65#http://www.fodian.net/utf8-j/t65-j.zip,66#http://www.fodian.net/utf8-j/t66-j.zip,67#http://www.fodian.net/utf8-j/t67-j.zip,68#http://www.fodian.net/utf8-j/t68-j.zip,69#http://www.fodian.net/utf8-j/t69-j.zip,70#http://www.fodian.net/utf8-j/t70-j.zip;62#http://www.fodian.net/dzz-trad/t62-f.7z,63#http://www.fodian.net/dzz-trad/t63-f.7z,64#http://www.fodian.net/dzz-trad/t64-f.7z,65#http://www.fodian.net/dzz-trad/t65-f.7z,66#http://www.fodian.net/dzz-trad/t66-f.7z,67#http://www.fodian.net/dzz-trad/t67-f.7z,68#http://www.fodian.net/dzz-trad/t68-f.7z,69#http://www.fodian.net/dzz-trad/t69-f.7z,70#http://www.fodian.net/dzz-trad/t70-f.7z'),(20,1,'续诸宗部','[第70-84卷]','（2296-2700）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',20,'scripture','70#http://www.fodian.net/utf8-j/t70-j.zip,71#http://www.fodian.net/utf8-j/t71-j.zip,72#http://www.fodian.net/utf8-j/t72-j.zip,73#http://www.fodian.net/utf8-j/t73-j.zip,74#http://www.fodian.net/utf8-j/t74-j.zip,75#http://www.fodian.net/utf8-j/t75-j.zip,76#http://www.fodian.net/utf8-j/t76-j.zip,77#http://www.fodian.net/utf8-j/t77-j.zip,78#http://www.fodian.net/utf8-j/t78-j.zip,79#http://www.fodian.net/utf8-j/t79-j.zip,80#http://www.fodian.net/utf8-j/t80-j.zip,81#http://www.fodian.net/utf8-j/t81-j.zip,82#http://www.fodian.net/utf8-j/t82-j.zip,83#http://www.fodian.net/utf8-j/t83-j.zip,84#http://www.fodian.net/utf8-j/t84-j.zip;70#http://www.fodian.net/dzz-trad/t70-f.7z,71#http://www.fodian.net/dzz-trad/t71-f.7z,72#http://www.fodian.net/dzz-trad/t72-f.7z,73#http://www.fodian.net/dzz-trad/t73-f.7z,74#http://www.fodian.net/dzz-trad/t74-f.7z,75#http://www.fodian.net/dzz-trad/t75-f.7z,76#http://www.fodian.net/dzz-trad/t76-f.7z,77#http://www.fodian.net/dzz-trad/t77-f.7z,78#http://www.fodian.net/dzz-trad/t78-f.7z,79#http://www.fodian.net/dzz-trad/t79-f.7z,80#http://www.fodian.net/dzz-trad/t80-f.7z,81#http://www.fodian.net/dzz-trad/t81-f.7z,82#http://www.fodian.net/dzz-trad/t82-f.7z,83#http://www.fodian.net/dzz-trad/t83-f.7z,84#http://www.fodian.net/dzz-trad/t84-f.7z'),(21,1,'悉昙部','[第84卷]','（2701-2731）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',21,'scripture','84#http://www.fodian.net/utf8-j/t84-j.zip;84#http://www.fodian.net/dzz-trad/t84-f.7z'),(22,1,'古逸部·疑似部','[第85卷]','（2732-2864）（2865-2920）','tibetan-scriptures','','2021-01-23 02:37:07','2021-01-23 02:37:07',22,'scripture','85#http://www.fodian.net/utf8-j/t85-j.zip;85#http://www.fodian.net/22-guyi/85/t85-f.zip'),(23,3,'嘉兴藏（新文丰版）录入佛经',' ',' ','tibetan-scriptures','','2021-01-23 03:29:58','2021-01-23 03:29:58',1,'scripture','1#http://www.fodian.net/jxz/j-j.zip;1#http://www.fodian.net/jxz/j-f.zip'),(25,5,'国家图书馆善本佛典',' ',' ','tibetan-scriptures','','2021-01-23 03:32:30','2021-01-23 03:32:30',1,'scripture','1#http://www.fodian.net/Guotu/D-j.7Z;1#http://www.fodian.net/Guotu/D-f.7Z'),(26,6,'正史佛教资料类编',' ',' ','tibetan-scriptures','','2021-01-23 03:34:32','2021-01-23 03:34:32',1,'scripture',NULL),(29,6,'藏外佛教文献',' ',' ','tibetan-scriptures','','2021-01-23 03:43:13','2021-01-23 03:43:13',2,'scripture',NULL),(30,6,'北朝佛教石刻拓片百品',' ',' ','tibetan-scriptures','','2021-01-23 03:43:13','2021-01-23 03:43:13',3,'scripture',NULL),(31,11,'经论解释',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',1,'resource',NULL),(32,11,'大德开示',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',2,'resource',NULL),(33,11,'佛法入门',' ',' ','outside-tibetan-scriptures','','2021-01-23 13:48:44','2021-01-23 13:48:44',3,'resource',NULL),(34,12,'佛乐、梵唱、经咒念诵','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',1,'resource',NULL),(35,12,'天宁寺唱诵','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',2,'resource',NULL),(36,12,'Flash动画','','','buddhist-symbolism','','2021-01-24 02:04:22','2021-01-24 02:04:22',3,'resource',NULL),(37,13,'【大正新修大藏经】 -- 阿含部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',1,'resource',NULL),(38,13,'【大正新修大藏经】 -- 本缘部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',2,'resource',NULL),(39,13,'【大正新修大藏经】 -- 般若部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',3,'resource',NULL),(40,13,'【大正新修大藏经】 -- 法华部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',4,'resource',NULL),(41,13,'【大正新修大藏经】 -- 华严部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',5,'resource',NULL),(42,13,'【大正新修大藏经】 -- 宝积部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',6,'resource',NULL),(43,13,'【大正新修大藏经】 -- 涅槃部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',7,'resource',NULL),(44,13,'【大正新修大藏经】 -- 大集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',8,'resource',NULL),(45,13,'【大正新修大藏经】 -- 经集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',9,'resource',NULL),(46,13,'【大正新修大藏经】 -- 密教部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',10,'resource',NULL),(47,13,'【大正新修大藏经】 -- 律部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',11,'resource',NULL),(48,13,'【大正新修大藏经】 -- 释经论部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',12,'resource',NULL),(49,13,'【大正新修大藏经】 -- 毗昙部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',13,'resource',NULL),(50,13,'【大正新修大藏经】 -- 中观部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',14,'resource',NULL),(51,13,'【大正新修大藏经】 -- 瑜伽部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',15,'resource',NULL),(52,13,'【大正新修大藏经】 -- 论集部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',16,'resource',NULL),(53,13,'【大正新修大藏经】 -- 经疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',17,'resource',NULL),(54,13,'【大正新修大藏经】 -- 律疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',18,'resource',NULL),(55,13,'【大正新修大藏经】 -- 诸宗部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',19,'resource',NULL),(56,13,'【大正新修大藏经】 -- 史传部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',20,'resource',NULL),(57,13,'【大正新修大藏经】 -- 事汇部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',21,'resource',NULL),(58,13,'【大正新修大藏经】 -- 目录部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',22,'resource',NULL),(59,13,'【大正新修大藏经】 -- 续经疏部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',23,'resource',NULL),(60,13,'【大正新修大藏经】 -- 续诸宗部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',24,'resource',NULL),(61,13,'【大正新修大藏经】 -- 古逸部','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',25,'resource',NULL),(62,13,'【卍新纂续藏经编号】 -- 使用其他藏经编号的写本','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',26,'resource',NULL),(63,13,'【译传(5000-8000)】 -- 使用大正藏5000之后的空余号码自行编号的部分','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',27,'resource',NULL),(64,13,'【撰著(8001-)】 -- 使用大正藏5000之后的空余号码自行编号的部分','','','buddhist-symbolism','','2021-01-24 02:18:55','2021-01-24 02:18:55',28,'resource',NULL),(65,14,'梵文学习网页链接','','','language-learn','','2021-01-31 09:18:55','2021-01-31 09:18:55',1,'resource',NULL),(66,14,'梵文詞典相關網站彙集','','','language-learn','','2021-01-31 09:18:55','2021-01-31 09:18:55',2,'resource',NULL),(67,15,'藏文拼音教材','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',1,'resource',NULL),(68,15,'藏文语法教材','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',2,'resource',NULL),(69,15,'讲课录音','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',3,'resource',NULL),(70,15,'网站链接','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',4,'resource',NULL),(71,15,'藏文詞典網站彙集','','','language-learn','','2021-01-31 09:20:19','2021-01-31 09:20:19',5,'resource',NULL),(72,16,'巴利文学习网页链接','','','language-learn','','2021-01-31 09:21:01','2021-01-31 09:21:01',1,'',NULL),(73,16,'巴利文詞典網站彙集','','','language-learn','','2021-01-31 09:21:01','2021-01-31 09:21:01',2,'',NULL),(74,2,'印度撰述·经律论仪轨','[第01-02卷]','(0001-0207)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',1,'scripture','1#http://www.fodian.net/utf8-j/x01.zip,2#http://www.fodian.net/utf8-j/x02.zip;1#http://www.fodian.net/xzj/01-02-yindu/x01/x01-f.zip,2#http://www.fodian.net/xzj/01-02-yindu/x02/x02-f.zip'),(75,2,'中国撰述·释经部','[第03-04卷]','(0208-0225)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',2,'scripture','3#http://www.fodian.net/utf8-j/x03.zip,4#http://www.fodian.net/utf8-j/x04.zip;3#http://www.fodian.net/xzj/03-04-shijingbu/x03/x03-f.zip,4#http://www.fodian.net/xzj/03-04-shijingbu/x04/x04-f.zip'),(76,2,'中国撰述·华严部疏','[第05-09卷]','(0226-0242)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',3,'scripture','5#http://www.fodian.net/utf8-j/x05.zip,7#http://www.fodian.net/utf8-j/x07.zip,8#http://www.fodian.net/utf8-j/x08.zip,9#http://www.fodian.net/utf8-j/x09.zip;5#http://www.fodian.net/xzj/05-09-huayan/x05/x05-f.zip,7#http://www.fodian.net/xzj/05-09-huayan/x07/x07-f.zip,8#http://www.fodian.net/xzj/05-09-huayan/x08/x08-f.zip,9#http://www.fodian.net/xzj/05-09-huayan/x09/x09-f.zip'),(77,2,'中国撰述·方等部疏','[第09-23卷]','(0243-0447)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',4,'scripture','9#http://www.fodian.net/utf8-j/x09.zip,10#http://www.fodian.net/utf8-j/x10.zip,11#http://www.fodian.net/utf8-j/x11.zip,12#http://www.fodian.net/utf8-j/x12.zip,13#http://www.fodian.net/utf8-j/x13.zip,14#http://www.fodian.net/utf8-j/x14.zip,15#http://www.fodian.net/utf8-j/x15.zip,16#http://www.fodian.net/utf8-j/x16.zip,17#http://www.fodian.net/utf8-j/x17.zip,18#http://www.fodian.net/utf8-j/x18.zip,19#http://www.fodian.net/utf8-j/x19.zip,20#http://www.fodian.net/utf8-j/x20.zip,21#http://www.fodian.net/utf8-j/x21.zip,22#http://www.fodian.net/utf8-j/x22.zip,23#http://www.fodian.net/utf8-j/x23.zip;9#http://www.fodian.net/xzj/05-09-huayan/x09/x09-f.zip,10#http://www.fodian.net/xzj/09-23-fangdeng/x10/x10-f.zip,11#http://www.fodian.net/xzj/09-23-fangdeng/x11/x11-f.zip,12#http://www.fodian.net/xzj/09-23-fangdeng/x12/x12-f.zip,13#http://www.fodian.net/xzj/09-23-fangdeng/x13/x13-f.zip,14#http://www.fodian.net/xzj/09-23-fangdeng/x14/x14-f.zip,15#http://www.fodian.net/xzj/09-23-fangdeng/x15/x15-f.zip,16#http://www.fodian.net/xzj/09-23-fangdeng/x16/x16-f.zip,17#http://www.fodian.net/xzj/09-23-fangdeng/x17/x17-f.zip,18#http://www.fodian.net/xzj/09-23-fangdeng/x18/x18-f.zip,19#http://www.fodian.net/xzj/09-23-fangdeng/x19/x19-f.zip,20#http://www.fodian.net/xzj/09-23-fangdeng/x20/x20-f.zip,21#http://www.fodian.net/xzj/09-23-fangdeng/x21/x21-f.zip,22#http://www.fodian.net/xzj/09-23-fangdeng/x22/x22-f.zip,23#http://www.fodian.net/xzj/09-23-fangdeng/x23/x23-f.zip'),(78,2,'中国撰述·般若部疏','[第24-26卷]','(0448-0576)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',5,'scripture','24#http://www.fodian.net/utf8-j/x24.zip,25#http://www.fodian.net/utf8-j/x25.zip,26#http://www.fodian.net/utf8-j/x26.zip;24#http://www.fodian.net/xzj/24-26boruo/x24/x24-f.zip,25#http://www.fodian.net/xzj/24-26boruo/x25/x25-f.zip,26#http://www.fodian.net/xzj/24-26boruo/x26/x26-f.zip'),(79,2,'中国撰述·法华部疏','[第27-35卷]','(0577-0652)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',6,'scripture','27#http://www.fodian.net/utf8-j/x27.zip,28#http://www.fodian.net/utf8-j/x28.zip,29#http://www.fodian.net/utf8-j/x29.zip,30#http://www.fodian.net/utf8-j/x30.zip,31#http://www.fodian.net/utf8-j/x31.zip,32#http://www.fodian.net/utf8-j/x32.zip,33#http://www.fodian.net/utf8-j/x33.zip,34#http://www.fodian.net/utf8-j/x34.zip,35#http://www.fodian.net/utf8-j/x35.zip;27#http://www.fodian.net/xzj/27-35fahua/x27/x27-f.zip,28#http://www.fodian.net/xzj/27-35fahua/x28/x28-f.zip,29#http://www.fodian.net/xzj/27-35fahua/x29/x29-f.zip,30#http://www.fodian.net/xzj/27-35fahua/x30/x30-f.zip,31#http://www.fodian.net/xzj/27-35fahua/x31/x31-f.zip,32#http://www.fodian.net/xzj/27-35fahua/x32/x32-f.zip,33#http://www.fodian.net/xzj/27-35fahua/x33/x33-f.zip,34#http://www.fodian.net/xzj/27-35fahua/x34/x34-f.zip,35#http://www.fodian.net/xzj/27-35fahua/x35/x35-f.zip'),(80,2,'中国撰述·涅槃部疏','[第36-37卷]','(0653-0664)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',7,'scripture','36#http://www.fodian.net/utf8-j/x36.zip,37#http://www.fodian.net/utf8-j/x37.zip;36#http://www.fodian.net/xzj/36-37niepan/x36/x36-f.zip,37#http://www.fodian.net/xzj/36-37niepan/x37/x37-f.zip'),(81,2,'中国撰述·小乘经并圣贤集疏','[第37卷]','(0665-0675)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',8,'scripture','37#http://www.fodian.net/utf8-j/x37.zip;37#http://www.fodian.net/xzj/36-37niepan/x37/x37-f.zip'),(82,2,'中国撰述·大小乘释律部','[第38-44卷]','(0678-0751)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',9,'scripture','38#http://www.fodian.net/utf8-j/x38.zip,39#http://www.fodian.net/utf8-j/x39.zip,40#http://www.fodian.net/utf8-j/x40.zip,41#http://www.fodian.net/utf8-j/x41.zip,42#http://www.fodian.net/utf8-j/x42.zip,43#http://www.fodian.net/utf8-j/x43.zip,44#http://www.fodian.net/utf8-j/x44.zip;38#http://www.fodian.net/xzj/38-44shilvbu/x38/x38-f.zip,39#http://www.fodian.net/xzj/38-44shilvbu/x39/x39-f.zip,40#http://www.fodian.net/xzj/38-44shilvbu/x40/x40-f.zip,41#http://www.fodian.net/xzj/38-44shilvbu/x41/x41-f.zip,42#http://www.fodian.net/xzj/38-44shilvbu/x42/x42-f.zip,43#http://www.fodian.net/xzj/38-44shilvbu/x43/x43-f.zip,44#http://www.fodian.net/xzj/38-44shilvbu/x44/x44-f.zip'),(83,2,'中国撰述·大小乘释论部','[第45-53卷]','(0753-0862)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',10,'scripture','45#http://www.fodian.net/utf8-j/x45.zip,46#http://www.fodian.net/utf8-j/x46.zip,47#http://www.fodian.net/utf8-j/x47.zip,48#http://www.fodian.net/utf8-j/x48.zip,49#http://www.fodian.net/utf8-j/x49.zip,50#http://www.fodian.net/utf8-j/x50.zip,51#http://www.fodian.net/utf8-j/x51.zip,53#http://www.fodian.net/utf8-j/x53.zip;45#http://www.fodian.net/xzj/45-53shilunbu/x45/x45-f.zip,46#http://www.fodian.net/xzj/45-53shilunbu/x46/x46-f.zip,47#http://www.fodian.net/xzj/45-53shilunbu/x47/x47-f.zip,48#http://www.fodian.net/xzj/45-53shilunbu/x48/x48-f.zip,49#http://www.fodian.net/xzj/45-53shilunbu/x49/x49-f.zip,50#http://www.fodian.net/xzj/45-53shilunbu/x50/x50-f.zip,51#http://www.fodian.net/xzj/45-53shilunbu/x51/x51-f.zip,53#http://www.fodian.net/xzj/45-53shilunbu/x53/x53-f.zip'),(84,2,'中国撰述·三论宗','[第54卷]','(0866-0880)</div>','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',11,'scripture','54#http://www.fodian.net/utf8-j/x54.zip;54#http://www.fodian.net/xzj/54-sanlunzong/x54-f.zip'),(85,2,'中国撰述·法相宗','[第55卷](0882-0902)','','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',12,'scripture','55#http://www.fodian.net/utf8-j/x55.zip;55#http://www.fodian.net/xzj/55-faxiangzong/x55/x55-f.zip'),(86,2,'中国撰述·天台宗','[第55-57卷]','(0903-0980)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',13,'scripture','55#http://www.fodian.net/utf8-j/x55.zip,56#http://www.fodian.net/utf8-j/x56.zip,57#http://www.fodian.net/utf8-j/x57.zip;55#http://www.fodian.net/xzj/55-faxiangzong/x55/x55-f.zip,56#http://www.fodian.net/xzj/55-57-tiantaizong/x56/x56-f.zip,57#http://www.fodian.net/xzj/55-57-tiantaizong/x57/x57-f.zip'),(87,2,'中国撰述·华严宗','[第58卷]','(0985-1033)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',14,'scripture','58#http://www.fodian.net/utf8-j/x58.zip;58#http://www.fodian.net/xzj/58-huayanzong/x58/x58-f.zip'),(88,2,'中国撰述·真言宗','[第59卷]','(1043-1084)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',15,'scripture','59#http://www.fodian.net/utf8-j/x59.zip;59#http://www.fodian.net/xzj/59-zhenyanzong/x59/x59-f.zip'),(89,2,'中国撰述·戒律宗','[第59-60卷](1085-1139)','','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',16,'scripture','59#http://www.fodian.net/utf8-j/x59.zip,60#http://www.fodian.net/utf8-j/x60.zip;59#http://www.fodian.net/xzj/59-zhenyanzong/x59/x59-f.zip,60#http://www.fodian.net/xzj/59-60-jieluzong/x60/x60-f.zip'),(90,2,'中国撰述·净土宗','[第61-62卷]','(1145-1216)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',17,'scripture','61#http://www.fodian.net/utf8-j/x61.zip,62#http://www.fodian.net/utf8-j/x62.zip;61#http://www.fodian.net/xzj/61-62-jingtuzong/x61/x61-f.zip,62#http://www.fodian.net/xzj/61-62-jingtuzong/x62/x62-f.zip'),(91,2,'中国撰述·禅宗','[第63-73卷]','(1217-1458)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',18,'scripture','63#http://www.fodian.net/utf8-j/x63.zip,64#http://www.fodian.net/utf8-j/x64.zip,65#http://www.fodian.net/utf8-j/x65.zip,66#http://www.fodian.net/utf8-j/x66.zip,67#http://www.fodian.net/utf8-j/x67.zip,68#http://www.fodian.net/utf8-j/x68.zip,69#http://www.fodian.net/utf8-j/x69.zip,70#http://www.fodian.net/utf8-j/x70.zip,71#http://www.fodian.net/utf8-j/x71.zip,72#http://www.fodian.net/utf8-j/x72.zip,73#http://www.fodian.net/utf8-j/x73.zip;63#http://www.fodian.net/xzj/63-73-chanzong/x63/x63-f.zip,64#http://www.fodian.net/xzj/63-73-chanzong/x64/x64-f.zip,65#http://www.fodian.net/xzj/63-73-chanzong/x65/x65-f.zip,66#http://www.fodian.net/xzj/63-73-chanzong/x66/x66-f.zip,67#http://www.fodian.net/xzj/63-73-chanzong/x67/x67-f.zip,68#http://www.fodian.net/xzj/63-73-chanzong/x68/x68-f.zip,69#http://www.fodian.net/xzj/63-73-chanzong/x69/x69-f.zip,70#http://www.fodian.net/xzj/63-73-chanzong/x70/x70-f.zip,71#http://www.fodian.net/xzj/63-73-chanzong/x71/x71-f.zip,72#http://www.fodian.net/xzj/63-73-chanzong/x72/x72-f.zip,73#http://www.fodian.net/xzj/63-73-chanzong/x73/x73-f.zip'),(92,2,'中国撰述·礼忏部','[第74卷]','(1464-1507)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',19,'scripture','74#http://www.fodian.net/utf8-j/x74.zip;74#http://www.fodian.net/xzj/74-lichan/x74/x74-f.zip'),(93,2,'中国撰述·史传部','[第75-88卷]','(1508-1671)','tibetan-scriptures','','2021-02-10 03:20:37','2021-02-10 03:20:37',20,'scripture','75#http://www.fodian.net/utf8-j/x75.zip,76#http://www.fodian.net/utf8-j/x76.zip,77#http://www.fodian.net/utf8-j/x77.zip,78#http://www.fodian.net/utf8-j/x78.zip,79#http://www.fodian.net/utf8-j/x79.zip,80#http://www.fodian.net/utf8-j/x80.zip,81#http://www.fodian.net/utf8-j/x81.zip,82#http://www.fodian.net/utf8-j/x82.zip,83#http://www.fodian.net/utf8-j/x83.zip,84#http://www.fodian.net/utf8-j/x84.zip,85#http://www.fodian.net/utf8-j/x85.zip,86#http://www.fodian.net/utf8-j/x86.zip,87#http://www.fodian.net/utf8-j/x87.zip,88#http://www.fodian.net/utf8-j/x88.zip;75#http://www.fodian.net/xzj/75-88-shizhuan/x75/x75-f.zip,76#http://www.fodian.net/xzj/75-88-shizhuan/x76/x76-f.zip,77#http://www.fodian.net/xzj/75-88-shizhuan/x77/x77-f.zip,78#http://www.fodian.net/xzj/75-88-shizhuan/x78/x78-f.zip,79#http://www.fodian.net/xzj/75-88-shizhuan/x79/x79-f.zip,80#http://www.fodian.net/xzj/75-88-shizhuan/x80/x80-f.zip,81#http://www.fodian.net/xzj/75-88-shizhuan/x81/x81-f.zip,82#http://www.fodian.net/xzj/75-88-shizhuan/x82/x82-f.zip,83#http://www.fodian.net/xzj/75-88-shizhuan/x83/x83-f.zip,84#http://www.fodian.net/xzj/75-88-shizhuan/x84/x84-f.zip,85#http://www.fodian.net/xzj/75-88-shizhuan/x85/x85-f.zip,86#http://www.fodian.net/xzj/75-88-shizhuan/x86/x86-f.zip,87#http://www.fodian.net/xzj/75-88-shizhuan/x87/x87-f.zip,88#http://www.fodian.net/xzj/75-88-shizhuan/x88/x88-f.zip'),(94,4,'赵城金藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',1,'scripture','1#http://www.fodian.net/dzj-buji/A/A-j.7Z;1#http://www.fodian.net/dzj-buji/A/A-f.7Z'),(96,4,'中华藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',3,'scripture','1#http://www.fodian.net/dzj-buji/C/C-j.7Z;#http://www.fodian.net/dzj-buji/C/C-f.7Z'),(97,4,'房山石经','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',4,'scripture','1#http://www.fodian.net/dzj-buji/F/F-j.7Z;1#http://www.fodian.net/dzj-buji/F/F-f.7Z'),(98,4,'佛教大藏经','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',5,'scripture','1#http://www.fodian.net/dzj-buji/G/G-j.7Z;1#http://www.fodian.net/dzj-buji/G/G-f.7Z'),(99,4,'高丽藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',6,'scripture','1#http://www.fodian.net/dzj-buji/K/K-j.7Z;1#http://www.fodian.net/dzj-buji/K/K-f.7Z'),(100,4,'乾隆藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',7,'scripture','1#http://www.fodian.net/dzj-buji/L/L-j.7Z;1#http://www.fodian.net/dzj-buji/L/L-f.7Z'),(101,4,'卍正藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',8,'scripture','1#;1#http://www.fodian.net/dzj-buji/M/M-f.7Z'),(102,4,'永乐北藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',9,'scripture','1#http://www.fodian.net/dzj-buji/P/P-j.7Z;1#http://www.fodian.net/dzj-buji/P/P-f.7Z'),(103,4,'宋藏遗珍','','','tibetan-scriptures','',NULL,NULL,10,'scripture','1#;1#http://www.fodian.net/dzj-buji/S/S-f.7Z'),(104,4,'洪武南藏','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',11,'scripture','1#http://www.fodian.net/dzj-buji/U/U-j.7Z;1#http://www.fodian.net/dzj-buji/U/U-f.7Z'),(105,4,'汉译南传大藏经','','','tibetan-scriptures','','2021-02-10 04:26:00','2021-02-10 04:26:00',12,'scripture','1#http://www.fodian.net/dzj-buji/N/N-j.7Z;1#http://www.fodian.net/dzj-buji/N/N-f.7Z'),(106,17,'二级经文分类','1','2','tibetan-scriptures','','2021-03-19 13:44:37','2021-03-19 13:44:37',0,'scripture',NULL),(107,18,'erjimulu','\'\'','\'\'','tibetan-scriptures','','2021-03-21 02:55:08','2021-03-21 02:55:08',0,'resource',NULL),(108,17,'目录','','','buddhist-symbolism','','2021-04-30 11:38:39','2021-04-30 11:38:39',0,'resource',NULL);
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

-- Dump completed on 2021-06-07 10:36:47
