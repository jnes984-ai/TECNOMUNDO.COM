-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2025 a las 05:15:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tecnomundo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `NUM_BOLETA` int(11) NOT NULL,
  `FECHA_EMI` date NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `COD_EMPLE` int(11) NOT NULL,
  `ESTADO_BOLETA` enum('PENDIENTE','PAGADO','ANULADO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `COD_CARGO` int(11) NOT NULL,
  `NOMBRE_CARGO` varchar(50) NOT NULL,
  `SUELDO_BASICO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `COD_CATE` char(6) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRES` varchar(30) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `FONO` varchar(15) DEFAULT NULL,
  `ID_DIRECCION` int(11) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `completo`
--

CREATE TABLE `completo` (
  `COD_COMPLETO` int(11) NOT NULL,
  `COD_EMPLE` int(11) NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleboleta`
--

CREATE TABLE `detalleboleta` (
  `NUM_BOLETA` int(11) NOT NULL,
  `ID_PRODUCTO` char(6) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `IMPORTE` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `ID_DIRECCION` int(11) NOT NULL,
  `DEPARTAMENTO` varchar(30) NOT NULL,
  `PROVINCIA` varchar(30) NOT NULL,
  `DETALLE_DIRECCION` varchar(70) NOT NULL,
  `REFERENCIA` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `COD_EMPLE` int(11) NOT NULL,
  `NOMBRES` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `DNI_EMPLE` char(8) NOT NULL,
  `ESTADO_CIVIL` varchar(15) DEFAULT NULL,
  `NIVEL_EDUCA` varchar(25) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL,
  `COD_CARGO` int(11) NOT NULL,
  `COD_SEDE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` char(6) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `PRECIO_VENTA` decimal(10,2) NOT NULL,
  `STOCK_MINIMO` int(11) NOT NULL,
  `STOCK_ACTUAL` int(11) NOT NULL,
  `COD_CATE` char(6) NOT NULL,
  `COD_SEDE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `COD_SEDE` int(11) NOT NULL,
  `METROS2` decimal(10,2) NOT NULL,
  `AFORO` int(11) NOT NULL,
  `NUM_PISOS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`NUM_BOLETA`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `COD_EMPLE` (`COD_EMPLE`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`COD_CARGO`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`COD_CATE`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD KEY `ID_DIRECCION` (`ID_DIRECCION`);

--
-- Indices de la tabla `completo`
--
ALTER TABLE `completo`
  ADD PRIMARY KEY (`COD_COMPLETO`),
  ADD KEY `COD_EMPLE` (`COD_EMPLE`),
  ADD KEY `ID_DIRECCION` (`ID_DIRECCION`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD PRIMARY KEY (`NUM_BOLETA`,`ID_PRODUCTO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`ID_DIRECCION`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`COD_EMPLE`),
  ADD UNIQUE KEY `DNI_EMPLE` (`DNI_EMPLE`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD KEY `ID_DIRECCION` (`ID_DIRECCION`),
  ADD KEY `COD_CARGO` (`COD_CARGO`),
  ADD KEY `COD_SEDE` (`COD_SEDE`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `COD_CATE` (`COD_CATE`),
  ADD KEY `COD_SEDE` (`COD_SEDE`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`COD_SEDE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `boleta_ibfk_2` FOREIGN KEY (`COD_EMPLE`) REFERENCES `empleado` (`COD_EMPLE`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `direccion` (`ID_DIRECCION`);

--
-- Filtros para la tabla `completo`
--
ALTER TABLE `completo`
  ADD CONSTRAINT `completo_ibfk_1` FOREIGN KEY (`COD_EMPLE`) REFERENCES `empleado` (`COD_EMPLE`),
  ADD CONSTRAINT `completo_ibfk_2` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `direccion` (`ID_DIRECCION`),
  ADD CONSTRAINT `completo_ibfk_3` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`);

--
-- Filtros para la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD CONSTRAINT `detalleboleta_ibfk_1` FOREIGN KEY (`NUM_BOLETA`) REFERENCES `boleta` (`NUM_BOLETA`),
  ADD CONSTRAINT `detalleboleta_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `direccion` (`ID_DIRECCION`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`COD_CARGO`) REFERENCES `cargos` (`COD_CARGO`),
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`COD_SEDE`) REFERENCES `sede` (`COD_SEDE`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`COD_CATE`) REFERENCES `categorias` (`COD_CATE`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`COD_SEDE`) REFERENCES `sede` (`COD_SEDE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
