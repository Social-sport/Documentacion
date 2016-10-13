-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.11.148.2:3306
-- Tiempo de generación: 13-10-2016 a las 10:27:07
-- Versión del servidor: 5.5.50
-- Versión de PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `socialsport`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Amigos`
--

CREATE TABLE IF NOT EXISTS `Amigos` (
  `usuario` varchar(60) NOT NULL,
  `amigo` varchar(60) NOT NULL,
  PRIMARY KEY (`usuario`,`amigo`),
  KEY `amigo` (`amigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentario`
--

CREATE TABLE IF NOT EXISTS `Comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `texto` text NOT NULL,
  `hora` time NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuario`,`evento`),
  KEY `usuario` (`usuario`),
  KEY `evento` (`evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Deporte`
--

CREATE TABLE IF NOT EXISTS `Deporte` (
  `Nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Deporte`
--

INSERT INTO `Deporte` (`Nombre`) VALUES
('prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DeporteSuscrito`
--

CREATE TABLE IF NOT EXISTS `DeporteSuscrito` (
  `deporte` varchar(60) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  PRIMARY KEY (`deporte`,`usuario`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evento`
--

CREATE TABLE IF NOT EXISTS `Evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `deporte` varchar(60) NOT NULL,
  `creador` varchar(60) NOT NULL,
  PRIMARY KEY (`id`,`deporte`,`creador`),
  KEY `deporte` (`deporte`),
  KEY `creador` (`creador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EventoSuscrito`
--

CREATE TABLE IF NOT EXISTS `EventoSuscrito` (
  `idEvento` int(11) NOT NULL,
  `Usuario` varchar(60) NOT NULL,
  PRIMARY KEY (`idEvento`,`Usuario`),
  KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `email` varchar(60) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `foto` varchar(120) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Amigos`
--
ALTER TABLE `Amigos`
  ADD CONSTRAINT `Amigos_ibfk_2` FOREIGN KEY (`amigo`) REFERENCES `Usuario` (`email`),
  ADD CONSTRAINT `Amigos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`email`);

--
-- Filtros para la tabla `Comentario`
--
ALTER TABLE `Comentario`
  ADD CONSTRAINT `Comentario_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `Evento` (`id`),
  ADD CONSTRAINT `Comentario_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`email`);

--
-- Filtros para la tabla `DeporteSuscrito`
--
ALTER TABLE `DeporteSuscrito`
  ADD CONSTRAINT `DeporteSuscrito_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`email`),
  ADD CONSTRAINT `DeporteSuscrito_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `Deporte` (`Nombre`);

--
-- Filtros para la tabla `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `Evento_ibfk_2` FOREIGN KEY (`creador`) REFERENCES `Usuario` (`email`),
  ADD CONSTRAINT `Evento_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `Deporte` (`Nombre`);

--
-- Filtros para la tabla `EventoSuscrito`
--
ALTER TABLE `EventoSuscrito`
  ADD CONSTRAINT `EventoSuscrito_ibfk_2` FOREIGN KEY (`Usuario`) REFERENCES `Usuario` (`email`),
  ADD CONSTRAINT `EventoSuscrito_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `Evento` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
