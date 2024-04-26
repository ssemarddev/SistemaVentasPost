CREATE TABLE `tipo_unidad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/******************************/
ALTER TABLE carrito_venta_temp
ADD COLUMN tipo_unidad INT NULL;

ALTER TABLE carrito_venta_temp
ADD COLUMN mayoreo_cantidad INT NULL;

ALTER TABLE carrito_venta_temp
ADD COLUMN precio_mayoreo INT NULL;

ALTER TABLE carrito_venta_temp
ADD COLUMN precio_menudeo INT NULL;

ALTER TABLE productos
ADD COLUMN tipounidad_id BIGINT UNSIGNED,
ADD FOREIGN KEY (tipounidad_id) REFERENCES tipo_unidad(id);

ALTER TABLE productos
ADD COLUMN user_id BIGINT UNSIGNED,
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE productos
ADD COLUMN mayoreo_cantidad INT NULL;

ALTER TABLE productos
ADD COLUMN mayoreo_pventa INT NULL;

UPDATE productos
SET mayoreo_cantidad = 0;

UPDATE productos
SET mayoreo_pventa = 0;

UPDATE productos SET user_id = 1;
/**********************************/

/**********************************/
3. Actualizar el modulo de productos al nuevo diseño.
4. cotizaciones. ocultar input abono y a pagar. reimprimir cotizacion.
5. en ventas tomar el cliente generico por defecto. Es el primero. agregar un nuevo cliente.

PRODUCTOS.
PRECIO POR UNIDAD
MAYOREO = 10 A 50 DE 51 A MAS.
PRIMER PAGO DE 50 DOLARES.

/*******************NEW CHANGE FOR DB*****************************/
CREATE TABLE cash_withdrawals (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `aperturacaja_id` bigint unsigned NOT NULL,
  `cantidad` decimal(11,2) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `aperturacaja_id` (`aperturacaja_id`),
  CONSTRAINT `cash_Withdrawals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cash_Withdrawals_ibfk_2` FOREIGN KEY (`aperturacaja_id`) REFERENCES `aperturacajas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/***********************************************/
/***********************************************/
detalle_ventas_ibfk_2

ALTER TABLE detalle_ventas DROP FOREIGN KEY detalle_ventas_ibfk_2;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ventas;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE detalle_ventas
ADD CONSTRAINT detalle_ventas_ibfk_2 FOREIGN KEY (venta_id)
REFERENCES ventas (id);

Cannot truncate a table referenced in a foreign key constraint 
(`u157083720_real_bendita_u`.`detalle_ventas`, CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `u157083720_real_bendita_u`.`ventas` (`id`))
/***********************************************/
/***********************************************/
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE corte_cajero_dia;
SET FOREIGN_KEY_CHECKS = 1;
/*************************************************/
/*************************************************/
ALTER TABLE abonos DROP FOREIGN KEY abonos_ibfk_3;
ALTER TABLE cash_withdrawals DROP FOREIGN KEY cash_Withdrawals_ibfk_2;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE aperturacajas;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE abonos
ADD CONSTRAINT abonos_ibfk_3 FOREIGN KEY (aperturacaja_id)
REFERENCES aperturacajas(id);
ALTER TABLE cash_withdrawals
ADD CONSTRAINT cash_Withdrawals_ibfk_2 FOREIGN KEY (aperturacaja_id)
REFERENCES aperturacajas (id);
/*************************************************/

Cannot truncate a table referenced in a foreign key constraint 
(`u157083720_real_bendita_u`.`abonos`, CONSTRAINT `abonos_ibfk_3` FOREIGN KEY (`aperturacaja_id`) REFERENCES `u157083720_real_bendita_u`.`aperturacajas` (`id`))

Cannot truncate a table referenced in a foreign key constraint
(`u157083720_real_bendita_u`.`cash_withdrawals`, CONSTRAINT `cash_Withdrawals_ibfk_2` FOREIGN KEY (`aperturacaja_id`) REFERENCES `u157083720_real_bendita_u`.`aperturacajas` (`id`))

/*********************************************/
ALTER TABLE `ventas` ADD `cambio` DECIMAL(11,2) NOT NULL AFTER `updated_at`; 
ALTER TABLE `ventas` ADD `recibido` DECIMAL(11,2) NOT NULL AFTER `updated_at`; 

/******************************************************/
ALTER TABLE `carrito_venta_temp` ADD `product_stock` INT NULL AFTER `updated_at`; 
