create database DBVENTAS;

use DBVENTAS;

create table Rol(
    idRol int primary key identity(1,1),
    nombre varchar(50),
    fechaRegistro datetime default getdate()
);

create table Menu(
    idMenu int primary key identity(1,1),
    nombre varchar(50),
    icono varchar(50),
    url varchar(50)
)

-- to know which menu corresponds to the user
create table MenuRol(
    idMenuRol int primary key identity(1,1),
    idMenu int references Menu(idMenu),
    idRol int references Rol(idRol)
);

-- usuario table
create table Usuario(
    idUsuario int primary key identity(1,1),
    nombreCompleto varchar(100),
    correo varchar(40),
    idRol int references Rol(idRol),
    clave varchar(40),
    esActivo bit default 1,
    fechaRegistro datetime default getdate()
);

-- category table
create table Categoria(
    idCategoria int primary key identity(1,1),
    nombre varchar(50),
    esActivo bit default 1,
    fechaRegistro datetime default getdate()
);

-- product table
create table Producto(
    idProducto int primary key identity(1,1),
    nombre varchar(50),
    idCategoria int references Categoria(idCategoria),
    stock int,
    precio decimal(10,2),
    esActivo bit default 1,
    fechaRegistro datetime default getdate()
);

-- to store the sales numbers that are being registered   00001 -> 00002
create table NumeroDocumento(
    idNumeroDocumento int primary key identity(1,1),
    ultimo_Numero int not null,
    fechaRegistro datetime default getdate()
);

create table Venta(
    idVenta int primary key identity(1,1),
    numeroDocumento varchar(40),
    tipoPago varchar(50),
    total decimal(10,2),
    fechaRegistro datetime default getdate()
);

create table DetalleVenta(
    idDetalleVenta int primary key identity(1,1),
    idVenta int references Venta(idVenta),
    idProducto int references Producto(idProducto),
    cantidad int,
    precio decimal(10,2),
    total decimal(10,2)
);



-- to authorize the user
alter authorization on database::DBVENTAS to andmar;
