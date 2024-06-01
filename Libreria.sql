Create Database Libreria
GO
Create schema Catalogo
GO
Create Schema Ventas
GO
Use Libreria
Create table Catalogo.Autores (
	AutorID int identity  Primary key,
	Nombre Nvarchar (100),
	Apellido Nvarchar (100)
)

Create table Catalogo.Categorias(
	CategoriaID int identity Primary Key,
	Nombre Nvarchar (200) Unique
)

Create table Catalogo.Libros (
	LibroID int identity Primary Key,
	Titulo Nvarchar (300),
	AutorID int,
	CategoriaID int,
	Precio Money,
	Constraint FK_Autor_ID_Autores_Autor_ID_Libros Foreign Key (AutorID)
	References Catalogo.Autores(AutorID),
	Constraint FK_CategoriaID_Categorias_CategoriaID_Libros FOreign Key (CategoriaID)
	References Catalogo.categorias (CategoriaID)
)

Create table Ventas.Clientes (
	ClienteID INT Identity Primary key,
	Nombre_Cliente Nvarchar (300),
	Apellido_Cliente Nvarchar (300),
	Correo Nvarchar (300) Unique
)

Create table Ventas.Ventas (
	VentaID INT Identity Primary Key,
	FechaVenta Date,
	ClienteID Int
	Constraint FK_ClienteID_Ventas_ClienteID_Clientes Foreign Key (ClienteID)
	References Ventas.Clientes (ClienteID)
)

Create table Ventas.Detalleventas (
	DetalleID INT Primary key,
	VentaID INT,
	LibroID INT,
	Cantidad INT,
	PrecioVenta Money
)

--Alterar tabla por tipo de dato en un Primary Key
Alter table ventas.detalleventas 
DROP CONSTRAINT PK__Detallev__6E19D6FA9919DE6E

Alter table ventas.detalleventas 
DROP COLUMN DetalleID

Alter table ventas.detalleventas
ADD DETALLEID INT IDENTITY (1,1) PRIMARY KEY




---Relaciones que van por fuera---
Alter table ventas.detalleventas
add constraint FK_VentaID_Detalleventas_VentaID_Ventas Foreign Key (VentaID)
References Ventas.Ventas (VentaID)

Alter table ventas.detalleventas
add constraint FK_LibroID_Detalleventas_LibroID_Libros Foreign Key (LibroID)
References Catalogo.Libros (LibroID)

--- Añadir Columnas a tablas 
Alter table ventas.ventas
add Direccion_cliente nvarchar (50)
Alter table ventas.ventas
ADD genero_cliente NVARCHAR(30) NOT NULL CHECK (genero_cliente IN ('masculino', 'femenino'))

Alter table Catalogo.Libros
add fecha_publicacion date
Alter table Catalogo.Libros
add cantidadlibros date


--Modificar Nombres de columnas---
exec sp_rename 'Catalogo.Libros.cantidadlibros','fecha_llegada_biblioteca','Column';
exec sp_rename 'ventas.ventas.direccion_cliente','direccion','Column';
exec sp_rename 'Catalogo.Libros.fecha_publicacion','publicacion','Column';

--Insertar Datos
Select * From Catalogo.Libros
Insert into Catalogo.libros (Titulo,AutorID,CategoriaID, Precio, Publicacion, Fecha_llegada_biblioteca)
Values
--('Discurso del metodo',2,2,35000,'1637-01-01','2024-03-01')
--('La riqueza de las naciones',4,4,70000,'1500-08-01','2024-01-01')
--('La extramoral',3,3,25000,'1200-09-08','2024-02-28')
--('Zaratustra',5,5,10000,'1800-07-09','2024-03-27')
--('la caverna',7,6,12000,'1200-01-08','2024-02-15')
--('etica a nicomaco',8,7,27000,'1200-06-08','2024-04-17')
--('la Naranja mecanica',9,8,30000,'1970-01-08','2024-05-15')
--('1984',10,9,27800,'1960-05-07','2024-05-28')
--('Un Mundo Feliz',11,10,35000,'1940-07-02','2024-04-25')
--('La Odisea',1,1,20000,'1300-01-01','2024-02-01')

Select * From Catalogo.Autores
Insert into Catalogo.autores (Nombre, Apellido)
Values
--('Rene','Descartes')
--('Imanuel','Kant')
--('Adam','Smith')
--('Frederich','Nietzche')
--('Platon','N/A'),
--('Aristoteles','N/A'),
--('Anthony','Burges'),
--('George','Orwel'),
--('Aldox','Huxley')
--('Homero','N/A')
Delete from catalogo.autores Where autorID  = 6

Select * From Catalogo.Categorias
Insert Into catalogo.Categorias
values
--('Filosofia'),
--('Drama'),
--('historia'),
--('Economía'),
--('Arte'),
--('Ficcion'),
--('Politica'),
--('Sociedad'),
--('Contemporaneo'),
--('Clasico')


Select * From Ventas.Clientes
Insert Into Ventas.Clientes (Nombre_Cliente, Apellido_Cliente, Correo)
values
--('JUAN','RAMIREZ','JUANRAMIREZ@GMAIL.COM')
--('DAVID','ALVAREZ','DAVIDALVAREZ@GMAIL.COM')
--('PEDRO','DOMINGUEZ','PEDRODOMINGUEZ@GMIAL.COM'),
--('MARIA','OTALORA','MARIAOTALORA@GMAIL.COM'),
--('NICOLAS','OROZCO','NICOLASOROZCO@GMIAL.COM'),
--('FLOR','TABARES','FLORTABARES@GMAIL.COM'),
--('ALEXANDRA','CASTELLANOS','ALEXANDRACASTE@GMAIL.COM'),
--('DAVID','ALVARADO','DAVAL@GMAIL.COM'),
--('TEREZA','LOPEZ','TERELOP@GMAIL.COM'),
--('FELIPE','SAMUDIO','SAMFEP@GMAIL.COM')

Select * From Ventas.Ventas
Insert Into Ventas.Ventas (FechaVenta, ClienteID, direccion, genero_cliente)
Values
/*('2024-01-02',2, 'Carrera Norte 2', 'Femenino'),
('2024-02-01',3, 'Carrera Norte 1', 'Masculino'),
('2024-01-03',4, 'Carrera Sur 2', 'Masculino'),
('2024-03-01',5, 'Carrera Oeste 2', 'Femenino'),
('2024-04-01',6, 'Carrera Norte 1', 'Masculino'),
('2024-04-04',7, 'Carrera Sur 2', 'Femenino'),
('2024-05-07',8, 'Carrera Norte 3', 'Masculino'),
('2024-01-20',9, 'Carrera Sur 2', 'Femenino'),
('2024-01-17',10, 'Carrera Norte 2', 'Masculino')*/
--('2024-01-01',1, 'Carrera Norte 2', 'Masculino')

Select * From Ventas.Detalleventas
Insert Into Ventas.Detalleventas (VentaID, LibroID, Cantidad, PrecioVenta)
Values
/*(1,1,1, 20000),
(2,2,1, 35000),
(3,3,2,140000),
(4,4,1,25000),
(5,5,3,30000),
(6,6,1,12000),
(7,7,2, 54000),
(8,8,1,30000),
(9,9,1,27800),
(10,10,1,35000)*/

Delete from Ventas.Detalleventas Where  LibroID = 1