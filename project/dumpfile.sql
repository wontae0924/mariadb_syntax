-- MariaDB dump 10.19-11.3.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `address` varchar(255) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'kim',NULL,NULL,'admin',NULL,21),
(2,'lww',NULL,NULL,'user',NULL,23),
(3,'lwt',NULL,NULL,'user',NULL,25),
(4,'abc','xxx@naver.com',NULL,'user',NULL,25),
(5,'qwer',NULL,NULL,'user',NULL,28),
(6,'test','test@naver,com',NULL,'user',NULL,31),
(7,'abc','test10@naver,com',NULL,'user',NULL,32);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `author_for_view`
--

DROP TABLE IF EXISTS `author_for_view`;
/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `author_for_view` AS SELECT
 1 AS `name`,
  1 AS `email` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(50) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `post_author_fk` (`author_id`),
  CONSTRAINT `post_author_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'title1','hello world1',1,200.000,'2021-01-05 00:00:00.000000'),
(2,'title2','hello world2',1,230.000,'2023-11-17 00:00:00.000000'),
(3,'title2','hello world3',2,180.000,'2023-01-01 00:00:00.000000'),
(4,'title4','hello world4',2,160.000,'2022-02-02 00:00:00.000000'),
(5,'title5','hello world5',3,400.000,'2023-10-17 00:00:00.000000'),
(6,'price1',NULL,4,450.000,'2023-05-05 00:00:00.000000'),
(7,'price2',NULL,5,330.000,'2023-09-24 00:00:00.000000'),
(8,'lee',NULL,5,245.000,'2023-06-06 00:00:00.000000'),
(9,'kim222',NULL,4,190.000,'2023-11-20 11:34:38.899232'),
(10,'hello','hello is',4,260.000,'2023-11-20 17:11:48.248054'),
(16,'ss','sdsdsdsd',2,NULL,'2023-11-22 14:33:58.561219'),
(17,'hello world ',NULL,NULL,NULL,'2023-11-22 16:09:06.061827'),
(18,'hello world 0',NULL,NULL,NULL,'2023-11-22 16:10:38.622873'),
(19,'hello world 1',NULL,NULL,NULL,'2023-11-22 16:10:38.625850'),
(20,'hello world 2',NULL,NULL,NULL,'2023-11-22 16:10:38.626589'),
(21,'hello world 3',NULL,NULL,NULL,'2023-11-22 16:10:38.627521'),
(22,'hello world 4',NULL,NULL,NULL,'2023-11-22 16:10:38.628215'),
(23,'hello world 5',NULL,NULL,NULL,'2023-11-22 16:10:38.629179'),
(24,'hello world 6',NULL,NULL,NULL,'2023-11-22 16:10:38.629960'),
(25,'hello world 7',NULL,NULL,NULL,'2023-11-22 16:10:38.630799'),
(26,'hello world 8',NULL,NULL,NULL,'2023-11-22 16:10:38.631835'),
(27,'hello world 9',NULL,NULL,NULL,'2023-11-22 16:10:38.632676'),
(28,'hello world 10',NULL,NULL,NULL,'2023-11-22 16:10:38.634613'),
(29,'hello world 11',NULL,NULL,NULL,'2023-11-22 16:10:38.635606'),
(30,'hello world 12',NULL,NULL,NULL,'2023-11-22 16:10:38.636455'),
(31,'hello world 13',NULL,NULL,NULL,'2023-11-22 16:10:38.637441'),
(32,'hello world 14',NULL,NULL,NULL,'2023-11-22 16:10:38.638519'),
(33,'hello world 15',NULL,NULL,NULL,'2023-11-22 16:10:38.639596'),
(34,'hello world 16',NULL,NULL,NULL,'2023-11-22 16:10:38.640575'),
(35,'hello world 17',NULL,NULL,NULL,'2023-11-22 16:10:38.641523'),
(36,'hello world 18',NULL,NULL,NULL,'2023-11-22 16:10:38.642135'),
(37,'hello world 19',NULL,NULL,NULL,'2023-11-22 16:10:38.642822'),
(38,'hello world 20',NULL,NULL,NULL,'2023-11-22 16:10:38.643415'),
(39,'hello world 21',NULL,NULL,NULL,'2023-11-22 16:10:38.644092'),
(40,'hello world 22',NULL,NULL,NULL,'2023-11-22 16:10:38.644809'),
(41,'hello world 23',NULL,NULL,NULL,'2023-11-22 16:10:38.645393'),
(42,'hello world 24',NULL,NULL,NULL,'2023-11-22 16:10:38.646006'),
(43,'hello world 25',NULL,NULL,NULL,'2023-11-22 16:10:38.646609'),
(44,'hello world 26',NULL,NULL,NULL,'2023-11-22 16:10:38.647197'),
(45,'hello world 27',NULL,NULL,NULL,'2023-11-22 16:10:38.647781'),
(46,'hello world 28',NULL,NULL,NULL,'2023-11-22 16:10:38.648471'),
(47,'hello world 29',NULL,NULL,NULL,'2023-11-22 16:10:38.649040'),
(48,'hello world 30',NULL,NULL,NULL,'2023-11-22 16:10:38.649602'),
(49,'hello world 31',NULL,NULL,NULL,'2023-11-22 16:10:38.650247'),
(50,'hello world 32',NULL,NULL,NULL,'2023-11-22 16:10:38.650918'),
(51,'hello world 33',NULL,NULL,NULL,'2023-11-22 16:10:38.651648'),
(52,'hello world 34',NULL,NULL,NULL,'2023-11-22 16:10:38.652194'),
(53,'hello world 35',NULL,NULL,NULL,'2023-11-22 16:10:38.652786'),
(54,'hello world 36',NULL,NULL,NULL,'2023-11-22 16:10:38.653339'),
(55,'hello world 37',NULL,NULL,NULL,'2023-11-22 16:10:38.653898'),
(56,'hello world 38',NULL,NULL,NULL,'2023-11-22 16:10:38.654493'),
(57,'hello world 39',NULL,NULL,NULL,'2023-11-22 16:10:38.655068'),
(58,'hello world 40',NULL,NULL,NULL,'2023-11-22 16:10:38.655616'),
(59,'hello world 41',NULL,NULL,NULL,'2023-11-22 16:10:38.656207'),
(60,'hello world 42',NULL,NULL,NULL,'2023-11-22 16:10:38.656776'),
(61,'hello world 43',NULL,NULL,NULL,'2023-11-22 16:10:38.657335'),
(62,'hello world 44',NULL,NULL,NULL,'2023-11-22 16:10:38.657892'),
(63,'hello world 45',NULL,NULL,NULL,'2023-11-22 16:10:38.658451'),
(64,'hello world 46',NULL,NULL,NULL,'2023-11-22 16:10:38.658989'),
(65,'hello world 47',NULL,NULL,NULL,'2023-11-22 16:10:38.659599'),
(66,'hello world 48',NULL,NULL,NULL,'2023-11-22 16:10:38.660179'),
(67,'hello world 49',NULL,NULL,NULL,'2023-11-22 16:10:38.660758'),
(68,'hello world 50',NULL,NULL,NULL,'2023-11-22 16:10:38.661350'),
(69,'hello world 51',NULL,NULL,NULL,'2023-11-22 16:10:38.661955'),
(70,'hello world 52',NULL,NULL,NULL,'2023-11-22 16:10:38.662526'),
(71,'hello world 53',NULL,NULL,NULL,'2023-11-22 16:10:38.663091'),
(72,'hello world 54',NULL,NULL,NULL,'2023-11-22 16:10:38.663728'),
(73,'hello world 55',NULL,NULL,NULL,'2023-11-22 16:10:38.664598'),
(74,'hello world 56',NULL,NULL,NULL,'2023-11-22 16:10:38.665602'),
(75,'hello world 57',NULL,NULL,NULL,'2023-11-22 16:10:38.666405'),
(76,'hello world 58',NULL,NULL,NULL,'2023-11-22 16:10:38.667030'),
(77,'hello world 59',NULL,NULL,NULL,'2023-11-22 16:10:38.667649'),
(78,'hello world 60',NULL,NULL,NULL,'2023-11-22 16:10:38.668164'),
(79,'hello world 61',NULL,NULL,NULL,'2023-11-22 16:10:38.668687'),
(80,'hello world 62',NULL,NULL,NULL,'2023-11-22 16:10:38.669551'),
(81,'hello world 63',NULL,NULL,NULL,'2023-11-22 16:10:38.670476'),
(82,'hello world 64',NULL,NULL,NULL,'2023-11-22 16:10:38.671471'),
(83,'hello world 65',NULL,NULL,NULL,'2023-11-22 16:10:38.672365'),
(84,'hello world 66',NULL,NULL,NULL,'2023-11-22 16:10:38.672920'),
(85,'hello world 67',NULL,NULL,NULL,'2023-11-22 16:10:38.673465'),
(86,'hello world 68',NULL,NULL,NULL,'2023-11-22 16:10:38.673974'),
(87,'hello world 69',NULL,NULL,NULL,'2023-11-22 16:10:38.674528'),
(88,'hello world 70',NULL,NULL,NULL,'2023-11-22 16:10:38.675075'),
(89,'hello world 71',NULL,NULL,NULL,'2023-11-22 16:10:38.675602'),
(90,'hello world 72',NULL,NULL,NULL,'2023-11-22 16:10:38.676133'),
(91,'hello world 73',NULL,NULL,NULL,'2023-11-22 16:10:38.676647'),
(92,'hello world 74',NULL,NULL,NULL,'2023-11-22 16:10:38.677156'),
(93,'hello world 75',NULL,NULL,NULL,'2023-11-22 16:10:38.677673'),
(94,'hello world 76',NULL,NULL,NULL,'2023-11-22 16:10:38.678182'),
(95,'hello world 77',NULL,NULL,NULL,'2023-11-22 16:10:38.678715'),
(96,'hello world 78',NULL,NULL,NULL,'2023-11-22 16:10:38.679255'),
(97,'hello world 79',NULL,NULL,NULL,'2023-11-22 16:10:38.679806'),
(98,'hello world 80',NULL,NULL,NULL,'2023-11-22 16:10:38.680335'),
(99,'hello world 81',NULL,NULL,NULL,'2023-11-22 16:10:38.680869'),
(100,'hello world 82',NULL,NULL,NULL,'2023-11-22 16:10:38.681397'),
(101,'hello world 83',NULL,NULL,NULL,'2023-11-22 16:10:38.681939'),
(102,'hello world 84',NULL,NULL,NULL,'2023-11-22 16:10:38.682505'),
(103,'hello world 85',NULL,NULL,NULL,'2023-11-22 16:10:38.683060'),
(104,'hello world 86',NULL,NULL,NULL,'2023-11-22 16:10:38.683587'),
(105,'hello world 87',NULL,NULL,NULL,'2023-11-22 16:10:38.684109'),
(106,'hello world 88',NULL,NULL,NULL,'2023-11-22 16:10:38.684629'),
(107,'hello world 89',NULL,NULL,NULL,'2023-11-22 16:10:38.685155'),
(108,'hello world 90',NULL,NULL,NULL,'2023-11-22 16:10:38.685724'),
(109,'hello world 91',NULL,NULL,NULL,'2023-11-22 16:10:38.686262'),
(110,'hello world 92',NULL,NULL,NULL,'2023-11-22 16:10:38.686814'),
(111,'hello world 93',NULL,NULL,NULL,'2023-11-22 16:10:38.687403'),
(112,'hello world 94',NULL,NULL,NULL,'2023-11-22 16:10:38.687938'),
(113,'hello world 95',NULL,NULL,NULL,'2023-11-22 16:10:38.688474'),
(114,'hello world 96',NULL,NULL,NULL,'2023-11-22 16:10:38.689009'),
(115,'hello world 97',NULL,NULL,NULL,'2023-11-22 16:10:38.689546'),
(116,'hello world 98',NULL,NULL,NULL,'2023-11-22 16:10:38.690167'),
(117,'hello world 99',NULL,NULL,NULL,'2023-11-22 16:10:38.690734'),
(118,'hello world 100',NULL,NULL,NULL,'2023-11-22 16:10:38.691263');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `author_for_view`
--

/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `author_for_view` AS select `author`.`name` AS `name`,`author`.`email` AS `email` from `author` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 17:15:33
