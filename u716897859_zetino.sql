-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-01-2026 a las 00:33:27
-- Versión del servidor: 11.8.3-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u716897859_zetino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas_stock`
--

CREATE TABLE `alertas_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_alerta` enum('STOCK_MINIMO','STOCK_AGOTADO','PROXIMO_VENCER') NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `fecha_alerta` datetime NOT NULL,
  `leida` tinyint(1) DEFAULT 0,
  `fecha_lectura` datetime DEFAULT NULL,
  `user_id_lectura` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas_stock`
--

INSERT INTO `alertas_stock` (`id`, `producto_id`, `sucursal_id`, `tipo_alerta`, `stock_actual`, `stock_minimo`, `fecha_alerta`, `leida`, `fecha_lectura`, `user_id_lectura`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'STOCK_MINIMO', 10, 10, '2025-12-15 18:38:42', 0, NULL, NULL, '2025-12-10 14:25:44', '2025-12-15 18:38:42'),
(2, 11, 1, 'STOCK_MINIMO', 3, 10, '2025-12-13 16:54:35', 0, NULL, NULL, '2025-12-13 16:54:35', '2025-12-13 16:54:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anulaciones_fel`
--

CREATE TABLE `anulaciones_fel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venta_id` bigint(20) UNSIGNED NOT NULL,
  `uuid_documento_anular` varchar(100) NOT NULL,
  `uuid_anulacion` varchar(100) DEFAULT NULL,
  `motivo` text NOT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` enum('PENDIENTE','CERTIFICADO','ERROR') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `anulaciones_fel`
--

INSERT INTO `anulaciones_fel` (`id`, `venta_id`, `uuid_documento_anular`, `uuid_anulacion`, `motivo`, `fecha_anulacion`, `user_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '975149AD-5FE1-48EA-8EF8-C6B714B57576', '975149AD-5FE1-48EA-8EF8-C6B714B57576', 'Prueba en sistema', '2025-12-10 14:32:08', 6, 'CERTIFICADO', '2025-12-10 14:32:08', '2025-12-10 14:32:08'),
(2, 6, 'F0371FDB-25D8-47EF-87C7-61612047B6B0', 'F0371FDB-25D8-47EF-87C7-61612047B6B0', 'Pruebas en el sistema.', '2025-12-15 11:30:57', 5, 'CERTIFICADO', '2025-12-15 11:30:57', '2025-12-15 11:30:57'),
(3, 7, 'E42FE80F-125A-465E-B07F-570839699A04', 'E42FE80F-125A-465E-B07F-570839699A04', 'Pruebas de sistema.', '2025-12-15 18:38:42', 5, 'CERTIFICADO', '2025-12-15 18:38:42', '2025-12-15 18:38:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Galón', 'Galones', 1, '2025-11-01 04:14:41', '2025-11-01 04:14:41'),
(2, 'TKS S', 'ASDASD', 1, '2025-11-01 04:14:51', '2025-11-01 04:14:51'),
(3, 'CAT 1', 'ASDASD', 1, '2025-11-01 04:15:05', '2025-11-01 04:15:05'),
(4, 'EPSON', NULL, 1, '2025-11-08 05:44:33', '2025-11-08 05:44:33'),
(5, 'IMPRESORA', NULL, 1, '2025-11-08 05:45:34', '2025-11-08 05:45:34'),
(6, 'LUBRICANTES', 'Diferentes tipos de lubricantes por litro', 1, '2025-11-19 20:07:42', '2025-11-19 20:07:42'),
(7, 'Eurol', 'Aceite 20W-50', 1, '2025-11-19 20:11:03', '2025-11-19 20:11:03'),
(8, 'Litro', NULL, 1, '2025-11-19 20:36:52', '2025-11-19 20:36:52'),
(9, 'LLANTAS DE MOTO', 'VARIEDAD DE LLANTAS', 1, '2025-11-20 12:43:23', '2025-11-20 12:43:23'),
(10, 'LLANTAS DE CARRO', NULL, 1, '2025-11-20 12:43:36', '2025-11-20 12:43:36'),
(11, 'REPUESTOS DE CARRO', NULL, 1, '2025-11-20 12:44:04', '2025-11-20 12:44:04'),
(12, 'LLANTAS', NULL, 1, '2025-11-20 12:44:19', '2025-11-20 12:44:19'),
(13, 'RESPUESTOS DE CARRO', NULL, 1, '2025-11-20 12:44:35', '2025-11-20 12:44:35'),
(14, 'MICHELIN', NULL, 1, '2025-11-20 12:44:54', '2025-11-20 12:44:54'),
(15, 'YOKOHAMA', NULL, 1, '2025-11-20 12:45:07', '2025-11-20 12:45:07'),
(16, 'GENERICA', NULL, 1, '2025-11-20 12:46:05', '2025-11-20 12:46:05'),
(17, 'MACHETES', NULL, 1, '2025-11-24 14:55:12', '2025-11-24 14:55:12'),
(18, 'Machete Bellota', NULL, 1, '2025-11-24 14:55:36', '2025-11-24 14:55:50'),
(19, 'Bellota', NULL, 1, '2025-11-24 14:56:03', '2025-11-24 14:56:03'),
(20, 'GRASA', 'Grasa variedad', 1, '2025-12-05 10:30:15', '2025-12-05 10:30:15'),
(21, 'Baterias', 'Baterias para carro', 1, '2025-12-05 10:30:38', '2025-12-05 10:30:38'),
(22, 'Porta Placas', NULL, 1, '2025-12-05 10:31:01', '2025-12-05 10:31:01'),
(23, 'LLantas para carro', NULL, 1, '2025-12-05 10:31:28', '2025-12-05 10:31:28'),
(24, 'Llantas para moto', NULL, 1, '2025-12-05 10:31:47', '2025-12-05 10:31:47'),
(25, 'Tornillos', 'Diferentes medidas', 1, '2025-12-05 10:32:19', '2025-12-05 10:32:19'),
(26, 'Unidad', NULL, 1, '2025-12-05 10:32:47', '2025-12-05 10:32:47'),
(27, 'Variedad', NULL, 1, '2025-12-05 10:33:07', '2025-12-05 10:33:07'),
(28, 'Castrol', NULL, 1, '2025-12-05 10:33:24', '2025-12-05 10:33:24'),
(29, 'Valvoline', NULL, 1, '2025-12-05 10:33:39', '2025-12-05 10:33:39'),
(30, 'Ursa', NULL, 1, '2025-12-05 10:33:49', '2025-12-05 10:33:49'),
(31, 'Ebullient', NULL, 1, '2025-12-05 10:34:09', '2025-12-05 10:34:09'),
(32, 'Bote', NULL, 1, '2025-12-05 10:56:58', '2025-12-05 10:56:58'),
(33, 'LUBRISOL', 'ACEITES', 1, '2025-12-07 11:15:39', '2025-12-07 11:15:39'),
(34, 'QUAKER', 'ACEITE', 1, '2025-12-07 11:16:06', '2025-12-07 11:16:06'),
(35, 'ATF', NULL, 1, '2025-12-07 11:16:26', '2025-12-07 11:16:26'),
(36, 'CEPSA', NULL, 1, '2025-12-07 11:16:37', '2025-12-07 11:16:37'),
(37, 'LOOK SPECIAL', NULL, 1, '2025-12-07 11:23:04', '2025-12-07 11:23:04'),
(38, 'GRASA PARA CARRO', NULL, 1, '2025-12-07 11:23:23', '2025-12-07 11:23:23'),
(39, 'KAWA', NULL, 1, '2025-12-07 11:28:51', '2025-12-07 11:28:51'),
(40, 'LTH', NULL, 1, '2025-12-13 16:25:29', '2025-12-13 16:25:29'),
(41, 'Crazy', NULL, 1, '2025-12-13 16:50:09', '2025-12-13 16:50:09'),
(42, 'stanley', NULL, 1, '2026-01-04 07:58:32', '2026-01-04 07:58:32'),
(43, 'Herramientas', NULL, 1, '2026-01-04 08:03:32', '2026-01-04 08:03:32'),
(44, 'Monroe', NULL, 1, '2026-01-04 08:09:21', '2026-01-04 08:09:21'),
(45, 'Aisin', NULL, 1, '2026-01-04 08:11:46', '2026-01-04 08:11:46'),
(46, 'RD', 'LLantas Para Moto', 1, '2026-01-04 08:13:45', '2026-01-04 08:13:45'),
(47, 'Kenda', NULL, 1, '2026-01-04 08:14:20', '2026-01-04 08:14:20'),
(48, 'KTC', 'Switch', 1, '2026-01-04 08:16:12', '2026-01-04 08:16:12'),
(49, 'Coyo', 'Cojinete', 1, '2026-01-06 07:48:20', '2026-01-06 07:48:20'),
(50, 'Fajas', 'Elefante', 1, '2026-01-06 07:49:23', '2026-01-06 07:49:23'),
(51, 'O.S.K', 'Kit Cadena De.tiempo', 1, '2026-01-06 07:52:54', '2026-01-06 07:52:54'),
(52, 'Yec', 'Tapa Distribuidor', 1, '2026-01-06 07:55:54', '2026-01-06 07:55:54'),
(53, 'Chromite', 'Partes Para Freno   O empaque Para Mordaza', 1, '2026-01-06 08:00:30', '2026-01-06 08:00:30'),
(54, 'Sanico', 'Bomba Auxiliar Para Cloch 22R', 1, '2026-01-06 08:03:51', '2026-01-06 08:03:51'),
(55, 'YOKOZUNA', 'Embolo Para Bomba Centrai Para Para Freno 22R', 1, '2026-01-06 08:08:57', '2026-01-06 08:08:57'),
(56, 'Soikon', 'Embolo Para Bomba Central De Freno 22R', 1, '2026-01-06 08:12:24', '2026-01-06 08:12:24'),
(57, 'Little Trees', 'Pinito', 1, '2026-01-06 08:42:21', '2026-01-06 08:42:21'),
(58, 'Microfiber Towels', 'Tohalla', 1, '2026-01-06 08:45:44', '2026-01-06 08:45:44'),
(59, 'RODATECH', 'Faja De Tiempo', 1, '2026-01-06 09:10:45', '2026-01-06 09:10:45'),
(60, 'TEONALE', 'Accessorio Electrico', 1, '2026-01-06 09:16:03', '2026-01-06 09:16:03'),
(61, 'NABEC', 'Bomba Auxiliar Para Cloch', 1, '2026-01-06 09:18:41', '2026-01-06 09:18:41'),
(62, 'FIC', 'Empaque mordaza 22R', 1, '2026-01-06 09:19:57', '2026-01-06 09:19:57'),
(63, 'JAPANYFORCE', 'Embolo Auxiliar Para Boma Central Para Cloch 22R', 1, '2026-01-06 09:25:07', '2026-01-06 09:25:07'),
(64, 'HK', 'Filtros De aseite', 1, '2026-01-06 14:22:19', '2026-01-06 14:22:19'),
(65, 'ADVENTURO', 'LLantas Para Auto', 1, '2026-01-06 14:29:00', '2026-01-06 14:29:00'),
(66, 'GENNESIS', 'LLantas Para Auto', 1, '2026-01-06 14:35:53', '2026-01-06 14:35:53'),
(67, 'NANKANG', 'LLantas Para Auto', 1, '2026-01-06 14:36:54', '2026-01-06 14:36:54'),
(68, 'ANCHEE', 'LLantas Para Auto', 1, '2026-01-06 14:37:43', '2026-01-06 14:37:43'),
(69, 'COOPER COBRA', 'LLantas Para Auto', 1, '2026-01-06 14:40:24', '2026-01-06 14:40:24'),
(70, 'VITOUR', 'LLantas Para Auto', 1, '2026-01-06 14:41:32', '2026-01-06 14:41:32'),
(71, 'LANVIGATOR', 'LLantas Para Auto', 1, '2026-01-06 14:43:02', '2026-01-06 14:43:02'),
(72, 'ANNAYTE', 'LLantas Para Auto', 1, '2026-01-06 14:44:41', '2026-01-06 14:44:41'),
(73, 'RIDANZA', 'LLantas Para Auto', 1, '2026-01-06 14:45:38', '2026-01-06 14:45:38'),
(74, 'TERRA EXPLORRER', 'LLanta Para Auto', 1, '2026-01-06 14:47:46', '2026-01-06 14:47:46'),
(75, 'ROADCRUZA', 'LLantas Para Auto', 1, '2026-01-06 14:48:58', '2026-01-06 14:48:58'),
(76, 'CHAMPIRO', 'LLantas Para Auto', 1, '2026-01-06 16:03:52', '2026-01-06 16:03:52'),
(77, 'ARIVO', 'LLantas Para Auto', 1, '2026-01-06 16:06:21', '2026-01-06 16:06:21'),
(78, 'COMPASAL', 'LLantas Para Auto', 1, '2026-01-06 16:12:41', '2026-01-06 16:12:41'),
(79, 'LANDSAIL', 'LLantas Para Auto', 1, '2026-01-06 16:15:05', '2026-01-06 16:15:05'),
(80, 'MIRAGE', 'LLantas Para Auto', 1, '2026-01-06 16:16:10', '2026-01-06 16:16:10'),
(81, 'APLUS ALL TERRAIN', 'LLantas Para Auto', 1, '2026-01-06 16:17:53', '2026-01-06 16:17:53'),
(82, 'BALLO', 'LLantas Para Auto', 1, '2026-01-06 16:21:53', '2026-01-06 16:21:53'),
(83, 'FORTUNER', 'LLantas Para Auto', 1, '2026-01-06 16:22:52', '2026-01-06 16:22:52'),
(84, 'ANNAITE', 'LLantas Para Auto', 1, '2026-01-06 16:27:25', '2026-01-06 16:27:25'),
(85, 'MASTERCRAFT', 'LLantas Para Auto', 1, '2026-01-06 16:28:35', '2026-01-06 16:28:35'),
(86, 'ATLAS', 'LLantas Para Auto', 1, '2026-01-06 16:31:17', '2026-01-06 16:31:17'),
(87, 'CATCHFORS AT WINDFORSE', 'LLantas Para Auto', 1, '2026-01-06 16:33:38', '2026-01-06 16:33:38'),
(88, 'VIGOROUS', 'LLantas Para Auto', 1, '2026-01-06 16:34:51', '2026-01-06 16:34:51'),
(89, 'RIDANZ', 'LLantas Para Auto', 1, '2026-01-06 16:41:08', '2026-01-06 16:41:08'),
(90, 'DURO', 'LLantas Para Auto', 1, '2026-01-06 16:43:24', '2026-01-06 16:43:24'),
(91, 'ROCKBLADE ROCK', 'LLantas Para Auto', 1, '2026-01-06 16:46:04', '2026-01-06 16:46:04'),
(92, 'ROADSTONE', 'LLantas Para Auto', 1, '2026-01-06 16:53:54', '2026-01-06 16:53:54'),
(93, 'GENISIS', 'LLantas R 14', 1, '2026-01-13 07:48:16', '2026-01-13 07:48:16'),
(94, 'APLUS', 'LLantas R 13', 1, '2026-01-13 07:50:27', '2026-01-13 07:50:27'),
(95, 'LINGLONG', 'LLantas para Auto R13', 1, '2026-01-13 07:53:22', '2026-01-13 07:53:22'),
(96, 'ROYAL BLAK', 'LLantas Para Auto R  13', 1, '2026-01-13 07:55:29', '2026-01-13 07:55:29'),
(97, 'GITI', 'LLantas Para Auto R 17', 1, '2026-01-13 07:58:54', '2026-01-13 07:58:54'),
(98, 'INFINITY', 'LLantas Para Auto R 17', 1, '2026-01-13 08:00:28', '2026-01-13 08:00:28'),
(99, 'AUSTONE', 'LLantas Para Auto R 17', 1, '2026-01-13 08:01:55', '2026-01-13 08:01:55'),
(100, 'GOODYEAR', 'LLantas Para Para Auto', 1, '2026-01-13 08:03:15', '2026-01-13 08:03:15'),
(101, 'GITY', 'LLantas Para Auto R 17', 1, '2026-01-13 08:05:38', '2026-01-13 08:05:38'),
(102, 'DURADERO', 'LLantas Para Auto R17', 1, '2026-01-13 08:12:53', '2026-01-13 08:12:53'),
(103, 'BOXER GOLD', 'LLantas Para Moto Aro 17', 1, '2026-01-13 08:15:55', '2026-01-13 08:15:55'),
(104, 'DONLOP', 'LLantas Para Moto Aro 12', 1, '2026-01-13 08:19:06', '2026-01-13 08:19:06'),
(105, 'TIMSUM', 'LLantas Para Moto Aro 17', 1, '2026-01-13 08:21:07', '2026-01-13 08:21:07'),
(106, 'DIAMOND', 'LLanta para Moto Aro 18', 1, '2026-01-13 08:23:02', '2026-01-13 08:23:02'),
(107, 'VITELY', 'LLantas Para Moto R 15', 1, '2026-01-13 08:26:20', '2026-01-13 08:26:20'),
(108, 'NAYASA', 'LLantas Para MotoR 17', 1, '2026-01-13 08:29:05', '2026-01-13 08:29:05'),
(109, 'SUPER RUN', 'LLantas Para Moto Aro 17', 1, '2026-01-13 08:31:32', '2026-01-13 08:31:32'),
(110, 'REDOUS', 'LLantas Para Moto Aro 18', 1, '2026-01-13 08:38:23', '2026-01-13 08:38:23'),
(111, 'NILON', 'LLanta Para Moto Aro 18', 1, '2026-01-13 08:44:38', '2026-01-13 08:44:38'),
(112, 'BARRUCHI', 'LLanta Para Moto Aro 18', 1, '2026-01-13 08:47:10', '2026-01-13 08:47:10'),
(113, 'motul', NULL, 1, '2026-01-13 10:06:45', '2026-01-13 10:06:45'),
(114, 'TOTAL', NULL, 1, '2026-01-13 10:07:11', '2026-01-13 10:07:11'),
(115, 'chica fresa', 'aroma', 1, '2026-01-13 10:10:39', '2026-01-13 10:10:39'),
(116, 'ATE', 'Liquido de freno', 1, '2026-01-13 10:12:05', '2026-01-13 10:12:05'),
(117, 'Abro', 'flush para motor', 1, '2026-01-13 10:13:19', '2026-01-13 10:13:19'),
(118, 'Visol', 'Limpia tablero', 1, '2026-01-13 10:14:08', '2026-01-13 10:14:08'),
(119, 'Auto', 'Power stering', 1, '2026-01-13 10:14:53', '2026-01-13 10:14:53'),
(120, 'Prodin', 'Piston Protector', 1, '2026-01-13 10:16:50', '2026-01-13 10:16:50'),
(121, 'Getsun', 'limpia freno', 1, '2026-01-13 10:18:15', '2026-01-13 10:18:15'),
(122, 'Splendor', 'remover pintura', 1, '2026-01-13 10:19:46', '2026-01-13 10:19:46'),
(123, 'Max power', 'Brillantador de llantas', 1, '2026-01-13 10:21:08', '2026-01-13 10:21:08'),
(124, 'Zero', 'Perrilla', 1, '2026-01-13 10:22:43', '2026-01-13 10:22:43'),
(125, 'Senfineco', 'Tratamiento de gasolina', 1, '2026-01-13 10:24:19', '2026-01-13 10:24:19'),
(126, 'Zenx', 'Manguera de gasolina de moto', 1, '2026-01-13 10:25:44', '2026-01-13 10:25:44'),
(127, 'Wagner', 'liquido de freno', 1, '2026-01-13 10:27:21', '2026-01-13 10:27:21'),
(128, 'Couple', 'Empaque de presion de auto', 1, '2026-01-13 10:29:36', '2026-01-13 10:29:36'),
(129, 'Staa', 'Luz de Neblinera', 1, '2026-01-13 10:32:57', '2026-01-13 10:32:57'),
(130, 'LR', 'Triket de volteo', 1, '2026-01-13 10:34:08', '2026-01-13 10:34:08'),
(131, 'Jack', 'triket de volteo', 1, '2026-01-13 10:35:43', '2026-01-13 10:35:43'),
(132, 'License frame', 'porta placa', 1, '2026-01-13 10:36:50', '2026-01-13 10:36:50'),
(133, 'Round bell', 'timbre de casa', 1, '2026-01-13 10:55:16', '2026-01-13 10:55:16'),
(134, 'C  Y', 'Caballito de adorno', 1, '2026-01-13 10:56:59', '2026-01-13 10:56:59'),
(135, 'Racing ec', 'triket de lagarto', 1, '2026-01-13 10:58:59', '2026-01-13 10:58:59'),
(136, 'Acrtianye', 'Antena de iman', 1, '2026-01-13 11:00:26', '2026-01-13 11:00:26'),
(137, 'Suzuki', 'porta placa de moto', 1, '2026-01-13 11:02:33', '2026-01-13 11:02:33'),
(138, 'Bajaj', 'porta placa de moto', 1, '2026-01-13 11:04:06', '2026-01-13 11:04:06'),
(139, 'Honda', 'porta placa de moto', 1, '2026-01-13 11:04:43', '2026-01-13 11:04:43'),
(140, 'Tail Light', 'Cinta led a trasera', 1, '2026-01-13 11:07:43', '2026-01-13 11:07:43'),
(141, 'Dynamix', 'punta de escape', 1, '2026-01-13 11:09:29', '2026-01-13 11:09:29'),
(142, 'H R', 'Araña de adorno', 1, '2026-01-13 11:10:51', '2026-01-13 11:10:51'),
(143, 'Sera', 'Antena pegable', 1, '2026-01-13 11:12:57', '2026-01-13 11:12:57'),
(144, 'G R', 'Porta placa largo', 1, '2026-01-13 11:14:07', '2026-01-13 11:14:07'),
(145, 'J M', 'Adorno pegable', 1, '2026-01-13 11:15:36', '2026-01-13 11:15:36'),
(146, 'Oro', 'luz neblinera para moto', 1, '2026-01-13 11:17:56', '2026-01-13 11:17:56'),
(147, 'Bonaire', 'triket de lagarto grande', 1, '2026-01-13 11:20:02', '2026-01-13 11:20:02'),
(148, 'Schwarts', 'radio pantalla android', 1, '2026-01-13 11:21:46', '2026-01-13 11:21:46'),
(149, 'xtenzo', 'radio', 1, '2026-01-13 11:22:38', '2026-01-13 11:22:38'),
(150, 'Super white beam', 'Luz Neblinera para carro', 1, '2026-01-13 11:25:45', '2026-01-13 11:25:45'),
(151, 'Fandeli', 'Lijas', 1, '2026-01-13 11:26:52', '2026-01-13 11:26:52'),
(152, '3 M', 'Cinta reflectivo', 1, '2026-01-13 11:28:18', '2026-01-13 11:28:18'),
(153, 'Yi Yuan', 'adorno de limpia brisa', 1, '2026-01-13 11:30:23', '2026-01-13 11:30:23'),
(154, 'Guard', 'baterias para auto', 1, '2026-01-13 11:31:36', '2026-01-13 11:31:36'),
(155, 'Magnum', 'Baterías para auto', 1, '2026-01-13 11:33:26', '2026-01-13 11:33:26'),
(156, 'Tiper', 'adorno de limpia brisa', 1, '2026-01-13 11:36:43', '2026-01-13 11:36:43'),
(157, 'R Q', 'Mosquitero', 1, '2026-01-13 11:37:53', '2026-01-13 11:37:53'),
(158, 'flex car', 'burbujas de puerta', 1, '2026-01-13 11:38:51', '2026-01-13 11:38:51'),
(159, 'Lafa racing', 'Filtro de gas plástico para auto  V', 1, '2026-01-13 11:41:23', '2026-01-13 11:41:23'),
(160, 'Harden', 'voltímetro', 1, '2026-01-13 11:42:35', '2026-01-13 11:42:35'),
(161, 'H J G', 'Luz led para moto', 1, '2026-01-13 11:43:42', '2026-01-13 11:43:42'),
(162, 'Soundstream', 'radio de disco', 1, '2026-01-13 11:45:19', '2026-01-13 11:45:19'),
(163, 'T R D', 'Adorno pegable para auto', 1, '2026-01-13 11:50:56', '2026-01-13 11:50:56'),
(164, 'Tacoma', 'adorno pegable para auto', 1, '2026-01-13 11:51:56', '2026-01-13 11:51:56'),
(165, '22 R', 'Adorno pegable para auto', 1, '2026-01-13 11:53:15', '2026-01-13 11:53:15'),
(166, 'Prow', 'regleta de luz de casa', 1, '2026-01-13 11:58:14', '2026-01-13 11:58:14'),
(167, 'Best value', 'porta electrodo', 1, '2026-01-13 12:00:33', '2026-01-13 12:00:33'),
(168, 'bticino', 'Toma corriente', 1, '2026-01-13 12:06:06', '2026-01-13 12:06:06'),
(169, 'Casters', 'roda para muebles numero 2', 1, '2026-01-13 12:10:38', '2026-01-13 12:10:38'),
(170, 'Z B W', 'Chapa bola de puerta casa', 1, '2026-01-13 12:12:30', '2026-01-13 12:12:30'),
(171, 'Wolfox', 'teflón', 1, '2026-01-13 12:14:43', '2026-01-13 12:14:43'),
(172, 'Puma', 'llave hexagonales', 1, '2026-01-13 12:17:34', '2026-01-13 12:17:34'),
(173, '/sa', 'Adorno aire de capo pegable', 1, '2026-01-13 12:22:22', '2026-01-13 12:22:22'),
(174, 'TURBO', 'Adorno de capo turbo pegable', 1, '2026-01-13 12:23:47', '2026-01-13 12:23:47'),
(175, 'Eagle', 'apagador de luz', 1, '2026-01-13 12:27:25', '2026-01-13 12:27:25'),
(176, 'Diesel tools', 'sal madores pequeños', 1, '2026-01-13 12:29:50', '2026-01-13 12:31:32'),
(177, 'Toolcraft', 'Tensor de gancho y argolla', 1, '2026-01-13 12:43:22', '2026-01-13 12:43:22'),
(178, 'Rock well', 'Platino de luz', 1, '2026-01-13 12:45:22', '2026-01-13 12:45:22'),
(179, 'Boxer tools', 'pasador de puerta numero 4', 1, '2026-01-13 12:46:54', '2026-01-13 12:46:54'),
(180, 'philips', 'chapa de puerta casa', 1, '2026-01-13 12:50:30', '2026-01-13 12:50:30'),
(181, 'Wilson', 'metro 8', 1, '2026-01-13 12:51:39', '2026-01-13 12:51:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caracteristica_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2025-11-01 04:15:05', '2025-11-01 04:15:05'),
(2, 6, '2025-11-19 20:07:42', '2025-11-19 20:07:42'),
(3, 9, '2025-11-20 12:43:23', '2025-11-20 12:43:23'),
(4, 10, '2025-11-20 12:43:36', '2025-11-20 12:43:36'),
(5, 11, '2025-11-20 12:44:04', '2025-11-20 12:44:04'),
(6, 17, '2025-11-24 14:55:12', '2025-11-24 14:55:12'),
(7, 20, '2025-12-05 10:30:15', '2025-12-05 10:30:15'),
(8, 21, '2025-12-05 10:30:38', '2025-12-05 10:30:38'),
(9, 22, '2025-12-05 10:31:01', '2025-12-05 10:31:01'),
(10, 23, '2025-12-05 10:31:28', '2025-12-05 10:31:28'),
(11, 24, '2025-12-05 10:31:47', '2025-12-05 10:31:47'),
(12, 25, '2025-12-05 10:32:19', '2025-12-05 10:32:19'),
(13, 38, '2025-12-07 11:23:23', '2025-12-07 11:23:23'),
(14, 43, '2026-01-04 08:03:32', '2026-01-04 08:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `producto_id`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-11-01 04:15:39', '2025-11-01 04:15:39'),
(2, 2, 1, '2025-11-08 05:46:06', '2025-11-08 05:46:06'),
(3, 3, 2, '2025-11-19 20:14:41', '2025-11-19 20:14:41'),
(4, 4, 2, '2025-11-20 11:03:19', '2025-11-20 11:03:19'),
(5, 5, 5, '2025-11-20 12:49:15', '2025-11-20 12:49:15'),
(6, 6, 5, '2025-11-23 14:39:07', '2025-11-23 14:39:07'),
(7, 7, 6, '2025-11-24 15:02:49', '2025-11-24 15:02:49'),
(8, 8, 1, '2025-11-28 12:57:40', '2025-11-28 12:57:40'),
(9, 1, 2, '2025-12-05 10:36:51', '2025-12-05 10:36:51'),
(10, 2, 2, '2025-12-05 10:38:46', '2025-12-05 10:38:46'),
(11, 3, 2, '2025-12-05 10:50:05', '2025-12-05 10:50:05'),
(12, 4, 2, '2025-12-07 11:22:35', '2025-12-07 11:22:35'),
(13, 5, 7, '2025-12-07 11:24:31', '2025-12-07 11:24:31'),
(14, 6, 2, '2025-12-07 11:27:38', '2025-12-07 11:27:38'),
(15, 7, 2, '2025-12-07 11:30:01', '2025-12-07 11:30:01'),
(16, 8, 2, '2025-12-10 14:20:00', '2025-12-10 14:20:00'),
(17, 9, 2, '2025-12-10 14:22:03', '2025-12-10 14:22:03'),
(18, 10, 8, '2025-12-13 16:28:23', '2025-12-13 16:28:23'),
(19, 11, 5, '2025-12-13 16:51:54', '2025-12-13 16:51:54'),
(20, 12, 14, '2026-01-04 08:07:04', '2026-01-04 08:07:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `persona_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-12-04 11:36:08', '2025-12-04 11:36:08'),
(2, 2, '2025-12-05 11:08:13', '2025-12-05 11:08:13'),
(3, 20, '2025-12-13 16:40:01', '2025-12-13 16:40:01'),
(4, 21, '2025-12-15 18:07:10', '2025-12-15 18:07:10'),
(5, 22, '2025-12-15 18:07:39', '2025-12-15 18:07:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(8,2) UNSIGNED NOT NULL,
  `numero_comprobante` varchar(255) NOT NULL,
  `total` decimal(8,2) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `comprobante_id` bigint(20) UNSIGNED DEFAULT NULL,
  `proveedore_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `sucursal_id`, `fecha_hora`, `impuesto`, `numero_comprobante`, `total`, `user_id`, `estado`, `comprobante_id`, `proveedore_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-12-10 14:24:50', 69.60, '001', 580.00, 6, 1, 1, 4, '2025-12-10 14:25:44', '2025-12-10 14:25:44'),
(2, 1, '2025-12-13 16:30:31', 1404.00, '12345', 11700.00, 7, 1, 1, 3, '2025-12-13 16:34:46', '2025-12-13 16:34:46'),
(3, 1, '2025-12-13 16:52:13', 72.00, '111', 600.00, 7, 1, 1, 2, '2025-12-13 16:54:35', '2025-12-13 16:54:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_producto`
--

CREATE TABLE `compra_producto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_producto`
--

INSERT INTO `compra_producto` (`id`, `compra_id`, `producto_id`, `cantidad`, `precio_compra`, `precio_venta`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 58.00, 60.00, '2025-12-10 14:25:44', '2025-12-10 14:25:44'),
(2, 2, 10, 13, 900.00, 1000.00, '2025-12-13 16:34:46', '2025-12-13 16:34:46'),
(3, 3, 11, 3, 200.00, 350.00, '2025-12-13 16:54:35', '2025-12-13 16:54:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(50) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `tipo_comprobante`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Boleta', 1, NULL, NULL),
(2, 'Factura', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_fel`
--

CREATE TABLE `configuracion_fel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `nit_emisor` varchar(20) NOT NULL,
  `nombre_comercial` varchar(150) NOT NULL,
  `nombre_emisor` varchar(150) NOT NULL,
  `codigo_establecimiento` varchar(10) NOT NULL,
  `afiliacion_iva` varchar(20) DEFAULT NULL,
  `usuario_certificador` varchar(100) DEFAULT NULL,
  `clave_certificador` varchar(255) DEFAULT NULL,
  `url_certificador` varchar(255) DEFAULT NULL,
  `llave_certificacion` text DEFAULT NULL,
  `ambiente` enum('PRUEBAS','PRODUCCION') DEFAULT 'PRUEBAS',
  `proveedor_fel` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion_fel`
--

INSERT INTO `configuracion_fel` (`id`, `sucursal_id`, `nit_emisor`, `nombre_comercial`, `nombre_emisor`, `codigo_establecimiento`, `afiliacion_iva`, `usuario_certificador`, `clave_certificador`, `url_certificador`, `llave_certificacion`, `ambiente`, `proveedor_fel`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '000028201175', 'HOTEL ZETINO', 'MARCOS, ZETINO RALES', '1', 'GEN', '28201175', 'Harim$2025', 'https://testnucgt.digifact.com/api', 'NULL', 'PRODUCCION', 'DIGIFACT', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_sistema`
--

CREATE TABLE `configuracion_sistema` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` text DEFAULT NULL,
  `tipo` enum('TEXTO','NUMERO','BOOLEANO','JSON') DEFAULT 'TEXTO',
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion_sistema`
--

INSERT INTO `configuracion_sistema` (`id`, `clave`, `valor`, `tipo`, `descripcion`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'sistema_nombre', 'Sistema de Venta de Repuestos', 'TEXTO', 'Nombre del sistema', 'GENERAL', '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(2, 'iva_porcentaje', '12', 'NUMERO', 'Porcentaje de IVA', 'VENTAS', '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(3, 'dias_validez_cotizacion', '15', 'NUMERO', 'Días de validez de cotización', 'VENTAS', '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(4, 'generar_alerta_stock_minimo', '1', 'BOOLEANO', 'Generar alertas al llegar a stock mínimo', 'INVENTARIO', '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(5, 'permitir_venta_sin_stock', '0', 'BOOLEANO', 'Permitir ventas sin stock disponible', 'VENTAS', '2025-11-04 00:00:59', '2025-11-04 00:00:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `numero_cotizacion` varchar(50) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuesto` decimal(8,2) UNSIGNED NOT NULL,
  `total` decimal(10,2) UNSIGNED NOT NULL,
  `observaciones` text DEFAULT NULL,
  `validez_dias` int(11) DEFAULT 15,
  `fecha_vencimiento` date DEFAULT NULL,
  `estado` enum('PENDIENTE','CONVERTIDA','VENCIDA','CANCELADA') DEFAULT 'PENDIENTE',
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_conversion` datetime DEFAULT NULL,
  `cliente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_producto`
--

CREATE TABLE `cotizacion_producto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cotizacion_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(8,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_documento` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `tipo_documento`, `created_at`, `updated_at`) VALUES
(1, 'DPI', NULL, NULL),
(2, 'Pasaporte', NULL, NULL),
(5, 'NIT', '2025-11-04 00:00:59', '2025-11-04 00:00:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_sucursal`
--

CREATE TABLE `inventario_sucursal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `ubicacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock_actual` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 0,
  `stock_maximo` int(11) DEFAULT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_sucursal`
--

INSERT INTO `inventario_sucursal` (`id`, `producto_id`, `sucursal_id`, `ubicacion_id`, `stock_actual`, `stock_minimo`, `stock_maximo`, `precio_venta`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 10, 10, 100, 60.00, 1, '2025-12-10 14:25:44', '2025-12-15 18:38:42'),
(2, 10, 1, 6, 12, 10, 100, 1000.00, 1, '2025-12-13 16:34:46', '2025-12-13 16:36:12'),
(3, 11, 1, 2, 3, 10, 100, 350.00, 1, '2025-12-13 16:54:35', '2025-12-13 16:54:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_fel`
--

CREATE TABLE `log_fel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_documento` varchar(10) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `respuesta_certificador` text DEFAULT NULL,
  `estado` enum('PENDIENTE','CERTIFICADO','ERROR','ANULADO') DEFAULT NULL,
  `fecha_certificacion` datetime DEFAULT NULL,
  `intentos` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log_fel`
--

INSERT INTO `log_fel` (`id`, `venta_id`, `tipo_documento`, `serie`, `numero`, `uuid`, `respuesta_certificador`, `estado`, `fecha_certificacion`, `intentos`, `created_at`, `updated_at`) VALUES
(1, 1, 'FACT', '975149AD', '1608599786', '975149AD-5FE1-48EA-8EF8-C6B714B57576', '{\"code\":1,\"message\":\"Proceso de certificacion realizado correctamente!\",\"description\":\"\",\"authNumber\":\"975149AD-5FE1-48EA-8EF8-C6B714B57576\",\"url\":\"\",\"infoDetails\":[],\"suggestedFileName\":\"28201175_FACT__0\",\"suggestedFileName2\":\"10122025___0_\",\"batch\":\"975149AD\",\"serial\":\"1608599786\",\"issuedTimeStamp\":\"2025-12-10T14:28:19\",\"taxID\":\"000028201175\",\"name\":\"MARCOS, ZETINO RALES\",\"branchCode\":\"\",\"branchName\":\"\",\"receiverTaxID\":\"CF\",\"receiverName\":\"Consumidor Final\",\"discounts\":\"\",\"taxes\":\"\",\"subTotal\":\"\",\"totalAmount\":\"60\",\"enrolledTimeStamp\":\"2025-12-10T13:28:39\",\"backprocessor\":\"GT-Test-EC2-01\",\"additionalInfo\":{\"acuseReciboSAT\":\"\",\"codigosSAT\":\"\"}}', 'ANULADO', '2025-12-10 13:28:39', 1, '2025-12-10 14:28:45', '2025-12-10 14:32:08'),
(2, 6, 'FACT', 'F0371FDB', '634931183', 'F0371FDB-25D8-47EF-87C7-61612047B6B0', '{\"code\":1,\"message\":\"Proceso de certificacion realizado correctamente!\",\"description\":\"\",\"authNumber\":\"F0371FDB-25D8-47EF-87C7-61612047B6B0\",\"url\":\"\",\"infoDetails\":[],\"suggestedFileName\":\"28201175_FACT__0\",\"suggestedFileName2\":\"15122025___0_\",\"batch\":\"F0371FDB\",\"serial\":\"634931183\",\"issuedTimeStamp\":\"2025-12-15T11:27:53\",\"taxID\":\"000028201175\",\"name\":\"MARCOS, ZETINO RALES\",\"branchCode\":\"\",\"branchName\":\"\",\"receiverTaxID\":\"CF\",\"receiverName\":\"Consumidor Final\",\"discounts\":\"\",\"taxes\":\"\",\"subTotal\":\"\",\"totalAmount\":\"60\",\"enrolledTimeStamp\":\"2025-12-15T10:28:14\",\"backprocessor\":\"GT-Test-EC2-01\",\"additionalInfo\":{\"acuseReciboSAT\":\"\",\"codigosSAT\":\"\"}}', 'ANULADO', '2025-12-15 10:28:14', 1, '2025-12-15 11:28:19', '2025-12-15 11:30:57'),
(3, 7, 'FACT', 'E42FE80F', '307906142', 'E42FE80F-125A-465E-B07F-570839699A04', '{\"code\":1,\"message\":\"Proceso de certificacion realizado correctamente!\",\"description\":\"\",\"authNumber\":\"E42FE80F-125A-465E-B07F-570839699A04\",\"url\":\"\",\"infoDetails\":[],\"suggestedFileName\":\"28201175_FACT__0\",\"suggestedFileName2\":\"15122025___0_\",\"batch\":\"E42FE80F\",\"serial\":\"307906142\",\"issuedTimeStamp\":\"2025-12-15T18:36:47\",\"taxID\":\"000028201175\",\"name\":\"MARCOS, ZETINO RALES\",\"branchCode\":\"\",\"branchName\":\"\",\"receiverTaxID\":\"CF\",\"receiverName\":\"Consumidor Final\",\"discounts\":\"\",\"taxes\":\"\",\"subTotal\":\"\",\"totalAmount\":\"60\",\"enrolledTimeStamp\":\"2025-12-15T18:37:08\",\"backprocessor\":\"GT-Backend\",\"additionalInfo\":{\"acuseReciboSAT\":null,\"codigosSAT\":null}}', 'ANULADO', '2025-12-15 18:37:08', 1, '2025-12-15 18:36:51', '2025-12-15 18:38:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caracteristica_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-11-01 04:14:51', '2025-11-01 04:14:51'),
(2, 4, '2025-11-08 05:44:33', '2025-11-08 05:44:33'),
(3, 7, '2025-11-19 20:11:03', '2025-11-19 20:11:03'),
(4, 14, '2025-11-20 12:44:54', '2025-11-20 12:44:54'),
(5, 15, '2025-11-20 12:45:07', '2025-11-20 12:45:07'),
(6, 16, '2025-11-20 12:46:05', '2025-11-20 12:46:05'),
(7, 19, '2025-11-24 14:56:03', '2025-11-24 14:56:03'),
(8, 28, '2025-12-05 10:33:24', '2025-12-05 10:33:24'),
(9, 29, '2025-12-05 10:33:39', '2025-12-05 10:33:39'),
(10, 30, '2025-12-05 10:33:49', '2025-12-05 10:33:49'),
(11, 31, '2025-12-05 10:34:09', '2025-12-05 10:34:09'),
(12, 33, '2025-12-07 11:15:39', '2025-12-07 11:15:39'),
(13, 34, '2025-12-07 11:16:06', '2025-12-07 11:16:06'),
(14, 35, '2025-12-07 11:16:26', '2025-12-07 11:16:26'),
(15, 36, '2025-12-07 11:16:37', '2025-12-07 11:16:37'),
(16, 37, '2025-12-07 11:23:04', '2025-12-07 11:23:04'),
(17, 39, '2025-12-07 11:28:51', '2025-12-07 11:28:51'),
(18, 40, '2025-12-13 16:25:29', '2025-12-13 16:25:29'),
(19, 41, '2025-12-13 16:50:09', '2025-12-13 16:50:09'),
(20, 42, '2026-01-04 07:58:32', '2026-01-04 07:58:32'),
(21, 44, '2026-01-04 08:09:21', '2026-01-04 08:09:21'),
(22, 45, '2026-01-04 08:11:46', '2026-01-04 08:11:46'),
(23, 46, '2026-01-04 08:13:45', '2026-01-04 08:13:45'),
(24, 47, '2026-01-04 08:14:20', '2026-01-04 08:14:20'),
(25, 48, '2026-01-04 08:16:12', '2026-01-04 08:16:12'),
(26, 49, '2026-01-06 07:48:20', '2026-01-06 07:48:20'),
(27, 50, '2026-01-06 07:49:23', '2026-01-06 07:49:23'),
(28, 51, '2026-01-06 07:52:54', '2026-01-06 07:52:54'),
(29, 52, '2026-01-06 07:55:54', '2026-01-06 07:55:54'),
(30, 53, '2026-01-06 08:00:30', '2026-01-06 08:00:30'),
(31, 54, '2026-01-06 08:03:51', '2026-01-06 08:03:51'),
(32, 55, '2026-01-06 08:08:57', '2026-01-06 08:08:57'),
(33, 56, '2026-01-06 08:12:24', '2026-01-06 08:12:24'),
(34, 57, '2026-01-06 08:42:21', '2026-01-06 08:42:21'),
(35, 58, '2026-01-06 08:45:44', '2026-01-06 08:45:44'),
(36, 59, '2026-01-06 09:10:45', '2026-01-06 09:10:45'),
(37, 60, '2026-01-06 09:16:03', '2026-01-06 09:16:03'),
(38, 61, '2026-01-06 09:18:41', '2026-01-06 09:18:41'),
(39, 62, '2026-01-06 09:19:57', '2026-01-06 09:19:57'),
(40, 63, '2026-01-06 09:25:07', '2026-01-06 09:25:07'),
(41, 64, '2026-01-06 14:22:19', '2026-01-06 14:22:19'),
(42, 65, '2026-01-06 14:29:00', '2026-01-06 14:29:00'),
(43, 66, '2026-01-06 14:35:53', '2026-01-06 14:35:53'),
(44, 67, '2026-01-06 14:36:54', '2026-01-06 14:36:54'),
(45, 68, '2026-01-06 14:37:43', '2026-01-06 14:37:43'),
(46, 69, '2026-01-06 14:40:24', '2026-01-06 14:40:24'),
(47, 70, '2026-01-06 14:41:32', '2026-01-06 14:41:32'),
(48, 71, '2026-01-06 14:43:02', '2026-01-06 14:43:02'),
(49, 72, '2026-01-06 14:44:41', '2026-01-06 14:44:41'),
(50, 73, '2026-01-06 14:45:38', '2026-01-06 14:45:38'),
(51, 74, '2026-01-06 14:47:46', '2026-01-06 14:47:46'),
(52, 75, '2026-01-06 14:48:58', '2026-01-06 14:48:58'),
(53, 76, '2026-01-06 16:03:52', '2026-01-06 16:03:52'),
(54, 77, '2026-01-06 16:06:21', '2026-01-06 16:06:21'),
(55, 78, '2026-01-06 16:12:41', '2026-01-06 16:12:41'),
(56, 79, '2026-01-06 16:15:05', '2026-01-06 16:15:05'),
(57, 80, '2026-01-06 16:16:10', '2026-01-06 16:16:10'),
(58, 81, '2026-01-06 16:17:53', '2026-01-06 16:17:53'),
(59, 82, '2026-01-06 16:21:53', '2026-01-06 16:21:53'),
(60, 83, '2026-01-06 16:22:52', '2026-01-06 16:22:52'),
(61, 84, '2026-01-06 16:27:25', '2026-01-06 16:27:25'),
(62, 85, '2026-01-06 16:28:35', '2026-01-06 16:28:35'),
(63, 86, '2026-01-06 16:31:17', '2026-01-06 16:31:17'),
(64, 87, '2026-01-06 16:33:38', '2026-01-06 16:33:38'),
(65, 88, '2026-01-06 16:34:51', '2026-01-06 16:34:51'),
(66, 89, '2026-01-06 16:41:08', '2026-01-06 16:41:08'),
(67, 90, '2026-01-06 16:43:24', '2026-01-06 16:43:24'),
(68, 91, '2026-01-06 16:46:04', '2026-01-06 16:46:04'),
(69, 92, '2026-01-06 16:53:54', '2026-01-06 16:53:54'),
(70, 93, '2026-01-13 07:48:16', '2026-01-13 07:48:16'),
(71, 94, '2026-01-13 07:50:27', '2026-01-13 07:50:27'),
(72, 95, '2026-01-13 07:53:22', '2026-01-13 07:53:22'),
(73, 96, '2026-01-13 07:55:29', '2026-01-13 07:55:29'),
(74, 97, '2026-01-13 07:58:54', '2026-01-13 07:58:54'),
(75, 98, '2026-01-13 08:00:28', '2026-01-13 08:00:28'),
(76, 99, '2026-01-13 08:01:55', '2026-01-13 08:01:55'),
(77, 100, '2026-01-13 08:03:15', '2026-01-13 08:03:15'),
(78, 101, '2026-01-13 08:05:38', '2026-01-13 08:05:38'),
(79, 102, '2026-01-13 08:12:53', '2026-01-13 08:12:53'),
(80, 103, '2026-01-13 08:15:55', '2026-01-13 08:15:55'),
(81, 104, '2026-01-13 08:19:06', '2026-01-13 08:19:06'),
(82, 105, '2026-01-13 08:21:07', '2026-01-13 08:21:07'),
(83, 106, '2026-01-13 08:23:02', '2026-01-13 08:23:02'),
(84, 107, '2026-01-13 08:26:20', '2026-01-13 08:26:20'),
(85, 108, '2026-01-13 08:29:05', '2026-01-13 08:29:05'),
(86, 109, '2026-01-13 08:31:32', '2026-01-13 08:31:32'),
(87, 110, '2026-01-13 08:38:23', '2026-01-13 08:38:23'),
(88, 111, '2026-01-13 08:44:38', '2026-01-13 08:44:38'),
(89, 112, '2026-01-13 08:47:10', '2026-01-13 08:47:10'),
(90, 113, '2026-01-13 10:06:45', '2026-01-13 10:06:45'),
(91, 114, '2026-01-13 10:07:11', '2026-01-13 10:07:11'),
(92, 115, '2026-01-13 10:10:39', '2026-01-13 10:10:39'),
(93, 116, '2026-01-13 10:12:05', '2026-01-13 10:12:05'),
(94, 117, '2026-01-13 10:13:19', '2026-01-13 10:13:19'),
(95, 118, '2026-01-13 10:14:08', '2026-01-13 10:14:08'),
(96, 119, '2026-01-13 10:14:53', '2026-01-13 10:14:53'),
(97, 120, '2026-01-13 10:16:50', '2026-01-13 10:16:50'),
(98, 121, '2026-01-13 10:18:15', '2026-01-13 10:18:15'),
(99, 122, '2026-01-13 10:19:46', '2026-01-13 10:19:46'),
(100, 123, '2026-01-13 10:21:08', '2026-01-13 10:21:08'),
(101, 124, '2026-01-13 10:22:43', '2026-01-13 10:22:43'),
(102, 125, '2026-01-13 10:24:19', '2026-01-13 10:24:19'),
(103, 126, '2026-01-13 10:25:44', '2026-01-13 10:25:44'),
(104, 127, '2026-01-13 10:27:21', '2026-01-13 10:27:21'),
(105, 128, '2026-01-13 10:29:36', '2026-01-13 10:29:36'),
(106, 129, '2026-01-13 10:32:57', '2026-01-13 10:32:57'),
(107, 130, '2026-01-13 10:34:08', '2026-01-13 10:34:08'),
(108, 131, '2026-01-13 10:35:43', '2026-01-13 10:35:43'),
(109, 132, '2026-01-13 10:36:50', '2026-01-13 10:36:50'),
(110, 133, '2026-01-13 10:55:16', '2026-01-13 10:55:16'),
(111, 134, '2026-01-13 10:56:59', '2026-01-13 10:56:59'),
(112, 135, '2026-01-13 10:58:59', '2026-01-13 10:58:59'),
(113, 136, '2026-01-13 11:00:26', '2026-01-13 11:00:26'),
(114, 137, '2026-01-13 11:02:33', '2026-01-13 11:02:33'),
(115, 138, '2026-01-13 11:04:06', '2026-01-13 11:04:06'),
(116, 139, '2026-01-13 11:04:43', '2026-01-13 11:04:43'),
(117, 140, '2026-01-13 11:07:43', '2026-01-13 11:07:43'),
(118, 141, '2026-01-13 11:09:29', '2026-01-13 11:09:29'),
(119, 142, '2026-01-13 11:10:51', '2026-01-13 11:10:51'),
(120, 143, '2026-01-13 11:12:57', '2026-01-13 11:12:57'),
(121, 144, '2026-01-13 11:14:07', '2026-01-13 11:14:07'),
(122, 145, '2026-01-13 11:15:36', '2026-01-13 11:15:36'),
(123, 146, '2026-01-13 11:17:56', '2026-01-13 11:17:56'),
(124, 147, '2026-01-13 11:20:02', '2026-01-13 11:20:02'),
(125, 148, '2026-01-13 11:21:46', '2026-01-13 11:21:46'),
(126, 149, '2026-01-13 11:22:38', '2026-01-13 11:22:38'),
(127, 150, '2026-01-13 11:25:45', '2026-01-13 11:25:45'),
(128, 151, '2026-01-13 11:26:52', '2026-01-13 11:26:52'),
(129, 152, '2026-01-13 11:28:18', '2026-01-13 11:28:18'),
(130, 153, '2026-01-13 11:30:23', '2026-01-13 11:30:23'),
(131, 154, '2026-01-13 11:31:36', '2026-01-13 11:31:36'),
(132, 155, '2026-01-13 11:33:26', '2026-01-13 11:33:26'),
(133, 156, '2026-01-13 11:36:43', '2026-01-13 11:36:43'),
(134, 157, '2026-01-13 11:37:53', '2026-01-13 11:37:53'),
(135, 158, '2026-01-13 11:38:51', '2026-01-13 11:38:51'),
(136, 159, '2026-01-13 11:41:23', '2026-01-13 11:41:23'),
(137, 160, '2026-01-13 11:42:35', '2026-01-13 11:42:35'),
(138, 161, '2026-01-13 11:43:42', '2026-01-13 11:43:42'),
(139, 162, '2026-01-13 11:45:19', '2026-01-13 11:45:19'),
(140, 163, '2026-01-13 11:50:56', '2026-01-13 11:50:56'),
(141, 164, '2026-01-13 11:51:56', '2026-01-13 11:51:56'),
(142, 165, '2026-01-13 11:53:15', '2026-01-13 11:53:15'),
(143, 166, '2026-01-13 11:58:14', '2026-01-13 11:58:14'),
(144, 167, '2026-01-13 12:00:33', '2026-01-13 12:00:33'),
(145, 168, '2026-01-13 12:06:06', '2026-01-13 12:06:06'),
(146, 169, '2026-01-13 12:10:38', '2026-01-13 12:10:38'),
(147, 170, '2026-01-13 12:12:30', '2026-01-13 12:12:30'),
(148, 171, '2026-01-13 12:14:43', '2026-01-13 12:14:43'),
(149, 172, '2026-01-13 12:17:34', '2026-01-13 12:17:34'),
(150, 173, '2026-01-13 12:22:22', '2026-01-13 12:22:22'),
(151, 174, '2026-01-13 12:23:47', '2026-01-13 12:23:47'),
(152, 175, '2026-01-13 12:27:25', '2026-01-13 12:27:25'),
(153, 176, '2026-01-13 12:29:50', '2026-01-13 12:29:50'),
(154, 177, '2026-01-13 12:43:22', '2026-01-13 12:43:22'),
(155, 178, '2026-01-13 12:45:22', '2026-01-13 12:45:22'),
(156, 179, '2026-01-13 12:46:54', '2026-01-13 12:46:54'),
(157, 180, '2026-01-13 12:50:30', '2026-01-13 12:50:30'),
(158, 181, '2026-01-13 12:51:39', '2026-01-13 12:51:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_10_011515_create_documentos_table', 1),
(6, '2023_03_10_012149_create_personas_table', 1),
(7, '2023_03_10_015030_create_proveedores_table', 1),
(8, '2023_03_10_015806_create_clientes_table', 1),
(9, '2023_03_10_020010_create_comprobantes_table', 1),
(10, '2023_03_10_020257_create_compras_table', 1),
(11, '2023_03_10_022517_create_ventas_table', 1),
(12, '2023_03_10_023329_create_caracteristicas_table', 1),
(13, '2023_03_10_023555_create_categorias_table', 1),
(14, '2023_03_10_023818_create_marcas_table', 1),
(15, '2023_03_10_023953_create_presentaciones_table', 1),
(16, '2023_03_10_024112_create_productos_table', 1),
(17, '2023_03_10_025418_create_categoria_producto_table', 1),
(18, '2023_03_10_025748_create_compra_producto_table', 1),
(19, '2023_03_10_030137_create_producto_venta_table', 1),
(20, '2023_05_02_214216_update_colums_to_documentos_table', 1),
(21, '2023_05_02_214713_update_colums_to_personas_table', 1),
(22, '2023_06_16_224734_create_permission_tables', 1),
(23, '2025_11_04_101047_add_estado_to_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_movimiento` enum('ENTRADA','SALIDA','AJUSTE','TRANSFERENCIA','MERMA','DEVOLUCION') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `sucursal_origen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sucursal_destino_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ubicacion_origen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ubicacion_destino_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cotizacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `producto_danado_id` bigint(20) UNSIGNED DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_movimiento` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos_inventario`
--

INSERT INTO `movimientos_inventario` (`id`, `producto_id`, `tipo_movimiento`, `cantidad`, `sucursal_origen_id`, `sucursal_destino_id`, `ubicacion_origen_id`, `ubicacion_destino_id`, `compra_id`, `venta_id`, `cotizacion_id`, `producto_danado_id`, `motivo`, `user_id`, `fecha_movimiento`, `created_at`, `updated_at`) VALUES
(1, 1, 'ENTRADA', 10, NULL, 1, NULL, 1, 1, NULL, NULL, NULL, 'Compra #001', 6, '2025-12-10 14:25:44', '2025-12-10 14:25:44', '2025-12-10 14:25:44'),
(2, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'Venta - 00000003', 6, '2025-12-10 14:28:19', '2025-12-10 14:28:19', '2025-12-10 14:28:19'),
(3, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, 'Anulación de venta: Prueba en sistema', 6, '2025-12-10 14:32:08', '2025-12-10 14:32:08', '2025-12-10 14:32:08'),
(4, 10, 'ENTRADA', 13, NULL, 1, NULL, 6, 2, NULL, NULL, NULL, 'Compra #12345', 7, '2025-12-13 16:34:46', '2025-12-13 16:34:46', '2025-12-13 16:34:46'),
(5, 10, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'Venta - REC-00000001', 7, '2025-12-13 16:36:12', '2025-12-13 16:36:12', '2025-12-13 16:36:12'),
(6, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 3, NULL, NULL, 'Venta - 00000004', 7, '2025-12-13 16:42:22', '2025-12-13 16:42:22', '2025-12-13 16:42:22'),
(7, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 3, NULL, NULL, 'Reversión automática por fallo FEL: La transformación XSLT falló.', 7, '2025-12-13 16:42:23', '2025-12-13 16:42:23', '2025-12-13 16:42:23'),
(8, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'Venta - 00000005', 7, '2025-12-13 16:42:55', '2025-12-13 16:42:55', '2025-12-13 16:42:55'),
(9, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 4, NULL, NULL, 'Reversión automática por fallo FEL: La transformación XSLT falló.', 7, '2025-12-13 16:42:56', '2025-12-13 16:42:56', '2025-12-13 16:42:56'),
(10, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'Venta - REC-00000002', 7, '2025-12-13 16:43:28', '2025-12-13 16:43:28', '2025-12-13 16:43:28'),
(11, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 5, NULL, NULL, 'Anulación de venta: Prueba', 7, '2025-12-13 16:46:32', '2025-12-13 16:46:32', '2025-12-13 16:46:32'),
(12, 11, 'ENTRADA', 3, NULL, 1, NULL, 2, 3, NULL, NULL, NULL, 'Compra #111', 7, '2025-12-13 16:54:35', '2025-12-13 16:54:35', '2025-12-13 16:54:35'),
(13, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 6, NULL, NULL, 'Venta - 00000006', 5, '2025-12-15 11:27:53', '2025-12-15 11:27:53', '2025-12-15 11:27:53'),
(14, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 6, NULL, NULL, 'Anulación de venta: Pruebas en el sistema.', 5, '2025-12-15 11:30:57', '2025-12-15 11:30:57', '2025-12-15 11:30:57'),
(15, 1, 'SALIDA', 1, 1, NULL, NULL, NULL, NULL, 7, NULL, NULL, 'Venta - 00000007', 5, '2025-12-15 18:36:47', '2025-12-15 18:36:47', '2025-12-15 18:36:47'),
(16, 1, 'DEVOLUCION', 1, NULL, 1, NULL, NULL, NULL, 7, NULL, NULL, 'Anulación de venta: Pruebas de sistema.', 5, '2025-12-15 18:38:42', '2025-12-15 18:38:42', '2025-12-15 18:38:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_compra`
--

CREATE TABLE `pedidos_compra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_pedido` varchar(50) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega_estimada` date DEFAULT NULL,
  `fecha_entrega_real` date DEFAULT NULL,
  `proveedore_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuesto` decimal(8,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','PARCIAL','RECIBIDO','CANCELADO') DEFAULT 'PENDIENTE',
  `observaciones` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pedido_compra_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad_solicitada` int(11) NOT NULL,
  `cantidad_recibida` int(11) DEFAULT 0,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ver-categoria', 'web', '2025-11-01 04:13:33', '2025-11-01 04:13:33'),
(2, 'crear-categoria', 'web', '2025-11-01 04:13:33', '2025-11-01 04:13:33'),
(3, 'editar-categoria', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(4, 'eliminar-categoria', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(5, 'ver-cliente', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(6, 'crear-cliente', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(7, 'editar-cliente', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(8, 'eliminar-cliente', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(9, 'ver-compra', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(10, 'crear-compra', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(11, 'mostrar-compra', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(12, 'eliminar-compra', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(13, 'ver-marca', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(14, 'crear-marca', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(15, 'editar-marca', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(16, 'eliminar-marca', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(17, 'ver-presentacione', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(18, 'crear-presentacione', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(19, 'editar-presentacione', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(20, 'eliminar-presentacione', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(21, 'ver-producto', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(22, 'crear-producto', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(23, 'editar-producto', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(24, 'eliminar-producto', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(25, 'ver-proveedore', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(26, 'crear-proveedore', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(27, 'editar-proveedore', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(28, 'eliminar-proveedore', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(29, 'ver-venta', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(30, 'crear-venta', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(31, 'mostrar-venta', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(32, 'eliminar-venta', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(33, 'ver-role', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(34, 'crear-role', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(35, 'editar-role', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(36, 'eliminar-role', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(37, 'ver-user', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(38, 'crear-user', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(39, 'editar-user', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(40, 'eliminar-user', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(41, 'ver-perfil', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(42, 'editar-perfil', 'web', '2025-11-01 04:13:34', '2025-11-01 04:13:34'),
(43, 'ver-cotizacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(44, 'crear-cotizacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(45, 'editar-cotizacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(46, 'eliminar-cotizacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(47, 'convertir-cotizacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(48, 'ver-sucursal', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(49, 'crear-sucursal', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(50, 'editar-sucursal', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(51, 'eliminar-sucursal', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(52, 'ver-ubicacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(53, 'crear-ubicacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(54, 'editar-ubicacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(55, 'eliminar-ubicacion', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(56, 'ver-inventario', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(57, 'ajustar-inventario', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(58, 'transferir-inventario', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(59, 'ver-producto-danado', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(60, 'registrar-producto-danado', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(61, 'aprobar-producto-danado', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(67, 'ver-fel', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(69, 'anular-fel', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(70, 'ver-alerta-stock', 'web', '2025-11-04 00:00:33', '2025-11-04 00:00:33'),
(72, 'ver-unidad-medida', 'web', NULL, NULL),
(73, 'crear-unidad-medida', 'web', NULL, NULL),
(74, 'editar-unidad-medida', 'web', NULL, NULL),
(75, 'eliminar-unidad-medida', 'web', NULL, NULL),
(76, 'ver-reportes', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razon_social` varchar(80) NOT NULL,
  `nombre_comercial` varchar(100) DEFAULT NULL,
  `direccion` varchar(80) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `documento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `numero_documento` varchar(20) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `razon_social`, `nombre_comercial`, `direccion`, `email`, `telefono`, `tipo_persona`, `estado`, `documento_id`, `numero_documento`, `nit`, `created_at`, `updated_at`) VALUES
(1, 'Consumidor Final', 'Consumidor Final', 'CF', NULL, NULL, 'natural', 1, NULL, NULL, 'CF', '2025-12-04 11:36:08', '2025-12-04 11:36:08'),
(2, 'Marcos Zetino', NULL, 'Las Cruces Tunajá', NULL, NULL, 'natural', 1, NULL, NULL, 'cf.', '2025-12-05 11:08:13', '2025-12-05 11:08:13'),
(3, 'PRA', NULL, 'ciudad', NULL, NULL, 'natural', 1, 1, NULL, NULL, '2025-12-06 13:37:10', '2025-12-06 15:30:13'),
(4, 'DIFORZA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:01:54', '2025-12-07 11:01:54'),
(5, 'ELECTROAUCTO', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:02:21', '2025-12-07 11:02:21'),
(6, 'DISTRIBUIDORA EL PACIFICO', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:03:12', '2025-12-07 11:03:12'),
(7, 'AUTO REPUESTOS LINARES', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:03:44', '2025-12-07 11:03:44'),
(8, 'GIRIK', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:04:10', '2025-12-07 11:04:10'),
(9, 'GMP INTERNACIONAL', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:04:36', '2025-12-07 11:04:36'),
(10, 'TRUCK DEPOT GRUPO VINTAGE', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:05:10', '2025-12-07 11:05:10'),
(11, 'MIZUMO AUTOPARTES', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, 1, NULL, NULL, '2025-12-07 11:05:32', '2025-12-07 11:05:49'),
(12, 'REPUESTOS NAPA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:06:12', '2025-12-07 11:06:12'),
(13, 'CARTEC TEAM GUATEMALA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:06:48', '2025-12-07 11:06:48'),
(14, 'GRUPO ASIA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:07:13', '2025-12-07 11:07:13'),
(15, 'PRODIN', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:07:37', '2025-12-07 11:07:37'),
(16, 'XELA AUTO', NULL, 'HUEHUETENANGO', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:08:16', '2025-12-07 11:08:16'),
(17, 'LUBRISOL', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:08:30', '2025-12-07 11:08:30'),
(18, 'DISTRIBUIDORA Y FERRETERIA ASTURIAS SA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:09:05', '2025-12-07 11:09:05'),
(19, 'PADIASA', NULL, 'CIUDAD', NULL, NULL, 'natural', 1, NULL, NULL, NULL, '2025-12-07 11:09:20', '2025-12-07 11:09:20'),
(20, 'Luciano Juarez', NULL, 'Tunaja', NULL, NULL, 'natural', 1, NULL, NULL, 'cf..', '2025-12-13 16:40:01', '2025-12-13 16:40:01'),
(21, 'HARIM ESTRADA', NULL, 'TUNAJA', NULL, NULL, 'natural', 1, NULL, NULL, '15654052', '2025-12-15 18:07:10', '2025-12-15 18:07:10'),
(22, 'HARIM ESTRADA', NULL, 'TUNAJA', NULL, NULL, 'natural', 1, NULL, NULL, '15654052', '2025-12-15 18:07:39', '2025-12-15 18:07:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentaciones`
--

CREATE TABLE `presentaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caracteristica_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentaciones`
--

INSERT INTO `presentaciones` (`id`, `caracteristica_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-01 04:14:41', '2025-11-01 04:14:41'),
(2, 5, '2025-11-08 05:45:34', '2025-11-08 05:45:34'),
(3, 8, '2025-11-19 20:36:52', '2025-11-19 20:36:52'),
(4, 12, '2025-11-20 12:44:19', '2025-11-20 12:44:19'),
(5, 13, '2025-11-20 12:44:35', '2025-11-20 12:44:35'),
(6, 18, '2025-11-24 14:55:36', '2025-11-24 14:55:36'),
(7, 26, '2025-12-05 10:32:47', '2025-12-05 10:32:47'),
(8, 27, '2025-12-05 10:33:07', '2025-12-05 10:33:07'),
(9, 32, '2025-12-05 10:56:58', '2025-12-05 10:56:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `presentacione_id` bigint(20) UNSIGNED NOT NULL,
  `unidad_medida_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `stock`, `descripcion`, `fecha_vencimiento`, `img_path`, `estado`, `marca_id`, `presentacione_id`, `unidad_medida_id`, `created_at`, `updated_at`) VALUES
(1, '079191214770', 'Aceite Castrol CRB Turbomax 15W-40', 0, NULL, NULL, NULL, 1, 8, 3, 4, '2025-12-05 10:36:51', '2025-12-05 10:36:51'),
(2, '079191219034', 'Castrol Actevo 2T', 0, NULL, NULL, NULL, 1, 8, 3, 4, '2025-12-05 10:38:46', '2025-12-05 10:38:46'),
(3, '7401174500571', 'Liquido Para Freno', 0, NULL, NULL, NULL, 1, 11, 3, 21, '2025-12-05 10:50:05', '2025-12-05 10:56:31'),
(4, '001', 'Grasa para rodamientos No. 2', 0, NULL, NULL, NULL, 1, 6, 9, 1, '2025-12-07 11:22:35', '2025-12-07 11:24:55'),
(5, '002', 'GRASA GAFITADA', 0, NULL, NULL, NULL, 1, 16, 9, 1, '2025-12-07 11:24:31', '2025-12-07 11:24:31'),
(6, '8412847130215', 'CEPSA GENUINE 20W-50', 0, NULL, NULL, NULL, 1, 15, 3, 4, '2025-12-07 11:27:38', '2025-12-07 11:27:38'),
(7, '1419032024011', 'KAWA 4T 2W-50', 0, NULL, NULL, NULL, 1, 17, 3, 4, '2025-12-07 11:30:01', '2025-12-07 11:30:01'),
(8, '079191265116', 'Castrol MAGNATEC 10W-30', 0, NULL, NULL, NULL, 1, 8, 3, 4, '2025-12-10 14:20:00', '2025-12-10 14:20:00'),
(9, '079191000922', 'CastroL GTX 10W-30', 0, NULL, NULL, NULL, 1, 8, 3, 4, '2025-12-10 14:22:03', '2025-12-10 14:22:03'),
(10, '7501121614648', 'Bateria LTH', 0, NULL, NULL, NULL, 1, 18, 7, 1, '2025-12-13 16:28:23', '2025-12-13 16:28:23'),
(11, '7453100900078', 'Gato hidraulico', 0, NULL, NULL, NULL, 1, 19, 7, 1, '2025-12-13 16:51:54', '2025-12-13 16:51:54'),
(12, '747752782074', 'Tester', 0, NULL, NULL, NULL, 1, 20, 7, NULL, '2026-01-04 08:07:04', '2026-01-04 08:07:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_danados`
--

CREATE TABLE `productos_danados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `ubicacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` enum('VENCIDO','DANADO','ROTO','DEFECTUOSO','PERDIDO','OTRO') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `costo_perdida` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `aprobado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` enum('PENDIENTE','APROBADO','RECHAZADO') DEFAULT 'PENDIENTE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_venta`
--

CREATE TABLE `producto_venta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venta_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_venta`
--

INSERT INTO `producto_venta` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio_venta`, `descuento`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 60.00, 0.00, '2025-12-10 14:28:19', '2025-12-10 14:28:19'),
(2, 2, 10, 1, 1000.00, 100.00, '2025-12-13 16:36:12', '2025-12-13 16:36:12'),
(3, 3, 1, 1, 60.00, 0.00, '2025-12-13 16:42:22', '2025-12-13 16:42:22'),
(4, 4, 1, 1, 60.00, 0.00, '2025-12-13 16:42:55', '2025-12-13 16:42:55'),
(5, 5, 1, 1, 60.00, 0.00, '2025-12-13 16:43:28', '2025-12-13 16:43:28'),
(6, 6, 1, 1, 60.00, 0.00, '2025-12-15 11:27:53', '2025-12-15 11:27:53'),
(7, 7, 1, 1, 60.00, 0.00, '2025-12-15 18:36:47', '2025-12-15 18:36:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `persona_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2025-12-06 13:37:10', '2025-12-06 13:37:10'),
(2, 4, '2025-12-07 11:01:54', '2025-12-07 11:01:54'),
(3, 5, '2025-12-07 11:02:21', '2025-12-07 11:02:21'),
(4, 6, '2025-12-07 11:03:12', '2025-12-07 11:03:12'),
(5, 7, '2025-12-07 11:03:44', '2025-12-07 11:03:44'),
(6, 8, '2025-12-07 11:04:10', '2025-12-07 11:04:10'),
(7, 9, '2025-12-07 11:04:36', '2025-12-07 11:04:36'),
(8, 10, '2025-12-07 11:05:10', '2025-12-07 11:05:10'),
(9, 11, '2025-12-07 11:05:32', '2025-12-07 11:05:32'),
(10, 12, '2025-12-07 11:06:12', '2025-12-07 11:06:12'),
(11, 13, '2025-12-07 11:06:48', '2025-12-07 11:06:48'),
(12, 14, '2025-12-07 11:07:13', '2025-12-07 11:07:13'),
(13, 15, '2025-12-07 11:07:37', '2025-12-07 11:07:37'),
(14, 16, '2025-12-07 11:08:16', '2025-12-07 11:08:16'),
(15, 17, '2025-12-07 11:08:30', '2025-12-07 11:08:30'),
(16, 18, '2025-12-07 11:09:05', '2025-12-07 11:09:05'),
(17, 19, '2025-12-07 11:09:20', '2025-12-07 11:09:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrador', 'web', '2025-11-01 04:13:34', '2025-11-17 02:58:37'),
(2, 'PR1', 'web', '2025-11-04 16:19:11', '2025-11-17 04:53:31'),
(3, 'Gerente', 'web', '2025-12-05 08:53:17', '2025-12-05 08:53:17'),
(4, 'Vendedor', 'web', '2025-12-05 08:55:14', '2025-12-13 16:44:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(70, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(1, 3),
(2, 3),
(3, 3),
(5, 3),
(6, 3),
(7, 3),
(9, 3),
(10, 3),
(11, 3),
(13, 3),
(14, 3),
(15, 3),
(17, 3),
(18, 3),
(19, 3),
(21, 3),
(22, 3),
(23, 3),
(25, 3),
(26, 3),
(27, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(52, 3),
(53, 3),
(54, 3),
(56, 3),
(59, 3),
(60, 3),
(61, 3),
(67, 3),
(69, 3),
(70, 3),
(72, 3),
(73, 3),
(74, 3),
(76, 3),
(1, 4),
(2, 4),
(3, 4),
(5, 4),
(6, 4),
(7, 4),
(9, 4),
(10, 4),
(11, 4),
(13, 4),
(14, 4),
(15, 4),
(17, 4),
(18, 4),
(19, 4),
(21, 4),
(22, 4),
(23, 4),
(25, 4),
(26, 4),
(27, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(43, 4),
(44, 4),
(45, 4),
(52, 4),
(53, 4),
(54, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(67, 4),
(69, 4),
(70, 4),
(72, 4),
(73, 4),
(74, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series_fel`
--

CREATE TABLE `series_fel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_documento` varchar(10) NOT NULL,
  `serie` varchar(20) NOT NULL,
  `numero_actual` int(11) NOT NULL DEFAULT 0,
  `numero_inicial` int(11) NOT NULL DEFAULT 1,
  `numero_final` int(11) DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `numero_resolucion` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `series_fel`
--

INSERT INTO `series_fel` (`id`, `sucursal_id`, `tipo_documento`, `serie`, `numero_actual`, `numero_inicial`, `numero_final`, `fecha_resolucion`, `numero_resolucion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'FACT', 'A', 7, 1, 100000, NULL, NULL, 1, NULL, '2025-12-15 18:36:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nit_establecimiento` varchar(20) DEFAULT NULL,
  `codigo_establecimiento` varchar(10) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `codigo`, `direccion`, `telefono`, `email`, `nit_establecimiento`, `codigo_establecimiento`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Repuestos Zetino', 'SUC-001', 'Las Cruces Tunajá, Joyabaj Quiché', '51743454', NULL, '28201175', NULL, 1, '2025-11-04 07:18:13', '2025-12-15 19:33:25'),
(2, 'SUCURSAL 2', 'SUC-002', 'Ciudad', '42300129', 'juliocano677@gmail.com', NULL, NULL, 1, '2025-11-04 07:26:58', '2025-11-04 07:26:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('ESTANTE','BODEGA','MOSTRADOR','OTRO') DEFAULT 'ESTANTE',
  `seccion` varchar(50) DEFAULT NULL,
  `capacidad_maxima` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `sucursal_id`, `codigo`, `nombre`, `tipo`, `seccion`, `capacidad_maxima`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '01', 'Estante 1', 'ESTANTE', '1', 500, NULL, 1, '2025-12-05 10:41:11', '2025-12-05 10:41:11'),
(2, 1, '02', 'ESTANTE 2', 'ESTANTE', '1', 500, 'Estante de accesorios.', 1, '2025-12-07 11:10:42', '2025-12-07 11:11:36'),
(3, 1, '03', 'ESTANTE 3', 'ESTANTE', '1', 400, 'Estante de accesorios de carro.', 1, '2025-12-07 11:12:21', '2025-12-07 11:12:21'),
(4, 1, '04', 'ESTANTE 4', 'ESTANTE', '1', 400, 'Estante de alternadores, parte superior.', 1, '2025-12-07 11:14:02', '2025-12-07 11:14:02'),
(5, 1, '05', 'ESTANTE 5', 'ESTANTE', '1', 200, 'Estante de starters, parte superior.', 1, '2025-12-07 11:15:02', '2025-12-07 11:15:02'),
(6, 1, '06', 'ESTANTE PRINCIPAL', 'ESTANTE', '1', 30, NULL, 1, '2025-12-13 16:30:26', '2025-12-13 16:30:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  `tipo` enum('LONGITUD','PESO','VOLUMEN','UNIDAD','OTRO') DEFAULT NULL,
  `codigo_fel` varchar(10) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`id`, `nombre`, `abreviatura`, `tipo`, `codigo_fel`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Unidad', 'UNI', 'UNIDAD', 'UNI', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(2, 'Caja', 'CJA', 'UNIDAD', 'BX', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(3, 'Docena', 'DOC', 'UNIDAD', 'DPC', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(4, 'Litro', 'LT', 'VOLUMEN', 'LTR', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(5, 'Galón', 'GAL', 'VOLUMEN', 'GLL', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(6, 'Metro', 'MT', 'LONGITUD', 'MTR', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(7, 'Kilogramo', 'KG', 'PESO', 'KGM', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(8, 'Libra', 'LB', 'PESO', 'LBR', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(9, 'Pieza', 'PZA', 'UNIDAD', 'H87', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(10, 'Par', 'PAR', 'UNIDAD', 'PR', 1, '2025-11-04 00:00:59', '2025-11-04 00:00:59'),
(21, '12 ONZAS', 'ONZ', 'VOLUMEN', NULL, 1, '2025-12-05 10:53:00', '2025-12-05 10:53:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `estado`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alfredo Cano', 'admin@gmail.com', NULL, '$2y$10$PbNViW6SCOmNq.GhocV1eO8o/6tkDJn5Yf5IGLCr.MQEkI8sMfz4e', 0, NULL, '2025-11-01 04:13:34', '2025-11-03 21:26:01'),
(5, 'Rene Estrada', 'harimurizar@gmail.com', NULL, '$2y$10$V2w5f/iTZ07dwV1KeS5OLuSqExchaZMrqTdS38A44gP8dLXXYtwuu', 1, NULL, '2025-11-19 20:19:23', '2025-11-19 20:19:23'),
(6, 'Marcos Zetino', 'marcoszetino758@gmail.com', NULL, '$2y$10$rRv0M3whriQ5ipibYiEaze543z4bZPahIpXWT3V733Il0FrnZT/zy', 1, NULL, '2025-12-05 08:56:34', '2025-12-05 08:56:34'),
(7, 'LUCIANO JUAREZ', 'luciano@gmail.com', NULL, '$2y$10$diOLtk7aXXOWoGA94zj67Oe3WGRC7LpHO/EsoXDRmafC6vW3XoFhe', 1, NULL, '2025-12-13 16:21:49', '2025-12-13 16:21:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sucursal`
--

CREATE TABLE `user_sucursal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `es_principal` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_sucursal`
--

INSERT INTO `user_sucursal` (`id`, `user_id`, `sucursal_id`, `es_principal`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 0, '2025-11-07 03:27:18', '2025-11-07 03:27:18'),
(5, 1, 2, 0, '2025-11-07 03:27:18', '2025-11-07 03:27:18'),
(7, 5, 1, 0, '2025-11-19 20:19:23', '2025-11-19 20:19:23'),
(8, 5, 2, 0, '2025-11-19 20:19:23', '2025-11-19 20:19:23'),
(9, 6, 1, 1, '2025-12-05 08:56:34', '2025-12-05 08:56:34'),
(10, 7, 1, 1, '2025-12-13 16:21:49', '2025-12-13 16:21:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(8,2) UNSIGNED NOT NULL,
  `numero_comprobante` varchar(255) NOT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `total` decimal(8,2) UNSIGNED NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `cliente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comprobante_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `numero_autorizacion_fel` varchar(100) DEFAULT NULL,
  `fecha_certificacion_fel` datetime DEFAULT NULL,
  `xml_fel` longtext DEFAULT NULL,
  `tipo_factura` enum('FACT','FCAM','FPEQ','FCAP','FESP','NABN','RDON','RECI','NDEB','NCRE') DEFAULT 'FACT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `sucursal_id`, `fecha_hora`, `impuesto`, `numero_comprobante`, `serie`, `total`, `estado`, `cliente_id`, `user_id`, `comprobante_id`, `created_at`, `updated_at`, `numero_autorizacion_fel`, `fecha_certificacion_fel`, `xml_fel`, `tipo_factura`) VALUES
(1, 1, '2025-12-10 14:28:19', 7.20, '1608599786', '975149AD', 60.00, 0, 1, 6, 1, '2025-12-10 14:28:19', '2025-12-10 14:32:08', '975149AD-5FE1-48EA-8EF8-C6B714B57576', '2025-12-10 13:28:39', 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48ZHRlOkdURG9jdW1lbnRvIFZlcnNpb249IjAuMSIgeG1sbnM6ZHRlPSJodHRwOi8vd3d3LnNhdC5nb2IuZ3QvZHRlL2ZlbC8wLjIuMCIgeG1sbnM6eHNpPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxL1hNTFNjaGVtYS1pbnN0YW5jZSI+PGR0ZTpTQVQgQ2xhc2VEb2N1bWVudG89ImR0ZSI+PGR0ZTpEVEUgSUQ9IkRhdG9zQ2VydGlmaWNhZG9zIj48ZHRlOkRhdG9zRW1pc2lvbiBJRD0iRGF0b3NFbWlzaW9uIj48ZHRlOkRhdG9zR2VuZXJhbGVzIFRpcG89IkZBQ1QiIEZlY2hhSG9yYUVtaXNpb249IjIwMjUtMTItMTBUMTQ6Mjg6MTkiIENvZGlnb01vbmVkYT0iR1RRIiAvPjxkdGU6RW1pc29yIE5JVEVtaXNvcj0iMjgyMDExNzUiIE5vbWJyZUVtaXNvcj0iTUFSQ09TLCBaRVRJTk8gUkFMRVMiIENvZGlnb0VzdGFibGVjaW1pZW50bz0iMSIgTm9tYnJlQ29tZXJjaWFsPSJIT1RFTCBaRVRJTk8iIEFmaWxpYWNpb25JVkE9IkdFTiI+PGR0ZTpEaXJlY2Npb25FbWlzb3I+PGR0ZTpEaXJlY2Npb24+Q2l1ZGFkPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25FbWlzb3I+PC9kdGU6RW1pc29yPjxkdGU6UmVjZXB0b3IgTm9tYnJlUmVjZXB0b3I9IkNvbnN1bWlkb3IgRmluYWwiIElEUmVjZXB0b3I9IkNGIj48ZHRlOkRpcmVjY2lvblJlY2VwdG9yPjxkdGU6RGlyZWNjaW9uPkNGPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25SZWNlcHRvcj48L2R0ZTpSZWNlcHRvcj48ZHRlOkZyYXNlcz48ZHRlOkZyYXNlIFRpcG9GcmFzZT0iMSIgQ29kaWdvRXNjZW5hcmlvPSIxIiAvPjwvZHRlOkZyYXNlcz48ZHRlOkl0ZW1zPjxkdGU6SXRlbSBOdW1lcm9MaW5lYT0iMSIgQmllbk9TZXJ2aWNpbz0iQiI+PGR0ZTpDYW50aWRhZD4xLjAwMDA8L2R0ZTpDYW50aWRhZD48ZHRlOlVuaWRhZE1lZGlkYT5MVFI8L2R0ZTpVbmlkYWRNZWRpZGE+PGR0ZTpEZXNjcmlwY2lvbj5BY2VpdGUgQ2FzdHJvbCBDUkIgVHVyYm9tYXggMTVXLTQwPC9kdGU6RGVzY3JpcGNpb24+PGR0ZTpQcmVjaW9Vbml0YXJpbz42MC4wMDAwPC9kdGU6UHJlY2lvVW5pdGFyaW8+PGR0ZTpQcmVjaW8+NjAuMDAwMDwvZHRlOlByZWNpbz48ZHRlOkRlc2N1ZW50bz4wPC9kdGU6RGVzY3VlbnRvPjxkdGU6SW1wdWVzdG9zPjxkdGU6SW1wdWVzdG8+PGR0ZTpOb21icmVDb3J0bz5JVkE8L2R0ZTpOb21icmVDb3J0bz48ZHRlOkNvZGlnb1VuaWRhZEdyYXZhYmxlPjE8L2R0ZTpDb2RpZ29VbmlkYWRHcmF2YWJsZT48ZHRlOk1vbnRvR3JhdmFibGU+NTMuNTcxNDwvZHRlOk1vbnRvR3JhdmFibGU+PGR0ZTpNb250b0ltcHVlc3RvPjYuNDI4NjwvZHRlOk1vbnRvSW1wdWVzdG8+PC9kdGU6SW1wdWVzdG8+PC9kdGU6SW1wdWVzdG9zPjxkdGU6VG90YWw+NjAuMDAwMDwvZHRlOlRvdGFsPjwvZHRlOkl0ZW0+PC9kdGU6SXRlbXM+PGR0ZTpUb3RhbGVzPjxkdGU6VG90YWxJbXB1ZXN0b3M+PGR0ZTpUb3RhbEltcHVlc3RvIE5vbWJyZUNvcnRvPSJJVkEiIFRvdGFsTW9udG9JbXB1ZXN0bz0iNi40Mjg2IiAvPjwvZHRlOlRvdGFsSW1wdWVzdG9zPjxkdGU6R3JhblRvdGFsPjYwLjAwMDA8L2R0ZTpHcmFuVG90YWw+PC9kdGU6VG90YWxlcz48L2R0ZTpEYXRvc0VtaXNpb24+PGR0ZTpDZXJ0aWZpY2FjaW9uPjxkdGU6TklUQ2VydGlmaWNhZG9yPjc3NDU0ODIwPC9kdGU6TklUQ2VydGlmaWNhZG9yPjxkdGU6Tm9tYnJlQ2VydGlmaWNhZG9yPkNZQkVSIEVTUEFDSU8sIFNPQ0lFREFEIEFOT05JTUE8L2R0ZTpOb21icmVDZXJ0aWZpY2Fkb3I+PGR0ZTpOdW1lcm9BdXRvcml6YWNpb24gU2VyaWU9Ijk3NTE0OUFEIiBOdW1lcm89IjE2MDg1OTk3ODYiPjk3NTE0OUFELTVGRTEtNDhFQS04RUY4LUM2QjcxNEI1NzU3NjwvZHRlOk51bWVyb0F1dG9yaXphY2lvbj48ZHRlOkZlY2hhSG9yYUNlcnRpZmljYWNpb24+MjAyNS0xMi0xMFQxMzoyODozODwvZHRlOkZlY2hhSG9yYUNlcnRpZmljYWNpb24+PC9kdGU6Q2VydGlmaWNhY2lvbj48L2R0ZTpEVEU+PC9kdGU6U0FUPjxkczpTaWduYXR1cmUgSWQ9IlNpZ25hdHVyZS1mODQxZTEyYS1hOTc5LTQxZGMtYTA4My02MTdlMjQ0NmQ5ODYiIHhtbG5zOmRzPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjIj48ZHM6U2lnbmVkSW5mbz48ZHM6Q2Fub25pY2FsaXphdGlvbk1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnL1RSLzIwMDEvUkVDLXhtbC1jMTRuLTIwMDEwMzE1IiAvPjxkczpTaWduYXR1cmVNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNyc2Etc2hhMjU2IiAvPjxkczpSZWZlcmVuY2UgSWQ9IlJlZmVyZW5jZS1iNzI2Y2IyMS0xNGQyLTRmMmYtYjg2My05YjdjNDk3ZThmYjIiIFVSST0iI0RhdG9zRW1pc2lvbiI+PGRzOlRyYW5zZm9ybXM+PGRzOlRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnL1RSLzIwMDEvUkVDLXhtbC1jMTRuLTIwMDEwMzE1IiAvPjwvZHM6VHJhbnNmb3Jtcz48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5VZDNqTFpubFJtaWF3UkZKL1BJYkdCSkUwWHBZU081NThZeUYzdmp0M1VRPTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PGRzOlJlZmVyZW5jZSBJZD0iUmVmZXJlbmNlS2V5SW5mby1TaWduYXR1cmUtZjg0MWUxMmEtYTk3OS00MWRjLWEwODMtNjE3ZTI0NDZkOTg2IiBVUkk9IiNLZXlJbmZvSWQtU2lnbmF0dXJlLWY4NDFlMTJhLWE5NzktNDFkYy1hMDgzLTYxN2UyNDQ2ZDk4NiI+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+eGdXNWFZa1RNQ3pXRjVZY2RmdmxKblBiNFJCN0ovcjF1UlBoV0tQc1NrZz08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjxkczpSZWZlcmVuY2UgVHlwZT0iaHR0cDovL3VyaS5ldHNpLm9yZy8wMTkwMyNTaWduZWRQcm9wZXJ0aWVzIiBVUkk9IiNTaWduZWRQcm9wZXJ0aWVzLVNpZ25hdHVyZS1mODQxZTEyYS1hOTc5LTQxZGMtYTA4My02MTdlMjQ0NmQ5ODYiPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPm9pb21pMDIzN2EzNDNqQmZPVG1tUHI3Y0l5Tm42MlBoeVpvSFBUMjZGa2c9PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48L2RzOlNpZ25lZEluZm8+PGRzOlNpZ25hdHVyZVZhbHVlPkQ3Q0tnN1YyNWttYW5ubTU3bGNBZ2NYdWtMdU5OMmJKeHNTQ2hUUEU2ZXlSdnRFOTVyTitBUzRKaWNMNjAvVi9HaCtKTkpJOG5UVjhQVSt0MGVDWVVkK3JEL2dDU2VqYjFEMmplclQ0TWRmek9WUHlSdFp0K2txU2ljMitDZFU5dFZMWGVJbGZxb1hOUmtobHl6c0Q1aFROTWZJWG51bFpUNDB0bUhZS3Y2SkJmZ3A2eUJoT1VybDUrWk9jZ2l4K3RwbHhHaC8zaG0zckppWEdoMGRSQ01xUEZFZGhDUmJhZVdxQ3VEeHBzQmJlR0RXVDZzc082WmtON0h1WUdQWmpvczVYbmFVeS9CUlhCSFA3TzNkd3BrUVBpaXljby9FOTNpZW10Z0kvbFFZWEVXZUJDdk5URkVhV0M1bitHVXZPZXdNT2twdWRRNnVmVU9XdHJXOTN0Zz09PC9kczpTaWduYXR1cmVWYWx1ZT48ZHM6S2V5SW5mbyBJZD0iS2V5SW5mb0lkLVNpZ25hdHVyZS1mODQxZTEyYS1hOTc5LTQxZGMtYTA4My02MTdlMjQ0NmQ5ODYiPjxkczpLZXlWYWx1ZT48ZHM6UlNBS2V5VmFsdWU+PGRzOk1vZHVsdXM+eDFkVUorUmlJNlJFeDBVV2RSNCttNGIxMXV2aUU3UFFWWmJ2WGY3b1FwQm1yZm1MNWdJUjFmdzhLOS8zemNKUmxQK2w1MU04MDZwemZiajArN0RqOWp5RHJYcTg1b0M5a1RCbnNNcHQ5amFkU2kvcWZzUngyRU5EYXViTi9ZODE2a0prUzltSFNRNXZYbXlmL3JJaTdDMVVvZDBETHY1WWR1aWk3S0tPakJDaTQzZE5LOVYrOUpOTStzUXd6V1B3ZW11cnkrTmdLaEdVY0k0MjhiUlFENHZPQ3pzbmptNlVrQ1ZwQnRPcEU2WUZodXE4Y0ErcTVPUVloSkVaQS91Yi9vcCttaUdiTi9DYUJKMDZPY3kxbWJtVk1xbXUxb3ZTMTZoYzA0N2YzNmZhWXBieHlYN1hFRmcvbGN4bVFDRnZpcVJScWQxYU5rVzlIQ3IwYU9yVDF3PT08L2RzOk1vZHVsdXM+PGRzOkV4cG9uZW50PkFRQUI8L2RzOkV4cG9uZW50PjwvZHM6UlNBS2V5VmFsdWU+PC9kczpLZXlWYWx1ZT48ZHM6WDUwOURhdGE+PGRzOlg1MDlDZXJ0aWZpY2F0ZT5NSUlEWVRDQ0FrbWdBd0lCQWdJSUhYamExY0VLZExNd0RRWUpLb1pJaHZjTkFRRUxCUUF3T0RFMk1EUUdBMVVFQXd3dFUzVndaWEpwYm5SbGJtUmxibU5wWVNCa1pTQkJaRzFwYm1semRISmhZMmx2YmlCVWNtbGlkWFJoY21saE1CNFhEVEkxTVRFeU5URXpOVEF6TjFvWERUSTNNVEV5TlRFek5UQXpOMW93S0RFUk1BOEdBMVVFQXd3SU1qZ3lNREV4TnpVeEV6QVJCZ05WQkFvTUNuTmhkQzVuYjJJdVozUXdnZ0VpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElCRHdBd2dnRUtBb0lCQVFESFYxUW41R0lqcEVUSFJSWjFIajZiaHZYVzYrSVRzOUJWbHU5ZC91aENrR2F0K1l2bUFoSFYvRHdyMy9mTndsR1UvNlhuVXp6VHFuTjl1UFQ3c09QMlBJT3RlcnptZ0wyUk1HZXd5bTMyTnAxS0wrcCt4SEhZUTBOcTVzMzlqelhxUW1STDJZZEpEbTllYkovK3NpTHNMVlNoM1FNdS9saDI2S0xzb282TUVLTGpkMDByMVg3MGswejZ4REROWS9CNmE2dkw0MkFxRVpSd2pqYnh0RkFQaTg0TE95ZU9icFNRSldrRzA2a1RwZ1dHNnJ4d0Q2cms1QmlFa1JrRCs1ditpbjZhSVpzMzhKb0VuVG81ekxXWnVaVXlxYTdXaTlMWHFGelRqdC9mcDlwaWx2SEpmdGNRV0QrVnpHWkFJVytLcEZHcDNWbzJSYjBjS3ZSbzZ0UFhBZ01CQUFHamZ6QjlNQXdHQTFVZEV3RUIvd1FDTUFBd0h3WURWUjBqQkJnd0ZvQVVXSUoyalZnb3NjbERCQUswMWNoZWFpLy8rRW93SFFZRFZSMGxCQll3RkFZSUt3WUJCUVVIQXdJR0NDc0dBUVVGQndNRU1CMEdBMVVkRGdRV0JCUWFjbStVTnN2ZlVJT1B4cTRVVk44Y3RTVktEREFPQmdOVkhROEJBZjhFQkFNQ0JlQXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRTlLK1ZlUW1HTVF3NnkvUC9jTUZQK011Wnc5anp5bGFwcDJLSE9CQVN4aStFWXVGYnJSNnM2VzN0SE1aMldFNnRJMzVXM1VWT253ZUpBZjNWQ0Qvamt6NktDNFFPclovOW9kdkowN1dJcnR2Ny9qYmF4R084SS83aVZaaGVOWWJJTWRCdEYxTHlnbEpQYTR4Z2kxRi9NOGtneG5jZ010Z2ZIZHM3eGdoc0lFYWNNM1JUUkppcE5SMngwWk5ZSXE2UGJ5R1hka2Jua1g2MnRMa3JkdVNMRXpsMWNSZDdRc3FNV0ExNytHZGtJeTZ3bzBtNW93cTdMcFJmbVdySkozWGFEcjBGTXE1bFFqYzNiK050NDdIb3RJY1UzRnhlT2RqYzUyTE1JQXAvRzZON3VJRE1TK3MvNDVwSUtvblRINTlKUkszTkVab04zdDV2TGRCaTVMY2JZPTwvZHM6WDUwOUNlcnRpZmljYXRlPjwvZHM6WDUwOURhdGE+PC9kczpLZXlJbmZvPjxkczpPYmplY3QgSWQ9IlhhZGVzT2JqZWN0SWQtODUxNThkMTktNmFiZC00NjI3LTkxMjItMTViYmJkMGU0YzA4Ij48eGFkZXM6UXVhbGlmeWluZ1Byb3BlcnRpZXMgSWQ9IlF1YWxpZnlpbmdQcm9wZXJ0aWVzLTE0ZjExYmM5LTAzN2MtNGY2Mi1hNGFhLWVjMjRkMWYxZDg3YiIgVGFyZ2V0PSIjU2lnbmF0dXJlLWY4NDFlMTJhLWE5NzktNDFkYy1hMDgzLTYxN2UyNDQ2ZDk4NiIgeG1sbnM6eGFkZXM9Imh0dHA6Ly91cmkuZXRzaS5vcmcvMDE5MDMvdjEuMy4yIyI+PHhhZGVzOlNpZ25lZFByb3BlcnRpZXMgSWQ9IlNpZ25lZFByb3BlcnRpZXMtU2lnbmF0dXJlLWY4NDFlMTJhLWE5NzktNDFkYy1hMDgzLTYxN2UyNDQ2ZDk4NiI+PHhhZGVzOlNpZ25lZFNpZ25hdHVyZVByb3BlcnRpZXM+PHhhZGVzOlNpZ25pbmdUaW1lPjIwMjUtMTItMTBUMTk6Mjg6MzlaPC94YWRlczpTaWduaW5nVGltZT48eGFkZXM6U2lnbmluZ0NlcnRpZmljYXRlPjx4YWRlczpDZXJ0Pjx4YWRlczpDZXJ0RGlnZXN0PjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPndCSG9rTXhRVmNQUEtkUFgzcVI3N2krbldhdytRQVBvanQ5bnMwSVcyRmM9PC9kczpEaWdlc3RWYWx1ZT48L3hhZGVzOkNlcnREaWdlc3Q+PHhhZGVzOklzc3VlclNlcmlhbD48ZHM6WDUwOUlzc3Vlck5hbWU+Q049U3VwZXJpbnRlbmRlbmNpYSBkZSBBZG1pbmlzdHJhY2lvbiBUcmlidXRhcmlhPC9kczpYNTA5SXNzdWVyTmFtZT48ZHM6WDUwOVNlcmlhbE51bWJlcj4yMTIzNjg3ODM1OTA2NzY2MDAzPC9kczpYNTA5U2VyaWFsTnVtYmVyPjwveGFkZXM6SXNzdWVyU2VyaWFsPjwveGFkZXM6Q2VydD48L3hhZGVzOlNpZ25pbmdDZXJ0aWZpY2F0ZT48L3hhZGVzOlNpZ25lZFNpZ25hdHVyZVByb3BlcnRpZXM+PHhhZGVzOlNpZ25lZERhdGFPYmplY3RQcm9wZXJ0aWVzPjx4YWRlczpEYXRhT2JqZWN0Rm9ybWF0IE9iamVjdFJlZmVyZW5jZT0iI1JlZmVyZW5jZS1iNzI2Y2IyMS0xNGQyLTRmMmYtYjg2My05YjdjNDk3ZThmYjIiPjx4YWRlczpNaW1lVHlwZT50ZXh0L3htbDwveGFkZXM6TWltZVR5cGU+PHhhZGVzOkVuY29kaW5nPlVURi04PC94YWRlczpFbmNvZGluZz48L3hhZGVzOkRhdGFPYmplY3RGb3JtYXQ+PC94YWRlczpTaWduZWREYXRhT2JqZWN0UHJvcGVydGllcz48L3hhZGVzOlNpZ25lZFByb3BlcnRpZXM+PC94YWRlczpRdWFsaWZ5aW5nUHJvcGVydGllcz48L2RzOk9iamVjdD48L2RzOlNpZ25hdHVyZT48ZHM6U2lnbmF0dXJlIElkPSJTaWduYXR1cmUtZTMxOGY3NGMtMDYwYi00YjJmLTlmMWMtZDUwMTI1OGZkMmE4IiB4bWxuczpkcz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PGRzOlNpZ25lZEluZm8+PGRzOkNhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy14bWwtYzE0bi0yMDAxMDMxNSIgLz48ZHM6U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxkc2lnLW1vcmUjcnNhLXNoYTI1NiIgLz48ZHM6UmVmZXJlbmNlIElkPSJSZWZlcmVuY2UtYTc4ZWFjMWQtNGIwNi00OTI0LWEzNGEtZDlkNDg5MDI2NGExIiBVUkk9IiNEYXRvc0NlcnRpZmljYWRvcyI+PGRzOlRyYW5zZm9ybXM+PGRzOlRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnL1RSLzIwMDEvUkVDLXhtbC1jMTRuLTIwMDEwMzE1IiAvPjwvZHM6VHJhbnNmb3Jtcz48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5yK1VnZlFLcDA4MWpYQ0FHSWoxQXV6cVdOUWV5OG45a0o3OS8vRmZnNWtZPTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PGRzOlJlZmVyZW5jZSBJZD0iUmVmZXJlbmNlS2V5SW5mby1TaWduYXR1cmUtZTMxOGY3NGMtMDYwYi00YjJmLTlmMWMtZDUwMTI1OGZkMmE4IiBVUkk9IiNLZXlJbmZvSWQtU2lnbmF0dXJlLWUzMThmNzRjLTA2MGItNGIyZi05ZjFjLWQ1MDEyNThmZDJhOCI+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+dHBUUHZqMDNBL2g1OG9zUkpUR1dvUlp3a2k0VmpWUXZsb28zOHJMSWFDOD08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjxkczpSZWZlcmVuY2UgVHlwZT0iaHR0cDovL3VyaS5ldHNpLm9yZy8wMTkwMyNTaWduZWRQcm9wZXJ0aWVzIiBVUkk9IiNTaWduZWRQcm9wZXJ0aWVzLVNpZ25hdHVyZS1lMzE4Zjc0Yy0wNjBiLTRiMmYtOWYxYy1kNTAxMjU4ZmQyYTgiPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPmxWZVVYRlRvVHJibzRhK3FQWHFIQ1VBWjNIeEk5RDVJQW5lbFhXckNaT0k9PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48L2RzOlNpZ25lZEluZm8+PGRzOlNpZ25hdHVyZVZhbHVlPkpGek5MeUtxMVVPTTZseDhWWVB1K1lTRk5sYmdKYTBZampkU2RSZmRiem81bG5UL3FiN0J1WEJJb3owRHhtaHpQOTBjTEVUQjFvQUdQWkI4VXdncGEwRXNSUVVlQXk3MEhOSFBBZXdFd3JMYmpNMTh5ZDBBaC9LNTI0cW9WMVQySTZDN3F3VFZrM0Z6V09VaEZGNExTelEzNjdiSUJiUFRBeVVJR0dZa2hMUnFJN3VKaHBBZTVCVm9PMGRUZGVKa3VMeU91cXA4aDF6YUtGUUh5RE03TDlYUjZ0dXFkSmh3OEdobkFuZXJ1S0taSHNMejBJR0N2V1VlYm4rdHEyODluOXBBTllYWFBsbFFGSkJaNzRKc3Q1WC9yUkhJS0lqMnhtdXNWa1JUdVYveXJEbEMrN3I2VkpiUXJqS0lLeTRZRFBIczhaQ2JrN1lsai8xbTVudkhBdz09PC9kczpTaWduYXR1cmVWYWx1ZT48ZHM6S2V5SW5mbyBJZD0iS2V5SW5mb0lkLVNpZ25hdHVyZS1lMzE4Zjc0Yy0wNjBiLTRiMmYtOWYxYy1kNTAxMjU4ZmQyYTgiPjxkczpLZXlWYWx1ZT48ZHM6UlNBS2V5VmFsdWU+PGRzOk1vZHVsdXM+MGorYVFjakEveWdML3ZETTBVNERyMFdpL09MdXB1eE1xelN4bVZSYk1idGVFK3IvU2pzV0ZJdUFQUzI5d1Z2bmZQVTc1bzdvLytSWTlFYXNxZlJPaXI0djlMNHhlN0RJckFWMStJTEpUOXlVRE8zcGF5OGN2c0lWY3lFdEM2VTR0eTF5VTkwTnlnSTBHV0MzS2JvenF4ZUYydjIvNUthMzAzUjhTTGt1LzM5V2lVSyt4YlFLYjB0U29JeDdSWjl3RTRFdVR3RjRUTmFaUi9yclZaRldNZzk1Sk93MmdoNWdYdE1kL1dmQUhNM0pwTFVKQW1WZmp4S21LMmNrWDYvMVhMOEhBNlo0YlFzcUljSkE3MDRFenA5MkVFZ211dXkwVGhzcmNybHM4dk41WVYxMXQ2M0lFWHVXRlJLNWNtVk5IbVNhYmkrREwwakNpTjlnWnhINW93PT08L2RzOk1vZHVsdXM+PGRzOkV4cG9uZW50PkFRQUI8L2RzOkV4cG9uZW50PjwvZHM6UlNBS2V5VmFsdWU+PC9kczpLZXlWYWx1ZT48ZHM6WDUwOURhdGE+PGRzOlg1MDlDZXJ0aWZpY2F0ZT5NSUlKMHpDQ0I3dWdBd0lCQWdJSWJnbkdFMlZIZUdvd0RRWUpLb1pJaHZjTkFRRUxCUUF3Z2NBeEZqQVVCZ05WQkdFTURWWkJWRWRVTFRNMU1UVTVMVGd4TFRBckJnTlZCQU1NSkVOaGJXRnlZU0JrWlNCRGIyMWxjbU5wYnlCa1pTQkhkV0YwWlcxaGJHRWdRMEVnTVRFc01Db0dBMVVFQ3d3alVGTkRMVU5oYldGeVlTQmtaU0JEYjIxbGNtTnBieUJrWlNCSGRXRjBaVzFoYkdFeEtEQW1CZ05WQkFvTUgwTmhiV0Z5WVNCa1pTQkRiMjFsY21OcGJ5QmtaU0JIZFdGMFpXMWhiR0V4RWpBUUJnTlZCQWNNQ1VkMVlYUmxiV0ZzWVRFTE1Ba0dBMVVFQmhNQ1IxUXdIaGNOTWpRd016QTRNakkwTXpBd1doY05Nall3TXpBNE1qSTBNekF3V2pDQnp6RTZNRGdHQTFVRUNRd3hOQ0JCZG1WdWFXUmhJREUxTFRjd0lGcHZibUVnTVRBZ1JXUnBabWxqYVc4Z1VHRnNZV1JwZFcwZ1RHOWpZV3dnTXpFaE1COEdBMVVFQXd3WVJHbG5hV1poWTNRZ1UyVnlkbWxqYVc5ekxDQlRMa0V1TVJFd0R3WURWUVFGRXdnM056UTFORGd5TURFaE1COEdBMVVFQ2d3WVJHbG5hV1poWTNRZ1UyVnlkbWxqYVc5ekxDQlRMa0V1TVJJd0VBWURWUVFIREFsSGRXRjBaVzFoYkdFeEN6QUpCZ05WQkFZVEFrZFVNUmN3RlFZRFZRUmhEQTVXUVZSSFZDMDNOelExTkRneU1EQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQU5JL21rSEl3UDhvQy83d3pORk9BNjlGb3Z6aTdxYnNUS3Mwc1psVVd6RzdYaFBxLzBvN0ZoU0xnRDB0dmNGYjUzejFPK2FPNlAva1dQUkdyS24wVG9xK0wvUytNWHV3eUt3RmRmaUN5VS9jbEF6dDZXc3ZITDdDRlhNaExRdWxPTGN0Y2xQZERjb0NOQmxndHltNk02c1hoZHI5ditTbXQ5TjBmRWk1THY5L1ZvbEN2c1cwQ205TFVxQ01lMFdmY0JPQkxrOEJlRXpXbVVmNjYxV1JWaklQZVNUc05vSWVZRjdUSGYxbndCek55YVMxQ1FKbFg0OFNwaXRuSkYrdjlWeS9Cd09tZUcwTEtpSENRTzlPQk02ZmRoQklKcnJzdEU0YkszSzViUEx6ZVdGZGRiZXR5QkY3bGhVU3VYSmxUUjVrbW00dmd5OUl3b2pmWUdjUithTUNBd0VBQWFPQ0JMNHdnZ1M2TUlITEJnZ3JCZ0VGQlFjQkFRU0J2akNCdXpCSkJnZ3JCZ0VGQlFjd0FvWTlhSFIwY0RvdkwzZDNkeTVtYVhKdFlTMWxMbU52YlM1bmRDOWpaWEowYVdacFkyRmtiM012WVdOZmMzVmliM0prYVc1aFpHRmZZMk5uTG1ObGNqQTJCZ2dyQmdFRkJRY3dBWVlxYUhSMGNEb3ZMMjlqYzNBeExuVmhibUYwWVdOaExtTnZiUzl3ZFdKc2FXTXZjR3RwTDI5amMzQXZNRFlHQ0NzR0FRVUZCekFCaGlwb2RIUndPaTh2YjJOemNESXVkV0Z1WVhSaFkyRXVZMjl0TDNCMVlteHBZeTl3YTJrdmIyTnpjQzh3SFFZRFZSME9CQllFRkI4V0ova3c4UzZmYnJKTlB2dG52bHZoanJLVU1Bd0dBMVVkRXdFQi93UUNNQUF3SHdZRFZSMGpCQmd3Rm9BVUJ6SVNXanN2RWthRFZqR3RodVhUUWhZdHdKc3dGZ1lEVlIwU0JBOHdEWUVMYVc1bWIwQmpZMmN1WjNRd2dnS3NCZ05WSFNBRWdnS2pNSUlDbnpDQ0FwRUdDaXNHQVFRQmdiVmpBUVl3Z2dLQk1Dc0dDQ3NHQVFVRkJ3SUJGaDlvZEhSd2N6b3ZMMlpwY20xaExXVXVZMjl0TG1kMEwycDFjbWxrYVdOdk1JSUJSZ1lJS3dZQkJRVUhBZ0l3Z2dFNEhvSUJOQUJEQUdVQWNnQjBBR2tBWmdCcEFHTUFZUUJrQUc4QUlBQkVBR2tBWndCcEFIUUFZUUJzQUNBQVpBQmxBQ0FBVUFCbEFISUFjd0J2QUc0QVlRQWdBRW9BZFFCeUFPMEFaQUJwQUdNQVlRQWdBR1VBYlFCcEFIUUFhUUJrQUc4QUlBQndBRzhBY2dBZ0FFTUE0UUJ0QUdFQWNnQmhBQ0FBWkFCbEFDQUFRd0J2QUcwQVpRQnlBR01BYVFCdkFDQUFaQUJsQUNBQVJ3QjFBR0VBZEFCbEFHMEFZUUJzQUdFQUxBQWdBRTRBU1FCVUFDQUFNd0ExQURFQU5RQTVBQzBBT0FBc0FDQUFhUUJ1QUdZQWJ3QkFBR01BWXdCbkFDNEFad0IwQUN3QUlBQjFBR0lBYVFCakFHRUFaQUJ2QUNBQVpRQnVBQ0FBTVFBd0FDQUFRd0JoQUd3QWJBQmxBQ0FBTXdBdEFEZ0FNQUFnQUZvQWJ3QnVBR0VBSUFBeEFDd0FJQUJIQUhVQVlRQjBBR1VBYlFCaEFHd0FZUUF1TUlJQkJnWUlLd1lCQlFVSEFnSXdnZmtlZ2ZZQVFRQjFBSFFBYndCeUFHa0FlZ0JoQUdRQWJ3QWdBSE1BWlFCbkFQb0FiZ0FnQUhJQVpRQnpBRzhBYkFCMUFHTUFhUUR6QUc0QUlBQmtBR1VBSUFBeUFETUFMZ0F3QURFQUxnQXlBREFBTVFBeUFDd0FJQUJPQUc4QUxnQWdBRkFBVXdCREFDMEFNQUF4QUMwQU1nQXdBREVBTWdBZ0FHUUFaUUJzQUNBQVVnQlFBRk1BUXdBZ0FHUUFaUUJzQUNBQVRRQnBBRzRBYVFCekFIUUFaUUJ5QUdrQWJ3QWdBR1FBWlFBZ0FFVUFZd0J2QUc0QWJ3QnRBTzBBWVFBZ0FHUUFaUUFnQUd3QVlRQWdBRklBWlFCd0FQb0FZZ0JzQUdrQVl3QmhBQ0FBWkFCbEFDQUFSd0IxQUdFQWRBQmxBRzBBWVFCc0FHRXdDQVlHQkFDUGVnRUNNSGtHQTFVZEh3UnlNSEF3TnFBMG9ES0dNR2gwZEhBNkx5OWpjbXd4TG5WaGJtRjBZV05oTG1OdmJTOXdkV0pzYVdNdmNHdHBMMk55YkM5RFEwZFVMbU55YkRBMm9EU2dNb1l3YUhSMGNEb3ZMMk55YkRJdWRXRnVZWFJoWTJFdVkyOXRMM0IxWW14cFl5OXdhMmt2WTNKc0wwTkRSMVF1WTNKc01BNEdBMVVkRHdFQi93UUVBd0lGNERBZEJnTlZIU1VFRmpBVUJnZ3JCZ0VGQlFjREFnWUlLd1lCQlFVSEF3UXdLZ1lEVlIwUkJDTXdJWUVmYm1WemRHOXlMbUpoYkd4bGMzUmxjbTl6UUdScFoybG1ZV04wTG1OdmJUQU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FnRUFHWVp6aHJqUFMxYjZ2NnlTWkJ0UmhXbDgxRDZmaG5JWTdnTXJ0enJmbVFUZElGYkhRZjJKQlVnY2pQRE84aDVpSW1CWnZsQzIzRDkvanMvbUZON0pTcG1xbnV4cFhzb0daWFd6TDV0eWY3bURDWXdzKzBpZnliZDF2THFTUHlyWi9EbFZKRWllTFdOYUFSVnBHVzJEK3UycGxVVDQ0U2RSUVVzRmoyYXR6UVJ5OHl3UVlpQnIrejFOTlNoNDVpUkY0ZXlySmVWUENpMlNvVDkveG15STladC9Qd3hGWHNleFAwS1htVUIzaHpyRitXT2t2cG1YZlB5N254aFArYVllUFhzajdxMW1jOXI4TUFWZWpIbkVyVTYvVW96dFVDelZEWDlmYk5qZGhWVVh6aVpwcDVzSzBBRXdWWHdsak9rNnNVM25WSXl3NHZHZjVQRGphSytFeit4ZDhvTGJ3NkdnSXVNbEhKNkhzWEhMZTAxV3dnRDExeVRmMHR3clMvVkQ3Zmg5MlV1YS9CZElsYnV0L3FJRVpTVEJaZ2VYMEVBZ08rQkVjbEFOZWRRc20xUExpNmxqa0FRTnNpQ0hWMFlpLzF4d1NZa1M4UE5ZNmd2aWRUek9BdFlHTy8xQjhPeXk1bEc1M2RJRUlSMUxacnRBWHd1REUveERLZnRiS2QvMkRraFdubGJ6TFJIS042bGhFdzBJeUErOFZZNGd2aEZJMENWUklGQWthalNwZ2hrZXhaMHdMZjZUbGFxYndpUjhyZWdtcGhIS1RsSlh1Um90OFo2SENqZjZ6RkhlSUVBSDhhRFh3VmdGZ0xtaU9oamRlK3R0V0RNL1RVRXU3RmxrdVNiVkhuazQ0QThFbGw4Znl4SWJDZ3BsNlZ5Nm1aWWo1cVJ2TXdCUElwQT08L2RzOlg1MDlDZXJ0aWZpY2F0ZT48L2RzOlg1MDlEYXRhPjwvZHM6S2V5SW5mbz48ZHM6T2JqZWN0IElkPSJYYWRlc09iamVjdElkLWFjYTZmMTk0LTIyMGUtNDRkYS1hZDJjLTE4ZWJmNTE5ZmEwYyI+PHhhZGVzOlF1YWxpZnlpbmdQcm9wZXJ0aWVzIElkPSJRdWFsaWZ5aW5nUHJvcGVydGllcy03N2I4ODM5MC00YjZkLTRmZDUtOTc4Ni0yM2IzNTMzZmQ2ZDkiIFRhcmdldD0iI1NpZ25hdHVyZS1lMzE4Zjc0Yy0wNjBiLTRiMmYtOWYxYy1kNTAxMjU4ZmQyYTgiIHhtbG5zOnhhZGVzPSJodHRwOi8vdXJpLmV0c2kub3JnLzAxOTAzL3YxLjMuMiMiPjx4YWRlczpTaWduZWRQcm9wZXJ0aWVzIElkPSJTaWduZWRQcm9wZXJ0aWVzLVNpZ25hdHVyZS1lMzE4Zjc0Yy0wNjBiLTRiMmYtOWYxYy1kNTAxMjU4ZmQyYTgiPjx4YWRlczpTaWduZWRTaWduYXR1cmVQcm9wZXJ0aWVzPjx4YWRlczpTaWduaW5nVGltZT4yMDI1LTEyLTEwVDE5OjI4OjM5WjwveGFkZXM6U2lnbmluZ1RpbWU+PHhhZGVzOlNpZ25pbmdDZXJ0aWZpY2F0ZT48eGFkZXM6Q2VydD48eGFkZXM6Q2VydERpZ2VzdD48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT45ZmlzYk9rQUl6RTVoZVdlWVdxdndlNnUyQ2NSVSt2L21KdlliVk83dnFrPTwvZHM6RGlnZXN0VmFsdWU+PC94YWRlczpDZXJ0RGlnZXN0Pjx4YWRlczpJc3N1ZXJTZXJpYWw+PGRzOlg1MDlJc3N1ZXJOYW1lPkM9R1QsIEw9R3VhdGVtYWxhLCBPPUNhbWFyYSBkZSBDb21lcmNpbyBkZSBHdWF0ZW1hbGEsIE9VPVBTQy1DYW1hcmEgZGUgQ29tZXJjaW8gZGUgR3VhdGVtYWxhLCBDTj1DYW1hcmEgZGUgQ29tZXJjaW8gZGUgR3VhdGVtYWxhIENBIDEsIE9JRC4yLjUuNC45Nz1WQVRHVC0zNTE1OS04PC9kczpYNTA5SXNzdWVyTmFtZT48ZHM6WDUwOVNlcmlhbE51bWJlcj43OTI5MDg2NDA1NTY4MzI5ODM0PC9kczpYNTA5U2VyaWFsTnVtYmVyPjwveGFkZXM6SXNzdWVyU2VyaWFsPjwveGFkZXM6Q2VydD48L3hhZGVzOlNpZ25pbmdDZXJ0aWZpY2F0ZT48L3hhZGVzOlNpZ25lZFNpZ25hdHVyZVByb3BlcnRpZXM+PHhhZGVzOlNpZ25lZERhdGFPYmplY3RQcm9wZXJ0aWVzPjx4YWRlczpEYXRhT2JqZWN0Rm9ybWF0IE9iamVjdFJlZmVyZW5jZT0iI1JlZmVyZW5jZS1hNzhlYWMxZC00YjA2LTQ5MjQtYTM0YS1kOWQ0ODkwMjY0YTEiPjx4YWRlczpNaW1lVHlwZT50ZXh0L3htbDwveGFkZXM6TWltZVR5cGU+PHhhZGVzOkVuY29kaW5nPlVURi04PC94YWRlczpFbmNvZGluZz48L3hhZGVzOkRhdGFPYmplY3RGb3JtYXQ+PC94YWRlczpTaWduZWREYXRhT2JqZWN0UHJvcGVydGllcz48L3hhZGVzOlNpZ25lZFByb3BlcnRpZXM+PC94YWRlczpRdWFsaWZ5aW5nUHJvcGVydGllcz48L2RzOk9iamVjdD48L2RzOlNpZ25hdHVyZT48L2R0ZTpHVERvY3VtZW50bz4=', 'FACT'),
(2, 1, '2025-12-13 16:36:12', 108.00, 'REC-00000001', NULL, 900.00, 1, 1, 7, 1, '2025-12-13 16:36:12', '2025-12-13 16:36:12', NULL, NULL, NULL, 'RECI'),
(3, 1, '2025-12-13 16:42:22', 7.20, '00000004', 'A', 60.00, 0, 3, 7, 1, '2025-12-13 16:42:22', '2025-12-13 16:42:23', NULL, NULL, NULL, 'FACT'),
(4, 1, '2025-12-13 16:42:55', 7.20, '00000005', 'A', 60.00, 0, 3, 7, 1, '2025-12-13 16:42:55', '2025-12-13 16:42:56', NULL, NULL, NULL, 'FACT'),
(5, 1, '2025-12-13 16:43:28', 7.20, 'REC-00000002', NULL, 60.00, 0, 3, 7, 1, '2025-12-13 16:43:28', '2025-12-13 16:46:32', NULL, NULL, NULL, 'RECI'),
(6, 1, '2025-12-15 11:27:53', 7.20, '634931183', 'F0371FDB', 60.00, 0, 1, 5, 1, '2025-12-15 11:27:53', '2025-12-15 11:30:57', 'F0371FDB-25D8-47EF-87C7-61612047B6B0', '2025-12-15 10:28:14', 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48ZHRlOkdURG9jdW1lbnRvIFZlcnNpb249IjAuMSIgeG1sbnM6ZHRlPSJodHRwOi8vd3d3LnNhdC5nb2IuZ3QvZHRlL2ZlbC8wLjIuMCIgeG1sbnM6eHNpPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxL1hNTFNjaGVtYS1pbnN0YW5jZSI+PGR0ZTpTQVQgQ2xhc2VEb2N1bWVudG89ImR0ZSI+PGR0ZTpEVEUgSUQ9IkRhdG9zQ2VydGlmaWNhZG9zIj48ZHRlOkRhdG9zRW1pc2lvbiBJRD0iRGF0b3NFbWlzaW9uIj48ZHRlOkRhdG9zR2VuZXJhbGVzIFRpcG89IkZBQ1QiIEZlY2hhSG9yYUVtaXNpb249IjIwMjUtMTItMTVUMTE6Mjc6NTMiIENvZGlnb01vbmVkYT0iR1RRIiAvPjxkdGU6RW1pc29yIE5JVEVtaXNvcj0iMjgyMDExNzUiIE5vbWJyZUVtaXNvcj0iTUFSQ09TLCBaRVRJTk8gUkFMRVMiIENvZGlnb0VzdGFibGVjaW1pZW50bz0iMSIgTm9tYnJlQ29tZXJjaWFsPSJIT1RFTCBaRVRJTk8iIEFmaWxpYWNpb25JVkE9IkdFTiI+PGR0ZTpEaXJlY2Npb25FbWlzb3I+PGR0ZTpEaXJlY2Npb24+Q2l1ZGFkPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25FbWlzb3I+PC9kdGU6RW1pc29yPjxkdGU6UmVjZXB0b3IgTm9tYnJlUmVjZXB0b3I9IkNvbnN1bWlkb3IgRmluYWwiIElEUmVjZXB0b3I9IkNGIj48ZHRlOkRpcmVjY2lvblJlY2VwdG9yPjxkdGU6RGlyZWNjaW9uPkNGPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25SZWNlcHRvcj48L2R0ZTpSZWNlcHRvcj48ZHRlOkZyYXNlcz48ZHRlOkZyYXNlIFRpcG9GcmFzZT0iMSIgQ29kaWdvRXNjZW5hcmlvPSIxIiAvPjwvZHRlOkZyYXNlcz48ZHRlOkl0ZW1zPjxkdGU6SXRlbSBOdW1lcm9MaW5lYT0iMSIgQmllbk9TZXJ2aWNpbz0iQiI+PGR0ZTpDYW50aWRhZD4xLjAwMDA8L2R0ZTpDYW50aWRhZD48ZHRlOlVuaWRhZE1lZGlkYT5MVFI8L2R0ZTpVbmlkYWRNZWRpZGE+PGR0ZTpEZXNjcmlwY2lvbj5BY2VpdGUgQ2FzdHJvbCBDUkIgVHVyYm9tYXggMTVXLTQwPC9kdGU6RGVzY3JpcGNpb24+PGR0ZTpQcmVjaW9Vbml0YXJpbz42MC4wMDAwPC9kdGU6UHJlY2lvVW5pdGFyaW8+PGR0ZTpQcmVjaW8+NjAuMDAwMDwvZHRlOlByZWNpbz48ZHRlOkRlc2N1ZW50bz4wPC9kdGU6RGVzY3VlbnRvPjxkdGU6SW1wdWVzdG9zPjxkdGU6SW1wdWVzdG8+PGR0ZTpOb21icmVDb3J0bz5JVkE8L2R0ZTpOb21icmVDb3J0bz48ZHRlOkNvZGlnb1VuaWRhZEdyYXZhYmxlPjE8L2R0ZTpDb2RpZ29VbmlkYWRHcmF2YWJsZT48ZHRlOk1vbnRvR3JhdmFibGU+NTMuNTcxNDwvZHRlOk1vbnRvR3JhdmFibGU+PGR0ZTpNb250b0ltcHVlc3RvPjYuNDI4NjwvZHRlOk1vbnRvSW1wdWVzdG8+PC9kdGU6SW1wdWVzdG8+PC9kdGU6SW1wdWVzdG9zPjxkdGU6VG90YWw+NjAuMDAwMDwvZHRlOlRvdGFsPjwvZHRlOkl0ZW0+PC9kdGU6SXRlbXM+PGR0ZTpUb3RhbGVzPjxkdGU6VG90YWxJbXB1ZXN0b3M+PGR0ZTpUb3RhbEltcHVlc3RvIE5vbWJyZUNvcnRvPSJJVkEiIFRvdGFsTW9udG9JbXB1ZXN0bz0iNi40Mjg2IiAvPjwvZHRlOlRvdGFsSW1wdWVzdG9zPjxkdGU6R3JhblRvdGFsPjYwLjAwMDA8L2R0ZTpHcmFuVG90YWw+PC9kdGU6VG90YWxlcz48L2R0ZTpEYXRvc0VtaXNpb24+PGR0ZTpDZXJ0aWZpY2FjaW9uPjxkdGU6TklUQ2VydGlmaWNhZG9yPjc3NDU0ODIwPC9kdGU6TklUQ2VydGlmaWNhZG9yPjxkdGU6Tm9tYnJlQ2VydGlmaWNhZG9yPkNZQkVSIEVTUEFDSU8sIFNPQ0lFREFEIEFOT05JTUE8L2R0ZTpOb21icmVDZXJ0aWZpY2Fkb3I+PGR0ZTpOdW1lcm9BdXRvcml6YWNpb24gU2VyaWU9IkYwMzcxRkRCIiBOdW1lcm89IjYzNDkzMTE4MyI+RjAzNzFGREItMjVEOC00N0VGLTg3QzctNjE2MTIwNDdCNkIwPC9kdGU6TnVtZXJvQXV0b3JpemFjaW9uPjxkdGU6RmVjaGFIb3JhQ2VydGlmaWNhY2lvbj4yMDI1LTEyLTE1VDEwOjI4OjE0PC9kdGU6RmVjaGFIb3JhQ2VydGlmaWNhY2lvbj48L2R0ZTpDZXJ0aWZpY2FjaW9uPjwvZHRlOkRURT48L2R0ZTpTQVQ+PGRzOlNpZ25hdHVyZSBJZD0iU2lnbmF0dXJlLTBkN2E2YTFmLTczNzctNDJlOC1iYjc5LTNlZmJjMDI5ZGRiZSIgeG1sbnM6ZHM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvMDkveG1sZHNpZyMiPjxkczpTaWduZWRJbmZvPjxkczpDYW5vbmljYWxpemF0aW9uTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvVFIvMjAwMS9SRUMteG1sLWMxNG4tMjAwMTAzMTUiIC8+PGRzOlNpZ25hdHVyZU1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZHNpZy1tb3JlI3JzYS1zaGEyNTYiIC8+PGRzOlJlZmVyZW5jZSBJZD0iUmVmZXJlbmNlLWJjOTQ3NmQwLTliNWEtNGM3Ni1hYTM4LWM1MzI4MmZjZTgwMyIgVVJJPSIjRGF0b3NFbWlzaW9uIj48ZHM6VHJhbnNmb3Jtcz48ZHM6VHJhbnNmb3JtIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvVFIvMjAwMS9SRUMteG1sLWMxNG4tMjAwMTAzMTUiIC8+PC9kczpUcmFuc2Zvcm1zPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPnJKdmM5VklEYXZWdHBZM3BKaG5PaStUNEZFem5WMFlYa21paFJsSjFnSUk9PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48ZHM6UmVmZXJlbmNlIElkPSJSZWZlcmVuY2VLZXlJbmZvLVNpZ25hdHVyZS0wZDdhNmExZi03Mzc3LTQyZTgtYmI3OS0zZWZiYzAyOWRkYmUiIFVSST0iI0tleUluZm9JZC1TaWduYXR1cmUtMGQ3YTZhMWYtNzM3Ny00MmU4LWJiNzktM2VmYmMwMjlkZGJlIj48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5VRnB4THc5bnVNSGppV0pHTlBhaEw1MGVTdEYvcHZnRy9Ra0FvNzJlODd3PTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PGRzOlJlZmVyZW5jZSBUeXBlPSJodHRwOi8vdXJpLmV0c2kub3JnLzAxOTAzI1NpZ25lZFByb3BlcnRpZXMiIFVSST0iI1NpZ25lZFByb3BlcnRpZXMtU2lnbmF0dXJlLTBkN2E2YTFmLTczNzctNDJlOC1iYjc5LTNlZmJjMDI5ZGRiZSI+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+ay82L0wyWnRScUxhSkN5YWNHcUVNYWgwbS8xYWNJeHlIMjFmZDE0U1JFdz08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjwvZHM6U2lnbmVkSW5mbz48ZHM6U2lnbmF0dXJlVmFsdWU+RUdwS25kUys0cndxekI3WlJXWGF6c242bDJ0ZEJHS2xENlB5QThUZ2pveTR6QzA1eWFCV0swUEVWM2F4bW13Ykx4VzBteW55bkhNbUhnTjNaTnhxT1gyc3JKRDVKQUZwMnAzM1RIVDBwRkg4L3pSUXIyYTFYM0ZhQnFvZ3NUVngwOGFQN1R3bUUwZEtsRnFHcWE1cjVBUkcwaXNWUEM2dGlJenhSaGZ1THJXTHRuVyt4Z3RDZmN1U2tWMGF6Q0ZrNWRBM1lOSWZueEhBQXRYQmhvU2w4eXJkMGJtbE0vTWo2bmF0MENSVzJuclRpVTljc3hoZ2xnUWphRVFEUXNqcUluRjJtK054NFgvaWxneW1TZW45WlRuQURyZ3FuQXJIYXhVeDVuQyt4dTNEQ2hRZ25HSXV2ZUNjZkFMcFM3SFVnaVlHT290MlY5UGV1UW5UTURVTlNnPT08L2RzOlNpZ25hdHVyZVZhbHVlPjxkczpLZXlJbmZvIElkPSJLZXlJbmZvSWQtU2lnbmF0dXJlLTBkN2E2YTFmLTczNzctNDJlOC1iYjc5LTNlZmJjMDI5ZGRiZSI+PGRzOktleVZhbHVlPjxkczpSU0FLZXlWYWx1ZT48ZHM6TW9kdWx1cz54MWRVSitSaUk2UkV4MFVXZFI0K200YjExdXZpRTdQUVZaYnZYZjdvUXBCbXJmbUw1Z0lSMWZ3OEs5LzN6Y0pSbFArbDUxTTgwNnB6ZmJqMCs3RGo5anlEclhxODVvQzlrVEJuc01wdDlqYWRTaS9xZnNSeDJFTkRhdWJOL1k4MTZrSmtTOW1IU1E1dlhteWYvcklpN0MxVW9kMERMdjVZZHVpaTdLS09qQkNpNDNkTks5Vis5Sk5NK3NRd3pXUHdlbXVyeStOZ0toR1VjSTQyOGJSUUQ0dk9DenNuam02VWtDVnBCdE9wRTZZRmh1cThjQStxNU9RWWhKRVpBL3ViL29wK21pR2JOL0NhQkowNk9jeTFtYm1WTXFtdTFvdlMxNmhjMDQ3ZjM2ZmFZcGJ4eVg3WEVGZy9sY3htUUNGdmlxUlJxZDFhTmtXOUhDcjBhT3JUMXc9PTwvZHM6TW9kdWx1cz48ZHM6RXhwb25lbnQ+QVFBQjwvZHM6RXhwb25lbnQ+PC9kczpSU0FLZXlWYWx1ZT48L2RzOktleVZhbHVlPjxkczpYNTA5RGF0YT48ZHM6WDUwOUNlcnRpZmljYXRlPk1JSURZVENDQWttZ0F3SUJBZ0lJSFhqYTFjRUtkTE13RFFZSktvWklodmNOQVFFTEJRQXdPREUyTURRR0ExVUVBd3d0VTNWd1pYSnBiblJsYm1SbGJtTnBZU0JrWlNCQlpHMXBibWx6ZEhKaFkybHZiaUJVY21saWRYUmhjbWxoTUI0WERUSTFNVEV5TlRFek5UQXpOMW9YRFRJM01URXlOVEV6TlRBek4xb3dLREVSTUE4R0ExVUVBd3dJTWpneU1ERXhOelV4RXpBUkJnTlZCQW9NQ25OaGRDNW5iMkl1WjNRd2dnRWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUJEd0F3Z2dFS0FvSUJBUURIVjFRbjVHSWpwRVRIUlJaMUhqNmJodlhXNitJVHM5QlZsdTlkL3VoQ2tHYXQrWXZtQWhIVi9Ed3IzL2ZOd2xHVS82WG5VenpUcW5OOXVQVDdzT1AyUElPdGVyem1nTDJSTUdld3ltMzJOcDFLTCtwK3hISFlRME5xNXMzOWp6WHFRbVJMMllkSkRtOWViSi8rc2lMc0xWU2gzUU11L2xoMjZLTHNvbzZNRUtMamQwMHIxWDcwazB6NnhERE5ZL0I2YTZ2TDQyQXFFWlJ3ampieHRGQVBpODRMT3llT2JwU1FKV2tHMDZrVHBnV0c2cnh3RDZyazVCaUVrUmtEKzV2K2luNmFJWnMzOEpvRW5UbzV6TFdadVpVeXFhN1dpOUxYcUZ6VGp0L2ZwOXBpbHZISmZ0Y1FXRCtWekdaQUlXK0twRkdwM1ZvMlJiMGNLdlJvNnRQWEFnTUJBQUdqZnpCOU1Bd0dBMVVkRXdFQi93UUNNQUF3SHdZRFZSMGpCQmd3Rm9BVVdJSjJqVmdvc2NsREJBSzAxY2hlYWkvLytFb3dIUVlEVlIwbEJCWXdGQVlJS3dZQkJRVUhBd0lHQ0NzR0FRVUZCd01FTUIwR0ExVWREZ1FXQkJRYWNtK1VOc3ZmVUlPUHhxNFVWTjhjdFNWS0REQU9CZ05WSFE4QkFmOEVCQU1DQmVBd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFFOUsrVmVRbUdNUXc2eS9QL2NNRlArTXVadzlqenlsYXBwMktIT0JBU3hpK0VZdUZiclI2czZXM3RITVoyV0U2dEkzNVczVVZPbndlSkFmM1ZDRC9qa3o2S0M0UU9yWi85b2R2SjA3V0lydHY3L2piYXhHTzhJLzdpVlpoZU5ZYklNZEJ0RjFMeWdsSlBhNHhnaTFGL004a2d4bmNnTXRnZkhkczd4Z2hzSUVhY00zUlRSSmlwTlIyeDBaTllJcTZQYnlHWGRrYm5rWDYydExrcmR1U0xFemwxY1JkN1FzcU1XQTE3K0dka0l5NndvMG01b3dxN0xwUmZtV3JKSjNYYURyMEZNcTVsUWpjM2IrTnQ0N0hvdEljVTNGeGVPZGpjNTJMTUlBcC9HNk43dUlETVMrcy80NXBJS29uVEg1OUpSSzNORVpvTjN0NXZMZEJpNUxjYlk9PC9kczpYNTA5Q2VydGlmaWNhdGU+PC9kczpYNTA5RGF0YT48L2RzOktleUluZm8+PGRzOk9iamVjdCBJZD0iWGFkZXNPYmplY3RJZC03MDY1YmQ5Ni0yMDhiLTQ0MmYtYWVjYy1kOGVkODVmOGI3YTQiPjx4YWRlczpRdWFsaWZ5aW5nUHJvcGVydGllcyBJZD0iUXVhbGlmeWluZ1Byb3BlcnRpZXMtODU3Mjc2ZDAtYWQ4Yy00MDFkLWEyOTgtNmNlNmE2ODhkNDE0IiBUYXJnZXQ9IiNTaWduYXR1cmUtMGQ3YTZhMWYtNzM3Ny00MmU4LWJiNzktM2VmYmMwMjlkZGJlIiB4bWxuczp4YWRlcz0iaHR0cDovL3VyaS5ldHNpLm9yZy8wMTkwMy92MS4zLjIjIj48eGFkZXM6U2lnbmVkUHJvcGVydGllcyBJZD0iU2lnbmVkUHJvcGVydGllcy1TaWduYXR1cmUtMGQ3YTZhMWYtNzM3Ny00MmU4LWJiNzktM2VmYmMwMjlkZGJlIj48eGFkZXM6U2lnbmVkU2lnbmF0dXJlUHJvcGVydGllcz48eGFkZXM6U2lnbmluZ1RpbWU+MjAyNS0xMi0xNVQxNjoyODoxNFo8L3hhZGVzOlNpZ25pbmdUaW1lPjx4YWRlczpTaWduaW5nQ2VydGlmaWNhdGU+PHhhZGVzOkNlcnQ+PHhhZGVzOkNlcnREaWdlc3Q+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+d0JIb2tNeFFWY1BQS2RQWDNxUjc3aStuV2F3K1FBUG9qdDluczBJVzJGYz08L2RzOkRpZ2VzdFZhbHVlPjwveGFkZXM6Q2VydERpZ2VzdD48eGFkZXM6SXNzdWVyU2VyaWFsPjxkczpYNTA5SXNzdWVyTmFtZT5DTj1TdXBlcmludGVuZGVuY2lhIGRlIEFkbWluaXN0cmFjaW9uIFRyaWJ1dGFyaWE8L2RzOlg1MDlJc3N1ZXJOYW1lPjxkczpYNTA5U2VyaWFsTnVtYmVyPjIxMjM2ODc4MzU5MDY3NjYwMDM8L2RzOlg1MDlTZXJpYWxOdW1iZXI+PC94YWRlczpJc3N1ZXJTZXJpYWw+PC94YWRlczpDZXJ0PjwveGFkZXM6U2lnbmluZ0NlcnRpZmljYXRlPjwveGFkZXM6U2lnbmVkU2lnbmF0dXJlUHJvcGVydGllcz48eGFkZXM6U2lnbmVkRGF0YU9iamVjdFByb3BlcnRpZXM+PHhhZGVzOkRhdGFPYmplY3RGb3JtYXQgT2JqZWN0UmVmZXJlbmNlPSIjUmVmZXJlbmNlLWJjOTQ3NmQwLTliNWEtNGM3Ni1hYTM4LWM1MzI4MmZjZTgwMyI+PHhhZGVzOk1pbWVUeXBlPnRleHQveG1sPC94YWRlczpNaW1lVHlwZT48eGFkZXM6RW5jb2Rpbmc+VVRGLTg8L3hhZGVzOkVuY29kaW5nPjwveGFkZXM6RGF0YU9iamVjdEZvcm1hdD48L3hhZGVzOlNpZ25lZERhdGFPYmplY3RQcm9wZXJ0aWVzPjwveGFkZXM6U2lnbmVkUHJvcGVydGllcz48L3hhZGVzOlF1YWxpZnlpbmdQcm9wZXJ0aWVzPjwvZHM6T2JqZWN0PjwvZHM6U2lnbmF0dXJlPjxkczpTaWduYXR1cmUgSWQ9IlNpZ25hdHVyZS1jOWZjYmJjMS0wOGI2LTRlOTEtYmRlYy02NmQ5ZjI2NzI2ZjMiIHhtbG5zOmRzPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjIj48ZHM6U2lnbmVkSW5mbz48ZHM6Q2Fub25pY2FsaXphdGlvbk1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnL1RSLzIwMDEvUkVDLXhtbC1jMTRuLTIwMDEwMzE1IiAvPjxkczpTaWduYXR1cmVNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNyc2Etc2hhMjU2IiAvPjxkczpSZWZlcmVuY2UgSWQ9IlJlZmVyZW5jZS1jN2IwYmNkNy04M2FmLTRlZDctOTBmZi1iYjY1YzA5ZjFhYmUiIFVSST0iI0RhdG9zQ2VydGlmaWNhZG9zIj48ZHM6VHJhbnNmb3Jtcz48ZHM6VHJhbnNmb3JtIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvVFIvMjAwMS9SRUMteG1sLWMxNG4tMjAwMTAzMTUiIC8+PC9kczpUcmFuc2Zvcm1zPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPkc1WElPcndjYkMwYkt6MzdDR1drYzRSTDhvemxEQnNEd3hSS0x1V2swaW89PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48ZHM6UmVmZXJlbmNlIElkPSJSZWZlcmVuY2VLZXlJbmZvLVNpZ25hdHVyZS1jOWZjYmJjMS0wOGI2LTRlOTEtYmRlYy02NmQ5ZjI2NzI2ZjMiIFVSST0iI0tleUluZm9JZC1TaWduYXR1cmUtYzlmY2JiYzEtMDhiNi00ZTkxLWJkZWMtNjZkOWYyNjcyNmYzIj48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5rTkk5N3RRdlRFeDZmMnBTY2YwUzEyb2FZeXVNOVQ0TzNIRkJUQXpsT09RPTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PGRzOlJlZmVyZW5jZSBUeXBlPSJodHRwOi8vdXJpLmV0c2kub3JnLzAxOTAzI1NpZ25lZFByb3BlcnRpZXMiIFVSST0iI1NpZ25lZFByb3BlcnRpZXMtU2lnbmF0dXJlLWM5ZmNiYmMxLTA4YjYtNGU5MS1iZGVjLTY2ZDlmMjY3MjZmMyI+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+VGhYSCtoODZtLzdzNnI1Tm5CSnpKR3ZMOVk3blVsWXJWbG9pVlZSb2NGST08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjwvZHM6U2lnbmVkSW5mbz48ZHM6U2lnbmF0dXJlVmFsdWU+a1lLV3o2SXdPUmJoVU40aEhsSkkyZ2Z0RHQ2dnJUbTE3dlJUQnlXZXQ0SWxYeFBxZlhndVFTcEVKc3FxSkdWblRFUVdwczNNZnZNQWE1OXIva1IrQjVnOTlMdFRKYWlkdlN2S1h5dURMVE1pdjJ3RmgwamdNaStJWkVVMDJEZXloSGM0SHBrQytkN2Nna1NkYU16UGdWQUhwMldpeWZKSWxJREprN05nMmt3RnA1dVd2Mjg3akhyR2VzZnQwdUlHaysrME9QZSs5dG9VQktDN2loVWFTVEprbVE2RG4wdTRSUTZzWTVsTWl3SUhtQS8rb3BMQUV4L1cwZlJOa3g1UjJLL0I2Y1pVdDFVWkhmczVOT3lBNHdhR2xLSkVuaUJjY3EvdUpLdndHMThnT09mMTdHSFZ5Q3MrWHd0b0xnY2lhcGlxbDVCZDlyb3M2SWFqUEFCWWNRPT08L2RzOlNpZ25hdHVyZVZhbHVlPjxkczpLZXlJbmZvIElkPSJLZXlJbmZvSWQtU2lnbmF0dXJlLWM5ZmNiYmMxLTA4YjYtNGU5MS1iZGVjLTY2ZDlmMjY3MjZmMyI+PGRzOktleVZhbHVlPjxkczpSU0FLZXlWYWx1ZT48ZHM6TW9kdWx1cz4waithUWNqQS95Z0wvdkRNMFU0RHIwV2kvT0x1cHV4TXF6U3htVlJiTWJ0ZUUrci9TanNXRkl1QVBTMjl3VnZuZlBVNzVvN28vK1JZOUVhc3FmUk9pcjR2OUw0eGU3RElyQVYxK0lMSlQ5eVVETzNwYXk4Y3ZzSVZjeUV0QzZVNHR5MXlVOTBOeWdJMEdXQzNLYm96cXhlRjJ2Mi81S2EzMDNSOFNMa3UvMzlXaVVLK3hiUUtiMHRTb0l4N1JaOXdFNEV1VHdGNFROYVpSL3JyVlpGV01nOTVKT3cyZ2g1Z1h0TWQvV2ZBSE0zSnBMVUpBbVZmanhLbUsyY2tYNi8xWEw4SEE2WjRiUXNxSWNKQTcwNEV6cDkyRUVnbXV1eTBUaHNyY3Jsczh2TjVZVjExdDYzSUVYdVdGUks1Y21WTkhtU2FiaStETDBqQ2lOOWdaeEg1b3c9PTwvZHM6TW9kdWx1cz48ZHM6RXhwb25lbnQ+QVFBQjwvZHM6RXhwb25lbnQ+PC9kczpSU0FLZXlWYWx1ZT48L2RzOktleVZhbHVlPjxkczpYNTA5RGF0YT48ZHM6WDUwOUNlcnRpZmljYXRlPk1JSUowekNDQjd1Z0F3SUJBZ0lJYmduR0UyVkhlR293RFFZSktvWklodmNOQVFFTEJRQXdnY0F4RmpBVUJnTlZCR0VNRFZaQlZFZFVMVE0xTVRVNUxUZ3hMVEFyQmdOVkJBTU1KRU5oYldGeVlTQmtaU0JEYjIxbGNtTnBieUJrWlNCSGRXRjBaVzFoYkdFZ1EwRWdNVEVzTUNvR0ExVUVDd3dqVUZORExVTmhiV0Z5WVNCa1pTQkRiMjFsY21OcGJ5QmtaU0JIZFdGMFpXMWhiR0V4S0RBbUJnTlZCQW9NSDBOaGJXRnlZU0JrWlNCRGIyMWxjbU5wYnlCa1pTQkhkV0YwWlcxaGJHRXhFakFRQmdOVkJBY01DVWQxWVhSbGJXRnNZVEVMTUFrR0ExVUVCaE1DUjFRd0hoY05NalF3TXpBNE1qSTBNekF3V2hjTk1qWXdNekE0TWpJME16QXdXakNCenpFNk1EZ0dBMVVFQ1F3eE5DQkJkbVZ1YVdSaElERTFMVGN3SUZwdmJtRWdNVEFnUldScFptbGphVzhnVUdGc1lXUnBkVzBnVEc5allXd2dNekVoTUI4R0ExVUVBd3dZUkdsbmFXWmhZM1FnVTJWeWRtbGphVzl6TENCVExrRXVNUkV3RHdZRFZRUUZFd2czTnpRMU5EZ3lNREVoTUI4R0ExVUVDZ3dZUkdsbmFXWmhZM1FnVTJWeWRtbGphVzl6TENCVExrRXVNUkl3RUFZRFZRUUhEQWxIZFdGMFpXMWhiR0V4Q3pBSkJnTlZCQVlUQWtkVU1SY3dGUVlEVlFSaERBNVdRVlJIVkMwM056UTFORGd5TURDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTkkvbWtISXdQOG9DLzd3ek5GT0E2OUZvdnppN3Fic1RLczBzWmxVV3pHN1hoUHEvMG83RmhTTGdEMHR2Y0ZiNTN6MU8rYU82UC9rV1BSR3JLbjBUb3ErTC9TK01YdXd5S3dGZGZpQ3lVL2NsQXp0NldzdkhMN0NGWE1oTFF1bE9MY3RjbFBkRGNvQ05CbGd0eW02TTZzWGhkcjl2K1NtdDlOMGZFaTVMdjkvVm9sQ3ZzVzBDbTlMVXFDTWUwV2ZjQk9CTGs4QmVFeldtVWY2NjFXUlZqSVBlU1RzTm9JZVlGN1RIZjFud0J6TnlhUzFDUUpsWDQ4U3BpdG5KRit2OVZ5L0J3T21lRzBMS2lIQ1FPOU9CTTZmZGhCSUpycnN0RTRiSzNLNWJQTHplV0ZkZGJldHlCRjdsaFVTdVhKbFRSNWttbTR2Z3k5SXdvamZZR2NSK2FNQ0F3RUFBYU9DQkw0d2dnUzZNSUhMQmdnckJnRUZCUWNCQVFTQnZqQ0J1ekJKQmdnckJnRUZCUWN3QW9ZOWFIUjBjRG92TDNkM2R5NW1hWEp0WVMxbExtTnZiUzVuZEM5alpYSjBhV1pwWTJGa2IzTXZZV05mYzNWaWIzSmthVzVoWkdGZlkyTm5MbU5sY2pBMkJnZ3JCZ0VGQlFjd0FZWXFhSFIwY0RvdkwyOWpjM0F4TG5WaGJtRjBZV05oTG1OdmJTOXdkV0pzYVdNdmNHdHBMMjlqYzNBdk1EWUdDQ3NHQVFVRkJ6QUJoaXBvZEhSd09pOHZiMk56Y0RJdWRXRnVZWFJoWTJFdVkyOXRMM0IxWW14cFl5OXdhMmt2YjJOemNDOHdIUVlEVlIwT0JCWUVGQjhXSi9rdzhTNmZickpOUHZ0bnZsdmhqcktVTUF3R0ExVWRFd0VCL3dRQ01BQXdId1lEVlIwakJCZ3dGb0FVQnpJU1dqc3ZFa2FEVmpHdGh1WFRRaFl0d0pzd0ZnWURWUjBTQkE4d0RZRUxhVzVtYjBCalkyY3VaM1F3Z2dLc0JnTlZIU0FFZ2dLak1JSUNuekNDQXBFR0Npc0dBUVFCZ2JWakFRWXdnZ0tCTUNzR0NDc0dBUVVGQndJQkZoOW9kSFJ3Y3pvdkwyWnBjbTFoTFdVdVkyOXRMbWQwTDJwMWNtbGthV052TUlJQlJnWUlLd1lCQlFVSEFnSXdnZ0U0SG9JQk5BQkRBR1VBY2dCMEFHa0FaZ0JwQUdNQVlRQmtBRzhBSUFCRUFHa0Fad0JwQUhRQVlRQnNBQ0FBWkFCbEFDQUFVQUJsQUhJQWN3QnZBRzRBWVFBZ0FFb0FkUUJ5QU8wQVpBQnBBR01BWVFBZ0FHVUFiUUJwQUhRQWFRQmtBRzhBSUFCd0FHOEFjZ0FnQUVNQTRRQnRBR0VBY2dCaEFDQUFaQUJsQUNBQVF3QnZBRzBBWlFCeUFHTUFhUUJ2QUNBQVpBQmxBQ0FBUndCMUFHRUFkQUJsQUcwQVlRQnNBR0VBTEFBZ0FFNEFTUUJVQUNBQU13QTFBREVBTlFBNUFDMEFPQUFzQUNBQWFRQnVBR1lBYndCQUFHTUFZd0JuQUM0QVp3QjBBQ3dBSUFCMUFHSUFhUUJqQUdFQVpBQnZBQ0FBWlFCdUFDQUFNUUF3QUNBQVF3QmhBR3dBYkFCbEFDQUFNd0F0QURnQU1BQWdBRm9BYndCdUFHRUFJQUF4QUN3QUlBQkhBSFVBWVFCMEFHVUFiUUJoQUd3QVlRQXVNSUlCQmdZSUt3WUJCUVVIQWdJd2dma2VnZllBUVFCMUFIUUFid0J5QUdrQWVnQmhBR1FBYndBZ0FITUFaUUJuQVBvQWJnQWdBSElBWlFCekFHOEFiQUIxQUdNQWFRRHpBRzRBSUFCa0FHVUFJQUF5QURNQUxnQXdBREVBTGdBeUFEQUFNUUF5QUN3QUlBQk9BRzhBTGdBZ0FGQUFVd0JEQUMwQU1BQXhBQzBBTWdBd0FERUFNZ0FnQUdRQVpRQnNBQ0FBVWdCUUFGTUFRd0FnQUdRQVpRQnNBQ0FBVFFCcEFHNEFhUUJ6QUhRQVpRQnlBR2tBYndBZ0FHUUFaUUFnQUVVQVl3QnZBRzRBYndCdEFPMEFZUUFnQUdRQVpRQWdBR3dBWVFBZ0FGSUFaUUJ3QVBvQVlnQnNBR2tBWXdCaEFDQUFaQUJsQUNBQVJ3QjFBR0VBZEFCbEFHMEFZUUJzQUdFd0NBWUdCQUNQZWdFQ01Ia0dBMVVkSHdSeU1IQXdOcUEwb0RLR01HaDBkSEE2THk5amNtd3hMblZoYm1GMFlXTmhMbU52YlM5d2RXSnNhV012Y0d0cEwyTnliQzlEUTBkVUxtTnliREEyb0RTZ01vWXdhSFIwY0RvdkwyTnliREl1ZFdGdVlYUmhZMkV1WTI5dEwzQjFZbXhwWXk5d2Eya3ZZM0pzTDBORFIxUXVZM0pzTUE0R0ExVWREd0VCL3dRRUF3SUY0REFkQmdOVkhTVUVGakFVQmdnckJnRUZCUWNEQWdZSUt3WUJCUVVIQXdRd0tnWURWUjBSQkNNd0lZRWZibVZ6ZEc5eUxtSmhiR3hsYzNSbGNtOXpRR1JwWjJsbVlXTjBMbU52YlRBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQWdFQUdZWnpocmpQUzFiNnY2eVNaQnRSaFdsODFENmZobklZN2dNcnR6cmZtUVRkSUZiSFFmMkpCVWdjalBETzhoNWlJbUJadmxDMjNEOS9qcy9tRk43SlNwbXFudXhwWHNvR1pYV3pMNXR5ZjdtRENZd3MrMGlmeWJkMXZMcVNQeXJaL0RsVkpFaWVMV05hQVJWcEdXMkQrdTJwbFVUNDRTZFJRVXNGajJhdHpRUnk4eXdRWWlCcit6MU5OU2g0NWlSRjRleXJKZVZQQ2kyU29UOS94bXlJOVp0L1B3eEZYc2V4UDBLWG1VQjNoenJGK1dPa3ZwbVhmUHk3bnhoUCthWWVQWHNqN3ExbWM5cjhNQVZlakhuRXJVNi9Vb3p0VUN6VkRYOWZiTmpkaFZVWHppWnBwNXNLMEFFd1ZYd2xqT2s2c1UzblZJeXc0dkdmNVBEamFLK0V6K3hkOG9MYnc2R2dJdU1sSEo2SHNYSExlMDFXd2dEMTF5VGYwdHdyUy9WRDdmaDkyVXVhL0JkSWxidXQvcUlFWlNUQlpnZVgwRUFnTytCRWNsQU5lZFFzbTFQTGk2bGprQVFOc2lDSFYwWWkvMXh3U1lrUzhQTlk2Z3ZpZFR6T0F0WUdPLzFCOE95eTVsRzUzZElFSVIxTFpydEFYd3VERS94REtmdGJLZC8yRGtoV25sYnpMUkhLTjZsaEV3MEl5QSs4Vlk0Z3ZoRkkwQ1ZSSUZBa2FqU3BnaGtleFowd0xmNlRsYXFid2lSOHJlZ21waEhLVGxKWHVSb3Q4WjZIQ2pmNnpGSGVJRUFIOGFEWHdWZ0ZnTG1pT2hqZGUrdHRXRE0vVFVFdTdGbGt1U2JWSG5rNDRBOEVsbDhmeXhJYkNncGw2Vnk2bVpZajVxUnZNd0JQSXBBPTwvZHM6WDUwOUNlcnRpZmljYXRlPjwvZHM6WDUwOURhdGE+PC9kczpLZXlJbmZvPjxkczpPYmplY3QgSWQ9IlhhZGVzT2JqZWN0SWQtMDdlNWFlYWQtODE1OC00MzI1LWFkMmItZThlN2Q2Y2I5MTM4Ij48eGFkZXM6UXVhbGlmeWluZ1Byb3BlcnRpZXMgSWQ9IlF1YWxpZnlpbmdQcm9wZXJ0aWVzLTRkYzNkMWVkLThjNjEtNGFmYi1hNDQyLTM4MjU5Yjc2MzIwZSIgVGFyZ2V0PSIjU2lnbmF0dXJlLWM5ZmNiYmMxLTA4YjYtNGU5MS1iZGVjLTY2ZDlmMjY3MjZmMyIgeG1sbnM6eGFkZXM9Imh0dHA6Ly91cmkuZXRzaS5vcmcvMDE5MDMvdjEuMy4yIyI+PHhhZGVzOlNpZ25lZFByb3BlcnRpZXMgSWQ9IlNpZ25lZFByb3BlcnRpZXMtU2lnbmF0dXJlLWM5ZmNiYmMxLTA4YjYtNGU5MS1iZGVjLTY2ZDlmMjY3MjZmMyI+PHhhZGVzOlNpZ25lZFNpZ25hdHVyZVByb3BlcnRpZXM+PHhhZGVzOlNpZ25pbmdUaW1lPjIwMjUtMTItMTVUMTY6Mjg6MTRaPC94YWRlczpTaWduaW5nVGltZT48eGFkZXM6U2lnbmluZ0NlcnRpZmljYXRlPjx4YWRlczpDZXJ0Pjx4YWRlczpDZXJ0RGlnZXN0PjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPjlmaXNiT2tBSXpFNWhlV2VZV3F2d2U2dTJDY1JVK3YvbUp2WWJWTzd2cWs9PC9kczpEaWdlc3RWYWx1ZT48L3hhZGVzOkNlcnREaWdlc3Q+PHhhZGVzOklzc3VlclNlcmlhbD48ZHM6WDUwOUlzc3Vlck5hbWU+Qz1HVCwgTD1HdWF0ZW1hbGEsIE89Q2FtYXJhIGRlIENvbWVyY2lvIGRlIEd1YXRlbWFsYSwgT1U9UFNDLUNhbWFyYSBkZSBDb21lcmNpbyBkZSBHdWF0ZW1hbGEsIENOPUNhbWFyYSBkZSBDb21lcmNpbyBkZSBHdWF0ZW1hbGEgQ0EgMSwgT0lELjIuNS40Ljk3PVZBVEdULTM1MTU5LTg8L2RzOlg1MDlJc3N1ZXJOYW1lPjxkczpYNTA5U2VyaWFsTnVtYmVyPjc5MjkwODY0MDU1NjgzMjk4MzQ8L2RzOlg1MDlTZXJpYWxOdW1iZXI+PC94YWRlczpJc3N1ZXJTZXJpYWw+PC94YWRlczpDZXJ0PjwveGFkZXM6U2lnbmluZ0NlcnRpZmljYXRlPjwveGFkZXM6U2lnbmVkU2lnbmF0dXJlUHJvcGVydGllcz48eGFkZXM6U2lnbmVkRGF0YU9iamVjdFByb3BlcnRpZXM+PHhhZGVzOkRhdGFPYmplY3RGb3JtYXQgT2JqZWN0UmVmZXJlbmNlPSIjUmVmZXJlbmNlLWM3YjBiY2Q3LTgzYWYtNGVkNy05MGZmLWJiNjVjMDlmMWFiZSI+PHhhZGVzOk1pbWVUeXBlPnRleHQveG1sPC94YWRlczpNaW1lVHlwZT48eGFkZXM6RW5jb2Rpbmc+VVRGLTg8L3hhZGVzOkVuY29kaW5nPjwveGFkZXM6RGF0YU9iamVjdEZvcm1hdD48L3hhZGVzOlNpZ25lZERhdGFPYmplY3RQcm9wZXJ0aWVzPjwveGFkZXM6U2lnbmVkUHJvcGVydGllcz48L3hhZGVzOlF1YWxpZnlpbmdQcm9wZXJ0aWVzPjwvZHM6T2JqZWN0PjwvZHM6U2lnbmF0dXJlPjwvZHRlOkdURG9jdW1lbnRvPg==', 'FACT');
INSERT INTO `ventas` (`id`, `sucursal_id`, `fecha_hora`, `impuesto`, `numero_comprobante`, `serie`, `total`, `estado`, `cliente_id`, `user_id`, `comprobante_id`, `created_at`, `updated_at`, `numero_autorizacion_fel`, `fecha_certificacion_fel`, `xml_fel`, `tipo_factura`) VALUES
(7, 1, '2025-12-15 18:36:47', 7.20, '307906142', 'E42FE80F', 60.00, 0, 1, 5, 1, '2025-12-15 18:36:47', '2025-12-15 18:38:42', 'E42FE80F-125A-465E-B07F-570839699A04', '2025-12-15 18:37:08', 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48ZHRlOkdURG9jdW1lbnRvIFZlcnNpb249IjAuMSIgeG1sbnM6ZHRlPSJodHRwOi8vd3d3LnNhdC5nb2IuZ3QvZHRlL2ZlbC8wLjIuMCIgeG1sbnM6eHNpPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxL1hNTFNjaGVtYS1pbnN0YW5jZSI+PGR0ZTpTQVQgQ2xhc2VEb2N1bWVudG89ImR0ZSI+PGR0ZTpEVEUgSUQ9IkRhdG9zQ2VydGlmaWNhZG9zIj48ZHRlOkRhdG9zRW1pc2lvbiBJRD0iRGF0b3NFbWlzaW9uIj48ZHRlOkRhdG9zR2VuZXJhbGVzIFRpcG89IkZBQ1QiIEZlY2hhSG9yYUVtaXNpb249IjIwMjUtMTItMTVUMTg6MzY6NDciIENvZGlnb01vbmVkYT0iR1RRIiAvPjxkdGU6RW1pc29yIE5JVEVtaXNvcj0iMjgyMDExNzUiIE5vbWJyZUVtaXNvcj0iTUFSQ09TLCBaRVRJTk8gUkFMRVMiIENvZGlnb0VzdGFibGVjaW1pZW50bz0iMSIgTm9tYnJlQ29tZXJjaWFsPSJIT1RFTCBaRVRJTk8iIEFmaWxpYWNpb25JVkE9IkdFTiI+PGR0ZTpEaXJlY2Npb25FbWlzb3I+PGR0ZTpEaXJlY2Npb24+Q2l1ZGFkPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25FbWlzb3I+PC9kdGU6RW1pc29yPjxkdGU6UmVjZXB0b3IgTm9tYnJlUmVjZXB0b3I9IkNvbnN1bWlkb3IgRmluYWwiIElEUmVjZXB0b3I9IkNGIj48ZHRlOkRpcmVjY2lvblJlY2VwdG9yPjxkdGU6RGlyZWNjaW9uPkNGPC9kdGU6RGlyZWNjaW9uPjxkdGU6Q29kaWdvUG9zdGFsPjAxMDAxPC9kdGU6Q29kaWdvUG9zdGFsPjxkdGU6TXVuaWNpcGlvPkd1YXRlbWFsYTwvZHRlOk11bmljaXBpbz48ZHRlOkRlcGFydGFtZW50bz5HdWF0ZW1hbGE8L2R0ZTpEZXBhcnRhbWVudG8+PGR0ZTpQYWlzPkdUPC9kdGU6UGFpcz48L2R0ZTpEaXJlY2Npb25SZWNlcHRvcj48L2R0ZTpSZWNlcHRvcj48ZHRlOkZyYXNlcz48ZHRlOkZyYXNlIFRpcG9GcmFzZT0iMSIgQ29kaWdvRXNjZW5hcmlvPSIxIiAvPjwvZHRlOkZyYXNlcz48ZHRlOkl0ZW1zPjxkdGU6SXRlbSBOdW1lcm9MaW5lYT0iMSIgQmllbk9TZXJ2aWNpbz0iQiI+PGR0ZTpDYW50aWRhZD4xLjAwMDA8L2R0ZTpDYW50aWRhZD48ZHRlOlVuaWRhZE1lZGlkYT5MVFI8L2R0ZTpVbmlkYWRNZWRpZGE+PGR0ZTpEZXNjcmlwY2lvbj5BY2VpdGUgQ2FzdHJvbCBDUkIgVHVyYm9tYXggMTVXLTQwPC9kdGU6RGVzY3JpcGNpb24+PGR0ZTpQcmVjaW9Vbml0YXJpbz42MC4wMDAwPC9kdGU6UHJlY2lvVW5pdGFyaW8+PGR0ZTpQcmVjaW8+NjAuMDAwMDwvZHRlOlByZWNpbz48ZHRlOkRlc2N1ZW50bz4wPC9kdGU6RGVzY3VlbnRvPjxkdGU6SW1wdWVzdG9zPjxkdGU6SW1wdWVzdG8+PGR0ZTpOb21icmVDb3J0bz5JVkE8L2R0ZTpOb21icmVDb3J0bz48ZHRlOkNvZGlnb1VuaWRhZEdyYXZhYmxlPjE8L2R0ZTpDb2RpZ29VbmlkYWRHcmF2YWJsZT48ZHRlOk1vbnRvR3JhdmFibGU+NTMuNTcxNDwvZHRlOk1vbnRvR3JhdmFibGU+PGR0ZTpNb250b0ltcHVlc3RvPjYuNDI4NjwvZHRlOk1vbnRvSW1wdWVzdG8+PC9kdGU6SW1wdWVzdG8+PC9kdGU6SW1wdWVzdG9zPjxkdGU6VG90YWw+NjAuMDAwMDwvZHRlOlRvdGFsPjwvZHRlOkl0ZW0+PC9kdGU6SXRlbXM+PGR0ZTpUb3RhbGVzPjxkdGU6VG90YWxJbXB1ZXN0b3M+PGR0ZTpUb3RhbEltcHVlc3RvIE5vbWJyZUNvcnRvPSJJVkEiIFRvdGFsTW9udG9JbXB1ZXN0bz0iNi40Mjg2IiAvPjwvZHRlOlRvdGFsSW1wdWVzdG9zPjxkdGU6R3JhblRvdGFsPjYwLjAwMDA8L2R0ZTpHcmFuVG90YWw+PC9kdGU6VG90YWxlcz48L2R0ZTpEYXRvc0VtaXNpb24+PGR0ZTpDZXJ0aWZpY2FjaW9uPjxkdGU6TklUQ2VydGlmaWNhZG9yPjc3NDU0ODIwPC9kdGU6TklUQ2VydGlmaWNhZG9yPjxkdGU6Tm9tYnJlQ2VydGlmaWNhZG9yPkRJR0lGQUNUIFNFUlZJQ0lPUywgU09DSUVEQUQgQU5PTklNQTwvZHRlOk5vbWJyZUNlcnRpZmljYWRvcj48ZHRlOk51bWVyb0F1dG9yaXphY2lvbiBTZXJpZT0iRTQyRkU4MEYiIE51bWVybz0iMzA3OTA2MTQyIj5FNDJGRTgwRi0xMjVBLTQ2NUUtQjA3Ri01NzA4Mzk2OTlBMDQ8L2R0ZTpOdW1lcm9BdXRvcml6YWNpb24+PGR0ZTpGZWNoYUhvcmFDZXJ0aWZpY2FjaW9uPjIwMjUtMTItMTVUMTg6Mzc6MDc8L2R0ZTpGZWNoYUhvcmFDZXJ0aWZpY2FjaW9uPjwvZHRlOkNlcnRpZmljYWNpb24+PC9kdGU6RFRFPjwvZHRlOlNBVD48ZHM6U2lnbmF0dXJlIElkPSJTaWduYXR1cmUtYTgxZjgxMTQtNjg3Zi00YjNmLTg1NDktOGFkZTEwOWE3YmE3IiB4bWxuczpkcz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PGRzOlNpZ25lZEluZm8+PGRzOkNhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy14bWwtYzE0bi0yMDAxMDMxNSIgLz48ZHM6U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxkc2lnLW1vcmUjcnNhLXNoYTI1NiIgLz48ZHM6UmVmZXJlbmNlIElkPSJSZWZlcmVuY2UtYmM1NmY1NDItNTJmNS00MjA0LWE5NWUtNDU3MDk1NDM3OGI5IiBVUkk9IiNEYXRvc0VtaXNpb24iPjxkczpUcmFuc2Zvcm1zPjxkczpUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy14bWwtYzE0bi0yMDAxMDMxNSIgLz48L2RzOlRyYW5zZm9ybXM+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+RkRnNHU0MU5BK2Nqc2hBZ3ZyQzFVV3VLYi94bUM5UzNUbmJmTERqL2xaWT08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjxkczpSZWZlcmVuY2UgSWQ9IlJlZmVyZW5jZUtleUluZm8tU2lnbmF0dXJlLWE4MWY4MTE0LTY4N2YtNGIzZi04NTQ5LThhZGUxMDlhN2JhNyIgVVJJPSIjS2V5SW5mb0lkLVNpZ25hdHVyZS1hODFmODExNC02ODdmLTRiM2YtODU0OS04YWRlMTA5YTdiYTciPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPkhNOGZ5MnhYY0dnUjZsMzhONm9CR2FEQ2kzVmRjTUFJdVFabGNTTkZYckk9PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48ZHM6UmVmZXJlbmNlIFR5cGU9Imh0dHA6Ly91cmkuZXRzaS5vcmcvMDE5MDMjU2lnbmVkUHJvcGVydGllcyIgVVJJPSIjU2lnbmVkUHJvcGVydGllcy1TaWduYXR1cmUtYTgxZjgxMTQtNjg3Zi00YjNmLTg1NDktOGFkZTEwOWE3YmE3Ij48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5OK3g1N1pCMmFEdVFMS0pEV1ZxY0lmZVc1UTFWd2RTTk96cVFpZmhHcTlrPTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PC9kczpTaWduZWRJbmZvPjxkczpTaWduYXR1cmVWYWx1ZT5NUkUxTTZpZmRreTZWbkpnYWVCb2tJa3JqSWtSSTFJcVcxeTdhWTNBalcvMkFrR3VIZTc4REVTdHg4QzR0eXBCN2ZqcGp3aC84SFZndHdVVnl2aTlyWjl4ZVlwa0NsdldZUUllRVlna2NQT0V4MXNVM2F2eDd2aFVRdnBPQjJmQ0ZHdWdveWFNWkNmN1ZybWx2UGl1Tzh1cVV1YndBNm0yUjlUcEkwMDlsKytwMXJZSk84MmlzeVVNMVFWazZvYVBNSFhvL1dabW5hZlQzK09jMnU4WXVwbkcrOEY5OUpLM1A1bStReWFxZTNuSmU4Y0FzS2FueWtaWEU2MzNOMUFMRWJqZ2JnTVNLL01QRFBnWjNwQUtCUldmblJwcUlHS1NxTFZKN1pTRnQ2SDdhUVd4QVFLWjdiZWYvdUR1Zm1SbVJxeHhBTWtBMlR3NVArUzJQYXRzS0E9PTwvZHM6U2lnbmF0dXJlVmFsdWU+PGRzOktleUluZm8gSWQ9IktleUluZm9JZC1TaWduYXR1cmUtYTgxZjgxMTQtNjg3Zi00YjNmLTg1NDktOGFkZTEwOWE3YmE3Ij48ZHM6S2V5VmFsdWU+PGRzOlJTQUtleVZhbHVlPjxkczpNb2R1bHVzPngxZFVKK1JpSTZSRXgwVVdkUjQrbTRiMTF1dmlFN1BRVlpidlhmN29RcEJtcmZtTDVnSVIxZnc4SzkvM3pjSlJsUCtsNTFNODA2cHpmYmowKzdEajlqeURyWHE4NW9DOWtUQm5zTXB0OWphZFNpL3Fmc1J4MkVORGF1Yk4vWTgxNmtKa1M5bUhTUTV2WG15Zi9ySWk3QzFVb2QwREx2NVlkdWlpN0tLT2pCQ2k0M2ROSzlWKzlKTk0rc1F3eldQd2VtdXJ5K05nS2hHVWNJNDI4YlJRRDR2T0N6c25qbTZVa0NWcEJ0T3BFNllGaHVxOGNBK3E1T1FZaEpFWkEvdWIvb3ArbWlHYk4vQ2FCSjA2T2N5MW1ibVZNcW11MW92UzE2aGMwNDdmMzZmYVlwYnh5WDdYRUZnL2xjeG1RQ0Z2aXFSUnFkMWFOa1c5SENyMGFPclQxdz09PC9kczpNb2R1bHVzPjxkczpFeHBvbmVudD5BUUFCPC9kczpFeHBvbmVudD48L2RzOlJTQUtleVZhbHVlPjwvZHM6S2V5VmFsdWU+PGRzOlg1MDlEYXRhPjxkczpYNTA5Q2VydGlmaWNhdGU+TUlJRFlUQ0NBa21nQXdJQkFnSUlIWGphMWNFS2RMTXdEUVlKS29aSWh2Y05BUUVMQlFBd09ERTJNRFFHQTFVRUF3d3RVM1Z3WlhKcGJuUmxibVJsYm1OcFlTQmtaU0JCWkcxcGJtbHpkSEpoWTJsdmJpQlVjbWxpZFhSaGNtbGhNQjRYRFRJMU1URXlOVEV6TlRBek4xb1hEVEkzTVRFeU5URXpOVEF6TjFvd0tERVJNQThHQTFVRUF3d0lNamd5TURFeE56VXhFekFSQmdOVkJBb01Dbk5oZEM1bmIySXVaM1F3Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLQW9JQkFRREhWMVFuNUdJanBFVEhSUloxSGo2Ymh2WFc2K0lUczlCVmx1OWQvdWhDa0dhdCtZdm1BaEhWL0R3cjMvZk53bEdVLzZYblV6elRxbk45dVBUN3NPUDJQSU90ZXJ6bWdMMlJNR2V3eW0zMk5wMUtMK3AreEhIWVEwTnE1czM5anpYcVFtUkwyWWRKRG05ZWJKLytzaUxzTFZTaDNRTXUvbGgyNktMc29vNk1FS0xqZDAwcjFYNzBrMHo2eERETlkvQjZhNnZMNDJBcUVaUndqamJ4dEZBUGk4NExPeWVPYnBTUUpXa0cwNmtUcGdXRzZyeHdENnJrNUJpRWtSa0QrNXYraW42YUlaczM4Sm9FblRvNXpMV1p1WlV5cWE3V2k5TFhxRnpUanQvZnA5cGlsdkhKZnRjUVdEK1Z6R1pBSVcrS3BGR3AzVm8yUmIwY0t2Um82dFBYQWdNQkFBR2pmekI5TUF3R0ExVWRFd0VCL3dRQ01BQXdId1lEVlIwakJCZ3dGb0FVV0lKMmpWZ29zY2xEQkFLMDFjaGVhaS8vK0Vvd0hRWURWUjBsQkJZd0ZBWUlLd1lCQlFVSEF3SUdDQ3NHQVFVRkJ3TUVNQjBHQTFVZERnUVdCQlFhY20rVU5zdmZVSU9QeHE0VVZOOGN0U1ZLRERBT0JnTlZIUThCQWY4RUJBTUNCZUF3RFFZSktvWklodmNOQVFFTEJRQURnZ0VCQUU5SytWZVFtR01RdzZ5L1AvY01GUCtNdVp3OWp6eWxhcHAyS0hPQkFTeGkrRVl1RmJyUjZzNlczdEhNWjJXRTZ0STM1VzNVVk9ud2VKQWYzVkNEL2prejZLQzRRT3JaLzlvZHZKMDdXSXJ0djcvamJheEdPOEkvN2lWWmhlTlliSU1kQnRGMUx5Z2xKUGE0eGdpMUYvTThrZ3huY2dNdGdmSGRzN3hnaHNJRWFjTTNSVFJKaXBOUjJ4MFpOWUlxNlBieUdYZGtibmtYNjJ0TGtyZHVTTEV6bDFjUmQ3UXNxTVdBMTcrR2RrSXk2d28wbTVvd3E3THBSZm1XckpKM1hhRHIwRk1xNWxRamMzYitOdDQ3SG90SWNVM0Z4ZU9kamM1MkxNSUFwL0c2Tjd1SURNUytzLzQ1cElLb25USDU5SlJLM05FWm9OM3Q1dkxkQmk1TGNiWT08L2RzOlg1MDlDZXJ0aWZpY2F0ZT48L2RzOlg1MDlEYXRhPjwvZHM6S2V5SW5mbz48ZHM6T2JqZWN0IElkPSJYYWRlc09iamVjdElkLWUyYWZlMjVmLWQ0ZDYtNDYzNS1iODdjLWE5N2QyMTJiMTUyMCI+PHhhZGVzOlF1YWxpZnlpbmdQcm9wZXJ0aWVzIElkPSJRdWFsaWZ5aW5nUHJvcGVydGllcy1mYjMyY2M2Zi04OGJiLTRmYTctOTljOS04Njc2OTY4ZTdlZTciIFRhcmdldD0iI1NpZ25hdHVyZS1hODFmODExNC02ODdmLTRiM2YtODU0OS04YWRlMTA5YTdiYTciIHhtbG5zOnhhZGVzPSJodHRwOi8vdXJpLmV0c2kub3JnLzAxOTAzL3YxLjMuMiMiPjx4YWRlczpTaWduZWRQcm9wZXJ0aWVzIElkPSJTaWduZWRQcm9wZXJ0aWVzLVNpZ25hdHVyZS1hODFmODExNC02ODdmLTRiM2YtODU0OS04YWRlMTA5YTdiYTciPjx4YWRlczpTaWduZWRTaWduYXR1cmVQcm9wZXJ0aWVzPjx4YWRlczpTaWduaW5nVGltZT4yMDI1LTEyLTE2VDAwOjM3OjA4WjwveGFkZXM6U2lnbmluZ1RpbWU+PHhhZGVzOlNpZ25pbmdDZXJ0aWZpY2F0ZT48eGFkZXM6Q2VydD48eGFkZXM6Q2VydERpZ2VzdD48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT53Qkhva014UVZjUFBLZFBYM3FSNzdpK25XYXcrUUFQb2p0OW5zMElXMkZjPTwvZHM6RGlnZXN0VmFsdWU+PC94YWRlczpDZXJ0RGlnZXN0Pjx4YWRlczpJc3N1ZXJTZXJpYWw+PGRzOlg1MDlJc3N1ZXJOYW1lPkNOPVN1cGVyaW50ZW5kZW5jaWEgZGUgQWRtaW5pc3RyYWNpb24gVHJpYnV0YXJpYTwvZHM6WDUwOUlzc3Vlck5hbWU+PGRzOlg1MDlTZXJpYWxOdW1iZXI+MjEyMzY4NzgzNTkwNjc2NjAwMzwvZHM6WDUwOVNlcmlhbE51bWJlcj48L3hhZGVzOklzc3VlclNlcmlhbD48L3hhZGVzOkNlcnQ+PC94YWRlczpTaWduaW5nQ2VydGlmaWNhdGU+PC94YWRlczpTaWduZWRTaWduYXR1cmVQcm9wZXJ0aWVzPjx4YWRlczpTaWduZWREYXRhT2JqZWN0UHJvcGVydGllcz48eGFkZXM6RGF0YU9iamVjdEZvcm1hdCBPYmplY3RSZWZlcmVuY2U9IiNSZWZlcmVuY2UtYmM1NmY1NDItNTJmNS00MjA0LWE5NWUtNDU3MDk1NDM3OGI5Ij48eGFkZXM6TWltZVR5cGU+dGV4dC94bWw8L3hhZGVzOk1pbWVUeXBlPjx4YWRlczpFbmNvZGluZz5VVEYtODwveGFkZXM6RW5jb2Rpbmc+PC94YWRlczpEYXRhT2JqZWN0Rm9ybWF0PjwveGFkZXM6U2lnbmVkRGF0YU9iamVjdFByb3BlcnRpZXM+PC94YWRlczpTaWduZWRQcm9wZXJ0aWVzPjwveGFkZXM6UXVhbGlmeWluZ1Byb3BlcnRpZXM+PC9kczpPYmplY3Q+PC9kczpTaWduYXR1cmU+PGRzOlNpZ25hdHVyZSBJZD0iU2lnbmF0dXJlLWUzMTJjOWY4LWVlM2YtNDg3YS1iMmE0LTAzMmQxOTU1ODhkYiIgeG1sbnM6ZHM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvMDkveG1sZHNpZyMiPjxkczpTaWduZWRJbmZvPjxkczpDYW5vbmljYWxpemF0aW9uTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvVFIvMjAwMS9SRUMteG1sLWMxNG4tMjAwMTAzMTUiIC8+PGRzOlNpZ25hdHVyZU1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZHNpZy1tb3JlI3JzYS1zaGEyNTYiIC8+PGRzOlJlZmVyZW5jZSBJZD0iUmVmZXJlbmNlLTRlZGNiZTMzLTY3Y2ItNGVhZS1hOWIxLWNiODIyNmNkYTg5ZCIgVVJJPSIjRGF0b3NDZXJ0aWZpY2Fkb3MiPjxkczpUcmFuc2Zvcm1zPjxkczpUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy14bWwtYzE0bi0yMDAxMDMxNSIgLz48L2RzOlRyYW5zZm9ybXM+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+Vm5CR3huVFE3TWpyOVVQZkFORWpPRlBZZmVjdXZpcGhCN2FPbWU5RzEvTT08L2RzOkRpZ2VzdFZhbHVlPjwvZHM6UmVmZXJlbmNlPjxkczpSZWZlcmVuY2UgSWQ9IlJlZmVyZW5jZUtleUluZm8tU2lnbmF0dXJlLWUzMTJjOWY4LWVlM2YtNDg3YS1iMmE0LTAzMmQxOTU1ODhkYiIgVVJJPSIjS2V5SW5mb0lkLVNpZ25hdHVyZS1lMzEyYzlmOC1lZTNmLTQ4N2EtYjJhNC0wMzJkMTk1NTg4ZGIiPjxkczpEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGVuYyNzaGEyNTYiIC8+PGRzOkRpZ2VzdFZhbHVlPnFrakVxL3Nwc2JCOXNkWDdEVitreWYzblVCdEFHSnQ2azFNTWs1SFpNT1U9PC9kczpEaWdlc3RWYWx1ZT48L2RzOlJlZmVyZW5jZT48ZHM6UmVmZXJlbmNlIFR5cGU9Imh0dHA6Ly91cmkuZXRzaS5vcmcvMDE5MDMjU2lnbmVkUHJvcGVydGllcyIgVVJJPSIjU2lnbmVkUHJvcGVydGllcy1TaWduYXR1cmUtZTMxMmM5ZjgtZWUzZi00ODdhLWIyYTQtMDMyZDE5NTU4OGRiIj48ZHM6RGlnZXN0TWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS8wNC94bWxlbmMjc2hhMjU2IiAvPjxkczpEaWdlc3RWYWx1ZT5xZDBRNVIxM2tYcW94SzUxOVFQLzdweEJJbUJCa0ZSRFV2d0FDeTlBeVJZPTwvZHM6RGlnZXN0VmFsdWU+PC9kczpSZWZlcmVuY2U+PC9kczpTaWduZWRJbmZvPjxkczpTaWduYXR1cmVWYWx1ZT5VdmpkcFpRRU5TTnNSQittN0JSTWJiVU44NjRpNi93QVNrS1I1bnpsMVZ0ejAvNENWRzZzaGNUcWo5Z0JRL0tvYjBEbnFWWTg5OThydkVPa0libUpNSjB3RmMyc3ZHazJDYk1YMDJBWjhSMmU1TFY0Qi9ONnZra0RZeCs3QllkNTBDVEhCcjF5M1dBaTdMbFhKeC9Qd3A3TnFpU2QxYkVVME4wUVRQVGF5UmFJOThHNTRQbVVQRHpSeDZmRmR4S1lIVEg3Z2FreDRBVTNEM2dUS0s1QVovMzZudnNHRTdVRmtDRmhmaVRkSk9Qd2kzMGx4dldWQXVGQk40MjJ3R3VqU0JqQm52a1BQUUNPbk1kQnQwYXVlc1ZnSWlpZldLNFZ6TWFFNjY3K21NdDNpT3J5MGhMR0tmNEI0TGJveUdwdVM3QTBtZWh0UnVld2FyN2tiNWtickE9PTwvZHM6U2lnbmF0dXJlVmFsdWU+PGRzOktleUluZm8gSWQ9IktleUluZm9JZC1TaWduYXR1cmUtZTMxMmM5ZjgtZWUzZi00ODdhLWIyYTQtMDMyZDE5NTU4OGRiIj48ZHM6S2V5VmFsdWU+PGRzOlJTQUtleVZhbHVlPjxkczpNb2R1bHVzPjBqK2FRY2pBL3lnTC92RE0wVTREcjBXaS9PTHVwdXhNcXpTeG1WUmJNYnRlRStyL1Nqc1dGSXVBUFMyOXdWdm5mUFU3NW83by8rUlk5RWFzcWZST2lyNHY5TDR4ZTdESXJBVjErSUxKVDl5VURPM3BheThjdnNJVmN5RXRDNlU0dHkxeVU5ME55Z0kwR1dDM0tib3pxeGVGMnYyLzVLYTMwM1I4U0xrdS8zOVdpVUsreGJRS2IwdFNvSXg3Ulo5d0U0RXVUd0Y0VE5hWlIvcnJWWkZXTWc5NUpPdzJnaDVnWHRNZC9XZkFITTNKcExVSkFtVmZqeEttSzJja1g2LzFYTDhIQTZaNGJRc3FJY0pBNzA0RXpwOTJFRWdtdXV5MFRoc3JjcmxzOHZONVlWMTF0NjNJRVh1V0ZSSzVjbVZOSG1TYWJpK0RMMGpDaU45Z1p4SDVvdz09PC9kczpNb2R1bHVzPjxkczpFeHBvbmVudD5BUUFCPC9kczpFeHBvbmVudD48L2RzOlJTQUtleVZhbHVlPjwvZHM6S2V5VmFsdWU+PGRzOlg1MDlEYXRhPjxkczpYNTA5Q2VydGlmaWNhdGU+TUlJSjB6Q0NCN3VnQXdJQkFnSUliZ25HRTJWSGVHb3dEUVlKS29aSWh2Y05BUUVMQlFBd2djQXhGakFVQmdOVkJHRU1EVlpCVkVkVUxUTTFNVFU1TFRneExUQXJCZ05WQkFNTUpFTmhiV0Z5WVNCa1pTQkRiMjFsY21OcGJ5QmtaU0JIZFdGMFpXMWhiR0VnUTBFZ01URXNNQ29HQTFVRUN3d2pVRk5ETFVOaGJXRnlZU0JrWlNCRGIyMWxjbU5wYnlCa1pTQkhkV0YwWlcxaGJHRXhLREFtQmdOVkJBb01IME5oYldGeVlTQmtaU0JEYjIxbGNtTnBieUJrWlNCSGRXRjBaVzFoYkdFeEVqQVFCZ05WQkFjTUNVZDFZWFJsYldGc1lURUxNQWtHQTFVRUJoTUNSMVF3SGhjTk1qUXdNekE0TWpJME16QXdXaGNOTWpZd016QTRNakkwTXpBd1dqQ0J6ekU2TURnR0ExVUVDUXd4TkNCQmRtVnVhV1JoSURFMUxUY3dJRnB2Ym1FZ01UQWdSV1JwWm1samFXOGdVR0ZzWVdScGRXMGdURzlqWVd3Z016RWhNQjhHQTFVRUF3d1lSR2xuYVdaaFkzUWdVMlZ5ZG1samFXOXpMQ0JUTGtFdU1SRXdEd1lEVlFRRkV3ZzNOelExTkRneU1ERWhNQjhHQTFVRUNnd1lSR2xuYVdaaFkzUWdVMlZ5ZG1samFXOXpMQ0JUTGtFdU1SSXdFQVlEVlFRSERBbEhkV0YwWlcxaGJHRXhDekFKQmdOVkJBWVRBa2RVTVJjd0ZRWURWUVJoREE1V1FWUkhWQzAzTnpRMU5EZ3lNRENDQVNJd0RRWUpLb1pJaHZjTkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFOSS9ta0hJd1A4b0MvN3d6TkZPQTY5Rm92emk3cWJzVEtzMHNabFVXekc3WGhQcS8wbzdGaFNMZ0QwdHZjRmI1M3oxTythTzZQL2tXUFJHcktuMFRvcStML1MrTVh1d3lLd0ZkZmlDeVUvY2xBenQ2V3N2SEw3Q0ZYTWhMUXVsT0xjdGNsUGREY29DTkJsZ3R5bTZNNnNYaGRyOXYrU210OU4wZkVpNUx2OS9Wb2xDdnNXMENtOUxVcUNNZTBXZmNCT0JMazhCZUV6V21VZjY2MVdSVmpJUGVTVHNOb0llWUY3VEhmMW53QnpOeWFTMUNRSmxYNDhTcGl0bkpGK3Y5VnkvQndPbWVHMExLaUhDUU85T0JNNmZkaEJJSnJyc3RFNGJLM0s1YlBMemVXRmRkYmV0eUJGN2xoVVN1WEpsVFI1a21tNHZneTlJd29qZllHY1IrYU1DQXdFQUFhT0NCTDR3Z2dTNk1JSExCZ2dyQmdFRkJRY0JBUVNCdmpDQnV6QkpCZ2dyQmdFRkJRY3dBb1k5YUhSMGNEb3ZMM2QzZHk1bWFYSnRZUzFsTG1OdmJTNW5kQzlqWlhKMGFXWnBZMkZrYjNNdllXTmZjM1ZpYjNKa2FXNWhaR0ZmWTJObkxtTmxjakEyQmdnckJnRUZCUWN3QVlZcWFIUjBjRG92TDI5amMzQXhMblZoYm1GMFlXTmhMbU52YlM5d2RXSnNhV012Y0d0cEwyOWpjM0F2TURZR0NDc0dBUVVGQnpBQmhpcG9kSFJ3T2k4dmIyTnpjREl1ZFdGdVlYUmhZMkV1WTI5dEwzQjFZbXhwWXk5d2Eya3ZiMk56Y0M4d0hRWURWUjBPQkJZRUZCOFdKL2t3OFM2ZmJySk5QdnRudmx2aGpyS1VNQXdHQTFVZEV3RUIvd1FDTUFBd0h3WURWUjBqQkJnd0ZvQVVCeklTV2pzdkVrYURWakd0aHVYVFFoWXR3SnN3RmdZRFZSMFNCQTh3RFlFTGFXNW1iMEJqWTJjdVozUXdnZ0tzQmdOVkhTQUVnZ0tqTUlJQ256Q0NBcEVHQ2lzR0FRUUJnYlZqQVFZd2dnS0JNQ3NHQ0NzR0FRVUZCd0lCRmg5b2RIUndjem92TDJacGNtMWhMV1V1WTI5dExtZDBMMnAxY21sa2FXTnZNSUlCUmdZSUt3WUJCUVVIQWdJd2dnRTRIb0lCTkFCREFHVUFjZ0IwQUdrQVpnQnBBR01BWVFCa0FHOEFJQUJFQUdrQVp3QnBBSFFBWVFCc0FDQUFaQUJsQUNBQVVBQmxBSElBY3dCdkFHNEFZUUFnQUVvQWRRQnlBTzBBWkFCcEFHTUFZUUFnQUdVQWJRQnBBSFFBYVFCa0FHOEFJQUJ3QUc4QWNnQWdBRU1BNFFCdEFHRUFjZ0JoQUNBQVpBQmxBQ0FBUXdCdkFHMEFaUUJ5QUdNQWFRQnZBQ0FBWkFCbEFDQUFSd0IxQUdFQWRBQmxBRzBBWVFCc0FHRUFMQUFnQUU0QVNRQlVBQ0FBTXdBMUFERUFOUUE1QUMwQU9BQXNBQ0FBYVFCdUFHWUFid0JBQUdNQVl3Qm5BQzRBWndCMEFDd0FJQUIxQUdJQWFRQmpBR0VBWkFCdkFDQUFaUUJ1QUNBQU1RQXdBQ0FBUXdCaEFHd0FiQUJsQUNBQU13QXRBRGdBTUFBZ0FGb0Fid0J1QUdFQUlBQXhBQ3dBSUFCSEFIVUFZUUIwQUdVQWJRQmhBR3dBWVFBdU1JSUJCZ1lJS3dZQkJRVUhBZ0l3Z2ZrZWdmWUFRUUIxQUhRQWJ3QnlBR2tBZWdCaEFHUUFid0FnQUhNQVpRQm5BUG9BYmdBZ0FISUFaUUJ6QUc4QWJBQjFBR01BYVFEekFHNEFJQUJrQUdVQUlBQXlBRE1BTGdBd0FERUFMZ0F5QURBQU1RQXlBQ3dBSUFCT0FHOEFMZ0FnQUZBQVV3QkRBQzBBTUFBeEFDMEFNZ0F3QURFQU1nQWdBR1FBWlFCc0FDQUFVZ0JRQUZNQVF3QWdBR1FBWlFCc0FDQUFUUUJwQUc0QWFRQnpBSFFBWlFCeUFHa0Fid0FnQUdRQVpRQWdBRVVBWXdCdkFHNEFid0J0QU8wQVlRQWdBR1FBWlFBZ0FHd0FZUUFnQUZJQVpRQndBUG9BWWdCc0FHa0FZd0JoQUNBQVpBQmxBQ0FBUndCMUFHRUFkQUJsQUcwQVlRQnNBR0V3Q0FZR0JBQ1BlZ0VDTUhrR0ExVWRId1J5TUhBd05xQTBvREtHTUdoMGRIQTZMeTlqY213eExuVmhibUYwWVdOaExtTnZiUzl3ZFdKc2FXTXZjR3RwTDJOeWJDOURRMGRVTG1OeWJEQTJvRFNnTW9Zd2FIUjBjRG92TDJOeWJESXVkV0Z1WVhSaFkyRXVZMjl0TDNCMVlteHBZeTl3YTJrdlkzSnNMME5EUjFRdVkzSnNNQTRHQTFVZER3RUIvd1FFQXdJRjREQWRCZ05WSFNVRUZqQVVCZ2dyQmdFRkJRY0RBZ1lJS3dZQkJRVUhBd1F3S2dZRFZSMFJCQ013SVlFZmJtVnpkRzl5TG1KaGJHeGxjM1JsY205elFHUnBaMmxtWVdOMExtTnZiVEFOQmdrcWhraUc5dzBCQVFzRkFBT0NBZ0VBR1laemhyalBTMWI2djZ5U1pCdFJoV2w4MUQ2ZmhuSVk3Z01ydHpyZm1RVGRJRmJIUWYySkJVZ2NqUERPOGg1aUltQlp2bEMyM0Q5L2pzL21GTjdKU3BtcW51eHBYc29HWlhXekw1dHlmN21EQ1l3cyswaWZ5YmQxdkxxU1B5clovRGxWSkVpZUxXTmFBUlZwR1cyRCt1MnBsVVQ0NFNkUlFVc0ZqMmF0elFSeTh5d1FZaUJyK3oxTk5TaDQ1aVJGNGV5ckplVlBDaTJTb1Q5L3hteUk5WnQvUHd4RlhzZXhQMEtYbVVCM2h6ckYrV09rdnBtWGZQeTdueGhQK2FZZVBYc2o3cTFtYzlyOE1BVmVqSG5FclU2L1VvenRVQ3pWRFg5ZmJOamRoVlVYemlacHA1c0swQUV3Vlh3bGpPazZzVTNuVkl5dzR2R2Y1UERqYUsrRXoreGQ4b0xidzZHZ0l1TWxISjZIc1hITGUwMVd3Z0QxMXlUZjB0d3JTL1ZEN2ZoOTJVdWEvQmRJbGJ1dC9xSUVaU1RCWmdlWDBFQWdPK0JFY2xBTmVkUXNtMVBMaTZsamtBUU5zaUNIVjBZaS8xeHdTWWtTOFBOWTZndmlkVHpPQXRZR08vMUI4T3l5NWxHNTNkSUVJUjFMWnJ0QVh3dURFL3hES2Z0YktkLzJEa2hXbmxiekxSSEtONmxoRXcwSXlBKzhWWTRndmhGSTBDVlJJRkFrYWpTcGdoa2V4WjB3TGY2VGxhcWJ3aVI4cmVnbXBoSEtUbEpYdVJvdDhaNkhDamY2ekZIZUlFQUg4YURYd1ZnRmdMbWlPaGpkZSt0dFdETS9UVUV1N0Zsa3VTYlZIbms0NEE4RWxsOGZ5eEliQ2dwbDZWeTZtWllqNXFSdk13QlBJcEE9PC9kczpYNTA5Q2VydGlmaWNhdGU+PC9kczpYNTA5RGF0YT48L2RzOktleUluZm8+PGRzOk9iamVjdCBJZD0iWGFkZXNPYmplY3RJZC0xMmU4ZmJmZS04OTY0LTQ3MGEtODVlZS0wODY3MDBkNDU3OWQiPjx4YWRlczpRdWFsaWZ5aW5nUHJvcGVydGllcyBJZD0iUXVhbGlmeWluZ1Byb3BlcnRpZXMtNTk0ZDNiNTktZDY3OS00NmVlLWE4ODItNmQ3MjdkZGIzZjFkIiBUYXJnZXQ9IiNTaWduYXR1cmUtZTMxMmM5ZjgtZWUzZi00ODdhLWIyYTQtMDMyZDE5NTU4OGRiIiB4bWxuczp4YWRlcz0iaHR0cDovL3VyaS5ldHNpLm9yZy8wMTkwMy92MS4zLjIjIj48eGFkZXM6U2lnbmVkUHJvcGVydGllcyBJZD0iU2lnbmVkUHJvcGVydGllcy1TaWduYXR1cmUtZTMxMmM5ZjgtZWUzZi00ODdhLWIyYTQtMDMyZDE5NTU4OGRiIj48eGFkZXM6U2lnbmVkU2lnbmF0dXJlUHJvcGVydGllcz48eGFkZXM6U2lnbmluZ1RpbWU+MjAyNS0xMi0xNlQwMDozNzowOFo8L3hhZGVzOlNpZ25pbmdUaW1lPjx4YWRlczpTaWduaW5nQ2VydGlmaWNhdGU+PHhhZGVzOkNlcnQ+PHhhZGVzOkNlcnREaWdlc3Q+PGRzOkRpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMDQveG1sZW5jI3NoYTI1NiIgLz48ZHM6RGlnZXN0VmFsdWU+OWZpc2JPa0FJekU1aGVXZVlXcXZ3ZTZ1MkNjUlUrdi9tSnZZYlZPN3Zxaz08L2RzOkRpZ2VzdFZhbHVlPjwveGFkZXM6Q2VydERpZ2VzdD48eGFkZXM6SXNzdWVyU2VyaWFsPjxkczpYNTA5SXNzdWVyTmFtZT5DPUdULCBMPUd1YXRlbWFsYSwgTz1DYW1hcmEgZGUgQ29tZXJjaW8gZGUgR3VhdGVtYWxhLCBPVT1QU0MtQ2FtYXJhIGRlIENvbWVyY2lvIGRlIEd1YXRlbWFsYSwgQ049Q2FtYXJhIGRlIENvbWVyY2lvIGRlIEd1YXRlbWFsYSBDQSAxLCBPSUQuMi41LjQuOTc9VkFUR1QtMzUxNTktODwvZHM6WDUwOUlzc3Vlck5hbWU+PGRzOlg1MDlTZXJpYWxOdW1iZXI+NzkyOTA4NjQwNTU2ODMyOTgzNDwvZHM6WDUwOVNlcmlhbE51bWJlcj48L3hhZGVzOklzc3VlclNlcmlhbD48L3hhZGVzOkNlcnQ+PC94YWRlczpTaWduaW5nQ2VydGlmaWNhdGU+PC94YWRlczpTaWduZWRTaWduYXR1cmVQcm9wZXJ0aWVzPjx4YWRlczpTaWduZWREYXRhT2JqZWN0UHJvcGVydGllcz48eGFkZXM6RGF0YU9iamVjdEZvcm1hdCBPYmplY3RSZWZlcmVuY2U9IiNSZWZlcmVuY2UtNGVkY2JlMzMtNjdjYi00ZWFlLWE5YjEtY2I4MjI2Y2RhODlkIj48eGFkZXM6TWltZVR5cGU+dGV4dC94bWw8L3hhZGVzOk1pbWVUeXBlPjx4YWRlczpFbmNvZGluZz5VVEYtODwveGFkZXM6RW5jb2Rpbmc+PC94YWRlczpEYXRhT2JqZWN0Rm9ybWF0PjwveGFkZXM6U2lnbmVkRGF0YU9iamVjdFByb3BlcnRpZXM+PC94YWRlczpTaWduZWRQcm9wZXJ0aWVzPjwveGFkZXM6UXVhbGlmeWluZ1Byb3BlcnRpZXM+PC9kczpPYmplY3Q+PC9kczpTaWduYXR1cmU+PC9kdGU6R1REb2N1bWVudG8+', 'FACT');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas_stock`
--
ALTER TABLE `alertas_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alertas_stock_producto_id_foreign` (`producto_id`),
  ADD KEY `alertas_stock_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `anulaciones_fel`
--
ALTER TABLE `anulaciones_fel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anulaciones_fel_venta_id_foreign` (`venta_id`),
  ADD KEY `anulaciones_fel_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_producto_producto_id_foreign` (`producto_id`),
  ADD KEY `categoria_producto_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_persona_id_unique` (`persona_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `compras_proveedore_id_foreign` (`proveedore_id`),
  ADD KEY `compras_sucursal_id_index` (`sucursal_id`);

--
-- Indices de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_producto_compra_id_foreign` (`compra_id`),
  ADD KEY `compra_producto_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion_fel`
--
ALTER TABLE `configuracion_fel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `configuracion_fel_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_clave` (`clave`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cotizaciones_cliente_id_foreign` (`cliente_id`),
  ADD KEY `cotizaciones_user_id_foreign` (`user_id`),
  ADD KEY `cotizaciones_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `cotizaciones_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `cotizacion_producto`
--
ALTER TABLE `cotizacion_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cotizacion_producto_cotizacion_id_foreign` (`cotizacion_id`),
  ADD KEY `cotizacion_producto_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `inventario_sucursal`
--
ALTER TABLE `inventario_sucursal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_producto_sucursal_ubicacion` (`producto_id`,`sucursal_id`,`ubicacion_id`),
  ADD KEY `inventario_sucursal_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `inventario_sucursal_ubicacion_id_foreign` (`ubicacion_id`);

--
-- Indices de la tabla `log_fel`
--
ALTER TABLE `log_fel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_fel_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marcas_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimientos_inventario_producto_id_foreign` (`producto_id`),
  ADD KEY `movimientos_inventario_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_compra_proveedore_id_foreign` (`proveedore_id`),
  ADD KEY `pedidos_compra_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `pedidos_compra_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_producto_pedido_compra_id_foreign` (`pedido_compra_id`),
  ADD KEY `pedido_producto_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personas_documento_id_foreign` (`documento_id`),
  ADD KEY `personas_nit_index` (`nit`);

--
-- Indices de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presentaciones_caracteristica_id_unique` (`caracteristica_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_marca_id_foreign` (`marca_id`),
  ADD KEY `productos_presentacione_id_foreign` (`presentacione_id`),
  ADD KEY `productos_unidad_medida_id_foreign` (`unidad_medida_id`);

--
-- Indices de la tabla `productos_danados`
--
ALTER TABLE `productos_danados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_danados_producto_id_foreign` (`producto_id`),
  ADD KEY `productos_danados_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `productos_danados_ubicacion_id_foreign` (`ubicacion_id`),
  ADD KEY `productos_danados_user_id_foreign` (`user_id`),
  ADD KEY `productos_danados_aprobado_por_foreign` (`aprobado_por`);

--
-- Indices de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_venta_venta_id_foreign` (`venta_id`),
  ADD KEY `producto_venta_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proveedores_persona_id_unique` (`persona_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `series_fel`
--
ALTER TABLE `series_fel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_fel_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_codigo_sucursal` (`codigo`,`sucursal_id`),
  ADD KEY `ubicaciones_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_sucursal`
--
ALTER TABLE `user_sucursal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_sucursal` (`user_id`,`sucursal_id`),
  ADD KEY `user_sucursal_user_id_foreign` (`user_id`),
  ADD KEY `user_sucursal_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_user_id_foreign` (`user_id`),
  ADD KEY `ventas_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `ventas_sucursal_id_index` (`sucursal_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas_stock`
--
ALTER TABLE `alertas_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `anulaciones_fel`
--
ALTER TABLE `anulaciones_fel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuracion_fel`
--
ALTER TABLE `configuracion_fel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuracion_sistema`
--
ALTER TABLE `configuracion_sistema`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion_producto`
--
ALTER TABLE `cotizacion_producto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_sucursal`
--
ALTER TABLE `inventario_sucursal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `log_fel`
--
ALTER TABLE `log_fel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos_danados`
--
ALTER TABLE `productos_danados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `series_fel`
--
ALTER TABLE `series_fel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user_sucursal`
--
ALTER TABLE `user_sucursal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas_stock`
--
ALTER TABLE `alertas_stock`
  ADD CONSTRAINT `alertas_stock_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alertas_stock_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `anulaciones_fel`
--
ALTER TABLE `anulaciones_fel`
  ADD CONSTRAINT `anulaciones_fel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `anulaciones_fel_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD CONSTRAINT `categoria_producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `compras_proveedore_id_foreign` FOREIGN KEY (`proveedore_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD CONSTRAINT `compra_producto_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compra_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `configuracion_fel`
--
ALTER TABLE `configuracion_fel`
  ADD CONSTRAINT `configuracion_fel_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cotizaciones_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotizaciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cotizaciones_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `cotizacion_producto`
--
ALTER TABLE `cotizacion_producto`
  ADD CONSTRAINT `cotizacion_producto_cotizacion_id_foreign` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotizacion_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inventario_sucursal`
--
ALTER TABLE `inventario_sucursal`
  ADD CONSTRAINT `inventario_sucursal_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_sucursal_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_sucursal_ubicacion_id_foreign` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `log_fel`
--
ALTER TABLE `log_fel`
  ADD CONSTRAINT `log_fel_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `movimientos_inventario_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movimientos_inventario_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  ADD CONSTRAINT `pedidos_compra_proveedore_id_foreign` FOREIGN KEY (`proveedore_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_compra_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_compra_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_pedido_compra_id_foreign` FOREIGN KEY (`pedido_compra_id`) REFERENCES `pedidos_compra` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD CONSTRAINT `presentaciones_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_presentacione_id_foreign` FOREIGN KEY (`presentacione_id`) REFERENCES `presentaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidades_medida` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos_danados`
--
ALTER TABLE `productos_danados`
  ADD CONSTRAINT `productos_danados_aprobado_por_foreign` FOREIGN KEY (`aprobado_por`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productos_danados_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_danados_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_danados_ubicacion_id_foreign` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productos_danados_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `producto_venta_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_venta_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `series_fel`
--
ALTER TABLE `series_fel`
  ADD CONSTRAINT `series_fel_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `ubicaciones_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_sucursal`
--
ALTER TABLE `user_sucursal`
  ADD CONSTRAINT `user_sucursal_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_sucursal_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
