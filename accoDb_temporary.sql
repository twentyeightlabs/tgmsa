-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: accoDb_temporary
-- ------------------------------------------------------
-- Server version	5.5.57-0+deb8u1-log

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
-- Current Database: `accoDb_temporary`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `accoDb_temporary` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `accoDb_temporary`;

--
-- Table structure for table `ACCOWejsciaNaMapie`
--

DROP TABLE IF EXISTS `ACCOWejsciaNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOWejsciaNaMapie` (
  `idWejscia` int(11) NOT NULL,
  `idMapa` int(11) NOT NULL,
  `numerWejscia` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `obrot` double NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idWejscia`),
  KEY `fk_ACCOWejsciaNaMapie_Wejscie` (`idWejscia`),
  KEY `fk_ACCOWejscia_modify` (`modifyUser`),
  CONSTRAINT `fk_ACCOWejsciaNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ACCOWejsciaNaMapie_Wejscie` FOREIGN KEY (`idWejscia`) REFERENCES `WejscieCentralaNT` (`idWejscia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ACCOWejscia_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOWejsciaNaMapie`
--

LOCK TABLES `ACCOWejsciaNaMapie` WRITE;
/*!40000 ALTER TABLE `ACCOWejsciaNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCOWejsciaNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCOWyjsciaNaMapie`
--

DROP TABLE IF EXISTS `ACCOWyjsciaNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOWyjsciaNaMapie` (
  `idWyjscia` int(11) NOT NULL,
  `idMapa` int(11) NOT NULL,
  `numerWyjscia` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `obrot` double NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idWyjscia`),
  KEY `fk_ACCOWyjsciaNaMapie_Wyjscie` (`idWyjscia`),
  KEY `fk_ACCOWyjscia_modify` (`modifyUser`),
  CONSTRAINT `fk_ACCOWyjsciaNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ACCOWyjsciaNaMapie_Wyjscie` FOREIGN KEY (`idWyjscia`) REFERENCES `WyjscieCentralaNT` (`idWyjscia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ACCOWyjscia_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOWyjsciaNaMapie`
--

LOCK TABLES `ACCOWyjsciaNaMapie` WRITE;
/*!40000 ALTER TABLE `ACCOWyjsciaNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCOWyjsciaNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CentralaNT`
--

DROP TABLE IF EXISTS `CentralaNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CentralaNT` (
  `idCentralaNT` int(11) NOT NULL AUTO_INCREMENT,
  `idObiekt` int(11) DEFAULT NULL,
  `nazwa` varchar(45) DEFAULT '?????',
  `identyfikator` char(12) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `strefaCzasowa` int(11) NOT NULL DEFAULT '0',
  `generujKonfiguracje` tinyint(1) NOT NULL DEFAULT '0',
  `konfiguracjaJestGenerowana` tinyint(1) NOT NULL DEFAULT '0',
  `czasBrakuZasilania` smallint(6) DEFAULT '0',
  `wylaczCentrale` tinyint(1) NOT NULL DEFAULT '0',
  `kluczKodowania` varchar(45) DEFAULT NULL,
  `integration` tinyint(1) NOT NULL DEFAULT '1',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCentralaNT`),
  UNIQUE KEY `ident_unique` (`identyfikator`),
  KEY `fk_CentralaNT_Obiekt` (`idObiekt`),
  KEY `fk_centrala_modify` (`modifyUser`),
  CONSTRAINT `fk_CentralaNT_Obiekt` FOREIGN KEY (`idObiekt`) REFERENCES `Obiekt` (`idObiekt`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_centrala_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CentralaNT`
--

LOCK TABLES `CentralaNT` WRITE;
/*!40000 ALTER TABLE `CentralaNT` DISABLE KEYS */;
INSERT INTO `CentralaNT` VALUES (1,1,'HALA','001B9C0200A0','',0,0,0,0,0,'UvuwE0hDuwRm4cIjThJmEg==',1,NULL,NULL,0);
/*!40000 ALTER TABLE `CentralaNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CentralaNTUzytkownicy`
--

DROP TABLE IF EXISTS `CentralaNTUzytkownicy`;
/*!50001 DROP VIEW IF EXISTS `CentralaNTUzytkownicy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CentralaNTUzytkownicy` (
  `idCentralaNT` tinyint NOT NULL,
  `iduzytkownik` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DostepDoObiektu`
--

DROP TABLE IF EXISTS `DostepDoObiektu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DostepDoObiektu` (
  `idUzytkownik` int(11) NOT NULL,
  `idObiekt` int(11) NOT NULL,
  `stan` tinyint(1) NOT NULL DEFAULT '0',
  `serwis` tinyint(1) NOT NULL DEFAULT '0',
  `mapy` tinyint(1) NOT NULL DEFAULT '0',
  `zdarzenia` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idObiekt`,`idUzytkownik`),
  UNIQUE KEY `fk_DostepDoObiektu_unique` (`idObiekt`,`idUzytkownik`),
  KEY `fk_DostepDoObiektu_uzytkownik` (`idUzytkownik`),
  KEY `fk_dostep_do_obiektu_modify` (`modifyUser`),
  CONSTRAINT `fk_DostepDoObiektu_obiekt` FOREIGN KEY (`idObiekt`) REFERENCES `Obiekt` (`idObiekt`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DostepDoObiektu_uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `UzytkownikProgramu` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dostep_do_obiektu_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DostepDoObiektu`
--

LOCK TABLES `DostepDoObiektu` WRITE;
/*!40000 ALTER TABLE `DostepDoObiektu` DISABLE KEYS */;
/*!40000 ALTER TABLE `DostepDoObiektu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EkspanderCentralaNT`
--

DROP TABLE IF EXISTS `EkspanderCentralaNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EkspanderCentralaNT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `nazwa` varchar(32) NOT NULL,
  `adres` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `typ` tinyint(3) unsigned NOT NULL COMMENT '0(ACCO-NT), 1(INT-O), 2(INT-E), 3(INT-PP), 4(INT-RXS)',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ekspanderCentrali_UNIQUE` (`idCentralaNT`,`adres`),
  KEY `fk_ekspander_modify` (`modifyUser`),
  CONSTRAINT `fk_ekspander_centrali` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ekspander_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EkspanderCentralaNT`
--

LOCK TABLES `EkspanderCentralaNT` WRITE;
/*!40000 ALTER TABLE `EkspanderCentralaNT` DISABLE KEYS */;
INSERT INTO `EkspanderCentralaNT` VALUES (2,1,'INT-RX-S',10,4,NULL,NULL,0);
/*!40000 ALTER TABLE `EkspanderCentralaNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ethm`
--

DROP TABLE IF EXISTS `Ethm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ethm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `numer` tinyint(4) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `port` smallint(6) NOT NULL DEFAULT '1',
  `klucz` varchar(12) DEFAULT NULL,
  `haslo` varchar(60) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ethm_UNIQUE` (`idCentralaNT`,`numer`),
  CONSTRAINT `fk_ethm_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ethm`
--

LOCK TABLES `Ethm` WRITE;
/*!40000 ALTER TABLE `Ethm` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ethm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GrupaUzytkownikow`
--

DROP TABLE IF EXISTS `GrupaUzytkownikow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GrupaUzytkownikow` (
  `idGrupaUzytkownikow` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(32) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `K` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idGrupaUzytkownikow`),
  KEY `fk_grupa_uzytkownikow_modify` (`modifyUser`),
  CONSTRAINT `fk_grupa_uzytkownikow_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GrupaUzytkownikow`
--

LOCK TABLES `GrupaUzytkownikow` WRITE;
/*!40000 ALTER TABLE `GrupaUzytkownikow` DISABLE KEYS */;
INSERT INTO `GrupaUzytkownikow` VALUES (2,'Parking Hala','',0,NULL,NULL,0),(3,'Wejscie Hala','',0,NULL,NULL,0),(4,'Hala','',0,NULL,NULL,0),(5,'Remondis','',0,NULL,NULL,0);
/*!40000 ALTER TABLE `GrupaUzytkownikow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTPrzypisanieStref`
--

DROP TABLE IF EXISTS `INTPrzypisanieStref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTPrzypisanieStref` (
  `idStrefyIntegra` int(11) NOT NULL,
  `idStrefyNT` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStrefyIntegra`),
  UNIQUE KEY `przypisanieStref_UNIQUE` (`idStrefyIntegra`),
  UNIQUE KEY `przypisanieStref_strefaNT_UNIQUE` (`idStrefyNT`),
  KEY `fk_INTPrzypisanieStref_modify` (`modifyUser`),
  CONSTRAINT `fk_INTPrzypisanieStref_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_przypisanie_strefaNT` FOREIGN KEY (`idStrefyNT`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTPrzypisanieStref`
--

LOCK TABLES `INTPrzypisanieStref` WRITE;
/*!40000 ALTER TABLE `INTPrzypisanieStref` DISABLE KEYS */;
/*!40000 ALTER TABLE `INTPrzypisanieStref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTWejsciaNaMapie`
--

DROP TABLE IF EXISTS `INTWejsciaNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTWejsciaNaMapie` (
  `idMapa` int(11) NOT NULL,
  `idWejscia` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `obrot` double NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idWejscia`),
  UNIQUE KEY `u_INTWejsciaNaMapie` (`idMapa`,`idWejscia`),
  KEY `fk_INTWejscia_modify` (`modifyUser`),
  CONSTRAINT `fk_INTWejsciaNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_INTWejscia_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTWejsciaNaMapie`
--

LOCK TABLES `INTWejsciaNaMapie` WRITE;
/*!40000 ALTER TABLE `INTWejsciaNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `INTWejsciaNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTWyjsciaNaMapie`
--

DROP TABLE IF EXISTS `INTWyjsciaNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTWyjsciaNaMapie` (
  `idMapa` int(11) NOT NULL,
  `idWyjscia` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `obrot` double NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idWyjscia`),
  UNIQUE KEY `u_INTWejsciaNaMapie` (`idMapa`,`idWyjscia`),
  KEY `fk_INTWyjscia_modify` (`modifyUser`),
  CONSTRAINT `fk_INTWyjsciaNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_INTWyjscia_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTWyjsciaNaMapie`
--

LOCK TABLES `INTWyjsciaNaMapie` WRITE;
/*!40000 ALTER TABLE `INTWyjsciaNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `INTWyjsciaNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InfoWejscieKontroler`
--

DROP TABLE IF EXISTS `InfoWejscieKontroler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoWejscieKontroler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idKontroler` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `tekst` varchar(45) NOT NULL DEFAULT '',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `infoWejscieKontroler_UNIQUE` (`idKontroler`,`numer`),
  KEY `fk_Kontroler_InfoWejscie_idx` (`idKontroler`),
  CONSTRAINT `fk_Kontroler_InfoWejscie` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfoWejscieKontroler`
--

LOCK TABLES `InfoWejscieKontroler` WRITE;
/*!40000 ALTER TABLE `InfoWejscieKontroler` DISABLE KEYS */;
INSERT INTO `InfoWejscieKontroler` VALUES (1,1,0,'',NULL,NULL,0),(2,1,1,'',NULL,NULL,0),(3,1,2,'',NULL,NULL,0),(4,1,3,'',NULL,NULL,0),(9,3,0,'',NULL,NULL,0),(10,3,1,'',NULL,NULL,0),(11,3,2,'',NULL,NULL,0),(12,3,3,'',NULL,NULL,0),(13,4,0,'',NULL,NULL,0),(14,4,1,'',NULL,NULL,0),(15,4,2,'',NULL,NULL,0),(16,4,3,'',NULL,NULL,0),(17,5,0,'',NULL,NULL,0),(18,5,1,'',NULL,NULL,0),(19,5,2,'',NULL,NULL,0),(20,5,3,'',NULL,NULL,0),(21,6,0,'',NULL,NULL,0),(22,6,1,'',NULL,NULL,0),(23,6,2,'',NULL,NULL,0),(24,6,3,'',NULL,NULL,0),(25,7,0,'',NULL,NULL,0),(26,7,1,'',NULL,NULL,0),(27,7,2,'',NULL,NULL,0),(28,7,3,'',NULL,NULL,0),(29,8,0,'',NULL,NULL,0),(30,8,1,'',NULL,NULL,0),(31,8,2,'',NULL,NULL,0),(32,8,3,'',NULL,NULL,0),(33,9,0,'',NULL,NULL,0),(34,9,1,'',NULL,NULL,0),(35,9,2,'',NULL,NULL,0),(36,9,3,'',NULL,NULL,0),(37,10,0,'',NULL,NULL,0),(38,10,1,'',NULL,NULL,0),(39,10,2,'',NULL,NULL,0),(40,10,3,'',NULL,NULL,0),(41,11,0,'',NULL,NULL,0),(42,11,1,'',NULL,NULL,0),(43,11,2,'',NULL,NULL,0),(44,11,3,'',NULL,NULL,0),(45,12,0,'',NULL,NULL,0),(46,12,1,'',NULL,NULL,0),(47,12,2,'',NULL,NULL,0),(48,12,3,'',NULL,NULL,0),(49,13,0,'',NULL,NULL,0),(50,13,1,'',NULL,NULL,0),(51,13,2,'',NULL,NULL,0),(52,13,3,'',NULL,NULL,0);
/*!40000 ALTER TABLE `InfoWejscieKontroler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KameraNaMapie`
--

DROP TABLE IF EXISTS `KameraNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KameraNaMapie` (
  `idKamera` int(11) NOT NULL AUTO_INCREMENT,
  `idMapa` int(11) NOT NULL,
  `nazwa` varchar(32) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `haslo` varchar(64) DEFAULT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `obrot` double NOT NULL DEFAULT '0',
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKamera`),
  KEY `fk_KameraNaMapie_Mapa` (`idMapa`),
  KEY `fk_KameraNaMapie_modify` (`modifyUser`),
  CONSTRAINT `fk_KameraNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_KameraNaMapie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KameraNaMapie`
--

LOCK TABLES `KameraNaMapie` WRITE;
/*!40000 ALTER TABLE `KameraNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `KameraNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Karta`
--

DROP TABLE IF EXISTS `Karta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Karta` (
  `nrKarty` double NOT NULL,
  `idUzytkownik` int(11) DEFAULT NULL,
  `nazwa` varchar(32) DEFAULT NULL,
  `priorytet` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nrKarty`),
  KEY `fk_uzytkownik` (`idUzytkownik`),
  KEY `fk_karta_modify` (`modifyUser`),
  CONSTRAINT `fk_karta_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Karta`
--

LOCK TABLES `Karta` WRITE;
/*!40000 ALTER TABLE `Karta` DISABLE KEYS */;
INSERT INTO `Karta` VALUES (64451200957,324,NULL,0,NULL,NULL,0),(210459899201,258,NULL,0,NULL,NULL,0),(214750401345,336,NULL,0,NULL,NULL,0),(214750401378,123,NULL,1,NULL,NULL,0),(214750401399,21,NULL,0,NULL,NULL,0),(214750401508,198,NULL,1,NULL,NULL,0),(214750401521,17,NULL,1,NULL,NULL,0),(214750401530,325,NULL,0,NULL,NULL,0),(214750401543,328,NULL,1,NULL,NULL,0),(214750401560,59,NULL,0,NULL,NULL,0),(214750408608,315,NULL,0,NULL,NULL,0),(214750408818,179,NULL,1,NULL,NULL,0),(214750408856,314,NULL,0,NULL,NULL,0),(214750410615,257,NULL,1,NULL,NULL,0),(214750410870,205,NULL,0,NULL,NULL,0),(214750410894,67,NULL,2,NULL,NULL,0),(214750410960,116,NULL,0,NULL,NULL,0),(214750410965,154,NULL,1,NULL,NULL,0),(214750410977,135,NULL,1,NULL,NULL,0),(214750411476,126,NULL,1,NULL,NULL,0),(214750416107,333,NULL,1,NULL,NULL,0),(214750416153,231,NULL,1,NULL,NULL,0),(214750416167,264,NULL,0,NULL,NULL,0),(214750416204,67,NULL,1,NULL,NULL,0),(214750416236,60,NULL,0,NULL,NULL,0),(214750416254,104,NULL,0,NULL,NULL,0),(214750416273,115,NULL,0,NULL,NULL,0),(214750416279,25,NULL,0,NULL,NULL,0),(214750429595,269,NULL,1,NULL,NULL,0),(214750430027,193,NULL,0,NULL,NULL,0),(214750436095,247,NULL,0,NULL,NULL,0),(214750436667,31,NULL,1,NULL,NULL,0),(214750438226,260,NULL,0,NULL,NULL,0),(214750438423,267,NULL,1,NULL,NULL,0),(214750439619,287,NULL,0,NULL,NULL,0),(214750439820,116,NULL,1,NULL,NULL,0),(214750440223,27,NULL,0,NULL,NULL,0),(214750443555,227,NULL,0,NULL,NULL,0),(214750443971,28,NULL,0,NULL,NULL,0),(214750444179,74,NULL,1,NULL,NULL,0),(214750445428,191,NULL,1,NULL,NULL,0),(214750447915,208,NULL,1,NULL,NULL,0),(214750449425,300,NULL,0,NULL,NULL,0),(214750453912,196,NULL,0,NULL,NULL,0),(214750460127,216,NULL,0,NULL,NULL,0),(214750461528,277,NULL,0,NULL,NULL,0),(214750461966,331,NULL,0,NULL,NULL,0),(214750462107,168,NULL,0,NULL,NULL,0),(214750462521,109,NULL,0,NULL,NULL,0),(214750463319,101,NULL,0,NULL,NULL,0),(214750463996,203,NULL,0,NULL,NULL,0),(214750464296,151,NULL,0,NULL,NULL,0),(214750505220,57,NULL,0,NULL,NULL,0),(214750507605,128,NULL,0,NULL,NULL,0),(214750508404,249,NULL,0,NULL,NULL,0),(214750508868,83,NULL,0,NULL,NULL,0),(214750514523,227,NULL,1,NULL,NULL,0),(214750516530,241,NULL,0,NULL,NULL,0),(214750517678,323,NULL,0,NULL,NULL,0),(214750534001,88,NULL,0,NULL,NULL,0),(214750536072,211,NULL,0,NULL,NULL,0),(214750654570,299,NULL,0,NULL,NULL,0),(214750657205,143,NULL,0,NULL,NULL,0),(214750658499,28,NULL,1,NULL,NULL,0),(214750658937,103,NULL,2,NULL,NULL,0),(214750693534,147,NULL,0,NULL,NULL,0),(214750699050,132,NULL,1,NULL,NULL,0),(214750701228,56,NULL,1,NULL,NULL,0),(214750702244,94,NULL,1,NULL,NULL,0),(214750702437,115,NULL,1,NULL,NULL,0),(214750710396,4,NULL,0,NULL,NULL,0),(214750710915,57,NULL,1,NULL,NULL,0),(214750712405,30,NULL,2,NULL,NULL,0),(214750713574,143,NULL,1,NULL,NULL,0),(214750714257,334,NULL,0,NULL,NULL,0),(214750714812,58,NULL,1,NULL,NULL,0),(214750716426,67,NULL,0,NULL,NULL,0),(214750717259,9,NULL,0,NULL,NULL,0),(214750717860,372,NULL,0,NULL,NULL,0),(214750718904,278,NULL,1,NULL,NULL,0),(214750720656,329,NULL,0,NULL,NULL,0),(214750720847,13,NULL,0,NULL,NULL,0),(214750724516,28,NULL,2,NULL,NULL,0),(214750725349,212,NULL,0,NULL,NULL,0),(214750725676,71,NULL,1,NULL,NULL,0),(214750727354,301,NULL,0,NULL,NULL,0),(214750727909,329,NULL,1,NULL,NULL,0),(214750728043,123,NULL,0,NULL,NULL,0),(214750728460,279,NULL,1,NULL,NULL,0),(214750729036,17,NULL,0,NULL,NULL,0),(214750729057,3,NULL,0,NULL,NULL,0),(214750731678,318,NULL,0,NULL,NULL,0),(214750731768,219,NULL,0,NULL,NULL,0),(214750731801,316,NULL,0,NULL,NULL,0),(214750732051,198,NULL,0,NULL,NULL,0),(214750732678,155,NULL,0,NULL,NULL,0),(214750733098,293,NULL,0,NULL,NULL,0),(214750733388,66,NULL,1,NULL,NULL,0),(214750734384,58,NULL,0,NULL,NULL,0),(214750735677,55,NULL,1,NULL,NULL,0),(214750736499,161,NULL,0,NULL,NULL,0),(214750737116,149,NULL,0,NULL,NULL,0),(214750738292,87,NULL,0,NULL,NULL,0),(214750738572,149,NULL,1,NULL,NULL,0),(214750738848,207,NULL,0,NULL,NULL,0),(214750741982,31,NULL,0,NULL,NULL,0),(214750742014,317,NULL,0,NULL,NULL,0),(214750742380,333,NULL,0,NULL,NULL,0),(214750742579,271,NULL,0,NULL,NULL,0),(214750742980,134,NULL,0,NULL,NULL,0),(214750743989,254,NULL,1,NULL,NULL,0),(214750745506,103,NULL,1,NULL,NULL,0),(214750745712,292,NULL,1,NULL,NULL,0),(214750746823,293,NULL,1,NULL,NULL,0),(214750747748,266,NULL,0,NULL,NULL,0),(214750747886,179,NULL,0,NULL,NULL,0),(214750749449,71,NULL,0,NULL,NULL,0),(214750750775,122,NULL,0,NULL,NULL,0),(214750750856,39,NULL,0,NULL,NULL,0),(214750751858,193,NULL,1,NULL,NULL,0),(214750752408,167,NULL,0,NULL,NULL,0),(214750752478,332,NULL,0,NULL,NULL,0),(214750752580,286,NULL,0,NULL,NULL,0),(214750752786,220,NULL,1,NULL,NULL,0),(214750752991,133,NULL,0,NULL,NULL,0),(214750753308,368,NULL,0,NULL,NULL,0),(214750754829,174,NULL,0,NULL,NULL,0),(214750755861,63,NULL,0,NULL,NULL,0),(214750756683,44,NULL,0,NULL,NULL,0),(214750756880,51,NULL,1,NULL,NULL,0),(214750757007,326,NULL,0,NULL,NULL,0),(214750757741,184,NULL,0,NULL,NULL,0),(214750759387,174,NULL,1,NULL,NULL,0),(214750759420,289,NULL,0,NULL,NULL,0),(214750762148,101,NULL,1,NULL,NULL,0),(214750762490,266,NULL,1,NULL,NULL,0),(214750762693,18,NULL,1,NULL,NULL,0),(214750763684,172,NULL,0,NULL,NULL,0),(214750764669,142,NULL,0,NULL,NULL,0),(214750765645,158,NULL,0,NULL,NULL,0),(214750765778,208,NULL,0,NULL,NULL,0),(214750765779,295,NULL,0,NULL,NULL,0),(214750766137,209,NULL,0,NULL,NULL,0),(214750766219,192,NULL,0,NULL,NULL,0),(214750766469,279,NULL,0,NULL,NULL,0),(214750766471,176,NULL,0,NULL,NULL,0),(214750766478,285,NULL,1,NULL,NULL,0),(214750766593,337,NULL,0,NULL,NULL,0),(214750766720,182,NULL,0,NULL,NULL,0),(214750766799,66,NULL,0,NULL,NULL,0),(214750766949,163,NULL,0,NULL,NULL,0),(214750767177,232,NULL,0,NULL,NULL,0),(214750767251,253,NULL,0,NULL,NULL,0),(214750767283,299,NULL,1,NULL,NULL,0),(214750774661,17,NULL,2,NULL,NULL,0),(214750777254,251,NULL,1,NULL,NULL,0),(214750778898,219,NULL,3,NULL,NULL,0),(214750779291,30,NULL,1,NULL,NULL,0),(214750779377,255,NULL,1,NULL,NULL,0),(214750779969,267,NULL,0,NULL,NULL,0),(214750780967,231,NULL,0,NULL,NULL,0),(214750781889,322,NULL,0,NULL,NULL,0),(214750782847,251,NULL,0,NULL,NULL,0),(214750784903,331,NULL,1,NULL,NULL,0),(214750785318,158,NULL,1,NULL,NULL,0),(214750785942,283,NULL,1,NULL,NULL,0),(214750786358,77,NULL,0,NULL,NULL,0),(214750786359,253,NULL,1,NULL,NULL,0),(214750786899,26,NULL,0,NULL,NULL,0),(214750786906,254,NULL,2,NULL,NULL,0),(214750786984,226,NULL,0,NULL,NULL,0),(214750788445,35,NULL,0,NULL,NULL,0),(214750789119,150,NULL,0,NULL,NULL,0),(214750789327,327,NULL,0,NULL,NULL,0),(214750789448,157,NULL,0,NULL,NULL,0),(214750790772,269,NULL,0,NULL,NULL,0),(214750791094,25,NULL,1,NULL,NULL,0),(214750791302,126,NULL,0,NULL,NULL,0),(214750791593,215,NULL,1,NULL,NULL,0),(214750792003,170,NULL,0,NULL,NULL,0),(214750792206,168,NULL,1,NULL,NULL,0),(214750792815,235,NULL,0,NULL,NULL,0),(214750793733,285,NULL,2,NULL,NULL,0),(214750794424,213,NULL,0,NULL,NULL,0),(214750794778,118,NULL,0,NULL,NULL,0),(214750795650,273,NULL,0,NULL,NULL,0),(214750795651,290,NULL,0,NULL,NULL,0),(214750795844,255,NULL,0,NULL,NULL,0),(214750796039,44,NULL,1,NULL,NULL,0),(214750796527,56,NULL,0,NULL,NULL,0),(214750796997,76,NULL,1,NULL,NULL,0),(214750797284,147,NULL,2,NULL,NULL,0),(214750798580,56,NULL,2,NULL,NULL,0),(214750800046,219,NULL,1,NULL,NULL,0),(214750800646,311,NULL,0,NULL,NULL,0),(214750804104,26,NULL,1,NULL,NULL,0),(214750805361,184,NULL,1,NULL,NULL,0),(214750808250,170,NULL,1,NULL,NULL,0),(214750811677,65,NULL,0,NULL,NULL,0),(214750818444,180,NULL,1,NULL,NULL,0),(214750828585,328,NULL,2,NULL,NULL,0),(214750833138,18,NULL,0,NULL,NULL,0),(214750848327,87,NULL,1,NULL,NULL,0),(214750848409,11,NULL,0,NULL,NULL,0),(214750848589,124,NULL,1,NULL,NULL,0),(214750849808,373,NULL,0,NULL,NULL,0),(214750849848,50,NULL,0,NULL,NULL,0),(214750850012,50,NULL,1,NULL,NULL,0),(214750850041,192,NULL,1,NULL,NULL,0),(214750850049,328,NULL,0,NULL,NULL,0),(214750850812,330,NULL,0,NULL,NULL,0),(214750851006,147,NULL,1,NULL,NULL,0),(214750867254,57,NULL,2,NULL,NULL,0),(214750867459,132,NULL,0,NULL,NULL,0),(214750867495,12,NULL,0,NULL,NULL,0),(214750867513,14,NULL,0,NULL,NULL,0),(214750867516,215,NULL,0,NULL,NULL,0),(214750867519,24,NULL,0,NULL,NULL,0),(214750867539,114,NULL,1,NULL,NULL,0),(214750867559,288,NULL,0,NULL,NULL,0),(214750867562,103,NULL,0,NULL,NULL,0),(214750919474,113,NULL,0,NULL,NULL,0),(214750919859,140,NULL,0,NULL,NULL,0),(214750919860,85,NULL,1,NULL,NULL,0),(214750919942,191,NULL,0,NULL,NULL,0),(214750920120,239,NULL,0,NULL,NULL,0),(214750920335,229,NULL,1,NULL,NULL,0),(214750920988,338,NULL,0,NULL,NULL,0),(214750921227,260,NULL,1,NULL,NULL,0),(214750921468,114,NULL,0,NULL,NULL,0),(214750921723,24,NULL,2,NULL,NULL,0),(214750921856,273,NULL,2,NULL,NULL,0),(214750922119,263,NULL,0,NULL,NULL,0),(214750922397,146,NULL,1,NULL,NULL,0),(214750922964,197,NULL,0,NULL,NULL,0),(214750923564,167,NULL,1,NULL,NULL,0),(214750924398,52,NULL,0,NULL,NULL,0),(214750924561,180,NULL,0,NULL,NULL,0),(214750925389,340,NULL,0,NULL,NULL,0),(214750925559,111,NULL,0,NULL,NULL,0),(214750927503,189,NULL,0,NULL,NULL,0),(214750927690,146,NULL,0,NULL,NULL,0),(214750929033,273,NULL,1,NULL,NULL,0),(214750929798,232,NULL,1,NULL,NULL,0),(214750929991,205,NULL,1,NULL,NULL,0),(214750930379,196,NULL,1,NULL,NULL,0),(214750931164,320,NULL,0,NULL,NULL,0),(214750931365,211,NULL,1,NULL,NULL,0),(214750931758,257,NULL,0,NULL,NULL,0),(214750931762,292,NULL,0,NULL,NULL,0),(214750935256,135,NULL,0,NULL,NULL,0),(214750935668,30,NULL,0,NULL,NULL,0),(214750935874,162,NULL,0,NULL,NULL,0),(214750937741,238,NULL,0,NULL,NULL,0),(214750937953,229,NULL,0,NULL,NULL,0),(214750938161,244,NULL,1,NULL,NULL,0),(214750938370,283,NULL,0,NULL,NULL,0),(214750939415,65,NULL,1,NULL,NULL,0),(214750940035,24,NULL,1,NULL,NULL,0),(214750940503,33,NULL,0,NULL,NULL,0),(214750941745,154,NULL,0,NULL,NULL,0),(214750942066,96,NULL,0,NULL,NULL,0),(214750942773,264,NULL,1,NULL,NULL,0),(214750945613,113,NULL,1,NULL,NULL,0),(214750945911,36,NULL,0,NULL,NULL,0),(214750946035,297,NULL,0,NULL,NULL,0),(214750948496,200,NULL,0,NULL,NULL,0),(214751506436,7,NULL,0,NULL,NULL,0),(214751531903,233,NULL,0,NULL,NULL,0),(214751538242,51,NULL,0,NULL,NULL,0),(214752826954,321,NULL,0,NULL,NULL,0),(214752830822,313,NULL,0,NULL,NULL,0),(214752831440,319,NULL,0,NULL,NULL,0),(214752832283,310,NULL,0,NULL,NULL,0),(214752833098,312,NULL,0,NULL,NULL,0),(214752840349,76,NULL,0,NULL,NULL,0),(214752844544,110,NULL,0,NULL,NULL,0),(214752844732,254,NULL,0,NULL,NULL,0),(214752889751,217,NULL,1,NULL,NULL,0),(214752895682,163,NULL,1,NULL,NULL,0),(214752899848,278,NULL,0,NULL,NULL,0),(214752901179,96,NULL,1,NULL,NULL,0),(214752911003,55,NULL,0,NULL,NULL,0),(214753024693,217,NULL,0,NULL,NULL,0),(214753046584,33,NULL,1,NULL,NULL,0),(214753048379,335,NULL,0,NULL,NULL,0),(214753052072,258,NULL,1,NULL,NULL,0),(214753053316,297,NULL,1,NULL,NULL,0),(214756352670,339,NULL,0,NULL,NULL,0),(214756359225,130,NULL,0,NULL,NULL,0),(214756361311,52,NULL,1,NULL,NULL,0),(214756366509,220,NULL,0,NULL,NULL,0),(214756368946,124,NULL,0,NULL,NULL,0),(214756375287,15,NULL,0,NULL,NULL,0),(214756531242,326,NULL,1,NULL,NULL,0),(214756532071,22,NULL,1,NULL,NULL,0),(214756534209,6,NULL,1,NULL,NULL,0),(214756539586,74,NULL,0,NULL,NULL,0),(214756540946,61,NULL,0,NULL,NULL,0),(214756548650,128,NULL,1,NULL,NULL,0),(214756555937,6,NULL,0,NULL,NULL,0),(214756562688,132,NULL,2,NULL,NULL,0),(214756566577,219,NULL,2,NULL,NULL,0),(214756566991,335,NULL,1,NULL,NULL,0),(214756598585,244,NULL,0,NULL,NULL,0),(214756618013,8,NULL,0,NULL,NULL,0),(214756620409,164,NULL,0,NULL,NULL,0),(214756622078,330,NULL,1,NULL,NULL,0),(214756625805,124,NULL,2,NULL,NULL,0),(214757273791,151,NULL,1,NULL,NULL,0),(214757279647,85,NULL,0,NULL,NULL,0),(214757283175,247,NULL,1,NULL,NULL,0),(214758327823,142,NULL,1,NULL,NULL,0),(214758340887,200,NULL,1,NULL,NULL,0),(214758631274,203,NULL,1,NULL,NULL,0),(214758631362,140,NULL,1,NULL,NULL,0),(219052146262,104,NULL,1,NULL,NULL,0),(219052159317,94,NULL,0,NULL,NULL,0),(219052168856,22,NULL,0,NULL,NULL,0),(219052169533,122,NULL,1,NULL,NULL,0),(219052171204,148,NULL,0,NULL,NULL,0),(219052173091,285,NULL,0,NULL,NULL,0),(219052210182,8,NULL,1,NULL,NULL,0);
/*!40000 ALTER TABLE `Karta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kontroler`
--

DROP TABLE IF EXISTS `Kontroler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kontroler` (
  `idKontroler` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `adres` tinyint(3) unsigned DEFAULT NULL,
  `numerSeryjny` char(32) DEFAULT NULL,
  `typ` int(2) DEFAULT '0',
  `nazwa` varchar(32) DEFAULT NULL,
  `opis` varchar(256) DEFAULT NULL,
  `czasResetuAntiPassback` time DEFAULT NULL,
  `czasBrakuZasilania` smallint(6) DEFAULT '0',
  `korektaZegara` smallint(6) DEFAULT '0',
  `typDST` smallint(6) DEFAULT NULL,
  `startDST` date DEFAULT NULL,
  `stopDST` date DEFAULT NULL,
  `odblokowany` tinyint(1) DEFAULT '0',
  `kontrolujObecnoscTermA` tinyint(1) DEFAULT '0',
  `kontrolujObecnoscTermB` tinyint(1) DEFAULT '0',
  `antiPassback` tinyint(1) DEFAULT '0',
  `antySkaner` tinyint(1) DEFAULT '0',
  `wzorzecCzasu` tinyint(1) DEFAULT '0',
  `modulZarejestrowany` tinyint(1) DEFAULT '0',
  `LCDPrzejscieSluzbowe` tinyint(1) DEFAULT '0',
  `LCDPokazNazweUzytkownika` tinyint(1) DEFAULT '0',
  `LCDPokazNazweUzytkownikaNaDrugim` tinyint(1) DEFAULT '0',
  `formatCzasu` enum('gg:mm','gg:mm:ss','dd mmm rr, gg:mm','dd mmm, gg:mm:ss','dd.mm.rr, gg:mm','dd.mm.rrrr, gg:mm','DoW dd mmm, gg:mm') NOT NULL DEFAULT 'gg:mm',
  `podswietlenieA` enum('Auto','Stale') DEFAULT 'Auto',
  `podswietlenieB` enum('Auto','Stale') DEFAULT 'Auto',
  `formatA` enum('EM Marin','Wiegand 26 bit','Dallas') NOT NULL DEFAULT 'EM Marin',
  `formatB` enum('EM Marin','Wiegand 26 bit','Dallas') NOT NULL DEFAULT 'EM Marin',
  `sposobDostepu` enum('KartaLubKod','Karta','Kod','KartaIKod') NOT NULL DEFAULT 'KartaLubKod',
  `zdalnyDostep` tinyint(1) NOT NULL DEFAULT '0',
  `dataKompilacji` char(10) DEFAULT NULL,
  `wersja` char(12) DEFAULT NULL,
  `jezyk` int(3) DEFAULT NULL,
  `numerSieci` tinyint(1) DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKontroler`),
  UNIQUE KEY `centrala_adres_UNIQUE` (`idCentralaNT`,`adres`),
  KEY `fk_centrala_kontroler` (`idCentralaNT`),
  KEY `fk_controller_modify` (`modifyUser`),
  CONSTRAINT `fk_centrala_kontroler` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_controller_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kontroler`
--

LOCK TABLES `Kontroler` WRITE;
/*!40000 ALTER TABLE `Kontroler` DISABLE KEYS */;
INSERT INTO `Kontroler` VALUES (1,1,1,'e8f2c345',0,'Pietro WC Meski','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(3,1,4,'00000419',0,'Piętro WC Damski','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(4,1,5,'1b6b1713',0,'Brama nr4','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2017-04-06','3.01',0,0,NULL,NULL,0),(5,1,6,'30000edf',0,'Terminal Wjazdowy','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2017-04-06','3.01',0,1,NULL,NULL,0),(6,1,7,'30000ede',0,'Terminal Wyjazdowy','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2017-04-06','3.01',0,1,NULL,NULL,0),(7,1,8,'30001321',0,'Parter WC Meski','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(8,1,11,'3000130e',0,'Parter WC Meski Personel','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(9,1,12,'3000131f',0,'Parter WC Niepełnosprawny','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(10,1,15,'79b27462',0,'Parter WC Damski','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(11,1,17,'30001319',0,'Ksiązeczka zdrowia','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(12,1,18,'200042f2',2,'WC Gora','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0),(13,1,2,'b8694da1',0,'Piętro Pomieszczenie sprzątaczek','',NULL,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'gg:mm','Auto','Auto','EM Marin','EM Marin','KartaLubKod',0,'2015-07-10','3.01',0,1,NULL,NULL,0);
/*!40000 ALTER TABLE `Kontroler` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `StatusKontrolera_AutoInsert` AFTER INSERT ON `Kontroler`
FOR EACH ROW BEGIN
  INSERT INTO Przejscie (idKontroler) VALUES (NEW.idKontroler);
  IF NEW.typ >= 0 && NEW.typ <= 3 THEN
    BEGIN
      INSERT INTO Wyjscie(idKontroler, numer, modifyUser, modifyTime) VALUES (NEW.idKontroler,1, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wyjscie(idKontroler, numer, modifyUser, modifyTime) VALUES (NEW.idKontroler,2, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wejscie(idKontroler, numer, trybPracy, typ, modifyUser, modifyTime) VALUES (NEW.idKontroler,1, 1, 0, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wejscie(idKontroler, numer, trybPracy, typ, modifyUser, modifyTime) VALUES (NEW.idKontroler,2, 2, 0, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wejscie(idKontroler, numer, trybPracy, typ, modifyUser, modifyTime) VALUES (NEW.idKontroler,3, 3, 0, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wejscie(idKontroler, numer, trybPracy, typ, modifyUser, modifyTime) VALUES (NEW.idKontroler,4, 0, 1, NEW.modifyUser, NEW.modifyTime);
      INSERT INTO Wejscie(idKontroler, numer, trybPracy, typ, modifyUser, modifyTime) VALUES (NEW.idKontroler,5, 0, 1, NEW.modifyUser, NEW.modifyTime);
    END;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `KontrolerNaMapie`
--

DROP TABLE IF EXISTS `KontrolerNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KontrolerNaMapie` (
  `idMapa` int(11) NOT NULL,
  `idKontroler` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `obrot` double NOT NULL DEFAULT '0',
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `dzwiekStanModulu` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekStanZasilania` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekStanTerminali` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekStanPrzejscia` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekGongu` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekOdblokowaniaPrzejscia` tinyint(1) NOT NULL DEFAULT '1',
  `dzwiekDlugoOtwarteDrzwiJako` int(11) DEFAULT '0' COMMENT ' ENUM(BRAK, GONG, ALARM)',
  `pokazZdjecie` tinyint(1) NOT NULL DEFAULT '1',
  `odbicie` tinyint(1) NOT NULL DEFAULT '0',
  `przypisanaKamera` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idKontroler`),
  UNIQUE KEY `u_KontrolerNaMapie` (`idMapa`,`idKontroler`),
  KEY `fk_KontrolerNaMapie_Kontroler` (`idKontroler`),
  KEY `fk_KontrolerNaMapie_modify` (`modifyUser`),
  KEY `fk_KontrolerNaMapie_KameraNaMapie` (`przypisanaKamera`),
  CONSTRAINT `fk_KontrolerNaMapie_KameraNaMapie` FOREIGN KEY (`przypisanaKamera`) REFERENCES `KameraNaMapie` (`idKamera`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_KontrolerNaMapie_Kontroler` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_KontrolerNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_KontrolerNaMapie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KontrolerNaMapie`
--

LOCK TABLES `KontrolerNaMapie` WRITE;
/*!40000 ALTER TABLE `KontrolerNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `KontrolerNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mapa`
--

DROP TABLE IF EXISTS `Mapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mapa` (
  `idMapa` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `obrazPlanu` mediumblob,
  `idMapyNadrzednej` int(11) DEFAULT NULL,
  `pozycjaX` int(11) NOT NULL DEFAULT '0',
  `pozycjaY` int(11) NOT NULL DEFAULT '0',
  `obrot` double NOT NULL DEFAULT '0',
  `dlugosc` int(11) NOT NULL DEFAULT '50',
  `szerokosc` int(11) NOT NULL DEFAULT '50',
  `kolor` int(11) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`),
  KEY `nadrzedna_mapa` (`idMapyNadrzednej`),
  KEY `fk_Mapa_modify` (`modifyUser`),
  CONSTRAINT `fk_Mapa_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `nadrzedna_mapa` FOREIGN KEY (`idMapyNadrzednej`) REFERENCES `Mapa` (`idMapa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mapa`
--

LOCK TABLES `Mapa` WRITE;
/*!40000 ALTER TABLE `Mapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mapa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `UsuniecieMapyZMapy_AfterUpdate` AFTER UPDATE ON `Mapa`
FOR EACH ROW BEGIN
    IF NEW.idMapyNadrzednej IS NULL
        OR NEW.modifyRemoved=TRUE THEN
        UPDATE PunktyMapyNaMapie SET modifyRemoved=TRUE, modifyTime=NEW.modifyTime WHERE idMapa=NEW.idMapa;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Obiekt`
--

DROP TABLE IF EXISTS `Obiekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Obiekt` (
  `idObiekt` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(32) NOT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idObiekt`),
  KEY `fk_obiekt_modify` (`modifyUser`),
  CONSTRAINT `fk_obiekt_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Obiekt`
--

LOCK TABLES `Obiekt` WRITE;
/*!40000 ALTER TABLE `Obiekt` DISABLE KEYS */;
INSERT INTO `Obiekt` VALUES (1,'Nowy Obiekt',NULL,NULL,NULL,'Europe/Belgrade',NULL,NULL,0);
/*!40000 ALTER TABLE `Obiekt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OknoCzasowe`
--

DROP TABLE IF EXISTS `OknoCzasowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OknoCzasowe` (
  `idOknoCzasowe` int(11) NOT NULL AUTO_INCREMENT,
  `idSchematDzienny` int(11) NOT NULL,
  `Start` time NOT NULL,
  `Stop` time NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOknoCzasowe`),
  KEY `fk_schemat_dzienny` (`idSchematDzienny`),
  KEY `fk_time_window_modify` (`modifyUser`),
  CONSTRAINT `fk_schemat_dzienny` FOREIGN KEY (`idSchematDzienny`) REFERENCES `SchematDzienny` (`idSchematDzienny`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_time_window_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OknoCzasowe`
--

LOCK TABLES `OknoCzasowe` WRITE;
/*!40000 ALTER TABLE `OknoCzasowe` DISABLE KEYS */;
INSERT INTO `OknoCzasowe` VALUES (1,2,'00:00:00','06:00:00',NULL,NULL,0),(2,2,'17:00:00','23:59:00',NULL,NULL,0),(3,3,'00:00:00','07:00:00',NULL,NULL,0),(4,3,'18:15:00','23:59:00',NULL,NULL,0),(5,4,'00:00:00','23:59:00',NULL,NULL,0),(6,5,'00:00:00','23:59:00',NULL,NULL,0),(7,6,'14:15:00','23:59:00',NULL,NULL,0),(8,7,'14:30:00','23:59:00',NULL,NULL,0);
/*!40000 ALTER TABLE `OknoCzasowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpcjeDostepu`
--

DROP TABLE IF EXISTS `OpcjeDostepu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpcjeDostepu` (
  `idUzytkownik` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `antyPassback` tinyint(1) DEFAULT NULL,
  `limitDostepu` int(1) DEFAULT NULL,
  `typLimitu` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 - ilosciowy, 1 - minuty, 2 - godziny',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUzytkownik`,`idStrefa`),
  UNIQUE KEY `fk_OpcjeDostepu_do_Uzytkownik` (`idUzytkownik`,`idStrefa`),
  KEY `fk_OpcjeDostepu_do_Strefa` (`idStrefa`),
  KEY `fk_OpcjeDostepu_modify` (`modifyUser`),
  CONSTRAINT `fk_OpcjeDostepu_do_Strefa` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OpcjeDostepu_do_Uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OpcjeDostepu_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpcjeDostepu`
--

LOCK TABLES `OpcjeDostepu` WRITE;
/*!40000 ALTER TABLE `OpcjeDostepu` DISABLE KEYS */;
INSERT INTO `OpcjeDostepu` VALUES (327,1,1,NULL,0,NULL,NULL,0),(327,14,1,NULL,0,NULL,NULL,0),(368,1,1,NULL,0,NULL,NULL,0),(368,14,1,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `OpcjeDostepu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpcjeDostepuGrup`
--

DROP TABLE IF EXISTS `OpcjeDostepuGrup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpcjeDostepuGrup` (
  `idGrupaUzytkownikow` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `antyPassback` tinyint(1) DEFAULT NULL,
  `limitDostepu` int(1) DEFAULT NULL,
  `typLimitu` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 - ilosciowy, 1 - minuty, 2 - godziny',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idGrupaUzytkownikow`,`idStrefa`),
  UNIQUE KEY `fk_OpcjeDostepuGrup_do_Grupa` (`idGrupaUzytkownikow`,`idStrefa`),
  KEY `fk_OpcjeDostepuGrup_do_Strefa` (`idStrefa`),
  KEY `fk_OpcjeDostepuGrup_modify` (`modifyUser`),
  CONSTRAINT `fk_OpcjeDostepuGrup_do_Grupa` FOREIGN KEY (`idGrupaUzytkownikow`) REFERENCES `GrupaUzytkownikow` (`idGrupaUzytkownikow`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OpcjeDostepuGrup_do_Strefa` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OpcjeDostepuGrup_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpcjeDostepuGrup`
--

LOCK TABLES `OpcjeDostepuGrup` WRITE;
/*!40000 ALTER TABLE `OpcjeDostepuGrup` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpcjeDostepuGrup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PrawaDostepu`
--

DROP TABLE IF EXISTS `PrawaDostepu`;
/*!50001 DROP VIEW IF EXISTS `PrawaDostepu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PrawaDostepu` (
  `idStrefa` tinyint NOT NULL,
  `idUzytkownik` tinyint NOT NULL,
  `idKalendarz` tinyint NOT NULL,
  `P` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PrawaDostepuGrup`
--

DROP TABLE IF EXISTS `PrawaDostepuGrup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrawaDostepuGrup` (
  `idStrefy` int(11) NOT NULL,
  `idGrupaUzytkownikow` int(11) NOT NULL,
  `idKalendarz` int(11) DEFAULT NULL,
  `P` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStrefy`,`idGrupaUzytkownikow`),
  UNIQUE KEY `PrivilagesUniqueIndex` (`idStrefy`,`idGrupaUzytkownikow`),
  KEY `fk_PrawaDostepuGrup_do_Grupy` (`idGrupaUzytkownikow`),
  KEY `fk_PrawaDostepuGrup_do_Kalendarza` (`idKalendarz`),
  KEY `fk_PrawaDostepuGrup_modify` (`modifyUser`),
  CONSTRAINT `fk_PrawaDostepuGrup_do_Grupy` FOREIGN KEY (`idGrupaUzytkownikow`) REFERENCES `GrupaUzytkownikow` (`idGrupaUzytkownikow`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuGrup_do_Kalendarza` FOREIGN KEY (`idKalendarz`) REFERENCES `kalendarz` (`idKalendarz`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuGrup_do_Strefy` FOREIGN KEY (`idStrefy`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuGrup_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrawaDostepuGrup`
--

LOCK TABLES `PrawaDostepuGrup` WRITE;
/*!40000 ALTER TABLE `PrawaDostepuGrup` DISABLE KEYS */;
INSERT INTO `PrawaDostepuGrup` VALUES (1,2,NULL,0,NULL,NULL,0),(2,2,NULL,0,NULL,NULL,0),(3,2,3,0,NULL,NULL,0),(3,5,NULL,0,NULL,NULL,0),(4,2,NULL,0,NULL,NULL,0),(5,2,NULL,0,NULL,NULL,0),(6,2,NULL,0,NULL,NULL,0),(7,2,NULL,0,NULL,NULL,0),(9,2,NULL,0,NULL,NULL,0),(10,2,NULL,0,NULL,NULL,0),(13,2,NULL,0,NULL,NULL,0),(14,2,3,0,NULL,NULL,0),(14,5,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `PrawaDostepuGrup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrawaDostepuUzytkownikow`
--

DROP TABLE IF EXISTS `PrawaDostepuUzytkownikow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrawaDostepuUzytkownikow` (
  `idStrefy` int(11) NOT NULL,
  `idUzytkownik` int(11) NOT NULL,
  `idKalendarz` int(11) DEFAULT NULL,
  `P` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStrefy`,`idUzytkownik`),
  UNIQUE KEY `PrivilagesUniqueIndex` (`idStrefy`,`idUzytkownik`),
  KEY `fk_PrawaDostepuUzytkownikow_do_Uzytkownik` (`idUzytkownik`),
  KEY `fk_PrawaDostepuUzytkownikow_do_Kalendarza` (`idKalendarz`),
  KEY `fk_PrawaDostepuUzytkownikow_modify` (`modifyUser`),
  CONSTRAINT `fk_PrawaDostepuUzytkownikow_do_Kalendarza` FOREIGN KEY (`idKalendarz`) REFERENCES `kalendarz` (`idKalendarz`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuUzytkownikow_do_Strefy` FOREIGN KEY (`idStrefy`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuUzytkownikow_do_Uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PrawaDostepuUzytkownikow_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrawaDostepuUzytkownikow`
--

LOCK TABLES `PrawaDostepuUzytkownikow` WRITE;
/*!40000 ALTER TABLE `PrawaDostepuUzytkownikow` DISABLE KEYS */;
INSERT INTO `PrawaDostepuUzytkownikow` VALUES (1,28,NULL,0,NULL,NULL,0),(1,100,4,0,NULL,NULL,0),(1,310,NULL,1,NULL,NULL,0),(1,311,NULL,1,NULL,NULL,0),(1,312,NULL,0,NULL,NULL,0),(1,313,NULL,0,NULL,NULL,0),(1,314,NULL,0,NULL,NULL,0),(1,315,NULL,0,NULL,NULL,0),(1,316,NULL,0,NULL,NULL,0),(1,317,NULL,0,NULL,NULL,0),(1,318,NULL,0,NULL,NULL,0),(1,319,NULL,1,NULL,NULL,0),(1,320,NULL,1,NULL,NULL,0),(1,321,NULL,1,NULL,NULL,0),(1,322,NULL,0,NULL,NULL,0),(1,324,NULL,1,NULL,NULL,0),(1,325,NULL,0,NULL,NULL,0),(1,327,3,0,NULL,NULL,0),(1,328,4,0,NULL,NULL,0),(1,329,4,0,NULL,NULL,0),(1,330,4,0,NULL,NULL,0),(1,331,4,0,NULL,NULL,0),(1,368,4,1,NULL,NULL,0),(1,372,NULL,0,NULL,NULL,0),(1,373,NULL,0,NULL,NULL,0),(2,28,NULL,0,NULL,NULL,0),(2,100,NULL,0,NULL,NULL,0),(2,310,NULL,1,NULL,NULL,0),(2,311,NULL,1,NULL,NULL,0),(2,312,NULL,0,NULL,NULL,0),(2,313,NULL,0,NULL,NULL,0),(2,314,NULL,0,NULL,NULL,0),(2,315,NULL,0,NULL,NULL,0),(2,316,NULL,0,NULL,NULL,0),(2,317,NULL,0,NULL,NULL,0),(2,318,NULL,0,NULL,NULL,0),(2,319,NULL,1,NULL,NULL,0),(2,320,NULL,1,NULL,NULL,0),(2,321,NULL,1,NULL,NULL,0),(2,322,NULL,0,NULL,NULL,0),(2,324,NULL,1,NULL,NULL,0),(2,325,NULL,0,NULL,NULL,0),(2,326,NULL,0,NULL,NULL,0),(2,327,NULL,0,NULL,NULL,0),(2,368,NULL,1,NULL,NULL,0),(2,372,NULL,0,NULL,NULL,0),(2,373,NULL,0,NULL,NULL,0),(3,28,3,0,NULL,NULL,0),(3,100,3,0,NULL,NULL,0),(3,310,NULL,1,NULL,NULL,0),(3,311,NULL,1,NULL,NULL,0),(3,312,NULL,0,NULL,NULL,0),(3,313,NULL,0,NULL,NULL,0),(3,314,NULL,0,NULL,NULL,0),(3,315,NULL,0,NULL,NULL,0),(3,316,NULL,0,NULL,NULL,0),(3,317,NULL,0,NULL,NULL,0),(3,318,NULL,0,NULL,NULL,0),(3,319,NULL,1,NULL,NULL,0),(3,320,NULL,1,NULL,NULL,0),(3,321,NULL,1,NULL,NULL,0),(3,322,NULL,0,NULL,NULL,0),(3,324,NULL,1,NULL,NULL,0),(3,325,NULL,0,NULL,NULL,0),(3,327,3,0,NULL,NULL,0),(3,328,3,0,NULL,NULL,0),(3,368,3,1,NULL,NULL,0),(3,371,NULL,0,NULL,NULL,0),(3,372,NULL,0,NULL,NULL,0),(3,373,NULL,0,NULL,NULL,0),(4,28,NULL,0,NULL,NULL,0),(4,100,NULL,0,NULL,NULL,0),(4,310,NULL,1,NULL,NULL,0),(4,311,NULL,1,NULL,NULL,0),(4,312,NULL,0,NULL,NULL,0),(4,313,NULL,0,NULL,NULL,0),(4,314,NULL,0,NULL,NULL,0),(4,315,NULL,0,NULL,NULL,0),(4,316,NULL,0,NULL,NULL,0),(4,317,NULL,0,NULL,NULL,0),(4,318,NULL,0,NULL,NULL,0),(4,319,NULL,1,NULL,NULL,0),(4,320,NULL,1,NULL,NULL,0),(4,321,NULL,1,NULL,NULL,0),(4,322,NULL,0,NULL,NULL,0),(4,324,NULL,1,NULL,NULL,0),(4,325,NULL,0,NULL,NULL,0),(4,326,NULL,0,NULL,NULL,0),(4,327,NULL,0,NULL,NULL,0),(4,328,NULL,0,NULL,NULL,0),(4,329,NULL,0,NULL,NULL,0),(4,332,NULL,0,NULL,NULL,0),(4,368,NULL,1,NULL,NULL,0),(4,372,NULL,0,NULL,NULL,0),(4,373,NULL,0,NULL,NULL,0),(5,28,NULL,0,NULL,NULL,0),(5,100,NULL,0,NULL,NULL,0),(5,310,NULL,1,NULL,NULL,0),(5,311,NULL,1,NULL,NULL,0),(5,312,NULL,0,NULL,NULL,0),(5,313,NULL,0,NULL,NULL,0),(5,314,NULL,0,NULL,NULL,0),(5,315,NULL,0,NULL,NULL,0),(5,316,NULL,0,NULL,NULL,0),(5,317,NULL,0,NULL,NULL,0),(5,318,NULL,0,NULL,NULL,0),(5,319,NULL,1,NULL,NULL,0),(5,320,NULL,1,NULL,NULL,0),(5,321,NULL,1,NULL,NULL,0),(5,322,NULL,0,NULL,NULL,0),(5,324,NULL,1,NULL,NULL,0),(5,325,NULL,0,NULL,NULL,0),(5,328,NULL,0,NULL,NULL,0),(5,368,NULL,1,NULL,NULL,0),(5,372,NULL,0,NULL,NULL,0),(5,373,NULL,0,NULL,NULL,0),(6,28,NULL,0,NULL,NULL,0),(6,100,NULL,0,NULL,NULL,0),(6,310,NULL,1,NULL,NULL,0),(6,311,NULL,1,NULL,NULL,0),(6,312,NULL,0,NULL,NULL,0),(6,313,NULL,0,NULL,NULL,0),(6,314,NULL,0,NULL,NULL,0),(6,315,NULL,0,NULL,NULL,0),(6,316,NULL,0,NULL,NULL,0),(6,317,NULL,0,NULL,NULL,0),(6,318,NULL,0,NULL,NULL,0),(6,319,NULL,1,NULL,NULL,0),(6,320,NULL,1,NULL,NULL,0),(6,321,NULL,1,NULL,NULL,0),(6,322,NULL,0,NULL,NULL,0),(6,324,NULL,1,NULL,NULL,0),(6,325,NULL,0,NULL,NULL,0),(6,328,NULL,0,NULL,NULL,0),(6,368,NULL,1,NULL,NULL,0),(6,372,NULL,0,NULL,NULL,0),(6,373,NULL,0,NULL,NULL,0),(7,28,NULL,0,NULL,NULL,0),(7,100,NULL,0,NULL,NULL,0),(7,310,NULL,1,NULL,NULL,0),(7,311,NULL,1,NULL,NULL,0),(7,312,NULL,0,NULL,NULL,0),(7,313,NULL,0,NULL,NULL,0),(7,314,NULL,0,NULL,NULL,0),(7,315,NULL,0,NULL,NULL,0),(7,316,NULL,0,NULL,NULL,0),(7,317,NULL,0,NULL,NULL,0),(7,318,NULL,0,NULL,NULL,0),(7,319,NULL,1,NULL,NULL,0),(7,320,NULL,1,NULL,NULL,0),(7,321,NULL,1,NULL,NULL,0),(7,322,NULL,0,NULL,NULL,0),(7,324,NULL,1,NULL,NULL,0),(7,325,NULL,0,NULL,NULL,0),(7,368,NULL,1,NULL,NULL,0),(7,372,NULL,0,NULL,NULL,0),(7,373,NULL,0,NULL,NULL,0),(8,310,NULL,1,NULL,NULL,0),(8,311,NULL,1,NULL,NULL,0),(8,312,NULL,0,NULL,NULL,0),(8,313,NULL,0,NULL,NULL,0),(8,314,NULL,0,NULL,NULL,0),(8,315,NULL,0,NULL,NULL,0),(8,316,NULL,0,NULL,NULL,0),(8,317,NULL,0,NULL,NULL,0),(8,318,NULL,0,NULL,NULL,0),(8,319,NULL,1,NULL,NULL,0),(8,320,NULL,1,NULL,NULL,0),(8,321,NULL,1,NULL,NULL,0),(8,324,NULL,1,NULL,NULL,0),(8,325,NULL,0,NULL,NULL,0),(8,368,NULL,1,NULL,NULL,0),(8,372,NULL,0,NULL,NULL,0),(8,373,NULL,0,NULL,NULL,0),(9,28,NULL,0,NULL,NULL,0),(9,100,NULL,0,NULL,NULL,0),(9,310,NULL,1,NULL,NULL,0),(9,311,NULL,1,NULL,NULL,0),(9,312,NULL,0,NULL,NULL,0),(9,313,NULL,0,NULL,NULL,0),(9,314,NULL,0,NULL,NULL,0),(9,315,NULL,0,NULL,NULL,0),(9,316,NULL,0,NULL,NULL,0),(9,317,NULL,0,NULL,NULL,0),(9,318,NULL,0,NULL,NULL,0),(9,319,NULL,1,NULL,NULL,0),(9,320,NULL,1,NULL,NULL,0),(9,321,NULL,1,NULL,NULL,0),(9,322,NULL,0,NULL,NULL,0),(9,324,NULL,1,NULL,NULL,0),(9,325,NULL,0,NULL,NULL,0),(9,326,NULL,0,NULL,NULL,0),(9,327,NULL,0,NULL,NULL,0),(9,328,NULL,0,NULL,NULL,0),(9,329,NULL,0,NULL,NULL,0),(9,330,NULL,0,NULL,NULL,0),(9,331,NULL,0,NULL,NULL,0),(9,332,NULL,0,NULL,NULL,0),(9,368,NULL,1,NULL,NULL,0),(9,372,NULL,0,NULL,NULL,0),(9,373,NULL,0,NULL,NULL,0),(10,28,NULL,0,NULL,NULL,0),(10,100,NULL,0,NULL,NULL,0),(10,310,NULL,1,NULL,NULL,0),(10,311,NULL,1,NULL,NULL,0),(10,312,NULL,0,NULL,NULL,0),(10,313,NULL,0,NULL,NULL,0),(10,314,NULL,0,NULL,NULL,0),(10,315,NULL,0,NULL,NULL,0),(10,316,NULL,0,NULL,NULL,0),(10,317,NULL,0,NULL,NULL,0),(10,318,NULL,0,NULL,NULL,0),(10,319,NULL,1,NULL,NULL,0),(10,320,NULL,1,NULL,NULL,0),(10,321,NULL,1,NULL,NULL,0),(10,322,NULL,0,NULL,NULL,0),(10,324,NULL,1,NULL,NULL,0),(10,325,NULL,0,NULL,NULL,0),(10,328,NULL,0,NULL,NULL,0),(10,329,NULL,0,NULL,NULL,0),(10,331,NULL,0,NULL,NULL,0),(10,368,NULL,1,NULL,NULL,0),(10,372,NULL,0,NULL,NULL,0),(10,373,NULL,0,NULL,NULL,0),(13,28,NULL,0,NULL,NULL,0),(13,100,NULL,0,NULL,NULL,0),(13,310,NULL,1,NULL,NULL,0),(13,311,NULL,1,NULL,NULL,0),(13,312,NULL,0,NULL,NULL,0),(13,313,NULL,0,NULL,NULL,0),(13,314,NULL,0,NULL,NULL,0),(13,315,NULL,0,NULL,NULL,0),(13,316,NULL,0,NULL,NULL,0),(13,317,NULL,0,NULL,NULL,0),(13,318,NULL,0,NULL,NULL,0),(13,319,NULL,1,NULL,NULL,0),(13,320,NULL,1,NULL,NULL,0),(13,321,NULL,1,NULL,NULL,0),(13,322,NULL,0,NULL,NULL,0),(13,324,NULL,1,NULL,NULL,0),(13,325,NULL,0,NULL,NULL,0),(13,326,NULL,0,NULL,NULL,0),(13,327,NULL,0,NULL,NULL,0),(13,328,NULL,0,NULL,NULL,0),(13,329,NULL,0,NULL,NULL,0),(13,330,NULL,0,NULL,NULL,0),(13,331,NULL,0,NULL,NULL,0),(13,332,NULL,0,NULL,NULL,0),(13,368,NULL,1,NULL,NULL,0),(13,372,NULL,0,NULL,NULL,0),(13,373,NULL,0,NULL,NULL,0),(14,28,3,0,NULL,NULL,0),(14,100,3,0,NULL,NULL,0),(14,310,NULL,1,NULL,NULL,0),(14,311,NULL,1,NULL,NULL,0),(14,312,NULL,0,NULL,NULL,0),(14,313,NULL,0,NULL,NULL,0),(14,314,NULL,0,NULL,NULL,0),(14,315,NULL,0,NULL,NULL,0),(14,316,NULL,0,NULL,NULL,0),(14,317,NULL,0,NULL,NULL,0),(14,318,NULL,0,NULL,NULL,0),(14,319,NULL,1,NULL,NULL,0),(14,320,NULL,1,NULL,NULL,0),(14,321,NULL,1,NULL,NULL,0),(14,322,NULL,0,NULL,NULL,0),(14,324,NULL,1,NULL,NULL,0),(14,325,NULL,0,NULL,NULL,0),(14,326,NULL,0,NULL,NULL,0),(14,327,3,0,NULL,NULL,0),(14,328,3,0,NULL,NULL,0),(14,330,3,0,NULL,NULL,0),(14,331,3,0,NULL,NULL,0),(14,368,3,1,NULL,NULL,0),(14,371,NULL,0,NULL,NULL,0),(14,372,NULL,0,NULL,NULL,0),(14,373,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `PrawaDostepuUzytkownikow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Przejscie`
--

DROP TABLE IF EXISTS `Przejscie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Przejscie` (
  `idKontroler` int(11) NOT NULL,
  `czasNaWejscie` int(2) NOT NULL DEFAULT '5',
  `maksCzasOtwarcia` int(2) NOT NULL DEFAULT '20',
  `harmonogramOdblokowania` int(11) DEFAULT NULL,
  `harmonogramZablokowania` int(11) DEFAULT NULL,
  `wlaczenieOdblokowania` time DEFAULT NULL,
  `wylaczenieOdblokowania` time DEFAULT NULL,
  `wlaczenieZablokowania` time DEFAULT NULL,
  `wylaczenieZablokowania` time DEFAULT NULL,
  `wylPrzekaznikaPoOtwarciu` tinyint(1) NOT NULL DEFAULT '0',
  `wylPrzekaznikaPoZamknieciu` tinyint(1) NOT NULL DEFAULT '0',
  `wylaczonaKontrolaStanuDrzwi` tinyint(1) NOT NULL DEFAULT '0',
  `zdarzenieOtwarcieBezAutoryzacji` tinyint(1) NOT NULL DEFAULT '1',
  `alarmOtwarcieBezAutoryzacji` tinyint(1) NOT NULL DEFAULT '1',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKontroler`),
  KEY `fk_kontroler_przejscie` (`idKontroler`),
  KEY `fk_schemat_odblokwania_przejscia` (`harmonogramOdblokowania`),
  KEY `fk_schemat_zablokowania_przejscia` (`harmonogramZablokowania`),
  KEY `fk_przejscie_modify` (`modifyUser`),
  CONSTRAINT `fk_kontroler_przejscie` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_przejscie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_schemat_odblokwania` FOREIGN KEY (`harmonogramOdblokowania`) REFERENCES `SchematTygodniowy` (`idSchematTygodniowy`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_schemat_zablokowania` FOREIGN KEY (`harmonogramZablokowania`) REFERENCES `SchematTygodniowy` (`idSchematTygodniowy`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Przejscie`
--

LOCK TABLES `Przejscie` WRITE;
/*!40000 ALTER TABLE `Przejscie` DISABLE KEYS */;
INSERT INTO `Przejscie` VALUES (1,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,NULL,NULL,0),(3,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,NULL,NULL,0),(4,1,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,NULL,NULL,0),(5,1,60,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,0),(6,1,60,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,0),(7,1,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,NULL,NULL,0),(8,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0),(9,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0),(10,1,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0),(11,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0),(12,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0),(13,5,20,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `Przejscie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `Przejscie_BeforeUpdate` BEFORE UPDATE ON `Przejscie`
FOR EACH ROW BEGIN
    IF NEW.wylaczonaKontrolaStanuDrzwi IS NOT NULL AND NEW.wylaczonaKontrolaStanuDrzwi=TRUE THEN
        SET NEW.zdarzenieOtwarcieBezAutoryzacji=FALSE;
        SET NEW.alarmOtwarcieBezAutoryzacji=FALSE;
    ELSEIF NEW.zdarzenieOtwarcieBezAutoryzacji IS NOT NULL AND NEW.zdarzenieOtwarcieBezAutoryzacji=FALSE THEN
        SET NEW.alarmOtwarcieBezAutoryzacji=FALSE;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PrzyciskiPilota`
--

DROP TABLE IF EXISTS `PrzyciskiPilota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrzyciskiPilota` (
  `idCentralaNT` int(11) NOT NULL,
  `idUzytkownik` int(11) NOT NULL,
  `nrPrzycisku` tinyint(3) unsigned NOT NULL,
  `adresEkspandera` tinyint(3) unsigned DEFAULT NULL,
  `nrWyjscia` int(11) DEFAULT '0',
  `generujZdarzenie` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCentralaNT`,`idUzytkownik`,`nrPrzycisku`),
  UNIQUE KEY `PrzyciskiPilota_UNIQUE` (`idCentralaNT`,`idUzytkownik`,`nrPrzycisku`),
  KEY `fk_przyciski_pilota_do_uzytkownik` (`idUzytkownik`),
  KEY `fk_przyciski_pilota_do_ekspandera` (`idCentralaNT`,`adresEkspandera`),
  KEY `fk_przyciski_pilota_modify` (`modifyUser`),
  CONSTRAINT `fk_przyciski_pilota_do_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_przyciski_pilota_do_ekspandera` FOREIGN KEY (`idCentralaNT`, `adresEkspandera`) REFERENCES `EkspanderCentralaNT` (`idCentralaNT`, `adres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_przyciski_pilota_do_uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_przyciski_pilota_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrzyciskiPilota`
--

LOCK TABLES `PrzyciskiPilota` WRITE;
/*!40000 ALTER TABLE `PrzyciskiPilota` DISABLE KEYS */;
INSERT INTO `PrzyciskiPilota` VALUES (1,310,0,10,0,1,NULL,NULL,0),(1,310,1,10,1,1,NULL,NULL,0),(1,324,0,10,0,1,NULL,NULL,0),(1,324,1,10,1,1,NULL,NULL,0),(1,346,0,10,0,1,NULL,NULL,0),(1,346,1,10,1,1,NULL,NULL,0),(1,347,0,10,0,1,NULL,NULL,0),(1,347,1,10,1,1,NULL,NULL,0),(1,349,0,10,0,1,NULL,NULL,0),(1,349,1,10,1,1,NULL,NULL,0),(1,351,0,10,0,1,NULL,NULL,0),(1,351,1,10,1,1,NULL,NULL,0),(1,353,0,10,0,1,NULL,NULL,0),(1,353,1,10,1,1,NULL,NULL,0),(1,354,0,10,0,1,NULL,NULL,0),(1,354,1,10,1,1,NULL,NULL,0),(1,355,0,10,0,1,NULL,NULL,0),(1,355,1,10,1,1,NULL,NULL,0),(1,356,0,10,0,1,NULL,NULL,0),(1,356,1,10,1,1,NULL,NULL,0),(1,357,0,10,0,1,NULL,NULL,0),(1,357,1,10,1,1,NULL,NULL,0),(1,358,0,10,0,1,NULL,NULL,0),(1,358,1,10,1,1,NULL,NULL,0),(1,359,0,10,0,1,NULL,NULL,0),(1,359,1,10,1,1,NULL,NULL,0),(1,360,0,10,0,1,NULL,NULL,0),(1,360,1,10,1,1,NULL,NULL,0),(1,361,0,10,0,1,NULL,NULL,0),(1,361,1,10,1,1,NULL,NULL,0),(1,362,0,10,0,1,NULL,NULL,0),(1,362,1,10,1,1,NULL,NULL,0),(1,363,0,10,0,1,NULL,NULL,0),(1,363,1,10,1,1,NULL,NULL,0),(1,364,0,10,0,1,NULL,NULL,0),(1,364,1,10,1,1,NULL,NULL,0),(1,365,0,10,0,1,NULL,NULL,0),(1,365,1,10,1,1,NULL,NULL,0),(1,366,0,10,0,1,NULL,NULL,0),(1,366,1,10,1,1,NULL,NULL,0),(1,367,0,10,0,1,NULL,NULL,0),(1,367,1,10,1,1,NULL,NULL,0),(1,369,0,10,0,1,NULL,NULL,0),(1,369,1,10,1,1,NULL,NULL,0),(1,371,0,10,0,1,NULL,NULL,0),(1,371,1,10,1,1,NULL,NULL,0),(1,374,0,10,0,1,NULL,NULL,0),(1,374,1,10,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `PrzyciskiPilota` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `PrzyciskPilota_BeforeUpdate` BEFORE UPDATE ON `PrzyciskiPilota`
FOR EACH ROW BEGIN
    IF NEW.nrWyjscia IS NULL THEN
        SET NEW.modifyRemoved=TRUE;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PunktyDostepuStrefy`
--

DROP TABLE IF EXISTS `PunktyDostepuStrefy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PunktyDostepuStrefy` (
  `idStrefa` int(11) NOT NULL,
  `idKontroler` int(11) NOT NULL,
  `czytnik` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'A - 0, B - 1',
  `kierunek` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'WEJSCIE - 0, WYJSCIE - 1',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStrefa`,`idKontroler`,`czytnik`),
  UNIQUE KEY `uq_PunktyDostepuStrefy` (`idStrefa`,`idKontroler`,`czytnik`),
  KEY `fk_PunktyDostepuStrefy_2` (`idKontroler`),
  KEY `fk_PunktyDostepuStrefy_modify` (`modifyUser`),
  CONSTRAINT `fk_PunktyDostepuStrefy_1` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PunktyDostepuStrefy_2` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PunktyDostepuStrefy_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PunktyDostepuStrefy`
--

LOCK TABLES `PunktyDostepuStrefy` WRITE;
/*!40000 ALTER TABLE `PunktyDostepuStrefy` DISABLE KEYS */;
INSERT INTO `PunktyDostepuStrefy` VALUES (1,4,0,0,NULL,NULL,0),(1,4,1,1,NULL,NULL,0),(2,11,0,0,NULL,NULL,0),(3,5,0,0,NULL,NULL,0),(3,6,0,1,NULL,NULL,0),(4,10,0,0,NULL,NULL,0),(5,7,0,0,NULL,NULL,0),(6,8,0,0,NULL,NULL,0),(7,9,0,0,NULL,NULL,0),(8,13,0,0,NULL,NULL,0),(9,3,0,0,NULL,NULL,0),(10,1,0,0,NULL,NULL,0),(13,12,0,0,NULL,NULL,0),(14,5,0,1,NULL,NULL,0),(14,6,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `PunktyDostepuStrefy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PunktyMapyNaMapie`
--

DROP TABLE IF EXISTS `PunktyMapyNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PunktyMapyNaMapie` (
  `idMapa` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numer`,`idMapa`),
  UNIQUE KEY `u_PunktyStrefyNaMapie` (`numer`,`idMapa`),
  KEY `fk_PunktyMapyNaMapie_Mapa` (`idMapa`),
  KEY `fk_PunktyMapyNaMapie_modify` (`modifyUser`),
  CONSTRAINT `fk_PunktyMapyNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PunktyMapyNaMapie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PunktyMapyNaMapie`
--

LOCK TABLES `PunktyMapyNaMapie` WRITE;
/*!40000 ALTER TABLE `PunktyMapyNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `PunktyMapyNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PunktyStrefyNaMapie`
--

DROP TABLE IF EXISTS `PunktyStrefyNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PunktyStrefyNaMapie` (
  `idMapa` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numer`,`idMapa`,`idStrefa`),
  UNIQUE KEY `u_PunktyStrefyNaMapie` (`numer`,`idMapa`,`idStrefa`),
  KEY `fk_PunktyStrefyNaMapie_StrefaNaMapie` (`idStrefa`,`idMapa`),
  KEY `fk_PunktyStrefyNaMapie_modify` (`modifyUser`),
  CONSTRAINT `fk_PunktyStrefyNaMapie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_PunktyStrefyNaMapie_StrefaNaMapie` FOREIGN KEY (`idStrefa`, `idMapa`) REFERENCES `StrefaNaMapie` (`idStrefa`, `idMapa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PunktyStrefyNaMapie`
--

LOCK TABLES `PunktyStrefyNaMapie` WRITE;
/*!40000 ALTER TABLE `PunktyStrefyNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `PunktyStrefyNaMapie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPOknoCzasowe`
--

DROP TABLE IF EXISTS `RCPOknoCzasowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPOknoCzasowe` (
  `idOknoCzasowe` int(11) NOT NULL AUTO_INCREMENT,
  `idSchematDzienny` int(11) NOT NULL,
  `Start` time NOT NULL,
  `Stop` time NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOknoCzasowe`),
  KEY `fk_RCPschemat_dzienny` (`idSchematDzienny`),
  KEY `fk_RCPtime_window_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPschemat_dzienny` FOREIGN KEY (`idSchematDzienny`) REFERENCES `RCPSchematDzienny` (`idSchematDzienny`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RCPtime_window_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPOknoCzasowe`
--

LOCK TABLES `RCPOknoCzasowe` WRITE;
/*!40000 ALTER TABLE `RCPOknoCzasowe` DISABLE KEYS */;
INSERT INTO `RCPOknoCzasowe` VALUES (1,1,'00:07:00','18:00:00',NULL,NULL,0);
/*!40000 ALTER TABLE `RCPOknoCzasowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPSchematDzienny`
--

DROP TABLE IF EXISTS `RCPSchematDzienny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPSchematDzienny` (
  `idSchematDzienny` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSchematDzienny`),
  KEY `fk_RCPday_schedule_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPday_schedule_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPSchematDzienny`
--

LOCK TABLES `RCPSchematDzienny` WRITE;
/*!40000 ALTER TABLE `RCPSchematDzienny` DISABLE KEYS */;
INSERT INTO `RCPSchematDzienny` VALUES (1,'Pon-Pt 7/18',NULL,NULL,0),(2,'Pon-Pt 9/18',NULL,NULL,0),(3,'Sob 7/14',NULL,NULL,0),(4,'Sob 9/14',NULL,NULL,0);
/*!40000 ALTER TABLE `RCPSchematDzienny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPSchematDziennyWTygodniowym`
--

DROP TABLE IF EXISTS `RCPSchematDziennyWTygodniowym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPSchematDziennyWTygodniowym` (
  `idSchematDzienny` int(11) DEFAULT NULL,
  `idSchematTygodniowy` int(11) NOT NULL,
  `dzienTygodnia` enum('PN','WT','SR','CZ','PT','SO','ND') NOT NULL,
  PRIMARY KEY (`idSchematTygodniowy`,`dzienTygodnia`),
  UNIQUE KEY `unique_RCPSchematDziennyWTygodniowym` (`idSchematTygodniowy`,`dzienTygodnia`),
  KEY `fk_RCPSchematDziennyWTygodniowym_1` (`idSchematDzienny`),
  KEY `fk_RCPSchematDziennyWTygodniowym_2` (`idSchematTygodniowy`),
  CONSTRAINT `fk_RCPSchematDziennyWTygodniowym_1` FOREIGN KEY (`idSchematDzienny`) REFERENCES `RCPSchematDzienny` (`idSchematDzienny`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RCPSchematDziennyWTygodniowym_2` FOREIGN KEY (`idSchematTygodniowy`) REFERENCES `RCPSchematTygodniowy` (`idSchematTygodniowy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPSchematDziennyWTygodniowym`
--

LOCK TABLES `RCPSchematDziennyWTygodniowym` WRITE;
/*!40000 ALTER TABLE `RCPSchematDziennyWTygodniowym` DISABLE KEYS */;
INSERT INTO `RCPSchematDziennyWTygodniowym` VALUES (1,1,'PN'),(1,1,'WT'),(1,1,'SR'),(1,1,'CZ'),(1,1,'PT'),(2,2,'PN'),(2,2,'WT'),(2,2,'SR'),(2,2,'CZ'),(2,2,'PT'),(3,1,'SO'),(4,2,'SO');
/*!40000 ALTER TABLE `RCPSchematDziennyWTygodniowym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPSchematTygodniowy`
--

DROP TABLE IF EXISTS `RCPSchematTygodniowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPSchematTygodniowy` (
  `idSchematTygodniowy` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSchematTygodniowy`),
  KEY `fk_RCPweek_schedule_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPweek_schedule_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPSchematTygodniowy`
--

LOCK TABLES `RCPSchematTygodniowy` WRITE;
/*!40000 ALTER TABLE `RCPSchematTygodniowy` DISABLE KEYS */;
INSERT INTO `RCPSchematTygodniowy` VALUES (1,'Kalendarz 7/18',NULL,NULL,0),(2,'Kalendarz 9/18',NULL,NULL,0);
/*!40000 ALTER TABLE `RCPSchematTygodniowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPStrefyReguly`
--

DROP TABLE IF EXISTS `RCPStrefyReguly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPStrefyReguly` (
  `idRCPRegula` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `wejscie` enum('A','B') DEFAULT NULL,
  `wyjscie` enum('A','B') DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRCPRegula`,`idStrefa`),
  UNIQUE KEY `uniqueRegula` (`idRCPRegula`,`idStrefa`),
  KEY `fk_RCPidRCPRegulaa` (`idRCPRegula`),
  KEY `fk_RCPRegulyStrefaa` (`idStrefa`),
  KEY `fk_RCPKRegulyStrefa_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPidRCPRegulaFK` FOREIGN KEY (`idRCPRegula`) REFERENCES `RCPreguly` (`idRCPRegula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RCPKRegulyStrefa_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_RCPRegulyStrefa` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPStrefyReguly`
--

LOCK TABLES `RCPStrefyReguly` WRITE;
/*!40000 ALTER TABLE `RCPStrefyReguly` DISABLE KEYS */;
INSERT INTO `RCPStrefyReguly` VALUES (1,1,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `RCPStrefyReguly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPkalendarz`
--

DROP TABLE IF EXISTS `RCPkalendarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPkalendarz` (
  `idRCPKalendarz` int(11) NOT NULL AUTO_INCREMENT,
  `nazwaKalendarza` varchar(255) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRCPKalendarz`),
  KEY `fk_RCPKalendarz_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPKalendarz_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPkalendarz`
--

LOCK TABLES `RCPkalendarz` WRITE;
/*!40000 ALTER TABLE `RCPkalendarz` DISABLE KEYS */;
INSERT INTO `RCPkalendarz` VALUES (1,'Kalendarz 7/18',NULL,NULL,0),(2,'Kalendarz 9/18',NULL,NULL,0);
/*!40000 ALTER TABLE `RCPkalendarz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPreguly`
--

DROP TABLE IF EXISTS `RCPreguly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPreguly` (
  `idRCPRegula` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRCPRegula`),
  KEY `fk_RCPKReguly_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPKReguly_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPreguly`
--

LOCK TABLES `RCPreguly` WRITE;
/*!40000 ALTER TABLE `RCPreguly` DISABLE KEYS */;
INSERT INTO `RCPreguly` VALUES (1,'Brama 4',NULL,NULL,0);
/*!40000 ALTER TABLE `RCPreguly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RCPtygodniekalendarza`
--

DROP TABLE IF EXISTS `RCPtygodniekalendarza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RCPtygodniekalendarza` (
  `idRCPKalendarz` int(11) NOT NULL,
  `nrTygodnia` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `idSchematTygodniowy` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRCPKalendarz`,`nrTygodnia`,`year`),
  UNIQUE KEY `uniquetygodnie2` (`idRCPKalendarz`,`nrTygodnia`,`year`),
  KEY `fk_RCPidRCPKalendarz` (`idRCPKalendarz`),
  KEY `fk_RCPkalendarzidSchematTygodniowy` (`idSchematTygodniowy`),
  KEY `fk_RCPTygodnieKalendarza_modify` (`modifyUser`),
  CONSTRAINT `fk_RCPkalendarzschemattygodnie` FOREIGN KEY (`idSchematTygodniowy`) REFERENCES `RCPSchematTygodniowy` (`idSchematTygodniowy`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_RCPkalendarztygodnie` FOREIGN KEY (`idRCPKalendarz`) REFERENCES `RCPkalendarz` (`idRCPKalendarz`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RCPTygodnieKalendarza_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RCPtygodniekalendarza`
--

LOCK TABLES `RCPtygodniekalendarza` WRITE;
/*!40000 ALTER TABLE `RCPtygodniekalendarza` DISABLE KEYS */;
INSERT INTO `RCPtygodniekalendarza` VALUES (1,1,2017,1,NULL,NULL,0),(1,2,2017,1,NULL,NULL,0),(1,3,2017,1,NULL,NULL,0),(1,4,2017,1,NULL,NULL,0),(1,5,2017,1,NULL,NULL,0),(1,6,2017,1,NULL,NULL,0),(1,7,2017,1,NULL,NULL,0),(1,8,2017,1,NULL,NULL,0),(1,9,2017,1,NULL,NULL,0),(1,10,2017,1,NULL,NULL,0),(1,11,2017,1,NULL,NULL,0),(1,12,2017,1,NULL,NULL,0),(1,13,2017,1,NULL,NULL,0),(1,14,2017,1,NULL,NULL,0),(1,15,2017,1,NULL,NULL,0),(1,16,2017,1,NULL,NULL,0),(1,17,2017,1,NULL,NULL,0),(1,18,2017,1,NULL,NULL,0),(1,19,2017,1,NULL,NULL,0),(1,20,2017,1,NULL,NULL,0),(1,21,2017,1,NULL,NULL,0),(1,22,2017,1,NULL,NULL,0),(1,23,2017,1,NULL,NULL,0),(1,24,2017,1,NULL,NULL,0),(1,25,2017,1,NULL,NULL,0),(1,26,2017,1,NULL,NULL,0),(1,27,2017,1,NULL,NULL,0),(1,28,2017,1,NULL,NULL,0),(1,29,2017,1,NULL,NULL,0),(1,30,2017,1,NULL,NULL,0),(1,31,2017,1,NULL,NULL,0),(1,32,2017,1,NULL,NULL,0),(1,33,2017,1,NULL,NULL,0),(1,34,2017,1,NULL,NULL,0),(1,35,2017,1,NULL,NULL,0),(1,36,2017,1,NULL,NULL,0),(1,37,2017,1,NULL,NULL,0),(1,38,2017,1,NULL,NULL,0),(1,39,2017,1,NULL,NULL,0),(1,40,2017,1,NULL,NULL,0),(1,41,2017,1,NULL,NULL,0),(1,42,2017,1,NULL,NULL,0),(1,43,2017,1,NULL,NULL,0),(1,44,2017,1,NULL,NULL,0),(1,45,2017,1,NULL,NULL,0),(1,46,2017,1,NULL,NULL,0),(1,47,2017,1,NULL,NULL,0),(1,48,2017,1,NULL,NULL,0),(1,49,2017,1,NULL,NULL,0),(1,50,2017,1,NULL,NULL,0),(1,51,2017,1,NULL,NULL,0),(1,52,2017,1,NULL,NULL,0),(1,2017,2017,1,NULL,NULL,0),(2,1,2017,2,NULL,NULL,0),(2,2,2017,2,NULL,NULL,0),(2,3,2017,2,NULL,NULL,0),(2,4,2017,2,NULL,NULL,0),(2,5,2017,2,NULL,NULL,0),(2,6,2017,2,NULL,NULL,0),(2,7,2017,2,NULL,NULL,0),(2,8,2017,2,NULL,NULL,0),(2,9,2017,2,NULL,NULL,0),(2,10,2017,2,NULL,NULL,0),(2,11,2017,2,NULL,NULL,0),(2,12,2017,2,NULL,NULL,0),(2,13,2017,2,NULL,NULL,0),(2,14,2017,2,NULL,NULL,0),(2,15,2017,2,NULL,NULL,0),(2,16,2017,2,NULL,NULL,0),(2,17,2017,2,NULL,NULL,0),(2,18,2017,2,NULL,NULL,0),(2,19,2017,2,NULL,NULL,0),(2,20,2017,2,NULL,NULL,0),(2,21,2017,2,NULL,NULL,0),(2,22,2017,2,NULL,NULL,0),(2,23,2017,2,NULL,NULL,0),(2,24,2017,2,NULL,NULL,0),(2,25,2017,2,NULL,NULL,0),(2,26,2017,2,NULL,NULL,0),(2,27,2017,2,NULL,NULL,0),(2,28,2017,2,NULL,NULL,0),(2,29,2017,2,NULL,NULL,0),(2,30,2017,2,NULL,NULL,0),(2,31,2017,2,NULL,NULL,0),(2,32,2017,2,NULL,NULL,0),(2,33,2017,2,NULL,NULL,0),(2,34,2017,2,NULL,NULL,0),(2,35,2017,2,NULL,NULL,0),(2,36,2017,2,NULL,NULL,0),(2,37,2017,2,NULL,NULL,0),(2,38,2017,2,NULL,NULL,0),(2,39,2017,2,NULL,NULL,0),(2,40,2017,2,NULL,NULL,0),(2,41,2017,2,NULL,NULL,0),(2,42,2017,2,NULL,NULL,0),(2,43,2017,2,NULL,NULL,0),(2,44,2017,2,NULL,NULL,0),(2,45,2017,2,NULL,NULL,0),(2,46,2017,2,NULL,NULL,0),(2,47,2017,2,NULL,NULL,0),(2,48,2017,2,NULL,NULL,0),(2,49,2017,2,NULL,NULL,0),(2,50,2017,2,NULL,NULL,0),(2,51,2017,2,NULL,NULL,0),(2,52,2017,2,NULL,NULL,0),(2,2017,2017,2,NULL,NULL,0);
/*!40000 ALTER TABLE `RCPtygodniekalendarza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchematDzienny`
--

DROP TABLE IF EXISTS `SchematDzienny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchematDzienny` (
  `idSchematDzienny` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSchematDzienny`),
  KEY `fk_day_schedule_modify` (`modifyUser`),
  CONSTRAINT `fk_day_schedule_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchematDzienny`
--

LOCK TABLES `SchematDzienny` WRITE;
/*!40000 ALTER TABLE `SchematDzienny` DISABLE KEYS */;
INSERT INTO `SchematDzienny` VALUES (1,'DENY',NULL,NULL,0),(2,'Pon-Pt Parking',NULL,NULL,0),(3,'Pon-Pt Wejscie Hala',NULL,NULL,0),(4,'Niedziela Parking',NULL,NULL,0),(5,'Niedziela Wejscie Hala',NULL,NULL,0),(6,'Sobota Parking',NULL,NULL,0),(7,'Sobota Wejscie Hala',NULL,NULL,0);
/*!40000 ALTER TABLE `SchematDzienny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchematDziennyWTygodniowym`
--

DROP TABLE IF EXISTS `SchematDziennyWTygodniowym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchematDziennyWTygodniowym` (
  `idSchematDzienny` int(11) DEFAULT NULL,
  `idSchematTygodniowy` int(11) NOT NULL,
  `dzienTygodnia` int(11) NOT NULL COMMENT '(PN=0,WT=1,SR=2,CZ=3,PT=4,SO=5,ND=6)',
  PRIMARY KEY (`idSchematTygodniowy`,`dzienTygodnia`),
  UNIQUE KEY `unique_SchematDziennyWTygodniowym` (`idSchematTygodniowy`,`dzienTygodnia`),
  KEY `fk_SchematDziennyWTygodniowym_1` (`idSchematDzienny`),
  KEY `fk_SchematDziennyWTygodniowym_2` (`idSchematTygodniowy`),
  CONSTRAINT `fk_SchematDziennyWTygodniowym_1` FOREIGN KEY (`idSchematDzienny`) REFERENCES `SchematDzienny` (`idSchematDzienny`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SchematDziennyWTygodniowym_2` FOREIGN KEY (`idSchematTygodniowy`) REFERENCES `SchematTygodniowy` (`idSchematTygodniowy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchematDziennyWTygodniowym`
--

LOCK TABLES `SchematDziennyWTygodniowym` WRITE;
/*!40000 ALTER TABLE `SchematDziennyWTygodniowym` DISABLE KEYS */;
INSERT INTO `SchematDziennyWTygodniowym` VALUES (2,3,0),(2,3,1),(2,3,2),(2,3,3),(2,3,4),(3,2,0),(3,2,1),(3,2,3),(3,2,4),(4,3,6),(5,2,2),(5,2,6),(6,3,5),(7,2,5);
/*!40000 ALTER TABLE `SchematDziennyWTygodniowym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchematTygodniowy`
--

DROP TABLE IF EXISTS `SchematTygodniowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchematTygodniowy` (
  `idSchematTygodniowy` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSchematTygodniowy`),
  KEY `fk_week_schedule_modify` (`modifyUser`),
  CONSTRAINT `fk_week_schedule_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchematTygodniowy`
--

LOCK TABLES `SchematTygodniowy` WRITE;
/*!40000 ALTER TABLE `SchematTygodniowy` DISABLE KEYS */;
INSERT INTO `SchematTygodniowy` VALUES (1,'DENY',NULL,NULL,0),(2,'Schemat tygodniowy Wejscie Hala',NULL,NULL,0),(3,'Schemat tygodniowy Parking',NULL,NULL,0);
/*!40000 ALTER TABLE `SchematTygodniowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SciezkiGrup`
--

DROP TABLE IF EXISTS `SciezkiGrup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SciezkiGrup` (
  `idCentralaNT` int(11) NOT NULL,
  `idGrupy` int(11) NOT NULL,
  `idSciezkiPrzejsc` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idGrupy`,`idCentralaNT`),
  UNIQUE KEY `unique_SciezkiGrup` (`idGrupy`,`idCentralaNT`),
  KEY `fk_SciezkiGrup_centrala` (`idCentralaNT`),
  KEY `fk_SciezkiGrup_sciezki` (`idSciezkiPrzejsc`),
  KEY `fk_SciezkiGrup_modify` (`modifyUser`),
  CONSTRAINT `fk_SciezkiGrup_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SciezkiGrup_grupy` FOREIGN KEY (`idGrupy`) REFERENCES `GrupaUzytkownikow` (`idGrupaUzytkownikow`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SciezkiGrup_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_SciezkiGrup_sciezki` FOREIGN KEY (`idSciezkiPrzejsc`) REFERENCES `SciezkiPrzejsc` (`idSciezkiPrzejsc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SciezkiGrup`
--

LOCK TABLES `SciezkiGrup` WRITE;
/*!40000 ALTER TABLE `SciezkiGrup` DISABLE KEYS */;
/*!40000 ALTER TABLE `SciezkiGrup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SciezkiPrzejsc`
--

DROP TABLE IF EXISTS `SciezkiPrzejsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SciezkiPrzejsc` (
  `idSciezkiPrzejsc` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSciezkiPrzejsc`),
  KEY `fk_sciezki_centrala` (`idCentralaNT`),
  KEY `fk_SciezkiPrzejsc_modify` (`modifyUser`),
  CONSTRAINT `fk_SciezkiPrzejsc_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_sciezki_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SciezkiPrzejsc`
--

LOCK TABLES `SciezkiPrzejsc` WRITE;
/*!40000 ALTER TABLE `SciezkiPrzejsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `SciezkiPrzejsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SciezkiUzytkownikow`
--

DROP TABLE IF EXISTS `SciezkiUzytkownikow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SciezkiUzytkownikow` (
  `idCentralaNT` int(11) NOT NULL,
  `idUzytkownik` int(11) NOT NULL,
  `idSciezkiPrzejsc` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCentralaNT`,`idUzytkownik`),
  UNIQUE KEY `unique_SciezkiUzytkonwikow` (`idCentralaNT`,`idUzytkownik`),
  KEY `fk_SciezkiUzytkownikow_sciezki` (`idSciezkiPrzejsc`),
  KEY `fk_SciezkiUzytkownikow_uzytkownik` (`idUzytkownik`),
  KEY `fk_SciezkiUzytkownikow_modify` (`modifyUser`),
  CONSTRAINT `fk_SciezkiUzytkownikow_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SciezkiUzytkownikow_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_SciezkiUzytkownikow_sciezki` FOREIGN KEY (`idSciezkiPrzejsc`) REFERENCES `SciezkiPrzejsc` (`idSciezkiPrzejsc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SciezkiUzytkownikow_uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SciezkiUzytkownikow`
--

LOCK TABLES `SciezkiUzytkownikow` WRITE;
/*!40000 ALTER TABLE `SciezkiUzytkownikow` DISABLE KEYS */;
/*!40000 ALTER TABLE `SciezkiUzytkownikow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Strefa`
--

DROP TABLE IF EXISTS `Strefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Strefa` (
  `idStrefa` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `nazwa` varchar(32) NOT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `minIloscWStrefie` int(11) DEFAULT NULL,
  `maxIloscWStrefie` int(11) DEFAULT NULL,
  `tylkoZapiszZdarzenie` tinyint(1) DEFAULT '0',
  `kalendarzOdblokowania` int(11) DEFAULT NULL,
  `kalendarzZablokowania` int(11) DEFAULT NULL,
  `wlaczenieOdblokowania` time DEFAULT NULL,
  `wylaczenieOdblokowania` time DEFAULT NULL,
  `wlaczenieZablokowania` time DEFAULT NULL,
  `wylaczenieZablokowania` time DEFAULT NULL,
  `winda` tinyint(1) NOT NULL DEFAULT '0',
  `przekazAlarmIntegra` tinyint(1) DEFAULT NULL,
  `przekazPozarIntegra` tinyint(1) DEFAULT NULL,
  `czasResetuAntiPassback` time DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idStrefa`),
  KEY `fk_strefa_centrala` (`idCentralaNT`),
  KEY `fk_zone_modify` (`modifyUser`),
  KEY `fk_kalendarz_odblokwania` (`kalendarzOdblokowania`),
  KEY `fk_kalendarz_zablokowania` (`kalendarzZablokowania`),
  CONSTRAINT `fk_kalendarz_odblokwania` FOREIGN KEY (`kalendarzOdblokowania`) REFERENCES `kalendarz` (`idKalendarz`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_kalendarz_zablokowania` FOREIGN KEY (`kalendarzZablokowania`) REFERENCES `kalendarz` (`idKalendarz`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_strefa_centrala` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zone_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Strefa`
--

LOCK TABLES `Strefa` WRITE;
/*!40000 ALTER TABLE `Strefa` DISABLE KEYS */;
INSERT INTO `Strefa` VALUES (1,1,'Brama nr4','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(2,1,'Ksiazeczka zdrowia','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(3,1,'Parking','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(4,1,'Parter WC Damski','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(5,1,'Parter WC Meski','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(6,1,'Parter WC Meski Personel','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(7,1,'Parter WC Niepełnosprawny','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(8,1,'Pietro Pomieszczenie Sprzątaczek','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(9,1,'Pietro WC Damski','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(10,1,'Pietro WC Meski','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(13,1,'WC Gora','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0),(14,1,'Zewnetrzna','',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `Strefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StrefaNaMapie`
--

DROP TABLE IF EXISTS `StrefaNaMapie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StrefaNaMapie` (
  `idMapa` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `pozycjaX` int(11) NOT NULL,
  `pozycjaY` int(11) NOT NULL,
  `kolor` int(11) NOT NULL,
  `pokazLiczbeUzytkownikow` tinyint(1) DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMapa`,`idStrefa`),
  UNIQUE KEY `u_StrefaNaMapie` (`idMapa`,`idStrefa`),
  KEY `fk_StrefaNaMapie_Strefa` (`idStrefa`),
  KEY `fk_StrefaNaMapie_modify` (`modifyUser`),
  CONSTRAINT `fk_StrefaNaMapie_Mapa` FOREIGN KEY (`idMapa`) REFERENCES `Mapa` (`idMapa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_StrefaNaMapie_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_StrefaNaMapie_Strefa` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StrefaNaMapie`
--

LOCK TABLES `StrefaNaMapie` WRITE;
/*!40000 ALTER TABLE `StrefaNaMapie` DISABLE KEYS */;
/*!40000 ALTER TABLE `StrefaNaMapie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `UsuniecieStrefyZMapy_AfterUpdate` AFTER UPDATE ON `StrefaNaMapie`
FOR EACH ROW BEGIN
    IF NEW.modifyRemoved=TRUE THEN
        UPDATE PunktyStrefyNaMapie SET modifyRemoved=TRUE, modifyTime=NEW.modifyTime WHERE idMapa=NEW.idMapa AND idStrefa=NEW.idStrefa;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `StrefyWSciezce`
--

DROP TABLE IF EXISTS `StrefyWSciezce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StrefyWSciezce` (
  `idSciezkiPrzejsc` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `numer` smallint(6) NOT NULL,
  `czasPrzebywania` smallint(6) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSciezkiPrzejsc`,`numer`),
  UNIQUE KEY `stefy_w_sciezce` (`idSciezkiPrzejsc`,`numer`),
  KEY `fk_StrefyWSciezce_do_stref` (`idStrefa`),
  KEY `fk_strefy_w_sciezce_modify` (`modifyUser`),
  CONSTRAINT `fk_StrefyWSciezce_do_sciezki_przejsc` FOREIGN KEY (`idSciezkiPrzejsc`) REFERENCES `SciezkiPrzejsc` (`idSciezkiPrzejsc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_StrefyWSciezce_do_stref` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_strefy_w_sciezce_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StrefyWSciezce`
--

LOCK TABLES `StrefyWSciezce` WRITE;
/*!40000 ALTER TABLE `StrefyWSciezce` DISABLE KEYS */;
/*!40000 ALTER TABLE `StrefyWSciezce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TemporaryStatus`
--

DROP TABLE IF EXISTS `TemporaryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TemporaryStatus` (
  `lockedBy` int(11) DEFAULT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `fk_temporary_stauts_to_user` (`lockedBy`),
  CONSTRAINT `fk_temporary_stauts_to_user` FOREIGN KEY (`lockedBy`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemporaryStatus`
--

LOCK TABLES `TemporaryStatus` WRITE;
/*!40000 ALTER TABLE `TemporaryStatus` DISABLE KEYS */;
INSERT INTO `TemporaryStatus` VALUES (NULL,'2017-11-13 12:31:35');
/*!40000 ALTER TABLE `TemporaryStatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `TemporaryStatus_BeforeUpdate` BEFORE UPDATE ON `TemporaryStatus`
FOR EACH ROW BEGIN
    SET NEW.modifyTime=NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Uzytkownik`
--

DROP TABLE IF EXISTS `Uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Uzytkownik` (
  `idUzytkownik` int(11) NOT NULL AUTO_INCREMENT,
  `firmware_id` smallint(5) unsigned NOT NULL,
  `idGrupy` int(11) DEFAULT NULL,
  `idKalendarz` int(11) DEFAULT NULL,
  `idRCPKalendarz` int(11) DEFAULT NULL,
  `idRCPRegula` int(11) DEFAULT NULL,
  `aktywny` tinyint(1) NOT NULL DEFAULT '1',
  `zmianaKodu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flaga, mówi o koniecznośći zmiany kodu przez użytkownika',
  `kodZmieniony` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flaga mówi, że użytkonik sam zmienił kod',
  `nazwisko` varchar(64) DEFAULT NULL,
  `imie` varchar(32) DEFAULT NULL,
  `nazwa` varchar(16) NOT NULL,
  `nrKsiegowy` varchar(64) DEFAULT NULL,
  `mail` varchar(256) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `kod` varchar(45) DEFAULT NULL,
  `kodApi` varchar(32) DEFAULT NULL,
  `waznyOd` timestamp NULL DEFAULT NULL,
  `waznyDo` timestamp NULL DEFAULT NULL,
  `usuniety` tinyint(1) NOT NULL DEFAULT '1',
  `K` tinyint(1) NOT NULL DEFAULT '0',
  `nrSeryjnyPilota` int(11) DEFAULT NULL,
  `wyjsciaDoWindy` binary(33) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'bity reprezentujace kombinacje wyjść w sterfie typu winda',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUzytkownik`),
  UNIQUE KEY `nazwa_UNIQUE` (`nazwa`,`modifyRemoved`),
  UNIQUE KEY `firmware_id_UNIQUE` (`firmware_id`),
  UNIQUE KEY `nrSeryjnyPilota_UNIQUE` (`nrSeryjnyPilota`),
  UNIQUE KEY `uk_kodApi` (`kodApi`),
  KEY `kod_INDEX` (`kod`),
  KEY `fk_grupa` (`idGrupy`),
  KEY `fk_RCPRegulaKal` (`idRCPRegula`),
  KEY `fk_Kalendarz` (`idRCPKalendarz`),
  KEY `fk_uzytkownik_modify` (`modifyUser`),
  CONSTRAINT `fk_grupa` FOREIGN KEY (`idGrupy`) REFERENCES `GrupaUzytkownikow` (`idGrupaUzytkownikow`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_RCPKalendarz` FOREIGN KEY (`idRCPKalendarz`) REFERENCES `RCPkalendarz` (`idRCPKalendarz`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_RCPRegulaKal` FOREIGN KEY (`idRCPRegula`) REFERENCES `RCPreguly` (`idRCPRegula`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_uzytkownik_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uzytkownik`
--

LOCK TABLES `Uzytkownik` WRITE;
/*!40000 ALTER TABLE `Uzytkownik` DISABLE KEYS */;
INSERT INTO `Uzytkownik` VALUES (1,1,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(2,2,2,NULL,NULL,1,1,0,0,'','','BOX-2','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(3,3,2,NULL,NULL,1,1,0,0,'Górniak','Zbigniew','BOX-3','','','','CUKIERNIA \"DANUTA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(4,4,2,NULL,NULL,1,1,0,0,'','','BOX-4','','','','Zakłady Mięsne Wojtacha Spółka Jawna',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(5,5,2,NULL,NULL,1,1,0,0,'','','BOX-5','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(6,6,2,NULL,NULL,1,1,0,0,'','','BOX-6','','','','Zakład Masarski Dominik Lubos',NULL,NULL,NULL,NULL,0,0,487126,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(7,7,2,NULL,NULL,1,1,0,0,'Więcek','Dariusz','BOX-7','','','','Zakład Masarski \"WIĘCEK\" Spółka Jawna',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(8,8,2,NULL,NULL,1,1,0,0,'Duda','Barbara','BOX-8','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(9,9,2,NULL,NULL,1,1,0,0,'Gaik','Witold','BOX-9','','','','WTG HOLDING Sp. z o.o.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(10,10,2,NULL,NULL,1,1,0,0,'','','BOX-10','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(11,11,2,NULL,NULL,1,1,0,0,'Bara','Jacek','BOX-11','','','','Zakład Rzeźniczo-Wędliniarski',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(12,12,2,NULL,NULL,1,1,0,0,'Wąsek','Robert','BOX-12','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(13,13,2,NULL,NULL,1,1,0,0,'','','BOX-13','','','','\"Społem\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(14,14,2,NULL,NULL,1,1,0,0,'Pawłowicz','Czesław','BOX-14','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(15,15,2,NULL,NULL,1,1,0,0,'','','BOX-15','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(16,16,2,NULL,NULL,1,1,0,0,'Wyszyński','Jarosław','BOX-16','','','','Piekarnia\"BALTA\" Spółka Jawna.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(17,17,2,NULL,NULL,1,1,0,0,'Makowski','Andrzej','BOX-17','','','','Lotto, klucze\n',NULL,NULL,NULL,NULL,0,0,596298,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(18,18,2,NULL,NULL,1,1,0,0,'Tyczka','Gabriel','BOX-18','','','','Pracownia Dekoratorska',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(19,19,2,NULL,NULL,1,1,0,0,'','','BOX-19','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(20,20,2,NULL,NULL,1,1,0,0,'','','BOX-20','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(21,21,2,NULL,NULL,1,1,0,0,'Kubica','Janina','BOX-21','','','','FH Export-Import',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(22,22,2,NULL,NULL,1,1,0,0,'Matyja','Jacek','BOX-22','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(23,23,2,NULL,NULL,1,1,0,0,'','','BOX-23','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(24,24,2,NULL,NULL,1,1,0,0,'Wyszyński','Jarosław','BOX-24','','','','Piekarnia\"BALTA\" Spółka Jawna',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(25,25,2,NULL,NULL,1,1,0,0,'Rosak','Jarosław','BOX-25','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(26,26,2,NULL,NULL,1,1,0,0,'Lewek',' Witold','BOX-26','','','','Firma Handlowo-Usługowa \"WITA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(27,27,2,NULL,NULL,1,1,0,0,'Pietsz ','Grażyna','BOX-27','','','','Firma Handlowa \"PANDA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(28,28,NULL,NULL,NULL,1,1,0,0,'Pretorian ','Krystyna','BOX-28','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(29,29,2,NULL,NULL,1,1,0,0,'','','BOX-29','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(30,30,2,NULL,NULL,1,1,0,0,'Kaczmarek ','Bogusława','BOX-30','','','','FH\"Kaczmarek\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(31,31,2,NULL,NULL,1,1,0,0,'Nowak','Beata','BOX-31','','','','Firma Handlowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(32,32,2,NULL,NULL,1,1,0,0,'','','BOX-32','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(33,33,2,NULL,NULL,1,1,0,0,'Rataj','Mirosław','BOX-33','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(34,34,2,NULL,NULL,1,1,0,0,'','','BOX-34','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(35,35,2,NULL,NULL,1,1,0,0,'Czyżykowski','Marcin','BOX-35','','','','FHU Telmart Czyżykowski Marcin',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(36,36,2,NULL,NULL,1,1,0,0,'Szpak','Waldemar','BOX-36','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(37,37,2,NULL,NULL,1,1,0,0,'','','BOX-37','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(38,38,2,NULL,NULL,1,1,0,0,'Ratuszny',' Krzysztof','BOX-38','','','','FHU',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(39,39,2,NULL,NULL,1,1,0,0,'Świercz ','Elżbieta','BOX-39','','','','Handel Artykułami Przemysłowymi i Spożywczymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(40,40,2,NULL,NULL,1,1,0,0,'','','BOX-40','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(41,41,2,NULL,NULL,1,1,0,0,'','','BOX-41','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(42,42,2,NULL,NULL,1,1,0,0,'Ratuszny','Krzysztof','BOX-42','','','','FHU',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(43,43,2,NULL,NULL,1,1,0,0,'','','BOX-43','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(44,44,2,NULL,NULL,1,1,0,0,'Gawenda ',' Piotr','BOX-44','','','','F\"Gawex\"stoisko \"Piotr\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(45,45,2,NULL,NULL,1,1,0,0,'','','BOX-45','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(46,46,2,NULL,NULL,1,1,0,0,'','','BOX-46','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(47,47,2,NULL,NULL,1,1,0,0,'','','BOX-47','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(48,48,2,NULL,NULL,1,1,0,0,'','','BOX-48','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(49,49,2,NULL,NULL,1,1,0,0,'','','BOX-49','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(50,50,2,NULL,NULL,1,1,0,0,'Brzozowska ',' Teresa','BOX-50','','','','Sklep Spożywczy i Warzywno-Owocowy \"Teresa\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(51,51,2,NULL,NULL,1,1,0,0,'Nowak','Krzysztof','BOX-51','','','','Warsztat Elektromechanika Samochodowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(52,52,2,NULL,NULL,1,1,0,0,'Kubica ',' Zygmunt ','BOX-52','','','','Przedsiębiorstwo Handlowo-Usługowe\"ALFA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(53,53,2,NULL,NULL,1,1,0,0,'','','BOX-53','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(54,54,2,NULL,NULL,1,1,0,0,'','','BOX-54','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(55,55,2,NULL,NULL,1,1,0,0,'Słowiński ',' Henryk','BOX-55','','','','Handel Detaliczny i Obwoźny',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(56,56,2,NULL,NULL,1,1,0,0,'Staszuk ',' Iwona','BOX-56','','','','ATALO Sp. z o.o.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(57,57,2,NULL,NULL,1,1,0,0,'Ślązok',' Michał','BOX-57','','','','FH',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(58,58,2,NULL,NULL,1,1,0,0,'Ratuszny ','Krzysztof','BOX-58','','','','FHU',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(59,59,2,NULL,NULL,1,1,0,0,'Lebek ','Ryszard ','BOX-59','','','','\"FIL\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(60,60,2,NULL,NULL,1,1,0,0,'Rozenbaum ',' J.','BOX-60','','','','\"DŻELFA\"s.c.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(61,61,2,NULL,NULL,1,1,0,0,'Skrzypulec ','Grzegorz','BOX-61','','','','FHU\"ABRO-CAR\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(62,62,2,NULL,NULL,1,1,0,0,'Skrzypulec','Grzegorz','BOX-62','','','','FHU\"ABRO-CAR\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(63,63,2,NULL,NULL,1,1,0,0,'Lebek ',' Anna','BOX-63','','','','PPHU ANNA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(64,64,2,NULL,NULL,1,1,0,0,'Błaszkowicz','Marek ','BOX-64','','','','Grupa ETNA Sp. z o.o. SKA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(65,65,2,NULL,NULL,1,1,0,0,'Świercz ','Elżbieta','BOX-65','','','','Handel Artykułami Przemysłowymi i Spożywczymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(66,66,2,NULL,NULL,1,1,0,0,'Christ ','Paweł','BOX-66','','','','FH',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(67,67,2,NULL,NULL,1,1,0,0,'Rzyman ',' Małgorzata ','BOX-67','','','','Księgarnia\"Ekslibris\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(68,68,2,NULL,NULL,1,1,0,0,'Makowski',' Andrzej','BOX-68','','','','F.H.U.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(69,69,2,NULL,NULL,1,1,0,0,'Rosak ','Jarosław','BOX-69','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(70,70,2,NULL,NULL,1,1,0,0,'','','BOX-70','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(71,71,2,NULL,NULL,1,1,0,0,'Wojsczyk ',' Mariusz','BOX-71','','','','WOJ-BUD Usługi budowlane \"ALIBI\" Sklep-Bar ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(72,72,2,NULL,NULL,1,1,0,0,'','','BOX-72','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(73,73,2,NULL,NULL,1,1,0,0,'','','BOX-73','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(74,74,2,NULL,NULL,1,1,0,0,'Christ','Agnieszka','BOX-74','','','','Handel Artykułami Spożywczymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(75,75,2,NULL,NULL,1,1,0,0,'','','BOX-75','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(76,76,2,NULL,NULL,1,1,0,0,'Długoszewski ',' Stefan','BOX-76','','','','\"Foto-Stivi\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(77,77,2,NULL,NULL,1,1,0,0,'Haberko ',' Monika','BOX-77','','','','F.P.H.U. \"SAGA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(78,78,2,NULL,NULL,1,1,0,0,'','','BOX-78','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(79,79,2,NULL,NULL,1,1,0,0,'','','BOX-79','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(80,80,2,NULL,NULL,1,1,0,0,'','','BOX-80','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(81,81,2,NULL,NULL,1,1,0,0,'','','BOX-81','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(82,82,2,NULL,NULL,1,1,0,0,'','','BOX-82','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(83,83,2,NULL,NULL,1,1,0,0,'Galińska ',' Romualda','BOX-83','','','','Handel Art.. Przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(84,84,2,NULL,NULL,1,1,0,0,'','','BOX-84','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(85,85,2,NULL,NULL,1,1,0,0,'Paluch ',' Małgorzata','BOX-85','','','','Hurt-detal-handel obwoźny.Art. przemysłowe i spożywcze',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(86,86,2,NULL,NULL,1,1,0,0,'','','BOX-86','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(87,87,2,NULL,NULL,1,1,0,0,'Ratuszny ',' Krzysztof','BOX-87','','','','FHU',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(88,88,2,NULL,NULL,1,1,0,0,'Pach ','Barbara','BOX-88','','','','Akademia Sweet Decor',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(89,89,2,NULL,NULL,1,1,0,0,'','','BOX-89','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(90,90,2,NULL,NULL,1,1,0,0,'','','BOX-90','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(91,91,2,NULL,NULL,1,1,0,0,'','','BOX-91','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(92,92,2,NULL,NULL,1,1,0,0,'','','BOX-92','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(93,93,2,NULL,NULL,1,1,0,0,'','','BOX-93','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(94,94,2,NULL,NULL,1,1,0,0,'Orzechowska ','Magdalena','BOX-94','','','','Handel Art.Spożywczo-Przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(95,95,2,NULL,NULL,1,1,0,0,'Orzechowska ',' Magdalena','BOX-95','','','','Handel Art.Spożywczo-Przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(96,96,2,NULL,NULL,1,1,0,0,'Świerczyna ',' Eugeniusz ','BOX-96','','','','P.W. MICROPOL',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(97,97,2,NULL,NULL,1,1,0,0,'','','BOX-97','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(98,98,2,NULL,NULL,1,1,0,0,'','','BOX-98','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(99,99,2,NULL,NULL,1,1,0,0,'','','BOX-99','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(100,100,NULL,NULL,NULL,1,1,0,0,'','','BOX-100','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(101,101,2,NULL,NULL,1,1,0,0,' Górecki','Dariusz ','BOX-101','','','','SPH SERGIOLEONE S.C.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(102,102,2,NULL,NULL,1,1,0,0,' Górecki','Dariusz ','BOX-102','','','','SPH SERGIOLEONE S.C.\n',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(103,103,2,NULL,NULL,1,1,0,0,' Polak','Justyna','BOX-103','','','','FHU Justyna Polak',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(104,104,2,NULL,NULL,1,1,0,0,'Brauer',' L','BOX-104','','','','P.P.H.U. \"MAX\" s.c. ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(105,105,2,NULL,NULL,1,1,0,0,'','','BOX-105','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(106,106,2,NULL,NULL,1,1,0,0,'','','BOX-106','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(107,107,2,NULL,NULL,1,1,0,0,'','','BOX-107','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(108,108,2,NULL,NULL,1,1,0,0,'','','BOX-108','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(109,109,2,NULL,NULL,1,1,0,0,'Musialik','Anna','BOX-109','','','','ANNA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(110,110,2,NULL,NULL,1,1,0,0,'Anderwald ','Monika','BOX-110','','','','Przedsiębiorstwo Wielobranżowe „ NOVA”',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(111,111,2,NULL,NULL,1,1,0,0,'Krawiec','Mariusz','BOX-111','','','','Handel Art.Spożywczei Przemysłowe - Lakiernictwo pojazdowe',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(112,112,2,NULL,NULL,1,1,0,0,'','','BOX-112','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(113,113,2,NULL,NULL,1,1,0,0,'Janczura ','Joanna','BOX-113','','','','FHU \"JOMAX\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(114,114,2,NULL,NULL,1,1,0,0,'Cuglowski ','Piotr','BOX-114','','','','Firma Handlowo-Usługowo-Produkcyjna ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(115,115,2,NULL,NULL,1,1,0,0,'Pronczew ','Zdzisław','BOX-115','','','','Firma Handlowa \"GABI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(116,116,2,NULL,NULL,1,1,0,0,'Breguła ','Kazimierz','BOX-116','','','','PHU \"KM\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(117,117,2,NULL,NULL,1,1,0,0,'','','BOX-117','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(118,118,2,NULL,NULL,1,1,0,0,'Łubowski','Michał ','BOX-118','','','','Piekarnia-Cukiernia \"ŁUBOWSKI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(119,119,2,NULL,NULL,1,1,0,0,'','','BOX-119','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(120,120,2,NULL,NULL,1,1,0,0,'','','BOX-120','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(121,121,2,NULL,NULL,1,1,0,0,'','','BOX-121','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(122,122,2,NULL,NULL,1,1,0,0,'Podkościelny','Bogdan','BOX-122','','','','Przedsiębiorstwo Handlowo-Usługowe \"MAGNUM\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(123,123,2,NULL,NULL,1,1,0,0,'Warzecha ','Marcin','BOX-123','','','','Cukiernia PEREŁKA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(124,124,2,NULL,NULL,1,1,0,0,'Anioł ','Michał','BOX-124','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(125,125,2,NULL,NULL,1,1,0,0,'','','BOX-125','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(126,126,2,NULL,NULL,1,1,0,0,'Kwiatkowska',' Katarzyna','BOX-126','','','','F.H.U. -JUKI',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(127,127,2,NULL,NULL,1,1,0,0,'','','BOX-127','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(128,128,2,NULL,NULL,1,1,0,0,'Siwiec ',' Franciszek','BOX-128','','','','\"PIEKARSTWO\" S.C. ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(129,129,2,NULL,NULL,1,1,0,0,'','','BOX-129','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(130,130,2,NULL,NULL,1,1,0,0,'Kempa ',' Władysław','BOX-130','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(131,131,2,NULL,NULL,1,1,0,0,'','','BOX-131','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(132,132,2,NULL,NULL,1,1,0,0,'Czura','Zbigniew','BOX-132','','','','\"FISH-BOSS\" ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(133,133,2,NULL,NULL,1,1,0,0,'Garncarz ','Agnieszka','BOX-133','','','','F.H. \"GALUX\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(134,134,2,NULL,NULL,1,1,0,0,'Garncarz ',' Agnieszka','BOX-134','','','','F.H. \"GALUX\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(135,135,2,NULL,NULL,1,1,0,0,'Kubanek','Adam','BOX-135','','','','PHU AMISTYL',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(136,136,2,NULL,NULL,1,1,0,0,'','','BOX-136','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(137,137,2,NULL,NULL,1,1,0,0,'','','BOX-137','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(138,138,2,NULL,NULL,1,1,0,0,'','','BOX-138','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(139,139,2,NULL,NULL,1,1,0,0,'','','BOX-139','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(140,140,2,NULL,NULL,1,1,0,0,'Piątkowska ','Teresa','BOX-140','','','','S.C.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(141,141,2,NULL,NULL,1,1,0,0,'','','BOX-141','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(142,142,2,NULL,NULL,1,1,0,0,'Penkaty',' Marcin','BOX-142','','','','PW\"BOŻENA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(143,143,2,NULL,NULL,1,1,0,0,'Wojnowski','Roman','BOX-143','','','','Handel Artykułami Przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(144,144,2,NULL,NULL,1,1,0,0,'','','BOX-144','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(145,145,2,NULL,NULL,1,1,0,0,'','','BOX-145','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(146,146,2,NULL,NULL,1,1,0,0,'Lysik ',' Jarosław','BOX-146','','','','Przedsiębiorstwo Handlowo- Usługowe \"JAREZ\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(147,147,2,NULL,NULL,1,1,0,0,'Deptała ',' Ilona','BOX-147','','','','SUBITO',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(148,148,2,NULL,NULL,1,1,0,0,'Bendkowski ','Grzegorz','BOX-148','','','','Zakład usługowo Handlowy BOND',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(149,149,2,NULL,NULL,1,1,0,0,'Bendkowski',' Grzegorz','BOX-149','','','','Zakład usługowo Handlowy BOND',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(150,150,2,NULL,NULL,1,1,0,0,'Kubanek ','Adam','BOX-150','','','','PHU AMISTYL',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(151,151,2,NULL,NULL,1,1,0,0,'Podkościelna ','Barbara','BOX-151','','','','Firma Handlowo-Usługowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(152,152,2,NULL,NULL,1,1,0,0,'','','BOX-152','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(153,153,2,NULL,NULL,1,1,0,0,'','','BOX-153','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(154,154,2,NULL,NULL,1,1,0,0,'Więckowski','Piotr ','BOX-154','','','','Firma Handlowa \"MAXIMUS\" S.C.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(155,155,2,NULL,NULL,1,1,0,0,'Lebek','Anna','BOX-155','','','','P.P.H.U.\"ANNA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(156,156,2,NULL,NULL,1,1,0,0,'','','BOX-156','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(157,157,2,NULL,NULL,1,1,0,0,'Musialik ','Anna','BOX-157','','','','ANNA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(158,158,2,NULL,NULL,1,1,0,0,'Lorencka ','Maria','BOX-158','','','','FHU \"MARIA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(159,159,2,NULL,NULL,1,1,0,0,'','','BOX-159','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(160,160,2,NULL,NULL,1,1,0,0,'','','BOX-160','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(161,161,2,NULL,NULL,1,1,0,0,'Gorol ','Jolanta','BOX-161','','','','FH\"OLIWER\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(162,162,2,NULL,NULL,1,1,0,0,'Kobier ','Tomasz','BOX-162','','','','\"PLAYSOFT\"Sprzedaż Art.Komputerowych',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(163,163,2,NULL,NULL,1,1,0,0,'Maryniak','Jan','BOX-163','','','','Firma Handlowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(164,164,2,NULL,NULL,1,1,0,0,'Matejczyk ',' Agnieszka','BOX-164','','','','Firma Handlowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(165,165,2,NULL,NULL,1,1,0,0,'','','BOX-165','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(166,166,2,NULL,NULL,1,1,0,0,'','','BOX-166','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(167,167,2,NULL,NULL,1,1,0,0,'Jędruś','Krzysztof','BOX-167','','','','Firma Handlowo Usługowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(168,168,2,NULL,NULL,1,1,0,0,'Miśków ','Marek','BOX-168','','','','Firma Handlowo Transportowa\"ENIGMA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(169,169,2,NULL,NULL,1,1,0,0,'','','BOX-169','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(170,170,2,NULL,NULL,1,1,0,0,'Duda ',' Izabela','BOX-170','','','','DUDA-POL',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(171,171,2,NULL,NULL,1,1,0,0,'','','BOX-171','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(172,172,2,NULL,NULL,1,1,0,0,'Sałkowska ',' Agnieszka','BOX-172','','','','\"koModa\" ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(173,173,2,NULL,NULL,1,1,0,0,'','','BOX-173','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(174,174,2,NULL,NULL,1,1,0,0,'','','BOX-174','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(175,175,2,NULL,NULL,1,1,0,0,'Gawenda','Piotr','BOX-175','','','','F\"Gawex\"stoisko \"Piotr\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(176,176,2,NULL,NULL,1,1,0,0,'Kozerska ','Jadwiga','BOX-176','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(177,177,2,NULL,NULL,1,1,0,0,'','','BOX-177','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(178,178,2,NULL,NULL,1,1,0,0,'','','BOX-178','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(179,179,2,NULL,NULL,1,1,0,0,'Skupień ','Dieter','BOX-179','','','','Stolarstwo i Handel Obwoźny',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(180,180,2,NULL,NULL,1,1,0,0,'Wcisło','Rafał','BOX-180','','','','BEL-TEX',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(181,181,2,NULL,NULL,1,1,0,0,'','','BOX-181','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(182,182,2,NULL,NULL,1,1,0,0,'Krawiec ',' Irena','BOX-182','','','','Handel Det Art. Spoż i Przem ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(183,183,2,NULL,NULL,1,1,0,0,'Warzecha ','Marcin','BOX-183','','','','Cukiernia PEREŁKA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(184,184,2,NULL,NULL,1,1,0,0,'Warzecha ',' Marcin','BOX-184','','','','Cukiernia PEREŁKA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(185,185,2,NULL,NULL,1,1,0,0,'','','BOX-185','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(186,186,2,NULL,NULL,1,1,0,0,'','','BOX-186','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(187,187,2,NULL,NULL,1,1,0,0,'','','BOX-187','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(188,188,2,NULL,NULL,1,1,0,0,'','','BOX-188','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(189,189,2,NULL,NULL,1,1,0,0,'Rzepka ','Irena','BOX-189','','','','Artykuły Przemysłowe',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(190,190,2,NULL,NULL,1,1,0,0,'','','BOX-190','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(191,191,2,NULL,NULL,1,1,0,0,'Karpiel ','Władysław','BOX-191','','','','Handel obwoźny- Skup Sprzedaż',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(192,192,2,NULL,NULL,1,1,0,0,'Wardęga ',' Elżbieta','BOX-192','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(193,193,2,NULL,NULL,1,1,0,0,'Rataj','Adam','BOX-193','','','','Firma Handlowa Hurt- Detal',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(194,194,2,NULL,NULL,1,1,0,0,'','','BOX-194','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(195,195,2,NULL,NULL,1,1,0,0,'','','BOX-195','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(196,196,2,NULL,NULL,1,1,0,0,'Wolny','Andrzej','BOX-196','','','','\"Handel-hurt,detal,okrężny\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(197,197,2,NULL,NULL,1,1,0,0,'Krawiec ',' Irena','BOX-197','','','','Handel Det Art. Spoż i Przem ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(198,198,2,NULL,NULL,1,1,0,0,'Huć','Maria','BOX-198','','','','FH\"CARO\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(199,199,2,NULL,NULL,1,1,0,0,'','','BOX-199','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(200,200,2,NULL,NULL,1,1,0,0,'Pankiewicz ','Eugeniusz','BOX-200','','','','Przedsiębiorstwo Handlowo Usługowe ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(201,201,2,NULL,NULL,1,1,0,0,'','','BOX-201','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(202,202,2,NULL,NULL,1,1,0,0,'','','BOX-202','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(203,203,2,NULL,NULL,1,1,0,0,'Piernikarczyk',' Roman','BOX-203','','','','WKV\"Wiosna\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(204,204,2,NULL,NULL,1,1,0,0,'','','BOX-204','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(205,205,2,NULL,NULL,1,1,0,0,'Wiegand ','Ryszard','BOX-205','','','','Firma Handlowo-Usługowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(206,206,2,NULL,NULL,1,1,0,0,'','','BOX-206','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(207,207,2,NULL,NULL,1,1,0,0,'Bednarowicz ',' Paulina','BOX-207','','','','BABY SHOP',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(208,208,2,NULL,NULL,1,1,0,0,'Janczura',' Maria','BOX-208','','','','Firma Handlowo-Usługowa \"MARPOL\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(209,209,2,NULL,NULL,1,1,0,0,'Kuklińska ',' Małgorzata','BOX-209','','','','Zegarki -Biżuteria',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(210,210,2,NULL,NULL,1,1,0,0,'','','BOX-210','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(211,211,2,NULL,NULL,1,1,0,0,'Olszewski','Zbigniew','BOX-211','','','','Przedsiębiorstwo Handlowe',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(212,212,2,NULL,NULL,1,1,0,0,'Zdónek','Marzena','BOX-212','','','','\"MARTUSIA\" Sklep z artykułami przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(213,213,2,NULL,NULL,1,1,0,0,'Wanot ',' Jolanta','BOX-213','','','','Natura-Med. ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(214,214,2,NULL,NULL,1,1,0,0,'','','BOX-214','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(215,215,2,NULL,NULL,1,1,0,0,'Małek ','Adrian','BOX-215','','','','DORMEN',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(216,216,2,NULL,NULL,1,1,0,0,' Górecki','Dariusz','BOX-216','','','','SPH SERGIOLEONE S.C.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(217,217,2,NULL,NULL,1,1,0,0,'Tuszyński ',' Antoni','BOX-217','','','','FPHU\"KIKO\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(218,218,2,NULL,NULL,1,1,0,0,'','','BOX-218','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(219,219,2,NULL,NULL,1,1,0,0,'Majerowski','Adam','BOX-219','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(220,220,2,NULL,NULL,1,1,0,0,'Olejnik ',' Władysław','BOX-220','','','','F.H. \"LUZ\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(221,221,2,NULL,NULL,1,1,0,0,'','','BOX-221','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(222,222,2,NULL,NULL,1,1,0,0,'','','BOX-222','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(223,223,2,NULL,NULL,1,1,0,0,'','','BOX-223','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(224,224,2,NULL,NULL,1,1,0,0,'','','BOX-224','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(225,225,2,NULL,NULL,1,1,0,0,'Drwęcki ','Janusz','BOX-225','','','','Artykuły Przemysłowe',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(226,226,2,NULL,NULL,1,1,0,0,'Drwęcki','','BOX-226','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(227,227,2,NULL,NULL,1,1,0,0,'Kowalska ',' Mariola','BOX-227','','','','Handel Art. Przemysłowymi',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(228,228,2,NULL,NULL,1,1,0,0,'','','BOX-228','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(229,229,2,NULL,NULL,1,1,0,0,'Ciechanowska - Janus ','Elżbieta','BOX-229','','','','NAVI-TEL ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(230,230,2,NULL,NULL,1,1,0,0,'','','BOX-230','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(231,231,2,NULL,NULL,1,1,0,0,'Dobrzańska ',' Genowefa','BOX-231','','','','\"Styl u Agi\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(232,232,2,NULL,NULL,1,1,0,0,'Jarząbek ','Danuta','BOX-232','','','','PW\"HORTENSJA I\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(233,233,2,NULL,NULL,1,1,0,0,'Olszewska ',' Mariola','BOX-233','','','','FH\"MEGI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(234,234,2,NULL,NULL,1,1,0,0,'','','BOX-234','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(235,235,2,NULL,NULL,1,1,0,0,'Le ','Adam','BOX-235','','','','FH\"LI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(236,236,2,NULL,NULL,1,1,0,0,'','','BOX-236','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(237,237,2,NULL,NULL,1,1,0,0,'','','BOX-237','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(238,238,2,NULL,NULL,1,1,0,0,'Wilk','Zdzisław','BOX-238','','','','PH\"Dagmart\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(239,239,2,NULL,NULL,1,1,0,0,'Olejnik ','Władysław','BOX-239','','','','F.H. \"LUZ\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(240,240,2,NULL,NULL,1,1,0,0,'','','BOX-240','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(241,241,2,NULL,NULL,1,1,0,0,'Wilk ','Zdzisław','BOX-241','','','','PH\"Dagmart\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(242,242,2,NULL,NULL,1,1,0,0,'','','BOX-242','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(243,243,2,NULL,NULL,1,1,0,0,'','','BOX-243','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(244,244,2,NULL,NULL,1,1,0,0,'Małek ','Dorota','BOX-244','','','','DORMEN SUIT',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(245,245,2,NULL,NULL,1,1,0,0,'','','BOX-245','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(246,246,2,NULL,NULL,1,1,0,0,'','','BOX-246','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(247,247,2,NULL,NULL,1,1,0,0,'Olszewska ','Mariola','BOX-247','','','','FH\"MEGI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(248,248,2,NULL,NULL,1,1,0,0,'','','BOX-248','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(249,249,2,NULL,NULL,1,1,0,0,'Olszewski ','Grzegorz','BOX-249','','','','FH \"KAJA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(250,250,2,NULL,NULL,1,1,0,0,'','','BOX-250','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(251,251,2,NULL,NULL,1,1,0,0,'Bartkowski ',' Zygmunt','BOX-251','','','','P.P.H.U. \"BARTEX\" Export-Import',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(252,252,2,NULL,NULL,1,1,0,0,'','','BOX-252','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(253,253,2,NULL,NULL,1,1,0,0,'Fiołek',' Andrzej','BOX-253','','','','\"AWIMEX\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(254,254,2,NULL,NULL,1,1,0,0,'Drwęcki ','Janusz','BOX-254','','','','Artykuły Przemysłowe',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(255,255,2,NULL,NULL,1,1,0,0,' Eliasz','Mariusz','BOX-255','','','','MarTrade',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(256,256,2,NULL,NULL,1,1,0,0,'','','BOX-256','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(257,257,2,NULL,NULL,1,1,0,0,'Rekus ','Tomasz','BOX-257','','','','FH-U \"RECAR\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(258,258,2,NULL,NULL,1,1,0,0,'Mateja',' Jacek','BOX-258','','','','FH',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(259,259,2,NULL,NULL,1,1,0,0,'','','BOX-259','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(260,260,2,NULL,NULL,1,1,0,0,'Ibek ',' Irena','BOX-260','','','','FHU\"IRENA\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(261,261,2,NULL,NULL,1,1,0,0,'','','BOX-261','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(262,262,2,NULL,NULL,1,1,0,0,'','','BOX-262','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(263,263,2,NULL,NULL,1,1,0,0,'Walczuk ',' Jolanta','BOX-263','','','','Usługi Krawieckie- Przeróbki',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(264,264,2,NULL,NULL,1,1,0,0,'Krawczyk ','Barbara','BOX-264','','','','Usługi Krawieckie',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(265,265,2,NULL,NULL,1,1,0,0,'','','BOX-265','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(266,266,2,NULL,NULL,1,1,0,0,'Bieleń ','Roman','BOX-266','','','','F.\"MAGNAT\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(267,267,2,NULL,NULL,1,1,0,0,'Horzela ',' Dawid','BOX-267','','','','INDYGO',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(268,268,2,NULL,NULL,1,1,0,0,'','','BOX-268','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(269,269,2,NULL,NULL,1,1,0,0,'Białożyt ','Jadwiga','BOX-269','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(270,270,2,NULL,NULL,1,1,0,0,'','','BOX-270','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(271,271,2,NULL,NULL,1,1,0,0,'Le',' Adam','BOX-271','','','','FH\"LI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(272,272,2,NULL,NULL,1,1,0,0,'','','BOX-272','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(273,273,2,NULL,NULL,1,1,0,0,'Korczak ',' Arkadiusz','BOX-273','','','','F.H.U. ARK-KOR',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(274,274,2,NULL,NULL,1,1,0,0,'','','BOX-274','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(275,275,2,NULL,NULL,1,1,0,0,'','','BOX-275','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(276,276,2,NULL,NULL,1,1,0,0,'','','BOX-276','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(277,277,2,NULL,NULL,1,1,0,0,'Kotarba ','Jolanta','BOX-277','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(278,278,2,NULL,NULL,1,1,0,0,'Garbacz','Mirela','BOX-278','','','','KOŁYSANKA\n',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(279,279,2,NULL,NULL,1,1,0,0,'Majerowski ','Adam','BOX-279','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(280,280,2,NULL,NULL,1,1,0,0,'','','BOX-280','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(281,281,2,NULL,NULL,1,1,0,0,'','','BOX-281','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(282,282,2,NULL,NULL,1,1,0,0,'','','BOX-282','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(283,283,2,NULL,NULL,1,1,0,0,'Fuchs ','Renata','BOX-283','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(284,284,2,NULL,NULL,1,1,0,0,'','','BOX-284','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(285,285,2,NULL,NULL,1,1,0,0,'Sar','Anna ','BOX-285','','','','Sarex s.c.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(286,286,2,NULL,NULL,1,1,0,0,'Le','Adam','BOX-286','','','','FH\"LI\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(287,287,2,NULL,NULL,1,1,0,0,'Podleszka ',' Sławomir','BOX-287','','','','Firma Handlowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(288,288,2,NULL,NULL,1,1,0,0,'Kaczmarek ','Bogusława','BOX-288','','','','FH\"Kaczmarek\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(289,289,2,NULL,NULL,1,1,0,0,'Horzela ','Patrycja','BOX-289','','','','H360',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(290,290,2,NULL,NULL,1,1,0,0,'Małek',' Dorota','BOX-290','','','','DORMEN SUIT',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(291,291,2,NULL,NULL,1,1,0,0,'','','BOX-291','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(292,292,2,NULL,NULL,1,1,0,0,'Bożek ','Irena','BOX-292','','','','PPHU\"WRZOS\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(293,293,2,NULL,NULL,1,1,0,0,'Kaczmarek ',' Bogusława','BOX-293','','','','FH\"Kaczmarek\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(294,294,2,NULL,NULL,1,1,0,0,'','','BOX-294','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(295,295,2,NULL,NULL,1,1,0,0,'Kołodziejczyk ','Elżbieta','BOX-295','','','','Firma Odzieżowa E&R',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(296,296,2,NULL,NULL,1,1,0,0,'','','BOX-296','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(297,297,2,NULL,NULL,1,1,0,0,'Pamuła ','Danuta','BOX-297','','','','Firma Handlowa',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(298,298,2,NULL,NULL,1,1,0,0,'','','BOX-298','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(299,299,2,NULL,NULL,1,1,0,0,'Potempa ',' Krzysztof','BOX-299','','','','F.H.U. \"KRIS-BUT\"',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(300,300,2,NULL,NULL,1,1,0,0,'Górecki','Dariusz ','BOX-300','','','','SPH SERGIOLEONE S.C.',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(301,301,2,NULL,NULL,1,1,0,0,'Zdebik ',' Józef','BOX-301','','','','Cukiernictwo-Wytwornia Lodów ',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(302,302,2,NULL,NULL,1,1,0,0,'','','BOX-302','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(303,303,2,NULL,NULL,1,1,0,0,'','','BOX-303','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(304,304,2,NULL,NULL,1,1,0,0,'','','BOX-304','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(305,305,2,NULL,NULL,1,1,0,0,'','','BOX-305','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(306,306,2,NULL,NULL,1,1,0,0,'','','BOX-306','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(307,307,2,NULL,NULL,1,1,0,0,'','','BOX-307','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(308,308,2,NULL,NULL,1,1,0,0,'','','BOX-308','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(309,309,2,NULL,NULL,1,1,0,0,'','','BOX-309','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(310,310,NULL,NULL,NULL,NULL,1,0,0,'','','Adrian Wolnik','','','','',NULL,NULL,NULL,NULL,0,0,427377,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(311,311,NULL,NULL,NULL,1,1,0,0,'','','Henryk Łaniewski','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(312,312,NULL,NULL,NULL,1,1,0,0,'','','WC1','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(313,313,NULL,NULL,NULL,1,1,0,0,'','','WC2','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(314,314,NULL,NULL,NULL,1,1,0,0,'','','WC3','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(315,315,NULL,NULL,NULL,1,1,0,0,'','','WC4','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(316,316,NULL,NULL,NULL,1,1,0,0,'','','WC5','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(317,317,NULL,NULL,NULL,1,1,0,0,'','','WC6','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(318,318,NULL,NULL,NULL,1,1,0,0,'','','WC 7','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(319,319,NULL,NULL,NULL,1,1,0,0,'','','Ochrona 1','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(320,320,NULL,NULL,NULL,1,1,0,0,'','','Ochrona 2','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(321,321,NULL,NULL,NULL,1,1,0,0,'','','Ochrona 3','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(322,322,NULL,NULL,NULL,1,1,0,0,'','','Gość 1','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(323,323,2,NULL,NULL,1,1,0,0,'','','Gość 2','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(324,324,NULL,NULL,NULL,1,1,0,0,'','','Kośny Dariusz','','','','',NULL,NULL,NULL,NULL,0,0,255670,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(325,325,NULL,NULL,NULL,1,1,0,0,'','','Michał Korfel','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(326,326,NULL,NULL,1,1,1,0,0,'Maciuła','Adrian','BOX-326','','','','NUMER STANOWISKA 6A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(327,327,NULL,NULL,1,1,1,0,0,'Heflik ','Bernadeta','BOX-327 ','','','','NUMER STANOWISKA 143A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(328,328,NULL,NULL,1,1,1,0,0,'Le','Adam','BOX-328 ','','','','NUMER STANOWISKA 215A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(329,329,NULL,NULL,1,1,1,0,0,'Gajda','S','BOX-329 ','','','','OLTERM \nNUMER STANOWSKA 216A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(330,330,NULL,NULL,1,1,1,0,0,'Dudek','Katarzyna','BOX-330','','','','NUMER STANOWISKA 253A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(331,331,NULL,NULL,1,1,1,0,0,'Kowacka','Aleksandra','BOX-331','','','','NUMER STANOWISKA 256A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(332,332,NULL,NULL,1,1,1,0,0,'Podleszka','Sławomir','BOX-332','','','','NUMER STANOWSKA 287A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(333,333,2,NULL,1,1,1,0,0,'Gniewkiewicz','Bożena','BOX-333','','','','STANOWISKO NUMER 292A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(334,334,2,NULL,1,1,1,0,0,'Bozenbaun','Katarzyna','BOX-334','','','','NUMER STANOWISKA 64A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(335,335,2,NULL,1,1,1,0,0,'Etna Grupa( Oswald)','','BOX-335','','','','STANOWISKO NUMER BOX KANTOR',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(336,336,2,NULL,1,1,1,0,0,'Markowska','Katarzyna','BOX-336','','','','NUMER STANOWISKA 88A',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(337,337,2,NULL,1,1,1,0,0,'\"Familia\"','','BOX-337','','','','NUMER BEZ NUMERU \"Familia\"\r\n',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(338,338,2,NULL,1,1,1,0,0,'KLUCZE','','BOX-338','','','','STANOWISKO KLUCZE\r\n',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(339,339,2,NULL,1,1,1,0,0,'MEBLE','','BOX-339','','','','STANOWISKO MEBLE',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(340,340,2,NULL,1,1,1,0,0,'REKLAMA','','BOX-340','','','','REKLAMA',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(342,342,5,NULL,NULL,1,1,0,0,'LUBOS','','REMONDIS1','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(343,343,5,NULL,NULL,1,1,0,0,'JAGIELLICZ','','REMONDIS2','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(344,344,5,NULL,NULL,1,1,0,0,'BRODZIAK','','REMONDIS3','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(345,345,5,NULL,NULL,1,1,0,0,'PIELOT','','REMONDIS4','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(346,346,5,NULL,NULL,1,1,0,0,'KRZYMIŃSKI','','REMONDIS5','','','','',NULL,NULL,NULL,NULL,0,0,486576,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(347,347,5,NULL,NULL,1,1,0,0,'KURZOK','','REMONDIS6','','','','',NULL,NULL,NULL,NULL,0,0,704256,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(348,348,5,NULL,NULL,1,1,0,0,'WAJSPRYCH','','REMONDIS7','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(349,349,5,NULL,NULL,1,1,0,0,'OLSZOK','','REMONDIS8','','','','',NULL,NULL,NULL,NULL,0,0,487037,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(350,350,5,NULL,NULL,1,1,0,0,'MICHURA','','REMONDIS9','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(351,351,5,NULL,NULL,1,1,0,0,'KUCZKOWSKI','','REMONDIS10','','','','',NULL,NULL,NULL,NULL,0,0,596369,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(352,352,5,NULL,NULL,1,1,0,0,'CHOROBIK','','REMONDIS11','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(353,353,5,NULL,NULL,1,1,0,0,'ŚLĄZOK','','REMONDIS12','','','','',NULL,NULL,NULL,NULL,0,0,566200,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(354,354,5,NULL,NULL,1,1,0,0,'KULESZA','','REMONDIS13','','','','',NULL,NULL,NULL,NULL,0,0,566205,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(355,355,5,NULL,NULL,1,1,0,0,'WIDAWKA','','REMONDIS14','','','','',NULL,NULL,NULL,NULL,0,0,569157,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(356,356,5,NULL,NULL,1,1,0,0,'WITKOWSKA','','REMONDIS15','','','','',NULL,NULL,NULL,NULL,0,0,576508,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(357,357,5,NULL,NULL,1,1,0,0,'DAWID','','REMONDIS16','','','','',NULL,NULL,NULL,NULL,0,0,531172,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(358,358,5,NULL,NULL,1,1,0,0,'SKRODZKI','','REMONDIS17','','','','',NULL,NULL,NULL,NULL,0,0,576607,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(359,359,5,NULL,NULL,1,1,0,0,'STERNOL','','REMONDIS18','','','','',NULL,NULL,NULL,NULL,0,0,566800,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(360,360,5,NULL,NULL,1,1,0,0,'TRYBALSKI','','REMONDIS19','','','','',NULL,NULL,NULL,NULL,0,0,566218,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(361,361,5,NULL,NULL,1,1,0,0,'STRZYSZCZ','','REMONDIS20','','','','',NULL,NULL,NULL,NULL,0,0,596013,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(362,362,5,NULL,NULL,1,1,0,0,'MOSZYŃSKI','','REMONDIS21','','','','',NULL,NULL,NULL,NULL,0,0,595788,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(363,363,5,NULL,NULL,1,1,0,0,'CHARASIŃSKI','','REMONDIS22','','','','',NULL,NULL,NULL,NULL,0,0,596266,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(364,364,5,NULL,NULL,1,1,0,0,'PIEKARSKI','','REMONDIS23','','','','',NULL,NULL,NULL,NULL,0,0,595360,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(365,365,5,NULL,NULL,1,1,0,0,'DUDA','','REMONDIS24','','','','',NULL,NULL,NULL,NULL,0,0,570238,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(366,366,5,NULL,NULL,1,1,0,0,'SATERNUS','','REMONDIS25','','','','',NULL,NULL,NULL,NULL,0,0,599073,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(367,367,5,NULL,NULL,1,1,0,0,'PORTIERNIA','','REMONDIS26','','','','',NULL,NULL,NULL,NULL,0,0,491815,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(368,368,NULL,NULL,NULL,1,1,0,0,'Mokrus','Lucjan','Mokrus Lucjan','','','','pracownik gospodarczy',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(369,341,5,NULL,NULL,NULL,1,0,0,'TOBOR','','REMONDIS27','','','','',NULL,NULL,NULL,NULL,0,0,596002,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(371,369,NULL,NULL,NULL,NULL,1,0,0,'Mojsa','','REMONDIS28','','','','',NULL,NULL,NULL,NULL,0,0,526382,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(372,370,NULL,NULL,NULL,NULL,1,0,0,'Gość','3','Gość 3','','','','',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(373,371,NULL,NULL,NULL,NULL,1,0,0,'Smugowski','Grzegorz','Smugowski Grzego','','','','sprzątanie',NULL,NULL,NULL,NULL,0,0,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0),(374,372,5,NULL,NULL,NULL,1,0,0,'','','test10','','','','',NULL,NULL,NULL,NULL,0,0,595919,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0);
/*!40000 ALTER TABLE `Uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `UzytkownikNazwa_BeforeUpdate` BEFORE UPDATE ON `Uzytkownik`
FOR EACH ROW BEGIN
  IF IFNULL(NEW.imie,'EMPTY') != IFNULL(OLD.imie,'EMPTY') AND NEW.nazwa IS NULL THEN
    SET NEW.nazwa=LEFT(CONCAT(IFNULL(OLD.nazwisko,''), ' ', IFNULL(NEW.imie,'')),16);
  ELSEIF IFNULL(NEW.nazwisko,'EMPTY') != IFNULL(OLD.nazwisko,'EMPTY') AND NEW.nazwa IS NULL THEN
    SET NEW.nazwa=LEFT(CONCAT(IFNULL(NEW.nazwisko,''), ' ', IFNULL(OLD.imie,'')),16);
  END IF;
  IF NEW.nrSeryjnyPilota IS NULL THEN
    UPDATE PrzyciskiPilota SET modifyRemoved=TRUE, modifyUser=NEW.modifyUser, modifyTime=NOW() WHERE idUzytkownik=NEW.idUzytkownik;
  END IF;
  IF NEW.kod IS NOT NULL THEN
    SELECT count(idUzytkownik),idUzytkownik FROM Uzytkownik WHERE usuniety=FALSE AND kod=NEW.kod AND idUzytkownik != NEW.idUzytkownik INTO @duplicate,@hited;
    IF @duplicate != 0 THEN
        SET NEW.kod = NULL;
        SET NEW.zmianaKodu = TRUE;
    END IF;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `UzytkownikProgramu`
--

DROP TABLE IF EXISTS `UzytkownikProgramu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UzytkownikProgramu` (
  `idUzytkownik` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `haslo` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `harmonogramy` tinyint(4) DEFAULT NULL COMMENT 'BRAK - 0, ODCZYT - 1, MODYFIKACJA - 2 )',
  `uzytkownicy` tinyint(4) DEFAULT NULL COMMENT 'BRAK - 0, ODCZYT - 1, MODYFIKACJA - 2 )',
  `globalny` int(11) DEFAULT NULL,
  `globalnyStan` tinyint(1) NOT NULL DEFAULT '0',
  `globalnySerwis` tinyint(1) NOT NULL DEFAULT '0',
  `globalneMapy` tinyint(1) NOT NULL DEFAULT '0',
  `globalneZdarzenia` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUzytkownik`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `idUzytkownik_UNIQUE` (`idUzytkownik`),
  KEY `fk_UzytkownikProgramu_uzytkownik` (`idUzytkownik`),
  KEY `fk_uzytkownik_programu_modify` (`modifyUser`),
  CONSTRAINT `fk_UzytkownikProgramu_uzytkownik` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uzytkownik_programu_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UzytkownikProgramu`
--

LOCK TABLES `UzytkownikProgramu` WRITE;
/*!40000 ALTER TABLE `UzytkownikProgramu` DISABLE KEYS */;
INSERT INTO `UzytkownikProgramu` VALUES (1,'admin','$2y$10$Lt9Pup2g4PNcUsWjzK4h5.X0HklAmf0/WTpnr1rKrPzP5UdhM0Jwq',2,2,1,0,1,0,0,NULL,NULL,0),(2,'michal','$2y$10$lyiMsYvmy1eNXe.xoeheuej4qB1XwaLLvTTwIlbY4z5mPv8qRtmIW',2,2,NULL,0,0,2,0,NULL,NULL,0),(327,'login193','$2y$10$NJw6VryxgQo/mrfIwPtjW.cnSuk4gXLJOY9TjAWB3HIzAZXP5Lvd.',NULL,NULL,NULL,0,0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `UzytkownikProgramu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wejscie`
--

DROP TABLE IF EXISTS `Wejscie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wejscie` (
  `idKontroler` int(11) NOT NULL,
  `numer` tinyint(1) NOT NULL,
  `trybPracy` smallint(6) NOT NULL DEFAULT '0',
  `typ` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'TRUE - NC, FALSE - NO',
  `czulosc` int(11) NOT NULL DEFAULT '50' COMMENT 'w milisekundach',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKontroler`,`numer`),
  UNIQUE KEY `uq_wejscie_numer` (`idKontroler`,`numer`),
  KEY `fk_kontroler_wejscie` (`idKontroler`),
  KEY `fk_controller_input_modify` (`modifyUser`),
  CONSTRAINT `fk_controller_input_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_kontroler_wejscie` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wejscie`
--

LOCK TABLES `Wejscie` WRITE;
/*!40000 ALTER TABLE `Wejscie` DISABLE KEYS */;
INSERT INTO `Wejscie` VALUES (1,1,1,0,50,0,NULL,NULL,0),(1,2,2,0,50,0,NULL,NULL,0),(1,3,3,0,50,0,NULL,NULL,0),(1,4,0,1,50,0,NULL,NULL,0),(1,5,0,1,50,0,NULL,NULL,0),(3,1,1,0,50,0,NULL,NULL,0),(3,2,2,0,50,0,NULL,NULL,0),(3,3,3,0,50,0,NULL,NULL,0),(3,4,0,1,50,0,NULL,NULL,0),(3,5,0,1,50,0,NULL,NULL,0),(4,1,1,0,50,0,NULL,NULL,0),(4,2,2,0,50,0,NULL,NULL,0),(4,3,3,0,50,0,NULL,NULL,0),(4,4,0,1,50,0,NULL,NULL,0),(4,5,4,0,50,0,NULL,NULL,0),(5,1,1,0,50,0,NULL,NULL,0),(5,2,2,0,50,0,NULL,NULL,0),(5,3,3,0,50,0,NULL,NULL,0),(5,4,1,0,50,0,NULL,NULL,0),(5,5,4,1,50,0,NULL,NULL,0),(6,1,0,0,50,0,NULL,NULL,0),(6,2,2,0,50,0,NULL,NULL,0),(6,3,3,0,50,0,NULL,NULL,0),(6,4,1,0,50,0,NULL,NULL,0),(6,5,4,1,50,0,NULL,NULL,0),(7,1,1,0,50,0,NULL,NULL,0),(7,2,2,0,50,0,NULL,NULL,0),(7,3,3,0,50,0,NULL,NULL,0),(7,4,0,1,50,0,NULL,NULL,0),(7,5,0,1,50,0,NULL,NULL,0),(8,1,1,0,50,0,NULL,NULL,0),(8,2,2,0,50,0,NULL,NULL,0),(8,3,3,0,50,0,NULL,NULL,0),(8,4,0,1,50,0,NULL,NULL,0),(8,5,0,1,50,0,NULL,NULL,0),(9,1,1,0,50,0,NULL,NULL,0),(9,2,2,0,50,0,NULL,NULL,0),(9,3,3,0,50,0,NULL,NULL,0),(9,4,0,1,50,0,NULL,NULL,0),(9,5,0,1,50,0,NULL,NULL,0),(10,1,1,0,50,0,NULL,NULL,0),(10,2,2,0,50,0,NULL,NULL,0),(10,3,3,0,50,0,NULL,NULL,0),(10,4,0,1,50,0,NULL,NULL,0),(10,5,0,1,50,0,NULL,NULL,0),(11,1,1,0,50,0,NULL,NULL,0),(11,2,2,0,50,0,NULL,NULL,0),(11,3,3,0,50,0,NULL,NULL,0),(11,4,0,1,50,0,NULL,NULL,0),(11,5,0,1,50,0,NULL,NULL,0),(12,1,1,0,50,0,NULL,NULL,0),(12,2,2,0,50,0,NULL,NULL,0),(12,3,3,0,50,0,NULL,NULL,0),(12,4,0,1,50,0,NULL,NULL,0),(12,5,0,1,50,0,NULL,NULL,0),(13,1,1,0,50,0,NULL,NULL,0),(13,2,2,0,50,0,NULL,NULL,0),(13,3,3,0,50,0,NULL,NULL,0),(13,4,0,1,50,0,NULL,NULL,0),(13,5,0,1,50,0,NULL,NULL,0);
/*!40000 ALTER TABLE `Wejscie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WejscieCentralaNT`
--

DROP TABLE IF EXISTS `WejscieCentralaNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WejscieCentralaNT` (
  `idWejscia` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `nazwa` varchar(32) DEFAULT NULL,
  `numerWejscia` int(11) NOT NULL,
  `typLinii` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0(NO), 1(NC)',
  `czulosc` int(11) unsigned NOT NULL DEFAULT '320' COMMENT 'w milisekundach',
  `typReakcji` tinyint(3) unsigned DEFAULT NULL,
  `zaleznosci` binary(33) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'bity mowioace o zaleznoscach z 264 we/wy',
  `opcjeTypuLinii` int(11) DEFAULT NULL,
  `opcjeTypuReakcji` int(11) DEFAULT NULL,
  `idStrefy` int(11) DEFAULT NULL,
  `aktywne` tinyint(1) NOT NULL DEFAULT '1',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idWejscia`),
  UNIQUE KEY `wejscieCentrali_UNIQUE` (`idCentralaNT`,`numerWejscia`),
  KEY `fk_wejscieCentrali_modify` (`modifyUser`),
  KEY `fk_wejscieCentrali_strefa` (`idStrefy`),
  CONSTRAINT `fk_wejscieCentrali_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_wejscieCentrali_strefa` FOREIGN KEY (`idStrefy`) REFERENCES `Strefa` (`idStrefa`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_wejscie_centrali` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WejscieCentralaNT`
--

LOCK TABLES `WejscieCentralaNT` WRITE;
/*!40000 ALTER TABLE `WejscieCentralaNT` DISABLE KEYS */;
INSERT INTO `WejscieCentralaNT` VALUES (1,1,'Terminal Wjazdowy',0,3,320,6,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,6,NULL,1,NULL,NULL,0),(2,1,'Terminal Wyjazdowy',1,3,320,6,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,7,NULL,1,NULL,NULL,0),(3,1,'POZAR',2,1,320,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,NULL,1,NULL,NULL,0);
/*!40000 ALTER TABLE `WejscieCentralaNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `WidokGlobalStatus`
--

DROP TABLE IF EXISTS `WidokGlobalStatus`;
/*!50001 DROP VIEW IF EXISTS `WidokGlobalStatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokGlobalStatus` (
  `commitInProgress` tinyint NOT NULL,
  `backupInProgress` tinyint NOT NULL,
  `lockedBy` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokGrupowyRozszerzonyStanuKontrolera`
--

DROP TABLE IF EXISTS `WidokGrupowyRozszerzonyStanuKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokGrupowyRozszerzonyStanuKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokGrupowyRozszerzonyStanuKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `stanKontrolera` tinyint NOT NULL,
  `stanKontroleraNP` tinyint NOT NULL,
  `stanZasilania` tinyint NOT NULL,
  `stanZasilaniaNP` tinyint NOT NULL,
  `stanTerminali` tinyint NOT NULL,
  `stanTerminaliNP` tinyint NOT NULL,
  `stanPrzejscia` tinyint NOT NULL,
  `stanPrzejsciaNP` tinyint NOT NULL,
  `stanPrzejsciaDOD` tinyint NOT NULL,
  `stanPrzejsciaDODNP` tinyint NOT NULL,
  `drzwiOtwarte` tinyint NOT NULL,
  `stanDrzwi` tinyint NOT NULL,
  `stanGlobalny` tinyint NOT NULL,
  `stanGlobalnyNP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokGrupowyStanuKontrolera`
--

DROP TABLE IF EXISTS `WidokGrupowyStanuKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokGrupowyStanuKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokGrupowyStanuKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `stanKontrolera` tinyint NOT NULL,
  `stanKontroleraNP` tinyint NOT NULL,
  `stanZasilania` tinyint NOT NULL,
  `stanZasilaniaNP` tinyint NOT NULL,
  `stanTerminali` tinyint NOT NULL,
  `stanTerminaliNP` tinyint NOT NULL,
  `stanPrzejscia` tinyint NOT NULL,
  `stanPrzejsciaNP` tinyint NOT NULL,
  `stanPrzejsciaDOD` tinyint NOT NULL,
  `stanPrzejsciaDODNP` tinyint NOT NULL,
  `drzwiOtwarte` tinyint NOT NULL,
  `stanDrzwi` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTAwarie`
--

DROP TABLE IF EXISTS `WidokINTAwarie`;
/*!50001 DROP VIEW IF EXISTS `WidokINTAwarie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTAwarie` (
  `idx` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `tekst` tinyint NOT NULL,
  `opis` tinyint NOT NULL,
  `pamiec` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTEkspandery`
--

DROP TABLE IF EXISTS `WidokINTEkspandery`;
/*!50001 DROP VIEW IF EXISTS `WidokINTEkspandery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTEkspandery` (
  `id` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `wlaczony` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `nazwa` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTOpisZdarzenia`
--

DROP TABLE IF EXISTS `WidokINTOpisZdarzenia`;
/*!50001 DROP VIEW IF EXISTS `WidokINTOpisZdarzenia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTOpisZdarzenia` (
  `id` tinyint NOT NULL,
  `jezyk` tinyint NOT NULL,
  `opis_dlugi` tinyint NOT NULL,
  `kod` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `typ2` tinyint NOT NULL,
  `tekst` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTStrefy`
--

DROP TABLE IF EXISTS `WidokINTStrefy`;
/*!50001 DROP VIEW IF EXISTS `WidokINTStrefy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTStrefy` (
  `idStrefyIntegra` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `idPartycjiIntegry` tinyint NOT NULL,
  `wlaczony` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `nazwa` tinyint NOT NULL,
  `stan` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTUzytkownicy`
--

DROP TABLE IF EXISTS `WidokINTUzytkownicy`;
/*!50001 DROP VIEW IF EXISTS `WidokINTUzytkownicy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTUzytkownicy` (
  `numer` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `wlaczony` tinyint NOT NULL,
  `nazwa` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTWejscia`
--

DROP TABLE IF EXISTS `WidokINTWejscia`;
/*!50001 DROP VIEW IF EXISTS `WidokINTWejscia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTWejscia` (
  `idWejscia` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `stan` tinyint NOT NULL,
  `idStrefyIntegra` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `wlaczony` tinyint NOT NULL,
  `nazwa` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTWyjscia`
--

DROP TABLE IF EXISTS `WidokINTWyjscia`;
/*!50001 DROP VIEW IF EXISTS `WidokINTWyjscia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTWyjscia` (
  `idWyjscia` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `stan` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `wlaczony` tinyint NOT NULL,
  `nazwa` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokINTZdarzenie`
--

DROP TABLE IF EXISTS `WidokINTZdarzenie`;
/*!50001 DROP VIEW IF EXISTS `WidokINTZdarzenie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokINTZdarzenie` (
  `Id` tinyint NOT NULL,
  `idObiekt` tinyint NOT NULL,
  `idCentrala` tinyint NOT NULL,
  `idEthm` tinyint NOT NULL,
  `nazwaObiektu` tinyint NOT NULL,
  `nazwaCentrali` tinyint NOT NULL,
  `nazwaEthm` tinyint NOT NULL,
  `indexIntegra` tinyint NOT NULL,
  `czas` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `kod` tinyint NOT NULL,
  `typA` tinyint NOT NULL,
  `numerA` tinyint NOT NULL,
  `tekstA` tinyint NOT NULL,
  `typB` tinyint NOT NULL,
  `numerB` tinyint NOT NULL,
  `tekstB` tinyint NOT NULL,
  `stacja1` tinyint NOT NULL,
  `stacja2` tinyint NOT NULL,
  `bytes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStanowWejscKontrolera`
--

DROP TABLE IF EXISTS `WidokStanowWejscKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokStanowWejscKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStanowWejscKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `stanWejsc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStanowWyjscKontrolera`
--

DROP TABLE IF EXISTS `WidokStanowWyjscKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokStanowWyjscKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStanowWyjscKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `stanWyjsc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStanuKontroleraNaMapie`
--

DROP TABLE IF EXISTS `WidokStanuKontroleraNaMapie`;
/*!50001 DROP VIEW IF EXISTS `WidokStanuKontroleraNaMapie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStanuKontroleraNaMapie` (
  `idMapa` tinyint NOT NULL,
  `idKontroler` tinyint NOT NULL,
  `stanKontrolera` tinyint NOT NULL,
  `stanKontroleraNP` tinyint NOT NULL,
  `buforZdarzenZapelniony50` tinyint NOT NULL,
  `buforZdarzenZapelniony90` tinyint NOT NULL,
  `stanZasilania` tinyint NOT NULL,
  `stanZasilaniaNP` tinyint NOT NULL,
  `stanTerminali` tinyint NOT NULL,
  `stanTerminaliNP` tinyint NOT NULL,
  `stanPrzejscia` tinyint NOT NULL,
  `stanPrzejsciaNP` tinyint NOT NULL,
  `stanPrzejsciaDOD` tinyint NOT NULL,
  `stanPrzejsciaDODNP` tinyint NOT NULL,
  `drzwiOtwarte` tinyint NOT NULL,
  `stanDrzwi` tinyint NOT NULL,
  `stanGlobalny` tinyint NOT NULL,
  `stanGlobalnyNP` tinyint NOT NULL,
  `statusPrzekaznika` tinyint NOT NULL,
  `sabotazModulu` tinyint NOT NULL,
  `awariaZegara` tinyint NOT NULL,
  `awariaZasilaniaAC` tinyint NOT NULL,
  `rozladowanyAkumulator` tinyint NOT NULL,
  `brakAkumulatora` tinyint NOT NULL,
  `probaSkanowania` tinyint NOT NULL,
  `brakEkspanderaA` tinyint NOT NULL,
  `brakEkspanderaB` tinyint NOT NULL,
  `sabotazEkspanderaA` tinyint NOT NULL,
  `sabotazEkspanderaB` tinyint NOT NULL,
  `trybEdycjiDanych` tinyint NOT NULL,
  `otwarteDrzwi` tinyint NOT NULL,
  `dlugoOtwarteDrzwi` tinyint NOT NULL,
  `przejscieOdblokowane` tinyint NOT NULL,
  `przejscieZblokowane` tinyint NOT NULL,
  `wejscieSilowe` tinyint NOT NULL,
  `stanWejsc` tinyint NOT NULL,
  `stanWyjsc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStanuMapy`
--

DROP TABLE IF EXISTS `WidokStanuMapy`;
/*!50001 DROP VIEW IF EXISTS `WidokStanuMapy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStanuMapy` (
  `idMapa` tinyint NOT NULL,
  `stanGlobalny` tinyint NOT NULL,
  `stanGlobalnyNP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusCentraliNT`
--

DROP TABLE IF EXISTS `WidokStatusCentraliNT`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusCentraliNT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusCentraliNT` (
  `idCentraliNT` tinyint NOT NULL,
  `online` tinyint NOT NULL,
  `faultSD` tinyint NOT NULL,
  `faultAUX` tinyint NOT NULL,
  `faultEX` tinyint NOT NULL,
  `faultPrzeciazenie` tinyint NOT NULL,
  `faultAC` tinyint NOT NULL,
  `faultBrakAku` tinyint NOT NULL,
  `faultSlabyAku` tinyint NOT NULL,
  `pradZasilacza` tinyint NOT NULL,
  `napiecieZasilacza` tinyint NOT NULL,
  `outputsState` tinyint NOT NULL,
  `inputsState` tinyint NOT NULL,
  `kodStatusu` tinyint NOT NULL,
  `progress` tinyint NOT NULL,
  `adresIP` tinyint NOT NULL,
  `wersja` tinyint NOT NULL,
  `dataWersji` tinyint NOT NULL,
  `opisWersji` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `nieobslugiwanaWersja` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusEkspanderow`
--

DROP TABLE IF EXISTS `WidokStatusEkspanderow`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusEkspanderow`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusEkspanderow` (
  `idKontroler` tinyint NOT NULL,
  `probaSkanowania` tinyint NOT NULL,
  `brakEkspanderaA` tinyint NOT NULL,
  `brakEkspanderaB` tinyint NOT NULL,
  `sabotazEkspanderaA` tinyint NOT NULL,
  `sabotazEkspanderaB` tinyint NOT NULL,
  `trybEdycjiDanych` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusEthm`
--

DROP TABLE IF EXISTS `WidokStatusEthm`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusEthm`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusEthm` (
  `idEthm` tinyint NOT NULL,
  `polaczenie` tinyint NOT NULL,
  `kluczKodowania` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusKontrolera`
--

DROP TABLE IF EXISTS `WidokStatusKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `napiecieZasilania` tinyint NOT NULL,
  `sabotazModulu` tinyint NOT NULL,
  `awariaZegara` tinyint NOT NULL,
  `buforZdarzenZapelniony50` tinyint NOT NULL,
  `buforZdarzenZapelniony90` tinyint NOT NULL,
  `awariaZasilaniaAC` tinyint NOT NULL,
  `rozladowanyAkumulator` tinyint NOT NULL,
  `brakAkumulatora` tinyint NOT NULL,
  `statusPrzekaznika` tinyint NOT NULL,
  `jakoscKomunikacji` tinyint NOT NULL,
  `dataKompilacji` tinyint NOT NULL,
  `wersja` tinyint NOT NULL,
  `jezyk` tinyint NOT NULL,
  `numerSieci` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusOpcjeDostepu`
--

DROP TABLE IF EXISTS `WidokStatusOpcjeDostepu`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusOpcjeDostepu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusOpcjeDostepu` (
  `idUzytkownik` tinyint NOT NULL,
  `idStrefa` tinyint NOT NULL,
  `wykorzystanyLimit` tinyint NOT NULL,
  `resetujLimit` tinyint NOT NULL,
  `resetujAntypassback` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusPrzejscia`
--

DROP TABLE IF EXISTS `WidokStatusPrzejscia`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusPrzejscia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusPrzejscia` (
  `idPrzejscie` tinyint NOT NULL,
  `otwarteDrzwi` tinyint NOT NULL,
  `dlugoOtwarteDrzwi` tinyint NOT NULL,
  `przejscieOdblokowane` tinyint NOT NULL,
  `przejscieZblokowane` tinyint NOT NULL,
  `wejscieSilowe` tinyint NOT NULL,
  `zablokowanieAlarmowe` tinyint NOT NULL,
  `odblokowaniePozarowe` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusStrefa`
--

DROP TABLE IF EXISTS `WidokStatusStrefa`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusStrefa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusStrefa` (
  `idStrefa` tinyint NOT NULL,
  `stan` tinyint NOT NULL,
  `liczbaOsobWStrefie` tinyint NOT NULL,
  `resetujLicznik` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusUzytkownik`
--

DROP TABLE IF EXISTS `WidokStatusUzytkownik`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusUzytkownik`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusUzytkownik` (
  `idUzytkownik` tinyint NOT NULL,
  `aktualnaStrefa` tinyint NOT NULL,
  `indexWSciezce` tinyint NOT NULL,
  `resetujIndexWSciezce` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusWejscia`
--

DROP TABLE IF EXISTS `WidokStatusWejscia`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusWejscia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusWejscia` (
  `idKontroler` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokStatusWyjscia`
--

DROP TABLE IF EXISTS `WidokStatusWyjscia`;
/*!50001 DROP VIEW IF EXISTS `WidokStatusWyjscia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokStatusWyjscia` (
  `idKontroler` tinyint NOT NULL,
  `numer` tinyint NOT NULL,
  `wyjscieZalaczone` tinyint NOT NULL,
  `modifyTime` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokSzczegolowyStanuKontrolera`
--

DROP TABLE IF EXISTS `WidokSzczegolowyStanuKontrolera`;
/*!50001 DROP VIEW IF EXISTS `WidokSzczegolowyStanuKontrolera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokSzczegolowyStanuKontrolera` (
  `idKontroler` tinyint NOT NULL,
  `sabotazModulu` tinyint NOT NULL,
  `awariaZegara` tinyint NOT NULL,
  `buforZdarzenZapelniony50` tinyint NOT NULL,
  `buforZdarzenZapelniony90` tinyint NOT NULL,
  `awariaZasilaniaAC` tinyint NOT NULL,
  `rozladowanyAkumulator` tinyint NOT NULL,
  `brakAkumulatora` tinyint NOT NULL,
  `statusPrzekaznika` tinyint NOT NULL,
  `probaSkanowania` tinyint NOT NULL,
  `brakEkspanderaA` tinyint NOT NULL,
  `brakEkspanderaB` tinyint NOT NULL,
  `sabotazEkspanderaA` tinyint NOT NULL,
  `sabotazEkspanderaB` tinyint NOT NULL,
  `trybEdycjiDanych` tinyint NOT NULL,
  `otwarteDrzwi` tinyint NOT NULL,
  `dlugoOtwarteDrzwi` tinyint NOT NULL,
  `przejscieOdblokowane` tinyint NOT NULL,
  `przejscieZblokowane` tinyint NOT NULL,
  `wejscieSilowe` tinyint NOT NULL,
  `stanWejsc` tinyint NOT NULL,
  `stanWyjsc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WidokUstawienia`
--

DROP TABLE IF EXISTS `WidokUstawienia`;
/*!50001 DROP VIEW IF EXISTS `WidokUstawienia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WidokUstawienia` (
  `id` tinyint NOT NULL,
  `klucz` tinyint NOT NULL,
  `wartosc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Wyjscie`
--

DROP TABLE IF EXISTS `Wyjscie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wyjscie` (
  `idKontroler` int(11) NOT NULL,
  `numer` tinyint(1) NOT NULL,
  `statusDrzwi` tinyint(1) NOT NULL DEFAULT '0',
  `otwarcieDrzwi` tinyint(1) NOT NULL DEFAULT '0',
  `sygnalDzwonka` tinyint(1) NOT NULL DEFAULT '0',
  `wejscieSilowe` tinyint(1) NOT NULL DEFAULT '0',
  `dlugoOtwarteDrzwi` tinyint(1) NOT NULL DEFAULT '0',
  `brakObecnosciTerminala` tinyint(1) NOT NULL DEFAULT '0',
  `awariaZasilaniaAC` tinyint(1) NOT NULL DEFAULT '0',
  `rozladowanyAkumulator` tinyint(1) NOT NULL DEFAULT '0',
  `sabotaz` tinyint(1) NOT NULL DEFAULT '0',
  `sygnalizacjaSkanowania` tinyint(1) NOT NULL DEFAULT '0',
  `dostepCzytnikiemA` tinyint(1) NOT NULL DEFAULT '0',
  `dostepCzytnikiemB` tinyint(1) NOT NULL DEFAULT '0',
  `czasDzialania` int(8) NOT NULL DEFAULT '10',
  `czasDzialaniaJednostka` tinyint(1) NOT NULL DEFAULT '0',
  `odwroconaPolaryzacja` tinyint(1) NOT NULL DEFAULT '0',
  `wyjscieZalaczone` tinyint(1) NOT NULL DEFAULT '0',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKontroler`,`numer`),
  UNIQUE KEY `uq_wyjscie_numer` (`idKontroler`,`numer`),
  KEY `fk_kontroler_wyjscie` (`idKontroler`),
  KEY `fk_controller_output_modify` (`modifyUser`),
  CONSTRAINT `fk_controller_output_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_kontroler_wyjscie` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wyjscie`
--

LOCK TABLES `Wyjscie` WRITE;
/*!40000 ALTER TABLE `Wyjscie` DISABLE KEYS */;
INSERT INTO `Wyjscie` VALUES (1,1,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(1,2,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(3,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(3,2,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(4,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,NULL,NULL,0),(4,2,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,NULL,NULL,0),(5,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,NULL,NULL,0),(5,2,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(6,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,NULL,NULL,0),(6,2,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(7,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(7,2,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(8,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(8,2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,NULL,NULL,0),(9,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(9,2,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,NULL,NULL,0),(10,1,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(10,2,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(11,1,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(11,2,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(12,1,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(12,2,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(13,1,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0),(13,2,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `Wyjscie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`accoweb`@`%`*/ /*!50003 TRIGGER `Wyjscie_BeforeUpdate` BEFORE UPDATE ON `Wyjscie`
FOR EACH ROW BEGIN
  IF NEW.statusDrzwi IS NOT NULL AND NEW.statusDrzwi=TRUE THEN
    SET NEW.otwarcieDrzwi=FALSE;
    SET NEW.sygnalDzwonka=FALSE;
    SET NEW.wejscieSilowe=FALSE;
    SET NEW.dlugoOtwarteDrzwi=FALSE;
    SET NEW.brakObecnosciTerminala=FALSE;
    SET NEW.sygnalizacjaSkanowania=FALSE;
    SET NEW.awariaZasilaniaAC=FALSE;
    SET NEW.rozladowanyAkumulator=FALSE;
    SET NEW.sabotaz=FALSE;
  ELSEIF NEW.otwarcieDrzwi IS NOT NULL AND NEW.otwarcieDrzwi=TRUE OR
          NEW.sygnalDzwonka IS NOT NULL AND NEW.sygnalDzwonka=TRUE THEN
    SET NEW.statusDrzwi=FALSE;
    SET NEW.wejscieSilowe=FALSE;
    SET NEW.dlugoOtwarteDrzwi=FALSE;
    SET NEW.brakObecnosciTerminala=FALSE;
    SET NEW.sygnalizacjaSkanowania=FALSE;
    SET NEW.awariaZasilaniaAC=FALSE;
    SET NEW.rozladowanyAkumulator=FALSE;
    SET NEW.sabotaz=FALSE;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `WyjscieCentralaNT`
--

DROP TABLE IF EXISTS `WyjscieCentralaNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WyjscieCentralaNT` (
  `idWyjscia` int(11) NOT NULL AUTO_INCREMENT,
  `idCentralaNT` int(11) NOT NULL,
  `nazwa` varchar(32) DEFAULT NULL,
  `numerWyjscia` int(11) NOT NULL,
  `polaryzacja` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0(normalna),1(odwrocona)',
  `czasDzialania` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-128',
  `jednostka` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0(sekundy),1(minuty)',
  `typReakcji` tinyint(3) unsigned DEFAULT '0',
  `zaleznosci` binary(33) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'bity mowioace o zaleznoscach z 264 we/wy',
  `aktywne` tinyint(1) NOT NULL DEFAULT '1',
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idWyjscia`),
  UNIQUE KEY `wyjscieCentrali_UNIQUE` (`idCentralaNT`,`numerWyjscia`),
  KEY `fk_wyjscieCentrali_modify` (`modifyUser`),
  CONSTRAINT `fk_wyjscieCentrali_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_wyjscie_centrali` FOREIGN KEY (`idCentralaNT`) REFERENCES `CentralaNT` (`idCentralaNT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WyjscieCentralaNT`
--

LOCK TABLES `WyjscieCentralaNT` WRITE;
/*!40000 ALTER TABLE `WyjscieCentralaNT` DISABLE KEYS */;
INSERT INTO `WyjscieCentralaNT` VALUES (1,1,'Termianl Wjazdowy',0,0,1,0,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,NULL,NULL,0),(2,1,'Termianl Wyjazdowy',1,0,1,0,5,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,NULL,NULL,0);
/*!40000 ALTER TABLE `WyjscieCentralaNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WyjscieWskaznikKontrolera`
--

DROP TABLE IF EXISTS `WyjscieWskaznikKontrolera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WyjscieWskaznikKontrolera` (
  `idWyjscie` int(11) NOT NULL,
  `idKontroler` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idWyjscie`,`idKontroler`),
  KEY `fk_wyjscie_wskaznik_kontroler` (`idKontroler`),
  CONSTRAINT `fk_wyjscie_wskaznik_kontroler` FOREIGN KEY (`idKontroler`) REFERENCES `Kontroler` (`idKontroler`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wyjscie_wskaznik_kontroler_wyjscie` FOREIGN KEY (`idWyjscie`) REFERENCES `WyjscieCentralaNT` (`idWyjscia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WyjscieWskaznikKontrolera`
--

LOCK TABLES `WyjscieWskaznikKontrolera` WRITE;
/*!40000 ALTER TABLE `WyjscieWskaznikKontrolera` DISABLE KEYS */;
/*!40000 ALTER TABLE `WyjscieWskaznikKontrolera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WyjscieWskaznikStrefy`
--

DROP TABLE IF EXISTS `WyjscieWskaznikStrefy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WyjscieWskaznikStrefy` (
  `idWyjscie` int(11) NOT NULL,
  `idStrefa` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idWyjscie`,`idStrefa`),
  KEY `fk_wyjscie_wskaznik_strefa` (`idStrefa`),
  CONSTRAINT `fk_wyjscie_wskaznik_strefa` FOREIGN KEY (`idStrefa`) REFERENCES `Strefa` (`idStrefa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wyjscie_wskaznik_wyjscie` FOREIGN KEY (`idWyjscie`) REFERENCES `WyjscieCentralaNT` (`idWyjscia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WyjscieWskaznikStrefy`
--

LOCK TABLES `WyjscieWskaznikStrefy` WRITE;
/*!40000 ALTER TABLE `WyjscieWskaznikStrefy` DISABLE KEYS */;
/*!40000 ALTER TABLE `WyjscieWskaznikStrefy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Zdarzenie`
--

DROP TABLE IF EXISTS `Zdarzenie`;
/*!50001 DROP VIEW IF EXISTS `Zdarzenie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Zdarzenie` (
  `id` tinyint NOT NULL,
  `idObiekt` tinyint NOT NULL,
  `idCentrala` tinyint NOT NULL,
  `idStrefaWejsciowa` tinyint NOT NULL,
  `idStrefaWyjsciowa` tinyint NOT NULL,
  `idKontroler` tinyint NOT NULL,
  `idUzytkownik` tinyint NOT NULL,
  `numerWejscieCentrali` tinyint NOT NULL,
  `numerWyjscieCentrali` tinyint NOT NULL,
  `adresEkspandera` tinyint NOT NULL,
  `nazwaObiektu` tinyint NOT NULL,
  `nazwaCentrali` tinyint NOT NULL,
  `nazwaStrefyWejsciowej` tinyint NOT NULL,
  `nazwaStrefyWyjsciowej` tinyint NOT NULL,
  `nazwaKontrolera` tinyint NOT NULL,
  `nazwaUzytkownika` tinyint NOT NULL,
  `nazwaWejsciaCentrali` tinyint NOT NULL,
  `nazwaWyjsciaCentrali` tinyint NOT NULL,
  `numerSeryjnyPilota` tinyint NOT NULL,
  `nazwaEkspandera` tinyint NOT NULL,
  `czasZdarzenia` tinyint NOT NULL,
  `kodZdarzenia` tinyint NOT NULL,
  `adresKontrolera` tinyint NOT NULL,
  `szczegoly` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `access2accont_output`
--

DROP TABLE IF EXISTS `access2accont_output`;
/*!50001 DROP VIEW IF EXISTS `access2accont_output`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `access2accont_output` (
  `user_id` tinyint NOT NULL,
  `group_id` tinyint NOT NULL,
  `accont_output_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event_manual_entry`
--

DROP TABLE IF EXISTS `event_manual_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_manual_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entry_zone_id` int(11) DEFAULT NULL,
  `leave_zone_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `code` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code_idx` (`code`),
  KEY `user_idx` (`user_id`),
  KEY `date_idx` (`date`),
  KEY `user_date_code_idx` (`date`,`code`,`user_id`),
  KEY `fk_event_manual_entry_modify_user` (`modifyUser`),
  KEY `fk_event_manual_entry_created_by` (`created_by`),
  CONSTRAINT `fk_event_manual_entry_created_by` FOREIGN KEY (`created_by`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_manual_entry_modify_user` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_manual_entry_user` FOREIGN KEY (`user_id`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_manual_entry`
--

LOCK TABLES `event_manual_entry` WRITE;
/*!40000 ALTER TABLE `event_manual_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_manual_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_accont_output`
--

DROP TABLE IF EXISTS `group_accont_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_accont_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `accont_output_id` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_group_group_output` (`group_id`),
  KEY `fk_output_group_output` (`accont_output_id`),
  KEY `fk_group_accont_output_modify` (`modifyUser`),
  KEY `uk_group_accont_output` (`group_id`,`accont_output_id`),
  CONSTRAINT `fk_group_accont_output_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_group_output` FOREIGN KEY (`group_id`) REFERENCES `GrupaUzytkownikow` (`idGrupaUzytkownikow`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_output_group_output` FOREIGN KEY (`accont_output_id`) REFERENCES `WyjscieCentralaNT` (`idWyjscia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_accont_output`
--

LOCK TABLES `group_accont_output` WRITE;
/*!40000 ALTER TABLE `group_accont_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_accont_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kalendarz`
--

DROP TABLE IF EXISTS `kalendarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalendarz` (
  `idKalendarz` int(11) NOT NULL AUTO_INCREMENT,
  `nazwaKalendarza` varchar(255) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKalendarz`),
  KEY `fk_Kalendarz2_modify` (`modifyUser`),
  CONSTRAINT `fk_Kalendarz2_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalendarz`
--

LOCK TABLES `kalendarz` WRITE;
/*!40000 ALTER TABLE `kalendarz` DISABLE KEYS */;
INSERT INTO `kalendarz` VALUES (1,'DENY',NULL,NULL,0),(3,'Kalendarz Hala Parking',NULL,NULL,0),(4,'Kalendarz Hala Wejscie',NULL,NULL,0);
/*!40000 ALTER TABLE `kalendarz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` text,
  `modifyTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'slr',NULL,NULL);
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tygodniekalendarza`
--

DROP TABLE IF EXISTS `tygodniekalendarza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tygodniekalendarza` (
  `idKalendarz` int(11) NOT NULL,
  `nrTygodnia` int(11) NOT NULL,
  `idSchematTygodniowy` int(11) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idKalendarz`,`nrTygodnia`),
  UNIQUE KEY `uniquetygodni2` (`idKalendarz`,`nrTygodnia`),
  KEY `fk_idKalendarz` (`idKalendarz`),
  KEY `fk_kalendarzidSchematTygodniowy` (`idSchematTygodniowy`),
  KEY `fk_TygodnieKalendarza_modify` (`modifyUser`),
  CONSTRAINT `fk_kalendarzschemattygodnie` FOREIGN KEY (`idSchematTygodniowy`) REFERENCES `SchematTygodniowy` (`idSchematTygodniowy`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_kalendarztygodnie` FOREIGN KEY (`idKalendarz`) REFERENCES `kalendarz` (`idKalendarz`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TygodnieKalendarza_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tygodniekalendarza`
--

LOCK TABLES `tygodniekalendarza` WRITE;
/*!40000 ALTER TABLE `tygodniekalendarza` DISABLE KEYS */;
INSERT INTO `tygodniekalendarza` VALUES (3,1,3,NULL,NULL,0),(3,2,3,NULL,NULL,0),(3,3,3,NULL,NULL,0),(3,4,3,NULL,NULL,0),(3,5,3,NULL,NULL,0),(3,6,3,NULL,NULL,0),(3,7,3,NULL,NULL,0),(3,8,3,NULL,NULL,0),(3,9,3,NULL,NULL,0),(3,10,3,NULL,NULL,0),(3,11,3,NULL,NULL,0),(3,12,3,NULL,NULL,0),(3,13,3,NULL,NULL,0),(3,14,3,NULL,NULL,0),(3,15,3,NULL,NULL,0),(3,16,3,NULL,NULL,0),(3,17,3,NULL,NULL,0),(3,18,3,NULL,NULL,0),(3,19,3,NULL,NULL,0),(3,20,3,NULL,NULL,0),(3,21,3,NULL,NULL,0),(3,22,3,NULL,NULL,0),(3,23,3,NULL,NULL,0),(3,24,3,NULL,NULL,0),(3,25,3,NULL,NULL,0),(3,26,3,NULL,NULL,0),(3,27,3,NULL,NULL,0),(3,28,3,NULL,NULL,0),(3,29,3,NULL,NULL,0),(3,30,3,NULL,NULL,0),(3,31,3,NULL,NULL,0),(3,32,3,NULL,NULL,0),(3,33,3,NULL,NULL,0),(3,34,3,NULL,NULL,0),(3,35,3,NULL,NULL,0),(3,36,3,NULL,NULL,0),(3,37,3,NULL,NULL,0),(3,38,3,NULL,NULL,0),(3,39,3,NULL,NULL,0),(3,40,3,NULL,NULL,0),(3,41,3,NULL,NULL,0),(3,42,3,NULL,NULL,0),(3,43,3,NULL,NULL,0),(3,44,3,NULL,NULL,0),(3,45,3,NULL,NULL,0),(3,46,3,NULL,NULL,0),(3,47,3,NULL,NULL,0),(3,48,3,NULL,NULL,0),(3,49,3,NULL,NULL,0),(3,50,3,NULL,NULL,0),(3,51,3,NULL,NULL,0),(3,52,3,NULL,NULL,0),(4,1,2,NULL,NULL,0),(4,2,2,NULL,NULL,0),(4,3,2,NULL,NULL,0),(4,4,2,NULL,NULL,0),(4,5,2,NULL,NULL,0),(4,6,2,NULL,NULL,0),(4,7,2,NULL,NULL,0),(4,8,2,NULL,NULL,0),(4,9,2,NULL,NULL,0),(4,10,2,NULL,NULL,0),(4,11,2,NULL,NULL,0),(4,12,2,NULL,NULL,0),(4,13,2,NULL,NULL,0),(4,14,2,NULL,NULL,0),(4,15,2,NULL,NULL,0),(4,16,2,NULL,NULL,0),(4,17,2,NULL,NULL,0),(4,18,2,NULL,NULL,0),(4,19,2,NULL,NULL,0),(4,20,2,NULL,NULL,0),(4,21,2,NULL,NULL,0),(4,22,2,NULL,NULL,0),(4,23,2,NULL,NULL,0),(4,24,2,NULL,NULL,0),(4,25,2,NULL,NULL,0),(4,26,2,NULL,NULL,0),(4,27,2,NULL,NULL,0),(4,28,2,NULL,NULL,0),(4,29,2,NULL,NULL,0),(4,30,2,NULL,NULL,0),(4,31,2,NULL,NULL,0),(4,32,2,NULL,NULL,0),(4,33,2,NULL,NULL,0),(4,34,2,NULL,NULL,0),(4,35,2,NULL,NULL,0),(4,36,2,NULL,NULL,0),(4,37,2,NULL,NULL,0),(4,38,2,NULL,NULL,0),(4,39,2,NULL,NULL,0),(4,40,2,NULL,NULL,0),(4,41,2,NULL,NULL,0),(4,42,2,NULL,NULL,0),(4,43,2,NULL,NULL,0),(4,44,2,NULL,NULL,0),(4,45,2,NULL,NULL,0),(4,46,2,NULL,NULL,0),(4,47,2,NULL,NULL,0),(4,48,2,NULL,NULL,0),(4,49,2,NULL,NULL,0),(4,50,2,NULL,NULL,0),(4,51,2,NULL,NULL,0),(4,52,2,NULL,NULL,0);
/*!40000 ALTER TABLE `tygodniekalendarza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accont_output`
--

DROP TABLE IF EXISTS `user_accont_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accont_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `accont_output_id` int(11) NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_output_user_output` (`accont_output_id`),
  KEY `fk_user_accont_output_modify` (`modifyUser`),
  KEY `uk_user_accont_output` (`user_id`,`accont_output_id`),
  CONSTRAINT `fk_output_user_output` FOREIGN KEY (`accont_output_id`) REFERENCES `WyjscieCentralaNT` (`idWyjscia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_accont_output_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_output` FOREIGN KEY (`user_id`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accont_output`
--

LOCK TABLES `user_accont_output` WRITE;
/*!40000 ALTER TABLE `user_accont_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accont_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_controller_state`
--

DROP TABLE IF EXISTS `view_controller_state`;
/*!50001 DROP VIEW IF EXISTS `view_controller_state`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_controller_state` (
  `id` tinyint NOT NULL,
  `power_supply_voltage` tinyint NOT NULL,
  `sabotage` tinyint NOT NULL,
  `clock_failure` tinyint NOT NULL,
  `event_buffer_filled_50` tinyint NOT NULL,
  `event_buffer_filled_90` tinyint NOT NULL,
  `power_failure` tinyint NOT NULL,
  `discharged_battery` tinyint NOT NULL,
  `no_battery` tinyint NOT NULL,
  `relay_status` tinyint NOT NULL,
  `quality_of_communication` tinyint NOT NULL,
  `compilation_date` tinyint NOT NULL,
  `VERSION` tinyint NOT NULL,
  `LANGUAGE` tinyint NOT NULL,
  `network_number` tinyint NOT NULL,
  `open_door` tinyint NOT NULL,
  `long_open_door` tinyint NOT NULL,
  `passage_unblock` tinyint NOT NULL,
  `passage_block` tinyint NOT NULL,
  `force_entry` tinyint NOT NULL,
  `alarm_block` tinyint NOT NULL,
  `fire_unlock` tinyint NOT NULL,
  `scanning_attempt` tinyint NOT NULL,
  `absence_of_expander_A` tinyint NOT NULL,
  `absence_of_expander_B` tinyint NOT NULL,
  `sabotage_of_expander_A` tinyint NOT NULL,
  `sabotage_of_expander_B` tinyint NOT NULL,
  `edit_mode` tinyint NOT NULL,
  `input_1` tinyint NOT NULL,
  `input2` tinyint NOT NULL,
  `input3` tinyint NOT NULL,
  `input4` tinyint NOT NULL,
  `input5` tinyint NOT NULL,
  `output1` tinyint NOT NULL,
  `output2` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_session`
--

DROP TABLE IF EXISTS `web_session`;
/*!50001 DROP VIEW IF EXISTS `web_session`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_session` (
  `id` tinyint NOT NULL,
  `expire` tinyint NOT NULL,
  `data` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_user_settings`
--

DROP TABLE IF EXISTS `web_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'setting name - language, pageSize, firstDayOfWeek ...',
  `value` varchar(255) DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_idx` (`user_id`,`name`),
  KEY `fk_user_idx` (`user_id`),
  KEY `fk_modify_user_idx` (`modifyUser`),
  CONSTRAINT `fk_web_user_settings_modify_user` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_web_user_settings_user` FOREIGN KEY (`user_id`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_user_settings`
--

LOCK TABLES `web_user_settings` WRITE;
/*!40000 ALTER TABLE `web_user_settings` DISABLE KEYS */;
INSERT INTO `web_user_settings` VALUES (1,1,'language','pl',NULL,NULL,0),(2,1,'defaultPageSize','15',NULL,NULL,0),(3,1,'sound','0',NULL,NULL,0);
/*!40000 ALTER TABLE `web_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zdjeciauzytkownikow`
--

DROP TABLE IF EXISTS `zdjeciauzytkownikow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zdjeciauzytkownikow` (
  `idUzytkownik` int(6) NOT NULL,
  `file_content` mediumblob NOT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  `modifyUser` int(11) DEFAULT NULL,
  `modifyRemoved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUzytkownik`),
  UNIQUE KEY `idUzytkownik` (`idUzytkownik`),
  KEY `fk_zdjeciauzytkownikow_modify` (`modifyUser`),
  CONSTRAINT `fk_zdjeciauzytkownikow_modify` FOREIGN KEY (`modifyUser`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `zdjeciauzytkownikow_ibfk_1` FOREIGN KEY (`idUzytkownik`) REFERENCES `Uzytkownik` (`idUzytkownik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zdjeciauzytkownikow`
--

LOCK TABLES `zdjeciauzytkownikow` WRITE;
/*!40000 ALTER TABLE `zdjeciauzytkownikow` DISABLE KEYS */;
/*!40000 ALTER TABLE `zdjeciauzytkownikow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'accoDb_temporary'
--
/*!50003 DROP FUNCTION IF EXISTS `ComparePathsUG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `ComparePathsUG`(userId INT, groupId INT) RETURNS int(11)
BEGIN
    DECLARE rv BOOLEAN DEFAULT FALSE;
    DECLARE sg,su, cg, cu INT;
    DECLARE cur_group CURSOR FOR SELECT idSciezkiPrzejsc, idCentralaNT FROM SciezkiGrup WHERE idGrupy=groupId AND modifyRemoved=FALSE;
    DECLARE cur_user CURSOR FOR  SELECT idSciezkiPrzejsc, idCentralaNT FROM SciezkiUzytkownikow WHERE idUzytkownik=userId AND modifyRemoved=FALSE;
    SET @groupExist=NULL;
    SELECT idGrupaUzytkownikow FROM GrupaUzytkownikow WHERE idGrupaUzytkownikow=groupId INTO @groupExist;
    IF @groupExist IS NOT NULL THEN
        OPEN cur_group;
        SELECT FOUND_ROWS() INTO @grows;
        OPEN cur_user;
        SELECT FOUND_ROWS() INTO @urows;
        IF @grows=@urows THEN
            IF @urows > 0 THEN BEGIN
                SET rv=TRUE;
                WHILE(@urows > 0) DO
                SET @urows=@urows-1;
                    FETCH cur_group INTO sg, cg;
                    FETCH cur_user  INTO su, cu;
                    IF NOT (sg=su AND cg=cu) THEN BEGIN
                        SET rv=FALSE;
                        SET @urows=0;
                        END;
                    END IF;
                END WHILE;
                END;
            ELSE
                SET rv=TRUE;
            END IF;
        END IF;
        CLOSE cur_group;
        CLOSE cur_user;
    END IF;
    RETURN rv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ComparePrivilagesUG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `ComparePrivilagesUG`(userId INT, groupId INT) RETURNS int(11)
BEGIN
    DECLARE rv BOOLEAN DEFAULT FALSE;
    DECLARE uz,us,ua,up,uk,gz,gs,ga,gp,gk INT;
    DECLARE cur_group CURSOR FOR SELECT idStrefy,idKalendarz, P FROM PrawaDostepuGrup WHERE idGrupaUzytkownikow=groupId AND modifyRemoved=FALSE;
    DECLARE cur_user CURSOR  FOR SELECT idStrefy,idKalendarz, P FROM PrawaDostepuUzytkownikow WHERE idUzytkownik=userId AND modifyRemoved=FALSE;
    SET @groupExist=NULL;
    SELECT idGrupaUzytkownikow FROM GrupaUzytkownikow WHERE idGrupaUzytkownikow=groupId INTO @groupExist;
    IF @groupExist IS NOT NULL THEN
        OPEN cur_group;
        SELECT FOUND_ROWS() INTO @grows;
        OPEN cur_user;
        SELECT FOUND_ROWS() INTO @urows;
        IF @grows=@urows THEN
            IF @urows > 0 THEN BEGIN
                SET rv=TRUE;
                WHILE(@urows > 0) DO
                SET @urows=@urows-1;
                    FETCH cur_group INTO gz,gs, gp;
                    FETCH cur_user  INTO uz,us, up;
                    IF NOT (gz=uz AND gs=us AND gp=up) THEN BEGIN
                        SET rv=FALSE;
                        SET @urows=0;
                        END;
                    END IF;
                END WHILE;
            END;
            ELSE
                SET rv=TRUE;
            END IF;
        END IF;
        CLOSE cur_group;
        CLOSE cur_user;
    END IF;
    RETURN rv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CreateGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `CreateGroup`(namePattern VARCHAR(32), creatorId INT) RETURNS int(11)
BEGIN
    INSERT INTO GrupaUzytkownikow(nazwa,modifyTime,modifyUser) VALUES(namePattern, CURRENT_TIMESTAMP(),creatorId);
    UPDATE GrupaUzytkownikow SET nazwa=CONCAT(namePattern,' ',LAST_INSERT_ID()) WHERE idGrupaUzytkownikow=LAST_INSERT_ID();
    RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DoDatabaseHaveTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `DoDatabaseHaveTable`(`tableName` VARCHAR(128), `dbName` VARCHAR(128)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    SELECT DISTINCT count(TABLE_NAME) FROM information_schema.tables
    WHERE table_schema=dbName
    AND table_name=tableName
    INTO @val;
    RETURN @val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DoDatabaseHaveTableCaseInsensitive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `DoDatabaseHaveTableCaseInsensitive`(`tableName` VARCHAR(128), `dbName` VARCHAR(128)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    SELECT DISTINCT count(TABLE_NAME) FROM information_schema.tables
    WHERE table_schema=dbName
    AND LOWER(table_name)=LOWER(tableName)
    INTO @val;
    RETURN @val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FCreateTimeWindow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `FCreateTimeWindow`(dayid INT, creatorId INT) RETURNS int(11)
BEGIN
    DECLARE twId INT DEFAULT NULL;
    DECLARE tb,ts TIME DEFAULT NULL;
    SELECT ADDTIME(Stop,'00:00'), ADDTIME(Stop,'00:30') FROM OknoCzasowe WHERE modifyRemoved=FALSE AND idSchematDzienny=dayid ORDER BY Stop DESC LIMIT 1 INTO tb,ts;
    IF tb IS NULL THEN
        SET tb='00:00';
        SET ts='00:30';
    END IF;
    IF ts >= '24:00' THEN
        SET ts='24:00';
    END IF;
    IF tb <= '23:59' THEN
        INSERT INTO OknoCzasowe(`idSchematDzienny`,`Start`,`Stop`, modifyTime,modifyUser) VALUES(dayid,tb,ts,CURRENT_TIMESTAMP(),creatorId);
        SET twId=LAST_INSERT_ID();
    END IF;
    RETURN twId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetFreeUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `GetFreeUserId`() RETURNS int(11)
BEGIN
DECLARE ret_val INT(6);
set @iter=1;
select MAX(result) from (select if( @iter=firmware_id, @iter:=firmware_id+1, @iter) result from Uzytkownik value order by firmware_id) a INTO ret_val;
IF ret_val < 65536 THEN
RETURN ret_val;
ELSE
 SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = 'The Number of users exceeds the limit (65535)';
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ListaKolumnTabeliForUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `ListaKolumnTabeliForUpdate`(nazwaTabeli VARCHAR(50), nazwaBazyZrodlowej VARCHAR(50)) RETURNS varchar(8192) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE no_more_columns INT;
    DECLARE cname VARCHAR(64);
    DECLARE columns CURSOR FOR SELECT column_name FROM information_schema.columns WHERE table_schema=nazwaBazyZrodlowej AND table_name=nazwaTabeli;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_columns=1;
    SET no_more_columns=0;
    SET @values=NULL;
    OPEN columns;
    loopka: REPEAT
        FETCH columns INTO cname;
        IF no_more_columns=0 THEN
            SET @row = CONCAT(nazwaBazyZrodlowej,'.',nazwaTabeli,'.',cname,'=',DATABASE(),'.',nazwaTabeli,'.',cname);
            SET @values= CONCAT_WS(',',@values,@row);
        END IF;
    UNTIL no_more_columns
    END REPEAT loopka;
    CLOSE columns;
    RETURN @values;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SourceDatabaseName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `SourceDatabaseName`() RETURNS varchar(64) CHARSET utf8
BEGIN
    SELECT REPLACE(DATABASE(),'_temporary','') INTO @rv;
    RETURN @rv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TableColumnCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `TableColumnCount`(`tableName` VARCHAR(128), `dbName` VARCHAR(128)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    SELECT count(COLUMN_NAME) FROM information_schema.columns
    WHERE table_schema=dbName
    AND table_name=tableName
    INTO @val;
    RETURN @val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TableColumnNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` FUNCTION `TableColumnNames`(`tableName` VARCHAR(128), `dbName` VARCHAR(128)) RETURNS varchar(2048) CHARSET utf8
    DETERMINISTIC
BEGIN
    SELECT CONCAT(group_concat(column_name separator ',')) FROM information_schema.columns
    WHERE table_schema=dbName
    AND table_name=tableName
    INTO @values;
    RETURN @values;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLimitsToGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AddLimitsToGroup`(IN groupId INT, IN zoneId INT, IN limitDostepu INT, IN typLimitu INT, IN antyPassback INT, IN creatorId INT)
BEGIN
    DECLARE rws INT;
    DECLARE uid INT;
    DECLARE usrs CURSOR FOR SELECT idUzytkownik FROM Uzytkownik WHERE idGrupy=groupId AND usuniety=FALSE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SELECT 'FAIL'; END;
    START TRANSACTION;
    OPEN usrs;
    SELECT FOUND_ROWS() INTO rws;
    WHILE(rws > 0) DO
        FETCH usrs INTO uid;
        SET rws=rws-1;
        CALL AddLimitsToGroupUsers(zoneId,limitDostepu,typLimitu,antyPassback,uid,creatorId);
    END WHILE;
    CLOSE usrs;
    COMMIT;
    SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLimitsToGroupUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AddLimitsToGroupUsers`(IN zoneId INT, IN limitDostepu INT, IN typLimitu INT, IN antyPassback INT, IN uid INT, IN creatorId INT)
BEGIN
    REPLACE OpcjeDostepu(idUzytkownik,idStrefa,limitDostepu,typLimitu,antyPassback,modifyRemoved,modifyUser,modifyTime) VALUES (uid,zoneId,limitDostepu,typLimitu,antyPassback,FALSE,creatorId,CURRENT_TIMESTAMP());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPathToGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AddPathToGroup`(IN groupId INT, IN devId INT, IN pathId INT, IN creatorId INT)
BEGIN
    REPLACE SciezkiGrup(idGrupy,idCentralaNT,idSciezkiPrzejsc, modifyUser, modifyTime) VALUES(groupId,devId, pathId, creatorId, CURRENT_TIMESTAMP());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPathToUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AddPathToUser`(IN userId INT, IN devId INT, IN pathId INT, IN creatorId INT)
BEGIN
    REPLACE SciezkiUzytkownikow(idUzytkownik,idCentralaNT, idSciezkiPrzejsc, modifyUser, modifyTime) VALUES(userId, devId, pathId, creatorId, CURRENT_TIMESTAMP());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddZoneInPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AddZoneInPath`(IN pathId INT, IN zoneId INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    REPLACE StrefyWSciezce(idSciezkiPrzejsc, idStrefa, numer, modifyTime,modifyUser, modifyRemoved)
    VALUES(pathId,zoneId,1000,CURRENT_TIMESTAMP(), creatorId, FALSE);
    CALL SortZoneInPath(pathId,creatorId);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `AssignRFID`(IN userId INT, IN cardNo DOUBLE, IN creatorId INT)
BEGIN
    REPLACE Karta(nrKarty,idUzytkownik,priorytet,modifyTime,modifyUser) VALUES(cardNo,userId, 100, CURRENT_TIMESTAMP(), creatorId);
    CALL SortRFIDs(userId, creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClearDatabase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ClearDatabase`(IN `dbName` VARCHAR(64))
BEGIN
DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(64);
    DECLARE tables CURSOR FOR SELECT DISTINCT TABLE_NAME FROM information_schema.tables
                                WHERE table_schema=`dbName`
                                AND TABLE_TYPE='BASE TABLE'
                                AND TABLE_NAME!='GlobalStatus'
                                AND TABLE_NAME!='TemporaryStatus';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN tables;
    loadLoop: LOOP
        FETCH tables INTO tableName;
        SET @sql = CONCAT('DELETE FROM ',dbName,'.',tableName);
        PREPARE stmt FROM @sql; EXECUTE stmt;
        IF done THEN
            LEAVE loadLoop;
        END IF;
    END LOOP;
    CLOSE tables;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitDatabase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitDatabase`(IN `nazwaBazyZrodlowej` VARCHAR(50), IN `creatorId` INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        ROLLBACK;
        SELECT 'ERROR' as 'Result', @stage as 'Message';
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=NULL'); PREPARE stmt FROM @sql;EXECUTE stmt;
    END;
    START TRANSACTION;
    SET @userLock = 1;
    SET @ntLock = 1;
    SET @stage='Commit in progress';
    SET @sql = CONCAT('SELECT commitInProgress FROM ',nazwaBazyZrodlowej,'.GlobalStatus INTO @userLock'); PREPARE stmt FROM @sql;EXECUTE stmt;
    SET @stage='Config in progress';
    SET @sql = CONCAT('SELECT COUNT(idCentralaNT) FROM ',nazwaBazyZrodlowej,'.CentralaNT WHERE konfiguracjaJestGenerowana=TRUE INTO @ntLock');PREPARE stmt FROM @sql;EXECUTE stmt;
    IF @userLock IS NULL AND @ntLock=0 THEN
    SET @stage='Update global status';
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=', creatorId); PREPARE stmt FROM @sql;EXECUTE stmt;
        COMMIT;
        START TRANSACTION;
    SET @state='Commit tables';
        CALL CommitTables(nazwaBazyZrodlowej,creatorId);
    SET @state='Commit tables 2';
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.CentralaNT SET generujKonfiguracje=TRUE;'); PREPARE stmt FROM @sql;EXECUTE stmt;
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=NULL'); PREPARE stmt FROM @sql;EXECUTE stmt;
  UPDATE TemporaryStatus SET lockedBy=NULL;
        COMMIT;
        SELECT 'OK' as 'Result', "Done" as 'Message';
    ELSE
        SELECT 'FAIL' as 'Result', @stage as 'Message';
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTables`(IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    CALL CommitTableWithId('SchematDzienny','idSchematDzienny',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('OknoCzasowe','idOknoCzasowe',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithIdSource('SchematTygodniowy','idSchematTygodniowy',nazwaBazyZrodlowej, creatorId);
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.SchematDziennyWTygodniowym WHERE (idSchematTygodniowy,idSchematDzienny,dzienTygodnia) IN (SELECT idSchematTygodniowy,idSchematDzienny,dzienTygodnia FROM SchematDziennyWTygodniowym LEFT JOIN SchematTygodniowy USING(idSchematTygodniowy) WHERE modifyUser=',creatorId,' AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql; EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.SchematDziennyWTygodniowym(idSchematTygodniowy,idSchematDzienny, dzienTygodnia) SELECT idSchematTygodniowy,idSchematDzienny, dzienTygodnia FROM SchematDziennyWTygodniowym LEFT JOIN SchematTygodniowy USING(idSchematTygodniowy) WHERE modifyUser=',creatorId,' AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate('SchematDziennyWTygodniowym', nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql; EXECUTE stmt;
    CALL CommitTableWithIdTemporary('SchematTygodniowy','idSchematTygodniowy',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('RCPSchematDzienny','idSchematDzienny',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('RCPOknoCzasowe','idOknoCzasowe',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithIdSource('RCPSchematTygodniowy','idSchematTygodniowy',nazwaBazyZrodlowej, creatorId);
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.RCPSchematDziennyWTygodniowym WHERE (idSchematTygodniowy,idSchematDzienny,dzienTygodnia) IN (SELECT idSchematTygodniowy,idSchematDzienny,dzienTygodnia FROM RCPSchematDziennyWTygodniowym LEFT JOIN RCPSchematTygodniowy USING(idSchematTygodniowy) WHERE modifyUser=',creatorId,' AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql; EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.RCPSchematDziennyWTygodniowym(idSchematTygodniowy,idSchematDzienny, dzienTygodnia) SELECT idSchematTygodniowy,idSchematDzienny, dzienTygodnia FROM RCPSchematDziennyWTygodniowym LEFT JOIN RCPSchematTygodniowy USING(idSchematTygodniowy) WHERE modifyUser=',creatorId,' AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate('RCPSchematDziennyWTygodniowym', nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql; EXECUTE stmt;
    CALL CommitTableWithIdTemporary('RCPSchematTygodniowy','idSchematTygodniowy',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('RCPkalendarz','idRCPKalendarz',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableThreeKeys('RCPtygodniekalendarza','idRCPKalendarz','nrTygodnia','year',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('kalendarz','idKalendarz',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('tygodniekalendarza','idKalendarz','nrTygodnia',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('Obiekt','idObiekt',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('CentralaNT','idCentralaNT',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('EkspanderCentralaNT','idCentralaNT', 'adres' ,nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('Kontroler','idKontroler',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('Wejscie','idKontroler','numer',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('Wyjscie','idKontroler','numer',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('Przejscie','idKontroler',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('Strefa','idStrefa',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableThreeKeys('PunktyDostepuStrefy','idKontroler','kierunek','czytnik',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('SciezkiPrzejsc','idSciezkiPrzejsc',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('WejscieCentralaNT','idCentralaNT','numerWejscia',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('WyjscieCentralaNT','idCentralaNT','numerWyjscia',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('StrefyWSciezce','idSciezkiPrzejsc','numer',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('RCPreguly','idRCPRegula',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('RCPStrefyReguly','idRCPRegula','idStrefa',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('GrupaUzytkownikow','idGrupaUzytkownikow',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('Uzytkownik','idUzytkownik',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('zdjeciauzytkownikow','idUzytkownik',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('Karta','nrKarty','idUzytkownik',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('UzytkownikProgramu','idUzytkownik',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('DostepDoObiektu','idUzytkownik','idObiekt',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('SciezkiUzytkownikow','idUzytkownik','idCentralaNT',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('SciezkiGrup','idGrupy','idCentralaNT',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('OpcjeDostepu','idUzytkownik','idStrefa',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('PrawaDostepuGrup','idStrefy','idGrupaUzytkownikow',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('PrawaDostepuUzytkownikow','idStrefy','idUzytkownik',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('Mapa','idMapa',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('KameraNaMapie','idKamera',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('KontrolerNaMapie','idMapa','idKontroler', nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('StrefaNaMapie','idMapa','idStrefa', nazwaBazyZrodlowej,creatorId);
    CALL CommitTableThreeKeys('PunktyStrefyNaMapie','idMapa','idStrefa','numer', nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('PunktyMapyNaMapie','idMapa','numer',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableThreeKeys('PrzyciskiPilota','idCentralaNT','idUzytkownik','nrPrzycisku',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('Ethm','id', nazwaBazyZrodlowej, creatorId);
    CALL CommitTableWithId('INTPrzypisanieStref','idStrefyIntegra',nazwaBazyZrodlowej, creatorId);
    CALL CommitTableTwoKeys('INTWejsciaNaMapie','idMapa','idWejscia',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('INTWyjsciaNaMapie','idMapa','idWyjscia',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('ACCOWejsciaNaMapie','idMapa','numerWejscia',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('ACCOWyjsciaNaMapie','idMapa','numerWyjscia',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('InfoWejscieKontroler','id',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('WyjscieWskaznikStrefy','idWyjscie','idStrefa',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('WyjscieWskaznikKontrolera','idWyjscie','idKontroler',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('web_user_settings','id',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('event_manual_entry','id',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableTwoKeys('OpcjeDostepuGrup','idGrupaUzytkownikow','idStrefa',nazwaBazyZrodlowej,creatorId);
	CALL CommitTableWithId('group_accont_output','id',nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithId('user_accont_output','id',nazwaBazyZrodlowej,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableThreeKeys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableThreeKeys`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId1 VARCHAR(50), IN nazwaKolumnyId2 VARCHAR(50), IN nazwaKolumnyId3 VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @stage=nazwaTabeli;
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.',nazwaTabeli,' WHERE (',nazwaKolumnyId1,',',nazwaKolumnyId2,',',nazwaKolumnyId3,') IN (SELECT ',nazwaKolumnyId1,',',nazwaKolumnyId2,',',nazwaKolumnyId3, ' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.',nazwaTabeli,'(',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),') SELECT ',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate(nazwaTabeli, nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('DELETE FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('UPDATE ',nazwaTabeli,' SET modifyTime=NULL, modifyUser=NULL WHERE modifyTime IS NOT NULL');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableTwoKeys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableTwoKeys`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId1 VARCHAR(50), IN nazwaKolumnyId2 VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @stage=nazwaTabeli;
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.',nazwaTabeli,' WHERE (',nazwaKolumnyId1,',',nazwaKolumnyId2,') IN (SELECT ',nazwaKolumnyId1,',',nazwaKolumnyId2,' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.',nazwaTabeli,'(',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),') SELECT ',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate(nazwaTabeli, nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('DELETE FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('UPDATE ',nazwaTabeli,' SET modifyTime=NULL, modifyUser=NULL WHERE modifyTime IS NOT NULL');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableWithId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableWithId`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @stage=nazwaTabeli;
    CALL CommitTableWithIdSource(nazwaTabeli,nazwaKolumnyId,nazwaBazyZrodlowej,creatorId);
    CALL CommitTableWithIdTemporary(nazwaTabeli,nazwaKolumnyId,nazwaBazyZrodlowej,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableWithIdNoDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableWithIdNoDelete`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @stage=nazwaTabeli;
    SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.',nazwaTabeli,' SET usuniety=TRUE WHERE ',nazwaKolumnyId,' IN (SELECT ',nazwaKolumnyId,' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.',nazwaTabeli,'(',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),') SELECT ',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate(nazwaTabeli, nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('UPDATE ',nazwaTabeli,' SET usuniety=TRUE WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('UPDATE ',nazwaTabeli,' SET modifyTime=NULL, modifyUser=NULL WHERE modifyTime IS NOT NULL');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableWithIdSource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableWithIdSource`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.',nazwaTabeli,' WHERE ',nazwaKolumnyId,' IN (SELECT ',nazwaKolumnyId,' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.',nazwaTabeli,'(',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),') SELECT ',TableColumnNames(nazwaTabeli,nazwaBazyZrodlowej),' FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate(nazwaTabeli, nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CommitTableWithIdTemporary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CommitTableWithIdTemporary`(IN nazwaTabeli VARCHAR(50), IN nazwaKolumnyId VARCHAR(50), IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    SET @sql = CONCAT('DELETE FROM ',nazwaTabeli,' WHERE modifyTime IS NOT NULL AND modifyRemoved=TRUE');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET @sql = CONCAT('UPDATE ',nazwaTabeli,' SET modifyTime=NULL, modifyUser=NULL WHERE modifyTime IS NOT NULL');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConvertCase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ConvertCase`(IN `srcDb` VARCHAR(64), IN `destDb` VARCHAR(64))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(64);
    DECLARE tables CURSOR FOR SELECT DISTINCT TABLE_NAME
                    FROM information_schema.tables
                    WHERE table_schema=`srcDb` AND TABLE_TYPE='BASE TABLE';
    DECLARE CONTINUE HANDLER FOR NOT FOUND BEGIN
        SET done = TRUE;
    END;
    OPEN tables;
    loadLoop: LOOP
        FETCH tables INTO tableName;
        IF done THEN
            LEAVE loadLoop;
        END IF;
        SET @stage=CONCAT('pre_',tableName);
        SELECT @stage;
        IF DoDatabaseHaveTableCaseInsensitive(tableName,srcDb) != 0 AND DoDatabaseHaveTableCaseInsensitive(tableName,destDb) != 0 THEN
            SET @sql = CONCAT('ALTER TABLE ',destDb,'.',LOWER(tableName),' RENAME TO ',destDb, '.', tableName);
            SELECT @sql;
            PREPARE stmt FROM @sql; EXECUTE stmt;
            SET @stage=CONCAT('post_',tableName);
        END IF;
    END LOOP;
    CLOSE tables;
    SET @stage=CONCAT('done_',tableName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CopyGroupPrivilagesAndPathsToUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CopyGroupPrivilagesAndPathsToUser`(IN groupId INT, IN userId INT, IN creatorId INT)
BEGIN
    REPLACE PrawaDostepuUzytkownikow(idStrefy,idUzytkownik,idKalendarz,P, modifyTime,modifyUser,modifyRemoved)
                SELECT idStrefy,userId,idKalendarz,P, CURRENT_TIMESTAMP(), creatorId, FALSE FROM PrawaDostepuGrup WHERE idGrupaUzytkownikow=groupId AND modifyRemoved=FALSE;
    REPLACE SciezkiUzytkownikow(idUzytkownik,idCentralaNT, idSciezkiPrzejsc,modifyTime, modifyUser, modifyRemoved)
                SELECT userId,idCentralaNT, idSciezkiPrzejsc, CURRENT_TIMESTAMP(), creatorId, FALSE FROM SciezkiGrup WHERE idGrupy=groupId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CopyUserPrivilagesAndPaths` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CopyUserPrivilagesAndPaths`(IN userId INT, IN srcUserId INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    REPLACE PrawaDostepuUzytkownikow(idStrefy,idUzytkownik,idKalendarz,P, modifyTime,modifyUser,modifyRemoved)
                SELECT idStrefy,userId,idKalendarz,P, CURRENT_TIMESTAMP(), creatorId, FALSE FROM PrawaDostepuUzytkownikow WHERE idUzytkownik=srcUserId AND modifyRemoved=FALSE;
    REPLACE OpcjeDostepu(idStrefa,idUzytkownik,antyPassback,limitDostepu, typLimitu,modifyTime,modifyUser,modifyRemoved)
                SELECT od.idStrefa,userId,od.antyPassback,od.limitDostepu, od.typLimitu,CURRENT_TIMESTAMP(),creatorId,od.modifyRemoved FROM OpcjeDostepu AS od WHERE od.idUzytkownik=srcUserId AND od.modifyRemoved=FALSE;
    REPLACE SciezkiUzytkownikow(idUzytkownik,idCentralaNT, idSciezkiPrzejsc,modifyTime, modifyUser, modifyRemoved)
                SELECT userId, idCentralaNT, idSciezkiPrzejsc, CURRENT_TIMESTAMP(), creatorId, FALSE FROM SciezkiUzytkownikow WHERE idUzytkownik=srcUserId;
    REPLACE user_accont_output(user_id,accont_output_id,modifyTime, modifyUser, modifyRemoved)
                SELECT userId, accont_output_id, CURRENT_TIMESTAMP(), creatorId, FALSE FROM user_accont_output WHERE user_id=srcUserId;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CopyUserPrivilagesAndPathsToGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CopyUserPrivilagesAndPathsToGroup`(IN userId INT, IN groupId INT, IN creatorId INT)
BEGIN
    REPLACE PrawaDostepuGrup(idStrefy,idGrupaUzytkownikow,idKalendarz,P, modifyTime,modifyUser,modifyRemoved)
                SELECT idStrefy,groupId,idKalendarz,P, CURRENT_TIMESTAMP(), creatorId, FALSE FROM PrawaDostepuUzytkownikow WHERE idUzytkownik=userId AND modifyRemoved=FALSE;
    REPLACE SciezkiGrup(idGrupy, idCentralaNT, idSciezkiPrzejsc,modifyTime, modifyUser, modifyRemoved)
                SELECT groupId, idCentralaNT, idSciezkiPrzejsc, CURRENT_TIMESTAMP(), creatorId, FALSE FROM SciezkiUzytkownikow WHERE idUzytkownik=userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccoNtExpander` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateAccoNtExpander`(IN ntId INT, IN name VARCHAR(32), IN address TINYINT UNSIGNED, IN type TINYINT UNSIGNED, IN creatorId INT)
BEGIN
    REPLACE EkspanderCentralaNT(idCentralaNT, nazwa, adres, typ, modifyTime, modifyUser) VALUES(ntId, name, address, type, NOW(), creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccoNtInput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateAccoNtInput`(IN ntId INT, IN no INT, IN creatorId INT)
BEGIN
        REPLACE `WejscieCentralaNT`(idCentralaNT, numerWejscia, modifyUser, modifyTime)
                VALUES(ntId, no, creatorId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccoNtOutput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateAccoNtOutput`(IN ntId INT, IN no INT, IN creatorId INT)
BEGIN
        REPLACE `WyjscieCentralaNT`(idCentralaNT, numerWyjscia, modifyUser, modifyTime)
                VALUES(ntId, no, creatorId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccoNtOutputControllerIndicator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateAccoNtOutputControllerIndicator`(IN outputId INT, IN conId INT, IN creatorId INT)
BEGIN
        REPLACE `WyjscieWskaznikKontrolera`(idWyjscie,idKontroler, modifyUser, modifyTime)
                VALUES(outputId, conId, creatorId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccoNtOutputZoneIndicator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateAccoNtOutputZoneIndicator`(IN outputId INT, IN zoneId INT, IN creatorId INT)
BEGIN
        REPLACE `WyjscieWskaznikStrefy`(idWyjscie,idStrefa, modifyUser, modifyTime)
                VALUES(outputId, zoneId, creatorId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCalendar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateCalendar`(IN name varchar(255), IN creatorId INT)
BEGIN
    SELECT count(idKalendarz) FROM kalendarz WHERE modifyRemoved=FALSE INTO @num;
    INSERT INTO kalendarz(nazwaKalendarza, modifyTime, modifyUser) VALUES(CONCAT(name,@num), NOW(), creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateController` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateController`(IN namePattern VARCHAR(32), IN ntId INT, IN address INT, IN creatorId INT)
BEGIN
    DECLARE idCtrl INT;
    START TRANSACTION;
    INSERT INTO Kontroler(idCentralaNT, adres, nazwa, modifyTime, modifyUser) VALUES(ntId,address,CONCAT(namePattern,' ',address), CURRENT_TIMESTAMP(), creatorId);
    SET idCtrl = LAST_INSERT_ID();
    UPDATE Wejscie SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idKontroler=idCtrl;
    UPDATE Wyjscie SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idKontroler=idCtrl;
    UPDATE Przejscie SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idKontroler=idCtrl;
	INSERT INTO InfoWejscieKontroler(idKontroler, numer, modifyUser, modifyTime) VALUES (idCtrl, 0, creatorId, CURRENT_TIMESTAMP());
	INSERT INTO InfoWejscieKontroler(idKontroler, numer, modifyUser, modifyTime) VALUES (idCtrl, 1, creatorId, CURRENT_TIMESTAMP());
	INSERT INTO InfoWejscieKontroler(idKontroler, numer, modifyUser, modifyTime) VALUES (idCtrl, 2, creatorId, CURRENT_TIMESTAMP());
	INSERT INTO InfoWejscieKontroler(idKontroler, numer, modifyUser, modifyTime) VALUES (idCtrl, 3, creatorId, CURRENT_TIMESTAMP());
    SELECT * FROM Kontroler LEFT JOIN WidokStatusKontrolera USING(idKontroler) WHERE idKontroler=idCtrl;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateDaySchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateDaySchedule`(IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    DECLARE idds INT;
    DECLARE twid INT;
    START TRANSACTION;
    INSERT INTO SchematDzienny(modifyTime,modifyUser) VALUES(CURRENT_TIMESTAMP(),creatorId);
    SET idds=LAST_INSERT_ID();
    UPDATE SchematDzienny SET nazwa=CONCAT(namePattern,' ',idds-1) WHERE idSchematDzienny=idds;
    SELECT FCreateTimeWindow(idds,creatorId) INTO twid;
    IF twid IS NOT NULL THEN
        SELECT * FROM SchematDzienny WHERE idSchematDzienny=idds;
        SELECT * FROM OknoCzasowe WHERE idOknoCzasowe=twid;
        COMMIT;
    ELSE
        ROLLBACK;
        SELECT 'FAIL DS01';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateGroup`(IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    SET @newid=CreateGroup(namePattern,creatorId);
    SELECT * FROM GrupaUzytkownikow WHERE idGrupaUzytkownikow=@newid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateMap`(IN name VARCHAR(96),
    IN planImage MEDIUMBLOB,
    IN description VARCHAR(255),
    IN creatorId INT)
BEGIN
    START TRANSACTION;
    IF name IS NULL THEN
        SELECT count(idMapa) FROM Mapa INTO @mapCount;
        SET name=CONCAT('SQLMAP ',@mapCount+1);
    END IF;
    INSERT INTO Mapa(nazwa, opis, obrazPlanu, modifyTime,modifyUser)
    VALUES(name, description, planImage, CURRENT_TIMESTAMP(),creatorId);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateObject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateObject`(IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    START TRANSACTION;
    INSERT INTO Obiekt(nazwa,modifyTime,modifyUser) VALUES(namePattern, CURRENT_TIMESTAMP(),creatorId);
    UPDATE Obiekt SET nazwa=CONCAT(namePattern,' ',LAST_INSERT_ID()) WHERE idObiekt=LAST_INSERT_ID();
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePilotButton` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreatePilotButton`(IN userId INT, IN accoNtId INT, IN buttonNo INT, IN creatorId INT)
BEGIN
    REPLACE `PrzyciskiPilota`(idCentralaNT,nrPrzycisku,idUzytkownik,modifyTime,modifyUser)
                       VALUES(accoNtId,buttonNo,userId,NOW(),creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateProgramUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateProgramUser`(IN userId INT, IN creatorId INT, IN newLogin VARCHAR(32), IN newPassword VARCHAR(32))
BEGIN
    SET @userExistance=NULL;
    SET @checkPUremovedState=NULL;
    SELECT count(idUzytkownik) FROM Uzytkownik WHERE usuniety=FALSE AND modifyRemoved=FALSE AND idUzytkownik=userId INTO @userExistance;
    SELECT modifyUser FROM UzytkownikProgramu WHERE idUzytkownik=userId INTO @checkPUremovedState;
    IF @userExistance!=0 && (@checkPUremovedState is null || @checkPUremovedState=creatorId ) THEN BEGIN
            REPLACE UzytkownikProgramu(idUzytkownik, login, haslo, modifyTime,modifyUser,modifyRemoved) VALUES(userId,newLogin,MD5(newPassword),CURRENT_TIMESTAMP(),creatorId,FALSE);
            SELECT * from UzytkownikProgramu WHERE idUzytkownik=userId;
        END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTimeWindow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateTimeWindow`(IN dayid INT, IN creatorId INT)
BEGIN
    DECLARE twid INT;
    SET twid=FCreateTimeWindow(dayid,creatorId);
    IF twid IS NOT NULL THEN
        SELECT * FROM OknoCzasowe WHERE idOknoCzasowe=twid;
    ELSE
        SELECT 'FAIL TW01';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateUser`(IN namepattern VARCHAR(96), IN creatorId INT)
BEGIN
    SET @newid = GetFreeUserId();
    INSERT INTO Uzytkownik(firmware_id, usuniety,nazwa, modifyTime, modifyUser)
        VALUES(@newid,FALSE,LEFT(CONCAT(namepattern,' ',@newid),16), CURRENT_TIMESTAMP(), creatorId);
    SELECT * FROM Uzytkownik WHERE idUzytkownik=@newid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateWeekSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateWeekSchedule`(IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    DECLARE wsid INT;
    DECLARE twid INT;
    SELECT count(*) FROM SchematTygodniowy WHERE modifyRemoved=FALSE INTO @c;
    INSERT INTO SchematTygodniowy(nazwa,modifyTime,modifyUser) VALUES(CONCAT(namePattern,' ',@c), CURRENT_TIMESTAMP(),creatorId);
    SELECT * FROM SchematTygodniowy LEFT JOIN SchematDziennyWTygodniowym USING(idSchematTygodniowy) WHERE idSchematTygodniowy=LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateZone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateZone`(IN namePattern VARCHAR(32), IN ntId INT, IN creatorId INT)
BEGIN
    DECLARE zid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SELECT 'FAIL Z01'; END;
    START TRANSACTION;
    SELECT count(idStrefa)+1 FROM Strefa WHERE idCentralaNT=ntId INTO @count;
    INSERT INTO Strefa(idCentralaNT, nazwa, modifyTime,modifyUser) VALUES(ntId, CONCAT(namePattern,' ',@count), CURRENT_TIMESTAMP(),creatorId);
    SET zid=LAST_INSERT_ID();
    SELECT * FROM Strefa WHERE idStrefa=zid;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateZonePath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `CreateZonePath`(IN namePattern VARCHAR(32), IN ntId INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    SELECT count(idSciezkiPrzejsc)+1 FROM SciezkiPrzejsc WHERE idCentralaNT = ntId INTO @count;
    INSERT INTO SciezkiPrzejsc(nazwa,idCentralaNT, modifyTime,modifyUser) VALUES(CONCAT(namePattern,' ',@count), ntId, CURRENT_TIMESTAMP(),creatorId);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GrantAccessToObject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `GrantAccessToObject`(IN userId INT, IN objectId INT, IN creatorId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN SELECT 'FAIL ERROR'; END;
    REPLACE DostepDoObiektu(idObiekt, idUzytkownik, modifyTime, modifyUser) VALUES(objectId,userId,CURRENT_TIMESTAMP(),creatorId);
    SELECT * FROM DostepDoObiektu WHERE idObiekt=objectId AND idUzytkownik=userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GrantPrivilagesForGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `GrantPrivilagesForGroup`(IN zoneId INT, IN groupId INT, IN creatorId INT)
BEGIN
    REPLACE PrawaDostepuGrup(idStrefy, idGrupaUzytkownikow, modifyTime, modifyUser) VALUES(zoneId,groupId,CURRENT_TIMESTAMP(),creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GrantPrivilagesForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `GrantPrivilagesForUser`(IN zoneId INT, IN userId INT, IN creatorId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN SELECT 'FAIL ERROR'; END;
    REPLACE PrawaDostepuUzytkownikow(idStrefy, idUzytkownik, modifyTime, modifyUser) VALUES(zoneId,userId,CURRENT_TIMESTAMP(),creatorId);
    SELECT * FROM PrawaDostepuUzytkownikow WHERE idStrefy=zoneId AND idUzytkownik=userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GroupUnassignedUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `GroupUnassignedUsers`(IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    DECLARE uid INT DEFAULT 0;
    DECLARE rws INT;
    DECLARE usrs CURSOR FOR SELECT idUzytkownik FROM Uzytkownik WHERE usuniety=FALSE AND idGrupy IS NULL;
    OPEN usrs;
    SELECT FOUND_ROWS() INTO rws;
    WHILE(rws > 0) DO
        FETCH usrs INTO uid;
        SET rws=rws-1;
        CALL GroupUser(uid, namePattern, creatorId);
    END WHILE;
    CLOSE usrs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GroupUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `GroupUser`(IN userId INT, IN namePattern VARCHAR(32), IN creatorId INT)
BEGIN
    DECLARE grpid INT;
    DECLARE foundGroup BOOLEAN DEFAULT FALSE;
    DECLARE cur_group CURSOR FOR SELECT DISTINCT idGrupaUzytkownikow FROM PrawaDostepuGrup WHERE modifyRemoved=FALSE;
    IF userId > 1 THEN
        OPEN cur_group;
        SELECT FOUND_ROWS() INTO @rows;
        SELECT count(*) FROM PrawaDostepuUzytkownikow WHERE idUzytkownik=userId AND modifyRemoved=FALSE INTO @currentRights;
        select @currentRights;
        IF @currentRights=0 THEN
            SELECT idGrupaUzytkownikow FROM GrupaUzytkownikow WHERE idGrupaUzytkownikow NOT IN
                (SELECT DISTINCT idGrupaUzytkownikow FROM PrawaDostepuGrup) LIMIT 1 INTO grpid;
            IF grpid IS NOT NULL THEN
                SET foundGroup=TRUE;
            END IF;
        ELSE
            WHILE(@rows > 0) DO
                FETCH cur_group INTO grpid;
                SET @rows=@rows-1;
                IF ComparePrivilagesUG(userId, grpid)=TRUE AND ComparePathsUG(userId,grpid)=TRUE THEN
                    SET foundGroup=TRUE;
                    SET @rows=0;
                END IF;
            END WHILE;
        END IF;
        CLOSE cur_group;
        select grpid,foundGroup;
        IF foundGroup=TRUE THEN
            CALL MoveUserToGroup(grpid, userId, creatorId);
        ELSE
            START TRANSACTION;
            SELECT CreateGroup(namePattern,creatorId) INTO grpid;
            CALL CopyUserPrivilagesAndPathsToGroup(userId, grpid, creatorId);
            CALL MoveUserToGroup(grpid,userId,creatorId);
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ImportGroup`(IN name VARCHAR(32), IN description VARCHAR(255), IN K BOOLEAN, IN creatorId INT)
BEGIN
    INSERT INTO GrupaUzytkownikow(nazwa,opis,K,modifyTime,modifyUser) VALUES(name,description,K, CURRENT_TIMESTAMP(),creatorId);
    SELECT * FROM GrupaUzytkownikow WHERE idGrupaUzytkownikow=LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ImportRFID`(IN userId INT, IN cardNo DOUBLE, IN creatorId INT)
BEGIN
    SELECT count(*) FROM Karta WHERE idUzytkownik=userId AND nrKarty=cardNo INTO @tmp;
    IF @tmp = 0 THEN
        INSERT INTO Karta(nrKarty,idUzytkownik,modifyTime,modifyUser) VALUES(cardNo,userId, CURRENT_TIMESTAMP(), creatorId);
        CALL SortRFIDs(userId, creatorId);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ImportUser`(
    IN groupId INT,
    IN surname VARCHAR(64),
    IN firstname VARCHAR(64),
    IN name VARCHAR(16),
    IN accountNo VARCHAR(64),
    IN description VARCHAR(255),
    IN code VARCHAR(45),
    IN K BOOLEAN,
    IN userMustChangeCode BOOLEAN,
    IN codeChangedByUser BOOLEAN,
    IN shouldReplace BOOLEAN,
    IN creatorId INT )
BEGIN
DECLARE duplicateId INT(11);
SELECT idUzytkownik from Uzytkownik where kod = code AND nazwa!=name INTO duplicateId;
IF duplicateId IS NOT NULL THEN
    SET code = null;
    UPDATE Uzytkownik SET zmianaKodu=1 WHERE idUzytkownik = duplicateId;
END IF;
INSERT INTO Uzytkownik(firmware_id,
            usuniety,
            idGrupy,
            nazwisko,
            imie,
            nazwa,
            nrKsiegowy,
            opis,
            kod,
            K,
            zmianaKodu,
            kodZmieniony,
            modifyTime,
            modifyUser)
        VALUES(
            GetFreeUserId(),
            FALSE,
            groupId,
            surname,
            firstname,
            name,
            accountNo,
            description,
            code,
            K,
            userMustChangeCode,
            codeChangedByUser,
            CURRENT_TIMESTAMP(),
            creatorId);
SELECT * FROM Uzytkownik WHERE nazwa=name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertMapPointOnMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `InsertMapPointOnMap`(IN mapId INT, IN x INT, IN y INT, IN insertAt INT, IN creatorId INT)
BEGIN
    UPDATE PunktyMapyNaMapie SET numer=numer+1000 WHERE idMapa=mapId  AND numer >= insertAt;
    INSERT PunktyMapyNaMapie(idMapa, numer, pozycjaX, pozycjaY, modifyTime,modifyUser, modifyRemoved)
        VALUES(mapId,insertAt, x, y, CURRENT_TIMESTAMP(), creatorId, FALSE);
    CALL SortPointsInMap(mapId,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertZonePointOnMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `InsertZonePointOnMap`(IN mapId INT, IN zoneId INT, IN x INT, IN y INT, IN insertAt INT, IN creatorId INT)
BEGIN
    UPDATE PunktyStrefyNaMapie SET numer=numer+1000 WHERE idMapa=mapId AND idStrefa=zoneId AND numer >= insertAt;
    INSERT PunktyStrefyNaMapie(idMapa, idStrefa, numer, pozycjaX, pozycjaY, modifyTime,modifyUser, modifyRemoved)
        VALUES(mapId,zoneId,insertAt, x, y, CURRENT_TIMESTAMP(), creatorId, FALSE);
    CALL SortPointsInZone(mapId,zoneId,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDatabaseFromTo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `LoadDatabaseFromTo`(IN `srcDb` VARCHAR(64), IN `destDb` VARCHAR(64))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(64);
    DECLARE tables CURSOR FOR SELECT DISTINCT TABLE_NAME
                    FROM information_schema.tables
                    WHERE table_schema=`destDb` AND TABLE_TYPE='BASE TABLE';
    DECLARE CONTINUE HANDLER FOR NOT FOUND BEGIN
        SET done = TRUE;
    END;
    OPEN tables;
    loadLoop: LOOP
        FETCH tables INTO tableName;
        IF done THEN
            LEAVE loadLoop;
        END IF;
        SET @stage=CONCAT('pre_',tableName);
        IF DoDatabaseHaveTable(tableName,srcDb) != 0 AND DoDatabaseHaveTable(tableName,destDb) != 0 THEN
            CALL LoadTableFromTo(srcDb,destDb,tableName);
            SET @stage=CONCAT('post_',tableName);
        END IF;
    END LOOP;
    CLOSE tables;
    SET @stage=CONCAT('done_',tableName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadTableFromTo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `LoadTableFromTo`(IN `srcDb` VARCHAR(64), IN `destDb` VARCHAR(64), IN `tableName` VARCHAR(64))
BEGIN
    SET @sql = CONCAT('DELETE FROM ',`destDb`,'.',`tableName`);
    PREPARE stmt FROM @sql;EXECUTE stmt;
    SELECT TableColumnCount(tableName,srcDb) INTO @srcColCnt;
    SELECT TableColumnCount(tableName,destDb) INTO @destColCnt;
    IF @destColCnt <= @srcColCnt THEN
        SET @sql = CONCAT('REPLACE ',`destDb`,'.',`tableName`,'(',TableColumnNames(`tableName`,`destDb`),')',' SELECT ',TableColumnNames(`tableName`,`destDb`),' FROM `',`srcDb`,'`.`',`tableName`,'`');
    ELSE
        SET @sql = CONCAT('REPLACE ',`destDb`,'.',`tableName`,'(',TableColumnNames(`tableName`,`srcDb`),')',' SELECT ',TableColumnNames(`tableName`,`srcDb`),' FROM `',`srcDb`,'`.`',`tableName`,'`');
    END IF;
    PREPARE stmt FROM @sql;EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MergeNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `MergeNT`(IN phyId INT, IN virtId INT, IN creatorId INT)
BEGIN
    DECLARE nazwaBazyZrodlowej VARCHAR(64) DEFAULT SourceDatabaseName();
    SELECT identyfikator FROM CentralaNT WHERE idCentralaNT=phyId INTO @ident;
    DELETE FROM CentralaNT WHERE idCentralaNT=phyId;
    SET @sql = CONCAT('DELETE FROM ',nazwaBazyZrodlowej,'.CentralaNT WHERE idCentralaNT=',phyId);
    PREPARE stmt FROM @sql;EXECUTE stmt;
    UPDATE CentralaNT SET identyfikator=@ident, generujKonfiguracje=1, modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idCentralaNT=virtId;
    SET @sql = CONCAT('INSERT ',nazwaBazyZrodlowej,'.CentralaNT(',TableColumnNames('CentralaNT',nazwaBazyZrodlowej),') SELECT ',TableColumnNames('CentralaNT',nazwaBazyZrodlowej),' FROM CentralaNT WHERE idCentralaNT=',virtId,' AND modifyRemoved=FALSE ON DUPLICATE KEY UPDATE ',ListaKolumnTabeliForUpdate('CentralaNT', nazwaBazyZrodlowej));
    PREPARE stmt FROM @sql;EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MoveUserToGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `MoveUserToGroup`(IN groupId INT, IN userId INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    UPDATE Uzytkownik SET idGrupy=groupId, modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idUzytkownik=userId;
    UPDATE PrawaDostepuUzytkownikow SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idUzytkownik=userId;
    UPDATE OpcjeDostepu SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idUzytkownik=userId;
    UPDATE SciezkiUzytkownikow SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idUzytkownik=userId;
    UPDATE user_accont_output SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE user_id=userId;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecreateViews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RecreateViews`()
BEGIN
DROP VIEW IF EXISTS `WidokGlobalStatus`;
SET @sql = CONCAT('CREATE VIEW `WidokGlobalStatus` AS SELECT * FROM `',@sourceDatabase,'`.GlobalStatus');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokUstawienia`;
SET @sql = CONCAT('CREATE VIEW `WidokUstawienia` AS SELECT * FROM `',@sourceDatabase,'`.Ustawienia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusKontrolera`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusKontrolera` AS SELECT * FROM `',@sourceDatabase,'`.StatusKontrolera');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusCentraliNT`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusCentraliNT` AS SELECT * FROM `',@sourceDatabase,'`.StatusCentraliNT');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusPrzejscia`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusPrzejscia` AS SELECT * FROM `',@sourceDatabase,'`.StatusPrzejscia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusWejscia`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusWejscia` AS SELECT * FROM `',@sourceDatabase,'`.StatusWejscia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusWyjscia`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusWyjscia` AS SELECT * FROM `',@sourceDatabase,'`.StatusWyjscia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusEkspanderow`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusEkspanderow` AS SELECT * FROM `',@sourceDatabase,'`.StatusEkspanderow');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusOpcjeDostepu`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusOpcjeDostepu` AS SELECT * FROM `',@sourceDatabase,'`.StatusOpcjeDostepu');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusUzytkownik`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusUzytkownik` AS SELECT * FROM `',@sourceDatabase,'`.StatusUzytkownik');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusStrefa`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusStrefa` AS SELECT * FROM `',@sourceDatabase,'`.StatusStrefa');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStatusEthm`;
SET @sql = CONCAT('CREATE VIEW `WidokStatusEthm` AS SELECT * FROM `',@sourceDatabase,'`.StatusEthm');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTWejscia`;
SET @sql = CONCAT('CREATE VIEW `WidokINTWejscia` AS SELECT * FROM `',@sourceDatabase,'`.INTWejscia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTWyjscia`;
SET @sql = CONCAT('CREATE VIEW `WidokINTWyjscia` AS SELECT * FROM `',@sourceDatabase,'`.INTWyjscia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTEkspandery`;
SET @sql = CONCAT('CREATE VIEW `WidokINTEkspandery` AS SELECT * FROM `',@sourceDatabase,'`.INTEkspandery');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTUzytkownicy`;
SET @sql = CONCAT('CREATE VIEW `WidokINTUzytkownicy` AS SELECT * FROM `',@sourceDatabase,'`.INTUzytkownicy');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTStrefy`;
SET @sql = CONCAT('CREATE VIEW `WidokINTStrefy` AS SELECT * FROM `',@sourceDatabase,'`.INTStrefy');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTAwarie`;
SET @sql = CONCAT('CREATE VIEW `WidokINTAwarie` AS SELECT * FROM `',@sourceDatabase,'`.INTAwarie');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `Zdarzenie`;
SET @sql = CONCAT('CREATE VIEW `Zdarzenie` AS SELECT * FROM `',@sourceDatabase,'`.Zdarzenie');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokStanowWejscKontrolera`;
CREATE VIEW `WidokStanowWejscKontrolera` AS
SELECT idKontroler, GROUP_CONCAT(status) AS stanWejsc FROM WidokStatusWejscia GROUP BY idKontroler;
DROP VIEW IF EXISTS `WidokStanowWyjscKontrolera`;
CREATE VIEW `WidokStanowWyjscKontrolera` AS
SELECT idKontroler, GROUP_CONCAT(wyjscieZalaczone) AS stanWyjsc FROM WidokStatusWyjscia GROUP BY idKontroler;
DROP VIEW IF EXISTS `WidokSzczegolowyStanuKontrolera`;
CREATE VIEW `WidokSzczegolowyStanuKontrolera` AS
SELECT
k.idKontroler, sk.sabotazModulu, sk.awariaZegara, sk.buforZdarzenZapelniony50, sk.buforZdarzenZapelniony90, sk.awariaZasilaniaAC, sk.rozladowanyAkumulator, sk.brakAkumulatora, sk.statusPrzekaznika,
se.probaSkanowania, se.brakEkspanderaA, se.brakEkspanderaB, se.sabotazEkspanderaA, se.sabotazEkspanderaB, se.trybEdycjiDanych,
sp.otwarteDrzwi, sp.dlugoOtwarteDrzwi, sp.przejscieOdblokowane, sp.przejscieZblokowane, sp.wejscieSilowe,
wswej.stanWejsc, wswyj.stanWyjsc
FROM Kontroler AS k
LEFT JOIN WidokStatusKontrolera AS sk ON sk.idKontroler = k.idKontroler
LEFT JOIN WidokStatusEkspanderow AS se ON se.idKontroler = k.idKontroler
LEFT JOIN WidokStatusPrzejscia AS sp ON sp.idPrzejscie = k.idKontroler
LEFT JOIN WidokStanowWejscKontrolera AS wswej ON wswej.idKontroler = k.idKontroler
LEFT JOIN WidokStanowWyjscKontrolera AS wswyj ON wswyj.idKontroler = k.idKontroler;
DROP VIEW IF EXISTS `WidokGrupowyStanuKontrolera`;
CREATE VIEW `WidokGrupowyStanuKontrolera` AS
SELECT
idKontroler,
IF(sabotazModulu>0,3,IF(awariaZegara>0,2,0)) AS stanKontrolera,
(sabotazModulu=1||awariaZegara=1) AS stanKontroleraNP,
IF(awariaZasilaniaAC>0||rozladowanyAkumulator>0||brakAkumulatora>0,3,0) AS stanZasilania,
(awariaZasilaniaAC=1||rozladowanyAkumulator=1||brakAkumulatora=1) AS stanZasilaniaNP,
IF(probaSkanowania>0||brakEkspanderaA>0||brakEkspanderaB>0||sabotazEkspanderaA>0||sabotazEkspanderaB>0,3,0) AS stanTerminali,
(probaSkanowania=1||brakEkspanderaA=1||brakEkspanderaB=1||sabotazEkspanderaA=1||sabotazEkspanderaB=1) AS stanTerminaliNP,
IF(wejscieSilowe>0,3,IF(otwarteDrzwi>0,1,0)) AS stanPrzejscia,
(wejscieSilowe=1) AS stanPrzejsciaNP,
IF(dlugoOtwarteDrzwi>0,2,0) AS stanPrzejsciaDOD,
(dlugoOtwarteDrzwi=1) AS stanPrzejsciaDODNP,
(otwarteDrzwi&1) AS drzwiOtwarte,
IF(przejscieZblokowane&1, 2, IF(przejscieOdblokowane&1, 1, 0)) AS stanDrzwi
FROM WidokSzczegolowyStanuKontrolera;
DROP VIEW IF EXISTS `WidokGrupowyRozszerzonyStanuKontrolera`;
CREATE VIEW `WidokGrupowyRozszerzonyStanuKontrolera` AS
SELECT *,
GREATEST(stanKontrolera,stanZasilania,stanTerminali,stanPrzejscia,stanPrzejsciaDOD) AS stanGlobalny,
GREATEST(stanKontroleraNP,stanZasilaniaNP,stanTerminaliNP,stanPrzejsciaNP,stanPrzejsciaDODNP) AS stanGlobalnyNP
FROM WidokGrupowyStanuKontrolera;
DROP VIEW IF EXISTS `WidokStanuKontroleraNaMapie`;
CREATE VIEW `WidokStanuKontroleraNaMapie` AS
SELECT
knm.idMapa, knm.idKontroler,
wgrsk.stanKontrolera, wgrsk.stanKontroleraNP, wssk.buforZdarzenZapelniony50, wssk.buforZdarzenZapelniony90, wgrsk.stanZasilania, wgrsk.stanZasilaniaNP, wgrsk.stanTerminali, wgrsk.stanTerminaliNP, wgrsk.stanPrzejscia, wgrsk.stanPrzejsciaNP, wgrsk.stanPrzejsciaDOD, wgrsk.stanPrzejsciaDODNP, wgrsk.drzwiOtwarte, wgrsk.stanDrzwi, wgrsk.stanGlobalny, wgrsk.stanGlobalnyNP,
wssk.statusPrzekaznika, wssk.sabotazModulu, wssk.awariaZegara, wssk.awariaZasilaniaAC, wssk.rozladowanyAkumulator, wssk.brakAkumulatora, wssk.probaSkanowania, wssk.brakEkspanderaA, wssk.brakEkspanderaB, wssk.sabotazEkspanderaA, wssk.sabotazEkspanderaB, wssk.trybEdycjiDanych, wssk.otwarteDrzwi, wssk.dlugoOtwarteDrzwi, wssk.przejscieOdblokowane, wssk.przejscieZblokowane, wssk.wejscieSilowe, wssk.stanWejsc, wssk.stanWyjsc
FROM KontrolerNaMapie AS knm
LEFT JOIN WidokGrupowyRozszerzonyStanuKontrolera AS wgrsk ON wgrsk.idKontroler = knm.idKontroler
LEFT JOIN WidokSzczegolowyStanuKontrolera AS wssk ON wssk.idKontroler = knm.idKontroler;
DROP VIEW IF EXISTS `WidokStanuMapy`;
CREATE VIEW `WidokStanuMapy` AS
SELECT knm.idMapa, MAX(stanGlobalny) AS stanGlobalny, MAX(stanGlobalnyNP) AS stanGlobalnyNP FROM KontrolerNaMapie AS knm LEFT JOIN WidokGrupowyRozszerzonyStanuKontrolera AS wgrsk ON wgrsk.idKontroler = knm.idKontroler GROUP BY knm.idMapa ORDER BY knm.idMapa ASC;
DROP VIEW IF EXISTS `WidokINTZdarzenie`;
SET @sql = CONCAT('CREATE VIEW `WidokINTZdarzenie` AS SELECT * FROM `',@sourceDatabase,'`.INTZdarzenie');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `WidokINTOpisZdarzenia`;
SET @sql = CONCAT('CREATE VIEW `WidokINTOpisZdarzenia` AS SELECT * FROM `',@sourceDatabase,'`.INTOpisZdarzenia');
PREPARE stmt FROM @sql; EXECUTE stmt;
DROP VIEW IF EXISTS `web_session`;
SET @sql = CONCAT('CREATE  VIEW `web_session` AS select * FROM `',@sourceDatabase,'`.web_session');
PREPARE stmt FROM @sql; EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccessOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccessOptions`(IN userId INT, IN zoneId INT, IN creatorId INT)
BEGIN
    UPDATE OpcjeDostepu SET modifyRemoved=TRUE, modifyTime=NOW(), modifyUser=creatorId WHERE idUzytkownik=userId AND idStrefa=zoneId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccoNtExpander` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccoNtExpander`(IN ntId INT, IN address INT, IN creatorId INT)
BEGIN
    UPDATE EkspanderCentralaNT SET modifyRemoved=TRUE, modifyTime=NOW(), modifyUser=creatorId WHERE idCentralaNT=ntId AND adres=address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccoNtInput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccoNtInput`(IN ntId INT, IN no INT, IN creatorId INT)
BEGIN
        UPDATE `WejscieCentralaNT` SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idCentralaNT=ntId AND numerWejscia=no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccoNtOutput` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccoNtOutput`(IN ntId INT, IN no INT, IN creatorId INT)
BEGIN
        UPDATE `WyjscieCentralaNT` SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idCentralaNT=ntId AND numerWyjscia=no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccoNtOutputControllerIndicator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccoNtOutputControllerIndicator`(IN outputId INT, IN conId INT, IN creatorId INT)
BEGIN
        UPDATE `WyjscieWskaznikKontrolera` SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idWyjscie = outputId AND idKontroler=conId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccoNtOutputZoneIndicator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveAccoNtOutputZoneIndicator`(IN outputId INT, IN zoneId INT, IN creatorId INT)
BEGIN
        UPDATE `WyjscieWskaznikStrefy` SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idWyjscie = outputId AND idStrefa=zoneId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveCalendar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveCalendar`(IN calendarId INT, IN creatorId INT)
BEGIN
    UPDATE kalendarz SET modifyTime=NOW(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idKalendarz=calendarId;
    UPDATE tygodniekalendarza SET modifyTime=NOW(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idKalendarz=calendarId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveController` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveController`(IN ctrlId INT, IN creatorId INT)
BEGIN
    DECLARE addr INT DEFAULT 0;
    DECLARE accontId INT DEFAULT 0;
    UPDATE Kontroler SET modifyRemoved=TRUE, modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idKontroler=ctrlId;
    UPDATE KontrolerNaMapie SET modifyRemoved=TRUE, modifyTime=NOW(), modifyUser=creatorId WHERE idKontroler=ctrlId;
    UPDATE WyjscieWskaznikKontrolera SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idKontroler=ctrlId;
    SELECT adres, idCentralaNT INTO addr, accontId FROM Kontroler WHERE idKontroler=ctrlId;
    UPDATE WejscieCentralaNT SET aktywne=FALSE, modifyTime=NOW(), opcjeTypuReakcji=0 WHERE opcjeTypuReakcji=addr AND idCentralaNT=accontId AND typReakcji IN (6,7,8,9,10);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveDaySchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveDaySchedule`(IN dayId INT, IN creatorId INT)
BEGIN
    UPDATE SchematDzienny SET modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP(), modifyRemoved=TRUE WHERE idSchematDzienny=dayId;
    UPDATE OknoCzasowe SET modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP(), modifyRemoved=TRUE WHERE idSchematDzienny=dayId;
    UPDATE SchematTygodniowy AS st LEFT JOIN SchematDziennyWTygodniowym USING(idSchematTygodniowy) SET st.modifyTime=NOW() WHERE idSchematDzienny=dayId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveGroup`(IN groupId INT, IN creatorId INT)
BEGIN
    DECLARE rws INT;
    DECLARE uid INT;
    DECLARE usrs CURSOR FOR SELECT idUzytkownik FROM Uzytkownik WHERE idGrupy=groupId AND usuniety=FALSE;
    START TRANSACTION;
    OPEN usrs;
    SELECT FOUND_ROWS() INTO rws;
    WHILE(rws > 0) DO
        FETCH usrs INTO uid;
        SET rws=rws-1;
        CALL CopyGroupPrivilagesAndPathsToUser(groupId,uid,creatorId);
    END WHILE;
    CLOSE usrs;
    UPDATE Uzytkownik SET idGrupy=NULL, modifyUser=creatorId, modifyTime=NOW() WHERE idGrupy=groupId;
    UPDATE GrupaUzytkownikow SET modifyRemoved=TRUE, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idGrupaUzytkownikow=groupId;
    UPDATE PrawaDostepuGrup SET modifyRemoved=TRUE, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idGrupaUzytkownikow=groupId;
    UPDATE SciezkiGrup SET modifyRemoved=TRUE, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idGrupy=groupId;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveMap`(IN mapId INT, IN creatorId INT)
BEGIN
    UPDATE Mapa SET modifyTime=NOW(),modifyUser=creatorId,idMapyNadrzednej=NULL WHERE idMapyNadrzednej=mapId;
    UPDATE Mapa SET modifyTime=NOW(),modifyUser=creatorId,modifyRemoved=TRUE WHERE idMapa=mapId;
    SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveMapPointOnMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveMapPointOnMap`(IN mapId INT, IN removeAt INT, IN creatorId INT)
BEGIN
    UPDATE PunktyMapyNaMapie SET modifyRemoved=TRUE WHERE idMapa=mapId  AND numer=removeAt;
    CALL SortPointsInMap(mapId,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveObject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveObject`(IN objectId INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    UPDATE CentralaNT SET idObiekt=NULL, modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId WHERE idObiekt=objectId;
    UPDATE Obiekt SET modifyTime=CURRENT_TIMESTAMP(),modifyUser=creatorId,modifyRemoved=TRUE WHERE idObiekt=objectId;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovePathFromGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemovePathFromGroup`(IN groupId INT, IN devId INT, IN creatorId INT)
BEGIN
    UPDATE SciezkiGrup SET modifyTime=CURRENT_TIMESTAMP, modifyUser=creatorId, modifyRemoved=TRUE WHERE idGrupy=groupId AND idCentralaNT=devId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovePathFromUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemovePathFromUser`(IN userId INT, IN devId INT, IN creatorId INT)
BEGIN
    UPDATE SciezkiUzytkownikow SET modifyTime=CURRENT_TIMESTAMP, modifyUser=creatorId, modifyRemoved=TRUE WHERE idUzytkownik=userId AND idCentralaNT=devId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovePilotButton` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemovePilotButton`(IN userId INT, IN accoNtId INT, IN buttonNo INT, IN creatorId INT)
BEGIN
    UPDATE `PrzyciskiPilota` SET modifyTime=NOW(), modifyRemoved=TRUE, modifyUser=creatorId WHERE
        idCentralaNT=accoNtId AND
        nrPrzycisku=buttonNo AND
        idUzytkownik=userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveProgramUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveProgramUser`(IN userId INT, IN creatorId INT)
BEGIN
    UPDATE UzytkownikProgramu SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idUzytkownik=userId;
    UPDATE DostepDoObiektu SET modifyTime=NOW(), modifyRemoved=TRUE WHERE idUzytkownik=userId;
    SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveRFID`(IN userId INT, IN cardNo DOUBLE, IN creatorId INT)
BEGIN
    UPDATE Karta SET modifyRemoved=TRUE, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE nrKarty=cardNo;
    CALL SortRFIDs(userId, creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveTimeWindow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveTimeWindow`(IN twId INT, IN creatorId INT)
BEGIN
    UPDATE OknoCzasowe SET modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP(), modifyRemoved=TRUE WHERE idOknoCzasowe=twId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveUser`(IN userId INT, IN creatorId INT)
BEGIN
    IF userId != 1 THEN
        UPDATE Uzytkownik SET nazwa=SUBSTRING(CONCAT(nazwa, RAND(),userId),1,16), modifyRemoved=TRUE, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE Karta SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE UzytkownikProgramu SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE DostepDoObiektu SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE PrawaDostepuUzytkownikow SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE OpcjeDostepu SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
        UPDATE SciezkiUzytkownikow SET modifyRemoved=TRUE, modifyUser=creatorId,modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveUserFromGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveUserFromGroup`(IN userId INT, IN creatorId INT)
BEGIN
    DECLARE groupId INT DEFAULT NULL;
    START TRANSACTION;
    SELECT idGrupy FROM Uzytkownik WHERE idUzytkownik=userId INTO groupId;
    UPDATE Uzytkownik SET modifyTime=CURRENT_TIMESTAMP(),modifyUser=creatorId,idGrupy=NULL WHERE idUzytkownik=userId;
    REPLACE PrawaDostepuUzytkownikow(idStrefy,idUzytkownik,idKalendarz,P, modifyTime,modifyUser,modifyRemoved) SELECT pd.idStrefy,userId,pd.idKalendarz,pd.P,CURRENT_TIMESTAMP(),creatorId,pd.modifyRemoved FROM PrawaDostepuGrup AS pd WHERE idGrupaUzytkownikow=groupId AND modifyRemoved=FALSE ;
    REPLACE OpcjeDostepu(idStrefa,idUzytkownik,antyPassback,limitDostepu, typLimitu,modifyTime,modifyUser,modifyRemoved) SELECT od.idStrefa,userId,od.antyPassback,od.limitDostepu, od.typLimitu,CURRENT_TIMESTAMP(),creatorId,od.modifyRemoved FROM OpcjeDostepuGrup AS od WHERE od.idGrupaUzytkownikow=groupId AND od.modifyRemoved=FALSE ;
    REPLACE SciezkiUzytkownikow(idUzytkownik,idCentralaNT, idSciezkiPrzejsc, modifyTime, modifyUser) SELECT userId,sg.idCentralaNT, sg.idSciezkiPrzejsc,CURRENT_TIMESTAMP(),creatorId FROM SciezkiGrup AS sg WHERE idGrupy=groupId AND modifyRemoved=FALSE;
    REPLACE user_accont_output(user_id,accont_output_id, modifyTime, modifyUser) SELECT userId,accont_output_id,CURRENT_TIMESTAMP(),creatorId FROM group_accont_output WHERE group_id=groupId AND modifyRemoved=FALSE;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveWeekSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveWeekSchedule`(IN wsId INT, IN creatorId INT)
BEGIN
    UPDATE SchematTygodniowy SET modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP(), modifyRemoved=TRUE WHERE idSchematTygodniowy=wsId;
    UPDATE tygodniekalendarza SET modifyTime=NOW(), modifyRemoved=TRUE WHERE idSchematTygodniowy=wsId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveZone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveZone`(IN zoneid INT, IN creatorId INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE pathId INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT idSciezkiPrzejsc FROM StrefyWSciezce WHERE idStrefa=zoneid GROUP BY idSciezkiPrzejsc;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SELECT 'FAIL ERROR', done; END;
    DECLARE EXIT HANDLER FOR SQLWARNING BEGIN ROLLBACK; SELECT 'FAIL WARNING'; END;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    START TRANSACTION;
    UPDATE Strefa SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idStrefa=zoneid;
    UPDATE PunktyDostepuStrefy SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idStrefa=zoneid;
    UPDATE SciezkiPrzejsc LEFT JOIN StrefyWSciezce AS sws USING (idSciezkiPrzejsc) SET sws.modifyRemoved=TRUE, sws.modifyTime=CURRENT_TIMESTAMP(), sws.modifyUser=creatorId WHERE idStrefa=zoneid;
    UPDATE PrawaDostepuUzytkownikow SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idStrefy=zoneid;
    UPDATE PrawaDostepuGrup SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idStrefy=zoneid;
    UPDATE OpcjeDostepu SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idStrefa=zoneid;
    UPDATE StrefaNaMapie SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idStrefa=zoneid;
    UPDATE WyjscieWskaznikStrefy SET modifyRemoved=TRUE, modifyTime=NOW() WHERE idStrefa=zoneid;
    UPDATE WejscieCentralaNT SET aktywne=FALSE, modifyTime=NOW(), opcjeTypuReakcji=0 WHERE opcjeTypuReakcji=zoneid AND typReakcji IN (2,3,4,5);
    OPEN cur;
    read_loop: LOOP
      FETCH cur INTO pathId;
      IF done THEN LEAVE read_loop;
      END IF;
      CALL SortZoneInPath(pathId,creatorId);
    END LOOP;
    CLOSE cur;
  COMMIT;
  SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveZoneInPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveZoneInPath`(IN pathId INT, IN no INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    UPDATE StrefyWSciezce SET modifyRemoved=TRUE, modifyUser=creatorId WHERE idSciezkiPrzejsc=pathId AND numer=no;
    CALL SortZoneInPath(pathId,creatorId);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveZonePointOnMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveZonePointOnMap`(IN mapId INT, IN zoneId INT, IN removeAt INT, IN creatorId INT)
BEGIN
    UPDATE PunktyStrefyNaMapie SET modifyRemoved=TRUE WHERE idMapa=mapId AND idStrefa=zoneId AND numer=removeAt;
    CALL SortPointsInZone(mapId,zoneId,creatorId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveZonesPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RemoveZonesPath`(IN pathId INT, IN creatorId INT)
BEGIN
    UPDATE SciezkiPrzejsc SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idSciezkiPrzejsc=pathId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetAntipassbackInGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ResetAntipassbackInGroup`(IN zoneId INT, IN groupId INT, IN creatorId INT)
BEGIN
    UPDATE WidokStatusOpcjeDostepu AS wsod
    LEFT JOIN Uzytkownik AS u USING (idUzytkownik)
    SET wsod.resetujAntypassback=TRUE, wsod.modifyTime=NOW()
    WHERE u.idGrupy=groupId AND wsod.idStrefa=zoneId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetDatabaseAutoIncrements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ResetDatabaseAutoIncrements`(IN `dbName` VARCHAR(64))
BEGIN
DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(64);
    DECLARE tables CURSOR FOR SELECT DISTINCT TABLE_NAME FROM information_schema.tables
                                WHERE table_schema=`dbName`
                                AND TABLE_TYPE='BASE TABLE'
                                AND TABLE_NAME!='GlobalStatus'
                                AND TABLE_NAME!='TemporaryStatus';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN tables;
    loadLoop: LOOP
        FETCH tables INTO tableName;
         SET @sql = CONCAT('ALTER TABLE ',`dbName`,'.',`tableName`,' AUTO_INCREMENT=1');
        PREPARE stmt FROM @sql; EXECUTE stmt;
        IF done THEN
            LEAVE loadLoop;
        END IF;
    END LOOP;
    CLOSE tables;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetLimitInGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `ResetLimitInGroup`(IN zoneId INT, IN groupId INT, IN creatorId INT)
BEGIN
    UPDATE WidokStatusOpcjeDostepu AS wsod
    LEFT JOIN Uzytkownik AS u USING (idUzytkownik)
    SET wsod.resetujLimit=TRUE,wsod.modifyTime=NOW()
    WHERE u.idGrupy=groupId AND wsod.idStrefa=zoneId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RevertDatabase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RevertDatabase`(IN nazwaBazyZrodlowej VARCHAR(50), IN creatorId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        SET FOREIGN_KEY_CHECKS=1;
        ROLLBACK;
        SELECT CONCAT('FAIL ERROR ', @stage);
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=NULL'); PREPARE stmt FROM @sql;EXECUTE stmt;
    END;
    START TRANSACTION;
    SET @userLock = 1;
    SET @ntLock = 1;
    SET @sql = CONCAT('SELECT commitInProgress FROM ',nazwaBazyZrodlowej,'.GlobalStatus INTO @userLock'); PREPARE stmt FROM @sql;EXECUTE stmt;
    SET @sql = CONCAT('SELECT COUNT(idCentralaNT) FROM ',nazwaBazyZrodlowej,'.CentralaNT WHERE konfiguracjaJestGenerowana=TRUE INTO @ntLock');PREPARE stmt FROM @sql;EXECUTE stmt;
    IF @userLock IS NULL AND @ntLock=0 THEN
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=', creatorId); PREPARE stmt FROM @sql;EXECUTE stmt;
        COMMIT;
        START TRANSACTION;
        SELECT database() INTO @currentDb;
        CALL ClearDatabase(@currentDb);
        SET FOREIGN_KEY_CHECKS=0;
        CALL LoadDatabaseFromTo(nazwaBazyZrodlowej, @currentDb);
        SET FOREIGN_KEY_CHECKS=1;
        SET @sql = CONCAT('UPDATE ',nazwaBazyZrodlowej,'.GlobalStatus SET commitInProgress=NULL'); PREPARE stmt FROM @sql;EXECUTE stmt;
        UPDATE TemporaryStatus SET lockedBy=NULL;
        COMMIT;
        START TRANSACTION;
        COMMIT;
        SELECT 'OK';
    ELSE
        SELECT CONCAT('FAIL COMMIT ',@userLock);
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RevokeAccessToObject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RevokeAccessToObject`(IN userId INT, IN objectId INT, IN creatorId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN SELECT 'FAIL ERROR'; END;
    UPDATE DostepDoObiektu SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idObiekt=objectId AND idUzytkownik=userId;
    SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RevokePrivilagesForGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RevokePrivilagesForGroup`(IN zoneId INT, IN groupId INT, IN creatorId INT)
BEGIN
    UPDATE PrawaDostepuGrup SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idStrefy=zoneId AND idGrupaUzytkownikow=groupId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RevokePrivilagesForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `RevokePrivilagesForUser`(IN zoneId INT, IN userId INT, IN creatorId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN SELECT 'FAIL ERROR'; END;
    UPDATE PrawaDostepuUzytkownikow SET modifyTime=CURRENT_TIMESTAMP(), modifyUser=creatorId, modifyRemoved=TRUE WHERE idStrefy=zoneId AND idUzytkownik=userId;
    SELECT 'OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetAccessOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SetAccessOptions`(IN userId INT, IN zoneId INT, IN creatorId INT)
BEGIN
    REPLACE OpcjeDostepu(idUzytkownik,idStrefa, modifyTime, modifyUser, modifyRemoved) VALUES(userId,zoneId,CURRENT_TIMESTAMP(), creatorId, FALSE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SortPointsInMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SortPointsInMap`(IN mapId INT, IN creatorId INT)
BEGIN
    DECLARE idm INT;
    DECLARE num INT;
    DECLARE rem INT;
    DECLARE done INT;
    DECLARE cntr INT;
    DECLARE zinp CURSOR FOR SELECT idMapa,numer,modifyRemoved FROM PunktyMapyNaMapie WHERE idMapa=mapId ORDER BY modifyRemoved,numer ASC FOR UPDATE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN zinp;
    SET cntr=100;
    sort_loop: LOOP
        FETCH zinp INTO idm,num,rem;
        IF done THEN
            LEAVE sort_loop;
        END IF;
        UPDATE PunktyMapyNaMapie SET numer=cntr, modifyTime=NOW() WHERE idMapa=mapId AND numer=num;
        SET cntr=cntr+1;
    END LOOP;
    CLOSE zinp;
    UPDATE PunktyMapyNaMapie SET numer=numer-100, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idMapa=mapId AND numer >= 100 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SortPointsInZone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SortPointsInZone`(IN mapId INT, IN zoneId INT,  IN creatorId INT)
BEGIN
    DECLARE idm INT;
    DECLARE ids INT;
    DECLARE num INT;
    DECLARE rem INT;
    DECLARE done INT;
    DECLARE cntr INT;
    DECLARE zinp CURSOR FOR SELECT idMapa,idStrefa,numer,modifyRemoved FROM PunktyStrefyNaMapie WHERE idMapa=mapId AND idStrefa=zoneId ORDER BY modifyRemoved,numer ASC FOR UPDATE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN zinp;
    SET cntr=100;
    sort_loop: LOOP
        FETCH zinp INTO idm,ids,num,rem;
        IF done THEN
            LEAVE sort_loop;
        END IF;
        UPDATE PunktyStrefyNaMapie SET numer=cntr, modifyTime=NOW() WHERE idMapa=mapId AND idStrefa=zoneId AND numer=num;
        SET cntr=cntr+1;
    END LOOP;
    CLOSE zinp;
    UPDATE PunktyStrefyNaMapie SET numer=numer-100, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idMapa=mapId AND idStrefa=zoneId AND numer >= 100 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SortRFIDs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SortRFIDs`(IN userId INT, IN creatorId INT)
BEGIN
    DECLARE ids DOUBLE;
    DECLARE num INT;
    DECLARE rem INT;
    DECLARE done INT;
    DECLARE cntr INT;
    DECLARE zinp CURSOR FOR SELECT nrKarty,priorytet,modifyRemoved FROM Karta WHERE idUzytkownik=userId ORDER BY modifyRemoved,priorytet ASC FOR UPDATE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN zinp;
    SET cntr=100;
    sort_loop: LOOP
        FETCH zinp INTO ids,num,rem;
        IF done THEN
            LEAVE sort_loop;
        END IF;
        UPDATE Karta SET priorytet=cntr WHERE nrKarty=ids;
        SET cntr=cntr+1;
    END LOOP;
    CLOSE zinp;
    UPDATE Karta SET priorytet=priorytet-100, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idUzytkownik=userId AND priorytet >= 100 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SortZoneInPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SortZoneInPath`(IN pathId INT, IN creatorId INT)
BEGIN
    DECLARE ids INT;
    DECLARE num INT;
    DECLARE rem INT;
    DECLARE done INT;
    DECLARE cntr INT;
    DECLARE zinp CURSOR FOR SELECT idStrefa,numer,modifyRemoved FROM StrefyWSciezce WHERE idSciezkiPrzejsc=pathId ORDER BY modifyRemoved,numer ASC FOR UPDATE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN zinp;
    SET cntr=100;
    sort_loop: LOOP
        FETCH zinp INTO ids,num,rem;
        IF done THEN
            LEAVE sort_loop;
        END IF;
        UPDATE StrefyWSciezce SET numer=cntr WHERE idSciezkiPrzejsc=pathId AND numer=num;
        SET cntr=cntr+1;
    END LOOP;
    CLOSE zinp;
    UPDATE StrefyWSciezce SET numer=numer-100, modifyUser=creatorId, modifyTime=CURRENT_TIMESTAMP() WHERE idSciezkiPrzejsc=pathId AND numer >= 100 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SwapRFIDPriority` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SwapRFIDPriority`(IN srcNo DOUBLE, IN destNo DOUBLE, IN creatorId INT)
BEGIN
    DECLARE srcPrio DOUBLE;
    DECLARE destPrio DOUBLE;
    START TRANSACTION;
    SELECT priorytet FROM Karta WHERE nrKarty=srcNo INTO srcPrio;
    SELECT priorytet FROM Karta WHERE nrKarty=destNo INTO destPrio;
    UPDATE Karta SET priorytet=destPrio, modifyTime=NOW() WHERE nrKarty=srcNo;
    UPDATE Karta SET priorytet=srcPrio, modifyTime=NOW() WHERE nrKarty=destNo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SwapZoneInPath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`accoweb`@`%` PROCEDURE `SwapZoneInPath`(IN pathId INT, IN zoneNo INT, IN newZoneNo INT, IN creatorId INT)
BEGIN
    START TRANSACTION;
    UPDATE StrefyWSciezce SET numer=-1, modifyTime=NOW() WHERE idSciezkiPrzejsc=pathId AND numer=zoneNo;
    UPDATE StrefyWSciezce SET numer=zoneNo, modifyTime=NOW() WHERE idSciezkiPrzejsc=pathId AND numer=newZoneNo;
    UPDATE StrefyWSciezce SET numer=newZoneNo, modifyTime=NOW() WHERE idSciezkiPrzejsc=pathId AND numer=-1;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `accoDb_temporary`
--

USE `accoDb_temporary`;

--
-- Final view structure for view `CentralaNTUzytkownicy`
--

/*!50001 DROP TABLE IF EXISTS `CentralaNTUzytkownicy`*/;
/*!50001 DROP VIEW IF EXISTS `CentralaNTUzytkownicy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CentralaNTUzytkownicy` AS select distinct `k`.`idCentralaNT` AS `idCentralaNT`,`u`.`idUzytkownik` AS `iduzytkownik` from ((((`Uzytkownik` `u` left join `PrawaDostepu` `pdu` on((`pdu`.`idUzytkownik` = `u`.`idUzytkownik`))) left join `PunktyDostepuStrefy` `pds` on(((`pds`.`idStrefa` = `pdu`.`idStrefa`) and (`pds`.`modifyRemoved` <> 1)))) left join `Kontroler` `k` on((`k`.`idKontroler` = `pds`.`idKontroler`))) left join `GrupaUzytkownikow` `g` on((`u`.`idGrupy` = `g`.`idGrupaUzytkownikow`))) where ((`u`.`aktywny` = 1) and (`u`.`usuniety` = 0) and (`k`.`idCentralaNT` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PrawaDostepu`
--

/*!50001 DROP TABLE IF EXISTS `PrawaDostepu`*/;
/*!50001 DROP VIEW IF EXISTS `PrawaDostepu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PrawaDostepu` AS select `pdu`.`idStrefy` AS `idStrefa`,`pdu`.`idUzytkownik` AS `idUzytkownik`,`pdu`.`idKalendarz` AS `idKalendarz`,`pdu`.`P` AS `P` from `PrawaDostepuUzytkownikow` `pdu` where (`pdu`.`modifyRemoved` <> 1) union all select `pdg`.`idStrefy` AS `idStrefa`,`u`.`idUzytkownik` AS `idUzytkownik`,`pdg`.`idKalendarz` AS `idKalendarz`,`pdg`.`P` AS `P` from (`PrawaDostepuGrup` `pdg` left join `Uzytkownik` `u` on((`u`.`idGrupy` = `pdg`.`idGrupaUzytkownikow`))) where (`pdg`.`modifyRemoved` <> 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokGlobalStatus`
--

/*!50001 DROP TABLE IF EXISTS `WidokGlobalStatus`*/;
/*!50001 DROP VIEW IF EXISTS `WidokGlobalStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokGlobalStatus` AS select `accoDb`.`GlobalStatus`.`commitInProgress` AS `commitInProgress`,`accoDb`.`GlobalStatus`.`backupInProgress` AS `backupInProgress`,`accoDb`.`GlobalStatus`.`lockedBy` AS `lockedBy` from `accoDb`.`GlobalStatus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokGrupowyRozszerzonyStanuKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokGrupowyRozszerzonyStanuKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokGrupowyRozszerzonyStanuKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokGrupowyRozszerzonyStanuKontrolera` AS select `WidokGrupowyStanuKontrolera`.`idKontroler` AS `idKontroler`,`WidokGrupowyStanuKontrolera`.`stanKontrolera` AS `stanKontrolera`,`WidokGrupowyStanuKontrolera`.`stanKontroleraNP` AS `stanKontroleraNP`,`WidokGrupowyStanuKontrolera`.`stanZasilania` AS `stanZasilania`,`WidokGrupowyStanuKontrolera`.`stanZasilaniaNP` AS `stanZasilaniaNP`,`WidokGrupowyStanuKontrolera`.`stanTerminali` AS `stanTerminali`,`WidokGrupowyStanuKontrolera`.`stanTerminaliNP` AS `stanTerminaliNP`,`WidokGrupowyStanuKontrolera`.`stanPrzejscia` AS `stanPrzejscia`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaNP` AS `stanPrzejsciaNP`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaDOD` AS `stanPrzejsciaDOD`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaDODNP` AS `stanPrzejsciaDODNP`,`WidokGrupowyStanuKontrolera`.`drzwiOtwarte` AS `drzwiOtwarte`,`WidokGrupowyStanuKontrolera`.`stanDrzwi` AS `stanDrzwi`,greatest(`WidokGrupowyStanuKontrolera`.`stanKontrolera`,`WidokGrupowyStanuKontrolera`.`stanZasilania`,`WidokGrupowyStanuKontrolera`.`stanTerminali`,`WidokGrupowyStanuKontrolera`.`stanPrzejscia`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaDOD`) AS `stanGlobalny`,greatest(`WidokGrupowyStanuKontrolera`.`stanKontroleraNP`,`WidokGrupowyStanuKontrolera`.`stanZasilaniaNP`,`WidokGrupowyStanuKontrolera`.`stanTerminaliNP`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaNP`,`WidokGrupowyStanuKontrolera`.`stanPrzejsciaDODNP`) AS `stanGlobalnyNP` from `accoDb_temporary`.`WidokGrupowyStanuKontrolera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokGrupowyStanuKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokGrupowyStanuKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokGrupowyStanuKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokGrupowyStanuKontrolera` AS select `WidokSzczegolowyStanuKontrolera`.`idKontroler` AS `idKontroler`,if((`WidokSzczegolowyStanuKontrolera`.`sabotazModulu` > 0),3,if((`WidokSzczegolowyStanuKontrolera`.`awariaZegara` > 0),2,0)) AS `stanKontrolera`,((`WidokSzczegolowyStanuKontrolera`.`sabotazModulu` = 1) or (`WidokSzczegolowyStanuKontrolera`.`awariaZegara` = 1)) AS `stanKontroleraNP`,if(((`WidokSzczegolowyStanuKontrolera`.`awariaZasilaniaAC` > 0) or (`WidokSzczegolowyStanuKontrolera`.`rozladowanyAkumulator` > 0) or (`WidokSzczegolowyStanuKontrolera`.`brakAkumulatora` > 0)),3,0) AS `stanZasilania`,((`WidokSzczegolowyStanuKontrolera`.`awariaZasilaniaAC` = 1) or (`WidokSzczegolowyStanuKontrolera`.`rozladowanyAkumulator` = 1) or (`WidokSzczegolowyStanuKontrolera`.`brakAkumulatora` = 1)) AS `stanZasilaniaNP`,if(((`WidokSzczegolowyStanuKontrolera`.`probaSkanowania` > 0) or (`WidokSzczegolowyStanuKontrolera`.`brakEkspanderaA` > 0) or (`WidokSzczegolowyStanuKontrolera`.`brakEkspanderaB` > 0) or (`WidokSzczegolowyStanuKontrolera`.`sabotazEkspanderaA` > 0) or (`WidokSzczegolowyStanuKontrolera`.`sabotazEkspanderaB` > 0)),3,0) AS `stanTerminali`,((`WidokSzczegolowyStanuKontrolera`.`probaSkanowania` = 1) or (`WidokSzczegolowyStanuKontrolera`.`brakEkspanderaA` = 1) or (`WidokSzczegolowyStanuKontrolera`.`brakEkspanderaB` = 1) or (`WidokSzczegolowyStanuKontrolera`.`sabotazEkspanderaA` = 1) or (`WidokSzczegolowyStanuKontrolera`.`sabotazEkspanderaB` = 1)) AS `stanTerminaliNP`,if((`WidokSzczegolowyStanuKontrolera`.`wejscieSilowe` > 0),3,if((`WidokSzczegolowyStanuKontrolera`.`otwarteDrzwi` > 0),1,0)) AS `stanPrzejscia`,(`WidokSzczegolowyStanuKontrolera`.`wejscieSilowe` = 1) AS `stanPrzejsciaNP`,if((`WidokSzczegolowyStanuKontrolera`.`dlugoOtwarteDrzwi` > 0),2,0) AS `stanPrzejsciaDOD`,(`WidokSzczegolowyStanuKontrolera`.`dlugoOtwarteDrzwi` = 1) AS `stanPrzejsciaDODNP`,(`WidokSzczegolowyStanuKontrolera`.`otwarteDrzwi` & 1) AS `drzwiOtwarte`,if((`WidokSzczegolowyStanuKontrolera`.`przejscieZblokowane` & 1),2,if((`WidokSzczegolowyStanuKontrolera`.`przejscieOdblokowane` & 1),1,0)) AS `stanDrzwi` from `accoDb_temporary`.`WidokSzczegolowyStanuKontrolera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTAwarie`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTAwarie`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTAwarie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTAwarie` AS select `accoDb`.`INTAwarie`.`idx` AS `idx`,`accoDb`.`INTAwarie`.`idEthm` AS `idEthm`,`accoDb`.`INTAwarie`.`tekst` AS `tekst`,`accoDb`.`INTAwarie`.`opis` AS `opis`,`accoDb`.`INTAwarie`.`pamiec` AS `pamiec`,`accoDb`.`INTAwarie`.`modifyTime` AS `modifyTime` from `accoDb`.`INTAwarie` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTEkspandery`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTEkspandery`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTEkspandery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTEkspandery` AS select `accoDb`.`INTEkspandery`.`id` AS `id`,`accoDb`.`INTEkspandery`.`numer` AS `numer`,`accoDb`.`INTEkspandery`.`idEthm` AS `idEthm`,`accoDb`.`INTEkspandery`.`wlaczony` AS `wlaczony`,`accoDb`.`INTEkspandery`.`typ` AS `typ`,`accoDb`.`INTEkspandery`.`nazwa` AS `nazwa`,`accoDb`.`INTEkspandery`.`modifyTime` AS `modifyTime` from `accoDb`.`INTEkspandery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTOpisZdarzenia`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTOpisZdarzenia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTOpisZdarzenia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTOpisZdarzenia` AS select `accoDb`.`INTOpisZdarzenia`.`id` AS `id`,`accoDb`.`INTOpisZdarzenia`.`jezyk` AS `jezyk`,`accoDb`.`INTOpisZdarzenia`.`opis_dlugi` AS `opis_dlugi`,`accoDb`.`INTOpisZdarzenia`.`kod` AS `kod`,`accoDb`.`INTOpisZdarzenia`.`typ` AS `typ`,`accoDb`.`INTOpisZdarzenia`.`typ2` AS `typ2`,`accoDb`.`INTOpisZdarzenia`.`tekst` AS `tekst` from `accoDb`.`INTOpisZdarzenia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTStrefy`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTStrefy`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTStrefy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTStrefy` AS select `accoDb`.`INTStrefy`.`idStrefyIntegra` AS `idStrefyIntegra`,`accoDb`.`INTStrefy`.`numer` AS `numer`,`accoDb`.`INTStrefy`.`idEthm` AS `idEthm`,`accoDb`.`INTStrefy`.`idPartycjiIntegry` AS `idPartycjiIntegry`,`accoDb`.`INTStrefy`.`wlaczony` AS `wlaczony`,`accoDb`.`INTStrefy`.`typ` AS `typ`,`accoDb`.`INTStrefy`.`nazwa` AS `nazwa`,`accoDb`.`INTStrefy`.`stan` AS `stan`,`accoDb`.`INTStrefy`.`modifyTime` AS `modifyTime` from `accoDb`.`INTStrefy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTUzytkownicy`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTUzytkownicy`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTUzytkownicy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTUzytkownicy` AS select `accoDb`.`INTUzytkownicy`.`numer` AS `numer`,`accoDb`.`INTUzytkownicy`.`idEthm` AS `idEthm`,`accoDb`.`INTUzytkownicy`.`wlaczony` AS `wlaczony`,`accoDb`.`INTUzytkownicy`.`nazwa` AS `nazwa`,`accoDb`.`INTUzytkownicy`.`modifyTime` AS `modifyTime` from `accoDb`.`INTUzytkownicy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTWejscia`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTWejscia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTWejscia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTWejscia` AS select `accoDb`.`INTWejscia`.`idWejscia` AS `idWejscia`,`accoDb`.`INTWejscia`.`idEthm` AS `idEthm`,`accoDb`.`INTWejscia`.`numer` AS `numer`,`accoDb`.`INTWejscia`.`stan` AS `stan`,`accoDb`.`INTWejscia`.`idStrefyIntegra` AS `idStrefyIntegra`,`accoDb`.`INTWejscia`.`typ` AS `typ`,`accoDb`.`INTWejscia`.`wlaczony` AS `wlaczony`,`accoDb`.`INTWejscia`.`nazwa` AS `nazwa`,`accoDb`.`INTWejscia`.`modifyTime` AS `modifyTime` from `accoDb`.`INTWejscia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTWyjscia`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTWyjscia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTWyjscia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTWyjscia` AS select `accoDb`.`INTWyjscia`.`idWyjscia` AS `idWyjscia`,`accoDb`.`INTWyjscia`.`idEthm` AS `idEthm`,`accoDb`.`INTWyjscia`.`numer` AS `numer`,`accoDb`.`INTWyjscia`.`stan` AS `stan`,`accoDb`.`INTWyjscia`.`typ` AS `typ`,`accoDb`.`INTWyjscia`.`wlaczony` AS `wlaczony`,`accoDb`.`INTWyjscia`.`nazwa` AS `nazwa`,`accoDb`.`INTWyjscia`.`modifyTime` AS `modifyTime` from `accoDb`.`INTWyjscia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokINTZdarzenie`
--

/*!50001 DROP TABLE IF EXISTS `WidokINTZdarzenie`*/;
/*!50001 DROP VIEW IF EXISTS `WidokINTZdarzenie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokINTZdarzenie` AS select `accoDb`.`INTZdarzenie`.`Id` AS `Id`,`accoDb`.`INTZdarzenie`.`idObiekt` AS `idObiekt`,`accoDb`.`INTZdarzenie`.`idCentrala` AS `idCentrala`,`accoDb`.`INTZdarzenie`.`idEthm` AS `idEthm`,`accoDb`.`INTZdarzenie`.`nazwaObiektu` AS `nazwaObiektu`,`accoDb`.`INTZdarzenie`.`nazwaCentrali` AS `nazwaCentrali`,`accoDb`.`INTZdarzenie`.`nazwaEthm` AS `nazwaEthm`,`accoDb`.`INTZdarzenie`.`indexIntegra` AS `indexIntegra`,`accoDb`.`INTZdarzenie`.`czas` AS `czas`,`accoDb`.`INTZdarzenie`.`typ` AS `typ`,`accoDb`.`INTZdarzenie`.`kod` AS `kod`,`accoDb`.`INTZdarzenie`.`typA` AS `typA`,`accoDb`.`INTZdarzenie`.`numerA` AS `numerA`,`accoDb`.`INTZdarzenie`.`tekstA` AS `tekstA`,`accoDb`.`INTZdarzenie`.`typB` AS `typB`,`accoDb`.`INTZdarzenie`.`numerB` AS `numerB`,`accoDb`.`INTZdarzenie`.`tekstB` AS `tekstB`,`accoDb`.`INTZdarzenie`.`stacja1` AS `stacja1`,`accoDb`.`INTZdarzenie`.`stacja2` AS `stacja2`,`accoDb`.`INTZdarzenie`.`bytes` AS `bytes` from `accoDb`.`INTZdarzenie` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStanowWejscKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokStanowWejscKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStanowWejscKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStanowWejscKontrolera` AS select `WidokStatusWejscia`.`idKontroler` AS `idKontroler`,group_concat(`WidokStatusWejscia`.`status` separator ',') AS `stanWejsc` from `accoDb_temporary`.`WidokStatusWejscia` group by `WidokStatusWejscia`.`idKontroler` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStanowWyjscKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokStanowWyjscKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStanowWyjscKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStanowWyjscKontrolera` AS select `WidokStatusWyjscia`.`idKontroler` AS `idKontroler`,group_concat(`WidokStatusWyjscia`.`wyjscieZalaczone` separator ',') AS `stanWyjsc` from `accoDb_temporary`.`WidokStatusWyjscia` group by `WidokStatusWyjscia`.`idKontroler` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStanuKontroleraNaMapie`
--

/*!50001 DROP TABLE IF EXISTS `WidokStanuKontroleraNaMapie`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStanuKontroleraNaMapie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStanuKontroleraNaMapie` AS select `knm`.`idMapa` AS `idMapa`,`knm`.`idKontroler` AS `idKontroler`,`wgrsk`.`stanKontrolera` AS `stanKontrolera`,`wgrsk`.`stanKontroleraNP` AS `stanKontroleraNP`,`wssk`.`buforZdarzenZapelniony50` AS `buforZdarzenZapelniony50`,`wssk`.`buforZdarzenZapelniony90` AS `buforZdarzenZapelniony90`,`wgrsk`.`stanZasilania` AS `stanZasilania`,`wgrsk`.`stanZasilaniaNP` AS `stanZasilaniaNP`,`wgrsk`.`stanTerminali` AS `stanTerminali`,`wgrsk`.`stanTerminaliNP` AS `stanTerminaliNP`,`wgrsk`.`stanPrzejscia` AS `stanPrzejscia`,`wgrsk`.`stanPrzejsciaNP` AS `stanPrzejsciaNP`,`wgrsk`.`stanPrzejsciaDOD` AS `stanPrzejsciaDOD`,`wgrsk`.`stanPrzejsciaDODNP` AS `stanPrzejsciaDODNP`,`wgrsk`.`drzwiOtwarte` AS `drzwiOtwarte`,`wgrsk`.`stanDrzwi` AS `stanDrzwi`,`wgrsk`.`stanGlobalny` AS `stanGlobalny`,`wgrsk`.`stanGlobalnyNP` AS `stanGlobalnyNP`,`wssk`.`statusPrzekaznika` AS `statusPrzekaznika`,`wssk`.`sabotazModulu` AS `sabotazModulu`,`wssk`.`awariaZegara` AS `awariaZegara`,`wssk`.`awariaZasilaniaAC` AS `awariaZasilaniaAC`,`wssk`.`rozladowanyAkumulator` AS `rozladowanyAkumulator`,`wssk`.`brakAkumulatora` AS `brakAkumulatora`,`wssk`.`probaSkanowania` AS `probaSkanowania`,`wssk`.`brakEkspanderaA` AS `brakEkspanderaA`,`wssk`.`brakEkspanderaB` AS `brakEkspanderaB`,`wssk`.`sabotazEkspanderaA` AS `sabotazEkspanderaA`,`wssk`.`sabotazEkspanderaB` AS `sabotazEkspanderaB`,`wssk`.`trybEdycjiDanych` AS `trybEdycjiDanych`,`wssk`.`otwarteDrzwi` AS `otwarteDrzwi`,`wssk`.`dlugoOtwarteDrzwi` AS `dlugoOtwarteDrzwi`,`wssk`.`przejscieOdblokowane` AS `przejscieOdblokowane`,`wssk`.`przejscieZblokowane` AS `przejscieZblokowane`,`wssk`.`wejscieSilowe` AS `wejscieSilowe`,`wssk`.`stanWejsc` AS `stanWejsc`,`wssk`.`stanWyjsc` AS `stanWyjsc` from ((`accoDb_temporary`.`KontrolerNaMapie` `knm` left join `accoDb_temporary`.`WidokGrupowyRozszerzonyStanuKontrolera` `wgrsk` on((`wgrsk`.`idKontroler` = `knm`.`idKontroler`))) left join `accoDb_temporary`.`WidokSzczegolowyStanuKontrolera` `wssk` on((`wssk`.`idKontroler` = `knm`.`idKontroler`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStanuMapy`
--

/*!50001 DROP TABLE IF EXISTS `WidokStanuMapy`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStanuMapy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStanuMapy` AS select `knm`.`idMapa` AS `idMapa`,max(`wgrsk`.`stanGlobalny`) AS `stanGlobalny`,max(`wgrsk`.`stanGlobalnyNP`) AS `stanGlobalnyNP` from (`accoDb_temporary`.`KontrolerNaMapie` `knm` left join `accoDb_temporary`.`WidokGrupowyRozszerzonyStanuKontrolera` `wgrsk` on((`wgrsk`.`idKontroler` = `knm`.`idKontroler`))) group by `knm`.`idMapa` order by `knm`.`idMapa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusCentraliNT`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusCentraliNT`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusCentraliNT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusCentraliNT` AS select `accoDb`.`StatusCentraliNT`.`idCentraliNT` AS `idCentraliNT`,`accoDb`.`StatusCentraliNT`.`online` AS `online`,`accoDb`.`StatusCentraliNT`.`faultSD` AS `faultSD`,`accoDb`.`StatusCentraliNT`.`faultAUX` AS `faultAUX`,`accoDb`.`StatusCentraliNT`.`faultEX` AS `faultEX`,`accoDb`.`StatusCentraliNT`.`faultPrzeciazenie` AS `faultPrzeciazenie`,`accoDb`.`StatusCentraliNT`.`faultAC` AS `faultAC`,`accoDb`.`StatusCentraliNT`.`faultBrakAku` AS `faultBrakAku`,`accoDb`.`StatusCentraliNT`.`faultSlabyAku` AS `faultSlabyAku`,`accoDb`.`StatusCentraliNT`.`pradZasilacza` AS `pradZasilacza`,`accoDb`.`StatusCentraliNT`.`napiecieZasilacza` AS `napiecieZasilacza`,`accoDb`.`StatusCentraliNT`.`outputsState` AS `outputsState`,`accoDb`.`StatusCentraliNT`.`inputsState` AS `inputsState`,`accoDb`.`StatusCentraliNT`.`kodStatusu` AS `kodStatusu`,`accoDb`.`StatusCentraliNT`.`progress` AS `progress`,`accoDb`.`StatusCentraliNT`.`adresIP` AS `adresIP`,`accoDb`.`StatusCentraliNT`.`wersja` AS `wersja`,`accoDb`.`StatusCentraliNT`.`dataWersji` AS `dataWersji`,`accoDb`.`StatusCentraliNT`.`opisWersji` AS `opisWersji`,`accoDb`.`StatusCentraliNT`.`typ` AS `typ`,`accoDb`.`StatusCentraliNT`.`nieobslugiwanaWersja` AS `nieobslugiwanaWersja`,`accoDb`.`StatusCentraliNT`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusCentraliNT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusEkspanderow`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusEkspanderow`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusEkspanderow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusEkspanderow` AS select `accoDb`.`StatusEkspanderow`.`idKontroler` AS `idKontroler`,`accoDb`.`StatusEkspanderow`.`probaSkanowania` AS `probaSkanowania`,`accoDb`.`StatusEkspanderow`.`brakEkspanderaA` AS `brakEkspanderaA`,`accoDb`.`StatusEkspanderow`.`brakEkspanderaB` AS `brakEkspanderaB`,`accoDb`.`StatusEkspanderow`.`sabotazEkspanderaA` AS `sabotazEkspanderaA`,`accoDb`.`StatusEkspanderow`.`sabotazEkspanderaB` AS `sabotazEkspanderaB`,`accoDb`.`StatusEkspanderow`.`trybEdycjiDanych` AS `trybEdycjiDanych`,`accoDb`.`StatusEkspanderow`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusEkspanderow` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusEthm`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusEthm`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusEthm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusEthm` AS select `accoDb`.`StatusEthm`.`idEthm` AS `idEthm`,`accoDb`.`StatusEthm`.`polaczenie` AS `polaczenie`,`accoDb`.`StatusEthm`.`kluczKodowania` AS `kluczKodowania`,`accoDb`.`StatusEthm`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusEthm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusKontrolera` AS select `accoDb`.`StatusKontrolera`.`idKontroler` AS `idKontroler`,`accoDb`.`StatusKontrolera`.`napiecieZasilania` AS `napiecieZasilania`,`accoDb`.`StatusKontrolera`.`sabotazModulu` AS `sabotazModulu`,`accoDb`.`StatusKontrolera`.`awariaZegara` AS `awariaZegara`,`accoDb`.`StatusKontrolera`.`buforZdarzenZapelniony50` AS `buforZdarzenZapelniony50`,`accoDb`.`StatusKontrolera`.`buforZdarzenZapelniony90` AS `buforZdarzenZapelniony90`,`accoDb`.`StatusKontrolera`.`awariaZasilaniaAC` AS `awariaZasilaniaAC`,`accoDb`.`StatusKontrolera`.`rozladowanyAkumulator` AS `rozladowanyAkumulator`,`accoDb`.`StatusKontrolera`.`brakAkumulatora` AS `brakAkumulatora`,`accoDb`.`StatusKontrolera`.`statusPrzekaznika` AS `statusPrzekaznika`,`accoDb`.`StatusKontrolera`.`jakoscKomunikacji` AS `jakoscKomunikacji`,`accoDb`.`StatusKontrolera`.`dataKompilacji` AS `dataKompilacji`,`accoDb`.`StatusKontrolera`.`wersja` AS `wersja`,`accoDb`.`StatusKontrolera`.`jezyk` AS `jezyk`,`accoDb`.`StatusKontrolera`.`numerSieci` AS `numerSieci`,`accoDb`.`StatusKontrolera`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusKontrolera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusOpcjeDostepu`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusOpcjeDostepu`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusOpcjeDostepu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusOpcjeDostepu` AS select `accoDb`.`StatusOpcjeDostepu`.`idUzytkownik` AS `idUzytkownik`,`accoDb`.`StatusOpcjeDostepu`.`idStrefa` AS `idStrefa`,`accoDb`.`StatusOpcjeDostepu`.`wykorzystanyLimit` AS `wykorzystanyLimit`,`accoDb`.`StatusOpcjeDostepu`.`resetujLimit` AS `resetujLimit`,`accoDb`.`StatusOpcjeDostepu`.`resetujAntypassback` AS `resetujAntypassback`,`accoDb`.`StatusOpcjeDostepu`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusOpcjeDostepu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusPrzejscia`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusPrzejscia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusPrzejscia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusPrzejscia` AS select `accoDb`.`StatusPrzejscia`.`idPrzejscie` AS `idPrzejscie`,`accoDb`.`StatusPrzejscia`.`otwarteDrzwi` AS `otwarteDrzwi`,`accoDb`.`StatusPrzejscia`.`dlugoOtwarteDrzwi` AS `dlugoOtwarteDrzwi`,`accoDb`.`StatusPrzejscia`.`przejscieOdblokowane` AS `przejscieOdblokowane`,`accoDb`.`StatusPrzejscia`.`przejscieZblokowane` AS `przejscieZblokowane`,`accoDb`.`StatusPrzejscia`.`wejscieSilowe` AS `wejscieSilowe`,`accoDb`.`StatusPrzejscia`.`zablokowanieAlarmowe` AS `zablokowanieAlarmowe`,`accoDb`.`StatusPrzejscia`.`odblokowaniePozarowe` AS `odblokowaniePozarowe`,`accoDb`.`StatusPrzejscia`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusPrzejscia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusStrefa`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusStrefa`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusStrefa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusStrefa` AS select `accoDb`.`StatusStrefa`.`idStrefa` AS `idStrefa`,`accoDb`.`StatusStrefa`.`stan` AS `stan`,`accoDb`.`StatusStrefa`.`liczbaOsobWStrefie` AS `liczbaOsobWStrefie`,`accoDb`.`StatusStrefa`.`resetujLicznik` AS `resetujLicznik`,`accoDb`.`StatusStrefa`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusStrefa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusUzytkownik`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusUzytkownik`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusUzytkownik`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusUzytkownik` AS select `accoDb`.`StatusUzytkownik`.`idUzytkownik` AS `idUzytkownik`,`accoDb`.`StatusUzytkownik`.`aktualnaStrefa` AS `aktualnaStrefa`,`accoDb`.`StatusUzytkownik`.`indexWSciezce` AS `indexWSciezce`,`accoDb`.`StatusUzytkownik`.`resetujIndexWSciezce` AS `resetujIndexWSciezce`,`accoDb`.`StatusUzytkownik`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusUzytkownik` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusWejscia`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusWejscia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusWejscia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusWejscia` AS select `accoDb`.`StatusWejscia`.`idKontroler` AS `idKontroler`,`accoDb`.`StatusWejscia`.`numer` AS `numer`,`accoDb`.`StatusWejscia`.`status` AS `status`,`accoDb`.`StatusWejscia`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusWejscia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokStatusWyjscia`
--

/*!50001 DROP TABLE IF EXISTS `WidokStatusWyjscia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokStatusWyjscia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokStatusWyjscia` AS select `accoDb`.`StatusWyjscia`.`idKontroler` AS `idKontroler`,`accoDb`.`StatusWyjscia`.`numer` AS `numer`,`accoDb`.`StatusWyjscia`.`wyjscieZalaczone` AS `wyjscieZalaczone`,`accoDb`.`StatusWyjscia`.`modifyTime` AS `modifyTime` from `accoDb`.`StatusWyjscia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokSzczegolowyStanuKontrolera`
--

/*!50001 DROP TABLE IF EXISTS `WidokSzczegolowyStanuKontrolera`*/;
/*!50001 DROP VIEW IF EXISTS `WidokSzczegolowyStanuKontrolera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokSzczegolowyStanuKontrolera` AS select `k`.`idKontroler` AS `idKontroler`,`sk`.`sabotazModulu` AS `sabotazModulu`,`sk`.`awariaZegara` AS `awariaZegara`,`sk`.`buforZdarzenZapelniony50` AS `buforZdarzenZapelniony50`,`sk`.`buforZdarzenZapelniony90` AS `buforZdarzenZapelniony90`,`sk`.`awariaZasilaniaAC` AS `awariaZasilaniaAC`,`sk`.`rozladowanyAkumulator` AS `rozladowanyAkumulator`,`sk`.`brakAkumulatora` AS `brakAkumulatora`,`sk`.`statusPrzekaznika` AS `statusPrzekaznika`,`se`.`probaSkanowania` AS `probaSkanowania`,`se`.`brakEkspanderaA` AS `brakEkspanderaA`,`se`.`brakEkspanderaB` AS `brakEkspanderaB`,`se`.`sabotazEkspanderaA` AS `sabotazEkspanderaA`,`se`.`sabotazEkspanderaB` AS `sabotazEkspanderaB`,`se`.`trybEdycjiDanych` AS `trybEdycjiDanych`,`sp`.`otwarteDrzwi` AS `otwarteDrzwi`,`sp`.`dlugoOtwarteDrzwi` AS `dlugoOtwarteDrzwi`,`sp`.`przejscieOdblokowane` AS `przejscieOdblokowane`,`sp`.`przejscieZblokowane` AS `przejscieZblokowane`,`sp`.`wejscieSilowe` AS `wejscieSilowe`,`wswej`.`stanWejsc` AS `stanWejsc`,`wswyj`.`stanWyjsc` AS `stanWyjsc` from (((((`accoDb_temporary`.`Kontroler` `k` left join `accoDb_temporary`.`WidokStatusKontrolera` `sk` on((`sk`.`idKontroler` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStatusEkspanderow` `se` on((`se`.`idKontroler` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStatusPrzejscia` `sp` on((`sp`.`idPrzejscie` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStanowWejscKontrolera` `wswej` on((`wswej`.`idKontroler` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStanowWyjscKontrolera` `wswyj` on((`wswyj`.`idKontroler` = `k`.`idKontroler`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WidokUstawienia`
--

/*!50001 DROP TABLE IF EXISTS `WidokUstawienia`*/;
/*!50001 DROP VIEW IF EXISTS `WidokUstawienia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `WidokUstawienia` AS select `accoDb`.`Ustawienia`.`id` AS `id`,`accoDb`.`Ustawienia`.`klucz` AS `klucz`,`accoDb`.`Ustawienia`.`wartosc` AS `wartosc` from `accoDb`.`Ustawienia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Zdarzenie`
--

/*!50001 DROP TABLE IF EXISTS `Zdarzenie`*/;
/*!50001 DROP VIEW IF EXISTS `Zdarzenie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Zdarzenie` AS select `accoDb`.`Zdarzenie`.`id` AS `id`,`accoDb`.`Zdarzenie`.`idObiekt` AS `idObiekt`,`accoDb`.`Zdarzenie`.`idCentrala` AS `idCentrala`,`accoDb`.`Zdarzenie`.`idStrefaWejsciowa` AS `idStrefaWejsciowa`,`accoDb`.`Zdarzenie`.`idStrefaWyjsciowa` AS `idStrefaWyjsciowa`,`accoDb`.`Zdarzenie`.`idKontroler` AS `idKontroler`,`accoDb`.`Zdarzenie`.`idUzytkownik` AS `idUzytkownik`,`accoDb`.`Zdarzenie`.`numerWejscieCentrali` AS `numerWejscieCentrali`,`accoDb`.`Zdarzenie`.`numerWyjscieCentrali` AS `numerWyjscieCentrali`,`accoDb`.`Zdarzenie`.`adresEkspandera` AS `adresEkspandera`,`accoDb`.`Zdarzenie`.`nazwaObiektu` AS `nazwaObiektu`,`accoDb`.`Zdarzenie`.`nazwaCentrali` AS `nazwaCentrali`,`accoDb`.`Zdarzenie`.`nazwaStrefyWejsciowej` AS `nazwaStrefyWejsciowej`,`accoDb`.`Zdarzenie`.`nazwaStrefyWyjsciowej` AS `nazwaStrefyWyjsciowej`,`accoDb`.`Zdarzenie`.`nazwaKontrolera` AS `nazwaKontrolera`,`accoDb`.`Zdarzenie`.`nazwaUzytkownika` AS `nazwaUzytkownika`,`accoDb`.`Zdarzenie`.`nazwaWejsciaCentrali` AS `nazwaWejsciaCentrali`,`accoDb`.`Zdarzenie`.`nazwaWyjsciaCentrali` AS `nazwaWyjsciaCentrali`,`accoDb`.`Zdarzenie`.`numerSeryjnyPilota` AS `numerSeryjnyPilota`,`accoDb`.`Zdarzenie`.`nazwaEkspandera` AS `nazwaEkspandera`,`accoDb`.`Zdarzenie`.`czasZdarzenia` AS `czasZdarzenia`,`accoDb`.`Zdarzenie`.`kodZdarzenia` AS `kodZdarzenia`,`accoDb`.`Zdarzenie`.`adresKontrolera` AS `adresKontrolera`,`accoDb`.`Zdarzenie`.`szczegoly` AS `szczegoly` from `accoDb`.`Zdarzenie` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `access2accont_output`
--

/*!50001 DROP TABLE IF EXISTS `access2accont_output`*/;
/*!50001 DROP VIEW IF EXISTS `access2accont_output`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `access2accont_output` AS select `uao`.`user_id` AS `user_id`,NULL AS `group_id`,`uao`.`accont_output_id` AS `accont_output_id` from `user_accont_output` `uao` where ((`uao`.`modifyRemoved` = 0) or isnull(`uao`.`modifyRemoved`)) union all select `u`.`idUzytkownik` AS `user_id`,`ugao`.`group_id` AS `group_id`,`ugao`.`accont_output_id` AS `accont_output_id` from (`group_accont_output` `ugao` left join `Uzytkownik` `u` on((`u`.`idGrupy` = `ugao`.`group_id`))) where ((`ugao`.`modifyRemoved` = 0) or isnull(`ugao`.`modifyRemoved`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_controller_state`
--

/*!50001 DROP TABLE IF EXISTS `view_controller_state`*/;
/*!50001 DROP VIEW IF EXISTS `view_controller_state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_controller_state` AS select `k`.`idKontroler` AS `id`,`sk`.`napiecieZasilania` AS `power_supply_voltage`,`sk`.`sabotazModulu` AS `sabotage`,`sk`.`awariaZegara` AS `clock_failure`,`sk`.`buforZdarzenZapelniony50` AS `event_buffer_filled_50`,`sk`.`buforZdarzenZapelniony90` AS `event_buffer_filled_90`,`sk`.`awariaZasilaniaAC` AS `power_failure`,`sk`.`rozladowanyAkumulator` AS `discharged_battery`,`sk`.`brakAkumulatora` AS `no_battery`,`sk`.`statusPrzekaznika` AS `relay_status`,`sk`.`jakoscKomunikacji` AS `quality_of_communication`,`sk`.`dataKompilacji` AS `compilation_date`,`sk`.`wersja` AS `VERSION`,`sk`.`jezyk` AS `LANGUAGE`,`sk`.`numerSieci` AS `network_number`,`sp`.`otwarteDrzwi` AS `open_door`,`sp`.`dlugoOtwarteDrzwi` AS `long_open_door`,`sp`.`przejscieOdblokowane` AS `passage_unblock`,`sp`.`przejscieZblokowane` AS `passage_block`,`sp`.`wejscieSilowe` AS `force_entry`,`sp`.`zablokowanieAlarmowe` AS `alarm_block`,`sp`.`odblokowaniePozarowe` AS `fire_unlock`,`se`.`probaSkanowania` AS `scanning_attempt`,`se`.`brakEkspanderaA` AS `absence_of_expander_A`,`se`.`brakEkspanderaB` AS `absence_of_expander_B`,`se`.`sabotazEkspanderaA` AS `sabotage_of_expander_A`,`se`.`sabotazEkspanderaB` AS `sabotage_of_expander_B`,`se`.`trybEdycjiDanych` AS `edit_mode`,`swe1`.`status` AS `input_1`,`swe2`.`status` AS `input2`,`swe3`.`status` AS `input3`,`swe4`.`status` AS `input4`,`swe5`.`status` AS `input5`,`swy1`.`wyjscieZalaczone` AS `output1`,`swy2`.`wyjscieZalaczone` AS `output2` from ((((((((((`accoDb_temporary`.`Kontroler` `k` left join `accoDb_temporary`.`WidokStatusKontrolera` `sk` on((`sk`.`idKontroler` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStatusEkspanderow` `se` on((`se`.`idKontroler` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStatusPrzejscia` `sp` on((`sp`.`idPrzejscie` = `k`.`idKontroler`))) left join `accoDb_temporary`.`WidokStatusWejscia` `swe1` on(((`swe1`.`idKontroler` = `k`.`idKontroler`) and (`swe1`.`numer` = 1)))) left join `accoDb_temporary`.`WidokStatusWejscia` `swe2` on(((`swe2`.`idKontroler` = `k`.`idKontroler`) and (`swe2`.`numer` = 2)))) left join `accoDb_temporary`.`WidokStatusWejscia` `swe3` on(((`swe3`.`idKontroler` = `k`.`idKontroler`) and (`swe3`.`numer` = 3)))) left join `accoDb_temporary`.`WidokStatusWejscia` `swe4` on(((`swe4`.`idKontroler` = `k`.`idKontroler`) and (`swe4`.`numer` = 4)))) left join `accoDb_temporary`.`WidokStatusWejscia` `swe5` on(((`swe5`.`idKontroler` = `k`.`idKontroler`) and (`swe5`.`numer` = 5)))) left join `accoDb_temporary`.`WidokStatusWyjscia` `swy1` on(((`swy1`.`idKontroler` = `k`.`idKontroler`) and (`swy1`.`numer` = 1)))) left join `accoDb_temporary`.`WidokStatusWyjscia` `swy2` on(((`swy2`.`idKontroler` = `k`.`idKontroler`) and (`swy2`.`numer` = 2)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_session`
--

/*!50001 DROP TABLE IF EXISTS `web_session`*/;
/*!50001 DROP VIEW IF EXISTS `web_session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`accoweb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `web_session` AS select `accoDb`.`web_session`.`id` AS `id`,`accoDb`.`web_session`.`expire` AS `expire`,`accoDb`.`web_session`.`data` AS `data` from `accoDb`.`web_session` */;
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

-- Dump completed on 2017-11-14 23:31:05
