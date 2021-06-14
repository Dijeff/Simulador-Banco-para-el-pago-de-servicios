USE master

CREATE DATABASE PHONE_SERVICE;

USE PHONE_SERVICE;
--*************************************************************************************************************--
CREATE TABLE PROVEEDORES
(cod_proveedor NVARCHAR(15)NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
telefono NVARCHAR(30)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
num_cuenta NVARCHAR(100)NOT NULL
);
--*************************************************************************************************************--
CREATE TABLE CLIENTES
(cod_cliente NVARCHAR(15)NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
apellidos VARCHAR(100)NOT NULL,
telefono NVARCHAR(30)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
email NVARCHAR(100)NOT NULL
);
--*************************************************************************************************************--
CREATE TABLE SERVICIO
(num_servicio INT NOT NULL PRIMARY KEY,
cod_cliente NVARCHAR(15)NOT NULL,
cod_proveedor NVARCHAR(15) NOT NULL,
fecha_registro VARCHAR(100),
FOREIGN KEY (cod_cliente) REFERENCES CLIENTES(cod_cliente),
FOREIGN KEY (cod_proveedor) REFERENCES PROVEEDORES(cod_proveedor)
);

Select * from SERVICIO
--*************************************************************************************************************--
CREATE TABLE FACTURAS
(cod_factura INT IDENTITY PRIMARY KEY,
num_servicio INT NOT NULL,
fecha_vencimiento VARCHAR(100),
monto INT,
estado VARCHAR(15),
FOREIGN KEY (num_servicio) REFERENCES SERVICIO(num_servicio),
);
--*************************************************************************************************************--
CREATE TABLE TRANSACCIONES
(cod_transaccion INT IDENTITY PRIMARY KEY,
cod_factura INT NOT NULL,
detalle VARCHAR(100),
tipo_movimiento VARCHAR(30),
cuenta_origen NVARCHAR(100)NOT NULL,
cuenta_destino NVARCHAR(100) NOT NULL,
monto MONEY NOT NULL,
estado VARCHAR(10) NOT NULL,
FOREIGN KEY (cod_factura) REFERENCES FACTURAS(cod_factura)
);
--*************************************************************************************************************--
CREATE TABLE BITACORA_TRANSACCIONES
(id_bitacora INT IDENTITY PRIMARY KEY,
cod_transaccion INT NOT NULL,
fecha_hora_transaccion DATETIME NOT NULL,
resultado VARCHAR(10) NOT NULL,
detalle_usuario VARCHAR(100) NOT NULL,
detalle_tecnico VARCHAR(100) NOT NULL,
FOREIGN KEY (cod_transaccion) REFERENCES TRANSACCIONES(cod_transaccion),
);
--*************************************************************************************************************--
INSERT INTO PROVEEDORES VALUES('P-01','CLARO',25896314,'ESCAZÚ, SAN JOSÉ',10000300002004444)
INSERT INTO PROVEEDORES VALUES('P-02','ICE',23147596,'CURRIDABAT, SAN JOSÉ',12300300002005554)
INSERT INTO PROVEEDORES VALUES('P-03','MOVISTAR',23214659,'TIERRA BLANCA, CARTAGO',1000030000200047)
SELECT * FROM SERVICIO

INSERT INTO CLIENTES VALUES('305250862','KEVIN ANDRÉS','NAVARRO TENCIO',70151868,'TABLÓN CARTAGO','knavatencio2@gmail.com')

INSERT INTO SERVICIO VALUES(4514182,'305250862','P-03',GETDATE())

UPDATE SERVICIO SET num_servicio=84296924 WHERE num_servicio=4514182

INSERT INTO FACTURAS (num_servicio,fecha_vencimiento,monto,estado) 
VALUES(84296924,'2020-12-15',15000,'OUTSTANDING')
INSERT INTO FACTURAS (num_servicio,fecha_vencimiento,monto,estado) 
VALUES(84296924,'2020-11-15',15000,'PAID')

UPDATE FACTURAS SET estado='OUTSTANDING' WHERE fecha_vencimiento='2020-12-15' and num_servicio=84296924
DELETE FROM FACTURAS
SELECT * FROM FACTURAS
DBCC CHECKIDENT (FACTURAS, RESEED, 0)
--*************************************************************************************************************--
CREATE PROCEDURE SP_CONSULTS @num_servicio INT,@proveedor VARCHAR(100),@resultado VARCHAR(100) OUTPUT
AS 
BEGIN
	DECLARE @proveedor_cod NVARCHAR(15)
	SET @proveedor_cod=(SELECT cod_proveedor FROM PROVEEDORES WHERE nombre=@proveedor);
	IF(SELECT COUNT(s.num_servicio) FROM SERVICIO s WHERE s.cod_proveedor=@proveedor_cod and num_servicio=@num_servicio)>0
	BEGIN
			IF(SELECT COUNT(num_servicio) FROM FACTURAS WHERE estado='OUTSTANDING' AND num_servicio=@num_servicio)>0
			BEGIN
				SELECT f.cod_factura,c.cod_cliente,c.nombre,c.apellidos,f.monto,f.fecha_vencimiento,f.estado 
				FROM CLIENTES c INNER JOIN SERVICIO s 
				ON (c.cod_cliente=s.cod_cliente) INNER JOIN FACTURAS f 
				ON (s.num_servicio=f.num_servicio) WHERE f.estado='OUTSTANDING'
				SELECT @resultado='OK';
			END
			ELSE
			BEGIN
				SELECT @resultado='No hay facturas a cobro para este servicio';
			END	
	END
	ELSE 
	BEGIN
		SELECT @resultado='El número buscado no corresponde a este proveedor';
	END
END

--*************************************************************************************************************--
CREATE PROCEDURE SP_TRANSACTIONS_ELECTRICITY @cod_factura INT,@detalle VARCHAR(100),@tipo VARCHAR(30),
											 @cuenta_origen NVARCHAR(100),@cuenta_destino NVARCHAR(100),
											 @monto MONEY,@estado VARCHAR(10),@result VARCHAR(10) OUTPUT
AS 
BEGIN
	IF(@estado='Successful')
	BEGIN
		UPDATE FACTURAS SET estado='PAID' where cod_factura=@cod_factura;
		INSERT INTO TRANSACCIONES (cod_factura,detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado)
		VALUES (@cod_factura,@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,@estado)
		SELECT @result=@estado
	END
	ELSE
	BEGIN
		INSERT INTO TRANSACCIONES (cod_factura,detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado)
		VALUES (@cod_factura,@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,@estado)
		SELECT @result=@estado
	END
	
END

--*************************************************************************************************************--
CREATE TRIGGER bitacora_transaccional
ON TRANSACCIONES
FOR INSERT 
AS
	DECLARE @cod_transaccion INT
	SET @cod_transaccion=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES);
	DECLARE @state VARCHAR(10)
	DECLARE @res1  VARCHAR(10)
	SET @state=(SELECT estado FROM TRANSACCIONES where cod_transaccion=@cod_transaccion);
	SET @res1='Successful'
	IF(@state LIKE @res1)
	BEGIN
		INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
		VALUES (@cod_transaccion,GETDATE(),@state,'PAID DONE','Realizado satisfactoriamente');
	END
	ELSE
	BEGIN
		INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
		VALUES (@cod_transaccion,GETDATE(),@state,'PAID FAILED','Fallido: No concuerdan los números de cuenta de la base de datos');
	END
GO
--*************************************************************************************************************--
CREATE PROCEDURE SP_ACCOUNT_CONSULT @supplier VARCHAR(100),@num_cuenta NVARCHAR(100) OUTPUT
AS
BEGIN
	SELECT @num_cuenta=(SELECT num_cuenta FROM PROVEEDORES WHERE nombre=@supplier)
END
--*************************************************************************************************************--
CREATE PROCEDURE SP_AMOUNT_CONSULT @cod_factura INT,@monto INT OUTPUT
AS
BEGIN
	SELECT @monto=(SELECT monto FROM FACTURAS WHERE cod_factura=@cod_factura)
END
--*************************************************************************************************************--
DECLARE @result INT 
EXECUTE SP_AMOUNT_CONSULT 1,@monto=@result OUTPUT
SELECT @result

SELECT * FROM FACTURAS

DECLARE @result VARCHAR(100) 
EXECUTE SP_CONSULTS 4514182,'ICE',@resultado=@result OUTPUT
SELECT @result

DECLARE @resultado VARCHAR(10)
EXECUTE SP_TRANSACTIONS_ELECTRICITY 1,'Pago de Servicio eléctrico','Depósito','300024500000896',
								'1000030000200048',20000,'Successful',@result=@resultado OUTPUT
SELECT @resultado

SELECT * FROM FACTURAS
SELECT * FROM TRANSACCIONES
SELECT * FROM BITACORA_TRANSACCIONES

DELETE FROM BITACORA_TRANSACCIONES
DELETE FROM TRANSACCIONES

DBCC CHECKIDENT (BITACORA_TRANSACCIONES, RESEED, 0)
DBCC CHECKIDENT (TRANSACCIONES, RESEED, 0)


UPDATE FACTURAS SET estado='OUTSTANDING' WHERE fecha_vencimiento='2020-12-15' and num_servicio=84296924
USE ELECTRIC_SERVICE

SELECT * FROM PROVEEDORES