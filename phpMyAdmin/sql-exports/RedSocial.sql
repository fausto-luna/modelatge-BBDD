-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-01-2020 a las 12:03:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `RedSocial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ComoSeConocieron`
--

CREATE TABLE `ComoSeConocieron` (
  `idUsuario1` int(6) NOT NULL,
  `idUsuario2` int(6) NOT NULL,
  `comoSeConocieron` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Foto`
--

CREATE TABLE `Foto` (
  `idFoto` int(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  `photoLocation` varchar(255) NOT NULL,
  `Ususario_idUsuario` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `idUsuario` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ComoSeConocieron`
--
ALTER TABLE `ComoSeConocieron`
  ADD PRIMARY KEY (`idUsuario1`,`idUsuario2`),
  ADD KEY `idUsuario1` (`idUsuario1`,`idUsuario2`),
  ADD KEY `idUsuario2` (`idUsuario2`);

--
-- Indices de la tabla `Foto`
--
ALTER TABLE `Foto`
  ADD PRIMARY KEY (`idFoto`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `idFoto` (`idFoto`),
  ADD KEY `idFoto_2` (`idFoto`),
  ADD KEY `Ususario_idUsuario` (`Ususario_idUsuario`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contraseña` (`contraseña`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idUsuario_2` (`idUsuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ComoSeConocieron`
--
ALTER TABLE `ComoSeConocieron`
  ADD CONSTRAINT `ComoSeConocieron_ibfk_1` FOREIGN KEY (`idUsuario1`) REFERENCES `Usuario` (`idUsuario`),
  ADD CONSTRAINT `ComoSeConocieron_ibfk_2` FOREIGN KEY (`idUsuario2`) REFERENCES `Usuario` (`idUsuario`);

--
-- Filtros para la tabla `Foto`
--
ALTER TABLE `Foto`
  ADD CONSTRAINT `Foto_ibfk_1` FOREIGN KEY (`Ususario_idUsuario`) REFERENCES `Usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
