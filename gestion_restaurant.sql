-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 03 juil. 2024 à 12:15
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_plat` varchar(4) NOT NULL,
  `nom_cli` varchar(20) NOT NULL,
  `type_commande` varchar(20) NOT NULL,
  `id_table` varchar(4) NOT NULL,
  `date_commande` date NOT NULL,
  PRIMARY KEY (`id_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_plat`, `nom_cli`, `type_commande`, `id_table`, `date_commande`) VALUES
('C015', 'P006', 'julie', 'table', 'T001', '2024-06-26'),
('C004', 'P001', 'julie', 'table', 'T001', '2024-06-26'),
('C014', 'P007', 'julie', 'table', 'T003', '2024-06-26'),
('C006', 'P003', 'julie', 'table', 'T004', '2024-06-26'),
('C007', 'P004', 'harisoa', 'table', 'T005', '2024-06-26'),
('C008', 'P005', 'julie', 'table', 'T005', '2024-06-26'),
('C009', 'P003', 'julie', 'table', 'R002', '2024-06-26'),
('C010', 'P002', 'julie', 'table', 'R002', '2024-06-26'),
('C011', 'P002', 'julie', 'table', 'T005', '2024-06-26'),
('C012', 'P003', 'harisoa', 'table', 'T004', '2024-06-26'),
('C013', 'P003', 'harisoa', 'table', 'T005', '2024-06-26'),
('C016', 'P008', 'harisoa', 'table', 'R002', '2024-06-26'),
('C017', 'P09', 'julie', 'table', 'T004', '2024-06-26'),
('C018', 'P010', 'julie', 'table', 'R002', '2024-06-26'),
('C020', 'P009', 'harisoa', 'table', 'T003', '2024-06-26'),
('C021', 'P010', 'julie', 'table', 'T003', '2024-06-26'),
('C022', 'P003', 'julie', 'table', 'T002', '2024-06-26'),
('C023', 'P001', 'harisoa', 'Sur table', 'T004', '2024-06-26'),
('C024', 'P002', 'julie', 'Emporter', 'R002', '2024-06-26');

-- --------------------------------------------------------

--
-- Structure de la table `commande1`
--

DROP TABLE IF EXISTS `commande1`;
CREATE TABLE IF NOT EXISTS `commande1` (
  `id_commade1` int NOT NULL AUTO_INCREMENT,
  `id_plat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_commande` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Emporter',
  `id_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '   ',
  `etat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'new',
  `qte` int NOT NULL DEFAULT '1',
  `id_facture` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_commade1`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande1`
--

INSERT INTO `commande1` (`id_commade1`, `id_plat`, `type_commande`, `id_table`, `etat`, `qte`, `id_facture`) VALUES
(84, 'P011', 'Sur table', 'T001', 'ok', 1, 92),
(83, 'P002', 'Emporter', 'emporter', 'ok', 1, 91),
(82, 'P003', 'Emporter', 'emporter', 'ok', 1, 91),
(81, 'P006', 'Emporter', 'emporter', 'ok', 1, 91),
(79, 'P011', 'Sur table', 'T004', 'ok', 2, 90),
(80, 'P009', 'Sur table', 'T004', 'ok', 1, 90),
(77, 'P007', 'Emporter', 'emporter', 'ok', 1, 89),
(70, 'P007', 'Sur table', 'T003', 'ok', 2, 81),
(74, 'P004', 'Sur table', 'T001', 'ok', 5, 88),
(76, 'P007', 'Emporter', 'emporter', 'ok', 2, 89),
(75, 'P005', 'Sur table', 'T001', 'ok', 2, 88),
(90, 'P001', 'Emporter', 'emporter', 'ok', 1, 93),
(89, 'P007', 'Emporter', 'emporter', 'ok', 1, 93),
(88, 'P011', 'emporter', 'emporter', 'ok', 1, 92),
(87, 'P010', 'Sur table', 'T001', 'ok', 1, 92),
(86, 'P003', 'Sur table', 'T001', 'ok', 1, 92),
(69, 'P007', 'Emporter', '   ', 'ok', 1, 79),
(94, 'P014', 'Sur table', 'T006', 'ok', 1, 96),
(93, 'P015', 'Sur table', 'T006', 'ok', 1, 96);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_facture` int NOT NULL AUTO_INCREMENT,
  `nom_cli` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_facture` date NOT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `nom_cli`, `date_facture`) VALUES
(93, 'tina', '2024-07-02'),
(92, 'julie', '2024-07-02'),
(91, 'ranja', '2024-07-02'),
(90, 'Nantenaina', '2024-07-02'),
(89, 'jenny', '2024-07-02'),
(88, 'cathie', '2024-07-02'),
(87, 'client', '2024-07-02'),
(86, 'Manda', '2024-07-02'),
(85, 'client', '2024-07-01'),
(84, 'client', '2024-07-01'),
(83, 'client', '2024-07-01'),
(82, 'julie iarisoa', '2024-05-31'),
(81, 'julie', '2024-07-01'),
(80, 'client', '2024-07-01'),
(79, 'julie', '2024-06-30'),
(78, 'harisoa', '2024-07-01'),
(77, 'harisoa', '2024-05-31'),
(76, 'julie', '2024-07-30'),
(94, 'tina', '2024-07-02'),
(95, 'julie', '2024-07-02'),
(96, 'xavier', '2024-07-02');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_plat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom_plat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pu` int NOT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_plat`, `nom_plat`, `pu`) VALUES
('P007', 'Ravitoto sy henakisoa', 10000),
('P006', 'akoho ritra', 10000),
('P005', 'saosisy gasy', 7000),
('P004', 'voanjobory sy hen\'omby', 12000),
('P003', 'tsaramaso sy hena kisoa', 12000),
('P002', 'vary amin\'anana', 2500),
('P001', 'Hen\'omby ritra', 5000),
('P008', 'kitoza', 2500),
('P009', 'lasary votabia', 1000),
('P010', 'Lasary karoty', 1500),
('P011', 'mine sao special', 15000),
('P012', 'mine sao simple', 5000),
('P013', 'ganagana saosy', 5000),
('P014', 'tacos', 15000),
('P015', 'assiette de nem', 5000);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

DROP TABLE IF EXISTS `reserver`;
CREATE TABLE IF NOT EXISTS `reserver` (
  `id_reserver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_reservation` date NOT NULL,
  `date_reserver` date NOT NULL,
  `nom_cli` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_reserver`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reserver`
--

INSERT INTO `reserver` (`id_reserver`, `id_table`, `date_reservation`, `date_reserver`, `nom_cli`) VALUES
('R004', 'T003', '2024-07-02', '2024-07-03', 'Faniry'),
('R003', 'T005', '2024-07-02', '2024-07-03', 'Jenny'),
('R002', 'T001', '2024-07-01', '2024-07-07', 'Julie'),
('R001', 'T002', '2024-07-01', '2024-07-02', 'Manda'),
('R005', 'T001', '2024-07-02', '2024-07-03', 'julie'),
('R007', 'T006', '2024-07-02', '2024-07-03', 'max');

-- --------------------------------------------------------

--
-- Structure de la table `table_resto`
--

DROP TABLE IF EXISTS `table_resto`;
CREATE TABLE IF NOT EXISTS `table_resto` (
  `id_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `designation` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Table1',
  PRIMARY KEY (`id_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `table_resto`
--

INSERT INTO `table_resto` (`id_table`, `designation`) VALUES
('T001', 'table1'),
('T002', 'table2'),
('T003', 'table3'),
('T004', 'Table4'),
('T006', 'papillon');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
