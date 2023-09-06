-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 06 sep. 2023 à 23:42
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `efk`
--

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `description`, `author`, `created_at`) VALUES
(1, 'Mathématiques de base', 'Ce cours vous enseignera les mathématiques de base.', NULL, '2023-09-05 22:18:42'),
(2, 'Introduction à la programmation', 'Découvrez les bases de la programmation.', NULL, '2023-09-05 22:18:42'),
(3, 'Science des données', 'Explorez le monde de la science des données.', NULL, '2023-09-05 22:18:42');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE `modules` (
  `module_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_order` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`module_id`, `course_id`, `module_name`, `module_order`, `content`) VALUES
(1, 1, 'Introduction aux mathématiques', 1, 'Ce module couvre les bases des mathématiques.'),
(2, 1, 'Algèbre linéaire', 2, 'Ce module se concentre sur l\'algèbre linéaire.'),
(3, 2, 'Introduction à la programmation', 1, 'Ce module vous apprendra à programmer.'),
(4, 2, 'Structures de données', 2, 'Ce module couvre les structures de données.'),
(5, 3, 'Leçons de vocabulaire', 1, 'Ce module vous apprendra du nouveau vocabulaire.'),
(6, 3, 'Grammaire avancée', 2, 'Ce module couvre des points de grammaire avancée de la langue.');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `createdAt`, `updatedAt`) VALUES
(1, 'Lufthansa', 'anthony.guerrand92@gmail.com', '$2b$10$GPFyFoMCkF6VJ.7Ap7uP1u6xLO.xLcXp/TaI4S/bLZF9pggoFqPXi', '2023-09-06 22:37:07', '2023-09-06 22:37:07'),
(2, 'wiziki', 'fqf@gmail.com', '$2b$10$M4NY5OdEcqckSemjKft4FO3Qmtf11GB0R.9BbDp.iFJFGPnXcG2L.', '2023-09-06 22:44:56', '2023-09-06 22:44:56'),
(3, 'ap_320', 'anthony.guerrand75@gmail.com', '$2b$10$fCGuuSPR4PyN4mCfXmAaSeiBG4hc.9hDEarrTAtUsIHysaU0RWBHm', '2023-09-06 22:51:43', '2023-09-06 22:51:43');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
