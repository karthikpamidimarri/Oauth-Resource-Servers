-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2015 at 04:03 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `resource_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`name`) VALUES
('ROLE_ADMIN'),
('ROLE_GUEST'),
('ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE IF NOT EXISTS `credentials` (
  `id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `enabled`, `name`, `password`, `version`) VALUES
(0, 1, 'oauth_admin', 'admin', 0),
(1, 1, 'resource_admin', 'admin', 0),
(2, 1, 'user', 'user', 0),
(4, 1, 'karthik', 'karthik', 1),
(5, 1, 'user1', 'user', 0),
(6, 1, 'Divvy', 'Divvy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `credentials_authorities`
--

CREATE TABLE IF NOT EXISTS `credentials_authorities` (
  `credentials_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credentials_authorities`
--

INSERT INTO `credentials_authorities` (`credentials_id`, `authorities_id`) VALUES
(0, 0),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE IF NOT EXISTS `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `done` tinyint(4) NOT NULL,
  `done_time` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `message`, `done`, `done_time`, `version`) VALUES
(1, 'First Message', 1, '2015-07-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `login`, `password`, `activated`, `last_name`, `lang_key`, `activation_key`, `last_modified_by`, `email`, `created_date`, `last_modified_date`) VALUES
(1, 'admin', 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 1, 'admin', 'en', 'activated', 'ratnesh', 'ratnesh@gmial.com', '2015-07-09 10:18:35', '2015-07-09 10:18:35'),
(62, NULL, 'sundayratnesh2015', '$2a$10$ixe0IM9WRtVJruc2B/oXR.CywO8g881016SqPib94qdtE8A87c23u', 1, NULL, NULL, NULL, NULL, NULL, '2015-07-12 05:28:35', '2015-07-12 05:28:35'),
(67, NULL, 'ratneshchandak', '$2a$10$OcDBrVVNW9/d4UVwAtQzxe5XoFjHKR5wuJ2S6dBSRrosr38Oo/Ws2', 1, NULL, NULL, NULL, NULL, NULL, '2015-07-13 13:31:05', '2015-07-13 13:31:05'),
(68, NULL, 'chandakratnesh', '$2a$10$KtPon449VLFC92MxseK2WuDaXODhFwD9QE26uGQA8Pjt9wvGs0dpm', 1, NULL, NULL, NULL, NULL, NULL, '2015-07-14 09:32:53', '2015-07-14 09:32:53'),
(69, NULL, 'sireeshagalla', '$2a$10$Aj6joamC4pQ5996rNzI1JuTH3gCPxXNncwOPIBwI3Ket9QcAwd6/S', 1, NULL, NULL, NULL, NULL, NULL, '2015-07-14 12:18:22', '2015-07-14 12:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_authority`
--

CREATE TABLE IF NOT EXISTS `user_authority` (
  `user_id` int(11) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`authority_name`,`user_id`),
  KEY `fk_user_authority_1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_authority`
--

INSERT INTO `user_authority` (`user_id`, `authority_name`) VALUES
(1, 'ROLE_ADMIN'),
(62, 'ROLE_USER'),
(67, 'ROLE_USER'),
(68, 'ROLE_USER'),
(69, 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_authority`
--
ALTER TABLE `user_authority`
  ADD CONSTRAINT `fk_user_authority_1` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_authority_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
