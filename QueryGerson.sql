--TASK 1 Create SCHEMA => ok
--CREATE SCHEMA [robertvl]
--AUTHORIZATION[dbo]
--GO

--TASK 2 CREATE TABLES

CREATE TABLE [robertvl].[CatRol]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULL
)

--TASK 3 CREATE TABLE STATUS
CREATE TABLE [robertvl].[CatStatus]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULL
)

--Task 4 

CREATE TABLE [robertvl].[User](
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(100) NOT NULL,
	[Password] VARCHAR(100) NOT NULL,
	[RoleId] INT NOT NULL,
	[IsActive] BIT NOT NULL,
	--Crear la referencia de la FK con la tabla CatRol
	CONSTRAINT [FK_User_RoleID] FOREIGN KEY ([RoleId]) REFERENCES [robertvl].[CatRol](Id),
)

--TASK 5 CREAR LAS UTLIMOS 2 TABLAS
CREATE TABLE [robertvl].[UserNote](
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[UserId] INT NOT NULL,
	[Note] VARCHAR(50) NOT NULL,
	--Crear la referencia de la FK con la tabla User
	CONSTRAINT [FK_UserNote_UserId] FOREIGN KEY ([UserId]) REFERENCES [robertvl].[User](Id),
)

CREATE TABLE [robertvl].[Project](
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(100),
	[UserId] INT NOT NULL,
	[StatusId] INT NOT NULL,
	--Crear la referencia de la FK con la tabla User
	CONSTRAINT [FK_Project_UserId] FOREIGN KEY ([UserId]) REFERENCES [robertvl].[User](Id),
	CONSTRAINT [FK_Project_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [robertvl].[CatStatus](Id),
)






--
--Extraccion de datos, consultar toda la informacion
SELECT * FROM [robertvl].[User]

--seleccionar por columnas y por filtros
SELECT  Name, RoleId from [robertvl].[User]

--Insert, poblar, agregar, nuevo etc
INSERT INTO [robertvl].[User] ([Name],[Password],[RoleId],[IsActive])
VALUES ('Robbie VL', '')
--Insertamos Valores dentro de catRol de Gerson y mio
INSERT INTO [gersonmh].[CatRol]([Name],[IsActive])
VALUES ('BackEnd', '1')
INSERT INTO [robertvl].[CatRol]([Name],[IsActive])
VALUES ('BackEnd', '0')
--Seleccionar Nombre e IsActive de CatRol
SELECT Name, IsActive from [gersonmh].[CatRol]
SELECT * from [robertvl].[User]
--Select pero por parametros, en este caso donde Id = 1
select CR.Id, CR.Name from robertvl.CatRol AS CR
where Id=1

select * from robertvl.CatRol AS CR
--Actualizar valor de name donde id = 1
UPDATE [robertvl].[CatRol] SET Name = 'Tester' where Id = 1

--Se llena la tabla CatStatus
INSERT INTO [robertvl].[CatStatus]([Name],[IsActive])
VALUES ('Finalized', '1')

select * from robertvl.CatStatus
select * from robertvl.UserNote
select * from robertvl.Project

INSERT INTO [robertvl].[Project]([Name],[UserId],StatusId)
VALUES ('Proyecto Bootcamp', '1','1')

UPDATE [robertvl].[CatStatus] SET Name = 'Finalized' where Id = 1

---------------------------------------------------------------------
--Selec -> join
select U.Name, U.RoleId, CR.Name from [robertvl].[User] AS U
JOIN robertvl.CatRol CR on U.RoleId = CR.Id
WHERE U.Id = 1

--Join con mas de 2 tablas, ya tiene proyecto, estatus, rol
select *
from robertvl.Project P
join robertvl.CatStatus CS ON p.StatusId = CS.Id
join robertvl.[User] U ON p.UserId = U.Id
join robertvl.CatRol CR ON U.RoleId = CR.Id
--Store Procesedure
CREATE PROCEDURE [robertvl].[GetUserByRolIdAndIsActive] @RoleId INT, @IsActive bit
AS 
BEGIN 


END


--ejecutar SP
EXEC [robertvl].GetUserByRolIdAndIsActive


--Como reto tarea colocar nuestro usuario y comentario general de la presentacion de dia de hoy, sobre el recurso de dbo
--insert esquema dbo en la tabla user con nuestra info, tambien project y userNote


select * from dbo.UserNote
select * from [dbo].[User]
select * from [dbo].[Project]

INSERT INTO [dbo].[User]([Name],[Password],[RoleId],[IsActive])
VALUES ('Robbie Valderrama','ABD123ZXY','2','1')

INSERT INTO [dbo].[Project]([Name],[UserId],[StatusId])
VALUES ('Proyecto-Bootcamp-Robbie','9','3')

INSERT INTO [dbo].[UserNote]([UserId],[Note])
VALUES ('9','Gracias por la explicacion Gerson respecto a SQL, todo claro y muy interesante, gracias por los comentarios y retroalimentacion')