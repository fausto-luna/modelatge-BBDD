-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-01-2020 a las 13:14:33
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
-- Base de datos: `CulAmpolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fechaRegistro` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `recomendadoPor` varchar(45) NOT NULL,
  `Gafas_idGafas` int(6) NOT NULL,
  `Contacto_idContacto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contacto`
--

CREATE TABLE `Contacto` (
  `idContacto` int(6) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `numero` decimal(5,0) NOT NULL,
  `piso` varchar(10) NOT NULL,
  `puerta` varchar(10) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `idEmpleado` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `nif` varchar(45) NOT NULL,
  `Contacto_idContacto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gafas`
--

CREATE TABLE `Gafas` (
  `idGafas` int(6) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `graduacion1` decimal(2,0) NOT NULL,
  `graduacion2` decimal(2,0) NOT NULL,
  `montura` varchar(45) NOT NULL,
  `colorMontura` varchar(45) NOT NULL,
  `colorVidrio` varchar(45) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `Proveedor_idProveedor` int(6) NOT NULL,
  `Empleado_idEmpleado` int(6) NOT NULL,
  `Cliente_idCliente` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `idProveedor` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `Contacto_idContacto` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `Contacto_idContacto` (`Contacto_idContacto`);

--
-- Indices de la tabla `Contacto`
--
ALTER TABLE `Contacto`
  ADD PRIMARY KEY (`idContacto`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idContacto` (`idContacto`),
  ADD KEY `telefono` (`telefono`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `Contacto_idContacto` (`Contacto_idContacto`);

--
-- Indices de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD PRIMARY KEY (`idGafas`),
  ADD KEY `idGafas` (`idGafas`),
  ADD KEY `Proveedor_idProveedor` (`Proveedor_idProveedor`),
  ADD KEY `Empleado_idEmpleado` (`Empleado_idEmpleado`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `Contacto_idContacto` (`Contacto_idContacto`),
  ADD KEY `idProveedor` (`idProveedor`),
  ADD KEY `nif` (`nif`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`);

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `Empleado_ibfk_1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`);

--
-- Filtros para la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD CONSTRAINT `Gafas_ibfk_1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `Proveedor` (`idProveedor`),
  ADD CONSTRAINT `Gafas_ibfk_2` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `Empleado` (`idEmpleado`),
  ADD CONSTRAINT `Gafas_ibfk_3` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`);

--
-- Filtros para la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD CONSTRAINT `Proveedor_ibfk_1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
