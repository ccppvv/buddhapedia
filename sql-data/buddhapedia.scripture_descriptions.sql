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
-- Table structure for table `scripture_descriptions`
--

DROP TABLE IF EXISTS `scripture_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripture_descriptions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) NOT NULL,
  `resource_type` varchar(32) NOT NULL,
  `created_at` varchar(19) DEFAULT NULL,
  `page` varchar(256) NOT NULL,
  `updated_at` varchar(19) DEFAULT NULL,
  `content` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripture_descriptions`
--

LOCK TABLES `scripture_descriptions` WRITE;
/*!40000 ALTER TABLE `scripture_descriptions` DISABLE KEYS */;
INSERT INTO `scripture_descriptions` VALUES (1,0,'directories','2021-02-06 09:50:37','tibetan-scriptures','2021-02-06 09:50:37','“中华佛典宝库”的佛典分为大藏经和藏外佛典两个部分，其中大藏经部分以《大正藏》、《卍续藏》、《嘉兴藏》为主 ，还包括《赵城金藏》、《中华藏》、《房山石经》、《佛教大藏经》、《高丽藏》、《乾隆藏》、《卍正藏》、《永乐北藏》、《宋藏遗珍》和《洪武南藏》中 与前述藏经不同的佛经。目前提供的是2011年校对版。对前三种主要藏经的录入情况说明如下：\r\n１、《大正藏》第1-55卷和第85卷，是经“中华佛典宝库”网站转码并处理过的中华电子佛典协会(cbeta)录入、校对完全的部分佛经。\r\n《大正藏》56-84册部分，是由中华佛典宝库网站与北京慧海佛教文化中心合作录入、一校的，在这部分共547部佛经（约3480万字）中完成了479部的录入、一校（其中部分无法录入的梵文和日文暂用●替代）。剩余部分将陆续补齐。\r\n２、新纂《卍续藏》第1-88卷（扣除大正藏重复经目，其中第6和52卷完全重复而未列目录），是经“中华佛典宝库”网站转码并处理过的中华电子佛典协会(cbeta)录入、校对完全的部分佛经。\r\n３、前二种藏经中未包括的《嘉兴藏》中的部分佛经，是经“中华佛典宝库”网站转码并处理过的中华电子佛典协会(cbeta)录入、校对完全的部分佛经。\r\n佛经以unicode码简、繁体提供。单部经以unicode码简体形式提供下载，每卷以unicode码繁体和简体形式另行提供压缩文件下载的 （推荐安装本站“软件工具”中推荐unifonts字库，就能在支持unicode的软件中用宋体完整显示八万字。否则可能会显示缺字空白）。\r\n有数千三宝弟子和热爱中华文化的志愿者参与了本站组织的以上三种藏经的录校工作，在此表示感谢！藏经大部分是由big5码转成gbk码的，在此对台湾、香港、美国、韩国、日本以及世界各地为录入和校对佛典作出贡献的中华民族和世界各民族的先行同道表示感谢！特别要感谢中华电子佛典协会(cbeta)和萧镇国先生等善知识的大力支持！\r\n佛典中还包括巴利文三藏和藏文三藏以及不少国内三宝弟子录入的gbk码经文和当代佛教文献，在此一并表示感谢！\r\n如果读者发现错疏之处，请及时告知我们，以便尽快改正。“中华佛典宝库”代表广大四众弟子向您表示感谢！\r\n宝库愿与各佛教组织合作制作、免费赠送本站的藏经、辞典、佛典光盘，欢迎佛教团体和个人与佛典宝库共攘盛举，事先务请与宝库协商具体方式。'),(2,0,'directories','2021-02-06 09:55:06','buddhism-dictionary','2021-02-06 09:55:06','《佛学电子辞典》是中华佛典宝库网站收录大藏经和国内外现有的无版权要求的佛教辞典而成的佛学工具书，多数辞典提供Unicode简体和Unicode繁体两种版本，目前已有28部辞典。除了下载安装到电脑中外，还开发了智能手机版（分安卓系统和苹果系统两种）和在线浏览版。'),(3,1,'divisions','2021-02-10 02:55:06','tibetan-scriptures','2021-02-10 02:55:06','台湾cbeta大正藏校勘版big5码光盘第14版在本站ftp下载中cbeta目录下可下载。'),(4,2,'divisions','2021-02-10 03:33:54','tibetan-scriptures','2021-02-10 03:33:54','《续藏经》目录（简体，96k），下载地址：https://www.fodian.net/organize/xzj-mulu.zip'),(5,7,'resource','2021-02-10 03:34:31','tibetan-scriptures','2021-02-10 03:34:31','源网站地址：http://www.asianclassics.org/research_site/index.html'),(6,13,'divisions','2021-02-10 03:49:35','buddhist-symbolism','2021-02-10 03:49:35','本页收集的以佛教经典写本与石刻经典拓本为主、兼收木刻印本。按照已编藏的序列和卷号、年代排列，编号的规则如下 x（写本）d（一位字母，即所使用的编藏系统的缩写，一般使用大正藏［d］、嘉兴藏［j］、万续藏［x］）0001（经典所对应藏本的原四位数字序号）001（三位数字卷号，第一卷使用001，第一卷之前的使用000，文本有多卷的，按照所开始的卷号排列）0256（四位数字年代，如甘露元年［二五六年］，不题记年代的尽量到百年或该卷通常所考证年代中下限左右，容有误差）a（一位字母，作者或卷本辅助名称或年代的缩写，可以使用数字）。本页所录古代写本名称依惯例基本随写本自题而定，容与入藏本有所不同，未入藏经典通常使用已入藏同类经典之一的编号，卷号则排列在已有经典使用的卷号之后。欢迎学人整理校录相对应的写本电子版提供给佛典宝库以 方便初学，请登陆本站译著之家发布，同时欢迎提供适合本页刊载的图档文件。佛教书法内容碑、帖、手迹、摩崖石刻另设专页');
/*!40000 ALTER TABLE `scripture_descriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-24 10:15:30
