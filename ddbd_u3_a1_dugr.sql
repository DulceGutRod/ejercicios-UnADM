-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2026 at 03:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddbd_u3_a1_dugr`
--

-- --------------------------------------------------------

--
-- Table structure for table `actores`
--

CREATE TABLE `actores` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Nacionalidad` varchar(50) NOT NULL,
  `Fecha de Nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `actores`
--

INSERT INTO `actores` (`ID`, `Nombre`, `Nacionalidad`, `Fecha de Nacimiento`) VALUES
(1, 'Marlon Brando', 'Estadounidense', '1924-04-03'),
(2, 'Al Pacino', 'Estadounidense', '1940-04-25'),
(3, 'Viggo Mortensen', 'Estadounidense-Danés', '1958-10-20'),
(4, 'Matthew McConaughey', 'Estadounidense', '1969-11-04'),
(5, 'Uma Thurman', 'Estadounidense', '1970-04-29'),
(6, 'Michelle Yeoh', 'Malaya', '1962-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `elenco`
--

CREATE TABLE `elenco` (
  `ID_Pelicula` int(10) UNSIGNED NOT NULL,
  `ID_Actor` int(10) UNSIGNED NOT NULL,
  `Personaje` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `elenco`
--

INSERT INTO `elenco` (`ID_Pelicula`, `ID_Actor`, `Personaje`) VALUES
(1, 1, 'Don Vito Corleone'),
(1, 2, 'Michael Corleone'),
(2, 2, 'Samsagaz'),
(2, 3, 'Aragorn'),
(3, 4, 'Joseph Cooper'),
(4, 5, 'Mia Wallace'),
(5, 6, 'Evelyn Wang');

-- --------------------------------------------------------

--
-- Table structure for table `películas`
--

CREATE TABLE `películas` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Título` varchar(100) NOT NULL,
  `año` int(11) NOT NULL,
  `Director` varchar(150) NOT NULL,
  `Género` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `películas`
--

INSERT INTO `películas` (`ID`, `Título`, `año`, `Director`, `Género`) VALUES
(1, 'El Padrino', 1972, 'Francis Ford', 'Drama/Crimen'),
(2, 'El Señor de los Anillos: La comunidad del Anillo', 2001, 'Peter Jackson', 'Fantasía/Aventura'),
(3, 'Interestelar', 2014, 'Christopher Nolan', 'Ciencia Ficción'),
(4, 'Pulp Fiction', 1994, 'Quentin Tarantino', 'Crimen/Comedia Negra'),
(5, 'Todo en Todas Partes al Mismo Tiempo', 2022, 'Daniel Kwan, Daniel Scheinert', 'Ciencia Ficción/Drama');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `elenco`
--
ALTER TABLE `elenco`
  ADD PRIMARY KEY (`ID_Pelicula`,`ID_Actor`),
  ADD KEY `ID_Actor` (`ID_Actor`),
  ADD KEY `ID_Pelicula` (`ID_Pelicula`);

--
-- Indexes for table `películas`
--
ALTER TABLE `películas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actores`
--
ALTER TABLE `actores`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `películas`
--
ALTER TABLE `películas`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `elenco`
--
ALTER TABLE `elenco`
  ADD CONSTRAINT `elenco_ibfk_1` FOREIGN KEY (`ID_Pelicula`) REFERENCES `películas` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `elenco_ibfk_2` FOREIGN KEY (`ID_Actor`) REFERENCES `actores` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
