-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-03-2023 a las 03:54:45
-- Versión del servidor: 10.5.17-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u157083720_ventasUno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `aperturacaja_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_abono_manual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pago` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `efectivo` decimal(11,2) NOT NULL,
  `transferencia` decimal(11,2) NOT NULL,
  `tdebito` decimal(11,2) NOT NULL,
  `tcredito` decimal(11,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `total_abono` decimal(11,2) NOT NULL,
  `status_abono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aperturacajas`
--

CREATE TABLE `aperturacajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad_inicial` decimal(11,2) NOT NULL,
  `cantidad_final` decimal(11,2) NOT NULL,
  `fecha_hora_cierre` datetime DEFAULT NULL,
  `status_apertura` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `cod` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descipcion` varchar(250) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_venta_temp`
--

CREATE TABLE `carrito_venta_temp` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(765) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descipcion` varchar(750) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'ALETAS', NULL, 1, '2022-10-25 04:23:11', '2022-10-27 12:30:35'),
(3, 'ALETAS', NULL, 1, '2022-10-27 14:37:48', '2022-10-27 14:37:48'),
(5, 'LATERAL', 'VERDE', 1, '2022-10-27 20:47:26', '2022-11-02 15:33:50'),
(6, 'PUERTAS', 'VERDES Y PRIVACE', 1, '2022-11-03 14:27:27', '2022-11-03 14:27:27'),
(7, 'LUNETAS', 'VERDE', 1, '2022-11-09 18:58:02', '2022-11-09 18:58:02'),
(8, 'PARABRISAS', NULL, 1, '2022-12-07 14:33:15', '2022-12-07 14:33:15'),
(9, 'Prueba', NULL, 1, '2023-01-25 09:44:13', '2023-01-25 09:44:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(250) NOT NULL,
  `rut` varchar(20) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `rut`, `telefono`, `direccion`, `email`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'CLIENTE GENERICO', '8.123.123-2', 111111111, 'Curico', 'generico@gmail.com', 1, '2023-01-25 04:27:44', '2023-01-31 23:44:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_cajero_dia`
--

CREATE TABLE `corte_cajero_dia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apertura_id` bigint(20) UNSIGNED NOT NULL,
  `total_acomulado` decimal(11,2) DEFAULT NULL,
  `seriefolio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ventaefectivo` decimal(11,2) DEFAULT NULL,
  `ventatransferencia` decimal(11,2) DEFAULT NULL,
  `ventatdebito` decimal(11,2) DEFAULT NULL,
  `ventatcredito` decimal(11,2) DEFAULT NULL,
  `abonoefectivo` decimal(11,2) DEFAULT NULL,
  `abonotransferencia` decimal(11,2) DEFAULT NULL,
  `abonotdebito` decimal(11,2) DEFAULT NULL,
  `abonotcredito` decimal(11,2) DEFAULT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `numfolio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_cliente` bigint(20) UNSIGNED NOT NULL,
  `cod` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` int(11) NOT NULL,
  `factura` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pago` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validez` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `servicio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_cotizacion_manual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `tipo_registro` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_cotizacion`
--

CREATE TABLE `detalles_cotizacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_cotizacion` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_abonos`
--

CREATE TABLE `detalle_abonos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `abono_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `aperturacaja_id` bigint(20) UNSIGNED NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venta_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `aperturacaja_id` bigint(20) UNSIGNED NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_categ` bigint(20) UNSIGNED NOT NULL,
  `id_proveedor` bigint(20) UNSIGNED NOT NULL,
  `id_subcateg` bigint(20) UNSIGNED NOT NULL,
  `impuestos` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `precio_costo` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `maneja_inventario` tinyint(1) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `id_categ`, `id_proveedor`, `id_subcateg`, `impuestos`, `estado`, `precio_costo`, `precio_venta`, `stock`, `stock_min`, `maneja_inventario`, `imagen`, `created_at`, `updated_at`) VALUES
(2, 'AT190223275', 'KIA RIO III 2011- SEDAN D/D  VERDE ALETA', 'D/D  VERDE ALETA', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-10-27 13:42:16', '2022-12-30 13:07:02'),
(3, '59660TDR2', 'KIA RIO  4  2012 SEDAN  D/D VERDE ALETA', 'D/D VERDE ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-10-27 13:45:39', '2022-12-30 13:07:28'),
(4, '01420TDR2', 'NISSAN V 16 SEDAN T/D VERDE PUERTA', 'T/D VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-10-27 13:46:50', '2022-12-30 13:07:54'),
(5, '1970', 'KIA MORNING 2017  HB T/D  VERDE ALETA', 'T/D  VERDE ALETA', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 3, 1, '', '2022-10-27 13:49:15', '2022-12-30 13:17:00'),
(6, '27643', 'KIA RIO 4 SEDAN 2017 T/I VERDE ALETA', 'T/I VERDE ALETA', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-10-27 13:50:34', '2022-12-30 13:17:27'),
(7, '24660', 'KIA RIO 4 SEDAN 2000 -2005 T/D VERDE T/D VERDE ALETA', 'T/D VERDE ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 0, 1, 1, '', '2022-10-27 13:53:38', '2022-12-30 13:53:21'),
(8, '53980TDR6', 'KIA RIO JB 2006 - 2011 T/D ALETA', 'T/D ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 13:55:50', '2022-12-30 13:36:23'),
(9, '53980TDR5', 'KIA RIO JB 2006-2011   T/I  VERDE ALETA', 'T/I  VERDE ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 13:56:58', '2023-01-03 12:32:34'),
(10, '58970TDR5', 'KIA MORNING 2011 EN ADELANTE T/I   VERDE ALETA', 'T/I   VERDE ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 14:39:39', '2022-12-30 13:37:40'),
(11, '58970TDR6', 'KIA MORNING 2011 EN ADELANTE T/D   VERDE  ALETAS', 'T/D   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 14:40:19', '2022-12-30 13:38:40'),
(12, 'AT190223275', 'KIA RIO III 2011- SEDAN /HB D/D  VERDE ALETA', 'D/D  VERDE ALETA', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 14:45:47', '2022-12-30 13:39:15'),
(13, 'AT181127206', 'KIA RIO III SEDAN / HB  2011 EN ADELANTE D/I  VERDE ALETAS', 'D/I  VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 0, 1, 1, '', '2022-10-27 14:46:55', '2022-12-30 13:42:12'),
(14, '51380TDR6', 'KIA MORNING 2004-2010 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 15:37:30', '2022-12-30 13:42:57'),
(15, '51380TDR5', 'KIA MORNING 2004 -  2010 T/I       VERDE  ALETAS', 'T/I       VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 15:38:51', '2022-12-30 13:44:28'),
(16, '58970TDR6', 'KIA MORNING 2011 EN ADELANTE T/D ALETAS', 'T/D ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 15:40:32', '2022-12-30 13:46:31'),
(17, '53980TDR5', 'KIA RIO 4 SEDAN JB 2005-2011 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 15:42:46', '2022-12-30 13:47:07'),
(18, '5398TDR5', 'KIA RIO 5  JB SEDAN 2006-2011 T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 15:44:36', '2022-12-30 13:47:35'),
(19, '51380TDR6', 'KIA MORNING 2004-2011 T/D    VERDE ALETAS', 'T/D    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:23:11', '2022-12-30 13:48:07'),
(20, '58970TDR5', 'KIA MORNING 2011-2016 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:25:13', '2022-12-30 13:48:32'),
(21, '1970', 'KIA MORNING 2017 T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 3, 1, 1, '', '2022-10-27 20:27:41', '2022-12-30 13:48:58'),
(22, '26032TDR3', 'KIA CERATO  SEDAN 2013  EN ADELANTE T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:31:16', '2022-12-30 13:49:28'),
(23, '26031TDR2', 'KIA CERATO SEDAN 2013 T/D  VERDE ALETA', 'T/D  VERDE ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:32:42', '2022-12-30 13:49:54'),
(24, 'AT170730063', 'KIA MORNING 2011 T/I     VERDE ALETAS', 'T/I     VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:37:54', '2022-12-30 13:50:23'),
(25, 'AT190221162', 'KIA RIO III  UB 2011 - 2016  SEDAN T/D    VERDE ALETAS', 'T/D    VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 20:39:40', '2022-12-30 13:50:49'),
(26, 'AT190221163', 'KIA RIO III UB 2011 EN ADELANTE T/I    VERDE ALETAS', 'T/I    VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 20:43:03', '2022-12-30 13:51:14'),
(27, '57340TDR6', 'MAZDA 3  SEDAN  2009  -  2014 T/D   VERDE  ALETAS', 'T/D   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:48:43', '2022-12-30 13:51:41'),
(28, '57340TDR5', 'MAZDA 3  SEDAN 2009-2014 T/I   VERDE  ALETAS', 'T/I   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:49:56', '2022-12-30 13:53:46'),
(29, '5560ATDR5', 'MAZDA 2  HB   2007  -  2014 T/I    VERDE ALETAS', 'T/I    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 20:54:33', '2022-12-30 13:54:17'),
(30, '5560ATDR6', 'MAZDA 2  HB   2007  -  2014 T/D    VERDE ALETAS', 'T/D    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 20:55:20', '2022-12-30 13:54:47'),
(31, '04870TDR6', 'DAEWOO RACE   SEDAN   1.5  1994 - 1995 T/D    VERDE  ALETAS', 'T/D    VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 21:14:55', '2022-12-30 13:56:50'),
(32, '58370TDR2', 'DAEWOO MATIZ 2010 EN ADELANTE D/D    VERDE ALETAS', 'D/D    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 21:16:10', '2022-12-30 13:57:19'),
(33, '58370TDR1', 'DAEWOO MATIZ   2010  EN ADELANTE D/I   VERDE ALETAS', 'D/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-27 21:17:10', '2022-12-30 13:57:54'),
(34, '30391', 'RENAULT 18 SEDAN 1979   1982 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 21:27:12', '2022-12-30 13:58:22'),
(35, '2494DR6', 'RENAULT CLIO I HB  1990-1998 T/D   VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 21:28:28', '2022-12-30 13:58:45'),
(36, '01010', 'MEGANE  2003 T/I   VERDE  ALETAS', 'T/I   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-27 21:29:39', '2022-12-30 13:59:14'),
(37, 'GT/ST131209158', 'MERCEDES BENZ 190E 1984-1993 D/I    VERDE  ALETAS', 'D/I    VERDE  ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 14:52:59', '2022-12-30 14:05:03'),
(38, '47760TDR2', 'VOLKSWAGEN GOLF VII 5D HB 2013 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 14:58:55', '2022-12-30 14:06:10'),
(39, '50490TDR6', 'MAHINDRA SCORPIO 5D/4D PICK-UP 2008 T/D    VERDE  ALETAS', 'T/D    VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 15:14:51', '2022-12-30 14:06:34'),
(40, '50490TDR5', 'MAHINDRA SCORPIO 5D/4D PICK-UP 2008  T/I  VERDE  ALETAS', 'T/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-10-28 15:16:07', '2022-12-30 14:07:05'),
(41, '58790TDR6', 'VW AMAROK4D PICKUP 2010 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-10-28 15:22:27', '2022-12-30 14:07:31'),
(42, '50790TDR6', 'VW  AMAROK   2008 T/D    PRIVACE  ALETAS', 'T/D    PRIVACE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 15:23:42', '2022-12-30 14:07:59'),
(43, '50790TDR5', 'VW AMAROK  2010 T/I   PRIVACE ALETAS', 'T/I   PRIVACE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 15:24:36', '2022-12-30 14:08:39'),
(44, '50790TDR5', 'VW AMAROK  2010 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 15:25:41', '2022-12-30 14:09:47'),
(45, '5427ATDR5', 'MITSUBISHI TRITON PICKUP L 200 2006 T/I PRIVACE ALETAS', 'T/I PRIVACE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 15:49:57', '2022-12-30 14:10:46'),
(46, '5427ATDR5', 'MT L200-NEW KATANA  2006 T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-10-28 18:18:04', '2023-01-04 13:50:03'),
(47, '5427ATDR6', 'MT L200-NEW KATANA  2006 T/D VERDE ALETAS', 'T/D VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-10-28 18:19:38', '2023-01-04 13:50:42'),
(48, '5427ATDR6', 'MT L200 T/D  PRIVACE ALETAS', 'T/D  PRIVACE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:20:48', '2023-01-04 13:51:26'),
(49, '01212', 'MIT MONTERO SPORTS 5 PTAS T/I   PRIVACE ALETAS', 'T/I   PRIVACE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:22:15', '2023-01-04 13:51:54'),
(50, '5427BTDR5', 'MT MONTERO SPORTG2 5D 2010 T/I   PRIVACE ALETAS', 'T/I   PRIVACE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:24:57', '2023-01-04 13:52:21'),
(51, '24561', 'NISSAN NAVARA   2006  T/D    VERDE ALETAS', 'T/D    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 18:28:47', '2023-01-04 13:52:54'),
(52, 'FV22461', 'NISSAN NAVARA  2005 T/I   VERDE  ALETAS', 'T/I   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 18:33:54', '2023-01-04 13:53:30'),
(53, '5377ATDR5', 'NISSAN PATHFINDER 2005 - 2012 T/I VERDE  ALETAS', 'T/I VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-28 18:37:46', '2023-01-04 13:56:19'),
(54, '52580TDR7', 'NISSAN TIIDA   4 PTAS 2004 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 650000, 3, 3, 1, '', '2022-10-28 18:40:58', '2023-01-04 13:56:49'),
(55, '47170TDR6', 'NISSAN VERSA   2003- 2011 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:43:35', '2023-01-04 13:57:16'),
(56, '01213', 'NISSAN SENTRA I  T/I VERDE ALETAS', 'T/I VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:44:40', '2023-01-04 13:57:47'),
(57, '01214', 'NISSAN SENTRA II    2001 - 2006 T/D  VERDE  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:46:07', '2023-01-04 13:58:09'),
(58, '01215', 'NISSAN  VERSA T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 18:47:21', '2023-01-04 13:58:35'),
(59, '26640TDR5', 'NISSAN BLUEBIRD    2000 - 2005 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:15:14', '2023-01-04 13:59:02'),
(60, '26640TDR6', 'NISSAN BLUEBIRD    2000 - 2005 T/D   VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:15:56', '2023-01-04 13:59:32'),
(61, '01216', 'FORD CARGO 1988 - 2010 T/I ALETAS', 'T/I ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:18:07', '2023-01-04 14:00:06'),
(62, '63260TDR2', 'FORD FIESTA SEDAN  2009 D/D   VERDE ALETAS', 'D/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:19:54', '2023-01-04 14:00:34'),
(63, '1420TDR5', 'NISSAN V 16 T/I    VERDE ALETAS', 'T/I    VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:20:58', '2023-01-04 14:00:59'),
(64, '2456ATDR5', 'RN CLIO 2   1999-2008 / NISSAN PLATINA  2006 ALETA T/IZ', 'T/I    VERDE', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:24:11', '2023-01-03 19:12:54'),
(65, 'AT190415136', 'NISSAN QASHQAI  2014 D/I   VERDE ALETAS', 'D/I   VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:26:20', '2023-01-04 14:01:29'),
(66, '01450TDR5', 'NISSAN SUNNY SEDAN 1985 -1991 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-28 19:28:36', '2023-01-04 14:01:54'),
(67, 'FV21152GTNR', 'TOYOTA RAV 4 2001-2005  T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-29 12:26:08', '2023-01-04 14:02:28'),
(68, '53870TDR5', 'TOYOTA NEW YARIS 2006-2013 T/I VERDE ALETA', 'T/I VERDE', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:31:18', '2023-01-03 13:17:58'),
(69, 'FV21609', 'TOYOTA COROLLA 2003-2008 T/D  VERDE  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:32:25', '2023-01-04 14:03:03'),
(70, 'FV21610', 'TY COROLLA 2003-2008  T/I  VERDE  ALETAS', 'T/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:33:24', '2023-01-04 14:03:43'),
(71, '5907TDR5', 'TY YARIS 2014 T/I VERDE  ALETAS', 'T/I VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-29 12:35:11', '2023-01-04 14:04:14'),
(72, '32490TDR5', 'TY YARIS  SEDAN  1999 - 2005 T/I  VERDE  ALETAS', 'T/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:36:36', '2023-01-04 14:04:46'),
(73, '32490DR6', 'TY YARIS  SEDAN  1999 - 2005 T/D  D/D VERDE  ALETAS', 'T/D  VERDE  ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:37:22', '2023-01-04 14:25:19'),
(74, '55490TDR6', 'TY COROLLA SEDAN 2007 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 12:38:29', '2023-01-04 14:05:55'),
(75, '52810TDR8', 'TY YARIS  HB  2005-2010 T/D  VERDE  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-29 12:45:21', '2023-01-04 14:09:40'),
(76, '10830TDR6', 'TY TERCEL   95-99 T/D VERDE ALETAS', 'T/D VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 8, 8, 1, '', '2022-10-29 13:14:25', '2023-01-04 14:10:09'),
(77, '10470TDR5', 'TY TERCEL  1991-1994 T/I  VERDE  ALETAS', 'T/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-10-29 13:26:44', '2023-01-04 14:10:43'),
(78, '52810TDR7', 'TOYOTA YARIS HB 2005  T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-10-29 13:30:31', '2023-01-04 14:11:15'),
(79, '20920', 'TY YARIS HB 95-2005 T/D  VERDE  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 13:31:56', '2023-01-04 14:11:47'),
(80, 'A0770TDR5', 'TOYOTA HILLUX  2015 T/D  VERDE  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-10-29 13:38:31', '2023-01-04 14:12:29'),
(81, '57240TDR2', 'CHEVROLET SPARK 2011 D/D  VERDE  ALETAS', 'D/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 12:45:50', '2023-01-04 14:15:23'),
(82, '64110TDR2', 'CHEVROLET SAIL  2011 - 2015/ TIIDA 04-2012 D/D VERDE  ALETA', 'D/D VERDE  ALETAS', 1, 2, 1, NULL, 1, 12000, 65000, 6, 2, 1, '', '2022-11-02 12:48:11', '2023-02-02 10:43:26'),
(83, '64110TDR1', 'CHEVROLET SAIL  2011 - 2015/ TIIDA 04-2012 D/I   VERDE  ALETA', 'D/I   VERDE  ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-02 12:52:12', '2023-01-04 14:18:09'),
(84, '57240TDR1', 'CHEVROLET SPARK 2011 D/I  VERDE  ALETAS', 'D/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-02 12:56:42', '2023-01-04 14:18:43'),
(85, '50500TDR5', 'DAEWOO NUBIRA CHEV LACETT/OPTRA  SEDAN 2002-2008 D/D VERDE  ALETAS', 'D/I ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 12:59:15', '2023-01-04 14:20:08'),
(86, '3272ATDR5', 'CORSA 4 PTAS D/D VERDE  ALETAS', 'D/I ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 13:00:41', '2023-01-04 14:20:39'),
(87, '3272ATDR6', 'CORSA 4 PTAS D/D VERDE  ALETAS', 'D/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 13:01:44', '2023-01-04 14:21:05'),
(88, '26010TDR5', 'OPEL ASTRA SEDAN 1998- 2004 D/D VERDE  ALETAS', 'D/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:06:24', '2023-01-04 14:21:36'),
(89, '01216', 'CHE MONZA D/D VERDE  ALETAS', 'D/D ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 13:08:56', '2023-01-04 14:21:56'),
(90, '01217', 'CHE MONZA D/D VERDE  ALETAS', 'D/I  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 13:09:44', '2023-01-04 14:22:22'),
(91, '6440TDR6', 'OP CORSA HB 1993-2000 D/D VERDE  ALETAS', 'D/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:13:13', '2023-01-04 14:22:44'),
(92, '12610TDR5', 'GM PONTIAC SUNFIRE SEDAN 1995-1999 D/D VERDE  ALETAS', 'D/I  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:15:03', '2023-01-04 14:23:13'),
(93, '9669064', 'CH  SPARK 2009  /  DAEWOO  D/D VERDE  ALETAS', 'D/D ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 13:18:08', '2023-01-04 14:24:07'),
(94, 'FV3739', 'CH LUV D/D VERDE  ALETAS', 'D/I ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 13:19:26', '2023-01-04 14:24:32'),
(95, 'FV3738', 'CHE LUV D/D VERDE  ALETAS', 'D/D ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 13:20:34', '2023-01-04 14:26:26'),
(96, '50500TDR6', 'DAEWOO NUBIRA CHEV LACETT/OPTRA  SEDAN 2002-2008 D/D VERDE  ALETAS', 'D/D  VERDE  ALETA', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:23:26', '2023-01-04 14:26:56'),
(97, '01218', 'ASTRA 1991- 1999 D/D  ALETAS', 'D/D  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:27:46', '2023-01-04 14:27:28'),
(98, '59710TDR3', 'CH VIVA MONTANA 2010 D/D  ALETAS', 'D/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:28:52', '2023-01-04 14:27:57'),
(99, '26490TDR6', 'ELANTRA 2001-2006  D/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:30:50', '2023-01-04 14:28:44'),
(100, '74790TDRG5', 'NEW ACCENT 2006-2013 ALETA DEL IZQ', 'D/I', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 13:33:03', '2023-01-03 19:41:21'),
(101, '74790TDR5', 'HYUNDAI ACCENT 2006-2013 D/D  VERDE ALETA', 'D/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 13:36:39', '2023-01-04 14:29:20'),
(102, '4890TDR6', 'HYUNDAI EXCEL   1990-1994 D/D  ALETAS', 'T/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:39:03', '2023-01-04 14:32:45'),
(103, '56940TDR1', 'HYUNDAI I 10  2007-2013 D/D  ALETAS', 'T/I   VERDE ALETAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:39:57', '2023-01-04 14:33:18'),
(104, '54340TDR7', 'SUZUKI SX4  2006-2012 D/D  ALETAS', 'T/I  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:40:43', '2023-01-04 14:33:44'),
(105, 'GT/TM0808072', 'HYUNDAI SONATA 2003-2005 D/D  ALETAS', 'T/I  VERDE ALETAS', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:43:10', '2023-01-04 14:34:11'),
(106, 'AT181107140', 'HYUNDAI ACCENT 1999-2006  ALETA TRAS IZQ', 'T/I', 1, 3, 1, 'No Mostrar', 1, 12000, 65000, 11, 1, 1, '', '2022-11-02 13:44:10', '2023-01-03 19:47:40'),
(107, '10920TDR6', 'HYUDAI ACCENT 1995-1999 ALETA TRAS DER VERDE', 'T/D  VERDE', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 13:45:26', '2023-01-03 19:48:05'),
(108, '10920TDR5', 'HYUNDAI ACCENT 1999-2006  SEDAN ALETA T/IZQ', 'T/I  VERDE', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:47:39', '2023-01-03 19:49:30'),
(109, '01219', 'HYUNDAI   NEW - 1   2008 D/D  ALETAS', 'D/D  VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 13:52:49', '2023-01-04 14:34:41'),
(110, '49760TDR6', 'HYUNDAI GRAN I 10  2013 D/D  ALETAS', 'T/D   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 14:13:27', '2023-01-04 14:35:35'),
(111, '27240TDR6', 'HYUNDAI ATOS 1999-2003 D/D  ALETAS', 'D/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:20:19', '2023-01-04 14:36:10'),
(112, '18980TDR2', 'HYUNDAI H-1 1998-2006 D/D VERDE ALETAS', 'D/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:21:37', '2023-01-04 14:36:49'),
(113, '20780TDR5', 'HYUNDAI ELANTRA SEDAN 1996-2000 D/D VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:24:35', '2023-01-04 14:37:33'),
(114, '20780TDR6', 'HYUNDAI ELANTRA SEDAN 1996-2000 D/D VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:25:40', '2023-01-04 14:38:18'),
(115, '18980TDR1', 'HYUNDAI H-1  /H200  1998 D/D  VERDE ALETAS', 'D/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:28:59', '2023-01-04 14:38:51'),
(116, '2518ATDR5', 'HYUNDAI GETZ 2002 D/D VERDE   ALETAS', 'D/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:30:08', '2023-01-04 14:39:20'),
(117, '2518TDR6', 'HYUNDAI GETZ 2002 -2009 D/D VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:34:43', '2023-01-04 14:39:53'),
(118, '3340TDRG5', 'SUZUKI SWIFT SEDAN1989-1995 T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:36:08', '2023-01-04 14:40:18'),
(119, '84050TDR8', 'SUZUKI CELERIO 2009 T/D   VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 14:37:42', '2023-01-04 14:40:46'),
(120, '53340TDR6', 'SUZUKI GRAN NOMADE   III GENERACION 2006-2015 T/D VERDE ALETAS', 'T/D VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:40:55', '2023-01-04 14:41:57'),
(121, '52570TDR6', 'SUIFT 2004-2010 T/D   VERDE ALETAS', 'T/D   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 14:42:26', '2023-01-04 14:42:51'),
(122, '52570TDR5', 'SUZUKI SWIFT  HB  SEDAN 2004-2010 T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-02 14:44:07', '2023-01-04 14:46:45'),
(123, '5350TDR5', 'SUZUKI NEW ALTO 800 2012   HB T/I   VERDE ALETAS', 'T/I   VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 14:48:08', '2023-01-04 14:47:16'),
(124, '84050TDR7', 'SUZUKI CELERIO 2009  T/I  VERDE ALETAS', 'T/I  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-02 14:50:26', '2023-01-04 14:49:44'),
(125, '63840TDR6', 'JAC 137  2010  J-3 T/D   VERDE  ALETAS', 'T/D   VERDE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-02 14:55:13', '2023-01-04 14:54:29'),
(126, '01220', 'DINAMITA  96 D/D VERDE ALETAS', 'D/D VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 12:03:54', '2023-01-04 14:55:57'),
(127, '01221', 'HILUX 89/97 D/D  VERDE ALETAS', 'D/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 12:05:07', '2023-01-04 14:59:13'),
(128, '01222', 'TOYOTA STARLET  92-99 T/D  VERDE ALETAS', 'T/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 12:07:31', '2023-01-04 14:59:43'),
(129, '78980TDR4', 'SAIL 2016 T/D VERDE PUERTA', 'T/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:28:46', '2023-01-04 15:00:24'),
(130, '78980TDR2', 'SAIL 2016 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:34:10', '2023-01-04 15:01:53'),
(131, 'AT220310328', 'D MAX 2004-09 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:35:49', '2023-01-04 15:02:29'),
(132, 'AT210823461', 'SAIL 2010 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:37:42', '2023-01-04 15:09:43'),
(133, 'FD3740TDR2', 'LUV C/A D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 6, 6, 1, '', '2022-11-03 14:38:59', '2023-01-04 15:10:13'),
(134, '52430TDR4', 'D MAX 2004-2013 T/D VERDE PUERTA', 'T/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:40:12', '2023-01-04 15:11:16'),
(135, 'DD11267TDR2', 'TRAVERSE 2007 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:43:47', '2023-01-04 15:11:43'),
(136, '58370TDR2', 'SPARKGT 2011 D/D VERDE PUERTA', 'D/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:44:52', '2023-01-04 15:12:15'),
(137, '11410TDR2', 'LUV 81-88 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:45:54', '2023-01-04 15:12:43'),
(138, 'FD5560TDR2', 'LUV S/A 1998 D/D   VERDE PUERTA', 'D/D   VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-03 14:47:54', '2023-01-04 15:13:12'),
(139, '54960TDR4', 'CAPTIVA 200472011 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:49:51', '2023-01-04 15:13:41'),
(140, '54960TDR2', 'CAPTIVA 2006/13 D/D  VERDE  PUERTA', 'D/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:50:53', '2023-01-04 15:14:11'),
(141, '52430TDR2', 'D MAX 2004-2013 D/D VERDE PUERTA', 'D/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 3, 1, '', '2022-11-03 14:52:18', '2023-01-10 21:38:10'),
(142, 'AT220110296', 'SPARK LT  2005 D/D VERDE  PUERTA', 'D/D VERDE  PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:54:57', '2023-01-04 15:15:09'),
(143, 'AT211004176', 'AVEO SEDAN 2005 D/D  VERDE D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 14:56:15', '2023-01-04 15:15:37'),
(144, '50500TDR4', 'DAEWOO NUBIRA CHEV LACETT/OPTRA  SEDAN 2002-2008 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 14:59:23', '2023-01-04 15:16:10'),
(145, '57240TDR2', 'SPARK LT 2011 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:01:51', '2023-01-04 15:16:48'),
(146, '59360TDR2', 'D MAX 2014 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-03 15:03:49', '2023-01-04 15:17:16'),
(147, '28170TDR4', 'AVEO SEDAN 2004 - 06 T/D  VERDE T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:08:21', '2023-01-04 15:17:47'),
(148, '59360TDR4', 'D MAX 2014 T/D  PRIVACE PUERTA', 'T/D  PRIVACE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:10:06', '2023-01-04 15:18:15'),
(149, '59360TDR4', 'D MAX 2014 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-03 15:11:15', '2023-01-04 15:18:42'),
(150, 'AT181005030', 'AVEO HB 2003  T/D  VERDE PUERTA', 'T/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:12:56', '2023-01-04 15:19:27'),
(151, '51370TDR2', 'SPARK LT 2011 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-03 15:14:11', '2023-01-04 15:19:58'),
(152, '57240TDR2', 'SPARK LT 2011  T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:15:39', '2023-01-04 15:20:34'),
(153, 'AT220522338', 'SPARK  LT  2015 D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:20:53', '2023-01-04 15:21:38'),
(154, '54390TDR3', 'AVEO SEDAN 2007 T/I   VERDE PUERTA', 'T/I   VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:22:57', '2023-01-04 15:22:29'),
(155, 'AT22430', 'D MAX 2004-2013 T/I  VERDE PUERTA', 'T/I  VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:24:24', '2023-01-04 15:23:06'),
(156, '59360TDR3', 'D MAX 2014 T/I  VERDE  PUERTA', 'T/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:25:31', '2023-01-04 15:23:38'),
(157, '64110TDR5', 'CHEVROLET SAIL  2011 - 2015/ TIIDA 04-2012 T/I VERDE PUERTA', 'T/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:26:32', '2023-01-04 15:24:17'),
(158, '52430TDR3', 'D MAX 2004-2013 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:27:57', '2023-01-04 15:24:54'),
(159, '59360TDR3', 'D MAX 2015 D/I PRIVACE PUERTA', 'D/I PRIVACE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:29:19', '2023-01-04 15:29:00'),
(160, 'AT210816300', 'SAIL  2010 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:30:18', '2023-01-04 15:29:39'),
(161, '54390TDR2', 'AVEO SEDAN 2004 - 06 D/I  2004 VERDE D/I  2004 VERDE PUERTA', 'D/I  2004 VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:31:53', '2023-01-04 15:30:40'),
(162, '43050TDR3', 'N300 2011 D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:33:30', '2023-01-04 15:31:23'),
(163, '59360TDR3', 'D MAX 2015 D/I PRIVACE PUERTA', 'T/I VERDE  PRIVACE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 15:35:27', '2023-01-04 15:32:43'),
(164, '59360TDR3', 'D MAX 2015 T/I  PRIVACE  PUERTA', 'T/I  PRIVACE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:37:23', '2023-01-04 15:33:28'),
(165, '11410TDR3', 'LUV 81-88 T/I VERDE PUERTA', 'T/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:38:25', '2023-01-04 15:33:57'),
(166, '10499TDR3', 'COLORADO  2013 D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:39:35', '2023-01-04 15:34:28'),
(167, 'GT7ST150110028', 'GEMINIS 88-92 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 15:43:58', '2023-01-04 15:35:01'),
(168, 'FD5561', 'CHEV LUV  S/A D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 19:22:20', '2023-01-04 15:35:41'),
(169, 'AT210816269', 'D MAX 2004-2013 T/I  VERDE PUERTA', 'T/I  VERDE  PUERTA', 6, 3, 1, NULL, 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 19:23:53', '2023-02-10 12:36:44'),
(170, 'AT2105517387', 'LUV C/A  89   D/I   VERDE PUERTA', 'D/I   VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 19:25:48', '2023-01-04 15:37:31'),
(171, '50500TDR3', 'OPTRA 2002-08 T/I  VERDE  PUERTA', 'T/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 19:46:39', '2023-01-04 15:44:05'),
(172, '07889TDR3', 'LUV  90-2003 T7I   VERDE PUERTA', 'T7I   VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 120000, 65000, 3, 3, 1, '', '2022-11-03 20:52:40', '2023-01-04 15:46:01'),
(173, '28170TDR1', 'AVEO SEDAN 2007 D/I  VERDE D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-03 20:54:00', '2023-01-04 15:46:39'),
(174, '59360TDR5', 'D MAX 2015 D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-03 20:58:30', '2023-01-04 15:47:15'),
(175, '210306136', 'AVEO 3 PTAS 2007 D/I  VERDE D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-03 20:59:33', '2023-01-04 15:49:24'),
(176, 'FD3741', 'LUV C/A D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 21:02:32', '2023-01-04 15:47:59'),
(177, '78980TDR1', 'SAIL 2015 D/I  VERDE  PUERTAS', 'D/I  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 21:03:50', '2023-01-04 15:48:35'),
(178, '58370TDR3', 'SPARK GT 2010 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-03 21:15:59', '2023-01-04 15:51:21'),
(179, '54960TDR3', 'CAPTIVA 2006-11 T/I   VERDE  PUERTAS', 'T/I   VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-03 21:17:10', '2023-01-04 15:51:53'),
(180, '58370TDR5', 'SPARK GT 2010 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-04 12:39:29', '2023-01-04 15:52:51'),
(181, '57340TDR3', 'SPARK LT  2005 T/I  VERDE  PUERTAS', 'T/I  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-04 12:40:47', '2023-01-04 18:11:41'),
(182, '20820TDR3', 'SPARK MATIZ 2008-13 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 12:41:58', '2023-01-04 18:13:09'),
(183, '28170', 'AVEO SEDAN 2005 D/I  VERDE D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 12:43:30', '2023-01-04 18:24:16'),
(184, 'F94V', 'HYUNDAI EXCEL   1990-1999 T/D  VERDE  PUERTA', 'T/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 13:58:16', '2023-01-04 18:24:59'),
(185, '10920TDR2', 'HYUNDAI ACCENT 1995-1999 T/D  VERDE PUERTAS', 'T/D  VERDE  PUETAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-04 14:00:08', '2023-01-04 18:32:35'),
(186, '54650', 'NEW ACCENT 2006-2013 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-04 14:02:08', '2023-01-04 18:33:36'),
(187, '4493TDR2', 'ELANTRA SEDAN 90-94 D/D VERDE PUERTA', 'D/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 14:03:32', '2023-01-04 18:34:15'),
(188, '23033TDR2', 'HYUNDAI ACCENT 2005-2013 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 6, 6, 1, '', '2022-11-04 14:04:36', '2023-01-04 18:34:54'),
(189, '87860', 'SANTA FE 2012-  D/D VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 15:35:57', '2023-02-15 15:35:31'),
(190, '5789TDR2', 'TUCSON 2010 D/D VERDE PUERTA', 'D/D   VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 15:36:55', '2023-01-04 18:35:57'),
(191, '23071TDR2', 'SANTA FE  2007- 2012  D/D VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-04 15:38:34', '2023-01-04 18:36:30'),
(192, '26530TDR2', 'ACCENT PRIME 2000-2005 D/D  VERDE PUERTAS', 'D/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 15:39:42', '2023-01-04 18:37:09'),
(193, '10920TDR4', 'HYUDAI ACCENT  HB 1995-1999 D/D  VERDE PUERTA', 'D/D  VERDE   PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 19:53:04', '2023-01-04 18:37:39'),
(194, '13590TDR4', 'HYUNDAI H-1  /H200  1998  D/D VERDE  PUERTAS', 'D/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-04 19:54:26', '2023-01-04 18:38:07'),
(195, '26530TDR4', 'ACCENT PRIME 2000-2005  SEDAN T/D    VERDE  PUERTAS', 'T/D    VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 25000, 1, 1, 1, '', '2022-11-04 19:56:24', '2023-01-04 18:38:37'),
(196, '0870TRD4', 'TUCSON 2015 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 19:57:14', '2023-01-04 18:39:06'),
(197, '27717TDR4', 'ACCENT 2018 SEDAN D/D  VERDE  PUERTA', 'D/D  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-04 19:58:10', '2023-01-04 18:39:37'),
(199, '54650TDR4', 'NEW ACCENT 2006-2013 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-07 13:29:26', '2023-01-04 18:40:49'),
(200, '86510TDR4', 'ACCENT RB 2011   D/D VERDE PUERTAS', 'D/D  VERDE  puertas', 6, 2, 1, NULL, 1, 12000, 65000, 2, 1, NULL, '', '2022-11-07 13:30:51', '2023-03-01 10:42:57'),
(201, '211004181', 'ACCENT RB 2011 HB VERDE D/D VERDE PUERTAS', 'D/D  VERDE  PUERTAS', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-07 13:31:50', '2023-01-04 18:42:24'),
(202, '191217172', 'NEW ACCENT 2006-2013 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-07 13:32:55', '2023-01-04 18:51:27'),
(203, '50690TDR4', 'GETZ 5 PTAS 02-09 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-07 13:34:12', '2023-01-04 18:54:35'),
(204, '87860TDR4', 'SANTA FE 2012 -  T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, 1, '', '2022-11-07 13:35:04', '2023-02-15 15:34:08'),
(205, '23073TDR4', 'SANTA FE  2006- 2012 T/D PRIVACE PUERTAS', 'T/D PRIVACE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 3, 1, 1, '', '2022-11-09 14:19:55', '2023-02-17 10:36:17'),
(206, '2110041710', 'NEW H-1 2007 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 2, 1, 1, '', '2022-11-09 14:20:57', '2023-01-04 19:30:28'),
(207, '210914144', 'NEW H-100  2004 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-09 14:23:20', '2023-01-04 19:30:55'),
(208, '13590TDR4', 'H-100  1998-2003 D/D   VERDE PUERTAS', 'D/D   VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 14:25:20', '2023-01-04 19:31:24'),
(209, '10920TDR1', 'HYUDAI ACCENT 1995-1999 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-11-09 14:34:27', '2023-01-04 19:32:18'),
(210, '210510175', 'ACCENT PRIME 2003 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-09 18:24:29', '2023-01-04 19:33:06'),
(211, '86510TDR1', 'ACCENT RB 2011 HB D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-09 18:25:36', '2023-01-04 19:33:46'),
(212, '27240TDR5', 'HYUNDAI ATOS 1999-2003 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:26:43', '2023-01-04 19:47:01'),
(213, '49760TDR5', 'HYUNDAI GRAN I 10  2013 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:32:52', '2023-01-04 19:47:58'),
(214, '87860TDR1', 'SANTA FE 2013 D/I VERDE  PUERTAS', 'D/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-09 18:33:44', '2023-01-04 19:50:11'),
(215, '0870TDR1', 'TUCSON 2015 D/I VERDE  PUERTAS', 'D/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:34:39', '2023-01-04 19:50:43'),
(216, '23072TDR1', 'SANTA FE 2001-12 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-09 18:36:25', '2023-01-04 19:51:10'),
(217, '23034TDR1', 'ACCENT SEDAN 2006-11 D/I VERDE  PUERTAS', 'D/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:37:34', '2023-01-04 19:52:22'),
(218, '0879TDR1', 'H-100 PORTER 1986-1995 T/I  VERDE PUERTA', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:38:48', '2023-01-04 19:55:05'),
(219, '10920TDR1', 'HYUNDAI ACCENT 1999-2006  SEDAN PRIME  VERDE T/I VERDE PUERTA', 'T/I VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-09 18:39:56', '2023-01-04 19:55:46'),
(220, '26490TDR5', 'HYUNDAI ELANTRA SEDAN 1996-2000 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 3, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:40:54', '2023-01-04 19:56:41'),
(221, '5465TDR1', 'NEW ACCENT 2006-2013 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-09 18:44:28', '2023-01-04 19:57:28'),
(222, '26530TDR1', 'ACCENT PRIME 2000-2005 T/I VERDE  PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:45:37', '2023-01-04 19:58:16'),
(223, '20780TDR5', 'HYUNDAI ELANTRA SEDAN 1996-2000 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:46:35', '2023-01-04 20:04:05'),
(224, '23074TDR1', 'SANTA FE 2007-12 T/I PRIVACE   PUERTAS', 'T/I PRIVACE   PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, NULL, '', '2022-11-09 18:48:04', '2023-02-27 10:28:11'),
(225, '49760TDR5', 'HYUNDAI GRAN I 10  2013 T/I  VERDE PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:48:54', '2023-01-17 19:51:32'),
(226, '86510TDR1', 'ACCENT RB 2011 HB SEDAN T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:50:49', '2023-01-04 20:05:54'),
(227, '87860TDR1', 'SANTA FE 2012-  T/I VERDE  PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:51:35', '2023-02-15 15:31:44'),
(228, '211004174', 'NEW H-1 2007 D/I   VERDE  PUERTAS', 'D/I   VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-09 18:52:41', '2023-01-04 20:36:22'),
(229, '211213290', 'NEW H-100   PORTER   2004 D/I   VERDE', 'D/I   VERDE', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-09 18:55:36', '2022-12-29 20:26:41'),
(230, '13590TDR1', 'H-100  1998-2003 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-09 18:56:40', '2023-01-04 20:36:58'),
(231, '18980TDR1', 'H-1 1998-06 D/I   VERDE PUERTAS', 'D/I   VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:57:29', '2023-01-04 20:37:45'),
(232, '5598TDR1', 'NEW H-1 2007 IZQUIERDO, VERDE , CON DEFROSTER  LUNETAS', 'IZQUIERDO, VERDE , CON DEFROSTER  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 18:59:28', '2023-01-04 20:38:41'),
(233, '5598TDR2', 'NEW H-1 2007 IZQUIERDO, VERDE , CON DEFROSTER  LUNETAS', 'DERECHO, VERDE, CON DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:00:31', '2023-01-04 20:39:12'),
(234, '55980TDR5', 'NEW H-1 2007 MEDIO , IZQUIERDO, CON PERF LATERAL', 'MEDIO , IZQUIERDO, CON PERF LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 129000, 1, 1, 1, '', '2022-11-09 19:04:07', '2023-01-12 14:30:21'),
(235, '5598TDR6', 'NEW H-1 2007 MEDIO, DERECHO VERDE CON PERF LATERAL', 'MEDIO, DERECHO VERDE CON PERF LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:05:08', '2023-01-04 20:45:06'),
(236, '0703123', 'DODGE CARAVAN 1990-1995 MEDIO, DERECHO VERDE CON PERF LATERAL', 'MEDIO, DERECHO VERDE CON PERF LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:12:14', '2023-01-04 20:45:39'),
(237, '2420\'TDR4', 'EXPERT 2017 MEDIO, DERECHO LATERAL', 'MEDIO, DERECHO LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:14:05', '2023-01-04 20:46:15'),
(238, '2420TDR3', 'EXPERT 2017 MEDIO, IZQUIERDO LATERAL', 'MEDIO, IZQUIERDO LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:15:28', '2023-01-04 20:46:50'),
(239, '25070TDR1', 'H-1 1998-06 MEDIO, IZQUIERDO LATERAL', 'DERECHO ,ULTIMO CON PERF LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:17:18', '2023-01-04 20:47:25'),
(240, '5171TDR6', 'MERCEDES VITTO  2003 DERECHO , MEDIO  LATERAL', 'DERECHO , MEDIO  LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:19:15', '2023-01-04 20:47:58'),
(241, '55980TDR5', 'NEW H-1 2008 DERECHO , MEDIO  LATERAL', 'IZQUIERDO , ULTIMO VERDE LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 129000, 1, 1, 1, '', '2022-11-09 19:20:22', '2023-01-12 14:28:41'),
(242, '1898TDR6', 'H-1 JAC-REFINE 1998-2007 ULTIMO , DERECHO LATERAL', 'ULTIMO , DERECHO LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:23:21', '2023-01-06 13:07:02'),
(243, '25070TDR5', 'HYUNDAI H-1 1998-2006 ULTIMO, IZQUIERDO , VERDE LATERAL', 'ULTIMO, IZQUIERDO , VERDE LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:24:42', '2023-01-06 13:08:07'),
(244, '58370TDR6', 'SPARK GT D/D  VERDE ALETAS', 'D/D  VERDE ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:26:35', '2023-01-06 13:08:57'),
(245, 'FV25116', 'HONDA CIVIC SEDAN 2013 T/D  PRIVACE  ALETAS', 'T/D  PRIVACE  ALETAS', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-09 19:28:05', '2023-01-06 13:09:52'),
(246, '10920TDR1', 'ACCENT 1995 1999 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 18:36:17', '2023-01-06 13:10:43'),
(247, '87960TDR2', 'Yaris 2014 D/D VERDE ALETA', 'D/D VERDE', 1, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-10 18:38:50', '2023-01-05 19:20:25'),
(248, '10470TDR2', 'TERCEL  1994-1996 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-10 18:40:39', '2023-01-06 13:11:31'),
(249, '76210TDR2', 'RAV 4 2013-2018 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 18:47:22', '2023-01-06 13:12:19'),
(250, '10830TDR2', 'NEW TERCEL 1995-99 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 18:54:29', '2023-01-06 13:12:56'),
(251, '4089TDR2', 'HILLUX 1989-1995 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 18:55:35', '2023-01-06 13:13:43'),
(252, 'A0770TDR2', 'HILLUX 2015 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 18:56:30', '2023-01-06 13:14:29'),
(253, 'IVS001', 'HILLUX 1998 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 18:58:05', '2023-01-06 13:15:26'),
(254, '16370TDR2', '1989-1991 S/A D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 18:59:14', '2023-01-06 13:16:12'),
(255, '00680TDR2', 'COROLLA XL 1987-1991 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:01:46', '2023-01-06 13:17:08'),
(256, '29940TDR2', '4RUNNER 2002 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:11:56', '2023-01-06 13:17:55'),
(257, '20920TDR2', 'YARIS SEDAN 1998-2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:15:58', '2023-01-06 13:18:42'),
(258, '20920TDR2', 'YARIS SPORT 3 PUERTAS  1998-2005 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:17:02', '2023-01-06 13:19:52'),
(259, '21147', 'RAV 4 1999 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:18:12', '2023-01-06 13:20:40'),
(260, '5242TDR2', 'HILLUX  2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 6, 6, 1, '', '2022-11-10 19:19:04', '2023-01-06 13:21:37'),
(261, '87960TDR2', 'YARIS 2014-2018 D/D  VERDE D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:20:03', '2023-01-06 13:23:33'),
(262, '16370TDR2', 'HILLUX 1989-1991 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:21:09', '2023-01-06 13:24:16'),
(263, '53870TDR2', 'NEW YARIS 2006-2013 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-10 19:22:42', '2023-01-06 13:24:52'),
(264, '21605TDR2', 'COROLLA TDR2 2000-2008 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:24:04', '2023-01-06 13:25:55'),
(265, '191217122', 'RAV 4 2006 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:24:57', '2023-01-06 13:26:55'),
(266, '51760TDR2', 'HIACE 2004 D/D VERDE D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:25:53', '2023-01-06 13:27:35'),
(267, '48270TDR1', 'NEW YARIS 2006-2013 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:26:59', '2023-01-06 13:28:46'),
(268, '32490TDR1', 'YARIS  ECO 1998-2005 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:28:04', '2023-01-06 13:44:59'),
(269, '10830TDR2', 'NEW TERCEL  1995-1999 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:29:43', '2023-01-06 13:45:36'),
(270, '18960TDR2', 'HILLUX 1997 DINAMITA 4 PTAS T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:33:49', '2023-01-06 13:47:21'),
(271, 'A0770TDR2', 'HILLUX 2015 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:35:19', '2023-01-06 13:50:34'),
(272, '53870TDR2', 'YARIS SEDAN 2005-2010 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:36:26', '2023-01-06 13:52:14'),
(273, '10470TDR2', 'TERCEL 1990-1994 T/D  VERDE  PUERTAS', 'T/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:37:38', '2023-01-06 13:53:17'),
(274, 'AT220110291', 'HILLUX 2004 T/D  VERDE  PUERTAS', 'T/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:38:28', '2023-01-06 13:54:24'),
(275, '52810TDR2', 'NEW YARIS 2006-2013 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:39:24', '2023-01-06 13:55:57'),
(276, '20920TDR2', 'YARIS ECO SPORT 1999-2005 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:41:03', '2023-01-06 14:06:30');
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `id_categ`, `id_proveedor`, `id_subcateg`, `impuestos`, `estado`, `precio_costo`, `precio_venta`, `stock`, `stock_min`, `maneja_inventario`, `imagen`, `created_at`, `updated_at`) VALUES
(277, '10380TDR2', 'NEW TERCEL  1995-1999 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-10 19:42:18', '2023-01-06 14:07:26'),
(278, '53870TDR2', 'NEW YARIS 2006-2013 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-10 19:43:37', '2023-01-06 14:12:01'),
(279, '56940TDR4', 'HYUNDAI I 10 2008 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-11 12:24:00', '2023-01-06 14:13:04'),
(280, '57250tdr3', 'PEUGEOT BOXER 2007 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-11 18:38:23', '2023-01-06 14:13:40'),
(281, '02020', 'MITSUBUSHI PAJERO 1999 T/D  VERDE  PUERTAS', 'T/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 15:20:45', '2023-01-06 14:14:32'),
(282, '54270TDR4', 'L 200  2006T/D PRIVACE PUERTAS', 'T/D PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 15:23:29', '2023-01-06 14:15:23'),
(283, '2396TDR4', 'L 200 1996 - 2004 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 15:25:37', '2023-01-06 14:16:06'),
(284, '54270TDR4', 'L 200  2006 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-15 15:32:06', '2023-01-06 14:28:56'),
(285, '54270TDR4', 'L 200  2006 T/D PRIVACE PUERTAS', 'T/D PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 15:33:11', '2023-01-06 14:29:34'),
(286, 'A760TDR4', 'L 200 2015 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 15:35:03', '2023-01-06 14:30:20'),
(287, '01940TDR4', 'L 300  86-94 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 15:36:12', '2023-01-06 14:30:56'),
(288, '18380TDR2', 'PAJERO 1995-1998 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 15:37:31', '2023-01-06 14:32:05'),
(289, '54270TDR2', 'L 200  2006 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 6, 6, 1, '', '2022-11-15 15:38:25', '2023-01-06 14:33:29'),
(290, 'A0760TDR2', 'L 200 2015 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 15:39:44', '2023-01-06 14:36:09'),
(291, '130320033TDR2', 'L 200 1987-1997 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 15:45:24', '2023-01-06 14:36:55'),
(292, '0202TDR2', 'MONTERO SPORT 3 Y 5 PTAS D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 15:47:32', '2023-01-06 14:37:34'),
(293, 'A0760TDR3', 'L 200 2015 T/I  PRIVACE PUERTAS', 'T/I  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 95000, 1, 1, 1, '', '2022-11-15 18:04:12', '2023-01-06 14:46:55'),
(294, 'A0760TDR3', 'L 200 2015 T/I  PRIVACE PUERTAS', 'T/I  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-11-15 18:07:20', '2023-01-06 14:47:37'),
(295, '54270TDR3', 'L 200  2006 T/I  PRIVACE PUERTAS', 'T/I  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:09:43', '2023-01-06 14:48:25'),
(296, '54270TDR3', 'L 200  2006 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 10, 11, NULL, '', '2022-11-15 18:21:22', '2023-03-01 10:58:15'),
(298, 'A0760TDR1', 'L 200 2015 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 18:25:46', '2023-01-06 15:03:36'),
(299, '23960TRD1', 'L 200 99-2005 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 18:26:47', '2023-01-06 15:04:25'),
(300, '2200110295TDR1', 'L 200  2006 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 18:34:40', '2023-01-06 15:05:29'),
(301, '24660TDR4', 'RIO 4 SEDAN 2000-05 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:38:11', '2023-01-06 15:06:07'),
(302, '5966BTDR4', 'RIOS HB 2011-2017 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 3, 1, '', '2022-11-15 18:39:27', '2023-01-06 15:06:59'),
(303, '0410TDR4', 'KIA SOUL 2014 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:43:07', '2023-01-06 15:08:47'),
(304, '58970TDR4', 'KIA MORNING 2011 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:44:06', '2023-01-06 15:14:51'),
(305, '63500TDR4', 'SPORTAGE 2004-2010 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 18:44:42', '2023-01-06 15:15:32'),
(306, '5398TDR4', 'KIA RIO JB SEDAN 2006 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:46:19', '2023-01-06 15:16:19'),
(307, '24477TDR4', 'SORENTO 2011 T/D  PRIVACE PUERTAS', 'T/D  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:47:32', '2023-01-06 15:31:25'),
(308, '59660TDR2', 'KIA RIO  4  2012 SEDAN D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 1, 1, '', '2022-11-15 18:48:14', '2023-01-06 15:32:13'),
(309, '1960TDR2', 'KIA RIO 5 2017 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 18:49:24', '2023-01-06 15:32:49'),
(310, '220228469TDR2', 'KIA BESTA ULTRA 96 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 18:50:12', '2023-01-06 15:33:35'),
(311, '51380TDR2', 'MORNING 2004 2010 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:51:07', '2023-01-06 15:47:07'),
(312, '211213140TDR2', 'MORNING 2012 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:54:23', '2023-01-06 15:51:49'),
(313, '51390TDR2', 'CERATO 2004 - 2009  D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 18:55:14', '2023-01-06 15:52:30'),
(314, '63500TDR2', 'SPORTAGE 2004-2010 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:56:01', '2023-01-06 15:55:15'),
(315, '0180TDR2', 'SORENTO 2014 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 18:56:42', '2023-01-06 15:55:47'),
(317, '5829TDR2', 'NEW SPORTAGE 2011-2015 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:00:24', '2023-01-06 18:23:16'),
(318, 'A0410TDR2', 'SOUL HB  2014 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:01:31', '2023-01-06 18:24:01'),
(319, '64720TDR2', 'KIA CERATO  SEDAN 2013  EN ADELANTE D/D  VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:02:39', '2023-01-06 18:24:53'),
(320, '64720TDR2', 'KIA CERATO  SEDAN 2013  EN ADELANTE D/D  VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:05:09', '2023-01-06 18:25:34'),
(321, 'FD22825TDR2', 'KIA RIO JB SEDAN 2006- 2011D/D  VERDE D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:06:49', '2023-01-06 18:26:05'),
(322, '59660TDR1', 'KIA RIO  4 Y 5 HB  2011 D/I  VERDE D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 19:08:54', '2023-01-06 18:26:36'),
(323, 'FD22826TDR1', 'KIA RIO JB SEDAN 2006- 2011 D/I VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:09:57', '2023-01-06 18:28:50'),
(324, '58970TDR3', 'KIA MORNING 2011 T/I VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:10:45', '2023-01-06 18:30:02'),
(325, 'F1960TDR1', 'KIA RIO 5 2017 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:11:37', '2023-01-06 18:43:35'),
(326, '6427TDR1', 'CERATO  2009 EN ADELANTE D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2022-11-15 19:12:32', '2023-01-06 18:44:20'),
(327, '53980TDR3', 'KIA RIO JB SEDAN 2006 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:13:23', '2023-01-06 18:45:41'),
(328, '12980TDR1', 'KIA BESTA ULTRA 98-2006 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 0, 1, 1, '', '2022-11-15 19:14:03', '2023-01-10 20:47:18'),
(329, '63500TDR3', 'SPORTAGE 2004-2010 T/I  VERDE PUERTA', 'T/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:15:15', '2023-01-06 18:56:37'),
(330, '24660TDR3', 'KIA RIO SEDAN 2000-2005 T/I  VERDE PUERTA', 'T/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:16:31', '2023-01-06 18:57:12'),
(331, '24660TDR1', 'KIA RIO SEDAN 2000-2005 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:17:11', '2023-01-06 18:57:50'),
(332, '58970TDR1', 'KIA MORNING 2011 D/I VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:17:55', '2023-01-06 18:58:30'),
(333, '5966TDR3', 'KIA RIO 5   HB 2011 2017 T/I  VERDE PUERTA', 'T/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:18:57', '2023-01-06 18:58:59'),
(336, '63500TDR1', 'SPORTAGE 2004-2010 D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:21:04', '2023-01-06 18:59:33'),
(337, '63500TDR3', 'SPORTAGE 2004-2010 T/I VERDE  PUERTA', 'T/I VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:21:35', '2023-01-06 19:00:13'),
(338, '211213294TDR2', 'TIIDA 200 EN ADELANTE D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:22:34', '2023-01-06 19:16:20'),
(339, '211117103TDR2', 'NAVARA 2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 19:24:04', '2023-01-06 19:16:58'),
(340, '55210TDR2', 'NISSAN QASHQAI  2007 - 2013 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:25:20', '2023-01-06 19:17:37'),
(341, '8871TRD2', 'NISSAN QASHQAI  2014 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 19:26:16', '2023-01-06 19:18:12'),
(342, '210927125TDR2', 'NISSAN D 21 85-97 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:27:30', '2023-01-06 19:18:53'),
(343, '01420TDR2', 'NISSAN SUNNY 90-94 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:28:51', '2023-01-06 19:27:58'),
(344, '5575TDR2', 'X-TRAIL2007-2013 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:29:49', '2023-01-06 19:40:03'),
(345, '20690TDR2', 'D 22 D/D  PRIVACE  PUERTAS', 'D/D  PRIVACE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-15 19:32:45', '2023-01-06 19:40:42'),
(346, '26640TDR4', 'SAMSUNG SM3 T/D VERDE  PUERTA', 'T/D VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 19:34:06', '2023-01-06 19:41:43'),
(347, '5258TDR4', 'TIIDA 2008 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:34:46', '2023-01-06 19:43:32'),
(348, '5521TDR4', 'NISSAN QASHQAI  2007 - 2013 T/D  VERDE PUERTA', 'T/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:35:28', '2023-01-06 19:44:17'),
(349, '22458TDR2', 'NAVARA 2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:36:41', '2023-01-06 19:45:21'),
(350, '01420TDR2', 'NISSAN V 16 SEDAN D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:37:47', '2023-01-06 19:46:15'),
(351, '52580TDR4', 'TIIDA 2009 2012 T/D VERDE  PUERTAS', 'T/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:39:26', '2023-01-06 19:48:08'),
(352, '28270TDR4', 'X-TRAIL2007-2013 T/D VERDE  PUERTAS', 'T/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:40:33', '2023-01-06 19:48:47'),
(353, 'A1080TDR4', 'NP 300  2015 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:41:56', '2023-01-10 21:04:44'),
(354, 'A1080TDR4', 'NP300  2015 T/D  PRIVACE PUERTAS', 'T/D  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:42:38', '2023-01-06 19:50:21'),
(355, '8871TDR4', 'NISSAN QASHQAI  2014 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 3, 1, NULL, '', '2022-11-15 19:51:13', '2023-02-22 09:52:58'),
(356, '55210TDR4', 'NISSAN QASHQAI  2007 - 2013 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:52:15', '2023-01-06 19:52:53'),
(357, '5183TDR1', 'MEGANE 2002-2008 D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 19:53:21', '2023-01-06 19:54:57'),
(358, '2456TDR2', 'CLIO II  1998 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 0, 1, 1, '', '2022-11-15 19:55:25', '2023-01-10 21:33:20'),
(359, '2456TDR4', 'CLIO II  1998 T/D  VERDE PUERTA', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:57:23', '2023-01-06 19:56:53'),
(360, '0106075TDR2', 'MEGANE 2002-2008 D/D VERDE PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:58:31', '2023-01-06 19:57:46'),
(361, '2494TDR3', 'CLIO II  1998 T/I  VERDE  PUERTA', 'T/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 19:59:14', '2023-01-06 19:58:26'),
(362, '30599TDR1', 'RENAULT 5 90-98  D/I  VERDE  PUERTA', 'D/I  VERDE  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 20:00:09', '2023-01-06 20:00:34'),
(363, '33260TDR3', 'RENAULT 2009-11 T/I VERDE  PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:01:28', '2023-01-06 20:01:25'),
(364, '2456TDR1', 'CLIO II  1998 D/I VERDE D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:02:18', '2023-01-06 20:02:10'),
(365, '26010TDR4', 'OPEL ASTRA SEDAN 1998- 2004 T/D  VERDE  PUERTAS', 'T/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 20:04:00', '2023-01-06 20:03:04'),
(366, '06440TDR4', 'CORSA 4 PTAS Y 5 2002-08 T/D VERDE  PUERTAS', 'T/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 20:05:03', '2023-01-06 20:04:20'),
(367, '0390TDR4', 'LUNETA COMBO I 93-02 T/D VERDE  LUNETAS', 'T/D VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-15 20:07:13', '2023-01-06 20:05:03'),
(368, '50870TDR4', 'LUNETA COMBOII T/D VERDE LUNETAS', 'T/D VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:07:54', '2023-01-06 20:05:48'),
(369, '10120TDR4', 'ASTRA 1991- 1999 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 20:08:34', '2023-01-06 20:18:02'),
(370, '27650TDR4', 'CORSA EVOLUTION HB 2000-2006 T/D VERDE  PUERTAS', 'T/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:09:33', '2023-01-06 20:19:18'),
(371, '039000TDR2', 'OP CORSA HB  3  PUERTAS  1993-2000 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 20:10:14', '2023-01-06 20:20:20'),
(372, '210818266TDR2', 'CORSA SEDAN 90 2002 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 20:11:03', '2023-01-06 20:21:00'),
(373, '27650TDR2', 'CORSA EVOLUTION HB 2000-2006 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-15 20:13:30', '2023-01-06 20:21:34'),
(374, '50870TDR2', 'COMBO II  2001 2011 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 20:14:30', '2023-01-06 20:23:16'),
(375, '26210TDR2', 'VECTRA 1995 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 20:16:43', '2023-01-06 20:24:17'),
(376, '59500TDR2', 'FORD RANGER/BT50 2017 D/D VERDE PUERTA', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 20:44:10', '2023-01-07 13:08:28'),
(377, '59500TDR4', 'FORD RANGER/BT50 2017 T/D VERDE PUERTA', 'T/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 5, 1, '', '2022-11-15 20:45:30', '2023-01-10 20:45:21'),
(378, '59500TDR4', 'FORD RANGER/BT50 2017 T/D PRIVACE PUERTA', 'T/D PRIVACE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 20:47:03', '2023-01-07 13:09:40'),
(379, '11866TDR2', 'FORD FOCUS 2012 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:47:58', '2023-01-07 13:10:34'),
(380, '9286TDR2', 'FORD RANGER (ARGENTINA)D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:50:12', '2023-01-07 13:13:13'),
(381, '11866TDR5', 'FORD FOCUS 2012 T/I  PRIVACE PUERTAS', 'T/I  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:51:41', '2023-01-07 13:12:38'),
(382, '9287TDR1', 'FORD RANGER /ARGENTINA D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:53:24', '2023-01-07 13:13:53'),
(383, '11866TDR1', 'FORD FOCUS 2012 D/I  VERDE  PUERTAS', 'D/I  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:56:19', '2023-01-07 13:14:24'),
(384, '180812214TDR1', 'VOLK GOL SEDAN 2008 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:57:35', '2023-01-07 13:14:53'),
(385, '14680TDR2', 'VITARA 3 PTAS  89/97 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 20:58:59', '2023-01-07 13:15:22'),
(386, '210619042TDR2', 'VITARA 3 PTAS  97-2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-15 21:00:13', '2023-01-07 13:15:55'),
(387, '19620TDR4', 'ALTO  .98-2004 T/D  VERDE  PUERTAS', 'T/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-15 21:01:37', '2023-01-07 13:16:30'),
(388, '19380TDR4', 'GRAN NOMADE 97-2005 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:04:22', '2023-01-07 13:17:00'),
(389, '19380TDR4', 'GRAN NOMADE 2005-2014 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:06:34', '2023-01-07 13:17:33'),
(390, '171031052', 'VITARA 2008 3 PTAS LATERAL/DERECHO LATERAL', 'LATERAL/DERECHO LATERAL', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:07:34', '2023-01-07 13:18:10'),
(391, '84050TDR4', 'SUZUKI CELERIO 2009-2014 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:08:38', '2023-01-07 13:18:43'),
(392, '131107530TDR4', 'BALENO 97-2002 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:09:46', '2023-01-07 13:19:24'),
(393, '9322TDR2', 'VITARA 3 PTAS  89/97 LATERAL /DERECHO', 'LATERAL /DERECHO', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:10:59', '2023-01-07 13:19:50'),
(394, '120328165TDR2', 'CAMRY 86-99 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:12:05', '2023-01-07 13:20:21'),
(395, '220403329TDR2', 'SUZUKI SWIFT  HB  SEDAN 2004-2010 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-15 21:13:17', '2023-01-07 13:20:51'),
(396, '54340TDR2', 'SX4 HB 2006-2012 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 12:36:15', '2023-01-07 13:21:29'),
(397, '210910169TDR2', 'SUZUKI SWIFT  HB  SEDAN 2011 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-16 12:37:22', '2023-01-07 13:21:57'),
(398, '53340TDR2', 'GRAN NOMADE 2005-2014 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 12:38:55', '2023-01-07 13:22:25'),
(399, '53340TDR2', 'NEW ALTO 98-2004 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 12:39:50', '2023-01-07 13:23:00'),
(400, '5334TDR1', 'GRAN VITARA 3 PTAS 2006 LATERAL IZQUIERDO', 'LATERAL/IZQUIERDO', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 12:42:15', '2023-01-07 13:23:51'),
(401, '1930TDR2', 'NEW BALENO 2016 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-16 12:43:54', '2023-01-07 13:24:20'),
(402, '53340TDR2', 'VITARA GRAN NOMADE 2005 D/D VERDE PUERTA', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 12:48:08', '2023-01-07 13:24:52'),
(403, '05350', 'SUZUKI NEW ALTO 800 2012   HB D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 1, 1, '', '2022-11-16 13:04:29', '2023-01-07 13:25:27'),
(404, '14540TDR2', 'BALENO 97-2002 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 13:07:22', '2023-01-07 13:25:59'),
(405, '1938TDR1', 'GRAN NOMADE 97-2005LATERAL / IZQUIERDO', 'LATERAL / IZQUIERDO', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 13:08:35', '2023-01-07 13:26:26'),
(406, '160325227TDR1', 'VITARA 3 PTAS  89/97 LATERAL/IZQUIERDO  CON PERFORACION', 'LATERAL/IZQUIERDO  CON PERFORACION', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 13:10:09', '2023-01-07 13:26:51'),
(407, '3923TDR1', 'VITARA 3 PTAS  89/97 LATERAL / IZQUIERDO SIN PERFORACION', 'LATERAL / IZQUIERDO SIN PERFORACION', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 13:13:23', '2023-01-07 13:28:07'),
(408, '11010TDR4', 'VITARA 3 PTAS  89/97 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-16 13:14:14', '2023-01-07 13:28:38'),
(409, '19380TDR5', 'GRAN VITARA 1998-2002 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 14:07:45', '2023-01-07 13:29:09'),
(410, '19620TDR1', 'SUZUKI ALTO 1998-2004 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 14:08:46', '2023-01-07 13:30:08'),
(411, '210817136TDR1', 'GRAN NOMADE 2005-2014 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 14:11:43', '2023-01-07 13:30:37'),
(412, '200606247TDR1', 'SUZUKI SWIFT  HB  SEDAN 2011 D/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 14:13:10', '2023-02-15 12:23:19'),
(413, '53340TDR5', 'VITARA GRAN NOMADE 2005 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 14:14:18', '2023-01-07 13:31:36'),
(414, '14680DR1', 'VITARA 3 PTAS  89/97 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 14:16:05', '2023-01-07 13:32:11'),
(415, '14540TDR5', 'SUZUKI BALENO SEDAN 1995-1999 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 14:17:10', '2023-01-07 13:32:38'),
(416, '19380TDR4', 'GRAN VITARA 1998-2002 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 14:18:09', '2023-01-07 13:33:13'),
(417, '27650TDR4', 'OP CORSA HB 1993-2000 T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-17 18:06:55', '2023-01-07 13:34:04'),
(418, '06440TDR4', 'OP CORSA HB 1993-2000 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-17 18:09:54', '2023-01-07 13:34:47'),
(419, '211213274TDR1', 'CORSA SEDAN 90 2002 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-17 18:17:17', '2023-01-07 13:35:23'),
(420, '50870TDR5', 'LUNETA COMBOII  2001 L/I VERDE LUNETAS', 'L/I VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 65000, 4, 4, 1, '', '2022-11-17 18:18:42', '2023-01-07 13:35:52'),
(421, '27650TDR1', 'CORSA EVOLUTION HB 2000-2006 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 18:20:58', '2023-01-07 13:36:26'),
(422, '1021135TDR5', 'VECTRA 1995 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 18:21:46', '2023-01-07 13:36:55'),
(423, '30770TDR1', 'ASTRA G 1998 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 18:23:37', '2023-01-07 13:38:24'),
(424, '27650TDR5', 'CORSA EVOLUTION HB 2000-2006 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 0, 1, NULL, '', '2022-11-17 18:25:05', '2023-03-02 09:47:03'),
(425, '10120TDR5', 'ASTRA 1991- 1999 T/I VERDE  PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 18:30:57', '2023-01-07 13:39:23'),
(426, '03900TDR1', 'OP CORSA HB  3  PUERTAS  1993-2000 LATERAL IZQUIERDO', 'LATERAL IZQUIERDO', 5, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 18:32:57', '2023-01-07 13:40:09'),
(427, '03900TDR1', 'OP CORSA HB 1993-2000 D/I PRIVACE PUERTAS', 'D/I PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-17 18:36:36', '2023-01-07 13:40:46'),
(428, '06440TRD5', 'CORSA 4 PTAS Y 5 2000-08 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-17 18:37:54', '2023-01-07 13:41:22'),
(429, '5447TDR2', 'GOL-SAVEIRO 1994-2005 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 14:25:46', '2023-01-07 14:12:05'),
(430, '4734TDR2', 'GOLF SEDAN  A3  1991-99 D/D VERDE  PUERTAS', 'D/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 15:19:58', '2023-01-07 14:12:37'),
(431, '200406196TDR2', 'AMAROK 2010 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 18:24:00', '2023-01-07 14:13:04'),
(432, '58790TDR5', 'AMAROK 2010 T/I  PRIVACE PUERTAS', 'T/I  PRIVACE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 18:25:15', '2023-01-07 14:33:12'),
(434, '200406196TDR2', 'AMAROK 2010 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 18:37:59', '2023-01-07 14:34:06'),
(435, '59500TDR4', 'FORD BT 50 2011 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 5, 5, 1, '', '2022-11-18 18:40:27', '2023-01-07 14:34:36'),
(436, '59500TDR4', 'FORD BT 50 2011 T/D  PRIVACE  PUERTAS', 'T/D  PRIVACE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 18:42:59', '2023-01-07 14:35:06'),
(438, '58790TDR4', 'AMAROK 2011 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:00:52', '2023-01-07 14:35:55'),
(439, '58790TDR5', 'AMAROK 2010 Ti VERDE PUERTAS', 'Ti VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 19:03:10', '2023-01-07 14:39:05'),
(443, '59500TDR2', 'FORD RANGER/BT50 2010 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 19:22:10', '2023-01-07 14:40:06'),
(444, '30740TDR4', 'RANGER TAILENDESA B2500-BT50-   2009 T/D VERDE  PUERTAS', 'T/D VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 12000, 3, 3, 1, '', '2022-11-18 19:25:11', '2023-01-07 14:41:09'),
(445, '30740TDR2', 'RANGER TAILENDESA B2500-BT50-   2009 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:27:17', '2023-01-09 12:32:33'),
(446, '05570TDR5', 'RANGER ARGENTINA 2006 T/I VERDE PUERTAS', 'T/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:33:50', '2023-01-09 12:33:03'),
(447, '29170TDR5', 'MAZDA 626 2002 T/I  VERDE T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:35:08', '2023-01-09 12:33:36'),
(448, '59500TDR5', 'FORD BT 50 2011 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-11-18 19:36:50', '2023-01-09 12:34:11'),
(449, '59500TDR5', 'FORD RANGER/BT50 2010 T/I  PRIVACE  PUERTAS', 'T/I  PRIVACE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 19:37:50', '2023-01-09 12:34:42'),
(451, '200613130TDR1', 'AMAROK 2011 D/I   VERDE  PUERTAS', 'D/I   VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:41:05', '2023-01-09 12:35:16'),
(452, '06330TDR5', 'MAZDA FAMILY 89-94 T/I VERDE PUERTAS', 'T/I VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:41:59', '2023-01-09 12:35:57'),
(453, '9287TDR1', 'RANGER 98-2002 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 19:47:10', '2023-01-09 12:37:14'),
(454, '30740TDR1', 'RANGER TAILANDESA 98 D/I   VERDE PUERTAS', 'D/I   VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:48:07', '2023-01-09 12:37:48'),
(455, '59500TDR1', 'NEW BT 50 2010 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:49:51', '2023-01-09 12:38:40'),
(456, '30740TDR5', 'RANGER TAILANDESA 98 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:50:47', '2023-01-09 12:39:06'),
(457, '5447TDR2', 'GOL-SAVEIRO 1994-2005 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:51:41', '2023-01-09 12:39:35'),
(458, '2695TDR1', 'FORD FIESTA HB  1996 D/I   VERDE PUERTAS', 'D/I   VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:52:58', '2023-01-09 12:43:04'),
(459, '57720TDR2', 'VOLK GOL SEDAN - SAVEIRO 2008 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:55:21', '2023-01-09 12:45:38'),
(460, '4470TDR1', 'VOLK GOL SEDAN - SAVEIRO 2008 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:56:42', '2023-01-09 12:46:38'),
(461, '783TDR1', 'HONDA INEGRA   1994-1998 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-18 19:57:44', '2023-01-09 12:47:34'),
(462, '10076TDR5', 'RAM 1500-2500-3500   AÑO 2002 T/I  VERDE PUERTAS', 'T/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-18 19:58:49', '2023-01-09 12:48:40'),
(463, 'O760', 'L 200 2015 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 12:51:22', '2023-01-09 12:50:25'),
(464, '0760', 'L 200 2015 PRIVACE  LUNETAS', 'PRIVACE  LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 1, 2, NULL, '', '2022-11-23 12:52:54', '2023-02-20 15:20:29'),
(465, '54270', 'L 200  2006 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 5, 2, 1, '', '2022-11-23 12:55:49', '2023-01-09 13:41:10'),
(466, '54270', 'L 200  2006 PRIVACE  LUNETAS', 'PRIVACE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 12:57:03', '2023-01-09 13:42:12'),
(467, '58790', 'AMAROK 2010 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:01:14', '2023-01-09 13:43:14'),
(468, '58790', 'AMAROK 2011 PRIVACE LUNETAS', 'PRIVACE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 13:03:48', '2023-01-09 13:47:20'),
(469, '02030', 'L 200 89-2005 VERDE   LUNETAS SIN DEFRONSTER', 'VERDE   LUNETAS SIN DEFRONSTER', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:05:21', '2023-01-09 13:48:24'),
(470, '20690', 'D 22   2006 VERDE LUNETAS', NULL, 7, 2, 1, NULL, 1, 35000, 140000, 2, 2, NULL, '', '2022-11-23 13:06:42', '2023-02-24 09:57:29'),
(471, '0770', 'HILLUX 2015 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:07:33', '2023-01-09 14:24:20'),
(472, '52420', 'HILLUX  2005 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 5, 5, 1, '', '2022-11-23 13:09:34', '2023-01-09 14:25:26'),
(473, 'LN106RW', 'HILLUX 1989-1995   DINAMITA VERDE SIN  DEFROSTER LUNETAS', 'VERDE SIN  DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:10:47', '2023-01-09 14:26:21'),
(474, '22478', 'NISSAN NAVARA  2006 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 145000, 2, 2, 1, '', '2022-11-23 13:11:44', '2023-01-09 14:27:30'),
(476, '0770', 'HILLUX 2015 PRIVACE LUNETAS', 'PRIVACE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:13:31', '2023-01-09 14:28:27'),
(477, '52430', 'D MAX 2004-2013 VERDE SIN DEFROSTER  LUNETAS', 'VERDE SIN DEFROSTER  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 13:17:32', '2023-01-09 14:32:31'),
(478, '52430', 'D MAX 2004-2013 VERDE SIN DEFROSTER  LUNETAS', 'VERDE LUNETA SIN DEFROSTER', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:18:30', '2023-01-09 14:34:32'),
(479, '07880', 'HILLUX 1998 VERDE SIN DEFROSTER  LUNETAS', 'VERDE SIN DEFROSTER  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:20:47', '2023-01-09 14:38:45'),
(480, '210812373', 'NP 300  2015 VERDE SIN DEFROSTER  LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:22:33', '2023-01-09 14:39:50'),
(481, '210812373', 'NP 300  2015 PRIVACE LUNETAS', 'PRIVACE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:24:07', '2023-01-09 14:41:44'),
(482, '12451', 'COLORADO 2015 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:25:50', '2023-01-09 14:45:30'),
(483, '1210', 'MAHINDRA 2010 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:33:10', '2023-01-09 14:46:38'),
(486, '210521100', 'ACTYON 2004-2008 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 1, 1, NULL, '', '2022-11-23 13:35:20', '2023-03-01 16:06:47'),
(487, '12275', 'SILVERADO GMC  2014 PRIVACE  LUNETAS', 'PRIVACE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:37:11', '2023-01-09 14:48:32'),
(488, '21090210', 'H-1  98/2006 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 0, 2, 1, '', '2022-11-23 13:40:06', '2023-02-11 10:21:27'),
(489, '5598', 'NEW H-1 2007 VERDE SIN PERFORACION LUNETAS', 'VERDE SIN PERFORACION LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 0, 1, NULL, '', '2022-11-23 13:40:59', '2023-02-27 11:03:13'),
(490, '5598', 'NEW H-1 2007 VERDE CON PERFORACION LUNETAS', 'VERDE CON PERFORACION LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 0, 1, NULL, '', '2022-11-23 13:41:45', '2023-02-27 10:57:54'),
(491, '2570', 'MAXUS T 60 2011 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, NULL, 1, 35000, 149000, 3, 1, NULL, '', '2022-11-23 13:43:15', '2023-03-02 11:02:44'),
(492, '191211009', 'NISSAN QASHQAI  2007 - 2013 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:45:32', '2023-01-09 15:20:29'),
(493, '5772', 'VOLK GOL /VOYAGE 08 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:46:26', '2023-01-09 15:21:19'),
(494, '33050', 'N 300  2008 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:47:26', '2023-01-09 15:21:59'),
(495, '8831', 'PEUGEOT   308  2015 PRIVAGE LUNETAS', 'PRIVAGE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:48:26', '2023-01-09 15:22:39'),
(496, '210813063', 'HYUNDAI GETZ 2002 -2009 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:49:35', '2023-01-09 15:23:21'),
(497, '220118098', 'NEW YARIS SPORT   2006 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 13:50:39', '2023-01-09 15:25:07'),
(498, '19260', 'SUZUKI NEW ALTO 800 2004-2014  EN GOMA VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:52:29', '2023-01-09 15:25:51'),
(500, '28169', 'NISSAN VERSA 2020 VERDE CON DEFROSTER  LUNETAS', 'VERDE CON DEFROSTER  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:55:12', '2023-01-09 15:26:37'),
(501, 'A051', 'SUZUKI CELERIO 2015 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 13:57:50', '2023-01-09 15:28:11'),
(502, '46790', 'MERCEDES BENZ CLASSIC 2013 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 13:59:34', '2023-01-09 15:29:02'),
(503, '14730', 'SUZUKI SWIFT SEDAN1989-1995 3 PUERTAS VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:00:59', '2023-01-09 15:30:02'),
(504, '1200', 'ALTO K 10   2014  PEGADO VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 14:03:31', '2023-01-09 15:30:49'),
(505, '84050', 'SUZUKI CELERIO 2011 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:04:30', '2023-01-09 15:31:31'),
(506, '1002', 'SUZUKI ALTO 1998-2004  EN GOMA VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:06:12', '2023-01-09 15:32:49'),
(507, '28730', 'SUZUKI  SWIFT 3 PUERTAS  2000-2004 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:07:49', '2023-01-09 15:33:36'),
(508, '10020', 'MARUTI ANTIGUO 1984-1988 VERDE SIN DEFROSTER LUNETAS', 'VERDE SIN DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:09:39', '2023-01-09 15:34:43'),
(509, '22865', 'SUZUKI VITARA  2005 VERDE CON PERFORACION LUNETAS', 'VERDE CON PERFORACION LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:10:56', '2023-01-09 15:35:29'),
(510, '19380', 'VITARA  1999-2005 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:12:03', '2023-01-09 15:36:17'),
(511, '3984', 'VITARA 3 PUERTAS  1989-1998 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:12:59', '2023-01-09 15:36:57'),
(512, '|905', 'CARRY  4 PTAS 1993 RN GOMA VERDE  SIN DEFROSTER LUNETAS', 'VERDE  SIN DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:15:33', '2023-01-09 15:37:37'),
(513, '32720', 'CHEVROLET CORSA 4 PTAS 1993 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 14:16:40', '2023-01-09 15:38:14'),
(514, '27410', 'CORSA HB 1993 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 4, 4, 1, '', '2022-11-23 14:17:41', '2023-01-09 15:38:49'),
(515, '0390', 'CORSA SWING 3 PTAS VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 5, 6, 1, '', '2022-11-23 14:18:33', '2023-01-09 15:39:26'),
(516, '2621', 'OPEL  VECTRA 1995 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:22:17', '2023-01-09 15:40:13'),
(517, '27650', 'CORSA EVOLUTION HB 2000-2006 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:22:58', '2023-01-09 15:40:55'),
(519, '10120', 'OPEL ASTRA SEDAN    1991-1998 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:24:42', '2023-01-09 15:41:39'),
(520, '2817', 'CHEVROLET AVEO 3P Y 5 P  2004-2009 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:26:12', '2023-01-03 13:03:48'),
(521, '58370', 'CHEVROLET SPARK GT   2013 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 1, 1, '', '2022-11-23 14:27:18', '2023-01-05 15:33:47'),
(522, '6341', 'CRUZE HB  2008-2016 LUNETA', 'VERDE CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:28:49', '2023-01-05 15:34:14'),
(524, '25774', 'KIA SORENTO 2011 LUNETA PRIVACE', 'PRIVACE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:35:58', '2023-01-05 15:35:21'),
(525, '51380', 'MORNING 2004-2010 LUNETA CON/PERF', 'VERDE CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:36:51', '2023-01-03 14:30:11'),
(526, '58970', 'MORNING 2011-2016 LUNETA CON PERF', 'VERDE CON PERFORACION', 7, 2, 1, NULL, 1, 35000, 140000, 2, 3, 1, '', '2022-11-23 14:38:16', '2023-02-15 15:19:19'),
(527, '5398', 'KIA RIO 5 2006 2015 HB LUNETA CON PERF', 'VERDE CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:39:24', '2023-01-05 15:43:02'),
(528, '2466', 'RIO JB 5 SEDAN  2000 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:40:36', '2023-01-05 15:43:34'),
(529, '5966', 'KIA RIO HB 5  2012-2016 LUNETA C/PERF', 'VERDE  CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:42:14', '2023-01-03 13:05:39'),
(530, '1220', 'NEW SPORTAGE 2016 LUNETA VERDE CON PERF', 'VERDE  CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:43:38', '2023-01-05 15:46:10'),
(531, '5398', 'KIA RIO 4 HB Y JB 2005-2011 LUNETA VERDE', 'VERDE', 7, 2, 1, NULL, 1, 35000, 140000, 1, 1, NULL, '', '2022-11-23 14:46:46', '2023-03-01 09:17:54'),
(532, '55130', 'KIA CARENS 2004  LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 14:49:24', '2023-01-05 18:16:20'),
(533, '08790', 'H-100 PORTER 1986-1995 LUNETA C/DEF', 'VERDE CON DEFROSTER', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:51:25', '2023-01-05 18:20:05'),
(534, '08790', 'H-100 PORTER 1986-1995 LUNETA S/DEF', 'VERDE  SIN DEFROSTER', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:53:18', '2023-01-05 18:20:30'),
(535, '220120043', 'NEW ACCENT 2006-2013 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 14:58:12', '2023-01-05 18:27:19'),
(536, '25245', 'NEW ACCENT RB 2011 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 1, 1, '', '2022-11-23 15:00:30', '2023-01-05 18:28:38'),
(537, '53870', 'NEW YARIS 2006-2013 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 5, 5, 1, '', '2022-11-23 15:07:40', '2023-01-05 18:29:08'),
(538, '32490', 'YARIS ECCO 1999-2005 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 15:22:00', '2023-01-05 19:05:20'),
(539, '11760', 'COROLLA TDR2 2000-2008 LUNETA', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 15:23:13', '2023-01-05 19:19:28'),
(540, '87960', 'Yaris 2014  SEDAN LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 15:25:11', '2023-01-05 19:21:15'),
(541, '21155', 'TOYOTA RAV 4 2001-2005 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 15:33:47', '2023-01-09 15:42:51'),
(542, '20920', 'YARIS SPORT 3 PUERTAS  1998-2005 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 5, 5, 1, '', '2022-11-23 15:35:35', '2023-01-09 15:43:33'),
(543, '50500', 'OPTRA 2002-08 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 15:36:55', '2023-01-05 19:17:10'),
(544, '1930', 'NEW BALENO HB 2015 PRIVACE CON PERFORACION  LUNETAS', 'PRIVACE CON PERFORACION  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 15:38:02', '2023-01-09 15:44:18'),
(545, 'FW3507', 'KIA RIO HB 5  2012-2016 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:35:44', '2023-01-09 15:44:50'),
(546, '53980', 'RIO JB SEDAN 2006- 2015VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, NULL, 1, 35000, 140000, 1, 1, NULL, '', '2022-11-23 18:38:17', '2023-03-01 09:17:47'),
(547, '59660', 'RIO 4  2012-2016 LUNETA VERDE', 'VERDE LUNETA', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:41:49', '2023-01-09 15:47:02'),
(548, '211121022', 'BALENO 97-2002 VERDE  LUNETA', 'VERDE  LUNETA', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:43:19', '2023-01-09 15:52:41'),
(549, '64270', 'CERATO  2009 EN ADELANTE VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:44:37', '2023-01-09 18:13:42'),
(550, '64110', 'CHEVROLET SAIL  2011 - 2015/ TIIDA 04-2012 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:45:32', '2023-01-09 18:14:26'),
(551, '57340', 'MAZDA 3 SEDAN  2012 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:46:30', '2023-01-03 15:03:03'),
(552, '11874', 'FOCUS SEDAN 2012 VERDE CON PERFORACION LUNETAS', 'VERDE CON PERFORACION LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 18:59:35', '2023-01-09 15:45:19'),
(553, '5575', 'X TRAIL T 31 2007 VERDE  LUNETA', 'VERDE  LUNETA', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:00:35', '2023-01-09 15:53:33'),
(554, '28270', 'X-TRAIL  T30   2007-2013 VERDE  LUNETA', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:14:16', '2023-01-09 15:54:24'),
(555, '837', 'DAIHATSU 850 VAN BLANCO SIN DEFROSTER LUNETAS', 'BLANCO SIN DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-23 19:21:27', '2023-01-09 15:54:59'),
(556, '39888', 'DAIHATSU HIJET  1986-1987 BLANCO LUNETAS', 'BLANCO LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:28:25', '2023-01-09 15:55:31'),
(557, '01017563', 'KIA BESTA  94-97 EN GOMA VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:30:44', '2023-01-09 15:56:30'),
(558, '52580', 'NISSAN TIIDA  2004-2012 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:47:13', '2023-01-09 18:15:10'),
(559, '2613', 'VOL GOLF  1981-1999 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:50:54', '2023-01-09 18:16:12'),
(561, '8580', 'CHEROKEE GRAN 1993-1998 PRIVACE LUNETAS', 'PRIVACE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 19:53:35', '2023-01-09 18:16:46'),
(562, '24504', 'TOYOTA 4 RUNNER 2010 PRIVACE LUNETAS', 'PRIVACE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:01:51', '2023-01-09 18:17:17'),
(563, '190822020', 'NISSAN V-16 90-93 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:03:25', '2023-01-09 18:18:00'),
(564, '8592', 'DODGE  MINIVAN 1984-1995 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:05:02', '2023-01-09 18:18:29'),
(565, '2093', 'SM3 2000-2006 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:06:36', '2023-01-09 18:25:33'),
(566, '1223034', 'SUBARU LEGACY 2000 VERDE CON PERFORACION LUNETAS', 'VERDE CON PERFORACION LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 3, 3, 1, '', '2022-11-23 20:10:20', '2023-01-09 18:26:06'),
(567, '5384', 'FIAT LINEA 2000 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:11:05', '2023-01-09 18:51:38'),
(568, '3927', 'HAIMA ESTAR VAN 2009 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:12:13', '2023-01-09 18:53:05'),
(569, '210917087', 'HONDA FIT HB 2008 VERDE  LUNETAS', 'VERDE  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:54:39', '2023-01-09 18:55:17'),
(570, '22750', 'HAFEY PUIY VAN 2006 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:55:46', '2023-01-09 19:35:40'),
(571, '26610', 'JUSTY  GT 84 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:56:30', '2023-01-09 19:36:43'),
(572, '32320', 'CHARADE G 100  1987-88 VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:57:12', '2023-01-09 19:37:44');
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `id_categ`, `id_proveedor`, `id_subcateg`, `impuestos`, `estado`, `precio_costo`, `precio_venta`, `stock`, `stock_min`, `maneja_inventario`, `imagen`, `created_at`, `updated_at`) VALUES
(573, '32403', 'FIAT 125', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 20:57:56', '2022-11-23 20:57:56'),
(574, '02060', 'LANCER  92', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 21:11:45', '2022-11-23 21:11:45'),
(575, '73070', 'HAVAL HOVER 2005 2010', 'PRIVACE  CON PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 21:13:56', '2022-11-23 21:13:56'),
(576, '2330', 'MONTERO 99-2005', 'PRIVACE  CON CORTE Y PERFORACION', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 21:15:25', '2022-11-23 21:15:25'),
(577, '23300', 'MONTERO UTILITY 99-2006', 'PRIVACE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 21:16:25', '2022-11-23 21:16:25'),
(578, '151121145', 'CLIO II 3 PTAS 99-2008 LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-23 21:17:14', '2023-01-03 19:12:24'),
(579, '4330', 'NISSAN V 16 SEDAN VERDE LUNETAS', 'VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-24 19:56:09', '2023-01-09 19:33:40'),
(581, '5966', 'RIOS HB 2011-2017 T/D  VERDE T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 3, 1, '', '2022-11-25 12:29:31', '2023-01-09 19:38:51'),
(582, '59660', 'KIA RIO  4  2012 - 2016 SEDAN LUNETA VERDE', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 1, 1, 1, '', '2022-11-25 12:33:16', '2023-01-03 13:04:42'),
(583, 'FB27645', 'KIA RIO 4 SEDAN 2017 VERDE CON DEFROSTER LUNETAS', 'VERDE CON DEFROSTER LUNETAS', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 2, 1, '', '2022-11-25 12:40:35', '2023-01-09 19:49:34'),
(584, '2570DR2', 'MAXUS T 60 PICKUP 2017 D/D  VERDE  PUERTAS', 'D/D  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-25 12:42:56', '2023-01-20 13:38:14'),
(585, '2570TDR1', 'MAXUS T 60 PICKUP 2017 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-11-25 12:44:05', '2023-01-20 13:37:04'),
(586, '2570TDR4', 'MAXUS T 60 PICKUP 2017 T/D VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-25 12:46:22', '2023-01-20 13:38:31'),
(587, '2570TDR3', 'MAXUS T 60 PICKUP 2017 T/I  VERDE  PUERTAS', 'T/I  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-25 12:47:13', '2023-01-20 13:38:46'),
(588, '58790TDR1', 'VOLKSWAGEN AMAROK 4D  2010 D/I  VERDE  PUERTAS', 'D/I  VERDE  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-11-25 12:48:34', '2023-01-09 19:52:14'),
(590, '23200TDR1', 'VOLVO FH12 AÑO 2016 DER', NULL, 6, 2, 1, NULL, 1, 12000, 65000, 1, 2, NULL, '', '2022-12-15 13:50:27', '2023-02-23 10:56:48'),
(591, '89760TDR1', 'HINO 300 2011 D/I  PUERTAS', 'D/I  PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 13:52:03', '2023-01-09 20:38:49'),
(592, '02610TDR1', 'NKR/NPR 84-93 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 1, 1, '', '2022-12-15 13:54:11', '2023-01-09 20:39:35'),
(593, '02810TDR1', 'NKR/NPR 94-2008 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 13:55:29', '2023-01-09 20:40:13'),
(594, '04720TDR1', 'SCANIA 112-113 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 5, 2, NULL, '', '2022-12-15 13:56:27', '2023-02-27 10:55:47'),
(595, '2697TDR1', 'ACTROS 1994 D/I  MANUALPUERTAS', 'D/I  MANUALPUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-12-15 13:57:35', '2023-01-09 20:48:43'),
(596, '02610TDR2', 'NKR/NPR 84-93 D/D  CAB ANCHA PUERTAS', 'D/D  CAB ANCHA PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 13:58:53', '2023-01-09 20:49:27'),
(597, '04720TDR2', 'SCANIA 112-113 D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 3, 1, NULL, '', '2022-12-15 13:59:49', '2023-02-23 10:53:18'),
(599, '1898TDR1', 'HYUNDAI H-1 1998-2006 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:10:24', '2023-01-09 20:50:51'),
(600, '64180TDR1', 'JAC J2 HB 2011 D/I VERDE PUERTAS', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:11:52', '2023-01-09 20:51:25'),
(601, '02820TDR2', 'NQR 2009  D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 2, 1, '', '2022-12-15 14:13:41', '2023-01-09 19:29:40'),
(602, '2570DR2', 'MAXUS T 60 PICKUP 2017 D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:15:53', '2023-01-20 13:39:07'),
(604, '92770TDR2', 'CHANGAN CS 35 D/D VERDE PUERTA', 'D/D VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:18:20', '2023-01-09 20:52:50'),
(605, '2519TDR2', 'HYUNDAI MIGTHY 98 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:20:44', '2023-01-09 20:53:16'),
(606, '12720TDR2', 'MUSSO  96-2007D/D VERDE PUERTAS', 'D/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:21:54', '2023-01-09 20:53:38'),
(607, '0049TDR1', 'TOYOTA DINA 84/95 D/D VERDE PUERTAS', 'D/I   VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:23:19', '2023-01-09 20:54:01'),
(608, '27690TDR1', 'CANTER FUSSO 2006 - 2017 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 1, 1, '', '2022-12-15 14:24:57', '2023-01-09 20:54:26'),
(609, '2519TDR1', 'HYUNDAI MIGTHY -HD 65-HD72--HD78 D/I  VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 1, 1, '', '2022-12-15 14:38:16', '2023-01-09 20:54:53'),
(610, '2390TDR1', 'SCANIA  SERIE 4 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:40:46', '2023-01-09 20:55:27'),
(611, '05370TDR1', 'CANTER   85-93 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 14:45:24', '2023-01-09 20:55:52'),
(613, '54870tdr1', 'NQR 2006 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 18:23:58', '2023-01-09 20:56:16'),
(614, '23200TDR2', 'VOLVO FH12 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 4, 2, NULL, '', '2022-12-15 18:26:34', '2023-02-24 10:02:02'),
(615, '2697TDR2', 'M B ACTROS  96/2017 D/D VERDE  ELECTRONICA  3 PUERTAS D/D VERDE MANUAL  3 PUERTAS', 'D/D VERDE  ELECTRONICA  3 PUERTAS\r\nD/D VERDE MANUAL  3 PUERTAS', 6, 2, 1, NULL, 1, 12000, 66000, 7, 1, NULL, '', '2022-12-15 18:31:05', '2023-02-24 10:01:27'),
(616, '23290TDR2', 'SCANIA SERIE 4 D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 18:32:06', '2023-01-09 20:58:08'),
(617, '23290TDR1', 'SCANIA SERIE 4 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, NULL, '', '2022-12-15 18:32:53', '2023-02-27 10:54:58'),
(618, '0', '0', 'D/D VERDE PUERTAS', 6, 2, 1, NULL, 0, 0, 0, 0, 0, NULL, '', '2022-12-15 18:46:43', '2023-02-23 10:53:59'),
(619, '0', '0', '0', 6, 2, 1, NULL, 0, 0, 0, 0, 0, NULL, '', '2022-12-15 18:47:32', '2023-02-23 10:31:56'),
(620, '28870TDR1', 'CITROEN C3 2008 D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 18:52:47', '2023-01-09 21:00:39'),
(621, '34510TDR2', 'FIAT-PARTNER   96/2000 D/I VERDE PUERTAS', 'T/D VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:16:16', '2023-01-09 21:01:28'),
(622, '55840TDR1', 'PEUGEOT   -FIAT   -BIPPER D/I VERDE PUERTAS', 'D/I VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:19:34', '2023-01-09 21:02:18'),
(623, '55840TDR2', 'PEUGEOT   -FIAT   -BIPPER D/D  VERDE PUERTAS', 'D/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:20:28', '2023-01-09 21:02:45'),
(624, '2438TDR1', 'BERLINGO 96D/D  VERDE PUERTAS', 'T/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 3, 3, 1, '', '2022-12-15 19:24:52', '2023-01-09 21:04:02'),
(625, '2438TDR2', 'BERLINGO 96T/D PUERTA', 'T/D PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:25:31', '2023-01-09 21:05:21'),
(626, '56020TDR1', 'NEW BERLINGO 2008 D/I PUERTA', 'D/I  PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:40:34', '2023-01-09 21:06:03'),
(627, '18840TDR1', 'PEUGEOT 306   93-2001 D/I VERDE PUERTA', 'D/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 19:57:48', '2023-01-09 21:06:37'),
(628, '03280TDR1', 'CHARADE 93-200 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 2, 1, '', '2022-12-15 20:01:27', '2023-01-09 21:07:04'),
(629, '15589TDR2', 'FIAT DOBLO 2015 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 20:12:39', '2023-01-09 21:07:30'),
(630, '54350TDR1', 'ACTYON 2008 D/I  VERDE PUERTA', 'D/I  VERDE PUERTA', 6, 2, 1, NULL, 1, 12000, 65000, 5, 5, 1, '', '2022-12-15 20:14:06', '2023-01-31 12:35:16'),
(631, '54350TDR2', 'ACTYON 2008 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, NULL, 1, 12000, 65000, 7, 7, 1, '', '2022-12-15 20:14:49', '2023-01-31 10:53:58'),
(632, '50490TDR2', 'MAHINDRA 2002-2003 D/D  VERDE PUERTA', 'D/D  VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2022-12-15 20:17:31', '2023-01-09 21:08:40'),
(633, '12980', 'KIA BESTA ULTRA 98-2006 CON DEFROSTER  LUNETAS', 'CON DEFROSTER  LUNETAS', 7, 2, 1, 'No Mostrar', 1, 12000, 139000, 3, 1, 1, '', '2022-12-27 12:47:22', '2023-01-09 21:09:26'),
(634, 'A0440', 'NISSAN QASHQAI 5 D 2014- CON DEFROSTER  LUNETAS', 'C/DEF   VERDE LUNETAS', 7, 2, 1, 'No Mostrar', 1, 59000, 159000, 1, 1, 1, '', '2022-12-27 14:33:53', '2023-01-09 21:10:11'),
(635, '9219', 'ARGOSY / COLUMBIA 112-113 SIN ALETA  99-04 CON DEFROSTER  LUNETAS', 'CON DEFROSTER', 6, 2, 1, 'No Mostrar', 1, 27000, 119000, 1, 1, 1, '', '2022-12-27 14:53:39', '2023-01-09 21:10:44'),
(636, '23483', 'TOYOTA TUNDRA 5D 07-  PRIVACE TRAS DER CABINA CORTA PUERTA', 'TRAS DER CABINA CORTA PUERTA', 6, 2, 1, 'No Mostrar', 1, 35000, 125000, 1, 1, 1, '', '2022-12-27 15:01:44', '2023-01-09 21:11:10'),
(637, '0760', 'L 200 2015 TRAS DER CABINA CORTA PUERTA', 'TRAS DER CABINA CORTA PUERTA', 7, 2, 1, 'No Mostrar', 1, 35000, 140000, 2, 1, 1, '', '2022-12-27 15:12:28', '2023-01-09 21:11:42'),
(638, '57240', 'SPARK LT 06- LUNETA PERF ARRIBA', 'CON DEF  VERDE', 7, 2, 1, 'No Mostrar', 1, 35000, 129000, 1, 1, 1, '', '2022-12-27 15:32:31', '2023-01-05 15:34:53'),
(639, '59360', 'D MAX 2014- LUNETA PRIVACE PRIVACE', 'LUNETA PRIVACE PRIVACE', 7, 2, 1, 'No Mostrar', 1, 35000, 149000, 1, 1, 1, '', '2022-12-27 18:44:38', '2023-01-09 21:12:14'),
(640, '001', 'SAVEIRO 2021 LUNETA SIN DEF  CORTE EN LAS ESQUINAS', 'LUNETA SIN DEF  CORTE EN LAS ESQUINAS', 7, 2, 1, 'No Mostrar', 1, 35000, 139000, 1, 1, 1, '', '2022-12-27 20:47:32', '2023-01-09 21:12:51'),
(641, '51380TDR1', 'MORNING 2004 2010 D/I  VERDE D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 75000, 1, 1, 1, '', '2022-12-28 12:32:03', '2023-01-09 21:13:18'),
(642, '1970', 'KIA MORNING 2017LUNETA VERDE', 'LUNETA VERDE', 7, 3, 1, 'No Mostrar', 1, 65000, 165000, 1, 1, 1, '', '2022-12-28 12:37:22', '2023-01-09 21:13:42'),
(643, '5242TDR2', 'HILLUX  2005 D/I  VERDE PUERTAS', 'D/I  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 6, 1, '', '2022-12-29 12:32:10', '2023-01-09 21:15:56'),
(644, 'A0760TDR2', 'L 200 2015  T/D  VERDE PUERTAS', 'T/D  VERDE PUERTAS', 6, 2, 1, 'No Mostrar', 1, 12000, 75000, 1, 4, 1, '', '2022-12-29 19:18:20', '2023-01-24 18:34:01'),
(645, '59660TDR3', 'KIA RIO  4  2012 SEDAN T/I VERDE PUERTA SEDAN', 'T/I VERDE PUERTA', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 1, 1, 1, '', '2023-01-03 12:40:26', '2023-01-09 21:16:58'),
(646, '59660TDR3', 'KIA RIO  4  2012 SEDAN T/D VERDE PUERTA SEDAN', 'T/D VERDE PUERTA SEDAN', 6, 2, 1, 'No Mostrar', 1, 12000, 65000, 2, 1, 1, '', '2023-01-03 19:15:21', '2023-01-09 21:17:27'),
(647, '004', 'SORENTO 2002 LUNETA C/PERF', 'VERDE', 7, 2, 1, 'No Mostrar', 1, 59000, 159000, 1, 1, 1, '', '2023-01-05 18:19:03', '2023-01-05 18:19:03'),
(648, '78980', 'SAIL 2015  T/I VERDE PUERTA', 'VERDE', 6, 2, 1, 'No Mostrar', 1, 17000, 79000, 3, 1, 1, '', '2023-01-10 20:42:50', '2023-01-11 20:16:59'),
(649, '0', '0', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, 1, '', '2023-01-11 14:04:06', '2023-02-16 10:50:58'),
(650, '0', '0', NULL, 8, 2, 1, NULL, 1, 0, 0, 0, 0, 1, '', '2023-01-11 14:06:12', '2023-02-16 10:52:47'),
(651, '2228', 'PB HYUNDAI ELANTRA 2001-05', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:06:53', '2023-01-11 14:06:53'),
(652, '2010', 'PB HYUNDAI ELANTRA 1996-2002', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:10:20', '2023-01-11 14:10:20'),
(653, '2162', 'PB HYUNDAI ACCENT PRIME 2000', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:20:09', '2023-02-01 16:32:22'),
(654, '798', 'PB HYUNDAI 1994-1999', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 4, 4, 1, '', '2023-01-11 14:21:10', '2023-01-11 14:21:10'),
(655, '2710', 'PB HYUNDAI ELANTRA 2004-2010', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:23:22', '2023-01-11 14:23:22'),
(656, '3482', 'PB HYUNDAI ACCENT RB 2011 -2018', NULL, 8, 2, 1, NULL, 1, 65000, 129000, 5, 5, NULL, '', '2023-01-11 14:24:07', '2023-03-02 10:19:00'),
(657, '4396', 'PB HYUNDAI TUCSON 2015', NULL, 8, 2, 1, NULL, 1, 65000, 139000, 3, 3, 1, '', '2023-01-11 14:25:02', '2023-02-02 11:21:21'),
(658, '87860', 'PB HYUNDAI SANTA FE  S/S 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 14:26:22', '2023-01-11 14:26:22'),
(659, '87860', 'PB HYUNDAI SANTA FE C/S 2013', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 6, 4, NULL, '', '2023-01-11 14:27:04', '2023-02-22 17:43:44'),
(660, '54270', 'PB MIT L- 200 KAT NEW 4D AÑO 06-11(MONTERO SPORTG213-16', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 6, 1, NULL, '', '2023-01-11 14:29:01', '2023-02-27 10:49:54'),
(661, 'A076', 'PB MIT  L -200  2022 C/S DESP Y CAMARA', NULL, 8, 2, 1, NULL, 1, 65000, 199000, 1, 1, 1, '', '2023-01-11 14:31:07', '2023-02-02 11:37:37'),
(662, '04937', 'PB MIT ECLIPSE 2012', NULL, 1, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:34:05', '2023-01-11 14:34:05'),
(663, '170330116', 'PB MIT LANCER 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:35:05', '2023-01-11 14:35:05'),
(664, '45910', 'PB MIT OUTLANDER 2012 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:36:11', '2023-01-11 14:36:11'),
(665, '2035', 'PB MIT LANCER SEDAN 1995', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 14:37:01', '2023-01-16 13:55:44'),
(666, '2275', 'PB MIT LANCER 2001-08', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 14:37:53', '2023-01-11 14:37:53'),
(667, '2750', 'PB MIT OUTLANDER 2005', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:39:16', '2023-01-11 14:39:16'),
(668, '09000', 'PB MIT GALANT 1987-89', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:40:07', '2023-01-11 14:40:07'),
(669, '23960', 'PB MIT L-200 99-05', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 3, 1, '', '2023-01-11 14:40:57', '2023-02-06 09:43:46'),
(670, '5', 'PB', NULL, 8, 2, 1, NULL, 0, 0, 0, 1, 1, 1, '', '2023-01-11 14:43:01', '2023-02-11 11:26:27'),
(671, '2080', 'PB MIT GALANT 98', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:43:39', '2023-01-11 14:43:39'),
(672, '210416124', 'PB MIT GALLOPER 1982-1991 EN GOMA', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 14:50:54', '2023-01-11 14:52:43'),
(673, '20790', 'PB MIT GALLOPER 2001', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 14:53:31', '2023-01-11 14:53:31'),
(674, '02750', 'PB CHEV LUV 95', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 4, 4, 1, '', '2023-01-11 14:55:44', '2023-01-11 14:55:44'),
(675, '210220305', 'PB CHEV OPTRA C/A 2008', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 14:56:59', '2023-01-11 14:56:59'),
(676, '5936', 'PB CHEV COLORADO S/S 2019', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, NULL, '', '2023-01-11 15:00:51', '2023-02-24 17:37:50'),
(677, '201227151', 'PB CHEV COLORADO C/CAMARA 2015', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:02:51', '2023-01-11 15:02:51'),
(678, '11410', 'PB CHEV LUV 81-88', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:28:01', '2023-01-11 15:28:01'),
(679, '1561', 'PB CHEV  AVEO LARGO 04-06', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 3, 3, 1, '', '2023-01-11 15:29:39', '2023-01-11 15:29:39'),
(680, '54390', 'PB CHEV AVEO CORTO 06-12', NULL, 8, 2, 1, NULL, 1, 65000, 129000, 6, 2, 1, '', '2023-01-11 15:30:39', '2023-02-15 15:18:13'),
(681, '1217', 'PB CHEV BLAIZER 92-99', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:31:39', '2023-01-11 15:31:39'),
(682, '211028136', 'PB CHEV CAPTIVA C/S 06-13', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 159000, 1, 1, 1, '', '2023-01-11 15:37:33', '2023-01-23 21:25:55'),
(683, '54960', 'PB CHEV CAPTIVA S/S 06-13', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 15:38:22', '2023-01-11 15:38:22'),
(684, '210517350', 'PB CHEV CRUZE C/S 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:39:27', '2023-01-11 15:39:27'),
(685, '211127028', 'PB CHEV SILVERADO 00-05', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:40:15', '2023-01-11 15:40:15'),
(686, '1659', 'PB CHEV SILVERADO C/S REDONDO 2006', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 15:42:35', '2023-01-11 15:42:35'),
(687, '02274', 'PB CHEV SILVERADO C/S Y CAMARA  2015', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:43:39', '2023-01-11 15:43:39'),
(688, '1658', 'PB CHEV SILVERADO S/S  2014', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:45:52', '2023-01-11 15:45:52'),
(689, '211117208', 'PB CHEV COLORADO 2004-10', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 15:47:06', '2023-01-11 15:47:06'),
(690, '220408342', 'PB CHEV CAPTIVA 06-18  SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 139000, 3, 1, 1, '', '2023-01-11 18:27:03', '2023-02-02 11:24:13'),
(691, '45860', 'PB CHEV TRACKER 2012 SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 18:28:11', '2023-02-08 10:56:54'),
(692, '78980', 'PB CHEV SAIL 2016', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 18:28:59', '2023-02-16 17:40:48'),
(693, '64110', 'PB CHEV SAIL 2011-2015', NULL, 8, 2, 1, NULL, 1, 65000, 129000, 2, 4, NULL, '', '2023-01-11 18:29:56', '2023-02-20 12:02:51'),
(694, '58370', 'PB CHEV SPARK GT 2015 PB', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 3, 1, '', '2023-01-11 18:32:16', '2023-01-24 14:21:47'),
(695, '57240', 'PB CHEV SPARK 2006', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 18:44:29', '2023-01-30 10:13:45'),
(696, '5496', 'PB CHEV CAPTIVA 2006 SENSOR MEDIO', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 3, 1, '', '2023-01-11 18:47:03', '2023-02-02 11:25:13'),
(697, '63410', 'PB CHEV CRUZE S/S 09-15', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 19:58:54', '2023-01-11 19:58:54'),
(698, '63410', 'PB CHEV CRUZE C/S 09-15', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:00:39', '2023-01-11 20:00:39'),
(699, '58560', 'PB CHEV  ORLANDO 2010 S/S', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:14:36', '2023-02-11 11:25:51'),
(700, '5936CLFW', 'PB CHEV D-MAX 2014', NULL, 8, 2, 1, NULL, 1, 65000, 139000, 4, 1, NULL, '', '2023-01-11 20:15:18', '2023-03-01 11:32:11'),
(701, '51390', 'PB KIA CERATO 04-08', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 20:16:13', '2023-01-11 20:16:13'),
(702, '3134', 'PB CERATO 09-12', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 7, 7, 1, '', '2023-01-11 20:18:29', '2023-01-11 20:18:29'),
(703, '2818', 'PB KIA CAREN  07-13', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:20:20', '2023-01-11 20:20:20'),
(704, '28150', 'PB KIA SORENTO 2002', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 20:20:59', '2023-01-11 20:20:59'),
(705, '210410254', 'PB KIA SORENTO 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:21:56', '2023-01-11 20:22:30'),
(706, '0180', 'PB KIA SORENTO 2015', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:23:37', '2023-01-11 20:23:37'),
(707, '64720', 'PB KIA CERATO 2013', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 1, NULL, '', '2023-01-11 20:24:32', '2023-03-01 11:23:40'),
(708, '51380', 'PB MORNING 04-2010', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 6, 6, 1, '', '2023-01-11 20:25:42', '2023-01-11 20:25:42'),
(709, '0', 'PB KIA SPORTAGE 2004-10', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, 1, '', '2023-01-11 20:45:57', '2023-02-15 15:24:04'),
(710, '3507', 'PB KIA RIO 3,4,Y 5     AÑO 2011', NULL, 8, 2, 1, NULL, 1, 65000, 139000, 2, 3, 1, '', '2023-01-11 20:46:51', '2023-02-02 12:15:25'),
(711, '2605', 'PB KIA RIO JB C/ ARRIBA  2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 4, 1, 1, '', '2023-01-11 20:49:34', '2023-02-09 16:41:14'),
(712, '5398', 'PB KIA RIO JB C/ABAJO', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 3, 1, 1, '', '2023-01-11 20:50:57', '2023-01-16 14:12:14'),
(713, '5897', 'PB KIA MORNING 11-16', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 6, 6, 1, '', '2023-01-11 20:51:43', '2023-01-11 20:51:43'),
(714, '1960', 'PB KIA RIO 4 Y 5   2017', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-11 20:55:40', '2023-02-10 10:23:57'),
(715, '804', 'PB KIA SPORTAGE 95-03', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 20:57:14', '2023-02-07 11:13:23'),
(716, '1970', 'PB KIA MORNING  2017', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 4, 4, 1, '', '2023-01-11 20:58:09', '2023-01-11 20:58:09'),
(717, '08680', 'PB KIA BESTA  93-96', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 3, 3, 1, '', '2023-01-11 20:59:05', '2023-01-11 20:59:05'),
(718, '28160', 'PB KIA FRONTIER I  1998', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 6, NULL, '', '2023-01-11 21:01:39', '2023-02-27 11:34:34'),
(719, '53850', 'PB  KIA FRONTIER II 2010', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 3, 5, 1, '', '2023-01-11 21:02:33', '2023-01-24 14:24:36'),
(720, '210820432', 'PB KIA BESTA ULTRA 2007', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 3, 1, '', '2023-01-11 21:03:41', '2023-01-30 10:16:40'),
(721, '24660TD', 'TOYOTA COROLLA 09-13 ALETA', NULL, 1, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-11 21:05:53', '2023-01-11 21:05:53'),
(722, '08760', 'PB KIA BESTA 90/93', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-13 12:26:57', '2023-01-16 13:56:43'),
(723, '02300', 'PB KIA CERES K2400  CON ALETA   85/92', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-13 12:27:55', '2023-02-11 10:59:36'),
(724, '0407112', 'PB KIA CLARUS SEDAN 97', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-13 12:29:23', '2023-01-13 12:29:23'),
(725, '2212', 'PB KIA RIO SEDAN 2000-05', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 65000, 3, 3, 1, '', '2023-01-13 12:30:07', '2023-01-13 12:30:07'),
(726, '190823375', 'PB KIA SEPIA 2011-15', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:31:04', '2023-01-13 12:31:04'),
(727, '58290', 'PB KIA SPORTAGE  2011-15', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 2, 1, '', '2023-01-13 12:31:42', '2023-02-01 12:29:09'),
(729, '5094', 'PB MAZDA 3 2004-08  CON SENSOR MEDIO', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 12:33:48', '2023-01-13 12:33:48'),
(730, '5094', 'PB MAZDA 3 2004-08 SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 1, 1, 5, 6, 1, '', '2023-01-13 12:44:25', '2023-02-06 10:18:44'),
(731, '5734', 'PB MAZDA 3 5734 2009-2014  CON SENSOR MEDIO', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 12:45:31', '2023-01-13 12:45:31'),
(732, '5734', 'PB MAZDA 3  2009-2014  SIN SENSOR', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 12:46:48', '2023-01-13 12:46:48'),
(733, '46640', 'PB MAZDA 3 2015 SIN SENSOR', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:49:06', '2023-01-13 12:49:06'),
(734, '2107', 'PB MAZDA 323 2004-09', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 12:50:00', '2023-01-13 12:50:00'),
(735, '02550', 'PB MAZDA 626 94-97', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:50:47', '2023-01-13 12:50:47'),
(736, '501', 'PB MAZDA B 2000  85-98', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 4, 4, 1, '', '2023-01-13 12:51:32', '2023-01-13 12:51:32'),
(737, '643', 'PB MAZDA 323 89-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 4, 4, 1, '', '2023-01-13 12:52:22', '2023-01-13 12:52:22'),
(738, '0556', 'PB MAZDA LUCE  929    78', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:53:42', '2023-01-13 12:53:42'),
(739, '583', 'PB LUCE 929   MAZDA 86-91', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:54:42', '2023-01-21 13:17:22'),
(740, '30740', 'PB MAZDA BT 50  2007', NULL, 8, 2, 1, NULL, 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:55:23', '2023-02-10 11:25:53'),
(741, '59500', 'PB MAZDA NEW BT50 S/S 2011', NULL, 8, 2, 1, NULL, 1, 48000, 149000, 4, 1, NULL, '', '2023-01-13 12:56:07', '2023-02-27 11:39:54'),
(742, '59500', 'PB MAZDA NEW BT50  2011  C/SENSOR', NULL, 8, 2, 1, NULL, 1, 45000, 159000, 2, 2, 1, '', '2023-01-13 12:57:09', '2023-02-16 09:38:27'),
(743, '3551', 'PB MAZDA 3 2008-2013 C/SENSOR DESPLAZDO', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 2, 1, '', '2023-01-13 12:58:02', '2023-02-01 16:36:28'),
(744, '3551', 'PB MAZDA 3 2008-2013 SIN SENSOR', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 12:58:51', '2023-01-13 12:58:51'),
(745, '3926', 'PB MAZDA 3 2015-2018 C/SENSOR DESPLAZADO', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 13:00:26', '2023-01-13 13:00:26'),
(746, '3718', 'PB MAZDA 6 C/SENSOR DESPLAZADO 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:07:18', '2023-01-13 13:08:53'),
(747, '210618336', 'PB MAZDA 2 S/S 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:08:12', '2023-01-13 13:09:31'),
(748, '57340', 'PB MAZDA 3 S/S 2010-14', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 13:12:15', '2023-01-13 13:12:15'),
(749, '5620', 'PB MAZDA 6 CON SENSOR MEDIO  09-12', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:15:21', '2023-01-13 13:15:21'),
(750, '3926', 'PB MAZDA 3 2015-18 SIN SENSOR', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:22:10', '2023-01-13 13:22:10'),
(751, '3559', 'PB MAZDA CX5 2012-16 C/SENSOR DESPLAZADO', NULL, 8, 2, 1, NULL, 1, 60000, 159000, 2, 2, NULL, '', '2023-01-13 13:24:06', '2023-02-25 12:01:58'),
(752, '4735', 'PB MAZDA CX5 2017 CON SENSOR DESPLAZADO', NULL, 8, 2, 1, NULL, 1, 68000, 169000, 2, 2, NULL, '', '2023-01-13 13:25:09', '2023-02-25 12:01:44'),
(753, '2656', 'PB MAZDA CX7 07-13 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 13:27:23', '2023-01-13 13:27:23'),
(754, '54130', 'PB MAZDA 8 MPV 2006 SIN SENSOR', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:30:11', '2023-01-13 13:30:11'),
(755, '210918365', 'PB FORD ECOSPORT 03-08', NULL, 8, 2, 1, NULL, 1, 1, 1, 0, 1, NULL, '', '2023-01-13 13:36:50', '2023-02-27 11:38:01'),
(756, '210817235', 'PB FORD FIESTA 2002', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:37:32', '2023-01-13 13:37:32'),
(757, '92450', 'PB FORD ECOSPORT S/S 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:38:18', '2023-01-13 13:38:18'),
(758, '2153', 'PB FORD F 150 S/S 2015', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 13:40:39', '2023-01-13 13:40:39'),
(759, '1747', 'PB FORD F 150 S/S 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:03:23', '2023-01-13 14:03:23'),
(760, '1256', 'PB FORD EXPEDITION  S/S AÑO 97', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:04:05', '2023-01-13 14:04:05'),
(761, '1087', 'PB FORD EXPEDITION S/S 91-93', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:04:56', '2023-01-13 14:04:56'),
(762, '1317', 'PB FORD RANGER 90-2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 14:05:33', '2023-01-13 14:05:33'),
(763, '1319', 'PB FORD 250 Y 350 DUTY 09-14', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:06:13', '2023-01-13 14:06:13'),
(764, '1793', 'PB DODGE RAM 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 14:08:33', '2023-01-13 14:08:33'),
(765, '963', 'PB DODGE CARAVAN 85-95', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:09:17', '2023-01-13 14:09:17'),
(766, 'SL140721844', 'PB  NEON SEDAN 2000', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:10:19', '2023-01-13 14:10:19'),
(767, '51590', 'PB VOLKS TAVARE C/S MEDIO 02-2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:11:32', '2023-01-13 14:11:32'),
(768, '999', 'PB DODGE CRYSLER 2 PTA PICK UP 86-96', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:12:24', '2023-01-13 14:12:24'),
(769, '1839', 'PB GRAN CHEROKEE 2011 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 14:14:03', '2023-01-13 14:14:03'),
(770, '170401245', 'PB GRAN CHEROKEE 99-04', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:14:59', '2023-01-13 14:14:59'),
(771, '1592', 'PB GRAN CHEROKEE   2005-2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:15:40', '2023-01-13 14:15:40'),
(772, '30094', 'PB GRAN CHEROKEE 99-00', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:16:16', '2023-01-13 14:16:16'),
(773, '2947', 'PB AUDI A-4  08-14 C/SENSOR GOTA', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:16:52', '2023-01-13 14:16:52'),
(774, '04947', 'PB MERCEDES BENZ GLC CON SENSOR 2016', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 14:17:54', '2023-01-13 14:18:58'),
(775, '2724', 'PB TUNDRA 2 PTA PICK UP 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:20:27', '2023-01-13 14:20:27'),
(776, '1810', 'PB MERCEDES BENZ GLC CON SENSOR  Y CAMARA 2016', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:31:58', '2023-01-13 14:31:58'),
(777, '59310', 'PB BMW 218 C/S REDONDO 59310', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:32:56', '2023-01-13 14:32:56'),
(778, '59340', 'PB BMW 3 C/S REDONDO 2012', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 14:37:22', '2023-01-20 14:05:41'),
(779, '50570', 'PB BMW S/S 98-05', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:38:15', '2023-01-13 14:38:15'),
(780, '2575', 'PB AUDI A-4 C/S GOTA  01-08', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:45:19', '2023-01-13 14:45:19'),
(781, '740', 'PB MERCEDES BENZ CLASS S/S 86-95', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:46:11', '2023-01-13 14:46:11'),
(782, '5574', 'PB MERCEDES BENZ C/S Y CAMARA 07-2014', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:47:07', '2023-01-13 14:47:07'),
(783, '04650', 'PB VOLVO  83-89', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:47:43', '2023-01-13 14:47:43'),
(784, '2580', 'PB HAIMA  2010', NULL, 8, 2, 1, 'No Mostrar', 1, 11, 1, 1, 1, 1, '', '2023-01-13 14:48:18', '2023-01-13 14:48:18'),
(785, '4921', 'PB JAC J4 A30 C/ANTENA 2014', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 14:48:56', '2023-01-13 14:49:18'),
(786, '62520', 'PB CHERY S 21 QQ C.E.L SEDAN 2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:50:59', '2023-01-13 14:50:59'),
(787, '5946', 'PB MAHINDRA XUV 500 C/S 2017', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 14:57:21', '2023-01-13 14:57:21'),
(788, '73070', 'PB G W', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:00:02', '2023-01-13 15:00:02'),
(789, '63840', 'PB JAC J3 2008', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:01:27', '2023-01-13 15:01:27'),
(790, '22750', 'PB HAFEI 2 HONGY RUIYI  2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:02:02', '2023-01-13 15:02:02'),
(791, '63840', 'PB JAC C/ANTENA 2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:04:10', '2023-01-13 15:04:10'),
(792, '2209563', 'PB NISSAN SENTRA  2020 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:05:05', '2023-01-13 15:05:05'),
(793, '4697', 'PB NISSAN X-TRAIL  T32  2018', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 3, NULL, '', '2023-01-13 15:06:24', '2023-03-01 10:39:52'),
(794, '5575', 'PB NISSAN X-TRAIL T31 07-10', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 5, 5, 1, '', '2023-01-13 15:07:08', '2023-01-13 15:07:08'),
(795, '211124726', 'PB NISSAN D22  98-12', NULL, 8, 2, 1, NULL, 1, 1, 1, 6, 6, NULL, '', '2023-01-13 15:08:02', '2023-02-24 09:30:48'),
(796, '2740', 'PB NISSAN PRIMERA 2003', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:08:50', '2023-01-13 15:08:50'),
(797, '2653', 'PB NISSAN TIIDA 2004-10  PB', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 6, 6, 1, '', '2023-01-13 15:10:05', '2023-01-23 15:11:32'),
(798, '781', 'PB NISSAN CEFIRO SEDAN 94-98', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:12:07', '2023-01-13 15:12:07'),
(799, '2179', 'PB NISSAN SENTRA II   99', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:12:46', '2023-01-13 15:12:46'),
(800, '2827', 'PB NISSAN X-TRAIL T30 2000-08', NULL, 8, 2, 1, NULL, 1, 1, 1, 0, 2, NULL, '', '2023-01-13 15:13:38', '2023-03-01 11:22:06'),
(801, 'A044', 'PB NISSAN QASHQAI 2014 C/S', NULL, 8, 2, 1, NULL, 1, 1, 1, 8, 3, 1, '', '2023-01-13 15:14:24', '2023-02-13 12:20:16'),
(802, 'A108', 'PB NISSAN NP 300  2015', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 4, 1, NULL, '', '2023-01-13 15:15:05', '2023-02-24 09:36:37'),
(803, 'A0440LFW', 'PB NISSAN QASHQAI 2014 S/SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 2, 2, NULL, '', '2023-01-13 15:16:12', '2023-02-24 10:20:25'),
(804, '5521', 'PB NISSAN QASHQAI 2010 C/S', NULL, 8, 2, 1, NULL, 1, 60000, 149000, 3, 4, NULL, '', '2023-01-13 15:16:59', '2023-02-27 11:09:07'),
(805, '5521', 'PB NISSAN QASHQAI 2010 S/S', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 2, 2, NULL, '', '2023-01-13 15:17:47', '2023-02-24 10:19:16'),
(806, '210917186', 'PB NISSAN SUNY SEDAN 85-90', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:18:41', '2023-01-13 15:18:41'),
(807, '201105040', 'PB SENTRA II  1994', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 15:19:21', '2023-01-21 12:25:25'),
(808, '3781', 'PB NISSAN NOTE 06-13', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 15:20:02', '2023-01-13 15:20:02'),
(809, '663', 'PB NISSAN V 16 91-08', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 18:06:21', '2023-01-13 18:06:21'),
(810, '210317011', 'PB NISSAN NAVARA 2005', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 3, 1, '', '2023-01-13 18:07:04', '2023-01-30 10:15:44'),
(811, '727', 'PB NISSAN ALTIMA SEDAN', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:12:04', '2023-01-13 18:12:04'),
(812, '413', 'PB NISSAN 1600 , 1800 AÑO 79-86', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:12:52', '2023-01-13 18:12:52'),
(813, '2069', 'PB NISSAN TERRANO  II  93-06', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 1, 1, 1, '', '2023-01-13 18:13:29', '2023-02-09 17:14:53'),
(814, '440', 'PB NISSAN SUNNY SEDAN 81-85', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:14:18', '2023-01-13 18:14:18'),
(815, '45960', 'PB NV 350 5D 2012 CAB/ANCHA', NULL, 8, 2, 1, NULL, 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:16:41', '2023-02-11 11:34:39'),
(816, '2765', 'PB CHEV MONTANA 99-05/ CORSA EVOLUTION 99/2010', NULL, 8, 2, 1, NULL, 1, 10000, 10000, 3, 2, 1, '', '2023-01-13 18:17:28', '2023-02-02 10:40:08'),
(817, '210410146', 'PB OPEL VECTRA  95-03', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:18:08', '2023-01-13 18:18:08'),
(818, '10120', 'PB CHEV ASTRA 98-99', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:18:44', '2023-01-13 18:18:44'),
(819, '2888', 'PB   VECTRA  C/S   2002', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:20:22', '2023-01-13 18:20:22'),
(820, '59710', 'PB CHEV MONTANA  2011', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 4, 4, 1, '', '2023-01-13 18:21:16', '2023-01-13 18:21:16'),
(821, '210818260', 'PB  CHEV COMBO II 2001', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 5, 5, 1, '', '2023-01-13 18:22:18', '2023-01-13 18:22:18'),
(822, '51640', 'PB CHEV ASTRA 04-09', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-13 18:23:33', '2023-01-13 18:24:07'),
(823, '03730', 'PB VECTRA 89-95', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-13 18:25:22', '2023-01-13 18:25:22'),
(824, '30770', 'PB ASTRA G  99-06', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 3, 1, '', '2023-01-13 18:26:06', '2023-02-14 11:17:21'),
(825, '2765', 'PB CORSA EVOLUCION  00-06', NULL, 8, 2, 1, NULL, 0, 1, 1, 0, 1, 1, '', '2023-01-13 18:26:54', '2023-02-02 12:05:30'),
(826, '201223065', 'PB CHEV ASTRA 91-96', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:27:44', '2023-01-13 18:27:44'),
(827, '0390', 'PB CHEV CORSA C/ANT', NULL, 8, 2, 1, NULL, 1, 1, 1, 2, 3, 1, '', '2023-01-13 18:28:23', '2023-02-14 16:55:46'),
(828, '03900', 'PB CHEV CORSA S/A 02-08', NULL, 8, 2, 1, NULL, 1, 1, 1, 3, 4, 1, '', '2023-01-13 18:29:10', '2023-02-14 11:20:46'),
(829, '21022305', 'PB PEUGEOT 206   98', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:30:01', '2023-01-13 18:30:01'),
(830, 'AL2104191620', 'PB PEUGEOT 107, CITROEN C 1  AÑO 2005', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:31:05', '2023-01-13 18:31:05'),
(831, '88010', 'PB PEUGEOT 301  2010', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 1, 1, 1, '', '2023-01-13 18:31:54', '2023-02-03 11:58:35'),
(832, '220219096', 'PB PEUGEOT LANDTREK-CHANGAN  AÑO 2020', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:33:34', '2023-01-14 12:48:47'),
(833, '92780', 'PB CHANGAN M201 FURGON 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-13 18:34:22', '2023-01-13 18:34:22'),
(834, '11990', 'PB CITROEN C-3 2017 CON SENSOR Y CAMARA', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 12:51:36', '2023-01-14 12:51:36'),
(835, '2438', 'PB CITROEN BERLINGO 99-2010', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 3, 1, 1, '', '2023-01-14 12:53:46', '2023-02-11 09:59:20'),
(836, '53550', 'PB CITROEN C1,PEUGEOT 107, Y BYD 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 12:55:01', '2023-01-14 12:55:01'),
(837, '26050', 'PB CITROEN XSARA HB 97-2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 12:56:00', '2023-01-14 12:56:00'),
(838, '26020', 'PB PEUGEOT 106 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 13:00:40', '2023-01-14 13:00:40'),
(839, '57180', 'PB CITROEN C 15 88-2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 13:01:21', '2023-01-14 13:01:21'),
(840, '54110', 'PB DAHIATSU TERIOS NEW  2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 13:02:04', '2023-01-14 13:02:04'),
(841, '03280', 'PB CHARADE SEDAN  93', NULL, 8, 2, 1, NULL, 1, 1, 1, 1, 1, 1, '', '2023-01-14 13:03:20', '2023-01-30 15:53:08'),
(842, '592', 'PB DAHIATSU CHARADE SEDAN 87-93', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 13:04:28', '2023-01-14 13:04:28'),
(843, '0770TDR1', 'TOYOTA HILUX 2015 PUERTA D/I', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:05:46', '2023-01-14 14:05:46'),
(844, '12980TDR1', 'KIA BESTA ULTRA 98-2006 D/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:07:03', '2023-01-14 14:07:03'),
(845, '5242TDR3', 'TOYOTA HILUX NEW 2006 T/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:08:12', '2023-01-14 14:08:12'),
(846, '1080TDR1', 'NISSAN NP300 2015 VERDE D/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:09:04', '2023-01-17 14:46:15'),
(847, '1080TDR2', 'NISSAN NP300 2015 VERDE D/D PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:09:50', '2023-01-14 14:09:50'),
(848, '1080TDR4', 'NISSAN NP300 2015 T/D PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-14 14:11:14', '2023-01-14 14:11:14'),
(849, '10920TDR1', 'HYUNDAI ACCENT 1995-1999 D/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:12:21', '2023-01-14 14:12:21'),
(850, '55980TDR1', 'HYUNDAI H-1 NEW 08 D/I  PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-14 14:20:35', '2023-01-14 14:20:35'),
(851, '2697TDR1', 'ACTROS 1994 D/I  ELECTRONICO PUERTA', 'D/I  VERDE', 6, 2, 1, NULL, 1, 12000, 125000, 1, 1, NULL, '', '2023-01-16 14:00:25', '2023-02-27 11:00:00'),
(852, '56660', 'PB RENAULT KANGOO C/S 2008', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-17 14:49:27', '2023-01-17 14:49:27'),
(853, '56660', 'PB RENAULT KANGOO  S/S 2008', NULL, 8, 2, 1, NULL, 1, 1, 1, 4, 4, 1, '', '2023-01-17 14:50:52', '2023-01-30 15:44:34'),
(854, '6590', 'PB RENAULT LAGUNA 2007 C/S', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 14:51:45', '2023-01-17 14:51:45'),
(855, '51830', 'PB RENAULT MEGANE 2006 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 14:53:10', '2023-01-17 14:53:10'),
(856, '24560', 'PB RENAULT  CLIO II  2000', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 3, 3, 1, '', '2023-01-17 14:54:00', '2023-01-17 14:54:00'),
(857, '92780', 'PB CHANGAN M201 FURGON 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-17 14:54:55', '2023-01-17 14:54:55'),
(858, '24920', 'PB RENAULT KANGOO 97', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 14:55:47', '2023-01-17 14:56:37'),
(859, '0', '0', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, 1, '', '2023-01-17 14:58:38', '2023-02-16 09:24:28'),
(860, '210921114', 'PB SUBARU LEGACY 03-09', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 14:59:31', '2023-01-17 14:59:31'),
(861, '2863', 'PB SUBARU IMPREZA 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 15:00:26', '2023-01-17 15:00:26'),
(862, '26620', 'PB SUBARU 02-08', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 2, 2, 1, '', '2023-01-17 15:02:01', '2023-01-17 15:02:01'),
(863, '2154', 'PB SUBARU LEGACY 98/03', NULL, 8, 2, 1, NULL, 1, 1, 1, 3, 1, 1, '', '2023-01-17 15:03:09', '2023-02-16 09:23:32'),
(864, '629', 'PB SUBARU LEGACY 89-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1, 1, 1, 1, 1, '', '2023-01-17 15:12:35', '2023-01-17 15:12:35'),
(865, '55450TDR3', 'TOYOTA RAV4 5D 07 VERDE T/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 65000, 650000, 2, 2, 1, '', '2023-01-20 12:56:26', '2023-01-20 12:56:26'),
(866, '86510TDR3', 'HYUNDAI ACCENT RB 4D 11 VERDE T/I PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 65000, 65000, 2, 2, 1, '', '2023-01-20 12:58:16', '2023-01-20 12:58:16'),
(867, '86510TDR4', 'HYUNDAI ACCENT RB 4D 11 VERDE T/D PUERTA', NULL, 6, 2, 1, 'No Mostrar', 1, 65000, 65000, 1, 1, 1, '', '2023-01-20 12:59:01', '2023-01-20 12:59:01'),
(868, '64040', 'PB JAC J6 2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 13:45:39', '2023-01-20 13:45:39'),
(869, '7295', 'PB FOTON AUMARK C/ANCHA', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 13:53:07', '2023-01-20 13:53:07'),
(870, '720', 'PB NISSAN MAXIMA 1994', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:07:10', '2023-01-20 14:07:10'),
(871, '24940', 'PB RENAULT CLIO I 1998', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:11:16', '2023-01-20 14:11:16'),
(872, '53870', 'PB TOYOTA NEW YARIS 06-13', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 14, 15, 1, '', '2023-01-20 14:12:32', '2023-01-24 14:22:39'),
(873, '2159', 'PB TOYOTA YARIS ECCO  sedan /sport  99-2005', NULL, 8, 2, 1, NULL, 1, 50000, 129000, 2, 2, 1, '', '2023-01-20 14:13:36', '2023-02-13 15:58:36'),
(874, '2614', 'PB TOYOTA NEW YARIS SPORT 06-13', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 6, 7, NULL, '', '2023-01-20 14:14:26', '2023-02-20 16:13:25'),
(875, '8796', 'PB TOYOTA YARIS 2014', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 7, 5, NULL, '', '2023-01-20 14:16:06', '2023-02-27 17:41:22'),
(876, '59070', 'PB TOYOTA YARIS SPORT CON 1 PLUMILLA 12-18', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:17:02', '2023-01-20 14:17:02'),
(877, '11760', 'PB TOYOTA COROLLA 95-02', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 2, 1, '', '2023-01-20 14:18:34', '2023-01-23 12:59:30'),
(878, '580', 'PB TOYOTA COROLLA 87-92', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 14:19:21', '2023-01-20 14:19:21'),
(879, '210929137', 'PB TOYOTA COROLLA 00-07', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 14:20:14', '2023-01-20 14:20:14'),
(880, '2899', 'PB TOYOTA COROLLA 2013', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 3, 4, NULL, '', '2023-01-20 14:21:47', '2023-03-01 11:25:24'),
(881, '3838', 'PB TOYOTA COROLLA 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 4, 4, 1, '', '2023-01-20 14:49:11', '2023-01-20 14:49:11'),
(882, '3176', 'PB TOYOTA 4 RUNNER 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 14:49:52', '2023-01-20 14:49:52'),
(883, '2371', 'PB TOYOTA 4 RUNNER 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 14:50:32', '2023-01-20 14:50:32'),
(884, '210412167', 'PB TOYOTA DINAMITA  88-97', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:52:21', '2023-01-20 14:52:21'),
(885, '2365', 'PB TOYOTA LAN CRUSIER 2002', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:59:00', '2023-01-20 14:59:00'),
(886, '2001', 'PB TOYORA RAV 4 94-98', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 14:59:51', '2023-01-20 14:59:51'),
(887, '5382', 'PB TOYOTA RAV 4 2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 4, 4, 1, '', '2023-01-20 15:00:49', '2023-01-20 15:00:49'),
(888, '46070', 'PB TOYOTA RAV 4 2013', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 3, 4, NULL, '', '2023-01-20 15:08:15', '2023-02-27 17:20:16'),
(889, '211122524', 'PB TOYOTA RAV 4 00-06', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 15:09:04', '2023-01-20 15:09:04'),
(890, 'LO0205432', 'PB TOYOTA LITEACE 92-99', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 15:10:44', '2023-01-20 15:10:44'),
(891, '180515357', 'PB TOYOTA AVENSIS 98-03', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 15:20:18', '2023-01-20 15:20:18'),
(892, 'A077', 'PB TOYOTA HILUX 2015', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 3, 1, '', '2023-01-20 15:21:07', '2023-02-06 09:41:06'),
(893, '52420', 'PB TOYOTA HILUX 2005', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 5, NULL, '', '2023-01-20 15:23:49', '2023-02-27 10:56:12'),
(894, '6851', 'PB RAV 4 C/S DESPLA 2019', NULL, 8, 2, 1, NULL, 1, 45000, 159000, 1, 2, NULL, '', '2023-01-20 15:25:07', '2023-03-01 16:49:42'),
(896, '2365', 'PB TOYOTA LANDER PRADO 96-03', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:19:35', '2023-01-20 18:19:35'),
(897, '11760', 'PB TOYOTA COROLLA 95-02', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 18:20:13', '2023-02-01 16:18:25'),
(898, '2011', 'PB TOYOTA HILUX 97-05', NULL, 8, 2, 1, NULL, 1, 45000, 119000, 0, 0, NULL, '', '2023-01-20 18:21:48', '2023-02-28 11:04:47'),
(899, '788', 'PB TOYOTA TERCEL 94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:22:52', '2023-01-20 18:22:52'),
(900, '676', 'PB TOYOTA TERCEL 90-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 18:25:11', '2023-01-20 18:25:11'),
(901, '87860', 'PB HYUNDAI SANTA FE C/S 2013', NULL, 8, 2, 1, NULL, 0, 45000, 149000, 1, 2, NULL, '', '2023-01-20 18:28:11', '2023-02-22 17:45:25'),
(902, '87860', 'PB HYUNDAI SANTA FE  S/S 2013', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 3, 3, 1, '', '2023-01-20 18:29:17', '2023-01-20 18:29:17'),
(903, '4396', 'PB HYUNDAI TUCSON 2015', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, NULL, '', '2023-01-20 18:30:08', '2023-03-03 10:15:27'),
(904, '3239', 'PB HYUNDAI SONATA 2010', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 18:30:59', '2023-01-20 18:30:59'),
(905, '2114', 'PB HYUNDAI SONATA 97', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 3, 3, 1, '', '2023-01-20 18:33:07', '2023-01-20 18:33:07'),
(906, '57890', 'PB HYUNDAI NEW TUCSON 2010-2015', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 2, 3, 1, '', '2023-01-20 18:33:50', '2023-02-06 16:43:48'),
(907, '211212237', 'PB HYUNDAI  TUCSON 2004-10', NULL, 8, 2, 1, NULL, 1, 45000, 130000, 0, 2, 1, '', '2023-01-20 18:39:07', '2023-02-13 15:17:28'),
(908, 'FW2963', 'PB HYUNDAI SANTA FE 5D 06-12 C/CALUGA ARRIBA S/DEF', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 1, 1, '', '2023-01-20 18:39:50', '2023-02-17 10:38:53'),
(909, 'W798', 'PB HYUNDAI ACCENT 94-99', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 2, NULL, '', '2023-01-20 18:40:29', '2023-02-27 18:07:28'),
(910, '2162', 'PB HYUNDAI ACCENT PRIME 00-05', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:41:21', '2023-01-20 18:41:21'),
(911, '2228', 'PB HYUNDAI ELANTRA 01-05', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:42:02', '2023-01-20 18:42:02'),
(912, '2010', 'PB HYUNDAI ELANTRA 96-00', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:42:46', '2023-01-20 18:42:46'),
(913, '2710', 'PB HYUNDAI ELANTRA 04-10', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:44:18', '2023-01-20 18:44:18');
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `id_categ`, `id_proveedor`, `id_subcateg`, `impuestos`, `estado`, `precio_costo`, `precio_venta`, `stock`, `stock_min`, `maneja_inventario`, `imagen`, `created_at`, `updated_at`) VALUES
(914, '5878', 'PB HYUNDAI ELANTRA 2012-16', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:44:56', '2023-01-20 18:44:56'),
(915, '01820', 'PB HYUNDAI PORTER 89-97', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 1, 1, 1, '', '2023-01-20 18:45:43', '2023-02-16 10:53:36'),
(916, '1359', 'PB HYUNDAI  H-100 95  MITSUB L300', NULL, 8, 2, 1, NULL, 1, 40000, 129000, 2, 1, NULL, '', '2023-01-20 18:46:17', '2023-03-01 09:45:33'),
(917, '55390', 'PB HYUNDAI NEW H-100  04-10', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 2, 1, NULL, '', '2023-01-20 18:47:03', '2023-02-20 15:16:39'),
(918, '1898', 'PB HYUNDAI H1 98-07 / JAC REFINE', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 1, 1, '', '2023-01-20 18:48:00', '2023-02-17 09:18:21'),
(919, '55980', 'PB HYUNDAI NEW H1 2008', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 2, 1, NULL, '', '2023-01-20 18:48:44', '2023-02-22 17:47:38'),
(920, '688', 'PB HYUNDAI ELANTRA SEDAN  90-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-20 18:49:30', '2023-01-20 18:49:30'),
(921, '20110', 'PB HYUNDAI ATOS 98', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 18:50:07', '2023-01-21 12:29:21'),
(922, '27240', 'PB HYUNDAI ATOS PRIME 2000', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-20 18:50:58', '2023-01-21 12:30:04'),
(923, '2848', 'PB HYUNDAI TERRACAN 2001', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 1, 2, NULL, '', '2023-01-20 18:51:29', '2023-02-20 16:09:28'),
(924, 'A2540', 'PB RENAULT  DUSTER  2012', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:31:45', '2023-01-21 12:31:45'),
(925, '28360', 'PB SUBARU FORESTER 02-06', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:33:41', '2023-01-21 12:33:41'),
(926, '2543', 'PB SUBARU IMPREZA 2001', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:36:36', '2023-01-21 12:36:36'),
(927, '2489', 'PB SUBARU LEGACY  05-09  OUTBACK', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:37:41', '2023-01-21 12:37:41'),
(928, 'A063', 'PB SUBARU LEGACY C/S C/L 2015', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:43:26', '2023-01-21 12:43:26'),
(929, '609', 'PB SUBARU JUSTY 89-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:44:48', '2023-01-21 12:44:48'),
(930, '530', 'PB SUBARU LOYALE 85-91', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:45:23', '2023-01-21 12:45:23'),
(931, '49760LFW', 'PB HYUNDAI I 10 2013', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 2, 1, NULL, '', '2023-01-21 12:54:04', '2023-03-01 09:50:12'),
(932, '050', 'PB HYUNDAI I 20 2016', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 12:54:49', '2023-01-21 12:54:49'),
(933, '05350', 'PB HYUNDAI EON 2011', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:55:29', '2023-01-21 12:55:29'),
(934, '54650', 'PB HYUNDAI NEW ACCENT 06-13', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 12:56:48', '2023-01-21 12:56:48'),
(935, '50690', 'PB HYUNDAI GETZ 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 12:57:25', '2023-01-21 12:57:25'),
(936, '88350', 'PB HYUNDAI CRETA 2015 S/S', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 1, 1, NULL, '', '2023-01-21 12:58:00', '2023-02-27 11:09:49'),
(937, '56940', 'PB HYUNDAI I 10 07-13', NULL, 8, 2, 1, NULL, 1, 59000, 129000, 2, 2, NULL, '', '2023-01-21 12:58:47', '2023-02-20 17:50:08'),
(938, '28730', 'PB SUZUKI IGNIS 2001', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 3, 3, 1, '', '2023-01-21 12:59:51', '2023-01-21 12:59:51'),
(939, '05350', 'PB SUZUKI ALTO 800 2013', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 3, 1, 1, '', '2023-01-21 13:00:49', '2023-02-01 11:35:34'),
(940, '19620', 'PB SUZUKI ALTO 99', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 13:01:22', '2023-01-21 13:01:22'),
(941, '220117327', 'PB CARRY 98-04', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 13:02:06', '2023-01-21 13:02:06'),
(942, '19920', 'PB SUZUKI JIMMY 2001', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:02:47', '2023-01-21 13:02:47'),
(943, '19590', 'PB  MASTERVAN  2001', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:03:25', '2023-01-24 20:20:56'),
(944, '54260', 'PB SUZUKI APV 2006   RALLADO', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-21 13:04:09', '2023-01-24 20:20:25'),
(945, '2079', 'PB SUZUKI BALENO 1996', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:08:06', '2023-01-21 13:08:06'),
(946, '17180', 'PB SUZUKI DZIRE 2018', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:08:41', '2023-01-21 13:08:41'),
(947, '2741', 'PB SUZUKI XL-7 2007', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 13:09:34', '2023-01-21 13:09:34'),
(948, '54340', 'PB SUZUKI SX4 2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:10:18', '2023-01-21 13:10:18'),
(949, '13460', 'PB SUZUKI ALTO 88-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:11:00', '2023-01-21 13:11:00'),
(950, 'W615', 'PB SUZUKI 84-99 VITARA', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 13:12:03', '2023-01-21 13:12:03'),
(951, '10020', 'PB SUZUKI MARUTI 1995', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:12:39', '2023-01-21 13:12:39'),
(952, '2105', 'PB SUZUKI GRAN VITARA 99-2005 / XL7', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 6, 2, 1, '', '2023-01-21 13:13:26', '2023-02-02 11:32:14'),
(953, 'W619', 'PB SUZUKI SWIFT 3 PTAS 89-95', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 13:14:07', '2023-01-21 13:14:07'),
(954, 'W618', 'PB SUZUKI SWIFT 4 PTAS 89-95', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 13:14:53', '2023-01-21 13:14:53'),
(955, '5243BLFW', 'PB CHEVROLET D MAX 04-2013 C/VIN', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 5, 1, 1, '', '2023-01-21 14:00:14', '2023-02-17 09:27:23'),
(956, '0510', 'PB SUZUKI CELERIO 2015', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 4, 4, 1, '', '2023-01-21 14:43:22', '2023-01-21 14:43:22'),
(957, '57300', 'PB SUZUKI CELERIO 2009', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 3, 3, 1, '', '2023-01-21 14:43:59', '2023-01-21 14:43:59'),
(958, '0330', 'PB CARRY 85-94', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 14:45:49', '2023-01-21 14:45:49'),
(959, '86730', 'PB VOLEX C 30 2010', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 2, 1, 1, '', '2023-01-21 14:46:27', '2023-01-28 11:45:23'),
(960, '2299', 'PB SUZUKI AERIO 01-08', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 14:47:11', '2023-01-21 14:47:11'),
(961, '53340', 'PB SUZUKI GRAN NOMADE 2006', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 3, 3, 1, '', '2023-01-21 14:47:51', '2023-01-21 14:47:51'),
(962, '220405084', 'PB SUZUKI SWIFT 2012', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 7, 7, 1, '', '2023-01-21 14:48:44', '2023-01-21 14:48:44'),
(963, '2030', 'PB SUZUKI NEW BALENO 2016', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 0, 1, NULL, '', '2023-01-21 14:49:26', '2023-02-27 12:09:55'),
(964, '2111119404', 'PB SUZUKI SWIFT 2004', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 2, 2, 1, '', '2023-01-21 14:50:06', '2023-01-21 14:50:06'),
(965, '2620', 'PB SUZUKI SWIFT 2017', NULL, 8, 2, 1, NULL, 1, 1000, 1000, 3, 4, 1, '', '2023-01-21 14:50:46', '2023-02-03 12:29:32'),
(966, '200105362', 'PB SUZUKI SWIFT 2004', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 14:51:30', '2023-01-21 14:51:30'),
(967, '0', '0', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, NULL, '', '2023-01-21 14:52:02', '2023-02-20 11:16:38'),
(968, '0', '0', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, 1, '', '2023-01-21 14:52:35', '2023-02-11 11:39:02'),
(969, '75180', 'PB MINYI HF 10  2012', NULL, 8, 2, 1, 'No Mostrar', 1, 1000, 1000, 1, 1, 1, '', '2023-01-21 14:53:24', '2023-01-21 14:53:24'),
(970, '26640', 'SAMSUNG SM3 PARABRISAS', NULL, 8, 2, 1, NULL, 1, 37000, 135000, 2, 1, 1, '', '2023-01-23 12:25:49', '2023-02-01 10:21:14'),
(971, '54350', 'ACTYON TRAS DER VERDE', NULL, 6, 2, 1, NULL, 1, 17000, 95000, 2, 1, 1, '', '2023-01-23 12:38:24', '2023-01-31 10:52:58'),
(972, '54350', 'ACTYON TRAS IZQ', NULL, 6, 2, 1, NULL, 1, 17000, 95000, 3, 3, 1, '', '2023-01-23 12:39:12', '2023-01-31 10:52:18'),
(973, 'A007', 'RENAULT CLIO 2019 HB  C/SENSOR PB', 'C SENSOR', 8, 2, 1, 'No Mostrar', 1, 79000, 179000, 1, 1, 1, '', '2023-01-23 15:30:23', '2023-01-23 15:31:18'),
(974, '5435', 'PB ACTYON KYRON 04', NULL, 8, 2, 1, NULL, 1, 42000, 139000, 2, 5, NULL, '', '2023-01-23 20:38:00', '2023-02-20 16:34:11'),
(975, '0800', 'MUSSO 2021 C/C C/S', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 179000, 1, 1, 1, '', '2023-01-23 20:38:51', '2023-01-23 20:38:51'),
(976, '2818', 'REXTON 2006-  PB', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 139000, 1, 1, 1, '', '2023-01-23 20:39:49', '2023-01-23 20:39:49'),
(977, '28180', 'REXTON 04/17  PB', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 139000, 1, 1, 1, '', '2023-01-23 20:41:48', '2023-01-23 20:41:48'),
(978, '73070', 'HOVER/ HAVAL H 5 2005- PB', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 145000, 1, 1, 1, '', '2023-01-23 20:42:53', '2023-01-23 20:42:53'),
(979, '2570', 'MAXUS T 60 CON ANT C/S Y CAMARA PB', NULL, 8, 2, 1, 'No Mostrar', 1, 85000, 189000, 1, 1, 1, '', '2023-01-23 20:44:41', '2023-01-23 20:46:49'),
(980, '2570', 'MAXUS T 60 C/ANT PB', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 169000, 5, 1, 1, '', '2023-01-23 20:45:44', '2023-01-23 20:46:21'),
(981, '2570', 'MAXUS T 60 CON AN  Y C/S  2017- PB', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 159000, 2, 1, 1, '', '2023-01-23 20:47:59', '2023-01-23 20:47:59'),
(982, '3488', 'PB NISSAN VERSA 2012-', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 1, 1, NULL, '', '2023-01-24 12:34:47', '2023-02-27 11:12:16'),
(983, 'FW02391', 'PB NISSAN TITAN-ARMADA 2004 2D /4D', NULL, 8, 2, 1, 'No Mostrar', 1, 104000, 210000, 1, 1, 1, '', '2023-01-24 19:25:08', '2023-01-24 19:25:08'),
(984, '28940', 'PB FIAT FIORINO S/ANT', NULL, 8, 2, 1, 'No Mostrar', 1, 48000, 129000, 1, 1, 1, '', '2023-01-24 19:27:01', '2023-01-24 19:27:01'),
(985, '220218364', 'PB GRAN PUNTO 2005-', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:28:10', '2023-01-24 19:28:10'),
(986, '24330', 'PB FIAT PALIO 96-', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 3, 1, 1, '', '2023-01-24 19:28:52', '2023-01-24 19:28:52'),
(987, '55840', 'PB FIAT FIORINO CITY 05-', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 4, 1, NULL, '', '2023-01-24 19:31:45', '2023-02-21 15:11:26'),
(988, '24320', 'PB FIAT BRAVA 95-01', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:33:04', '2023-01-24 19:33:04'),
(989, '58120', 'PB FIAT DOBLO /MAXI 2011-', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 2, 1, NULL, '', '2023-01-24 19:36:20', '2023-02-20 11:04:13'),
(990, '28950', 'PB FIAT DOBLO 01/10', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 2, 1, NULL, '', '2023-01-24 19:38:17', '2023-02-20 11:15:05'),
(991, '210216235', 'DAEWOO RACER  84/94', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:39:42', '2023-01-24 19:39:42'),
(992, '16890', 'DAEWOO GRAVEN/HEAVEN 94/97', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:41:32', '2023-01-24 19:41:32'),
(993, '2077', 'PB DAEWOO NUBIRA 97/02', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:42:16', '2023-01-24 19:42:16'),
(994, '2076', 'PB DAEWOO LANOS 97/02', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:44:00', '2023-01-24 19:44:00'),
(995, '2707', 'PB HONDA CRV 06/11', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:46:09', '2023-01-24 19:46:09'),
(996, '210546288', 'PB HONDA CRV 95/01', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:50:07', '2023-01-24 19:50:07'),
(997, '00007', 'PB HONDA PRELUDE 97-', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 139000, 1, 1, 1, '', '2023-01-24 19:51:18', '2023-01-24 19:51:18'),
(998, '822', 'PB HONDA CIVIC LX 96/00 4 PTAS', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 19:52:34', '2023-01-24 19:52:34'),
(999, '87560', 'PB CRV 2012-', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 139000, 1, 1, 1, '', '2023-01-24 19:54:25', '2023-01-24 19:54:25'),
(1000, '703', 'PB HONDA CIVIC LSI 91/95', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 20:14:29', '2023-01-24 20:14:29'),
(1001, '2631', 'PB HONDA FIT 2001-', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 0, 1, NULL, '', '2023-01-24 20:17:37', '2023-02-27 10:53:09'),
(1002, '2294', 'PB HONDA CRV 02/06', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 129000, 1, 1, 1, '', '2023-01-24 20:19:41', '2023-01-24 20:19:41'),
(1003, '54660', 'PB SPRINTER 2015', NULL, 8, 2, 1, NULL, 1, 115000, 229000, 1, 1, NULL, '', '2023-01-24 20:32:18', '2023-03-04 09:30:42'),
(1004, '02276', 'PB SPRINTER 2006- C/S C/C', NULL, 8, 2, 1, NULL, 1, 115000, 259000, 1, 1, NULL, '', '2023-01-24 20:33:13', '2023-03-04 09:31:51'),
(1005, '1488', 'PB SPRINTER 95-', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 159000, 3, 1, 1, '', '2023-01-24 20:33:56', '2023-01-24 20:33:56'),
(1006, '57190', 'PB PEUGEOT EXPERT 07-12 S/S', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 159000, 2, 1, 1, '', '2023-01-24 20:34:46', '2023-01-24 20:34:46'),
(1007, '56320', 'PB PUEGEOT BOXER 2012- C/S', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 169000, 1, 1, 1, '', '2023-01-24 20:35:30', '2023-01-24 20:35:30'),
(1008, '5632', 'PB PEUGEOT BOXER 2012- S/S', NULL, 8, 2, 1, NULL, 1, 55000, 159000, 2, 1, 1, '', '2023-01-24 20:36:23', '2023-02-11 09:14:17'),
(1009, '05213', 'PB PEUGEOT SPRINTER 2019- C/S C/C', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 179000, 2, 1, 1, '', '2023-01-24 20:37:12', '2023-01-24 20:37:12'),
(1010, '50120', 'PB MIT CANTER FUSO C ANGOSTA 2016- 154X74', NULL, 8, 2, 1, NULL, 1, 59000, 165000, 2, 1, 1, '', '2023-01-24 20:39:22', '2023-02-15 15:58:19'),
(1011, '27690', 'PB MIT CANTER C ANG GOMA 06-16 68X153', NULL, 8, 2, 1, 'No Mostrar', 1, 45000, 159000, 2, 1, 1, '', '2023-01-24 20:41:18', '2023-01-24 20:41:18'),
(1012, '2541', 'PB MIT CANTER FUSO 06/2017 C ANCHA 74X183', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 3, 2, 1, '', '2023-01-24 20:44:39', '2023-02-02 11:26:50'),
(1013, '19370', 'PB CANTER HD C ANG 96- 76X154', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 159000, 1, 1, 1, '', '2023-01-24 20:47:34', '2023-01-24 20:47:34'),
(1014, '11600', 'PB CANTER HD C ANG 98/05', NULL, 8, 2, 1, 'No Mostrar', 1, 60000, 149000, 1, 1, 1, '', '2023-01-24 21:00:55', '2023-01-24 21:00:55'),
(1015, '08870', 'PB CANTER C ANCHA 98/05 77X184', NULL, 8, 2, 1, 'No Mostrar', 1, 65000, 179000, 1, 1, 1, '', '2023-01-24 21:02:11', '2023-01-24 21:02:11'),
(1016, '08911', 'PB CANTER  C ANGOSTA  69X150 85-96', NULL, 8, 2, 1, 'No Mostrar', 1, 55000, 159000, 1, 1, 1, '', '2023-01-24 21:12:58', '2023-01-24 21:12:58'),
(1017, '00010', 'PB CANTER 98/04 73X184', NULL, 8, 2, 1, 'No Mostrar', 1, 57000, 159000, 2, 1, 1, '', '2023-01-24 21:27:38', '2023-01-24 21:27:38'),
(1018, '01920', 'PB CANTER 73X180 89/97 C ANCHA', NULL, 8, 2, 1, '', 1, 65000, 165000, 4, 1, 1, '', '2023-01-24 21:29:29', '2023-01-25 09:46:07'),
(1019, '26980', 'PB ACTROS S/S 2005', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 0, 1, 1, '', '2023-01-27 15:03:58', '2023-02-02 09:42:07'),
(1020, 'L00102414', 'PB MITS CANTER 66X147 83-89 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 2, 1, '', '2023-01-27 15:05:49', '2023-01-27 15:05:49'),
(1021, '26970', 'PB ACTROS 96 S/S', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 2, NULL, '', '2023-01-27 15:13:10', '2023-02-27 10:11:40'),
(1022, '26970', 'PB ACTROS 96 C/S', NULL, 8, 2, 1, NULL, 1, 65000, 650005, 5, 5, 1, '', '2023-01-27 15:13:58', '2023-02-02 09:43:44'),
(1023, '64330', 'PB JAC SUNRISE 2011 C/ANTENA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 15:15:05', '2023-01-27 15:15:05'),
(1024, '55050LFW', 'PB MAN TGA TGS 28.350  2D 2002 C/ANGOSTA VERDE', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 1, 1, '', '2023-01-27 15:18:36', '2023-02-17 09:32:00'),
(1025, '5505', 'PB MAN 2008 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 4, 1, 1, '', '2023-01-27 15:19:53', '2023-02-17 09:32:49'),
(1026, '02610', 'PB NQR Y NPR  85-93 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-27 15:28:51', '2023-01-27 15:28:51'),
(1027, '08910', 'PB CANTER FE 300 151X66 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 15:30:46', '2023-01-27 15:30:46'),
(1028, '54870', 'PB NQR 2009 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-27 15:56:58', '2023-01-27 15:56:58'),
(1029, '2924', 'PB NQR / NPR 816 187X81  2009 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 3, NULL, '', '2023-01-27 15:58:39', '2023-02-27 12:11:10'),
(1030, '59330', 'PB FTR/FVR/FSR 80X214 2009 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:05:21', '2023-01-27 16:05:21'),
(1031, '02610', 'PB NKR 84-93 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:06:18', '2023-01-27 16:06:18'),
(1032, '02600', 'PB NKR 84-93 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:09:31', '2023-01-27 16:09:31'),
(1033, '28510', 'PB HYUNDAI MIGTHY HD 78,HD72,HD65  1998-2011', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 4, NULL, '', '2023-01-27 16:11:25', '2023-03-01 10:36:31'),
(1034, '2851', 'PB MITSUB HD 35 / HD 45  2012', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 4, 4, 1, '', '2023-01-27 16:13:55', '2023-01-27 16:13:55'),
(1035, '1927', 'PB NKR   94  C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 3, 4, 1, '', '2023-01-27 16:34:32', '2023-02-13 16:39:42'),
(1036, '23290', 'PB SCANIA SERIE 4   1994', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 5, 1, '', '2023-01-27 16:35:51', '2023-01-27 16:35:51'),
(1037, 'SL120227267', 'PB HINO  XZU 76X165 2013 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:37:32', '2023-01-27 16:37:32'),
(1038, '26930', 'PB PEUGEOT BOXER 94\'06', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-27 16:38:39', '2023-01-27 16:38:39'),
(1039, '5719', 'PB PEUGEOT EXPERT C/S 2006', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:39:55', '2023-01-27 16:39:55'),
(1040, '28030', 'PB HINO 500 2003 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-27 16:41:47', '2023-01-27 16:41:47'),
(1041, '211122010/28040', 'PB HINO 500 2001  C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 80000, 169000, 0, 1, NULL, '', '2023-01-27 16:43:12', '2023-02-20 16:17:16'),
(1042, 'W997', 'PB FORD CARGO EN GOMA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-27 16:44:00', '2023-01-27 16:44:00'),
(1043, '27990', 'PB HINO XZU EN GOMA 2002 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-27 16:45:33', '2023-01-27 16:45:33'),
(1044, '24810', 'PB HINO EN GOMA 2002 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 11, 11, 1, '', '2023-01-27 16:47:34', '2023-01-27 16:47:34'),
(1045, '45820', 'PB FORD CARGO PEGADO 2011', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-27 16:48:30', '2023-01-27 16:48:30'),
(1046, '130926158', 'PB FREIGLANDER CENTURY 97', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:49:39', '2023-01-27 16:49:39'),
(1047, '00540', 'PB HINO DYNA   80-84', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:50:25', '2023-01-27 16:50:25'),
(1048, 'FW759', 'PB HINO 89 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:51:17', '2023-01-27 16:51:17'),
(1049, '4487', 'PB YUEJING 2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:52:12', '2023-01-27 16:52:12'),
(1050, '59760', 'PB HINO XZU PEGADO  2011 C/ANCHA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 5, 1, '', '2023-01-27 16:53:27', '2023-01-27 16:53:27'),
(1051, 'FW2460', 'PB BMW X3 03-10 C/SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 16:55:36', '2023-01-27 16:55:36'),
(1052, '11223344', 'Prueba1', 'Descriocion1', 9, 8, 2, NULL, 1, 10000, 15000, 12, 1, 1, '', '2023-01-27 16:59:09', '2023-01-27 16:59:09'),
(1053, '50500', 'PB CHEVROLET OPTRA 03-15 S/ANTENA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 17:03:49', '2023-02-15 11:23:37'),
(1054, '2673', 'PB TOYOTA COROLLA 03-08', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 17:05:16', '2023-01-27 17:05:16'),
(1055, '2771', 'PB PEUGEOT 307 02-08 S/SENSOR C/MOLDURA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-27 17:09:29', '2023-01-27 17:09:29'),
(1056, 'A1930', 'LUNETA SUZUKI BALENO 2016 PRIVACE', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 1, 1, 1, '', '2023-01-27 17:10:40', '2023-02-15 15:50:55'),
(1057, '22456TRD2', 'NISSAN NAVARA-PATHFINDER 06-09 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 12000, 12000, 2, 2, 1, '', '2023-01-27 17:14:44', '2023-01-27 17:14:44'),
(1058, '50930', 'PB HINO NEW 2003', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:50:06', '2023-01-28 11:50:06'),
(1059, '04010', 'PB IVECO EURO CARGO 91', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-28 11:50:56', '2023-01-28 11:50:56'),
(1060, '1383', 'PB INTER 9002    2000-06', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:52:39', '2023-01-28 11:52:39'),
(1061, '0383', 'PB MB TRUEK 911 67', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:54:04', '2023-01-28 11:54:04'),
(1062, '1310', 'PB KENWORTH  97-08', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:54:57', '2023-01-28 11:54:57'),
(1063, '112', 'PB COLUMBIA CENTURY  96-07', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:56:26', '2023-01-28 11:56:26'),
(1064, '1451', 'PB INTER 7600  00-06', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-28 11:57:38', '2023-01-28 11:57:38'),
(1065, 'HKF556', 'PB MB 1617/2632/     1989', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 11:58:34', '2023-01-28 11:58:34'),
(1066, '52790', 'PB SCANI 111    68-81', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:04:08', '2023-01-28 12:04:08'),
(1067, '04750', 'PB SCANIA 112    82', NULL, 8, 2, 1, NULL, 1, 65000, 650003, 2, 3, 1, '', '2023-01-28 12:04:54', '2023-02-06 09:43:11'),
(1068, '200804033', 'PB VOLVO C/S FH12   98', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-28 12:05:42', '2023-01-28 12:05:42'),
(1069, '332', 'PB VOLVO S/S FH12   98', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 5, 1, '', '2023-01-28 12:06:27', '2023-01-28 12:06:27'),
(1070, '210616039', 'PB IVECO EURO CARGO 2000    91', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:07:12', '2023-01-28 12:07:12'),
(1071, '26080', 'PB MB 2226         80    80X215', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:08:02', '2023-01-28 12:08:02'),
(1072, 'LL1007257', 'PB IVECO EURO CARGO   80.5X220', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:09:26', '2023-01-28 12:09:26'),
(1073, '0', '0', NULL, 8, 2, 1, NULL, 0, 1, 1, 0, 1, 1, '', '2023-01-28 12:10:58', '2023-02-11 11:04:57'),
(1074, '210210183', 'PB BORA 99-06', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:12:22', '2023-01-28 12:12:22'),
(1075, '728', 'PB   GOL/ VENTO A3  91-96', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-28 12:13:02', '2023-02-11 11:00:45'),
(1076, '5161', 'PB GOLF A5 2006', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-28 12:13:37', '2023-01-28 12:13:37'),
(1077, '2067', 'PB PASSAT 98-05', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:14:20', '2023-01-28 12:14:20'),
(1078, '220403354', 'PB GOLF A7 2013', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 1, 1, NULL, '', '2023-01-28 12:14:59', '2023-02-27 10:34:00'),
(1079, '27020', 'PB POLO CLASSIC 00-04', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:15:54', '2023-01-28 12:15:54'),
(1080, '2006FW', 'PB GOLF A3 3D/4D/5D  97-99  VENTO CAL/ABAJO', NULL, 8, 2, 1, NULL, 1, 54000, 129000, 2, 1, 1, '', '2023-01-28 12:16:36', '2023-02-17 10:37:53'),
(1081, 'W416', 'PB KOMBI EN GOMA  80-95', NULL, 8, 2, 1, NULL, 1, 65000, 169000, 1, 1, 1, '', '2023-01-28 12:17:20', '2023-02-02 17:36:31'),
(1082, '51760', 'PB V50 SW 2003', NULL, 8, 2, 1, NULL, 0, 65000, 65000, 0, 0, 1, '', '2023-01-28 12:18:04', '2023-02-02 17:15:16'),
(1083, 'F220', 'PB SCANIA SERIE 6 C/SENSOR 2018', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-28 12:18:57', '2023-01-28 12:18:57'),
(1084, '23520', 'PB IVECO EURO CARGO  94', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:19:35', '2023-01-28 12:19:35'),
(1085, '2540', 'PB NEW ACTROS C/S Y CAMARA C/ANCHA 2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-28 12:20:32', '2023-01-28 12:20:32'),
(1086, '53530', 'PB SCANIA SERIE 5 2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 5, 5, 1, '', '2023-01-28 12:21:05', '2023-01-28 12:21:05'),
(1087, '2480', 'PB NEW ACTROS 2018 C7ANGOSTA  2018', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:21:54', '2023-01-28 12:21:54'),
(1088, '04030', 'PB NEW ACTROS 2018 C/ANGOSTA', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-28 12:22:45', '2023-01-28 12:22:45'),
(1089, '056', 'PB FH13 C/S Y CAMARA 2018', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-28 12:23:32', '2023-01-28 12:23:32'),
(1090, '57750', 'PB MB 1414 C7ANCHA    89', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-28 12:24:15', '2023-01-28 12:24:15'),
(1091, '12345', 'Prueba2', 'Descripcion2', 9, 8, 2, NULL, 1, 5000, 10000, 38, 10, 1, '', '2023-01-30 01:49:38', '2023-01-30 01:49:38'),
(1092, '5602', 'PB NEW BERLINGO 2011', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 2, 3, NULL, '', '2023-01-30 15:15:27', '2023-02-27 17:57:45'),
(1093, '6839', 'PB CITROEN BERLINGO / PARTNER 2020-', NULL, 8, 2, 1, NULL, 1, 65000, 169000, 4, 2, NULL, '', '2023-01-30 15:47:58', '2023-03-03 17:41:25'),
(1094, '2700B', 'PB CHEVROLET ZAFIRA 99/05', NULL, 8, 2, 1, NULL, 1, 57000, 139000, 1, 1, 1, '', '2023-01-30 15:50:34', '2023-01-30 15:50:34'),
(1095, '24270', 'PB 206/207 COMPAC  SIN', NULL, 8, 2, 1, NULL, 1, 48000, 139000, 1, 1, 1, '', '2023-01-30 15:54:59', '2023-01-30 15:54:59'),
(1096, '210622082', 'PB 308 CON SENSOR  2007-', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 1, 1, 1, '', '2023-01-30 15:55:57', '2023-01-30 15:55:57'),
(1097, '5854', 'CINTROEN C 3  SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 45000, 145000, 4, 1, 1, '', '2023-01-30 15:57:43', '2023-01-30 15:57:43'),
(1098, '2887', 'PB CITROEN C 3 2006-  SIN', NULL, 8, 2, 1, NULL, 1, 45000, 145000, 1, 1, 1, '', '2023-01-30 15:58:34', '2023-01-30 15:58:34'),
(1099, '58790', 'PB AMAROK SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 49000, 139000, 3, 1, 1, '', '2023-01-30 16:49:29', '2023-01-30 16:49:29'),
(1100, '5879', 'PB AMAROK SENSOR MEDIO', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 2, 2, 1, '', '2023-01-30 17:07:46', '2023-01-30 17:07:46'),
(1101, '5879', 'PB AMAROK SENSOR GOTA', NULL, 8, 2, 1, NULL, 1, 55000, 159000, 2, 2, 1, '', '2023-01-30 17:08:24', '2023-01-30 17:08:24'),
(1102, 'SL121108603', 'PBFREIGHLANDER CLASS C 112 96-07', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-31 09:06:22', '2023-01-31 09:06:22'),
(1103, '150427289', 'PB TOYOTA COASTER BUS 93', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-01-31 09:07:34', '2023-01-31 09:07:34'),
(1104, '44030', 'PB FOTON MINDI 2009', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-31 09:08:24', '2023-01-31 09:08:24'),
(1105, '210917010', 'PB ARGOSY DERECGO 99-09', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 4, 4, 1, '', '2023-01-31 09:09:21', '2023-01-31 09:09:21'),
(1106, '211106009', 'PB ARGOSY IZQ  99-09', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-31 09:13:54', '2023-01-31 09:13:54'),
(1107, '210818047', 'PB COLUMBIA IZQ 96', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-31 09:39:15', '2023-01-31 09:39:15'),
(1108, '1129', 'PB INTER IZQ 9700/9800  92-98', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-01-31 09:40:16', '2023-01-31 09:40:16'),
(1109, '200219638', 'PB INTER IZQ 9002        00-06', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-31 09:53:02', '2023-01-31 09:53:02'),
(1110, 'SL12092296', 'PB INTER IZQ 9000  80-91', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-01-31 09:53:55', '2023-01-31 09:53:55'),
(1111, '5659', 'PB HYUNDAI NEW TUCSON 5R   2021', NULL, 8, 2, 1, NULL, 1, 81000, 169000, 1, 1, 1, '', '2023-02-01 10:23:19', '2023-02-02 11:02:04'),
(1112, 'A122ALFW', 'PB KIA SPORTAGE 16- SIN SENSOR', NULL, 8, 2, 1, NULL, 1, 69000, 159000, 2, 1, NULL, '', '2023-02-01 12:16:59', '2023-02-27 11:11:09'),
(1113, 'BLRA122', 'PB KIA SPORTAGE 16- CON SENSOR', NULL, 8, 2, 1, NULL, 1, 75000, 169000, 2, 1, 1, '', '2023-02-01 12:18:25', '2023-02-01 12:18:25'),
(1114, '0', '0', NULL, 8, 2, 1, NULL, 0, 0, 0, 0, 0, NULL, '', '2023-02-01 16:40:21', '2023-02-27 11:13:30'),
(1115, 'DW1996', 'PB TRACKER 2012 CON SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 2, 1, 1, '', '2023-02-01 17:03:06', '2023-02-03 11:58:02'),
(1116, 'A0760', 'PB MITSUBISHI L 200 2015', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 4, 1, NULL, '', '2023-02-01 17:05:50', '2023-03-01 11:24:14'),
(1117, '50490', 'PB MAHINDRA SCORPIO', NULL, 8, 2, 1, NULL, 1, 54000, 54000, 3, 3, 1, '', '2023-02-01 17:14:01', '2023-02-01 17:14:01'),
(1118, '59440', 'PB MAHINDRA GENIOS 2009', NULL, 8, 2, 1, NULL, 1, 54000, 54000, 1, 1, 1, '', '2023-02-01 17:15:40', '2023-02-01 17:15:40'),
(1119, '2220', 'PB CHEROKEE C/S GOTA 2011', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:16:49', '2023-02-01 17:16:49'),
(1120, '180515367', 'PB CHERY  TIGGO 2014', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:18:28', '2023-02-01 17:18:28'),
(1121, '2664', 'PB SAMSUNG SM3 2005', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:19:24', '2023-02-01 17:19:24'),
(1122, '61840', 'PB JAC J2', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:20:20', '2023-02-01 17:20:20'),
(1123, '75180', 'PB HAFEI MINI FURGON  2012', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:21:46', '2023-02-01 17:21:46'),
(1124, '220928285', 'PB JAC 2015', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-02-01 17:22:43', '2023-02-01 17:22:43'),
(1125, '1530', 'PB FOTON  2015', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:23:40', '2023-02-01 17:23:40'),
(1126, '1540', 'PB FOTON 2016', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:24:43', '2023-02-01 17:24:43'),
(1127, '00320', 'PB TOYOTA HIACE 89', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:25:35', '2023-02-01 17:25:35'),
(1128, '5049', 'PB MAHINDRA SCORPIO 2019', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 17:43:38', '2023-02-01 17:43:38'),
(1129, '2584', 'PB C50GBN  VOLEX  06-11', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:44:45', '2023-02-01 17:44:45'),
(1130, '5171', 'PB MB VITO   2003', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:45:30', '2023-02-01 17:45:30'),
(1131, '3438', 'PB NISSAN VERZA 2012', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 17:49:21', '2023-02-01 17:49:21'),
(1132, '05160', 'PB NISSAN VERZA 2019', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 17:52:07', '2023-02-01 17:52:07'),
(1133, '59400', 'PB CITROEN C4  C/S 2011', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 17:57:25', '2023-02-01 17:57:25'),
(1134, '900CCA007', 'PB RENAULT CLIO HB C/S DYNAMIQUE 2019', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:02:15', '2023-02-01 18:02:15'),
(1135, '2771', 'PB PEUGEOT 307 C/S 2007', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:03:11', '2023-02-01 18:03:11'),
(1136, '5255', 'PB CITROEN C4 2011', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:08:21', '2023-02-01 18:08:21'),
(1137, '3564', 'PB SUBARU IMPREZA 2012', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 1, 1, 1, '', '2023-02-01 18:11:55', '2023-02-17 09:24:42'),
(1138, '58790', 'PB AMAROK S/S 2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 0, NULL, '', '2023-02-01 18:12:53', '2023-02-27 10:55:23'),
(1139, '5879', 'PB AMAROK C/SENSOR MEDIO', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 18:13:54', '2023-02-01 18:13:54'),
(1140, '5879', 'PB AMAROK C/S GOTA 2010', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 18:14:52', '2023-02-01 18:14:52'),
(1141, '1900211305', 'PB CANTER C/ ANGOSTA    1985', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:16:09', '2023-02-01 18:16:09'),
(1142, '5447', 'PB GOL SAVEIRO 94-99', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 2, 2, 1, '', '2023-02-01 18:18:39', '2023-02-10 15:16:26'),
(1143, '954', 'PB MACK IZQ 84-99', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:20:01', '2023-02-01 18:20:01'),
(1144, '953', 'PB MACK DER 84-99', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:20:36', '2023-02-01 18:20:36'),
(1145, '38557', 'PB MACK ALTO IZQ   63-76', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:21:39', '2023-02-01 18:21:39'),
(1146, '1731', 'PB CASCADIA DER 2008', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 3, 3, 1, '', '2023-02-01 18:22:50', '2023-02-01 18:22:50'),
(1147, 'L00319094', 'PB MACK  KSH600 DER 89-09', NULL, 8, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-01 18:23:47', '2023-02-01 18:23:47'),
(1148, '1732', 'PB CASCADIA IZQ 2008', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 2, 2, 1, '', '2023-02-01 18:24:43', '2023-02-02 11:02:56'),
(1149, '919', 'PB INTER BAJO 64.5 IZQ 80-91', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 7, 7, 1, '', '2023-02-01 18:25:29', '2023-02-02 11:02:42'),
(1150, '919', 'PB INTER BAJO 64.5 DER 80-91', NULL, 8, 2, 1, NULL, 1, 65000, 149000, 1, 1, 1, '', '2023-02-01 18:26:11', '2023-02-02 11:02:26'),
(1151, '26980', 'PB ATEGO/AXOR', NULL, 8, 2, 1, NULL, 1, 95000, 210000, 2, 2, 1, '', '2023-02-02 09:41:26', '2023-02-15 16:04:15'),
(1152, '7307', 'PB GREAT WALL HOVER 08- C/S HAVAL H3/H4/H5', NULL, 8, 2, 1, NULL, 1, 55000, 169000, 1, 1, 1, '', '2023-02-02 10:29:51', '2023-02-02 10:29:51'),
(1153, '00010', 'MOLDURAS', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 4, 1, 1, '', '2023-02-02 12:25:24', '2023-02-02 12:25:24'),
(1154, '00011', 'ANTICORROSIVO', NULL, 8, 2, 1, NULL, 1, 7000, 20000, -1, 1, 1, '', '2023-02-02 12:26:05', '2023-02-02 12:58:16'),
(1155, '19', 'PLUMILLAS STANDAR', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 19, 1, 1, '', '2023-02-02 12:26:52', '2023-02-06 16:10:55'),
(1156, '00013', 'URETANO', NULL, 8, 2, 1, NULL, 1, 7000, 10000, 5, 1, 1, '', '2023-02-02 12:27:44', '2023-02-02 12:27:44'),
(1157, 'FW4190', 'PB MAZDA CX 3 15- SENSOR DER', NULL, 8, 2, 1, NULL, 1, 85000, 169000, 1, 1, 1, '', '2023-02-02 12:56:36', '2023-02-03 11:55:14'),
(1158, '57990', 'LUNETA KIA CARENS', NULL, 7, 2, 1, NULL, 1, 57000, 159000, 0, 1, 1, '', '2023-02-02 15:35:03', '2023-02-02 15:35:03'),
(1159, '00012', 'BROCHES PUERTAS', NULL, 6, 2, 1, NULL, 1, 230, 990, 100, 100, 1, '', '2023-02-02 16:08:51', '2023-02-02 16:10:15'),
(1160, '2069', 'PB NISSAN TERRANO IVS', NULL, 8, 2, 1, NULL, 1, 25000, 199000, 13, 1, NULL, '', '2023-02-02 16:14:40', '2023-02-21 15:25:11'),
(1161, '1625', 'PB FREIGHLINER M2 00-06', NULL, 8, 2, 1, NULL, 1, 75000, 199000, 2, 1, 1, '', '2023-02-02 17:01:24', '2023-02-02 17:01:24'),
(1162, '51760', 'PB TOYOTA HIACE 2005-', NULL, 8, 2, 1, NULL, 0, 54000, 159000, 0, 0, 1, '', '2023-02-02 17:13:40', '2023-02-02 17:32:00'),
(1163, '2006', 'PB GOLF JETA 88-', NULL, 8, 2, 1, NULL, 1, 54000, 129000, 1, 1, 1, '', '2023-02-02 17:16:35', '2023-02-02 17:16:35'),
(1164, '51770', 'PB VOLVO C 30 S/S 2003-', NULL, 8, 2, 1, NULL, 1, 54000, 159000, 1, 1, 1, '', '2023-02-02 17:33:17', '2023-02-02 17:33:17'),
(1165, '2988', 'PB VOLVO C 30 C/S', NULL, 8, 2, 1, NULL, 1, 55000, 169000, 1, 1, 1, '', '2023-02-02 17:34:26', '2023-02-02 17:34:26'),
(1166, '17800', 'PB MITSUBISHI ROSA 98 DEGRADE', NULL, 8, 2, 1, NULL, 1, 65000, 139000, 5, 2, 1, '', '2023-02-02 17:42:14', '2023-02-02 17:42:14'),
(1167, '02820', 'PB NPR 94-', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 3, 1, 1, '', '2023-02-02 17:43:12', '2023-02-08 11:01:00'),
(1168, '05350TDR3', 'VIDRIO PUERTA TRASERA IZQUIERDA SUZUKI ALTO 800', NULL, 6, 2, 1, NULL, 1, 12000, 12000, 1, 1, 1, '', '2023-02-04 09:12:16', '2023-02-04 09:12:16'),
(1169, '2386', 'LUNETA HYUNDAI SANTA FE 2007 PRIVACE', NULL, 7, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-04 10:58:27', '2023-02-04 10:58:27'),
(1170, '2386', 'LUNETAS HYUNDAI SANTA FE 2007 VERDE', NULL, 7, 2, 1, NULL, 1, 65000, 65000, 1, 1, 1, '', '2023-02-04 10:59:11', '2023-02-04 10:59:11'),
(1171, '87960', 'VIDRIO PUERTA DELANTERA IZQUIERDA YARIS 2014', NULL, 6, 2, 1, NULL, 1, 23000, 85000, 1, 1, 1, '', '2023-02-04 11:34:30', '2023-02-04 11:34:30'),
(1172, '23086', 'LUNETA STA FE 06- VERDE', NULL, 7, 2, 1, NULL, 1, 159000, 139000, 1, 1, 1, '', '2023-02-06 09:49:26', '2023-02-06 09:49:26'),
(1173, '20', 'PLUMILLAS STANDAR', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 10, 2, 1, '', '2023-02-06 16:11:31', '2023-02-06 16:11:31'),
(1174, '13', 'PLUMILLAS STANDAR', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 19, 2, 1, '', '2023-02-06 16:12:07', '2023-02-06 16:12:07'),
(1175, '14', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 12, 2, 1, '', '2023-02-06 16:12:35', '2023-02-06 16:12:35'),
(1176, '12', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 11, 2, 1, '', '2023-02-06 16:13:03', '2023-02-06 16:13:03'),
(1177, '28', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 25000, 24, 2, 1, '', '2023-02-06 16:13:47', '2023-02-06 16:13:47'),
(1178, '24', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 25000, 13, 2, 1, '', '2023-02-06 16:14:24', '2023-02-06 16:14:24'),
(1179, '18', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 9, 1, 1, '', '2023-02-06 16:15:28', '2023-02-06 16:15:28'),
(1180, '21', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 7, 1, 1, '', '2023-02-06 16:15:28', '2023-02-06 16:15:50'),
(1181, '11', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 5, 2, 1, '', '2023-02-06 16:16:27', '2023-02-06 16:16:27'),
(1182, '22', 'PLUMILLAS ST', NULL, 8, 2, 1, NULL, 1, 7000, 20000, 9, 1, 1, '', '2023-02-07 09:22:02', '2023-02-07 09:22:02'),
(1183, '17', 'PLUMILLAS ST', NULL, 1, 2, 1, NULL, 1, 7000, 20000, 1, 1, 1, '', '2023-02-07 09:45:26', '2023-02-07 09:45:26'),
(1184, '20', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 9, 1, 1, '', '2023-02-07 09:46:16', '2023-02-07 09:47:09'),
(1185, '19', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 10, 1, 1, '', '2023-02-07 09:46:49', '2023-02-07 09:50:52'),
(1186, '17', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 21, 1, 1, '', '2023-02-07 09:47:57', '2023-02-07 09:47:57'),
(1187, '21', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 21, 1, 1, '', '2023-02-07 09:50:37', '2023-02-07 09:50:37'),
(1188, '9', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 9, 1, 1, '', '2023-02-07 09:51:25', '2023-02-07 09:51:25'),
(1189, '22', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 18, 9, NULL, '', '2023-02-07 09:51:53', '2023-02-21 12:33:11'),
(1190, '21', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 26, 27, NULL, '', '2023-02-07 09:52:22', '2023-02-21 12:37:10'),
(1191, '12', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 10, 1, 1, '', '2023-02-07 09:52:57', '2023-02-07 09:52:57'),
(1192, '26', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 7, 1, 1, '', '2023-02-07 09:53:47', '2023-02-07 09:53:47'),
(1193, '14', 'PLUMILLAS HIBRIDAS', NULL, 1, 2, 1, NULL, 1, 7000, 22000, 4, 4, 1, '', '2023-02-07 09:54:20', '2023-02-07 09:54:20'),
(1194, '01390TDR1', 'VIDRIO PUERTA DELANTERA IZQUIERDA D 21', NULL, 6, 2, 1, NULL, 1, 12000, 65000, 3, 1, 1, '', '2023-02-07 17:18:11', '2023-02-07 17:18:57'),
(1195, '01390TDR4', 'VIDRIO PUERTA TRASERA DERECHA NISSAN  D 21 2007', NULL, 6, 2, 1, NULL, 1, 12000, 65000, 2, 1, 1, '', '2023-02-07 17:20:08', '2023-02-07 17:20:08'),
(1196, '01390TDR2', 'VIDRIO PUERTA DELANTERA DERECHA NISSAN  D 21 2007', NULL, 6, 2, 1, NULL, 1, 12000, 65000, 2, 1, 1, '', '2023-02-07 17:21:56', '2023-02-07 17:21:56'),
(1197, '01390TDR4', 'VIDRIO PUERTA TRASERA IZQUIERDA  NISSAN  D 21 2007', NULL, 6, 2, 1, NULL, 1, 12000, 65000, 1, 1, 1, '', '2023-02-07 17:23:16', '2023-02-07 17:24:41'),
(1198, '0', '0', NULL, 9, 8, 2, NULL, 0, 0, 0, 0, 0, 0, '', '2023-02-08 00:55:13', '2023-02-11 11:40:28'),
(1199, '2605', 'PB KIA RIO JB CALUGA ABAJO', NULL, 8, 2, 1, NULL, 1, 12000, 65000, 3, 1, 1, '', '2023-02-09 16:42:43', '2023-02-11 11:07:22'),
(1200, '43050', 'PB CHEV N 300 2012-', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 2, 1, 1, '', '2023-02-11 11:31:56', '2023-02-11 11:31:56'),
(1201, '498', 'CHEV GEMINI 89-', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 2, 1, 1, '', '2023-02-11 11:33:49', '2023-02-11 11:33:49'),
(1202, '59500TRW', 'LUNETA FORD RANGER /BT 50 2011- PRIVACE', NULL, 7, 2, 1, NULL, 1, 45000, 149000, 3, 1, 1, '', '2023-02-13 15:15:09', '2023-02-17 10:16:34'),
(1203, 'FW2516', 'PB HYUNDAI TUCSON 5D 04-10', NULL, 8, 2, 1, NULL, 1, 60000, 139000, 2, 1, 1, '', '2023-02-15 11:18:21', '2023-02-15 16:00:00'),
(1204, 'DB9288', 'LUNETA FORD RANGER ARGENTINA 2D/4D 94-06 VERDE PEGADA', NULL, 7, 2, 1, NULL, 1, 25000, 119000, 1, 1, 1, '', '2023-02-15 11:19:33', '2023-02-16 18:33:30'),
(1205, '94900LFW', 'PB MG ZS / ZX 5D 17 VERDE S/SENSOR', NULL, 8, 2, 1, NULL, 1, 65000, 159000, 0, 0, 1, '', '2023-02-15 11:21:00', '2023-02-15 11:21:00'),
(1206, '5050', 'PB CHEVROLET OPTRA  SW 4D/5D 03-C/ANTENA', NULL, 8, 2, 1, NULL, 1, 60000, 129000, 1, 1, 1, '', '2023-02-15 11:25:05', '2023-02-15 11:25:05'),
(1207, 'FW2539', 'PB KIA SPORTAGE PRO 5D 04-10 S/DEF', NULL, 8, 2, 1, NULL, 1, 60000, 135000, 2, 1, 1, '', '2023-02-15 11:40:54', '2023-02-15 11:40:54'),
(1208, '57720', 'PB VOLK GOL 08- /SAVEIRO/VOYAGE', NULL, 8, 2, 1, NULL, 1, 39000, 129000, 1, 1, NULL, '', '2023-02-15 15:27:29', '2023-03-01 09:40:25'),
(1209, '54470', 'PB VOLK GOL 94-08 CON ANT/SAVEITO 05-08', NULL, 8, 2, 1, NULL, 1, 45000, 139000, 1, 1, 1, '', '2023-02-15 15:28:42', '2023-02-15 15:28:42'),
(1210, '33710', 'VOLK POLO NEW 02- S/MOLD 3 4 Y 5 PTAS', NULL, 8, 2, 1, NULL, 1, 48000, 139000, 1, 1, 1, '', '2023-02-15 16:03:50', '2023-02-15 16:03:50'),
(1211, 'DB9288', 'LUNETA RANGER ARGENTINA  94/06  PEGADA', NULL, 7, 2, 1, NULL, 1, 45000, 129000, 1, 1, NULL, '', '2023-02-15 16:08:42', '2023-02-21 16:34:11'),
(1212, '59500', 'LUNETA RANGER/BT 50 2011- VERDE', NULL, 7, 2, 1, NULL, 1, 45000, 139000, 1, 1, 1, '', '2023-02-15 16:10:27', '2023-02-15 16:10:27'),
(1213, '5787', 'PB VOLK POLO  10-     3 Y 5 PTAS', NULL, 8, 2, 1, NULL, 1, 55000, 149000, 1, 1, 1, '', '2023-02-15 16:14:26', '2023-02-15 16:14:26'),
(1214, '18980', 'LUNETA HYUNDAI H-1 98-2006 C/DEF VERDE', NULL, 7, 2, 1, NULL, 1, 42000, 129000, 2, 1, 1, '', '2023-02-15 16:31:36', '2023-02-15 16:31:36'),
(1215, '2092BTDR1', 'PUERTAS TOYOTA YARIS SPORT 2D  99-05   D/I VERDE', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 2, 2, 1, '', '2023-02-15 16:37:04', '2023-02-15 16:37:04'),
(1216, 'A050', 'PB HYUNDAI   I 20  NORMAL no es active   16-20-', NULL, 8, 2, 1, NULL, 1, 55000, 149000, 2, 1, 1, '', '2023-02-15 16:40:29', '2023-02-16 11:26:38'),
(1217, '56020', 'LT BERLINGO/PARTNER/MAXI/TEPEE 11- VERDE DER', NULL, 7, 2, 1, NULL, 1, 27000, 115000, 2, 1, 1, '', '2023-02-15 16:43:53', '2023-02-15 16:44:09'),
(1218, '5602', 'LT BERLINGO/PARTNER/MAXI/TEPEE 11- VERDE IZQ', NULL, 7, 2, 1, NULL, 1, 28000, 115000, 1, 1, 1, '', '2023-02-15 16:45:14', '2023-02-15 16:45:14'),
(1219, 'F1810', 'LUNETA NISSAN NP300  VERDE CON DEF', NULL, 7, 2, 1, NULL, 1, 45000, 139000, 3, 1, 1, '', '2023-02-15 16:46:59', '2023-02-17 10:34:15'),
(1220, '5727', 'PB LEGACY 2010-', NULL, 8, 2, 1, NULL, 1, 48000, 139000, 1, 1, 1, '', '2023-02-16 10:42:49', '2023-02-16 10:42:49'),
(1221, '20', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 5500, 22000, 10, 4, 1, '', '2023-02-16 12:09:19', '2023-02-16 12:09:19'),
(1222, '19', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 5500, 22000, 9, 4, NULL, '', '2023-02-16 12:10:20', '2023-02-21 12:36:55'),
(1223, '24', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 5500, 22000, 9, 4, NULL, '', '2023-02-16 12:11:18', '2023-02-21 12:18:02'),
(1224, '26', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 6500, 25000, 10, 4, 1, '', '2023-02-16 12:13:07', '2023-02-16 12:13:07'),
(1225, '14', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 5500, 22000, 19, 4, NULL, '', '2023-02-16 12:14:18', '2023-02-21 10:50:49'),
(1226, '17', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 5500, 22000, 20, 4, 1, '', '2023-02-16 12:15:22', '2023-02-16 12:15:22'),
(1227, '28', 'PLUMILLAS HB', NULL, 8, 2, 1, NULL, 1, 7500, 25000, 19, 4, NULL, '', '2023-02-16 12:16:20', '2023-02-21 10:51:05'),
(1228, '27290LFW', 'PARABRISAS VOLKSWAGEN POLO HB 3/5 00-05', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 0, 1, NULL, '', '2023-02-17 09:20:43', '2023-02-20 12:18:47'),
(1229, '58430TDR1', 'SUZUKI SWIFT NEW 4D/5D 12-16 VERDE PUERTA D/I', NULL, 6, 2, 1, NULL, 1, 20000, 75000, 2, 1, 1, '', '2023-02-17 09:42:10', '2023-02-17 09:42:10'),
(1230, '58430TDR2', 'SUZUKI SWIFT  HB  SEDAN 2012-16 D/D VERDE PUERTAS', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 2, 1, NULL, '', '2023-02-17 09:43:32', '2023-02-20 12:07:20'),
(1231, '58430TDR3', 'SUZUKI SWIFT  HB  SEDAN 2012-16 T/I VERDE PUERTAS', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 1, 1, NULL, '', '2023-02-17 09:45:50', '2023-02-27 10:29:54'),
(1232, '58430TDR4', 'SUZUKI SWIFT  HB  SEDAN 2012-16 T/D VERDE PUERTAS', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 1, 1, NULL, '', '2023-02-17 09:47:18', '2023-02-20 12:11:52'),
(1233, '87860TDR2', 'HYUNDAI SANTA FE  5D 2013 VERDE PTA D/D', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 2, 1, 1, '', '2023-02-17 10:21:30', '2023-02-17 10:22:29'),
(1234, '87860TDR4', 'HYUNDAI SANTA FE  5D 2013 PRIVACE T/D PUERTA', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 2, 1, 1, '', '2023-02-17 10:26:24', '2023-02-17 10:26:24'),
(1235, 'FD23073', 'HYUNDAI SANTA FE 5D PRIVACE PTA T/D', NULL, 6, 2, 1, NULL, 1, 20000, 85000, 2, 1, 1, '', '2023-02-17 10:40:54', '2023-02-17 10:40:54'),
(1236, '1001', 'ALETA A MEDIDA', 'ESPECIAL', 1, 8, 1, NULL, 1, 10000, 50000, 1, 1, NULL, '', '2023-02-20 01:40:35', '2023-02-21 02:22:50'),
(1237, '45810', 'PB FIAT NOVO/UNO WAY/FIORINO/FIRE', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 4, 2, NULL, '', '2023-02-20 11:03:47', '2023-02-21 15:11:04'),
(1238, 'FW2006', 'PB GOLF A3 3 4 Y 5 PTAS 97/99 /VENTO C ABAJO', NULL, 8, 2, 1, NULL, 1, 51000, 139000, 1, 1, NULL, '', '2023-02-20 12:21:09', '2023-02-20 12:21:09'),
(1239, '0760', 'LUNETA MIT L 200   2015  VERDE', NULL, 7, 2, 1, NULL, 1, 45000, 129000, 2, 1, NULL, '', '2023-02-20 15:22:25', '2023-02-21 15:54:42'),
(1240, '55980', 'H 1 2007-   IVS', NULL, 8, 8, 1, NULL, 1, 59000, 159000, 8, 1, NULL, '', '2023-02-21 10:35:29', '2023-02-21 11:10:46'),
(1241, '55390', 'H 100 NEW   IVS', NULL, 8, 8, 1, NULL, 1, 65000, 169000, 4, 1, NULL, '', '2023-02-21 12:54:10', '2023-02-21 12:54:10'),
(1242, '1359', 'PB H 100 GOMA 95-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 139000, 2, 0, NULL, '', '2023-02-21 12:54:56', '2023-02-21 12:54:56'),
(1243, '86510', 'PB ACCENT RB    IVS', NULL, 8, 8, 1, NULL, 1, 65000, 179000, 12, 1, NULL, '', '2023-02-21 12:55:39', '2023-02-21 12:55:39'),
(1244, '5602', 'PB NEW BERLINGO /PARTNER 2011-   IVS', NULL, 8, 8, 1, NULL, 1, 65000, 169000, 9, 1, NULL, '', '2023-02-21 12:56:28', '2023-02-27 17:59:44'),
(1245, '57890', 'PB NEW TUCSON 10-14   IVS', NULL, 8, 8, 1, NULL, 1, 65000, 179000, 4, 1, NULL, '', '2023-02-21 12:57:57', '2023-02-21 12:57:57'),
(1246, '02750', 'PB LUV 89-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 149000, 7, 1, NULL, '', '2023-02-21 15:12:40', '2023-02-21 15:12:40'),
(1247, '5243', 'PB  D MAX 04-13    IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 5, 1, NULL, '', '2023-02-21 15:13:21', '2023-02-27 10:51:15'),
(1248, '5936', 'PB D MAX 2014-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 16, 1, NULL, '', '2023-02-21 15:14:11', '2023-02-21 15:14:11'),
(1249, '54390', 'PB AVEO CORTO 06-12', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 2, 1, NULL, '', '2023-02-21 15:14:55', '2023-02-21 15:14:55'),
(1250, '57240', 'PB CHEV SPARK LT   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 7, 1, NULL, '', '2023-02-21 15:15:37', '2023-02-21 15:15:37'),
(1251, '58370', 'PB CHEV SPARK GT', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 3, 1, NULL, '', '2023-02-21 15:16:25', '2023-02-21 15:16:25'),
(1252, '8796', 'PB TOYOTA YARIS 2014-  IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 10, 1, NULL, '', '2023-02-21 15:19:25', '2023-02-21 15:19:25'),
(1253, '24560', 'PB RENAULT CLIO II  IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 10, 1, NULL, '', '2023-02-21 15:20:21', '2023-02-21 15:20:21'),
(1254, 'FW801', 'PB SENTRA II   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 10, 1, NULL, '', '2023-02-21 15:21:07', '2023-02-21 15:22:54'),
(1255, '2510', 'PB NISSAN NAVARA   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 7, 1, NULL, '', '2023-02-21 15:21:43', '2023-02-21 15:21:43'),
(1256, 'FW663', 'PB NISSAN V 16   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 10, 1, NULL, '', '2023-02-21 15:22:24', '2023-02-21 15:22:24'),
(1257, '53850', 'PB KIA FRONTIER II   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 169000, 2, 1, NULL, '', '2023-02-21 15:26:33', '2023-02-21 15:26:33'),
(1258, 'A108', 'PB NISSAN NP 300   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 169000, 4, 1, NULL, '', '2023-02-21 15:27:28', '2023-02-21 15:27:28'),
(1259, '03900', 'PB CORSA SIN ANT   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 10, 1, NULL, '', '2023-02-21 15:48:52', '2023-02-21 15:48:52'),
(1260, '54270', 'PB MIT L 200 06-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 149000, 6, 1, NULL, '', '2023-02-21 15:55:46', '2023-02-22 11:52:51'),
(1261, '3507', 'PB KIA RIO 3, 4 , 5  2011- IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 3, 1, NULL, '', '2023-02-21 15:58:01', '2023-02-21 15:58:01'),
(1262, '30740', 'PB MAZDA B 2500   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 3, 1, NULL, '', '2023-02-21 15:58:39', '2023-02-21 15:58:39'),
(1263, 'F1960', 'PB KIA RIO 2018-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 2, 1, NULL, '', '2023-02-21 16:00:51', '2023-02-21 16:00:51');
INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `id_categ`, `id_proveedor`, `id_subcateg`, `impuestos`, `estado`, `precio_costo`, `precio_venta`, `stock`, `stock_min`, `maneja_inventario`, `imagen`, `created_at`, `updated_at`) VALUES
(1264, '5049', 'PB MAHINDRA', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 3, 1, NULL, '', '2023-02-21 16:02:04', '2023-02-21 16:02:04'),
(1265, '58290', 'PB SPORTAGE  2011-  IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 2, 1, NULL, '', '2023-02-21 16:10:50', '2023-02-21 16:10:50'),
(1266, '54650', 'PB NEW ACCENT SEDAN 06-  IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 8, 1, NULL, '', '2023-02-21 16:12:22', '2023-02-21 16:12:22'),
(1267, '52570', 'PB SWIFT 2008-  IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 2, 1, NULL, '', '2023-02-21 16:25:57', '2023-02-21 16:26:14'),
(1268, '59500', 'PB MAZDA BT 50  NEW  2011-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 169000, 6, 1, NULL, '', '2023-02-21 16:32:09', '2023-02-21 16:32:09'),
(1269, '78980', 'PB SAIL 2015-', NULL, 8, 8, 1, NULL, 1, 55000, 169000, 4, 1, NULL, '', '2023-02-21 16:33:12', '2023-02-21 16:33:12'),
(1270, '2071', 'PB BALENO 97-   IVS', NULL, 8, 8, 1, NULL, 1, 55000, 159000, 5, 1, NULL, '', '2023-02-21 16:35:25', '2023-02-21 16:35:25'),
(1271, '3482', 'PB HYUNDAI ACCENT 2018', NULL, 8, 2, 1, NULL, 0, 50000, 169000, 0, 0, NULL, '', '2023-02-22 17:49:55', '2023-03-02 10:18:17'),
(1272, 'ST220614353', 'PUERTA DEL/IZQ ACCENT HC  2018', NULL, 6, 2, 1, NULL, 1, 65000, 99000, 1, 2, NULL, '', '2023-02-23 12:40:32', '2023-03-01 12:18:58'),
(1273, 'PLUMONES', 'PLUMONES MARCADORES', NULL, 9, 2, 1, NULL, 1, 1500, 1500, 10, 1, NULL, '', '2023-02-23 12:58:08', '2023-02-23 16:13:33'),
(1274, '30740', 'LUNETA MAZDA BT50/B25002.9L 4D 99 /FORD RANGER THAILANDEZA 08 PRIVACE', NULL, 7, 2, 1, NULL, 1, 40000, 139000, 1, 1, NULL, '', '2023-02-24 09:56:26', '2023-02-24 09:56:26'),
(1275, '20690', 'LUNETAS NISSAN D22-D21-TERRANO 4D 98-12 PRIVACE', NULL, 7, 2, 1, NULL, 1, 30000, 129000, 1, 2, NULL, '', '2023-02-24 09:58:28', '2023-02-27 10:51:51'),
(1276, '5936HLFW', 'PB CHEVROL COLORADO2019 C/SENSOR / CAMARA 19 TRAIL BLAZER', NULL, 8, 2, 1, NULL, 1, 75000, 210000, 2, 2, NULL, '', '2023-02-24 17:37:17', '2023-02-24 17:37:17'),
(1277, 'FW04881', 'PB ACCENT 2022 HC', NULL, 8, 2, 1, NULL, 1, 55000, 169000, 1, 1, NULL, '', '2023-02-27 10:15:29', '2023-02-27 10:15:29'),
(1278, '8831', 'PB 308  2014-  C/SENSOR', NULL, 8, 2, 1, NULL, 1, 55000, 169000, 1, 1, NULL, '', '2023-02-27 10:18:03', '2023-02-27 10:18:03'),
(1279, '79270', 'PB JAC S 2  16- S/S', NULL, 8, 2, 1, NULL, 1, 69000, 159000, 1, 1, NULL, '', '2023-02-27 10:19:20', '2023-02-27 10:19:34'),
(1280, '53850', 'VD PTA DEL IZQ FRONTIER II', NULL, 6, 2, 1, NULL, 1, 35000, 99000, 2, 1, NULL, '', '2023-02-27 17:17:36', '2023-02-27 17:17:36'),
(1281, '210816347', 'VD PTA DEL DER FRONTIER I  98-', NULL, 6, 2, 1, NULL, 1, 35000, 99000, 1, 1, NULL, '', '2023-02-27 17:18:49', '2023-02-27 17:18:49'),
(1282, '4607', 'PB TOYOTA RAV 4 2013-  IVS', NULL, 8, 8, 1, NULL, 1, 45000, 179000, 3, 1, NULL, '', '2023-02-27 17:21:12', '2023-02-27 17:21:12'),
(1283, '3488', 'PB NISSAN VERSA 2012-  IVS', NULL, 8, 8, 1, NULL, 1, 45000, 179000, 1, 1, NULL, '', '2023-02-27 17:22:51', '2023-02-27 17:22:51'),
(1284, '28940', 'PB FIAT FIORINO SIN ANT 92-2011  IVS', NULL, 8, 8, 1, NULL, 1, 45000, 149000, 10, 1, NULL, '', '2023-02-27 17:23:52', '2023-02-27 17:23:52'),
(1285, '2653', 'PB NISSAN TIIDA 04/10   IVS', NULL, 8, 8, 1, NULL, 1, 45000, 159000, 4, 1, NULL, '', '2023-02-27 17:25:16', '2023-02-27 17:25:16'),
(1286, '55980TRW', 'LUNETA HYUNDAI H-1 08 C/DEF VERDE S/PERF', NULL, 7, 2, 1, NULL, 1, 55000, 139000, 2, 1, NULL, '', '2023-03-01 09:27:03', '2023-03-01 09:27:03'),
(1287, '5598BTRW', 'LUNETA HYUNDAI H-1 NEW 08 C/DEF VERDE C/PERF', NULL, 7, 2, 1, NULL, 1, 55000, 149000, 2, 2, NULL, '', '2023-03-01 09:28:29', '2023-03-01 09:28:29'),
(1288, '08000LFW', 'PB SSANGYONG REXTON 5D/MUSSOPICKUP 17 VERDE C/DEF C/S', NULL, 8, 2, 1, NULL, 1, 100000, 229000, 1, 1, NULL, '', '2023-03-01 09:30:51', '2023-03-01 09:30:51'),
(1289, '7722CLFW', 'PB PEUGEOT 208 3D/5D 20-/OPEL CORSA 19 VERDE C/S Y CAMARA', NULL, 8, 2, 1, NULL, 1, 110000, 249000, 0, 1, NULL, '', '2023-03-01 09:33:11', '2023-03-01 12:14:27'),
(1290, 'FW3051', 'PB KIA SOUL  5D 10-13', NULL, 8, 2, 1, NULL, 1, 55000, 139000, 2, 2, NULL, '', '2023-03-01 09:34:43', '2023-03-01 09:34:43'),
(1291, '68550LFW', 'PB CHEVROLET N400 19  VERDE', NULL, 8, 2, 1, NULL, 1, 75000, 169000, 1, 1, NULL, '', '2023-03-01 09:36:16', '2023-03-01 09:36:16'),
(1292, '2069ELFW', 'PB NISSAN D 22 TERRANO 2D/4D 98-12', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 1, 1, NULL, '', '2023-03-01 09:38:52', '2023-03-01 09:38:52'),
(1293, 'FW3488', 'PB NISSAN VERZA 4D 12  VERDE', NULL, 8, 2, 1, NULL, 1, 48000, 139000, 1, 1, NULL, '', '2023-03-01 09:43:34', '2023-03-01 09:43:34'),
(1294, 'FW2924', 'PB CHEVROLET NQR 81/3815/913/918-NPR 2D 09 CAB/ANCHA JAC URBAN1042 15', NULL, 8, 2, 1, NULL, 1, 65000, 169000, 2, 2, NULL, '', '2023-03-01 10:34:11', '2023-03-01 10:34:11'),
(1295, '46320LFW', 'PB PEUGEOT 208 3D/5D  12-19 C/SENSOR S/PLACA', NULL, 8, 2, 1, NULL, 1, 65000, 169000, 1, 1, NULL, '', '2023-03-01 10:36:11', '2023-03-01 10:36:11'),
(1296, '5602ALFW', 'PB CITROEN BERLINGO/PEUGEOT PARTNER B9 2D 11-18 S/MOLDURA  MAXI  TEPEE', NULL, 8, 2, 1, NULL, 1, 45000, 129000, 3, 3, NULL, '', '2023-03-01 10:38:31', '2023-03-01 10:38:31'),
(1297, 'FD23074', 'HYUNDAI STA FE 5D 06 PRIVACE T/I PUERTAS', NULL, 6, 2, 1, NULL, 1, 38000, 95000, 2, 2, NULL, '', '2023-03-01 10:41:43', '2023-03-01 10:41:43'),
(1298, '53850TDR2', 'KIA FRONTIER II-2 5L 2D/4D 04- VERDE D/D PUERTAS', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 2, 2, NULL, '', '2023-03-01 10:45:18', '2023-03-01 10:45:18'),
(1299, 'FW623', 'PB TOYOTA HILUX DINAMITA 2D/4D 89-97 GREAT WALL DEER ZXADMIRAL', NULL, 8, 2, 1, NULL, 1, 40000, 129000, 1, 2, NULL, '', '2023-03-01 10:47:29', '2023-03-01 11:17:47'),
(1300, '28160TDR2', 'KIA FRONTIER I 2 98-03 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 1, 1, NULL, '', '2023-03-01 11:29:39', '2023-03-01 11:29:39'),
(1301, '28160TDR2', 'KIA FRONTIER I 2 98-03 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 1, 1, NULL, '', '2023-03-01 11:29:39', '2023-03-01 11:29:39'),
(1302, '28160TDR2', 'KIA FRONTIER I 2 98-03 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 1, 1, NULL, '', '2023-03-01 11:29:39', '2023-03-01 11:29:39'),
(1303, '28160TDR2', 'KIA FRONTIER I 2 98-03 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 1, 1, NULL, '', '2023-03-01 11:29:39', '2023-03-01 11:29:39'),
(1304, '28160TDR2', 'KIA FRONTIER I 2 98-03 VERDE D/D PUERTA', NULL, 6, 2, 1, NULL, 1, 25000, 75000, 1, 1, NULL, '', '2023-03-01 11:29:40', '2023-03-01 11:29:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_empresa` varchar(200) NOT NULL,
  `rut` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `vendedor` varchar(255) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `nombre_banco` varchar(255) DEFAULT NULL,
  `tipo_cuenta` varchar(50) DEFAULT NULL,
  `numero_cuenta` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre_empresa`, `rut`, `telefono`, `vendedor`, `correo`, `direccion`, `nombre_banco`, `tipo_cuenta`, `numero_cuenta`, `estado`, `created_at`, `updated_at`) VALUES
(2, 'FUYAO', '760107247', '945021751', 'AURI PARRA', 'APARRA@FUYAOGLASS.CL', 'AV SANTA ROSA 1729  SANTIAGO', 'BCI', 'CUENTA CORRIENTE', 45642923, 1, '2022-10-26 18:28:18', '2022-10-26 18:28:18'),
(3, 'DISTRIBUIDORA PRESTIGIO LTDA', '760836745', '935532149', 'YARILYS', 'AUTOSPRESTIGIO@GMAIL.COM', 'EXPOSICION  1032  SANTIAGO CENTRO', 'SANTANDER', 'CUENTA CORRIENTE', 64190989, 1, '2022-10-26 19:05:38', '2022-10-26 19:05:38'),
(4, 'COM ANGELINI SPA       (FAVITORR)', '774289569', '944723189', 'MAGALY PARADA', 'MPARADA@FAVITORR.CL', 'AV LO ESPEJO 02590 SAN BERNARDO   SANTIAGO', 'SANTANDER', 'CUENTA CORRIENTE', 84013790, 1, '2022-10-26 19:27:42', '2022-10-26 19:27:42'),
(5, 'DISTRIBUIDORA ARQUETIPO LIMITADA', '780369906', '712299274', 'RODRIGO', 'TALCA@ARQUETIPO.CL', '31 SUR 249  TALCA', 'ESTADO', 'CUENTA CORRIENTE', 1203177, 1, '2022-10-26 21:10:03', '2022-10-26 21:10:03'),
(6, 'MENDEZ Y PADILLA ASES E INV LTDA', '761635727', '979330096', 'MIGUEL PADILLA', 'MIGUEL.PADILLA@VITROCAR.CL', 'AVDA ESPAÑA 647 SAN VICENTE TAGUA TAGUA', 'CHILE', 'CUENTA CORRIENTE', 2050455906, 1, '2022-10-26 21:14:44', '2022-10-26 21:14:44'),
(7, 'SERVIVENTAS SPA', '761218786', '981525082', 'RODRIGO BRAVO', 'RBRAVO@SERVICENTAS.CL', 'AV SAN PABLO 9507 PUDAHUEL   SANTIAGO', 'SANTANDER', 'CUENTA CORRIENTE', 68041902, 1, '2022-10-26 21:17:33', '2022-10-26 21:17:33'),
(8, 'Prueba', '8.123.123-k', '982119696', 'Yohan', 'yohanxp@msn.com', 'Santa Sofía 960\r\nCasa', 'Banco estado', 'CORRIENTE', 2147483647, 0, '2023-01-25 09:49:17', '2023-02-21 02:40:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Sin sub-categoria', 1, '2023-01-25 06:41:36', '2023-01-25 06:41:40'),
(2, 'Prueba', 1, '2023-01-25 09:45:08', '2023-01-25 09:45:08');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'tamara', 'tamara@gmail.com', NULL, '$2y$10$AyXTWIJN5e316lmmRZUyi.AcAYXFCD67Jb/m5aQxPjz8NA3n6687.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `aperturacaja_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_venta_manual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pago` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `efectivo` decimal(11,2) DEFAULT NULL,
  `transferencia` decimal(11,2) DEFAULT NULL,
  `tdebito` decimal(11,2) DEFAULT NULL,
  `tcredito` decimal(11,2) DEFAULT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `tipo_abono` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `abonos_ibfk_3` (`aperturacaja_id`);

--
-- Indices de la tabla `aperturacajas`
--
ALTER TABLE `aperturacajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito_venta_temp`
--
ALTER TABLE `carrito_venta_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corte_cajero_dia`
--
ALTER TABLE `corte_cajero_dia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apertura_id` (`apertura_id`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `detalles_cotizacion`
--
ALTER TABLE `detalles_cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cotizacion` (`id_cotizacion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_abonos`
--
ALTER TABLE `detalle_abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `abono_id` (`abono_id`),
  ADD KEY `detalle_abonos_ibfk_3` (`aperturacaja_id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `detalle_ventas_ibfk_3` (`aperturacaja_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categ` (`id_categ`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_ibfk_1` (`user_id`),
  ADD KEY `ventas_ibfk_2` (`cliente_id`),
  ADD KEY `ventas_ibfk_3` (`aperturacaja_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aperturacajas`
--
ALTER TABLE `aperturacajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1237;

--
-- AUTO_INCREMENT de la tabla `carrito_venta_temp`
--
ALTER TABLE `carrito_venta_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `corte_cajero_dia`
--
ALTER TABLE `corte_cajero_dia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_cotizacion`
--
ALTER TABLE `detalles_cotizacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_abonos`
--
ALTER TABLE `detalle_abonos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1305;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abonos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abonos_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `aperturacajas`
--
ALTER TABLE `aperturacajas`
  ADD CONSTRAINT `aperturacajas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `corte_cajero_dia`
--
ALTER TABLE `corte_cajero_dia`
  ADD CONSTRAINT `corte_cajero_dia_ibfk_1` FOREIGN KEY (`apertura_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalles_cotizacion`
--
ALTER TABLE `detalles_cotizacion`
  ADD CONSTRAINT `detalles_cotizacion_ibfk_1` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_cotizacion_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_abonos`
--
ALTER TABLE `detalle_abonos`
  ADD CONSTRAINT `detalle_abonos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_abonos_ibfk_2` FOREIGN KEY (`abono_id`) REFERENCES `abonos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_abonos_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
