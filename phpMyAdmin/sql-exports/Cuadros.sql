-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-01-2020 a las 10:59:41
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
-- Base de datos: `Cuadros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autor`
--

CREATE TABLE `Autor` (
  `idAutor` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `Cuadros_idCuadros` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuadro`
--

CREATE TABLE `Cuadro` (
  `idCuadro` int(6) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `Autor_idAutor` int(6) NOT NULL,
  `Cliente_idCliente` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`idAutor`),
  ADD KEY `idAutor` (`idAutor`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `Cuadro`
--
ALTER TABLE `Cuadro`
  ADD PRIMARY KEY (`idCuadro`),
  ADD KEY `idCuadro` (`idCuadro`),
  ADD KEY `Autor_idAutor` (`Autor_idAutor`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cuadro`
--
ALTER TABLE `Cuadro`
  ADD CONSTRAINT `Cuadro_ibfk_1` FOREIGN KEY (`Autor_idAutor`) REFERENCES `Autor` (`idAutor`),
  ADD CONSTRAINT `Cuadro_ibfk_2` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
