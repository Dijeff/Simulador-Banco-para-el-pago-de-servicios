use master

CREATE DATABASE STATETRUST;

USE STATETRUST;
--*************************************************************************************************************--
CREATE TABLE BANCO
(cod_sede NVARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
telefono NVARCHAR(30)NOT NULL
);

INSERT INTO BANCO VALUES ('B-01', 'Banco Regional','El Carmen,Cartago',25896314)
INSERT INTO BANCO VALUES ('B-02', 'Banco GAP','Curridabat',23147689)

--*************************************************************************************************************--
CREATE TABLE SERVICIOS
(id_servicio NVARCHAR(15) PRIMARY KEY NOT NULL,
 descripcion VARCHAR(15)NOT NULL,
);
select * from SERVICIOS

INSERT INTO SERVICIOS VALUES ('S-01','WATER')
INSERT INTO SERVICIOS VALUES ('S-02','INTERNET')
INSERT INTO SERVICIOS VALUES ('S-03','ELECTRICITY')
INSERT INTO SERVICIOS VALUES ('S-04','PHONE')
--*************************************************************************************************************--
CREATE TABLE PROVEEDORES
(cod_proveedor NVARCHAR(15)NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
telefono NVARCHAR(30)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
email NVARCHAR(100)NOT NULL,
cod_servicio NVARCHAR(15) NOT NULL,
FOREIGN KEY (cod_servicio) REFERENCES SERVICIOS(id_servicio),
);

INSERT INTO PROVEEDORES VALUES ('E-01','ICE',25478963,'ESCAZÚ, SAN JOSÉ','icelec@ice.go.cr','S-03')
INSERT INTO PROVEEDORES VALUES ('E-02','CNFL',25478963,'CURRIDABAT, SAN JOSÉ','sucmetro@cnfl.go.cr','S-03')
INSERT INTO PROVEEDORES VALUES ('E-03','JASEC',25478963,'TIERRA BLANCA, CARTAGO',' chat@jasec.go.cr','S-03')
INSERT INTO PROVEEDORES VALUES ('P-01','CLARO',25478963,'ESCAZÚ, SAN JOSÉ','icelec@ice.go.cr','S-03')
INSERT INTO PROVEEDORES VALUES ('P-02','ICE',25478963,'CURRIDABAT, SAN JOSÉ','sucmetro@cnfl.go.cr','S-03')
INSERT INTO PROVEEDORES VALUES ('P-03','MOVISTAR',25478963,'TIERRA BLANCA, CARTAGO',' chat@jasec.go.cr','S-03')
--*************************************************************************************************************--
CREATE TABLE CUENTA
(num_cuenta NVARCHAR(100)NOT NULL PRIMARY KEY,
saldo MONEY,
fecha_afiliacion DATE NOT NULL,
id_sede NVARCHAR(10)NOT NULL,
id_proveedor NVARCHAR(15)NOT NULL,
estado VARCHAR(15),
FOREIGN KEY (id_sede) REFERENCES BANCO(cod_sede),
FOREIGN KEY (id_proveedor) REFERENCES PROVEEDORES(cod_proveedor)
);

INSERT INTO CUENTA VALUES ('1000030000200008',0,'2000-10-22','B-01','E-01','ACTIVE')
INSERT INTO CUENTA VALUES ('1230030000200008',0,'2000-12-15','B-02','E-02','ACTIVE')
INSERT INTO CUENTA VALUES ('1000030000200048',0,'2000-08-10','B-01','E-03','ACTIVE')
INSERT INTO CUENTA VALUES ('1000030000200007',0,'2000-10-22','B-01','P-01','ACTIVE')
INSERT INTO CUENTA VALUES ('1230030000200007',0,'2000-12-15','B-02','P-02','ACTIVE')
INSERT INTO CUENTA VALUES ('1000030000200047',0,'2000-08-10','B-01','P-03','ACTIVE')
--*************************************************************************************************************--
CREATE TABLE CLIENTE
(cod_cliente NVARCHAR(15)NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
apellidos VARCHAR(100)NOT NULL,
telefono NVARCHAR(30)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
fecha_nacimiento DATE NOT NULL,
email NVARCHAR(100)NOT NULL
);
insert into CLIENTE values(305250862,'Kevin','Navarro Tencio','62723188','Cartago,CostaRica','2000-06-20','knavatencio2@gmail.com')

--*************************************************************************************************************--
CREATE TABLE CUENTA_CORRIENTE
(id_cuenta NVARCHAR(100)NOT NULL PRIMARY KEY,
saldo_actual MONEY,
saldo_disponible MONEY,
saldo_flotante MONEY,
fecha_afiliacion DATE NOT NULL,
fecha_caducidad_tarjeta DATE NOT NULL,
id_sede NVARCHAR(10)NOT NULL,
id_cliente NVARCHAR(15)NOT NULL,
tipo_cuenta VARCHAR(15)NOT NULL,
num_tarjeta NVARCHAR(100)NOT NULL,
estado VARCHAR(15)
FOREIGN KEY (id_sede) REFERENCES BANCO(cod_sede),
FOREIGN KEY (id_cliente) REFERENCES CLIENTE(cod_cliente),
);

insert into CUENTA_CORRIENTE values ('C-001', 1000000,1000000,0,GETDATE(),'2021-10-03','B-01',305250862,'Debit',1234500000,'Available')
insert into CUENTA_CORRIENTE values ('C-002', 10000,0,0,GETDATE(),'2022-10-15','B-02',305250862,'Credit',678900000,'Available')
--*************************************************************************************************************--
CREATE TABLE TRANSACCIONES
(cod_transaccion INT IDENTITY PRIMARY KEY,
detalle VARCHAR(100),
tipo_movimiento VARCHAR(30),
cuenta_origen NVARCHAR(100)NOT NULL,
cuenta_destino NVARCHAR(100) NOT NULL,
monto MONEY NOT NULL,
estado VARCHAR(10) NOT NULL
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
ALTER TRIGGER bitacora_transaccional
ON TRANSACCIONES
FOR INSERT 
AS
DECLARE @cod_transaccion INT
SET @cod_transaccion=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES);
DECLARE @state VARCHAR(10)
DECLARE @res1  VARCHAR(10)
DECLARE @res2  VARCHAR(10)
SET @state=(SELECT estado FROM TRANSACCIONES where cod_transaccion=@cod_transaccion);
SET @res1='Successful'
IF(@state LIKE @res1)
BEGIN
INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
VALUES (@cod_transaccion,GETDATE(),@state,'Depósito Realizado','Realizado satisfactoriamente');
END
ELSE
BEGIN
INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,resultado,detalle_usuario,detalle_tecnico)
VALUES (@cod_transaccion,GETDATE(),@state,'Depósito Fallido, número de cuenta incorrecto','Fallido: No concuerdan los números de cuenta de la base de datos');
END
GO
--*************************************************************************************************************--
create PROCEDURE SP_TRANSACTIONS @detalle VARCHAR(100),@tipo VARCHAR(30),@cuenta_origen NVARCHAR(100),@cuenta_destino NVARCHAR(100),@monto MONEY,@result VARCHAR(10) OUTPUT
AS 
BEGIN
	IF((SELECT COUNT(*) FROM CUENTA WHERE num_cuenta=@cuenta_destino)>0)
	BEGIN
	UPDATE CUENTA SET saldo=saldo+@monto WHERE num_cuenta=@cuenta_destino
	INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
	VALUES (@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,'Successful');
	DECLARE @transaction INT
	SET @transaction=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES where cuenta_destino=@cuenta_destino)
	SELECT @result=estado FROM TRANSACCIONES WHERE cod_transaccion=@transaction;
	END
	ELSE
	BEGIN
	INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
	VALUES (@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,'Failed');
	DECLARE @transactionf INT
	SET @transactionf=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES where cuenta_destino=@cuenta_destino)
	SELECT @result=estado FROM TRANSACCIONES WHERE cod_transaccion=@transactionf;
	END
END
--*************************************************************************************************************--
--Depósito para el pago de servicios
DECLARE @resultado VARCHAR(10)
EXECUTE SP_TRANSACTIONS 'Pago de Servicio eléctrico','Depósito','300024500000896','1230030000200008',20000,@result=@resultado OUTPUT
SELECT @resultado
--*************************************************************************************************************--
create PROCEDURE SP_TRANSFERENCIA_INTERBANCARIA @detalle VARCHAR(100),@tipo VARCHAR(30),
												@cuenta_origen NVARCHAR(100),@cuenta_destino NVARCHAR(100),
												@monto MONEY,@result VARCHAR(10) OUTPUT
AS 
BEGIN
	IF((SELECT COUNT(*) FROM CUENTA_CORRIENTE WHERE num_tarjeta=@cuenta_destino)>0)
	BEGIN
		DECLARE @type VARCHAR(15)
		SET @type=(SELECT tipo_cuenta FROM CUENTA_CORRIENTE WHERE num_tarjeta=@cuenta_destino)
		IF(@type='Debit')
		BEGIN
			UPDATE CUENTA_CORRIENTE 
			SET saldo_actual=saldo_actual+@monto,saldo_disponible=saldo_disponible+@monto
			WHERE num_tarjeta=@cuenta_destino

			INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
			VALUES (@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,'Successful');

			DECLARE @transaction INT
			SET @transaction=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES where cuenta_destino=@cuenta_destino)
			SELECT @result=estado FROM TRANSACCIONES WHERE cod_transaccion=@transaction;
		END
		ELSE IF(@type='Credit')
		BEGIN
			UPDATE CUENTA_CORRIENTE 
			SET saldo_actual=saldo_actual-@monto
			WHERE num_tarjeta=@cuenta_destino

			INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
			VALUES (@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,'Successful');

			DECLARE @transaction2 INT
			SET @transaction2=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES where cuenta_destino=@cuenta_destino)
			SELECT @result=estado FROM TRANSACCIONES WHERE cod_transaccion=@transaction2;
		END
	END
	ELSE
	BEGIN

		INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
		VALUES (@detalle,@tipo,@cuenta_origen,@cuenta_destino,@monto,'Failed');

		DECLARE @transactionf INT
		SET @transactionf=(SELECT MAX(cod_transaccion) FROM TRANSACCIONES where cuenta_destino=@cuenta_destino)
		SELECT @result=estado FROM TRANSACCIONES WHERE cod_transaccion=@transactionf;
	END
END

--*************************************************************************************************************--
DECLARE @resultado VARCHAR(10)
EXECUTE SP_TRANSFERENCIA_INTERBANCARIA 'PAGO DE BICICLETA','TRANSFERENCIA',10000900008,678900000,1000,@result=@resultado OUTPUT
SELECT @resultado

SELECT * FROM CUENTA_CORRIENTE
SELECT * FROM TRANSACCIONES
SELECT * FROM BITACORA_TRANSACCIONES
SELECT * FROM CUENTA
SELECT * FROM BANCO

DBCC CHECKIDENT (BITACORA_TRANSACCIONES, RESEED, 0)
DBCC CHECKIDENT (TRANSACCIONES, RESEED, 0)

delete from BITACORA_TRANSACCIONES
delete from TRANSACCIONES

UPDATE CUENTA_CORRIENTE SET saldo_actual=1000000,saldo_disponible=1000000 WHERE num_tarjeta=1234500000
select * from cuenta_corriente

--*************************************************************************************************************--
