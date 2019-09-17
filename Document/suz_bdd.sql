-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 08 sep. 2019 à 04:51
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sonasbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `accident`
--

DROP TABLE IF EXISTS `accident`;
CREATE TABLE IF NOT EXISTS `accident` (
  `idAccident` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `heure` varchar(10) NOT NULL,
  `lieu` varchar(50) NOT NULL,
  `cause` text NOT NULL,
  `conducteur` varchar(50) NOT NULL,
  PRIMARY KEY (`idAccident`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `accident`
--

INSERT INTO `accident` (`idAccident`, `date`, `heure`, `lieu`, `cause`, `conducteur`) VALUES
(1, '10/01/2017', '14:20', 'Place de la paix', 'Un motocycliste roulait dans une mauvaise direction et avec une grande vitesse. C\'et ainsi qu\'il a cogné sa moto contre ma voiture', 'Christian LOMASA'),
(2, '24/01/2017', '16:15', 'Nyawera', 'Le taximan voulait parker sa voiture et moi je m\'appreter à retirer la mienne du parking, c\'est là qu\'il m\'a congé par derière.', 'Janvier Kashemwa');

-- --------------------------------------------------------

--
-- Structure de la table `acheter`
--

DROP TABLE IF EXISTS `acheter`;
CREATE TABLE IF NOT EXISTS `acheter` (
  `idAchat` int(11) NOT NULL AUTO_INCREMENT,
  `idAssurance` varchar(10) NOT NULL,
  `idAssure` int(11) NOT NULL,
  `idType` varchar(10) NOT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`idAchat`),
  KEY `id_assurance` (`idAssurance`),
  KEY `id_assure` (`idAssure`),
  KEY `id_type` (`idType`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acheter`
--

INSERT INTO `acheter` (`idAchat`, `idAssurance`, `idAssure`, `idType`, `montant`) VALUES
(2, 'As1', 1, 'Ty1', 132000),
(3, 'As2', 2, 'Ty1', 200000),
(4, 'As3', 3, 'Ty1', 450000),
(5, 'As4', 4, 'Ty1', 260000),
(6, 'As5', 5, 'Ty1', 158000),
(7, 'As6', 6, 'Ty1', 70000),
(8, 'As7', 7, 'Ty2', 60000),
(9, 'As8', 8, 'Ty2', 20000),
(10, 'As9', 9, 'Ty2', 78000),
(11, 'As10', 10, 'Ty2', 80000),
(12, 'As11', 11, 'Ty2', 58000),
(13, 'As12', 12, 'Ty2', 72000),
(14, 'As13', 13, 'Ty3', 80000),
(15, 'As14', 14, 'Ty3', 200000),
(16, 'As15', 15, 'Ty3', 250000),
(17, 'As16', 16, 'Ty4', 90000),
(18, 'As17', 17, 'Ty4', 60000),
(19, 'As18', 18, 'Ty4', 98000),
(20, 'As19', 19, 'Ty4', 72000),
(21, 'As20', 20, 'Ty5', 170000),
(22, 'As21', 21, 'Ty5', 99000),
(23, 'As22', 22, 'Ty5', 190000);

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `idAgent` varchar(10) NOT NULL DEFAULT 'Ag01',
  `nomAgent` varchar(10) NOT NULL,
  `adresse` varchar(10) NOT NULL,
  `mail` varchar(10) NOT NULL,
  `idService` varchar(5) NOT NULL,
  `idConge` varchar(10) NOT NULL,
  `idPaie` varchar(10) NOT NULL,
  `idPresence` varchar(10) NOT NULL,
  PRIMARY KEY (`idAgent`),
  KEY `id_service` (`idService`),
  KEY `id_conge` (`idConge`),
  KEY `id_paie` (`idPaie`),
  KEY `id_presence` (`idPresence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`idAgent`, `nomAgent`, `adresse`, `mail`, `idService`, `idConge`, `idPaie`, `idPresence`) VALUES
('Ag01', 'HIANI NKOL', 'Ibanda_Hyp', 'hiani12@gm', 'T01', 'Co01', 'P01', 'Pr01'),
('Ag02', 'HERI DUNIA', 'Ibanda_pay', 'heridu@gma', 'T01', 'Co02', 'P02', 'Pr02'),
('Ag03', 'KUKULE Flo', 'Kadutu_buh', 'kakulef@gm', 'T01', 'Co03', 'P03', 'Pr03'),
('Ag04', 'NABITNU Ro', 'Ibanda_hyp', 'rosa2@gmai', 'T01', 'Co04', 'P04', 'Pr04'),
('Ag05', 'IRENGE ZAG', 'Ibanda_nde', 'irezagabe@', 'T01', 'Co05', 'P05', 'Pr05'),
('Ag06', 'NSIMIRE Ja', 'Ibanda_kal', 'jacqui@gma', 'T02', 'Co06', 'P06', 'Pr06'),
('Ag07', 'BIRINDWA M', 'Ibanda_som', 'marcelo@gm', 'T02', 'Co07', 'P07', 'Pr07'),
('Ag08', 'BAPOLISI L', 'Ibanda_pay', 'leobap@gma', 'T02', 'Co08', 'P08', 'Pr08'),
('Ag09', 'Chrisitne ', 'Bagira_qua', 'wabula@gma', 'T03', 'Co09', 'P09', 'Pr09'),
('Ag10', 'NSHOKANO M', 'Ibanda_hyp', 'shomarie@g', 'T03', 'Co10', 'P10', 'Pr10'),
('Ag11', 'AMANI Chri', 'Ibanda_tel', 'amanichris', 'T04', 'Co11', 'P11', 'Pr11'),
('Ag12', 'BADULE Grâ', 'Ibanda_hyp', 'bulonza@gm', 'T05', 'Co12', 'P12', 'Pr12'),
('Ag13', 'BALEMBA Jo', 'Kudutu_ind', 'balembajos', 'T05', 'Co13', 'P13', 'Pr13'),
('Ag14', 'BISIMWA Em', 'Ibanda_res', 'bisimwa@gm', 'T06', 'Co14', 'P14', 'Pr14'),
('Ag15', 'PILIPILI G', 'Bagira_qua', 'gerardp@gm', 'F01', 'Co15', 'P15', 'Pr15'),
('Ag16', 'Mugoli Mad', 'Kadutu_isp', 'madelene10', 'F01', 'Co16', 'P16', 'Pr16'),
('Ag17', 'MUKALAYI J', 'Ibanda_vam', 'jeanneb@gm', 'F01', 'Co17', 'P17', 'Pr17'),
('Ag18', 'AISSI Mari', 'Ibanda_phy', 'marianea@g', 'F02', 'Co18', 'P18', 'Pr18'),
('Ag19', 'KAPENGELA ', 'Ibanda_ath', 'janettek@g', 'F03', 'Co19', 'P19', 'Pr19'),
('Ag20', 'WANDO Char', 'Kadutu_buh', 'wandoch@gm', 'A01', 'Co20', 'P20', 'Pr20'),
('Ag21', 'BITIJULA J', 'Ibanda_res', 'bitijula@g', 'A02', 'Co21', 'P21', 'Pr21'),
('Ag22', 'Sadiki Cla', 'Ibanda_res', 'sadikic@gm', 'A03', 'Co22', 'P22', 'Pr22');

-- --------------------------------------------------------

--
-- Structure de la table `assurance`
--

DROP TABLE IF EXISTS `assurance`;
CREATE TABLE IF NOT EXISTS `assurance` (
  `idAssurance` varchar(10) NOT NULL,
  `nomAssurance` varchar(20) NOT NULL,
  `police` varchar(25) NOT NULL,
  `dateDebut` varchar(20) NOT NULL,
  `dateFin` varchar(20) NOT NULL,
  `garantie` varchar(50) NOT NULL,
  PRIMARY KEY (`idAssurance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assurance`
--

INSERT INTO `assurance` (`idAssurance`, `nomAssurance`, `police`, `dateDebut`, `dateFin`, `garantie`) VALUES
('As1', 'Quittance automobile', '1041976992A', '02/01/2017', '05/04/2017', 'RC, TTR,Degât matériel'),
('As2', 'Quittance automobile', '1247512499D', '02/01/2017', '02/02/2017', 'RC, TTR,Degât matériel,Incendiee'),
('As3', 'Quittance automobile', '1047476499A', '02/01/2017', '02/02/2018', 'RC, TTR,Degât matériel,Incendiee'),
('As4', 'Quittance automobile', '1047474739A', '03/01/2017', '03/05/2017', 'RC, TTR'),
('As5', 'Quittance automobile', '118724739A', '03/01/2017', '04/03/2017', 'RC, TTR,Incendie'),
('As6', 'Quittance automobile', '117834739B', '03/01/2017', '03/02/2017', 'RC, TTR,Incendie,degât materiel'),
('As7', 'Quittance vie', '1325474682A', '09/01/2017', '02/01/2018', 'RC,Maladie,Accident'),
('As8', 'Quittance vie', '1325474476A', '09/01/2017', '09/07/2018', 'RC,Maladie,Accident'),
('As9', 'Quittance vie', '1224784476A', '09/01/2017', '09/08/2018', 'RC,Maladie'),
('As10', 'Quittance vie', '1224784756D', '16/01/2017', '16/03/2018', 'RC,Accident'),
('As11', 'Quittance vie', '1275684756A', '16/01/2017', '16/06/2018', 'RC,Accident'),
('As12', 'Quittance vie', '1275743756C', '16/01/2017', '16/07/2018', 'RC,Accident'),
('As13', 'Quittance incendie', '142578475C', '18/01/2017', '18/05/2017', 'RC,degât materiel'),
('As14', 'Quittance incendie', '1127578475C', '20/01/2017', '20/01/2018', 'RC, blessure et brulure'),
('As15', 'Quittance incendie', '1142578257D', '18/01/2017', '18/05/2017', 'RC,degât materiel'),
('As16', 'Quittance incendie', '1142578257D', '18/01/2017', '18/05/2017', 'RC,degât materiel'),
('As17', 'Quittance ARD', '1242578257A', '02/01/2017', '02/05/2017', 'RC, accident extrascolaire'),
('As18', 'Quittance ARD', '12424778257D', '28/01/2017', '28/08/2017', 'RC,accident'),
('As19', 'Quittance ARD', '12754778257A', '20/01/2017', '20/08/2017', 'RC,accident, accident extrascolaire'),
('As20', 'Quittance ARD', '12747878257B', '14/01/2017', '14/08/2017', 'RC,accident, accident extrascolaire'),
('As21', 'Quittance Transport', '13747878257B', '11/01/2017', '11/08/2017', 'RC,crash vol, degat materiel'),
('As22', 'Quittance Transport', '14747878257B', '22/01/2017', '22/09/2017', 'RC,noyade');

-- --------------------------------------------------------

--
-- Structure de la table `assure`
--

DROP TABLE IF EXISTS `assure`;
CREATE TABLE IF NOT EXISTS `assure` (
  `idAssure` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `personeMoral` varchar(20) NOT NULL,
  `Adresse` varchar(25) NOT NULL,
  PRIMARY KEY (`idAssure`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `assure`
--

INSERT INTO `assure` (`idAssure`, `nom`, `personeMoral`, `Adresse`) VALUES
(1, 'BADULE Suzanne', 'BADULE Suzanne', 'hyp_Ibanda'),
(2, 'UNFPA', 'Godefroid PALUKU', 'hyp_Ibanda'),
(3, 'OCHA', 'Joel IRAGI', 'Muhumba_ibanda'),
(4, 'NSHOKANO Marie-Rose', 'NSHOKANO Marie-Rose', 'Ndender_Ibanda'),
(5, 'KAHASHA Binja', 'KAHASHA BINJA', 'Nguba_Ibanda'),
(6, 'MIHIGO Janette', 'MIHIGO Janette', 'Brasserie_Bagira'),
(7, 'OXFAM', 'Jean-Jacque HERI', 'Muhumba_Ibanda'),
(8, 'Salomon KAMARA', 'Salomon KAMARA', 'hyp_Ibanda'),
(9, 'SIFA Marlène', 'Sifa Marlène', 'physi_Ibanda'),
(10, 'Arsène MPOVA', 'aRS7NE mPOVA', 'hyp_Ibanda'),
(11, 'UNMAS', 'Elie BALEMBA', 'Muhumba_ibanda'),
(12, 'KASELE Onard', 'KASELE Onard', 'Route_Kadutu'),
(13, 'Pharamcie GLOIRE', 'Marie OLIMBE', 'Nyawera_ibanda'),
(14, 'CITY MARKET', 'Sharif SHAMBU', 'labotte_Ibanda'),
(15, 'Maison ISHARA', 'KAMUNTU Blaise', 'Nyawera_Ibanda'),
(16, 'Collège Alfajiri', 'MUDOSA Jean-claude', 'Nguba_ibanda'),
(17, 'CS Elite', 'Espoir Mwzilo', 'Hyp_Ibanda'),
(18, 'CS Espoir2', 'KAMUNTU Blaise', 'Nguba_Ibanda'),
(19, 'Lycée CIREZI', 'BASIME Paul', 'Nyawera_Ibanda'),
(20, 'CAA', 'Jean Paul RAHA', 'PEM_Ibanda'),
(21, 'Bateau Emanuel', 'SOKI Gabrielle', 'Brasserie_Bagira'),
(22, 'MUGOTE', 'Juvena MIZINZI', 'Brasserie_Bagira');

-- --------------------------------------------------------

--
-- Structure de la table `conge`
--

DROP TABLE IF EXISTS `conge`;
CREATE TABLE IF NOT EXISTS `conge` (
  `idConge` varchar(10) NOT NULL,
  `dateDebut` varchar(10) NOT NULL,
  `dateFin` varchar(10) NOT NULL,
  PRIMARY KEY (`idConge`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `conge`
--

INSERT INTO `conge` (`idConge`, `dateDebut`, `dateFin`) VALUES
('Co01', '04/07/2017', '04/08/207'),
('Co02', '02/04/2017', '002/05/207'),
('Co03', '04/09/2017', '04/10/207'),
('Co04', '24/07/2017', '24/08/207'),
('Co05', '18/04/2017', '18/05/207'),
('Co06', '27/02/2017', '27/03/207'),
('Co07', '09/01/2017', '09/02/207'),
('Co08', '13/06/2017', '13/07/207'),
('Co09', '27/09/2017', '27/10/207'),
('Co10', '04/10/2017', '04/11/207'),
('Co11', '03/05/2017', '03/06/207'),
('Co12', '07/09/2017', '07/10/207'),
('Co13', '07/06/2017', '07/07/207'),
('Co14', '04/10/2017', '04/11/207'),
('Co15', '04/05/2017', '04/06/207'),
('Co16', '09/04/2017', '09/05/207'),
('Co17', '05/10/2017', '05/11/207'),
('Co18', '20/03/2017', '20/04/207'),
('Co19', '06/09/2017', '06/10/207'),
('Co20', '02/03/2017', '02/04/207'),
('Co21', '04/10/2017', '04/11/207'),
('Co22', '11/04/2017', '11/05/207');

-- --------------------------------------------------------

--
-- Structure de la table `declaration`
--

DROP TABLE IF EXISTS `declaration`;
CREATE TABLE IF NOT EXISTS `declaration` (
  `idDeclaration` int(11) NOT NULL AUTO_INCREMENT,
  `idAssure` int(11) NOT NULL,
  `idAccident` int(11) NOT NULL,
  PRIMARY KEY (`idDeclaration`),
  KEY `id_assure` (`idAssure`),
  KEY `id_accident` (`idAccident`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `faitagent`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `faitagent`;
CREATE TABLE IF NOT EXISTS `faitagent` (
`nomAgent` varchar(10)
,`nomService` varchar(20)
,`PresenceJanvier` int(11)
,`PresenceFevrier` int(11)
,`PresenceMars` int(11)
,`PresenceAvril` int(11)
,`PrensenceMai` int(11)
,`PresenceJuin` int(11)
,`PresenceJuillet` int(11)
,`PresenceAout` int(11)
,`PresenceSeptembre` int(11)
,`PresenceOctobre` int(11)
,`PresenceNovembre` int(11)
,`PresenceDecembre` int(11)
,`PaieJanvier` int(11)
,`PaieFevrier` int(11)
,`PaieMars` int(11)
,`PaieAvril` int(11)
,`PaieMai` int(11)
,`PaieJuin` int(11)
,`PaieJuillet` int(11)
,`PaieAout` int(11)
,`PaieOctobre` int(11)
,`PaieNovembre` int(11)
,`PaieDecembre` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `faitvente`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `faitvente`;
CREATE TABLE IF NOT EXISTS `faitvente` (
`nomAssurance` varchar(20)
,`nom` varchar(20)
,`designation` varchar(50)
,`montant` double
);

-- --------------------------------------------------------

--
-- Structure de la table `journaltec`
--

DROP TABLE IF EXISTS `journaltec`;
CREATE TABLE IF NOT EXISTS `journaltec` (
  `idJournal` int(11) NOT NULL AUTO_INCREMENT,
  `Annee` varchar(10) NOT NULL,
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
  `idService` varchar(5) NOT NULL,
  PRIMARY KEY (`idJournal`),
  KEY `id_service` (`idService`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `journaltec`
--

INSERT INTO `journaltec` (`idJournal`, `Annee`, `Janvier`, `Fevrier`, `Mars`, `Avril`, `Mai`, `Juin`, `Juillet`, `Aout`, `Septembre`, `Octobre`, `Novembre`, `Decembre`, `idService`) VALUES
(1, '2017', 12770000, 1150000, 740000, 575000, 1340000, 870000, 1340000, 870000, 743000, 300000, 18000, 678000, 'T01'),
(2, '2017', 530000, 780000, 890000, 500000, 470000, 340000, 277000, 520000, 470000, 250800, 230000, 566000, 'T02'),
(3, '2017', 320000, 230000, 170000, 90000, 120000, 98000, 68000, 72000, 68900, 70000, 55000, 68000, 'T03'),
(4, '2017', 459000, 345000, 572000, 290000, 458000, 330000, 260000, 348000, 450000, 185000, 19000, 100000, 'T04'),
(5, '2017', 368000, 130000, 142000, 200000, 120000, 99000, 140000, 200000, 118000, 80000, 148000, 205000, 'T05');

-- --------------------------------------------------------

--
-- Structure de la table `paie`
--

DROP TABLE IF EXISTS `paie`;
CREATE TABLE IF NOT EXISTS `paie` (
  `idPaie` varchar(10) NOT NULL,
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
  PRIMARY KEY (`idPaie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `paie`
--

INSERT INTO `paie` (`idPaie`, `annee`, `Janvier`, `Fevrier`, `Mars`, `Avril`, `Mai`, `Juin`, `Juillet`, `Aout`, `Septembre`, `Octobre`, `Novembre`, `Decembre`) VALUES
('P01', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P02', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P03', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P04', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P05', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P06', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P07', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P08', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P09', '2017', 275, 250, 285, 275, 220, 245, 245, 275, 245, 275, 275, 200),
('P10', '2017', 275, 250, 285, 275, 220, 245, 245, 275, 245, 275, 275, 200),
('P11', '2017', 275, 250, 285, 275, 220, 245, 245, 275, 245, 275, 275, 200),
('P12', '2017', 275, 250, 285, 275, 220, 245, 245, 275, 245, 275, 275, 200),
('P13', '2017', 275, 250, 285, 275, 220, 245, 245, 275, 245, 275, 275, 200),
('P14', '2017', 330, 300, 345, 330, 345, 315, 315, 330, 315, 330, 330, 240),
('P15', '2017', 450, 430, 445, 450, 445, 425, 425, 450, 425, 450, 450, 400),
('P16', '2017', 450, 430, 445, 450, 445, 425, 425, 450, 425, 450, 450, 400),
('P17', '2017', 450, 430, 445, 450, 445, 425, 425, 450, 425, 450, 450, 400),
('P18', '2017', 450, 430, 445, 450, 445, 425, 425, 450, 425, 450, 450, 400),
('P19', '2017', 450, 430, 445, 450, 445, 425, 425, 450, 425, 450, 450, 400),
('P20', '2017', 530, 500, 545, 530, 545, 515, 515, 530, 515, 530, 530, 440),
('P21', '2017', 530, 500, 545, 530, 545, 515, 515, 530, 515, 530, 530, 440),
('P22', '2017', 730, 700, 745, 730, 745, 715, 715, 730, 715, 730, 730, 740);

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

DROP TABLE IF EXISTS `presence`;
CREATE TABLE IF NOT EXISTS `presence` (
  `idPresence` varchar(10) NOT NULL,
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
  `idAgent` varchar(10) NOT NULL DEFAULT 'Ag01',
  PRIMARY KEY (`idPresence`),
  KEY `id_agent` (`idAgent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `presence`
--

INSERT INTO `presence` (`idPresence`, `annee`, `Janvier`, `Fevrier`, `Mars`, `Avril`, `Mai`, `Juin`, `Juillet`, `Aout`, `Septembre`, `Octobre`, `Novembre`, `Decembre`, `idAgent`) VALUES
('Pr01', '2017', 22, 18, 23, 18, 25, 21, 21, 22, 21, 18, 22, 16, 'Ag01'),
('Pr02', '2017', 22, 20, 12, 20, 19, 21, 21, 17, 19, 21, 20, 16, 'Ag02'),
('Pr03', '2017', 22, 20, 21, 20, 23, 21, 21, 20, 21, 20, 19, 16, 'Ag03'),
('Pr04', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag04'),
('Pr05', '2017', 20, 18, 19, 20, 23, 19, 19, 18, 21, 22, 22, 16, 'Ag05'),
('Pr06', '2017', 20, 18, 20, 20, 21, 20, 21, 18, 20, 22, 22, 16, 'Ag06'),
('Pr07', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag07'),
('Pr08', '2017', 19, 14, 15, 17, 10, 20, 10, 12, 10, 18, 14, 12, 'Ag08'),
('Pr09', '2017', 20, 19, 20, 22, 23, 19, 12, 15, 20, 22, 22, 16, 'Ag09'),
('Pr10', '2017', 19, 20, 22, 19, 17, 19, 19, 20, 17, 20, 18, 16, 'Ag10'),
('Pr11', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag11'),
('Pr12', '2017', 21, 19, 20, 19, 14, 15, 16, 17, 14, 16, 15, 15, 'Ag12'),
('Pr13', '2017', 12, 15, 14, 18, 20, 18, 20, 24, 15, 23, 20, 16, 'Ag13'),
('Pr14', '2017', 22, 19, 22, 22, 23, 21, 21, 20, 20, 22, 22, 16, 'Ag14'),
('Pr15', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag15'),
('Pr16', '2017', 12, 12, 13, 12, 22, 15, 15, 18, 17, 20, 21, 12, 'Ag16'),
('Pr17', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag17'),
('Pr18', '2017', 2, 16, 19, 17, 22, 19, 21, 20, 19, 19, 27, 14, 'Ag18'),
('Pr19', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 22, 22, 16, 'Ag19'),
('Pr20', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 20, 22, 16, 'Ag20'),
('Pr21', '2017', 19, 15, 23, 22, 23, 21, 21, 22, 21, 19, 22, 16, 'Ag21'),
('Pr22', '2017', 22, 20, 23, 22, 23, 21, 21, 22, 21, 23, 22, 16, 'Ag22');

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
CREATE TABLE IF NOT EXISTS `reglement` (
  `idReglement` int(11) NOT NULL AUTO_INCREMENT,
  `concerne` varchar(10) NOT NULL,
  `Observation` varchar(10) NOT NULL,
  `totalIndamnite` double NOT NULL,
  `idAccident` int(11) NOT NULL,
  PRIMARY KEY (`idReglement`),
  KEY `id_accident` (`idAccident`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `idService` varchar(5) NOT NULL,
  `nomService` varchar(20) NOT NULL,
  `Fonctionalite` varchar(50) NOT NULL,
  PRIMARY KEY (`idService`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`idService`, `nomService`, `Fonctionalite`) VALUES
('T01', 'Automobile', 'Vente assurance auto'),
('T02', 'Incendie', 'Vente assurance ince'),
('T03', 'ARD', 'Vente assurance scolaire et sportifs'),
('T04', 'Transport', 'Assurance des corps.'),
('T05', 'Vie', 'Assurance vie groupe'),
('T06', 'Sinistre', 'Declaration accident'),
('F01', 'Budget', 'Gestion budget et contrôle'),
('F02', 'Comptabilité', 'Opérations comptable'),
('F03', 'Caisse', 'Trésorerie et tenu d'),
('A01', 'Secrétariat', 'Gestion des correspo'),
('A02', 'RH', 'Gestion du personnel'),
('A03', 'Direction', 'Chef dagence');

-- --------------------------------------------------------

--
-- Structure de la table `typeassurance`
--

DROP TABLE IF EXISTS `typeassurance`;
CREATE TABLE IF NOT EXISTS `typeassurance` (
  `idType` varchar(10) NOT NULL,
  `designation` varchar(50) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typeassurance`
--

INSERT INTO `typeassurance` (`idType`, `designation`) VALUES
('Ty1', 'Assurance automobile'),
('Ty2', 'Assurance vie'),
('Ty3', 'Assurance Incendie'),
('Ty4', 'Assurance ARD (scolaire et sportif)'),
('Ty5', 'Assurance transport');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(15) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`iduser`, `Username`, `password`) VALUES
(1, 'directeur', 'dir2017'),
(2, 'personnel', 'per2017'),
(3, 'technique', 'tech2017'),
(4, 'finance', 'fin2017'),
(5, 'adminin', 'adm2017');

-- --------------------------------------------------------

--
-- Structure de la vue `faitagent`
--
DROP TABLE IF EXISTS `faitagent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faitagent`  AS  select `ag`.`nomAgent` AS `nomAgent`,`se`.`nomService` AS `nomService`,`pr`.`Janvier` AS `PresenceJanvier`,`pr`.`Fevrier` AS `PresenceFevrier`,`pr`.`Mars` AS `PresenceMars`,`pr`.`Avril` AS `PresenceAvril`,`pr`.`Mai` AS `PrensenceMai`,`pr`.`Juin` AS `PresenceJuin`,`pr`.`Juillet` AS `PresenceJuillet`,`pr`.`Aout` AS `PresenceAout`,`pr`.`Septembre` AS `PresenceSeptembre`,`pr`.`Octobre` AS `PresenceOctobre`,`pr`.`Novembre` AS `PresenceNovembre`,`pr`.`Decembre` AS `PresenceDecembre`,`pa`.`Janvier` AS `PaieJanvier`,`pa`.`Fevrier` AS `PaieFevrier`,`pa`.`Mars` AS `PaieMars`,`pa`.`Avril` AS `PaieAvril`,`pa`.`Mai` AS `PaieMai`,`pa`.`Juin` AS `PaieJuin`,`pa`.`Juillet` AS `PaieJuillet`,`pa`.`Aout` AS `PaieAout`,`pa`.`Octobre` AS `PaieOctobre`,`pa`.`Novembre` AS `PaieNovembre`,`pa`.`Decembre` AS `PaieDecembre` from (((`presence` `pr` join `service` `se`) join `agent` `ag`) join `paie` `pa`) where ((`ag`.`idPresence` = `pr`.`idPresence`) and (convert(`ag`.`idPaie` using utf8mb4) = `pa`.`idPaie`) and (`ag`.`idService` = `se`.`idService`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `faitvente`
--
DROP TABLE IF EXISTS `faitvente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faitvente`  AS  select `ass`.`nomAssurance` AS `nomAssurance`,`asu`.`nom` AS `nom`,`ty`.`designation` AS `designation`,`ac`.`montant` AS `montant` from (((`assurance` `ass` join `assure` `asu`) join `typeassurance` `ty`) join `acheter` `ac`) where ((`ac`.`idAssurance` = `ass`.`idAssurance`) and (`ac`.`idAssure` = `asu`.`idAssure`) and (`ac`.`idType` = `ty`.`idType`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
