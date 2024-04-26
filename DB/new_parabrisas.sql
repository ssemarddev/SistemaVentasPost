
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


/*Table structure for table `abonos` */

DROP TABLE IF EXISTS `abonos`;

CREATE TABLE `abonos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `aperturacaja_id` bigint unsigned NOT NULL,
  `tipo_comprobante` varchar(100) DEFAULT NULL,
  `num_comprobante` varchar(50) NOT NULL,
  `numero_abono_manual` varchar(255) DEFAULT NULL,
  `tipo_pago` varchar(200) NOT NULL,
  `efectivo` decimal(11,2) NOT NULL,
  `transferencia` decimal(11,2) NOT NULL,
  `tdebito` decimal(11,2) NOT NULL,
  `tcredito` decimal(11,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `total_abono` decimal(11,2) NOT NULL,
  `status_abono` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `abonos_ibfk_3` (`aperturacaja_id`),
  CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abonos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abonos_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `aperturacajas` */

DROP TABLE IF EXISTS `aperturacajas`;

CREATE TABLE `aperturacajas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cantidad_inicial` decimal(11,2) NOT NULL,
  `cantidad_final` decimal(11,2) NOT NULL,
  `fecha_hora_cierre` datetime DEFAULT NULL,
  `status_apertura` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `aperturacajas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `carrito` */

DROP TABLE IF EXISTS `carrito`;

CREATE TABLE `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `cod` varchar(30) CHARACTER SET utf8mb4  NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `cantidad` int NOT NULL,
  `descipcion` varchar(250) CHARACTER SET utf8mb4  DEFAULT NULL,
  `precio` int NOT NULL,
  `descuento` int NOT NULL,
  `total` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `carrito_compras_temp` */

DROP TABLE IF EXISTS `carrito_compras_temp`;

CREATE TABLE `carrito_compras_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `producto_id` int NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `nombre` varchar(765) CHARACTER SET utf8mb4  DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `descipcion` varchar(750) CHARACTER SET utf8mb4  DEFAULT NULL,
  `precio_costo` int DEFAULT NULL,
  `precio_venta` int DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `carrito_venta_temp` */

DROP TABLE IF EXISTS `carrito_venta_temp`;

CREATE TABLE `carrito_venta_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `producto_id` int NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `nombre` varchar(765) CHARACTER SET utf8mb4  DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `descipcion` varchar(750) CHARACTER SET utf8mb4  DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) CHARACTER SET utf8mb4  NOT NULL,
  `rut` varchar(20) CHARACTER SET utf8mb4  DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4  DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4  DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `proveedor_id` bigint unsigned NOT NULL,
  `tipo_comprobante` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `num_comprobante` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `numero_compra_manual` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `tipo_pago` varchar(200) CHARACTER SET utf8mb4  NOT NULL,
  `efectivo` decimal(11,2) DEFAULT NULL,
  `transferencia` decimal(11,2) DEFAULT NULL,
  `tdebito` decimal(11,2) DEFAULT NULL,
  `tcredito` decimal(11,2) DEFAULT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `tipo_abono` varchar(100) DEFAULT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_ibfk_1` (`user_id`),
  KEY `compras_ibfk_2` (`proveedor_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `corte_cajero_dia` */

DROP TABLE IF EXISTS `corte_cajero_dia`;

CREATE TABLE `corte_cajero_dia` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `apertura_id` bigint unsigned NOT NULL,
  `total_acomulado` decimal(11,2) DEFAULT NULL,
  `seriefolio` varchar(100) DEFAULT NULL,
  `ventaefectivo` decimal(11,2) DEFAULT NULL,
  `ventatransferencia` decimal(11,2) DEFAULT NULL,
  `ventatdebito` decimal(11,2) DEFAULT NULL,
  `ventatcredito` decimal(11,2) DEFAULT NULL,
  `abonoefectivo` decimal(11,2) DEFAULT NULL,
  `abonotransferencia` decimal(11,2) DEFAULT NULL,
  `abonotdebito` decimal(11,2) DEFAULT NULL,
  `abonotcredito` decimal(11,2) DEFAULT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `numfolio` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apertura_id` (`apertura_id`),
  CONSTRAINT `corte_cajero_dia_ibfk_1` FOREIGN KEY (`apertura_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `cotizaciones` */

DROP TABLE IF EXISTS `cotizaciones`;

CREATE TABLE `cotizaciones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint unsigned NOT NULL,
  `id_cliente` bigint unsigned NOT NULL,
  `cod` varchar(10) NOT NULL,
  `serie` int NOT NULL,
  `factura` varchar(20) DEFAULT NULL,
  `tipo_pago` varchar(100) DEFAULT NULL,
  `validez` varchar(20) DEFAULT NULL,
  `total` int NOT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `servicio` text,
  `numero_cotizacion_manual` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `tipo_registro` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `detalle_abonos` */

DROP TABLE IF EXISTS `detalle_abonos`;

CREATE TABLE `detalle_abonos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `abono_id` bigint unsigned NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `aperturacaja_id` bigint unsigned NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `abono_id` (`abono_id`),
  KEY `detalle_abonos_ibfk_3` (`aperturacaja_id`),
  CONSTRAINT `detalle_abonos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_abonos_ibfk_2` FOREIGN KEY (`abono_id`) REFERENCES `abonos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_abonos_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `detalle_compras` */

DROP TABLE IF EXISTS `detalle_compras`;

CREATE TABLE `detalle_compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` bigint unsigned NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `compra_id` (`compra_id`),
  CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `detalle_ventas` */

DROP TABLE IF EXISTS `detalle_ventas`;

CREATE TABLE `detalle_ventas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `venta_id` bigint unsigned NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `aperturacaja_id` bigint unsigned NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `venta_id` (`venta_id`),
  KEY `detalle_ventas_ibfk_3` (`aperturacaja_id`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  CONSTRAINT `detalle_ventas_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `detalles_cotizacion` */

DROP TABLE IF EXISTS `detalles_cotizacion`;

CREATE TABLE `detalles_cotizacion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_cotizacion` bigint unsigned NOT NULL,
  `id_producto` bigint unsigned NOT NULL,
  `precio_venta` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` int NOT NULL,
  `total` int NOT NULL,
  `item` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cotizacion` (`id_cotizacion`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalles_cotizacion_ibfk_1` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalles_cotizacion_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `connection` text CHARACTER SET utf8mb4  NOT NULL,
  `queue` text CHARACTER SET utf8mb4  NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4  NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4  NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4  NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 ,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `id_categ` bigint unsigned NOT NULL,
  `id_proveedor` bigint unsigned NOT NULL,
  `id_subcateg` bigint unsigned NOT NULL,
  `impuestos` varchar(50) CHARACTER SET utf8mb4  DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `precio_costo` int NOT NULL,
  `precio_venta` int NOT NULL,
  `stock` int NOT NULL,
  `stock_min` int NOT NULL,
  `maneja_inventario` tinyint(1) DEFAULT NULL,
  `imagen` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categ` (`id_categ`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(200) NOT NULL,
  `rut` varchar(20) CHARACTER SET utf8mb4  DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `vendedor` varchar(255) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `direccion` text,
  `nombre_banco` varchar(255) DEFAULT NULL,
  `tipo_cuenta` varchar(50) DEFAULT NULL,
  `numero_cuenta` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `aperturacaja_id` bigint unsigned NOT NULL,
  `tipo_comprobante` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `num_comprobante` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `numero_venta_manual` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `tipo_pago` varchar(200) CHARACTER SET utf8mb4  NOT NULL,
  `efectivo` decimal(11,2) DEFAULT NULL,
  `transferencia` decimal(11,2) DEFAULT NULL,
  `tdebito` decimal(11,2) DEFAULT NULL,
  `tcredito` decimal(11,2) DEFAULT NULL,
  `abono` decimal(11,2) DEFAULT NULL,
  `tipo_abono` varchar(100) DEFAULT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_ibfk_1` (`user_id`),
  KEY `ventas_ibfk_2` (`cliente_id`),
  KEY `ventas_ibfk_3` (`aperturacaja_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`)
) ;

DELIMITER $$

CREATE
    TRIGGER `trigger_updateStockVenta` AFTER INSERT ON `detalle_ventas` 
    FOR EACH ROW UPDATE productos SET stock=stock-NEW.cantidad WHERE productos.id=NEW.producto_id;

    END;
$$

DELIMITER ;

DELIMITER $$

CREATE
    TRIGGER `trigger_updateStockProducto` AFTER INSERT ON `detalle_compras` 
    FOR EACH ROW UPDATE productos SET stock=stock + NEW.cantidad WHERE productos.id = NEW.producto_id;

$$

DELIMITER ;

DELIMITER $$

CREATE
   
    TRIGGER `trigger_updateabonocashbox` AFTER INSERT ON `abonos` 
    FOR EACH ROW BEGIN
	 DECLARE aperturaId INT UNSIGNED;
	SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");
	UPDATE corte_cajero_dia AS ccd SET ccd.abonoefectivo=ccd.abonoefectivo+NEW.efectivo, 
	ccd.abonotransferencia=ccd.abonotransferencia+NEW.transferencia, ccd.abonotdebito=ccd.abonotdebito+NEW.tdebito, 
	ccd.abonotcredito=ccd.abonotcredito+NEW.tcredito, ccd.abono=ccd.abono+NEW.total_abono WHERE ccd.apertura_id=aperturaId;
	
    END;
$$

DELIMITER ;

DELIMITER $$

CREATE
    TRIGGER `trigger_updatecashbox` AFTER INSERT ON `ventas` 
    FOR EACH ROW BEGIN
 DECLARE aperturaId INT UNSIGNED;
	
    SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");

    UPDATE corte_cajero_dia AS ccd SET ccd.ventaefectivo=ccd.ventaefectivo+NEW.efectivo, 
    ccd.ventatransferencia=ccd.ventatransferencia+NEW.transferencia,
    ccd.ventatdebito=ccd.ventatdebito+NEW.tdebito, ccd.ventatcredito=ccd.ventatcredito+NEW.tcredito WHERE ccd.apertura_id=aperturaId;

  END;
$$

DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

