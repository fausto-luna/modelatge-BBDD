-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-01-2020 a las 10:25:57
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
-- Base de datos: `Vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Plane`
--

CREATE TABLE `Plane` (
  `idPlane` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Plane`
--

INSERT INTO `Plane` (`idPlane`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Seat`
--

CREATE TABLE `Seat` (
  `idSeat` int(5) NOT NULL,
  `Plane_idPlane` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Seat`
--

INSERT INTO `Seat` (`idSeat`, `Plane_idPlane`) VALUES
(1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Plane`
--
ALTER TABLE `Plane`
  ADD PRIMARY KEY (`idPlane`);

--
-- Indices de la tabla `Seat`
--
ALTER TABLE `Seat`
  ADD PRIMARY KEY (`idSeat`),
  ADD KEY `FK` (`Plane_idPlane`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Seat`
--
ALTER TABLE `Seat`
  ADD CONSTRAINT `Seat_ibfk_1` FOREIGN KEY (`Plane_idPlane`) REFERENCES `Plane` (`idPlane`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
