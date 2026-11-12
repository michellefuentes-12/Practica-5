-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-11-2026 a las 19:05:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tarea_sgi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` varchar(10) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion_general` text DEFAULT NULL,
  `unidad_medida` varchar(30) NOT NULL,
  `cod_proveedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `nombre_producto`, `descripcion_general`, `unidad_medida`, `cod_proveedor`) VALUES
('PROD001', 'Tornillos galvanizados', 'Tornillos para fijacion, paquete de 100 unidades.', 'Paquete', 'PRV001'),
('PROD002', 'Cemento gris 42.5 kg', 'Saco de cemento gris para construccion general.', 'Saco', 'PRV002'),
('PROD003', 'Pintura blanca interior', 'Pintura blanca base agua para interiores.', 'Galon', 'PRV003'),
('PROD004', 'Cable electrico THHN', 'Cable de cobre aislado para instalaciones electricas.', 'Metro', 'PRV004'),
('PROD005', 'Tuberia PVC de 1/2 pulgada', 'Tuberia PVC para instalaciones de agua.', 'Unidad', 'PRV005'),
('PROD006', 'Guantes de seguridad', 'Guantes de proteccion para mantenimiento.', 'Par', 'PRV006'),
('PROD007', 'Brocha de 3 pulgadas', 'Brocha para aplicacion de pintura.', 'Unidad', 'PRV003'),
('PROD008', 'Lampara LED de 18 W', 'Lampara LED de bajo consumo.', 'Unidad', 'PRV004'),
('PROD009', 'Adhesivo ceramico', 'Adhesivo para instalacion de ceramica.', 'Saco', 'PRV002'),
('PROD010', 'Cinta metrica de 5 m', 'Cinta metrica retractil para mediciones.', 'Unidad', 'PRV007');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `cod_proveedor` varchar(10) NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `fecha_alta` date NOT NULL,
  `nit_proveedor_rc` varchar(25) NOT NULL,
  `calificacion_proveedor` decimal(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`cod_proveedor`, `nombre_proveedor`, `fecha_alta`, `nit_proveedor_rc`, `calificacion_proveedor`) VALUES
('PRV001', 'Distribuidora Alfa', '2024-01-15', 'NIT-DEMO-001', 4.5),
('PRV002', 'Materiales El Constructor', '2024-02-02', 'NIT-DEMO-002', 4.7),
('PRV003', 'Pinturas Centroamericanas', '2024-02-20', 'NIT-DEMO-003', 4.2),
('PRV004', 'ElectroSuministros', '2024-03-10', 'NIT-DEMO-004', 4.6),
('PRV005', 'PVC y Tuberias del Valle', '2024-03-25', 'NIT-DEMO-005', 4.0),
('PRV006', 'Seguridad Industrial SV', '2024-04-12', 'NIT-DEMO-006', 4.8),
('PRV007', 'Herramientas Orion', '2024-05-05', 'NIT-DEMO-007', 4.4),
('PRV008', 'Maderas y Acabados', '2024-05-21', 'NIT-DEMO-008', 3.9),
('PRV009', 'Limpieza Integral', '2024-06-08', 'NIT-DEMO-009', 4.1),
('PRV010', 'Empaques del Pacifico', '2024-06-30', 'NIT-DEMO-010', 4.3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `numero_kardex` int(11) NOT NULL,
  `numero_compra` varchar(20) DEFAULT NULL,
  `numero_venta` varchar(20) DEFAULT NULL,
  `cod_producto` varchar(10) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `tipo_transaccion` enum('Entrada','Salida','Ajuste') NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `cantidad_producto` decimal(10,2) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `comentario_transaccion` varchar(255) DEFAULT NULL,
  `factura_proveedor_doc_ingreso` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`numero_kardex`, `numero_compra`, `numero_venta`, `cod_producto`, `ubicacion`, `tipo_transaccion`, `fecha_movimiento`, `cantidad_producto`, `precio_producto`, `comentario_transaccion`, `factura_proveedor_doc_ingreso`) VALUES
(1, 'PC-0001', NULL, 'PROD001', 'BOD-A-01', 'Entrada', '2026-09-01', 100.00, 3.50, 'Ingreso inicial de tornillos.', 'FAC-PRV-0001'),
(2, 'PC-0002', NULL, 'PROD002', 'BOD-C-01', 'Entrada', '2026-09-02', 40.00, 8.75, 'Recepcion de sacos de cemento.', 'FAC-PRV-0002'),
(3, 'PC-0003', NULL, 'PROD003', 'BOD-A-02', 'Entrada', '2026-09-03', 25.00, 12.50, 'Ingreso de pintura blanca.', 'FAC-PRV-0003'),
(4, 'PC-0004', NULL, 'PROD004', 'BOD-D-01', 'Entrada', '2026-09-04', 200.00, 1.80, 'Ingreso de cable electrico.', 'FAC-PRV-0004'),
(5, 'PC-0005', NULL, 'PROD005', 'BOD-B-01', 'Entrada', '2026-09-05', 60.00, 2.25, 'Recepcion de tuberia PVC.', 'FAC-PRV-0005'),
(6, NULL, 'VN-0001', 'PROD006', 'BOD-D-02', 'Salida', '2026-09-06', 5.00, 4.00, 'Salida de guantes por venta.', NULL),
(7, NULL, 'VN-0002', 'PROD007', 'DESP-01', 'Salida', '2026-09-07', 3.00, 2.75, 'Brochas preparadas para despacho.', NULL),
(8, 'PC-0008', NULL, 'PROD008', 'BOD-D-01', 'Entrada', '2026-09-08', 30.00, 6.90, 'Ingreso de lamparas LED.', 'FAC-PRV-0008'),
(9, NULL, 'VN-0003', 'PROD009', 'BOD-C-02', 'Salida', '2026-09-09', 4.00, 9.25, 'Salida de adhesivo ceramico.', NULL),
(10, NULL, NULL, 'PROD010', 'REC-01', 'Ajuste', '2026-09-10', 1.00, 5.50, 'Ajuste por conteo fisico.', 'ACTA-AJ-001');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `cod_proveedor` (`cod_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`cod_proveedor`),
  ADD UNIQUE KEY `nit_proveedor_rc` (`nit_proveedor_rc`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`numero_kardex`),
  ADD KEY `cod_producto` (`cod_producto`),
  ADD KEY `ubicacion` (`ubicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `numero_kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
