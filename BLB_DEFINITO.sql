use master

CREATE DATABASE BLB;

USE BLB;

CREATE TABLE BANCO
(cod_sede NVARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
telefono NVARCHAR(30)NOT NULL
);

CREATE TABLE CLIENTE
(cod_cliente NVARCHAR(15)NOT NULL PRIMARY KEY,
nombre VARCHAR(100)NOT NULL,
apellidos VARCHAR(100)NOT NULL,
telefono NVARCHAR(30)NOT NULL,
direccion NVARCHAR(200)NOT NULL,
fecha_nacimiento DATE NOT NULL,
email NVARCHAR(100)NOT NULL
);

CREATE TABLE CUENTA
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

CREATE TABLE SERVICIOS
(id_servicio VARCHAR(10) PRIMARY KEY NOT NULL,
tipo_servicio VARCHAR(15)NOT NULL,
nombre_compania VARCHAR(100),
cuenta NVARCHAR(100)
);

CREATE TABLE TRANSACCIONES
(cod_transaccion INT IDENTITY PRIMARY KEY,
detalle VARCHAR(100),
tipo_movimiento VARCHAR(30),
cuenta_origen NVARCHAR(100)NOT NULL,
cuenta_destino NVARCHAR(100) NOT NULL,
monto MONEY NOT NULL,
estado VARCHAR(10) NOT NULL,
);

CREATE TABLE PRESTAMOS
(cod_prestamo NVARCHAR(100)PRIMARY KEY NOT NULL,
id_cliente NVARCHAR(15)NOT NULL,
saldo_deber MONEY NOT NULL,
saldo_abonado MONEY NOT NULL,
fecha_vencimiento DATE NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES CLIENTE(cod_cliente)
);

CREATE TABLE Plan_Ahorro
(id_plan NVARCHAR(100)PRIMARY KEY NOT NULL,
id_cliente NVARCHAR(15)NOT NULL,
saldo_ahorrado MONEY NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES CLIENTE(cod_cliente)
);

CREATE TABLE USUARIO
(id_cliente NVARCHAR(15)NOT NULL,
contrasena VARBINARY(max) NOT NULL,
token VARBINARY(max) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES CLIENTE(cod_cliente)
);
DROP TABLE USUARIO

CREATE TABLE VALIDACION
(id_cliente NVARCHAR(15)NOT NULL,
pregunta1 VARCHAR(50) NOT NULL,
pregunta2 VARCHAR(50) NOT NULL,
pregunta3 VARCHAR(50) NOT NULL,
respuesta1 VARBINARY(MAX) NOT NULL,
respuesta2 VARBINARY(MAX) NOT NULL,
respuesta3 VARBINARY(MAX) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES CLIENTE(cod_cliente)
);

CREATE TABLE BITACORA_ACCIONES
(id_cliente NVARCHAR(15)NOT NULL,
hora datetime NOT NULL,
accion VARCHAR(50) NOT NULL
);

CREATE TABLE BITACORA_TRANSACCIONES
(id_bitacora INT IDENTITY PRIMARY KEY,
cod_transaccion INT NOT NULL,
fecha_hora_transaccion DATETIME NOT NULL,
estado VARCHAR(10) NOT NULL,
detalle VARCHAR(100) NOT NULL,
FOREIGN KEY (cod_transaccion) REFERENCES TRANSACCIONES(cod_transaccion),
);

--*******************************************************************************************
--CERTIFICADO DE ENCRIPTACION

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Pa$$w0rd'

GO

CREATE CERTIFICATE CertificadoEncriptacion WITH SUBJECT = 'Certificado para encriptar'

GO

CREATE SYMMETRIC KEY ClaveSimetrica

WITH ALGORITHM = AES_256

ENCRYPTION BY CERTIFICATE CertificadoEncriptacion

GO

--CERTIFICADO DE DESEMCRIPTACION

OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion

GO
--************************************************************************************************


insert into CLIENTE values(304940495,'Valeria','Alvarado Ureña','85026198','Cartago,CostaRica','1996-05-14','vialei14@gmail.com')
insert into USUARIO values(304940495, EncryptByKey(Key_GUID('ClaveSimetrica'),'vale'),EncryptByKey(Key_GUID('ClaveSimetrica'),'vale1'))

SELECT * FROM USUARIO
SELECT CAST(DecryptByKey(contrasena) AS VARCHAR(30)) from USUARIO

insert into BANCO values ('B-01', 'Banco Central','El Carmen,Cartago',25780956)
insert into BANCO values ('B-02', 'Banco Metropolitano','Curridabat',25765956)

insert into CUENTA values ('C-333', 1000000,1000000,0,GETDATE(),'2021-10-03','B-01',304940495,'Debit',100080009000,'Available')
insert into CUENTA values ('C-334', 3000000,3000000,0,GETDATE(),'2022-10-15','B-02',304940495,'Credit',100088909000,'Available')



update CLIENTE set email='dijefe84@gmail.com' where cod_cliente=304940495
update CUENTA set fecha_caducidad_tarjeta='2021-10-20' where id_cliente=304940495
select * from CLIENTE


--INSERT INTO SERVICIOS VALUES ('W-01','Water','AyA')
INSERT INTO SERVICIOS VALUES ('E-01','ELECTRICITY','ICE',1000030000200008)
INSERT INTO SERVICIOS VALUES ('I-01','INTERNET','ICE',1100030000200008)
INSERT INTO SERVICIOS VALUES ('W-01','WATER','AYA',1200030000200008)
INSERT INTO SERVICIOS VALUES ('P-01','PHONE','MOVISTAR',1300030000200008)

DELETE  FROM SERVICIOS
/*INSERT INTO SERVICIOS VALUES ('I-01','Internet','ICE')
INSERT INTO SERVICIOS VALUES ('E-02','Electricity','JASEC')
INSERT INTO SERVICIOS VALUES ('I-02','Internet','TIGO')
INSERT INTO SERVICIOS VALUES ('I-03','Internet','CLARO')
INSERT INTO SERVICIOS VALUES ('I-04','Internet','Telecable')
INSERT INTO SERVICIOS VALUES ('P-01','Phone','ICE')
INSERT INTO SERVICIOS VALUES ('P-02','Phone','CLARO')
INSERT INTO SERVICIOS VALUES ('P-03','Phone','MOVISTAR')*/

INSERT INTO TRANSACCIONES VALUES ('T-0001',GETDATE(),'Electricity','Debito','C-333','C-000000000001',20000)
INSERT INTO TRANSACCIONES VALUES ('T-0002',GETDATE(),'Water','Credit','C-334','C-000000000002',22000)
update CUENTA set tipo_cuenta='Debit' where tipo_cuenta='Debito'

INSERT INTO PRESTAMOS VALUES ('P-0001',304940495,5000000,2500000,'2021-12-10')
INSERT INTO PRESTAMOS VALUES ('P-0002',304940495,2000000,500000,'2021-12-10')

INSERT INTO Plan_Ahorro VALUES ('A-0001',304940495,8000000)	
INSERT INTO Plan_Ahorro VALUES ('A-0002',304940495,2000000)	
----------------------------------insert preguntas----------------------------------------------------
insert into VALIDACION values(304940495, '¿What is your favorite color?', '¿What is the name of your pet?', '¿What is your favorite movie?',EncryptByKey(Key_GUID('ClaveSimetrica'),'BLACK'),EncryptByKey(Key_GUID('ClaveSimetrica'),'LULU'),EncryptByKey(Key_GUID('ClaveSimetrica'),'ET'))

SELECT * FROM BANCO
SELECT * FROM CLIENTE
SELECT * FROM CUENTA
SELECT * FROM SERVICIOS
SELECT * FROM TRANSACCIONES
SELECT * FROM PRESTAMOS
SELECT * FROM Plan_Ahorro


--*******************************************Dijeff*****************************************************--
Create PROCEDURE [dbo].[SP_OBTENER_cuentas] @id_cliente NVARCHAR(15)
AS
begin
Select num_tarjeta from CUENTA where id_cliente=@id_cliente
end;
--******************************************************************************************************--
alter PROCEDURE [dbo].[spConsultarAgua] (@nIdentificacion bigint)
AS
SELECT cod_cliente, tipo_servicio, vencimiento, monto, intereses, total
FROM SERVICIOS, CLIENTE 
WHERE
id_servicio = @nIdentificacion;
GO
--******************************************************************************************************--
alter PROCEDURE [dbo].[spConsultarLuz]
(@nIdentificacion bigint)
 AS
SELECT 
cod_cliente,tipo_servicio,consumo,vencimiento,monto,intereses,total
FROM SERVICIOS, CLIENTE
WHERE
id_servicio = @nIdentificacion and tipo_servicio='Electricity';
GO
--******************************************************************************************************--
alter PROCEDURE [dbo].[spConsultarPhone] (@nIdentificacion bigint,@cod_cliente NVARCHAR(15))
AS
SELECT c.cod_cliente, s.tipo_servicio, s.vencimiento, s.monto, s.intereses, s.total
FROM SERVICIOS s, CLIENTE c
WHERE
id_servicio = @nIdentificacion and tipo_servicio='Phone';
GO
execute spConsultarPhone '62723188','305250863'
select * from SERVICIOS WHERE id_servicio = '62723188'
--******************************************************************************************************--
alter PROCEDURE [dbo].[spConsultarInternet]
(@nIdentificacion bigint)
 AS
SELECT 
cod_cliente,tipo_servicio,vencimiento,monto,intereses,total
FROM SERVICIOS, CLIENTE
WHERE
id_servicio=@nIdentificacion and tipo_servicio='Internet';
GO
execute spConsultarInternet '1020300'
--******************************************************************************************************--
create PROCEDURE [dbo].[spBloquearTarjeta]
 (@nIdentificacion bigint)
 AS
 begin
 UPDATE CUENTA
 SET estado = 'Disabled'
 WHERE num_tarjeta= @nIdentificacion;
end
--******************************************************************************************************--
create PROCEDURE [dbo].[consultarcliente]
as
begin
SELECT 
cod_cliente
FROM  CLIENTE
WHERE cod_cliente=304940495
end;
--******************************************************************************************************--

--**********************************************Kevin***************************************************--
CREATE PROCEDURE SP_DATOS_CLIENTE @cod_cliente NVARCHAR(15)
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY CERTIFICATE CertificadoEncriptacion
DECLARE @contrasena	NVARCHAR(50)
SET @contrasena=(SELECT CAST(DecryptByKey(contrasena) AS VARCHAR(30)) from USUARIO where id_cliente=@cod_cliente);

SELECT c.cod_cliente,c.nombre,c.apellidos,c.telefono,c.direccion,c.fecha_nacimiento,c.email,@contrasena as contrasena
FROM CLIENTE c WHERE c.cod_cliente= @cod_cliente;
END

EXECUTE SP_DATOS_CLIENTE 304940495
select * from CLIENTE
select * from Usuario
--******************************************************************************************************--
CREATE PROCEDURE SP_OBTENER_SEDES
AS
BEGIN
SELECT nombre FROM BANCO 
END;

EXECUTE SP_OBTENER_SEDES
--******************************************************************************************************--
CREATE PROCEDURE SP_EDIT_PROFILE @id_cliente NVARCHAR(15), @email NVARCHAR(100), @phone NVARCHAR(30), @direction NVARCHAR(200), @contrasena VARCHAR(50)
AS
BEGIN
UPDATE CLIENTE SET email=@email,telefono=@phone,direccion=@direction WHERE cod_cliente=@id_cliente
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY CERTIFICATE CertificadoEncriptacion
UPDATE USUARIO
SET contrasena = (EncryptByKey(Key_GUID('ClaveSimetrica'),@contrasena))
WHERE id_cliente=@id_cliente;
END
EXECUTE SP_EDIT_PROFILE 304940495,'vialey@cuc.cr',23456789,'Cartago Centro','vale'
--******************************************************************************************************--

CREATE PROCEDURE SP_VIEW_SAVING_ACCOUNTS @id_cliente NVARCHAR(15) 
AS
BEGIN
SELECT id_cuenta FROM CUENTA where id_cliente=@id_cliente
END
EXECUTE SP_VIEW_SAVING_ACCOUNTS 304940495
--******************************************************************************************************--
CREATE PROCEDURE SP_VIEW_CREDIT_CARDS @id_cliente NVARCHAR(15) 
AS
BEGIN
SELECT id_cuenta FROM CUENTA_DEBITO where id_cliente=@id_cliente
END
EXECUTE SP_VIEW_CREDIT_CARDS 304940495
--******************************************************************************************************--
CREATE PROCEDURE SP_VIEW_LOANS @id_cliente NVARCHAR(15) 
AS
BEGIN
SELECT cod_prestamo FROM PRESTAMOS where id_cliente=@id_cliente
END
EXECUTE SP_VIEW_LOANS 304940495
--******************************************************************************************************--
CREATE PROCEDURE SP_VIEW_SAVING_PLANS @id_cliente NVARCHAR(15) 
AS
BEGIN
SELECT id_plan FROM Plan_Ahorro where id_cliente=@id_cliente
END
EXECUTE SP_VIEW_SAVING_PLANS 304940495
--******************************************************************************************************--

--**************************************************Valeria*********************************************--
CREATE PROCEDURE SP_DATOS_CLIENTE_Login (@cod_cliente NVARCHAR(15),@contraseña varchar(15))
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion
   
select id_cliente,email from USUARIO,CLIENTE  where id_cliente= @cod_cliente and CAST(DecryptByKey(contrasena) AS VARCHAR(15)) =@contraseña and CLIENTE.cod_cliente=@cod_cliente;

END 

EXECUTE SP_DATOS_CLIENTE_Login '303330333', 'Daniel1%'

UPDATE CLIENTE
SET email = 'dijefe84@gmail.com'
WHERE cod_cliente='303330333';

--***********************************************actualiza token********************************************+

CREATE PROCEDURE SP_Actualizar_Token (@cod_cliente NVARCHAR(15),@token VARCHAR(15))
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion

UPDATE USUARIO
SET token = EncryptByKey(Key_GUID('ClaveSimetrica'),@token)
WHERE id_cliente=@cod_cliente;

END 


EXECUTE SP_Actualizar_Token '303330333', 'Furu5'
SELECT CAST(DecryptByKey(token) AS VARCHAR(300)) from USUARIO
select * from USUARIO



CREATE PROCEDURE SP_validar_token (@cod_cliente NVARCHAR(15),@token VARCHAR(15))
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion

select id_cliente from USUARIO where id_cliente= @cod_cliente and CAST(DecryptByKey(token) AS VARCHAR(15)) =@token ;

END 
EXECUTE SP_validar_token '304940495', '0Nhac'


--******************************************************************************************************--
CREATE PROCEDURE [dbo].[spConsultarMovimientos] (@nIdentificacion NVARCHAR(100))
AS
SELECT  distinct fecha_transaccion, cod_transaccion, detalle, tipo_movimiento, cod_cuenta, cuenta_destino, monto
FROM TRANSACCIONES join CUENTA 
on
TRANSACCIONES.cod_cuenta=CUENTA.id_cuenta
join CLIENTE on
CUENTA.id_cliente=CLIENTE.cod_cliente  
WHERE
CLIENTE.cod_cliente=@nIdentificacion
GO
EXECUTE [spConsultarMovimientos] '304940495'
--********************************************Bítacora**********************************************************--
CREATE PROCEDURE Testfecha (@cod_cliente NVARCHAR(15),@accion VARCHAR(50))
AS
BEGIN
insert into BITACORA(id_cliente,hora,accion) values (@cod_cliente,getdate(),@accion)
END

EXECUTE Testfecha '303330333', 'login'
select * from BITACORA

delete  from BITACORA

------------------------------------------------------procedimiento registrar cliente--------------------------------------------------------

CREATE PROCEDURE SP_REGISTRAR(@cod_cliente NVARCHAR(15),@nombre VARCHAR(100),@apellidos VARCHAR(100),@telefono NVARCHAR(30),
							  @direccion NVARCHAR(200),@fecha_nacimiento DATE,@email NVARCHAR(100),@contraseña VARCHAR(50),
							  @respuesta1 VARCHAR(50),@respuesta2 VARCHAR(50),@respuesta3 VARCHAR(50))
AS
BEGIN
	


	IF((SELECT COUNT (@cod_cliente) from CLIENTE WHERE cod_cliente=@cod_cliente)<1)

		 
	BEGIN 

	OPEN SYMMETRIC KEY ClaveSimetrica

	DECRYPTION BY CERTIFICATE CertificadoEncriptacion

	DECLARE @pregunta1 VARCHAR(50) ,  @pregunta2 VARCHAR(50) , @pregunta3 VARCHAR(50)

	SET @pregunta1='¿What is your favorite color?'
	SET @pregunta2='¿What is the name of your pet?'
	SET @pregunta3='¿What is your favorite movie?'
	

	INSERT INTO CLIENTE VALUES(@cod_cliente,@nombre,@apellidos,@telefono,@direccion,@fecha_nacimiento,@email);
	INSERT INTO USUARIO VALUES(@cod_cliente,EncryptByKey(Key_GUID('ClaveSimetrica'),@contraseña),EncryptByKey(Key_GUID('ClaveSimetrica'),'FURU1'));
	INSERT INTO VALIDACION VALUES(@cod_cliente,@pregunta1,@pregunta2,@pregunta3,EncryptByKey(Key_GUID('ClaveSimetrica'),@respuesta1),EncryptByKey(Key_GUID('ClaveSimetrica'),@respuesta2),EncryptByKey(Key_GUID('ClaveSimetrica'),@respuesta3))
	END	
	ELSE 

	BEGIN
		PRINT('This customer has already been registered');
	END
END


EXECUTE SP_REGISTRAR '45675678','Valeria','Alvarado Ureña','85026198','Cartago','1996-05-14','vialei14@gmail.com','vale','si','np','chao'

select * from USUARIO
select * from CLIENTE
select * from VALIDACION


DECLARE @cod_cliente NVARCHAR(15)
SET @cod_cliente= '304940495'
SELECT COUNT (@cod_cliente) from CLIENTE WHERE cod_cliente=@cod_cliente

-----------------------------------------------procedimiento preguntas------------------------------------------
Create PROCEDURE SP_validar_preguntas (@cod_cliente NVARCHAR(15),@res1 VARCHAR(MAX),@res2 VARCHAR(MAX),@res3 VARCHAR(MAX))
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion

select id_cliente,email from VALIDACION,CLIENTE where id_cliente= @cod_cliente and CAST(DecryptByKey(respuesta1) AS VARCHAR(max)) =@res1 and CAST(DecryptByKey(respuesta2) AS VARCHAR(max)) =@res2 and CAST(DecryptByKey(respuesta3) AS VARCHAR(max)) =@res3 and CLIENTE.cod_cliente=@cod_cliente ;
END 
EXECUTE SP_validar_preguntas '303330333', 'BLACK', 'LULU', 'ET'

--**********************************************************contrasena temporal*******************************************************************************

create PROCEDURE SP_Actualizar_contra (@cod_cliente NVARCHAR(15),@contratemp VARCHAR(15))
AS
BEGIN
OPEN SYMMETRIC KEY ClaveSimetrica

DECRYPTION BY CERTIFICATE CertificadoEncriptacion

UPDATE USUARIO
SET contrasena = EncryptByKey(Key_GUID('ClaveSimetrica'),@contratemp)
WHERE id_cliente=@cod_cliente;

END 

select * from VALIDACION
select * from SERVICIOS

update SERVICIOS set id_servicio=87654321 where id_servicio='1020301'
update SERVICIOS set id_servicio=71377138 where id_servicio='1020302'
update SERVICIOS set id_servicio=62723188 where id_servicio='1020303'

--**********************************************************Pago de servicios*******************************************************************************
create PROCEDURE SP_TRANSACTION_EVALUATION @num_cuenta NVARCHAR(100),@amount MONEY,
										  @empresa VARCHAR(100),@detail VARCHAR(100),
										  @tipo VARCHAR(30), @respuesta VARCHAR(20) OUTPUT
AS
BEGIN

		DECLARE @state VARCHAR(20)
		DECLARE @cuenta_destino NVARCHAR(100)

		IF(@detail LIKE 'ELECTRICAL SERVICE PAYMENT')
	    BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='ELECTRICITY')
		END
	
		ELSE IF(@detail LIKE 'WATER SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='WATER')
		END

		ELSE IF(@detail LIKE 'PHONE SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='PHONE')
		END

		ELSE IF(@detail LIKE 'INTERNET SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='INTERNET')
		END

		DECLARE @type VARCHAR(15)
		SET @type=(SELECT tipo_cuenta FROM CUENTA WHERE num_tarjeta=@num_cuenta)
		IF(@type='Debit')
		BEGIN
			DECLARE @monto MONEY
			SET @monto=(SELECT saldo_disponible FROM CUENTA WHERE num_tarjeta=@num_cuenta)
			IF(@monto>=@amount)
			BEGIN
				UPDATE CUENTA SET saldo_flotante=@amount,
				saldo_disponible=saldo_disponible-@amount 
				WHERE num_tarjeta=@num_cuenta
				SET @state='In process'

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@state)
				SELECT @respuesta=@state
			END
			ELSE 
			BEGIN
				SET @state='Insufficient Balance'
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@state)
				SELECT @respuesta=@state
			END
		END
		ELSE IF(@type='Credit')
		BEGIN
			UPDATE CUENTA SET saldo_flotante=@amount
			WHERE num_tarjeta=@num_cuenta
			SET @state='In process'
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@state)
			SELECT @respuesta=@state
		END
END

--*************************************************************Para la bitácora de transacciones*********************************************************
alter TRIGGER bitacora_transaccional
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
		INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,estado,detalle)
		VALUES (@cod_transaccion,GETDATE(),@state,'SUCCESFUL TRANSACTION');
	END
	ELSE IF(@state LIKE 'Failed')
	BEGIN
		INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,estado,detalle)
		VALUES (@cod_transaccion,GETDATE(),@state,'FAILED TRANSACTION');
	END
	ELSE IF(@state LIKE 'In process')
	BEGIN
		INSERT INTO BITACORA_TRANSACCIONES (cod_transaccion,fecha_hora_transaccion,estado,detalle)
		VALUES (@cod_transaccion,GETDATE(),@state,'PROCESSING TRANSACTION');
	END
GO
--**********************************************************************************************************************************************
ALTER PROCEDURE SP_TRANSACTION_RESULT    @num_cuenta NVARCHAR(100),@amount MONEY,
										  @empresa VARCHAR(100),@detail VARCHAR(100),
										  @tipo VARCHAR(30),@result VARCHAR(10),
										  @respuesta VARCHAR(20) OUTPUT
AS 
BEGIN

	DECLARE @state VARCHAR(20)
		DECLARE @cuenta_destino NVARCHAR(100)

		IF(@detail LIKE 'ELECTRICAL SERVICE PAYMENT')
	    BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='ELECTRICITY')
		END
	
		ELSE IF(@detail LIKE 'WATER SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='WATER')
		END

		ELSE IF(@detail LIKE 'PHONE SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='PHONE')
		END

		ELSE IF(@detail LIKE 'INTERNET SERVICE PAYMENT')
		BEGIN
			SET @cuenta_destino=(SELECT cuenta FROM SERVICIOS WHERE nombre_compania=@empresa AND tipo_servicio='INTERNET')
		END

		DECLARE @type VARCHAR(15)
		SET @type=(SELECT tipo_cuenta FROM CUENTA WHERE num_tarjeta=@num_cuenta)
		IF(@type='Debit')
		BEGIN
			IF(@result LIKE 'Successful')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0,
				saldo_actual=saldo_disponible
				WHERE num_tarjeta=@num_cuenta

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
			ELSE IF(@result LIKE 'Failed')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0,
				saldo_disponible=saldo_actual
				WHERE num_tarjeta=@num_cuenta

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
		END
		ELSE IF(@type='Credit')
		BEGIN
			IF(@result LIKE 'Successful')
			BEGIN
				UPDATE CUENTA SET saldo_actual=saldo_actual+saldo_flotante,saldo_flotante=0
				WHERE num_tarjeta=@num_cuenta
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
			ELSE IF(@result LIKE 'Failed')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0
				WHERE num_tarjeta=@num_cuenta
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@num_cuenta,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
		END
END
--**********************************************************************************************************************************************
--**********************************************************Pago de servicios*******************************************************************************
CREATE PROCEDURE SP_TRANSFERENCE_EVALUATION @cuenta_origen NVARCHAR(100),@cuenta_destino NVARCHAR(100),
										    @amount MONEY, @detail VARCHAR(100),@tipo VARCHAR(30), 
										    @respuesta VARCHAR(20) OUTPUT
AS
BEGIN

		DECLARE @state VARCHAR(20)
		
		DECLARE @type VARCHAR(15)
		SET @type=(SELECT tipo_cuenta FROM CUENTA WHERE num_tarjeta=@cuenta_origen)
		IF(@type='Debit')
		BEGIN
			DECLARE @monto MONEY
			SET @monto=(SELECT saldo_disponible FROM CUENTA WHERE num_tarjeta=@cuenta_origen)
			IF(@monto>=@amount)
			BEGIN
				UPDATE CUENTA SET saldo_flotante=@amount,
				saldo_disponible=saldo_disponible-@amount 
				WHERE num_tarjeta=@cuenta_origen
				SET @state='In process'

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@cuenta_origen,@cuenta_destino,@amount,@state)
				SELECT @respuesta=@state
			END
			ELSE 
			BEGIN
				SET @state='Insufficient Balance'
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@cuenta_origen,@cuenta_destino,@amount,@state)
				SELECT @respuesta=@state
			END
		END
		ELSE IF(@type='Credit')
		BEGIN
			UPDATE CUENTA SET saldo_flotante=@amount
			WHERE num_tarjeta=@cuenta_origen
			SET @state='In process'
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo,@cuenta_origen,@cuenta_destino,@amount,@state)
			SELECT @respuesta=@state
		END
END
--**********************************************************************************************************************************************
CREATE PROCEDURE SP_TRANFERENCE_RESULT     @cuenta_origen NVARCHAR(100),@cuenta_destino NVARCHAR(100),
										   @amount MONEY, @detail VARCHAR(100),@tipo VARCHAR(30), 
										   @result VARCHAR(10),@respuesta VARCHAR(20) OUTPUT
AS 
BEGIN

	DECLARE @state VARCHAR(20)
		
		DECLARE @type VARCHAR(15)
		SET @type=(SELECT tipo_cuenta FROM CUENTA WHERE num_tarjeta= @cuenta_origen)
		IF(@type='Debit')
		BEGIN
			IF(@result LIKE 'Successful')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0,
				saldo_actual=saldo_disponible
				WHERE num_tarjeta= @cuenta_origen

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo, @cuenta_origen,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
			ELSE IF(@result LIKE 'Failed')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0,
				saldo_disponible=saldo_actual
				WHERE num_tarjeta= @cuenta_origen

				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo, @cuenta_origen,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
		END
		ELSE IF(@type='Credit')
		BEGIN
			IF(@result LIKE 'Successful')
			BEGIN
				UPDATE CUENTA SET saldo_actual=saldo_actual+saldo_flotante,saldo_flotante=0
				WHERE num_tarjeta= @cuenta_origen
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo, @cuenta_origen,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
			ELSE IF(@result LIKE 'Failed')
			BEGIN
				UPDATE CUENTA SET saldo_flotante=0
				WHERE num_tarjeta= @cuenta_origen
				INSERT INTO TRANSACCIONES (detalle,tipo_movimiento,cuenta_origen,cuenta_destino,monto,estado) 
				VALUES (@detail,@tipo, @cuenta_origen,@cuenta_destino,@amount,@result)
				SELECT @respuesta=@result
			END
		END
END
--**********************************************************************************************************************************************

DECLARE @res VARCHAR(20) 
EXECUTE SP_TRANSFERENCE_EVALUATION 100080009000,123456,1000,'ALQUILER','TRANSFERENCE',@respuesta=@res OUTPUT
SELECT @res

DECLARE @res2 VARCHAR(20) 
EXECUTE SP_TRANFERENCE_RESULT 100080009000,123456,1000,'ELECTRICAL SERVICE PAYMENT','PAYMENT','Successful',@respuesta=@res2 OUTPUT
SELECT @res2


SELECT * FROM SERVICIOS

select * from CUENTA

DECLARE @res VARCHAR(20) 
EXECUTE SP_TRANSACTION_EVALUATION 100080009000,100000,'ICE','ELECTRICAL SERVICE PAYMENT','PAYMENT',@respuesta=@res OUTPUT
SELECT @res

DECLARE @res2 VARCHAR(20) 
EXECUTE SP_TRANSACTION_RESULT 100080009000,100000,'ICE','ELECTRICAL SERVICE PAYMENT','PAYMENT','Failed',@respuesta=@res2 OUTPUT
SELECT @res2


UPDATE CUENTA SET saldo_flotante=0,
saldo_disponible=saldo_actual
WHERE num_tarjeta=100080009000

UPDATE CUENTA SET saldo_flotante=0
WHERE num_tarjeta=100088909000

SELECT * FROM CUENTA
SELECT * FROM BITACORA_TRANSACCIONES
SELECT * FROM TRANSACCIONES

DELETE FROM TRANSACCIONES
DELETE FROM BITACORA_TRANSACCIONES
DBCC CHECKIDENT (BITACORA_TRANSACCIONES, RESEED, 0)
DBCC CHECKIDENT (TRANSACCIONES, RESEED, 0)


SELECT * FROM SERVICIOS
UPDATE CUENTA SET saldo_actual=1000000,saldo_disponible=1000000 WHERE num_tarjeta=100080009000