-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 12, 2023 at 04:51 PM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `Auto`
--

DROP TABLE IF EXISTS `Auto`;
CREATE TABLE IF NOT EXISTS `Auto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(8) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `InstructeurId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AutoInstructeur` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Auto`
--

INSERT INTO `Auto` (`Id`, `Kenteken`, `Type`, `InstructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(10) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`Id`, `Kenteken`, `Type`, `InstructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CapitalCity` varchar(100) NOT NULL,
  `Continent` enum('Noord-Amerika','Zuid-Amerika','Afrika','Oceani&euml;','Europa','Azi&euml;','Antartica') NOT NULL,
  `Population` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `Name`, `CapitalCity`, `Continent`, `Population`) VALUES
(5, 'The Netherlands', 'Amsterdam', 'Europa', 18000000),
(6, 'Japan', 'Tokyo', 'Azi&euml;', 200000000),
(7, 'Curryland', 'Ketchup', 'Europa', 101);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CapitalCity` varchar(100) NOT NULL,
  `Continent` varchar(100) NOT NULL,
  `Population` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `Name`, `CapitalCity`, `Continent`, `Population`) VALUES
(6, 'Nederland', 'Amsterdam', 'Europa', 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `Instructeur`
--

DROP TABLE IF EXISTS `Instructeur`;
CREATE TABLE IF NOT EXISTS `Instructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@mail.nl', 'Groen'),
(2, 'manhoi@google.com', 'Manhoi'),
(3, 'zoyi@google.sp', 'Zoyi'),
(4, 'berthold@gmail.com', 'Berthold'),
(5, 'denekamp@gmail.com', 'Denekamp');

-- --------------------------------------------------------

--
-- Table structure for table `Kilometerstand`
--

DROP TABLE IF EXISTS `Kilometerstand`;
CREATE TABLE IF NOT EXISTS `Kilometerstand` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) DEFAULT NULL,
  `Datum` date NOT NULL,
  `KmStand` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `KilometerstandAuto` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Kilometerstand`
--

INSERT INTO `Kilometerstand` (`Id`, `AutoId`, `Datum`, `KmStand`) VALUES
(1, 4, '2022-12-05', 70788),
(2, 2, '2022-12-05', 12670),
(3, 1, '2022-12-06', 60345),
(4, 3, '2022-12-07', 21300),
(5, 1, '2022-12-07', 60900),
(6, 1, '2022-12-12', 414141),
(7, 1, '2022-12-12', 414),
(8, 1, '2022-12-12', 414),
(9, 1, '2022-12-12', 34223552),
(10, 2, '2022-12-12', 123455),
(11, 4, '2022-12-12', 686869);

-- --------------------------------------------------------

--
-- Table structure for table `Leerling`
--

DROP TABLE IF EXISTS `Leerling`;
CREATE TABLE IF NOT EXISTS `Leerling` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Leerling`
--

INSERT INTO `Leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Table structure for table `Les`
--

DROP TABLE IF EXISTS `Les`;
CREATE TABLE IF NOT EXISTS `Les` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `LeerlingId` int(11) DEFAULT NULL,
  `InstructeurId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesInstructeur` (`InstructeurId`),
  KEY `LesLeerling` (`LeerlingId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Les`
--

INSERT INTO `Les` (`Id`, `Datum`, `LeerlingId`, `InstructeurId`) VALUES
(45, '2022-05-20 00:00:00', 3, 1),
(46, '2022-05-20 00:00:00', 6, 3),
(47, '2022-05-21 00:00:00', 4, 2),
(48, '2022-05-21 00:00:00', 6, 3),
(49, '2022-05-22 00:00:00', 3, 1),
(50, '2022-05-28 00:00:00', 4, 2),
(51, '2022-06-01 00:00:00', 3, 2),
(52, '2022-06-12 00:00:00', 3, 1),
(53, '2022-06-22 00:00:00', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Mankement`
--

DROP TABLE IF EXISTS `Mankement`;
CREATE TABLE IF NOT EXISTS `Mankement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Mankement` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mankement`
--

INSERT INTO `Mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES
(27, 3, '2023-01-12', 'hoi');

-- --------------------------------------------------------

--
-- Table structure for table `onderwerp`
--

DROP TABLE IF EXISTS `onderwerp`;
CREATE TABLE IF NOT EXISTS `onderwerp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LesId` int(11) NOT NULL,
  `Onderwerp` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `a` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2364 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onderwerp`
--

INSERT INTO `onderwerp` (`Id`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Invoegen snelweg'),
(2347, 50, 'Achteruit rijden'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'Invoegen snelweg'),
(2350, 52, 'File parkeren'),
(2352, 45, 'heel goed gedaan'),
(2359, 45, 'a'),
(2360, 45, 'a'),
(2361, 45, 'aaa'),
(2362, 45, 'goed gereden'),
(2363, 45, 'lekker gereden');

-- --------------------------------------------------------

--
-- Table structure for table `opmerking`
--

DROP TABLE IF EXISTS `opmerking`;
CREATE TABLE IF NOT EXISTS `opmerking` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LesId` int(11) NOT NULL,
  `Opmerking` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Les` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opmerking`
--

INSERT INTO `opmerking` (`Id`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 45, 'Langzamer doorrijden bij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'Richtingaanwijzer aan');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Auto`
--
ALTER TABLE `Auto`
  ADD CONSTRAINT `AutoInstructeur` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `Kilometerstand`
--
ALTER TABLE `Kilometerstand`
  ADD CONSTRAINT `KilometerstandAuto` FOREIGN KEY (`AutoId`) REFERENCES `Auto` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `Les`
--
ALTER TABLE `Les`
  ADD CONSTRAINT `LesInstructeur` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `LesLeerling` FOREIGN KEY (`LeerlingId`) REFERENCES `Leerling` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `onderwerp`
--
ALTER TABLE `onderwerp`
  ADD CONSTRAINT `a` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);

--
-- Constraints for table `opmerking`
--
ALTER TABLE `opmerking`
  ADD CONSTRAINT `Les` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
