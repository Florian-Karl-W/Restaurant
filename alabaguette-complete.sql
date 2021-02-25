-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 14 fév. 2021 à 21:14
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `alabaguette`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'entree'),
(2, 'plat'),
(3, 'dessert'),
(4, 'vin');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210209101415', '2021-02-09 10:14:31', 461),
('DoctrineMigrations\\Version20210209222838', '2021-02-10 09:18:48', 577),
('DoctrineMigrations\\Version20210209223153', '2021-02-10 09:18:48', 1190);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image`, `category_id`) VALUES
(1, 'Saumon bio cuit au sel fume ', 15, 'https://cdn.pixabay.com/photo/2017/03/21/14/52/rice-cake-2162364_1280.jpg', 1),
(2, 'Langoustine a la nage', 25, 'https://cdn.pixabay.com/photo/2014/01/08/12/50/lobster-240558_1280.jpg', 1),
(3, 'Roule de carpaccio de boeuf ', 15, 'https://cdn.pixabay.com/photo/2017/02/13/18/56/beef-2063437_1280.jpg', 1),
(4, 'Saint-Jacques Rossini', 26, 'https://cdn.pixabay.com/photo/2017/07/01/22/08/saint-jacques-nuts-2462910_1280.jpg', 2),
(5, 'Ballotine de poulet ', 24, 'https://cdn.pixabay.com/photo/2017/06/21/22/42/recipe-2428926_1280.jpg', 2),
(6, 'Homard bleu et ris de veau croustillant', 28, 'https://cdn.pixabay.com/photo/2017/09/10/15/03/lobster-2735863_1280.jpg', 2),
(7, 'Selection de fruits frais', 14, 'https://cdn.pixabay.com/photo/2017/05/11/19/44/fruit-2305192_1280.jpg', 3),
(8, 'Glace et sorbet', 12, 'https://cdn.pixabay.com/photo/2018/08/16/22/59/ice-3611698_1280.jpg', 3),
(9, 'Tarte au chocolat', 12, 'https://cdn.pixabay.com/photo/2016/05/10/21/20/cake-1384702_1280.jpg', 3),
(10, 'Chateauneuf-du-Pape ', 45, 'https://cdn.pixabay.com/photo/2015/08/16/00/12/wine-890370_1280.jpg', 4),
(11, 'Nuits-Saint-Georges ', 39, 'https://cdn.pixabay.com/photo/2015/08/16/00/12/wine-890370_1280.jpg', 4),
(12, 'Savennieres', 33, 'https://cdn.pixabay.com/photo/2016/03/09/11/53/wine-glasses-1246240_1280.jpg', 4),
(13, 'Alsace Gruenspiel', 66, 'https://cdn.pixabay.com/photo/2016/03/09/11/53/wine-glasses-1246240_1280.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `nbperson` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `allergies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `firstname`, `lastname`, `phone`, `nbperson`, `date`, `allergies`, `num_table`) VALUES
(1, 'BLABLA', 'BLABLA', 54656769, 4, '2021-03-01 10:00:00', 'BLABLA', NULL),
(2, 'Florian ', 'Wunsch', 548419618, 2, '2021-02-14 18:35:09', 'Aucune', 'table_2'),
(3, 'Madiea ', 'Farooq', 548419618, 2, '2021-02-14 18:35:09', 'Aucune', 'table_1'),
(4, 'Guillaume', 'Nicolazo', 548419618, 2, '2021-02-14 18:35:09', 'Aucune', 'table_3'),
(5, 'Tiemoko', 'Diallo', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_4'),
(6, 'Morgane', 'Rivet', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_5'),
(7, 'Abdoul', 'Ndiaye', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(8, 'Lylia', 'Ayad', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(9, 'David', 'Azais', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(10, 'Arthur', 'Bacos', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(11, 'Ibrahima', 'Correa', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(12, 'Tony', 'Da Silva Paiva', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(13, 'Ryan', 'Ezzahhaf', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(14, 'Jean-Christophe', 'Gravinay', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(15, 'Hanine', 'Ouendi', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(16, 'Ayoub', 'Lafdail', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(17, 'Lucile', 'Liberge', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(18, 'Amine', 'Mohamed', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6'),
(19, 'Patrick', 'Razakarisoa', 548419618, 2, '2021-02-14 18:40:00', 'Aucune', 'Table_6');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(3, 'Random@random.com', '[]', '$2y$13$GGR72ynlTgudWu9SLyCDzeZitzDA7Om3lTOTekF9Un8j9jvAMH3vO', 0),
(4, 'Florian95.wunsch@gmail.com', '[]', '$2y$13$6luf4Qgfwx8Q0IR1I/Fvb.RR5KtE7GJqGGUUwe75IQ3P87KUIf0xm', 0),
(5, 'blabla', '[]', '$2y$13$QaJlWLMH0pMr3zSE8HnAhey5z8nUY2OrO.J8TdBXqxYhOzh.kyywW', 0),
(6, 'tiemoko.pro@gmail.com', '[]', '$2y$13$0Q/JdeNOyR2gKLAK7t7U/Ovhj6DSK3UXSEf8vNmKobq3oH320gLP6', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
