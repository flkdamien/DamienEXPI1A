-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: MACCAUD_OLIVIER_INFO1X_FILMS_164_2023

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS FLUCK_DAMIEN_EXPI1A_RDVARTISTE_164_2024;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS FLUCK_DAMIEN_EXPI1A_RDVARTISTE_164_2024;

-- Utilisation de cette base de donnée

USE FLUCK_DAMIEN_EXPI1A_RDVARTISTE_164_2024;
-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour fluck_damien_expi1a
DROP DATABASE IF EXISTS `fluck_damien_expi1a`;
CREATE DATABASE IF NOT EXISTS `fluck_damien_expi1a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fluck_damien_expi1a`;

-- Listage de la structure de table fluck_damien_expi1a. t_compte
DROP TABLE IF EXISTS `t_compte`;
CREATE TABLE IF NOT EXISTS `t_compte` (
  `id_compte` int NOT NULL,
  `Nom_Pseudo` varchar(50) DEFAULT NULL,
  `Mot_de_passe` varchar(50) DEFAULT NULL,
  `Nom_type_de_compte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_compte : ~5 rows (environ)
INSERT INTO `t_compte` (`id_compte`, `Nom_Pseudo`, `Mot_de_passe`, `Nom_type_de_compte`) VALUES
	(1, 'TheoThiste', '1234', 'User'),
	(2, 'Lezarabe', '6969', 'User'),
	(3, 'SuciteLair', '969696', 'User'),
	(4, 'Jeancultamer', 'pasdinspi', 'User'),
	(5, 'GeorgeSauciflar', 'Informatique=merde', 'Admin');

-- Listage de la structure de table fluck_damien_expi1a. t_creation_compte
DROP TABLE IF EXISTS `t_creation_compte`;
CREATE TABLE IF NOT EXISTS `t_creation_compte` (
  `id_creation_compte` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_compte` int DEFAULT NULL,
  `Fk_compte_personne` int DEFAULT NULL,
  `Date_creation_compte` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_creation_compte`),
  KEY `Fk_personne_compte` (`Fk_personne_compte`),
  KEY `Fk_compte_personne` (`Fk_compte_personne`),
  CONSTRAINT `FK_t_creation_compte_t_compte` FOREIGN KEY (`Fk_compte_personne`) REFERENCES `t_compte` (`id_compte`),
  CONSTRAINT `FK_t_creation_compte_t_personne` FOREIGN KEY (`Fk_personne_compte`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_creation_compte : ~5 rows (environ)
INSERT INTO `t_creation_compte` (`id_creation_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_creation_compte`) VALUES
	(1, 1, 1, '2024-03-11 15:32:54'),
	(2, 2, 2, '2024-03-11 15:33:12'),
	(3, 3, 3, '2024-03-11 15:33:22'),
	(4, 4, 4, '2024-03-11 15:33:31'),
	(5, 5, 5, '2024-03-11 15:33:40');

-- Listage de la structure de table fluck_damien_expi1a. t_declination_evenement
DROP TABLE IF EXISTS `t_declination_evenement`;
CREATE TABLE IF NOT EXISTS `t_declination_evenement` (
  `id_declination_evenement` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_evenement` int DEFAULT NULL,
  `Fk_evenement_personne` int DEFAULT NULL,
  `Date_declination_evenement` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_declination_evenement`),
  KEY `Fk_personne_evenement` (`Fk_personne_evenement`),
  KEY `Fk_evenement_personne` (`Fk_evenement_personne`),
  CONSTRAINT `FK_t_declination_evenement_t_evenement` FOREIGN KEY (`Fk_evenement_personne`) REFERENCES `t_evenement` (`id_evenement`),
  CONSTRAINT `FK_t_declination_evenement_t_personne` FOREIGN KEY (`Fk_personne_evenement`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_declination_evenement : ~2 rows (environ)
INSERT INTO `t_declination_evenement` (`id_declination_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_declination_evenement`) VALUES
	(4, 4, 4, '2024-03-11 15:37:24'),
	(5, 5, 5, '2024-03-11 15:37:32');

-- Listage de la structure de table fluck_damien_expi1a. t_declination_materiel
DROP TABLE IF EXISTS `t_declination_materiel`;
CREATE TABLE IF NOT EXISTS `t_declination_materiel` (
  `id_decliantion_materiel` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_materiel` int DEFAULT NULL,
  `Fk_materiel_personne` int DEFAULT NULL,
  `Date_declination_materiel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_decliantion_materiel`),
  KEY `Fk_personne_materiel` (`Fk_personne_materiel`),
  KEY `Fk_materiel_personne` (`Fk_materiel_personne`),
  CONSTRAINT `FK_t_declination_materiel_t_materiel` FOREIGN KEY (`Fk_materiel_personne`) REFERENCES `t_materiel` (`id_materiel`),
  CONSTRAINT `FK_t_declination_materiel_t_personne` FOREIGN KEY (`Fk_personne_materiel`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_declination_materiel : ~2 rows (environ)
INSERT INTO `t_declination_materiel` (`id_decliantion_materiel`, `Fk_personne_materiel`, `Fk_materiel_personne`, `Date_declination_materiel`) VALUES
	(4, 4, 4, '2024-03-12 15:43:41'),
	(5, 5, 5, '2024-03-12 15:43:31');

-- Listage de la structure de table fluck_damien_expi1a. t_evenement
DROP TABLE IF EXISTS `t_evenement`;
CREATE TABLE IF NOT EXISTS `t_evenement` (
  `id_evenement` int NOT NULL AUTO_INCREMENT,
  `Nom_evenement` varchar(50) DEFAULT NULL,
  `Lieu_evenement` varchar(50) DEFAULT NULL,
  `Date_evenement` timestamp NULL DEFAULT NULL,
  `Description_evenement` varchar(50) DEFAULT NULL,
  `Nom_sponsor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_evenement : ~5 rows (environ)
INSERT INTO `t_evenement` (`id_evenement`, `Nom_evenement`, `Lieu_evenement`, `Date_evenement`, `Description_evenement`, `Nom_sponsor`) VALUES
	(1, 'Concert Effeiel', 'Paris', '2030-03-11 15:24:05', 'descrpition très original', 'Ville de Paris'),
	(2, 'Concert Abeille', 'Ruche', '2025-03-11 15:25:59', NULL, 'MielPops'),
	(3, 'Concert incroyable', 'Lausanne', '2029-03-11 15:26:57', NULL, NULL),
	(4, 'Concert de ouf', 'Yverdon', '2026-03-11 15:27:36', 'Un truc de dingue YEAH!!', NULL),
	(5, 'Concert 69', 'Marseille', '2031-03-11 15:28:42', 'ENORME', 'Migros');

-- Listage de la structure de table fluck_damien_expi1a. t_materiel
DROP TABLE IF EXISTS `t_materiel`;
CREATE TABLE IF NOT EXISTS `t_materiel` (
  `id_materiel` int NOT NULL AUTO_INCREMENT,
  `Nom_materiel` varchar(50) DEFAULT NULL,
  `Quantite_materiel` int DEFAULT NULL,
  `Couleur_materiel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_materiel : ~5 rows (environ)
INSERT INTO `t_materiel` (`id_materiel`, `Nom_materiel`, `Quantite_materiel`, `Couleur_materiel`) VALUES
	(1, 'Barre en metal', 10, 'Noir'),
	(2, 'Hache', 1, 'Rouge'),
	(3, 'Guitare', 4, 'Rouge'),
	(4, 'Haut-parleur', 6, 'Noir'),
	(5, 'Micro', 4, 'Gris');

-- Listage de la structure de table fluck_damien_expi1a. t_modification_compte
DROP TABLE IF EXISTS `t_modification_compte`;
CREATE TABLE IF NOT EXISTS `t_modification_compte` (
  `id_modification_compte` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_compte` int DEFAULT NULL,
  `Fk_compte_personne` int DEFAULT NULL,
  `Date_modification_compte` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_modification_compte`),
  KEY `Fk_personne_compte` (`Fk_personne_compte`),
  KEY `Fk_compte_personne` (`Fk_compte_personne`),
  CONSTRAINT `FK_t_modification_compte_t_compte` FOREIGN KEY (`Fk_compte_personne`) REFERENCES `t_compte` (`id_compte`),
  CONSTRAINT `FK_t_modification_compte_t_personne` FOREIGN KEY (`Fk_personne_compte`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_modification_compte : ~5 rows (environ)
INSERT INTO `t_modification_compte` (`id_modification_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_modification_compte`) VALUES
	(1, 1, 1, '2024-03-11 15:34:11'),
	(2, 2, 2, '2024-03-11 15:34:21'),
	(3, 3, 3, '2024-03-11 15:34:36'),
	(4, 4, 4, '2024-04-11 14:34:45'),
	(5, 5, 5, '2024-03-11 15:34:56');

-- Listage de la structure de table fluck_damien_expi1a. t_personne
DROP TABLE IF EXISTS `t_personne`;
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(50) DEFAULT NULL,
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Date_Naissance` timestamp NULL DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_personne : ~6 rows (environ)
INSERT INTO `t_personne` (`id_personne`, `Prenom`, `Nom`, `Date_Naissance`, `Mail`, `Telephone`) VALUES
	(1, 'Theo', 'Thiste', '2004-03-06 09:05:35', 'theo.thiste@lol.ch', '0798763456'),
	(2, 'Leza', 'Rabe', '2000-03-06 09:07:11', 'lesa.rabe@bombe.ch', '0317774693'),
	(3, 'Lair', 'Sucite', '2001-03-06 09:08:30', 'sucite.laire@contrelesucide.ch', '0417787640'),
	(4, 'Jean', 'Cultamer', '2000-03-11 15:07:41', 'jean.cultamer@onlyfan.com', '0417709654'),
	(5, 'George', 'Sauciflare', '2010-03-11 15:08:03', 'george.sauciflare@saucisse.ch', '0917798753'),
	(6, 'Jade', 'Orlabite', '2010-03-11 15:48:55', 'jade.orlabite@xxx.com', '0779874565');

-- Listage de la structure de table fluck_damien_expi1a. t_reservation_evenement
DROP TABLE IF EXISTS `t_reservation_evenement`;
CREATE TABLE IF NOT EXISTS `t_reservation_evenement` (
  `id_reservation_evenement` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_evenement` int DEFAULT NULL,
  `Fk_evenement_personne` int DEFAULT NULL,
  `Date_reservation_evenement` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_reservation_evenement`),
  KEY `Fk_personne_evenement` (`Fk_personne_evenement`),
  KEY `Fk_evenement_personne` (`Fk_evenement_personne`),
  CONSTRAINT `FK_t_reservation_evenement_t_evenement` FOREIGN KEY (`Fk_evenement_personne`) REFERENCES `t_evenement` (`id_evenement`),
  CONSTRAINT `FK_t_reservation_evenement_t_personne` FOREIGN KEY (`Fk_personne_evenement`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_reservation_evenement : ~5 rows (environ)
INSERT INTO `t_reservation_evenement` (`id_reservation_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_reservation_evenement`) VALUES
	(1, 1, 1, '2024-03-11 15:38:27'),
	(2, 2, 2, '2024-03-11 15:38:36'),
	(3, 3, 3, '2024-03-11 15:38:44'),
	(4, 4, 4, '2024-03-11 15:38:53'),
	(5, 5, 5, '2024-03-11 15:39:02');

-- Listage de la structure de table fluck_damien_expi1a. t_reservation_materiel
DROP TABLE IF EXISTS `t_reservation_materiel`;
CREATE TABLE IF NOT EXISTS `t_reservation_materiel` (
  `id_reservation_materiel` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_materiel` int DEFAULT NULL,
  `Fk_materiel_personne` int DEFAULT NULL,
  `Date_reservation_personne` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_reservation_materiel`),
  KEY `Fk_personne_materiel` (`Fk_personne_materiel`),
  KEY `Fk_materiel_personne` (`Fk_materiel_personne`),
  CONSTRAINT `FK_t_reservation_materiel_t_materiel` FOREIGN KEY (`Fk_materiel_personne`) REFERENCES `t_materiel` (`id_materiel`),
  CONSTRAINT `FK_t_reservation_materiel_t_personne` FOREIGN KEY (`Fk_personne_materiel`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_reservation_materiel : ~7 rows (environ)
INSERT INTO `t_reservation_materiel` (`id_reservation_materiel`, `Fk_personne_materiel`, `Fk_materiel_personne`, `Date_reservation_personne`) VALUES
	(1, 1, 2, '2024-03-11 15:45:19'),
	(2, 2, 2, '2024-03-11 15:45:26'),
	(3, 3, 3, '2024-03-11 15:45:35'),
	(4, 4, 4, '2024-03-11 15:46:04'),
	(5, 5, 5, '2024-03-11 15:46:12'),
	(6, 1, 5, '2024-03-11 15:46:27'),
	(7, 2, 4, '2024-03-11 15:46:40');

-- Listage de la structure de table fluck_damien_expi1a. t_supression_compte
DROP TABLE IF EXISTS `t_supression_compte`;
CREATE TABLE IF NOT EXISTS `t_supression_compte` (
  `id_supression_compte` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_compte` int DEFAULT NULL,
  `Fk_compte_personne` int DEFAULT NULL,
  `Date_supression_compte` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_supression_compte`),
  KEY `Fk_personne_compte` (`Fk_personne_compte`),
  KEY `Fk_compte_personne` (`Fk_compte_personne`),
  CONSTRAINT `FK_t_supression_compte_t_compte` FOREIGN KEY (`Fk_compte_personne`) REFERENCES `t_compte` (`id_compte`),
  CONSTRAINT `FK_t_supression_compte_t_personne` FOREIGN KEY (`Fk_personne_compte`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_supression_compte : ~5 rows (environ)
INSERT INTO `t_supression_compte` (`id_supression_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_supression_compte`) VALUES
	(1, 1, 1, '2023-04-12 14:30:30'),
	(2, 2, 2, '2024-03-11 15:35:37'),
	(3, 3, 3, '2024-03-11 15:35:46'),
	(4, 4, 4, '2024-03-11 15:36:08'),
	(5, 5, 5, '2024-03-15 15:36:06');

-- Listage de la structure de table fluck_damien_expi1a. t_validation_evenement
DROP TABLE IF EXISTS `t_validation_evenement`;
CREATE TABLE IF NOT EXISTS `t_validation_evenement` (
  `id_validation_evenement` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_evenement` int DEFAULT NULL,
  `Fk_evenement_personne` int DEFAULT NULL,
  `Date_validation_evenement` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_validation_evenement`),
  KEY `Fk_personne_evenement` (`Fk_personne_evenement`),
  KEY `Fk_evenement_personne` (`Fk_evenement_personne`),
  CONSTRAINT `FK_t_validation_evenement_t_evenement` FOREIGN KEY (`Fk_evenement_personne`) REFERENCES `t_evenement` (`id_evenement`),
  CONSTRAINT `FK_t_validation_evenement_t_personne` FOREIGN KEY (`Fk_personne_evenement`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_validation_evenement : ~3 rows (environ)
INSERT INTO `t_validation_evenement` (`id_validation_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_validation_evenement`) VALUES
	(1, 1, 1, '2024-03-11 15:39:46'),
	(2, 2, 2, '2024-03-11 15:39:56'),
	(3, 3, 3, '2024-03-11 15:40:04');

-- Listage de la structure de table fluck_damien_expi1a. t_validation_materiel
DROP TABLE IF EXISTS `t_validation_materiel`;
CREATE TABLE IF NOT EXISTS `t_validation_materiel` (
  `id_validation_materiel` int NOT NULL AUTO_INCREMENT,
  `Fk_personne_materiel` int DEFAULT NULL,
  `Fk_materiel_personne` int DEFAULT NULL,
  `Date_validation_materiel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_validation_materiel`),
  KEY `Fk_personne_materiel` (`Fk_personne_materiel`),
  KEY `Fk_materiel_personne` (`Fk_materiel_personne`),
  CONSTRAINT `FK_materiel_personne` FOREIGN KEY (`Fk_materiel_personne`) REFERENCES `t_materiel` (`id_materiel`),
  CONSTRAINT `FK_personne_materiel` FOREIGN KEY (`Fk_personne_materiel`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a.t_validation_materiel : ~5 rows (environ)
INSERT INTO `t_validation_materiel` (`id_validation_materiel`, `Fk_personne_materiel`, `Fk_materiel_personne`, `Date_validation_materiel`) VALUES
	(1, 1, 1, '2024-03-11 15:47:03'),
	(2, 2, 2, '2024-03-11 15:47:04'),
	(3, 3, 3, '2024-03-11 15:47:05'),
	(4, 1, 5, '2024-03-11 15:47:06'),
	(5, 2, 4, '2024-03-11 15:47:07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
