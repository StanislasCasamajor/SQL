-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 11 jan. 2024 à 16:18
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `videotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `idAdherent` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`idAdherent`, `nom`, `prenom`) VALUES
(1, 'Eboué', 'Fabrice'),
(2, 'N\'jijol', 'Thomas');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `idAdresse` int(11) NOT NULL,
  `nomVoie` varchar(50) DEFAULT NULL,
  `typeVoie` varchar(50) DEFAULT NULL,
  `numBatiment` varchar(50) DEFAULT NULL,
  `codePostal` varchar(10) DEFAULT NULL,
  `Pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idAdresse`, `nomVoie`, `typeVoie`, `numBatiment`, `codePostal`, `Pays`) VALUES
(3, 'Colonnel Moutarde', 'Avenue', '3', '59000', 'France'),
(4, 'Louise Michel', 'Boulevard', '5', '13000', 'Fance');

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `idFilm` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `type`) VALUES
(1, 'épouvante'),
(2, 'comedie'),
(3, 'action'),
(4, 'aventure'),
(5, 'thriller');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `idFilm` int(11) NOT NULL,
  `acteur` varchar(50) DEFAULT NULL,
  `realisateur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idFilm`, `acteur`, `realisateur`) VALUES
(1, 'Brad Pitt', 'spielberg'),
(2, 'Leonardo Dicaprio', 'tarantino');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `date_location` date DEFAULT NULL,
  `heure_location` time DEFAULT NULL,
  `num_location` varchar(50) DEFAULT NULL,
  `idAdherent` int(11) NOT NULL,
  `idVideo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`date_location`, `heure_location`, `num_location`, `idAdherent`, `idVideo`) VALUES
('1995-05-18', '18:30:00', 'N°156108946', 1, 1),
('1980-09-30', '09:58:00', 'N°4168146', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `resider`
--

CREATE TABLE `resider` (
  `idAdherent` int(11) NOT NULL,
  `idAdresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `idVideo` int(11) NOT NULL,
  `NumVideo` varchar(50) DEFAULT NULL,
  `type_support` varchar(50) DEFAULT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `film` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`idVideo`, `NumVideo`, `type_support`, `titre`, `film`) VALUES
(1, 'N°154825', 'DVD', 'Le revanche des Siths', NULL),
(2, 'N°48915', 'Cassette', 'Tortues Ninja', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`idAdherent`);

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idAdresse`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`idFilm`,`idCategorie`),
  ADD KEY `idCategorie` (`idCategorie`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idFilm`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`idAdherent`,`idVideo`),
  ADD KEY `idVideo` (`idVideo`);

--
-- Index pour la table `resider`
--
ALTER TABLE `resider`
  ADD PRIMARY KEY (`idAdherent`,`idAdresse`),
  ADD KEY `idAdresse` (`idAdresse`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idVideo`),
  ADD KEY `film` (`film`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `idAdherent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `idFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `idVideo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`idAdherent`) REFERENCES `adherent` (`idAdherent`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`);

--
-- Contraintes pour la table `resider`
--
ALTER TABLE `resider`
  ADD CONSTRAINT `resider_ibfk_1` FOREIGN KEY (`idAdherent`) REFERENCES `adherent` (`idAdherent`),
  ADD CONSTRAINT `resider_ibfk_2` FOREIGN KEY (`idAdresse`) REFERENCES `adresse` (`idAdresse`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`film`) REFERENCES `film` (`idFilm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
