-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 22:23:40
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refresquera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE DATABASE refresquera;

USE refresquera;

CREATE TABLE `proveedor` (
  `IdProveedor` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigoPost` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`IdProveedor`, `nombre`, `codigoPost`, `telefono`, `correo`) VALUES
(1, 'Squirt', '29812', '2222897586', 'squirt@comercio.com'),
(2, 'Coca Cola', '28763', '2227998673', 'coca_cola@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresco`
--

CREATE TABLE `refresco` (
  `IdRefresco` int(11) NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  `refresco` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `volumen` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `refresco`
--

INSERT INTO `refresco` (`IdRefresco`, `IdProveedor`, `refresco`, `volumen`, `precio`, `descripcion`) VALUES
(1, 2, 'Coca cola', '2 L', 42, ''),
(2, 2, 'Coca cola', '600 ml', 12, ''),
(3, 1, 'Squirt', '2 L', 35, ''),
(4, 1, 'Squirt', '600 ml', 15, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `refresco`
--
ALTER TABLE `refresco`
  ADD PRIMARY KEY (`IdRefresco`),
  ADD KEY `IdProveedor` (`IdProveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IdProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `refresco`
--
ALTER TABLE `refresco`
  MODIFY `IdRefresco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `refresco`
--
ALTER TABLE `refresco`
  ADD CONSTRAINT `refresco_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedor` (`IdProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
