-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 19 sep. 2023 à 05:06
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `money`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `videoURL` text NOT NULL,
  `description` text NOT NULL,
  `logoURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `videoURL`, `description`, `logoURL`) VALUES
(1, 'Netflix', 'https://youtube.com/', 'Netflix is a streaming service ... ', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAvVBMVEX///+tHiPVHybx39+oAACqCxPLhYasFRu7U1aqHiPSAADVFR6tHCHYHybTHya3HiT00dLIHyW1HiTDHyXUERrTAAfNHyW9HiTTABDUCRXHAADjfoDpnqDgcXTvu7z76+zYNzzzysveY2fnl5ncVVnrp6nXLDK3AADgbXD88/PaRkr33t/mkJLsrrDkhYfbUFTZQEXNkJG/ODy+Z2m8XmHutre4S07Ie33Vn6Dbrq/ivL3nyMns1NS+W17xw8S7nU0gAAAEqElEQVR4nO2ca0/iYBhE23JbKAVF0KIgoIKLF1xd2XV15f//rBUBpeXt0Pphw7yZ88mYPIknHS8zaXQcIYQQQgghhBBCCCGEEEIIIYQQQgixa+QqPiDxrJgvJZDP/cevPg254yCZyl7SWbFQTWD3DC8DL5HmSdJZseAmsHuGeWDotZLOqAz3gWFllnBGZXiEYvo94YzKsAyeoVdJOOMyRDFtTc1nVIZuHcTUvzCfcRnimI6NZ2SGKKbhrfGMy9BtoJheGc/IDMs1FNOe6YzN8ADFtGM6IzOEMQ36pjM2QxzTa8MZnSGKafvGcMZm6FZRTAPDGZ1h+RDF1NCD6QzdA1QwJptnfIYwpuHmGZ8hjulg44zP0IU9uLtxRmjoorlmswcTGsKYtk7jZ4SGMKb+WfyM0RDHNN6DGQ2z9WBGQzzXxHswpSGea2I9mNMQxjTWgykNcUz70TNOQxzTaA8mNUQxjfVgTkM819QiZ6SGeK6J9GBWQzTXRHswqSGOaXv9jNUQx3S9B9Mawpiu92BWQzjXRHowrWHqHkxrmLoH8xrimH72YF5DGNO1HsxriGN693FGbIjnmo8eTGyIYzpcnREb4pj2V2fMhi54hl5l9eUzG+IefL48YzaEc00wWp5RG6aaa7gNYUyXPZjaEMd02YO5DXFMFz2Y3BD24MXr+9yGcK5Z9mByQzjXtN5f32c3RDFd9GBywy0xnfdgdkMY03D++j69IYzp/PV9dsPtcw294dYeTG8Ie3DwwwZDHNOeBYYwpm89mN8Qx3RkgyFeFa8tMNwS03t+wy0xtcEQror+Q5XfEM413mGZ3xDONZ6XdMVkCOea4MgGw6/FlMgQxzSw4Bl+MaZUhqgHJ8aUyRDPNUHCb0QqQzjXeAfmh8hlCGNas8Cw+uCjmDb4DUs/L5CiOaZcho/TMHNMuQxfnUrmmHIZfnNgTPdND5HNEMbUs8FwDGNat8DQOcsaUzrD01bGmNIZ4p+mhoLBZ9htAkVDweAznMGHaMMzdNA3oiGmhIYn2WJKaLgHY7rRgwkNHR/t+xsFg9Fw0s4SU0bD60wFg9HQqaFFKh5TSsNzFNN4D6Y0zBRTSkOnn2Gu4TTsZOjBnIa9DD2Y09C5St+DSQ2H6WNKaojnmkjBIDXEq2LkLzdWQ7gqRnowq2H6mLIa4lVxPaa0hnBVXO/BtIapV0Vew7SrIq/hIOVcw2vohOl6MLEhXBVrNhjiVbFhgSFcFT9jymx4g+YazwZDPNfULTB0Riimqx5MbQhXRc8Gw1yamFIb4lVxGVNuQ7gqBjY8Q7wqHllgiFfFRcEgN7zdHlNywxRzDblhilWR3XC6da5hN4RzzXvBoDeEq2LNBsMZjGnDAsOtMeU3hKuiZ4MhXhXrFhg6bdyDLTCc4JhaYIhXxboFhnhV3LfBEK6KgQ2GeFW83D3DUqlQKOQ3efus2dAZ+b7fbLbbYdhqtSoL3j4Kw3a76R/vnGHh1+Pv+6c/zy9/c73eeP6/2Mbjce7vy/NT8fXVfNOp3Z11Jzed4fR0NhjszRkMZqe3w/NJ9yLYNUMhhBBCCCGEEEIIIYQQQgghhBBCCOE4/wCrFXsjMNulmAAAAABJRU5ErkJggg==');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `senderPhone` int(11) NOT NULL,
  `reciverPhone` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `transactionDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `senderPhone`, `reciverPhone`, `amount`, `transactionDate`) VALUES
(1, 99999999, 23732887, 200, '2023-09-19 02:41:42');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` text NOT NULL,
  `phone` int(11) NOT NULL,
  `password` text NOT NULL,
  `solde` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) NOT NULL DEFAULT 'client',
  `status` int(11) NOT NULL DEFAULT 1,
  `isActive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `fullName`, `phone`, `password`, `solde`, `type`, `status`, `isActive`) VALUES
(1, 'Aziz Jlassi', 23732887, '$2b$10$KCWSnirCnrGJ1SmKtFOgMOo5.CWfYCOq7EoDr9db1eWywE/XXQq9C', 1102, 'client', 1, 0),
(2, 'Aziz Jlassi MAIN', 99999999, '$2b$10$fQXXHa5ekMVIfk3tgWmNg.T1vVe3.i92QL3DuFGP9ROKK2vXwl56K', 99998399, 'admin', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `vocher`
--

CREATE TABLE `vocher` (
  `id` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  `code` text NOT NULL,
  `duration` text NOT NULL,
  `price` int(11) NOT NULL,
  `reedemedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vocher`
--

INSERT INTO `vocher` (`id`, `provider`, `code`, `duration`, `price`, `reedemedBy`) VALUES
(1, 1, '9999-9999-9999', '1 month', 23, 23732887);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocher`
--
ALTER TABLE `vocher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vocher`
--
ALTER TABLE `vocher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
