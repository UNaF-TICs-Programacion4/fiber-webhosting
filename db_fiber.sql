-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2016 a las 21:20:14
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_fiber`
--
CREATE DATABASE IF NOT EXISTS `db_fiber` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_fiber`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `rela_departamento` int(11) NOT NULL,
  `consulta_prioridad` tinyint(4) NOT NULL COMMENT '0:Baja, 5:Media, 10:Alta',
  `consulta_falta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `consulta_nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `consulta_email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `consulta_escliente` tinyint(1) NOT NULL COMMENT '0:No es, 1:Es Cliente',
  `consulta_dominio` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `consulta_asunto` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `consulta_mensaje` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `departamento_descri` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `departamento_descri`) VALUES
(1, 'Ventas'),
(2, 'Dominios'),
(3, 'Soporte Técnico'),
(4, 'Certificados Digitales (SSL)');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CONSULTA_DEPTO` (`rela_departamento`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `FK_CONSULTA_DEPTO` FOREIGN KEY (`rela_departamento`) REFERENCES `departamento` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
