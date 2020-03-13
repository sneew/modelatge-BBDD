-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2020 a las 11:24:28
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culdampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `idclients` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `data registre` datetime NOT NULL,
  `recomanacio` varchar(45) DEFAULT NULL,
  `empleat_idempleat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `idempleat` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `idproveidor` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) DEFAULT NULL,
  `nif` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `idulleres` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `graduacio dreta` int(11) NOT NULL,
  `graduacio esq` int(11) NOT NULL,
  `montura` varchar(45) NOT NULL,
  `color montura` varchar(45) NOT NULL,
  `color vidre dret` varchar(45) DEFAULT NULL,
  `color vidre esq` varchar(45) DEFAULT NULL,
  `preu` int(11) NOT NULL,
  `proveidor_idproveidor` int(11) NOT NULL,
  `empleat_idempleat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idclients`),
  ADD KEY `fk_clients_empleat1_idx` (`empleat_idempleat`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`idempleat`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`idproveidor`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`idulleres`),
  ADD KEY `fk_ulleres_proveidor_idx` (`proveidor_idproveidor`),
  ADD KEY `fk_ulleres_empleat1_idx` (`empleat_idempleat`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_empleat1` FOREIGN KEY (`empleat_idempleat`) REFERENCES `empleat` (`idempleat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `fk_ulleres_empleat1` FOREIGN KEY (`empleat_idempleat`) REFERENCES `empleat` (`idempleat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ulleres_proveidor` FOREIGN KEY (`proveidor_idproveidor`) REFERENCES `proveidor` (`idproveidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
