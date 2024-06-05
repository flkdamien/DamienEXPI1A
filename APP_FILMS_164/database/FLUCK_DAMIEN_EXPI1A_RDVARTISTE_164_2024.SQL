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


-- Listage de la structure de la base pour fluck_damien_expi1a_rdvartiste_164_2024
DROP DATABASE IF EXISTS `fluck_damien_expi1a_rdvartiste_164_2024`;
CREATE DATABASE IF NOT EXISTS `fluck_damien_expi1a_rdvartiste_164_2024` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fluck_damien_expi1a_rdvartiste_164_2024`;

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_compte
DROP TABLE IF EXISTS `t_compte`;
CREATE TABLE IF NOT EXISTS `t_compte` (
  `id_compte` int NOT NULL AUTO_INCREMENT,
  `Nom_Pseudo` varchar(50) DEFAULT NULL,
  `Mot_de_passe` varchar(50) DEFAULT NULL,
  `fk_type_compte` int DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `Url_image` varchar(9000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `FK_t_compte_t_type_compte` (`fk_type_compte`),
  CONSTRAINT `FK_t_compte_t_type_compte` FOREIGN KEY (`fk_type_compte`) REFERENCES `t_type_compte` (`id_type_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_compte : ~15 rows (environ)
INSERT INTO `t_compte` (`id_compte`, `Nom_Pseudo`, `Mot_de_passe`, `fk_type_compte`, `is_delete`, `Url_image`) VALUES
	(1, 'TheoThiste', '1234', 2, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Angela_White.jpg/640px-Angela_White.jpg'),
	(2, 'Lezarabe', '6969', 2, 0, 'data:image/jpeg;base64,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'),
	(3, 'SuciteLair', '969696', 1, 0, 'data:image/jpeg;base64,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'),
	(4, 'Jeancultamer', 'pasdinspi', 2, 0, 'https://img.over-blog.com/280x372/4/04/95/16/Series/acteurs-actrices/sofia-vergara-sexy-serie-hot.jpg'),
	(5, 'GeorgeSauciflar', 'Informatique=merde', 2, 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWyPjrI2AKat-Qp6-nyuqnAQ-vu6dNCmhWdQ&s'),
	(6, 'groscon', NULL, 1, 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqLf1lAsxEEJgESvxczlSlH2ozFr92NSACcQ&s'),
	(9, 'wetwetw', 'ertq', 1, 0, NULL),
	(10, 'rztzr', 'ztrz', 2, 0, NULL),
	(11, 'tzstzueu', 'dghjghj', 2, 0, NULL),
	(12, 'aaaaaaaaaaaaa', 'ssssssssssssssss', 2, 0, NULL),
	(13, 'aaaaaaaaaaaaaaaaa', 'sssss', 1, 0, NULL),
	(14, 'dghjdgzj', 'cghjdghj', 1, 0, NULL),
	(15, 'sgsfh', 'sfhgsh', 2, 0, NULL),
	(16, 'gfhsfgh', 'dghjdgjh', 2, 0, NULL),
	(17, 'dghj', 'dghjd', 1, 0, NULL);

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_creation_compte
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_creation_compte : ~6 rows (environ)
INSERT INTO `t_creation_compte` (`id_creation_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_creation_compte`) VALUES
	(1, 1, 1, '2024-03-11 15:32:54'),
	(2, 2, 2, '2024-03-11 15:33:12'),
	(3, 3, 3, '2024-03-11 15:33:22'),
	(4, 4, 4, '2024-03-11 15:33:31'),
	(5, 5, 5, '2024-03-11 15:33:40'),
	(6, 6, 1, '2024-05-19 15:26:29');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_declination_evenement
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_declination_evenement : ~2 rows (environ)
INSERT INTO `t_declination_evenement` (`id_declination_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_declination_evenement`) VALUES
	(4, 4, 4, '2024-03-11 15:37:24'),
	(5, 5, 5, '2024-03-11 15:37:32');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_declination_materiel
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_declination_materiel : ~2 rows (environ)
INSERT INTO `t_declination_materiel` (`id_decliantion_materiel`, `Fk_personne_materiel`, `Fk_materiel_personne`, `Date_declination_materiel`) VALUES
	(4, 4, 4, '2024-03-12 15:43:41'),
	(5, 5, 5, '2024-03-12 15:43:31');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_evenement
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_evenement : ~5 rows (environ)
INSERT INTO `t_evenement` (`id_evenement`, `Nom_evenement`, `Lieu_evenement`, `Date_evenement`, `Description_evenement`, `Nom_sponsor`) VALUES
	(1, 'Concert Effeiel', 'Paris', '2030-03-11 15:24:05', 'descrpition très original', 'Ville de Paris'),
	(2, 'Concert Abeille', 'Ruche', '2025-03-11 15:25:59', NULL, 'MielPops'),
	(3, 'Concert incroyable', 'Lausanne', '2029-03-11 15:26:57', NULL, NULL),
	(4, 'Concert de ouf', 'Yverdon', '2026-03-11 15:27:36', 'Un truc de dingue YEAH!!', NULL),
	(5, 'Concert 69', 'Marseille', '2031-03-11 15:28:42', 'ENORME', 'Migros');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_materiel
DROP TABLE IF EXISTS `t_materiel`;
CREATE TABLE IF NOT EXISTS `t_materiel` (
  `id_materiel` int NOT NULL AUTO_INCREMENT,
  `Nom_materiel` varchar(50) DEFAULT NULL,
  `Quantite_materiel` int DEFAULT NULL,
  `Couleur_materiel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_materiel : ~5 rows (environ)
INSERT INTO `t_materiel` (`id_materiel`, `Nom_materiel`, `Quantite_materiel`, `Couleur_materiel`) VALUES
	(1, 'Barre en metal', 10, 'Noir'),
	(2, 'Hache', 1, 'Rouge'),
	(3, 'Guitare', 4, 'Rouge'),
	(4, 'Haut-parleur', 6, 'Noir'),
	(5, 'Micro', 4, 'Gris');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_modification_compte
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_modification_compte : ~5 rows (environ)
INSERT INTO `t_modification_compte` (`id_modification_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_modification_compte`) VALUES
	(1, 1, 1, '2024-03-11 15:34:11'),
	(2, 2, 2, '2024-03-11 15:34:21'),
	(3, 3, 3, '2024-03-11 15:34:36'),
	(4, 4, 4, '2024-04-11 14:34:45'),
	(5, 5, 5, '2024-03-11 15:34:56');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_personne
DROP TABLE IF EXISTS `t_personne`;
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `Prenom` varchar(50) DEFAULT NULL,
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Date_Naissance` timestamp NULL DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_personne : ~7 rows (environ)
INSERT INTO `t_personne` (`id_personne`, `Prenom`, `Nom`, `Date_Naissance`, `Mail`, `Telephone`) VALUES
	(1, 'Theo', 'Thiste', '2004-03-06 09:05:35', 'theo.thiste@lol.ch', '0798763456'),
	(2, 'Leza', 'Rabe', '2000-03-06 09:07:11', 'lesa.rabe@bombe.ch', '0317774693'),
	(3, 'Lair', 'Sucite', '2001-03-06 09:08:30', 'sucite.laire@contrelesucide.ch', '0417787640'),
	(4, 'Jean', 'Cultamer', '2000-03-11 15:07:41', 'jean.cultamer@onlyfan.com', '0417709654'),
	(5, 'George', 'Sauciflare', '2010-03-11 15:08:03', 'george.sauciflare@saucisse.ch', '0917798753'),
	(6, 'Jade', 'Orlabite', '2010-03-11 15:48:55', 'jade.orlabite@xxx.com', '0779874565'),
	(7, 'rtzwtzr', 'wrtzwrtz', '2003-05-19 14:49:08', 'wrtzwrtz', 'qert');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_reservation_evenement
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_reservation_evenement : ~5 rows (environ)
INSERT INTO `t_reservation_evenement` (`id_reservation_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_reservation_evenement`) VALUES
	(1, 1, 1, '2024-03-11 15:38:27'),
	(2, 2, 2, '2024-03-11 15:38:36'),
	(3, 3, 3, '2024-03-11 15:38:44'),
	(4, 4, 4, '2024-03-11 15:38:53'),
	(5, 5, 5, '2024-03-11 15:39:02');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_reservation_materiel
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_reservation_materiel : ~7 rows (environ)
INSERT INTO `t_reservation_materiel` (`id_reservation_materiel`, `Fk_personne_materiel`, `Fk_materiel_personne`, `Date_reservation_personne`) VALUES
	(1, 1, 2, '2024-03-11 15:45:19'),
	(2, 2, 2, '2024-03-11 15:45:26'),
	(3, 3, 3, '2024-03-11 15:45:35'),
	(4, 4, 4, '2024-03-11 15:46:04'),
	(5, 5, 5, '2024-03-11 15:46:12'),
	(6, 1, 5, '2024-03-11 15:46:27'),
	(7, 2, 4, '2024-03-11 15:46:40');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_supression_compte
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_supression_compte : ~5 rows (environ)
INSERT INTO `t_supression_compte` (`id_supression_compte`, `Fk_personne_compte`, `Fk_compte_personne`, `Date_supression_compte`) VALUES
	(1, 1, 1, '2023-04-12 14:30:30'),
	(2, 2, 2, '2024-03-11 15:35:37'),
	(3, 3, 3, '2024-03-11 15:35:46'),
	(4, 4, 4, '2024-03-11 15:36:08'),
	(5, 5, 5, '2024-03-15 15:36:06');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_type_compte
DROP TABLE IF EXISTS `t_type_compte`;
CREATE TABLE IF NOT EXISTS `t_type_compte` (
  `id_type_compte` int NOT NULL AUTO_INCREMENT,
  `type_compte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_type_compte : ~2 rows (environ)
INSERT INTO `t_type_compte` (`id_type_compte`, `type_compte`) VALUES
	(1, 'Administrateur'),
	(2, 'Utilisateur');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_validation_evenement
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_validation_evenement : ~3 rows (environ)
INSERT INTO `t_validation_evenement` (`id_validation_evenement`, `Fk_personne_evenement`, `Fk_evenement_personne`, `Date_validation_evenement`) VALUES
	(1, 1, 1, '2024-03-11 15:39:46'),
	(2, 2, 2, '2024-03-11 15:39:56'),
	(3, 3, 3, '2024-03-11 15:40:04');

-- Listage de la structure de table fluck_damien_expi1a_rdvartiste_164_2024. t_validation_materiel
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

-- Listage des données de la table fluck_damien_expi1a_rdvartiste_164_2024.t_validation_materiel : ~5 rows (environ)
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
