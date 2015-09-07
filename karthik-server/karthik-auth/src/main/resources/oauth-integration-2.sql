-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: oauth-integration-2
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('ROLE_ADMIN'),('ROLE_GUEST'),('ROLE_OAUTH_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC',1,'hmm','en','activated','ratnesh','ratnesh',NULL,'2015-07-10 06:05:14','2015-06-19 02:30:00'),(2,'Craig','craig','spring',1,NULL,NULL,NULL,'',NULL,NULL,'2015-07-10 06:49:46','2015-06-19 02:30:00'),(3,'karthik','viju','ratnesh',1,'hmm','en','activated','karthik','karthik',NULL,'2015-07-10 06:05:14','2015-06-19 02:30:00'),(4,'rat','nesh','123',0,NULL,NULL,NULL,'',NULL,NULL,'2015-06-19 02:30:00','2015-06-19 02:30:00'),(5,'Ratnesh','ratnesh','123',0,NULL,NULL,NULL,'',NULL,NULL,'2015-06-19 02:30:00','2015-06-19 02:30:00'),(7,'rt','golive','$2a$10$9HYRwVB4ZTPJH7XmdFH0P.J4DJQVqtv4a2jj8LbuP5mBmlWEhaliS',0,NULL,NULL,NULL,'',NULL,NULL,'2015-06-19 02:30:00','2015-06-19 02:30:00'),(8,'rat','golive2','$2a$10$r6O3hwAtm3RNqzKFvuWeK.eRldBdB9VXY4wWyZdklok8e9rvldTkm',0,'nesh','en','31042422232062205545','ratnesh',NULL,'abc@gmail.com','2015-06-19 02:30:00','2015-06-19 02:30:00'),(9,'asd','abc','$2a$10$UBbKPWhBKPyGNiPa.5Znr.eWs9ybIX5ac.B3.DtRHsaxU.lNKxGYu',0,'fa','fs','16885185512675287357','ratnesh',NULL,'asfdaf@gmail.com','2015-07-03 09:47:15','2015-07-03 09:47:15'),(10,'asfd','abc','$2a$10$TKYdgReXqwdCd4MRl/LffuyMJh9mMuqbNX2wnBt6sPm/eB6/OhxdO',0,'fa','fs','70511323688287782820','ratnesh',NULL,'asfdaf@gmail.com','2015-07-03 09:48:03','2015-07-03 09:48:03'),(11,'as','as','$2a$10$mHpRpi35GfrHjj4WcJfEcesByIswBFdDAgscUc5isV.EYFfBQU7Y.',0,'','fg','48994124813059430694','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:24','2015-07-03 09:54:24'),(12,'afs','as','$2a$10$LP01H7FfRu7v7cjFintfy.flG4Q/7pBfBft.PefiK5bPAqR/z5OX.',0,'','fg','93758809351870522201','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:30','2015-07-03 09:54:30'),(13,'aas','as','$2a$10$Opq/QZQvde7Ed6B2w.rXeeyrwvhc0NAay86D1ONrIsjOxFj1R4h8i',0,'','fg','83508111932703502762','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:34','2015-07-03 09:54:34'),(14,'asdg','as','$2a$10$BdIrzwvf3fOa/txHlwbGu.kinh2odbK63L4cM2g50FL8KbiCdrN86',0,'','fg','45208542072557512102','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:41','2015-07-03 09:54:41'),(15,'asdgjg','as','$2a$10$D.pXu3lDoZlMUXCgoCjmaOfY0HY8/xyx9mnM1vPlx3x90pVHnbi02',0,'','fg','50962645408316057120','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:47','2015-07-03 09:54:47'),(16,'asdsdgjg','as','$2a$10$v7lsJgPIrxbbLIlxu39TwuBQxA4JlazndsUsfpeExKiXcSdEy0XBy',0,'','fg','52065951824591382060','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:53','2015-07-03 09:54:53'),(17,'agdggjg','as','$2a$10$y1mvMvZ2NNZPeZof85MBjux3ZQ/W2/5OPvKAAH/h/SfIW39vT/pzu',0,'','fg','45859588925978909750','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:54:57','2015-07-03 09:54:57'),(18,'agdgjg','as','$2a$10$Zpqs6KZSx2eKXpimmp.YMegp45mgxzNcgoNpSEd.OBVk5vzj3cH.u',0,'','fg','49063004193400375878','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:00','2015-07-03 09:55:00'),(19,'agdgj','as','$2a$10$r3kwPiymCjzIUZFI5ywwm.eZOqv4EcypeAWQVBieFc8Gv0XElBbpO',0,'','fg','25144201407404644549','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:02','2015-07-03 09:55:02'),(20,'agdj','as','$2a$10$9.71/bHsgx6INKCRz5ec0.60Tp30zD0lboWfeoTUrW.TcC311geEW',0,'','fg','08290323096333177949','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:05','2015-07-03 09:55:05'),(21,'gdj','as','$2a$10$mFTvEn4YkiOlKQYX0BIBK.slP/CTvU2VOrO.FaHpQYeutFdkUOxAC',0,'','fg','97878608431442558091','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:48','2015-07-03 09:55:48'),(22,'gdhjgj','as','$2a$10$aiwHHaWvoXC1vqVnmdkl7urROeUpBtPasWVzhkHZKA7U6uVUKzdua',0,'','fg','75775171793827219010','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:50','2015-07-03 09:55:50'),(23,'gdhjgjljkl','as','$2a$10$UBqfykccA67xsRozqC6JlO0gDCyIskn4D8fU6z6.1y9kCOOA0yCxW',0,'','fg','71282865269992032962','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:53','2015-07-03 09:55:53'),(24,'asfgdhjgjljkl','as','$2a$10$DcOPLOrqubpKcNUabQ23..QqPgrP/KpljmD4wCnK3ya1HaZX2/YLG',0,'','fg','56065450310438062605','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:55','2015-07-03 09:55:55'),(25,'asfgdhjuhkjgjljkl','as','$2a$10$CCALTI.325Z1BxvKu2UiDeHAxd0npHju25x5d9N9GhgTAvSfbs3Pq',0,'','fg','27635296807486667104','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:55:57','2015-07-03 09:55:57'),(26,'afgdhjuhkjgjljkl','as','$2a$10$bKVqdjJTVWjmxvpSLZUJoeaUM0EPtj10GS8NjGt5cubDPRYd6gki6',0,'','fg','32651003291585903339','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:19','2015-07-03 09:56:19'),(27,'afgdhjuhkjjljkl','as','$2a$10$BgEt9e58HeseQHsetl4kpOZwYEWRMNMA3EDpFoK3SOxrTA.G4wCgq',0,'','fg','21487602105276813014','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:21','2015-07-03 09:56:21'),(28,'afgdhjuhkjjlkl','as','$2a$10$LtmezJuUt/sCAqJl4YNkg.tipXXq9weSC5YNDq7vkKtqRcvhW2gIC',0,'','fg','59792596658649232125','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:23','2015-07-03 09:56:23'),(29,'afgdjuhkjjlkl','as','$2a$10$OTnO1eTJuCb.LVmBXMnlo.sulZOokAUsm0nuaJ2AdUX0zqv9zGziS',0,'','fg','87090556529949995529','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:25','2015-07-03 09:56:25'),(30,'afgdjuhkjlkl','as','$2a$10$w5P9hHbmSrYzCUYDguv34OEmnf2ag06R2v.4rk1lf2FkrfX0ZVMLy',0,'','fg','90457716749667719537','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:26','2015-07-03 09:56:26'),(31,'afdjuhkjlkl','as','$2a$10$/Q72PDKpQQHLwwM8wZtd6uwKhSBKffrQDhoq3t1HPaT6Jl1Rz0R0m',0,'','fg','05724866618182118270','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:28','2015-07-03 09:56:28'),(32,'afdjuhkjll','as','$2a$10$de3NMecKcA7uXjGYE4jd4uMcJY.6CE1xfHDIzmPF/VhQk6E.BY6D2',0,'','fg','27870845566948840613','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:30','2015-07-03 09:56:30'),(33,'afdjuhjll','as','$2a$10$N2mCU1KaOzsFR0ANaqBLz.PMVob663Y7ZEmnVaU2zRBTPEtYWS0re',0,'','fg','75589073893773710772','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:37','2015-07-03 09:56:37'),(34,'afdjuhjll','as','$2a$10$hYG4m8uVbT79L5WzysHuWuhx14B/oNjl9egN7qGACkETG3JJzWzdO',0,'','fg','38468361190304025248','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:38','2015-07-03 09:56:38'),(35,'afdjujll','as','$2a$10$1Mjv.ITilV.G/ZznvOly6O18reLZXw9.mb7pqRpgvlimg4bhueCXC',0,'','fg','72576691956123224745','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:40','2015-07-03 09:56:40'),(36,'afdjujl','as','$2a$10$0ToXl1QpwAtB3lIm65walOLNI1nJm2SyUQkNO1wB1SOKNVCi/fN1G',0,'','fg','97996999807495267959','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:42','2015-07-03 09:56:42'),(37,'adjujl','as','$2a$10$ONx.Lb1jnx79VhtNpRap0uEFdTBKQ79Sh7a7X4ZrsDfedEeKCksHq',0,'','fg','64876067010332912455','ratnesh',NULL,'hj@gmail.com','2015-07-03 09:56:45','2015-07-03 09:56:45');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authority` (
  `user_id` int(11) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`authority_name`,`user_id`),
  KEY `fk_user_authority_1_idx` (`user_id`),
  CONSTRAINT `fk_user_authority_1` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_authority_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
INSERT INTO `user_authority` VALUES (1,'ROLE_USER'),(2,'ROLE_OAUTH_ADMIN'),(8,'ROLE_USER'),(9,'ROLE_USER'),(10,'ROLE_USER'),(11,'ROLE_USER'),(12,'ROLE_USER'),(13,'ROLE_USER'),(14,'ROLE_USER'),(15,'ROLE_USER'),(16,'ROLE_USER'),(17,'ROLE_USER'),(18,'ROLE_USER'),(19,'ROLE_USER'),(20,'ROLE_USER'),(21,'ROLE_USER'),(22,'ROLE_USER'),(23,'ROLE_USER'),(24,'ROLE_USER'),(25,'ROLE_USER'),(26,'ROLE_USER'),(27,'ROLE_USER'),(28,'ROLE_USER'),(29,'ROLE_USER'),(30,'ROLE_USER'),(31,'ROLE_USER'),(32,'ROLE_USER'),(33,'ROLE_USER'),(34,'ROLE_USER'),(35,'ROLE_USER'),(36,'ROLE_USER'),(37,'ROLE_USER');
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oauth-integration-2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-10 16:55:49
