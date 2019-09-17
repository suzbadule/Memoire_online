-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sonas_bdd
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP SCHEMA IF EXISTS `sonas_bdd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE SCHEMA `sonas_bdd` ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accident`
--

DROP TABLE IF EXISTS `accident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accident` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `conducteur` varchar(100) NOT NULL,
  `cause` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(100) DEFAULT NULL,
  `noms` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_conge` int(11) NOT NULL,
  `id_paie` int(11) NOT NULL,
  --- `id_presence` int(11) NOT NULL, --- CECI EST MON COMMENTAIRE, J'entend ton msg sur concernant cette ambiguité
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_UNIQUE` (`email`),
  UNIQUE KEY `matricule_UNIQUE` (`matricule`),
  KEY `Fk_agent_service_idx` (`id_service`),
  KEY `Fk_agent_conge_idx` (`id_conge`),
  KEY `Fk_agent_paie_idx` (`id_paie`),
  CONSTRAINT `Fk_agent_conge` FOREIGN KEY (`id_conge`) REFERENCES `conge` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_agent_paie` FOREIGN KEY (`id_paie`) REFERENCES `paie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_agent_service` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assurance`
--

DROP TABLE IF EXISTS `assurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `police` varchar(100) NOT NULL,
  `garantie` varchar(100) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designation_UNIQUE` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assure`
--

DROP TABLE IF EXISTS `assure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `personne_morale` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designation_UNIQUE` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conge`
--

DROP TABLE IF EXISTS `conge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designation_UNIQUE` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `declaration`
--

DROP TABLE IF EXISTS `declaration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declaration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_assure` int(11) NOT NULL,
  `id_accident` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_declaration_assure_idx` (`id_assure`),
  KEY `Fk_declaration_accident_idx` (`id_accident`),
  CONSTRAINT `Fk_declaration_accident` FOREIGN KEY (`id_accident`) REFERENCES `accident` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_declaration_assure` FOREIGN KEY (`id_assure`) REFERENCES `assure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paie`
--

DROP TABLE IF EXISTS `paie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(10) NOT NULL,
  `Janvier` int(11) NOT NULL,
  `Fevrier` int(11) NOT NULL,
  `Mars` int(11) NOT NULL,
  `Avril` int(11) NOT NULL,
  `Mai` int(11) NOT NULL,
  `Juin` int(11) NOT NULL,
  `Juillet` int(11) NOT NULL,
  `Aout` int(11) NOT NULL,
  `Septembre` int(11) NOT NULL,
  `Octobre` int(11) NOT NULL,
  `Novembre` int(11) NOT NULL,
  `Decembre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presence`
--

DROP TABLE IF EXISTS `presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  --- `id_agent` int(11) NOT NULL,  --- CECI EST MON COMMENTAIRE, J'entend ton msg sur concernant cette ambiguité
  `annee` varchar(10) NOT NULL,
  `Janvier` int(11) NOT NULL,
  `Fevrier` int(11) NOT NULL,
  `Mars` int(11) NOT NULL,
  `Avril` int(11) NOT NULL,
  `Mai` int(11) NOT NULL,
  `Juin` int(11) NOT NULL,
  `Juillet` int(11) NOT NULL,
  `Aout` int(11) NOT NULL,
  `Septembre` int(11) NOT NULL,
  `Octobre` int(11) NOT NULL,
  `Novembre` int(11) NOT NULL,
  `Decembre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concerne` varchar(100) NOT NULL,
  `observation` varchar(100) NOT NULL,
  `total_indemnite` double NOT NULL,
  `id_accident` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_reglement_accident_idx` (`id_accident`),
  CONSTRAINT `Fk_reglement_accident` FOREIGN KEY (`id_accident`) REFERENCES `accident` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `fonctionnalite` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_assurence`
--

DROP TABLE IF EXISTS `type_assurence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_assurence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designtion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designtion_UNIQUE` (`designtion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17 11:22:20
