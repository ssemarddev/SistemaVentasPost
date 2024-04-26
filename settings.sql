1: ==> the delete constraint 
ALTER TABLE detalle_ventas DROP FOREIGN KEY detalle_ventas_ibfk_1;

2: ==> the add change the table
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `productos`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;
SET FOREIGN_KEY_CHECKS = 1;

3: ==> the add constraint
ALTER TABLE detalle_ventas
ADD CONSTRAINT detalle_ventas_ibfk_1 FOREIGN KEY (producto_id)
REFERENCES productos (id);

/*UPDATE productos SET id_subcateg=1;*/

/**************TRIGGER EXECUTE AFTER SAVE ON TABLE ABONOS*******************************/
DELIMITER $$

USE `parabrisas`$$

DROP TRIGGER /*!50032 IF EXISTS */ `trigger_updateabonocashbox`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `trigger_updateabonocashbox` AFTER INSERT ON `abonos` 
    FOR EACH ROW BEGIN
	 DECLARE aperturaId INT UNSIGNED;
	SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");
    
	UPDATE corte_cajero_dia AS ccd SET ccd.abono=ccd.abono+NEW.total_abono WHERE ccd.apertura_id=aperturaId;
	
    END;
$$

DELIMITER ;

/**********TRIGGER ACTUALIZADO PARA ABONO*************************/
DELIMITER $$

USE `parabrisas`$$

DROP TRIGGER /*!50032 IF EXISTS */ `trigger_updatecashbox`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `trigger_updatecashbox` AFTER INSERT ON `ventas` 
    FOR EACH ROW BEGIN
	 DECLARE aperturaId INT UNSIGNED;
	 
	 SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");
	 
	 IF new.tipo_pago = 'PAGAR ABONO' THEN
	   UPDATE corte_cajero_dia AS ccd SET ccd.transferencia=ccd.transferencia+NEW.transferencia, ccd.tdebito=ccd.tdebito+NEW.tdebito, ccd.tcredito=ccd.tcredito+NEW.tcredito WHERE ccd.apertura_id=aperturaId;
	 ELSE
	   UPDATE corte_cajero_dia AS ccd SET ccd.efectivo=ccd.efectivo+NEW.efectivo, ccd.transferencia=ccd.transferencia+NEW.transferencia, ccd.tdebito=ccd.tdebito+NEW.tdebito, ccd.tcredito=ccd.tcredito+NEW.tcredito WHERE ccd.apertura_id=aperturaId;
	END IF;
    END;
$$

DELIMITER ;

/**********TRIGGER ACTUALIZADO PARA ABONO UPDATED*************************/
DELIMITER $$

USE `parabrisas`$$

DROP TRIGGER /*!50032 IF EXISTS */ `trigger_updatecashbox`$$

CREATE
  /*!50017 DEFINER = 'root'@'localhost' */
  TRIGGER `trigger_updatecashbox` AFTER INSERT ON `ventas` 
  FOR EACH ROW BEGIN
 DECLARE aperturaId INT UNSIGNED;
	 
	  SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");

    UPDATE corte_cajero_dia AS ccd SET ccd.efectivo=ccd.efectivo+NEW.efectivo, ccd.transferencia=ccd.transferencia+NEW.transferencia, ccd.tdebito=ccd.tdebito+NEW.tdebito, ccd.tcredito=ccd.tcredito+NEW.tcredito WHERE ccd.apertura_id=aperturaId;

  END;
$$

DELIMITER ;

/***********************************/
agregar columna status_abono === en tabla abonos
1. Pendiente
2. Agregado
3. Finalizado
/***********************************/
agregar columna == abono == en tabla corte_cajero_dia y ventas
the add null columna maneja_inventario in table productos


/***************THE ADD NEW TABLES********************/
CREATE TABLE `abonos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `tipo_comprobante` varchar(100) DEFAULT NULL,
  `num_comprobante` varchar(50) NOT NULL,
  `numero_abono_manual` varchar(255) DEFAULT NULL,
  `tipo_pago` varchar(200) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `total_abono` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
);

CREATE TABLE `detalle_abonos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `abono_id` bigint(20) unsigned NOT NULL,
  `producto_id` bigint(20) unsigned NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `cantidad` decimal(11,3) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`abono_id`) REFERENCES `abonos` (`id`) ON DELETE CASCADE
);

/**************THE ADD NEW COLUMNS THE TABLE ABONOs *****************************/
efectivo //ALTER TABLE `abonos` ADD `efectivo` DECIMAL(11,2) NOT NULL AFTER `tipo_pago`; 
transferencia //ALTER TABLE `abonos` ADD `transferencia` DECIMAL(11,2) NOT NULL AFTER `efectivo`; 
tdebito //ALTER TABLE `abonos` ADD `tdebito` DECIMAL(11,2) NOT NULL AFTER `transferencia`; 
tcredito //ALTER TABLE `abonos` ADD `tcredito` DECIMAL(11,2) NOT NULL AFTER `tdebito`; 

/*****************************************************************/
/*****************************************************************/
/*****************************************************************/

1. truncate table detalle_ventas;

2. ALTER TABLE detalle_ventas DROP FOREIGN KEY detalle_ventas_ibfk_2;

3.
SET FOREIGN_KEY_CHECKS = 0;

truncate table ventas;

SET FOREIGN_KEY_CHECKS = 1;

4.
ALTER TABLE detalle_ventas
ADD CONSTRAINT detalle_ventas_ibfk_2 FOREIGN KEY (venta_id)
REFERENCES ventas (id);

5.
truncate detalle_abonos;
/********************************************************/
6.
error //#1701 - Cannot truncate a table referenced in a foreign key constraint (`parabrisas`.`detalle_abonos`, 
//CONSTRAINT `detalle_abonos_ibfk_2` FOREIGN KEY (`abono_id`) REFERENCES `parabrisas`.`abonos` (`id`))
/*************************************/
7.
ALTER TABLE detalle_abonos DROP FOREIGN KEY detalle_abonos_ibfk_2;

ALTER TABLE detalle_abonos
ADD CONSTRAINT detalle_abonos_ibfk_2 FOREIGN KEY (abono_id)
REFERENCES abonos (id);

/*************ADD NEW COUMNS IN CORTE_CAJERO_DIA**********/
/*************ADD NEW COUMNS IN CORTE_CAJERO_DIA**********/
/*************ADD NEW COUMNS IN CORTE_CAJERO_DIA**********/
DELIMITER $$

USE `parabrisas`$$

DROP TRIGGER /*!50032 IF EXISTS */ `trigger_updateabonocashbox`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `trigger_updateabonocashbox` AFTER INSERT ON `abonos` 
    FOR EACH ROW BEGIN
	 DECLARE aperturaId INT UNSIGNED;
	SET aperturaId = (SELECT ape.id FROM aperturacajas AS ape WHERE ape.user_id=NEW.user_id AND ape.status_apertura="Abierta");
	/*UPDATE corte_cajero_dia AS ccd SET ccd.abono=ccd.abono+NEW.total_abono WHERE ccd.apertura_id=aperturaId;*/
	UPDATE corte_cajero_dia AS ccd SET ccd.abonoefectivo=ccd.abonoefectivo+NEW.efectivo, 
	ccd.abonotransferencia=ccd.abonotransferencia+NEW.transferencia, ccd.abonotdebito=ccd.abonotdebito+NEW.tdebito, 
	ccd.abonotcredito=ccd.abonotcredito+NEW.tcredito, ccd.abono=ccd.abono+NEW.total_abono WHERE ccd.apertura_id=aperturaId;
	
    END;
$$

DELIMITER ;

/**************************************************************/
DELIMITER $$

USE `parabrisas`$$

DROP TRIGGER /*!50032 IF EXISTS */ `trigger_updatecashbox`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
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


/***********************************************************/

CREATE TABLE `carrito_compras_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `producto_id` int NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `descipcion` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_costo` int DEFAULT NULL,
  `precio_venta` int DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `proveedor_id` bigint unsigned NOT NULL,
  `tipo_comprobante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `num_comprobante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numero_compra_manual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo_pago` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
  KEY `compras_ibfk_1` (`user_id`),
  KEY `compras_ibfk_2` (`proveedor_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;