-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2023 a las 02:15:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `heris`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `esActivo` tinyint(1) DEFAULT 1,
  `fechaRegistro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `descripcion`, `esActivo`, `fechaRegistro`) VALUES
(1, 'Laptos', 0, '14/05/2023'),
(2, 'Celulares', 1, '14/05/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `total` float NOT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `producto` varchar(255) NOT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetalleVenta`, `cantidad`, `precio`, `total`, `idVenta`, `producto`, `idProducto`) VALUES
(1, 1, 10.99, 54.95, 1, '', NULL),
(2, 1, 10.99, 54.95, 2, '', NULL),
(3, 5, 10.99, 54.95, 6, 'Iphone xs', NULL),
(4, 5, 10.99, 54.95, 7, 'Iphone xs', NULL),
(5, 5, 10.99, 54.95, 8, 'Iphone xs', NULL),
(6, 5, 10.99, 54.95, 9, 'Iphone xs', NULL),
(7, 5, 10.99, 54.95, 10, 'Iphone xs', NULL),
(8, 5, 10.99, 54.95, 11, 'Iphone xs', NULL),
(9, 5, 10.99, 54.95, 12, 'Iphone xs', NULL),
(10, 5, 10.99, 54.95, 13, 'Iphone xs', NULL),
(11, 5, 10.99, 54.95, 14, 'Iphone xs', 1),
(12, 1, 10.99, 54.95, 15, 'Iphone xs', 1),
(13, 1, 10.99, 54.95, 15, 'lapiz', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menurols`
--

CREATE TABLE `menurols` (
  `idMenuRol` int(11) NOT NULL,
  `idMenu` int(11) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menurols`
--

INSERT INTO `menurols` (`idMenuRol`, `idMenu`, `idRol`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 4, 2),
(8, 5, 2),
(9, 3, 3),
(10, 4, 3),
(11, 5, 3),
(12, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `idMenu` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `icono` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`idMenu`, `nombre`, `icono`, `url`) VALUES
(1, 'DashBoard', 'dashboard', '/pages/dashboard'),
(2, 'Usuarios', 'group', '/pages/usuarios'),
(3, 'Productos', 'collections_bookmark', '/pages/productos'),
(4, 'Venta', 'currency_exchange', '/pages/venta'),
(5, 'Historial Ventas', 'edit_note', '/pages/historial_venta'),
(6, 'Reportes', 'receipt', '/pages/reportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float NOT NULL,
  `esActivo` tinyint(1) DEFAULT 1,
  `fechaRegistro` varchar(255) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `stock`, `precio`, `esActivo`, `fechaRegistro`, `idCategoria`) VALUES
(1, 'Iphone xs', 'Product description', 10, 1000000, 0, '2023-05-14', 2),
(2, 'lapiz', 'azul', 10, 1000000, 1, '2023-05-14', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `idRol` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `esActivo` tinyint(1) DEFAULT 1,
  `fechaRegistro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`idRol`, `descripcion`, `esActivo`, `fechaRegistro`) VALUES
(1, 'admin', 1, '06/06/2023'),
(2, 'user', 1, '14/05/2023'),
(3, 'supervisor', 1, '07/06/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `esActivo` tinyint(1) DEFAULT 1,
  `fechaRegistro` varchar(255) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `email`, `password`, `esActivo`, `fechaRegistro`, `idRol`) VALUES
(1, 'John Doe', 'johndoe@example.com', '$2a$10$pPtWINNRAAzKQgNg2k4gCee3W1YVpheTbt770i7uMaIQ5R4pIE/J.', 1, '2023-06-06', 2),
(2, 'Wilcar', 'Wilcar@example.com', '$2a$10$JQSC46F5JgAk.Ivl5BlA5udSXJ9IJ4ccaKwHjj1Xcxga2RbTRibGO', 0, '2023-06-06', NULL),
(3, 'Kenner', 'Kenner@example.com', '$2a$10$lxMNeYDi/nPsOFErDlJX.OLROj0zXwBrDygrdIwd.BlbfHzkACD8K', 1, '2023-06-06', NULL),
(4, 'Josofia', 'Josofia@example.com', '$2a$10$0WWknHtUkBEHqfvKb9mAt./jz8GijxILMT0ahsFO6OFODoZ2cF9aK', 1, '2023-06-06', NULL),
(5, 'sal', 'sal@example.com', '$2a$10$se5qDMdSWuJ86kRqEr4VWu2G7FHZJjuTNeGRG08H6rJudqqD8jJVy', 1, '2023-06-06', NULL),
(6, 'angie', 'angie@example.com', '$2a$10$tz6mO.COt0QMp45Z7a50Suv4paFijKRByAT7W1g2faL2pWDyI4CYm', 1, '2023-06-06', NULL),
(7, 'ansgie', 'angsie@example.com', '$2a$10$fJOorVJsMzGEkTauZTBWFOaVlc7v35y9fq4GEJoRb/7Em3BjsX2gi', 1, '2023-06-06', NULL),
(8, 'anssgie', 'angssie@example.com', '$2a$10$WAKV0dR7CPIDgeS7w33KtujS/2MBAcObXpnyqgHgmlDEoUCAilghi', 1, '2023-06-06', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `documentoCliente` varchar(255) NOT NULL,
  `nombreCliente` varchar(255) NOT NULL,
  `tipoPago` varchar(255) NOT NULL,
  `total` float NOT NULL,
  `fechaRegistro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVenta`, `documentoCliente`, `nombreCliente`, `tipoPago`, `total`, `fechaRegistro`) VALUES
(1, '1066865142', 'Wilcar Ortiz', 'Efectivo', 10000, '2023-06-07'),
(2, '1066865142', 'Kenner Espinal', 'Tarjeta', 100000, '2023-06-07'),
(3, '1066865142', 'Sofia', 'Efectivo', 100, '2023-06-07'),
(4, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(5, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(6, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(7, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(8, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(9, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(10, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(11, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(12, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(13, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(14, '1066865142', 'Wilar', 'Efectivo', 100, '2023-06-07'),
(15, '1066865142', 'Angie', 'Efectivo', 100, '2023-06-07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `menurols`
--
ALTER TABLE `menurols`
  ADD PRIMARY KEY (`idMenuRol`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `menurols`
--
ALTER TABLE `menurols`
  MODIFY `idMenuRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rols`
--
ALTER TABLE `rols`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `DetalleVenta_idProducto_foreign_idx` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_10` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_100` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_101` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_102` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_103` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_104` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_105` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_106` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_107` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_108` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_109` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_11` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_110` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_111` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_112` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_113` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_114` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_115` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_116` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_117` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_118` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_119` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_12` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_120` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_121` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_122` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_123` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_124` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_125` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_126` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_127` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_128` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_129` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_13` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_130` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_131` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_132` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_133` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_134` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_135` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_136` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_137` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_138` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_139` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_14` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_140` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_141` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_142` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_143` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_144` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_145` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_146` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_147` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_148` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_149` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_15` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_150` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_151` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_152` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_153` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_154` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_155` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_156` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_157` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_158` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_159` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_16` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_160` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_161` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_162` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_163` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_164` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_165` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_166` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_167` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_168` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_169` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_17` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_170` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_171` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_172` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_173` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_174` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_175` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_176` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_177` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_178` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_179` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_18` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_180` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_181` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_182` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_183` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_184` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_185` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_186` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_187` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_188` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_189` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_19` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_190` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_191` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_192` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_193` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_194` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_195` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_196` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_197` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_198` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_199` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_20` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_200` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_201` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_202` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_203` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_204` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_205` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_206` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_207` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_208` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_209` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_21` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_210` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_211` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_212` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_213` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_214` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_22` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_23` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_24` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_25` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_26` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_27` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_28` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_29` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_3` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_30` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_31` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_32` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_33` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_34` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_35` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_36` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_37` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_38` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_39` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_4` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_40` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_41` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_42` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_43` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_44` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_45` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_46` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_47` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_48` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_49` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_5` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_50` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_51` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_52` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_53` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_54` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_55` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_56` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_57` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_58` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_59` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_6` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_60` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_61` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_62` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_63` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_64` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_65` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_66` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_67` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_68` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_69` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_7` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_70` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_71` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_72` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_73` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_74` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_75` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_76` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_77` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_78` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_79` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_8` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_80` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_81` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_82` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_83` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_84` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_85` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_86` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_87` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_88` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_89` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_9` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_90` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_91` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_92` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_93` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_94` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_95` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_96` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_97` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_98` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleventa_ibfk_99` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `menurols`
--
ALTER TABLE `menurols`
  ADD CONSTRAINT `menurols_ibfk_1` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_10` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_11` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_12` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_13` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_14` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_15` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_16` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_17` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_18` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_19` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_20` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_21` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_22` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_23` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_24` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_25` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_26` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_27` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_28` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_29` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_3` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_30` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_31` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_32` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_33` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_34` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_35` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_36` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_37` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_38` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_39` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_4` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_40` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_41` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_42` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_43` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_44` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_45` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_46` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_47` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_48` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_49` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_5` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_50` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_51` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_52` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_53` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_54` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_55` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_56` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_57` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_58` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_59` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_6` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_60` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_61` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_62` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_63` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_64` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_65` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_66` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_67` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_68` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_7` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_8` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menurols_ibfk_9` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_10` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_100` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_101` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_102` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_103` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_104` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_105` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_106` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_107` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_108` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_11` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_12` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_13` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_14` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_15` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_16` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_17` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_18` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_19` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_20` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_21` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_22` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_23` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_24` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_25` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_26` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_27` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_28` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_29` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_30` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_31` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_32` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_33` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_34` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_35` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_36` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_37` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_38` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_39` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_4` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_40` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_41` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_42` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_43` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_44` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_45` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_46` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_47` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_48` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_49` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_5` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_50` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_51` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_52` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_53` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_54` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_55` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_56` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_57` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_58` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_59` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_6` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_60` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_61` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_62` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_63` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_64` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_65` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_66` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_67` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_68` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_69` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_7` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_70` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_71` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_72` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_73` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_74` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_75` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_76` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_77` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_78` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_79` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_8` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_80` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_81` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_82` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_83` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_84` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_85` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_86` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_87` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_88` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_89` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_9` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_90` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_91` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_92` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_93` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_94` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_95` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_96` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_97` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_98` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_99` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_10` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_100` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_101` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_102` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_103` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_104` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_105` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_106` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_107` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_108` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_11` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_12` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_13` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_14` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_15` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_16` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_17` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_18` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_19` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_20` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_21` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_22` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_23` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_24` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_25` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_26` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_27` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_28` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_29` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_30` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_31` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_32` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_33` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_34` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_35` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_36` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_37` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_38` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_39` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_40` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_41` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_42` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_43` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_44` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_45` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_46` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_47` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_48` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_49` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_5` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_50` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_51` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_52` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_53` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_54` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_55` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_56` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_57` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_58` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_59` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_6` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_60` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_61` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_62` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_63` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_64` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_65` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_66` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_67` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_68` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_69` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_7` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_70` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_71` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_72` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_73` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_74` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_75` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_76` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_77` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_78` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_79` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_8` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_80` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_81` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_82` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_83` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_84` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_85` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_86` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_87` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_88` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_89` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_9` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_90` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_91` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_92` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_93` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_94` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_95` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_96` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_97` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_98` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_99` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
