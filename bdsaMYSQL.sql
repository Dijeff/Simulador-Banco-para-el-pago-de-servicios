-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2020 a las 17:53:09
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACCOUNT_CONSULT` (`p_supplier` VARCHAR(100), OUT `p_num_cuenta` VARCHAR(100))  BEGIN

	SET p_num_cuenta=(SELECT num_cuenta FROM PROVEEDORES WHERE nombre=p_supplier);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AMOUNT_CONSULT` (IN `p_cod_factura` INT, OUT `p_monto` INT)  BEGIN
	
	SET p_monto=(SELECT factura.monto FROM FACTURA WHERE cod_factura=p_cod_factura);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTS` (IN `p_num_servicio` INT, IN `p_proveedor` VARCHAR(100), OUT `p_resultado` VARCHAR(100), OUT `fao` INT, OUT `cli` INT, OUT `nom` VARCHAR(100), OUT `ape` VARCHAR(100), OUT `mon` INT, OUT `fe` VARCHAR(100), OUT `es` VARCHAR(100))  BEGIN
	DECLARE v_proveedor_cod VARCHAR(15);
	SET v_proveedor_cod=(SELECT cod_proveedor FROM proveedores WHERE nombre=p_proveedor);
	IF(SELECT COUNT(s.num_servicio) FROM servicio s WHERE s.cod_proveedor=v_proveedor_cod and num_servicio=p_num_servicio)>0
	THEN
			IF(SELECT COUNT(num_servicio) FROM factura WHERE estado='OUTSTANDING' AND num_servicio=p_num_servicio)>0
			THEN
				
				SELECT f.cod_factura,c.cod_cliente,c.nombre,c.apellidos,f.monto,f.fecha_vencimiento,f.estado into fao,cli,nom,ape,mon,fe,es
				FROM clientes c INNER JOIN servicio s 
				ON (c.cod_cliente=s.cod_cliente) INNER JOIN factura f 
				ON (s.num_servicio=f.num_servicio) WHERE f.estado='OUTSTANDING';
				
				SET p_resultado='OK';
			ELSE
				
				SET p_resultado='No hay facturas a cobro para este servicio';
			END IF;	
	ELSE
		
		SET p_resultado='El número buscado no corresponde a este proveedor';
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRANSACTIONS_ELECTRICITY` (IN `p_cod_factura` INT, IN `p_detalle` VARCHAR(100), IN `p_tipo` VARCHAR(100), IN `p_cuenta_origen` VARCHAR(100), IN `p_cuenta_destino` VARCHAR(100), IN `p_monto` INT, IN `p_estado` VARCHAR(10), OUT `p_result` VARCHAR(10))  BEGIN
	IF(p_estado='Successful')
	THEN
		UPDATE factura SET estado='PAID' where cod_factura=p_cod_factura;
		INSERT INTO transacciones (cod_factura,detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado)
		VALUES (p_cod_factura,p_detalle,p_tipo,p_cuenta_origen,p_cuenta_destino,p_monto,p_estado);
		
		SET p_result=p_estado;
	ELSE
		INSERT INTO transacciones (cod_factura,detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado)
		VALUES (p_cod_factura,p_detalle,p_tipo,p_cuenta_origen,p_cuenta_destino,p_monto,p_estado);
		
		SET p_result=p_estado;
	END IF;
	
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_transacciones`
--

CREATE TABLE `bitacora_transacciones` (
  `id_bitacora` int(11) NOT NULL,
  `cod_transaccion` int(11) NOT NULL,
  `fecha_hora_transaccion` date NOT NULL,
  `resultado` varchar(10) NOT NULL,
  `detalle_usuario` varchar(100) NOT NULL,
  `detalle_tecnico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `nombre`, `apellidos`, `telefono`, `direccion`, `email`) VALUES
('305220117', 'DIJEFF', 'MARIN HERNANDEZ', '70151868', 'CARTAGO CENTRO', 'dijefe@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `num_servicio` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`cod_factura`, `num_servicio`, `fecha_vencimiento`, `monto`, `estado`) VALUES
(1, 1020304, '2020-12-15', 15000, 'PAID');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `cod_proveedor` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `num_cuenta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`cod_proveedor`, `nombre`, `telefono`, `direccion`, `num_cuenta`) VALUES
('A-01', 'AYA', '25896314', 'ESCAZÚ, SAN JOSÉ', '1000030000200008'),
('A-02', 'Acueducto Asuacom', '23147596', 'CURRIDABAT, SAN JOSÉ', '1230030000200008'),
('A-03', 'ESPH', '23214659', 'TIERRA BLANCA, CARTAGO', '1000030000200048');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `num_servicio` int(11) NOT NULL,
  `cod_cliente` varchar(15) NOT NULL,
  `cod_proveedor` varchar(15) NOT NULL,
  `fecha_registro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`num_servicio`, `cod_cliente`, `cod_proveedor`, `fecha_registro`) VALUES
(1020304, '305220117', 'A-01', '2020-11-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `cod_transaccion` int(11) NOT NULL,
  `cod_factura` int(11) NOT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  `tipo_movimiento` varchar(30) DEFAULT NULL,
  `cuenta_origen` varchar(100) NOT NULL,
  `cuenta_destino` varchar(100) NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`cod_transaccion`, `cod_factura`, `detalle`, `tipo_movimiento`, `cuenta_origen`, `cuenta_destino`, `monto`, `estado`) VALUES
(1, 1, 'Pago de Servicio eléctrico', 'Depósito', '300024500000896', '1000030000200048', 20000, '');

--
-- Disparadores `transacciones`
--
DELIMITER $$
CREATE TRIGGER `bitacora_transaccional` BEFORE INSERT ON `transacciones` FOR EACH ROW BEGIN


SET @v_cod_transaccion=(SELECT MAX(cod_transaccion) FROM transacciones);
	
	SET @v_state=(SELECT estado FROM transacciones where cod_transaccion=@cod_transaccion);
	SET @v_res1='Successful';
	IF(@v_state LIKE @v_res1)
	THEN
		INSERT INTO bitacora_transacciones (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
		VALUES (@cod_transaccion,NOW(3),v_state,'PAID DONE','Realizado satisfactoriamente');
	ELSE
		INSERT INTO bitacora_transacciones (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
		VALUES (@cod_transaccion,NOW(3),v_state,'PAID FAILED','Fallido: No concuerdan los números de cuenta de la base de datos');
	END IF;
  
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora_transacciones`
--
ALTER TABLE `bitacora_transacciones`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `cod_transaccion` (`cod_transaccion`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`cod_factura`),
  ADD KEY `num_servicio` (`num_servicio`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`cod_proveedor`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`num_servicio`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `cod_proveedor` (`cod_proveedor`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`cod_transaccion`),
  ADD KEY `cod_factura` (`cod_factura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora_transacciones`
--
ALTER TABLE `bitacora_transacciones`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `cod_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `cod_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora_transacciones`
--
ALTER TABLE `bitacora_transacciones`
  ADD CONSTRAINT `bitacora_transacciones_ibfk_1` FOREIGN KEY (`cod_transaccion`) REFERENCES `transacciones` (`cod_transaccion`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`num_servicio`) REFERENCES `servicio` (`num_servicio`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`),
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedores` (`cod_proveedor`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
