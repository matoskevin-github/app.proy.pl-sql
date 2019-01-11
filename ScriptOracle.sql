-- bd Hotel
-- primera forma crear tablas
create table TipoHabitacion (
idTipo char(5),
Nombre varchar(35) not null
);

create table Cliente (
idCliente char(10),
DNI char(10) unique,
Nombre varchar(50) not null,
FechaNacimiento date,
LugarNacimiento varchar(50) not null,
Sexo char(1),
Observacion varchar2(200)
);

create table Vendedor (
idVendedor char(10),
Nombre varchar(50) not null,
Direccion varchar(60) not null,
Telefono char(30) not null,
Observacion varchar2(200),
Sueldo decimal(10,2)
);

create table Habitacion (
idHabitacion char(10),
NumeroCamas int,
Descripcion varchar2(200),
Precio decimal(10,2),
idTipo char(5),
Observacion varchar2(200)
);

create table Alquiler (
idAlquiler char(10),
Precio decimal(10,2),
FechaEntrada date,
FechaSalida date,
Observacion varchar2(200),
idVendedor char(10),
idCliente char(10),
idHabitacion char(10)
);

-- agregar primary key
alter table TipoHabitacion add constraint pk_idTipo primary key (idTipo);
alter table Cliente add constraint pk_idCliente primary key (idCliente);
alter table Cliente add constraint chk_Sexo check (Sexo in ('M','F'));
alter table Vendedor add constraint pk_idVendedor primary key (idVendedor);
alter table Habitacion add constraint pk_idHabitacion primary key (idHabitacion);
alter table Alquiler add constraint pk_idAlquiler primary key (idAlquiler);
-- agregar foreign key
alter table Habitacion add constraint fk_idTipo foreign key (idTipo) references TipoHabitacion(idTipo);
alter table Alquiler add constraint fky_idVendedor foreign key (idVendedor) references Vendedor(idVendedor);
alter table Alquiler add constraint fky_idCliente foreign key (idCliente) references Cliente(idCliente);
alter table Alquiler add constraint fky_idHabitacion foreign key (idHabitacion) references Habitacion(idHabitacion);
-- modificar tabla
alter table Habitacion modify NumeroCamas number not null;
-- renombrar columna table
alter table Habitacion rename column NumeroCamas to CantCamas;
-- eliminar 

alter table TipoHabitacion  drop constraint pk_idTipo;
alter table Cliente drop constraint pk_idCliente ;
alter table Cliente drop constraint chk_Sexo;
alter table Vendedor drop constraint pk_idVendedor ;
alter table Habitacion drop constraint pk_idHabitacion ;
alter table Alquiler drop constraint pk_idAlquiler;
alter table Alquiler drop constraint fky_idVendedor;
alter table Alquiler drop constraint fky_idCliente ;
alter table Alquiler drop constraint fky_idHabitacion;

drop table TipoHabitacion;
drop table Cliente;
drop table Vendedor;
drop table Habitacion;
drop table Alquiler;

-- segunda forma crear tablas
create table TipoHabitacion (
idTipo char(5)constraint pk_idTipo primary key,
Nombre varchar(35) not null
);

create table Cliente (
idCliente char(10) constraint pk_idCliente primary key,
DNI char(10) unique,
Nombre varchar(50) not null,
FechaNacimiento date,
LugarNacimiento varchar(50) not null,
Sexo char(1) constraint chk_Sexo check (Sexo in ('M','F')),
Observacion varchar2(200)
);

create table Vendedor (
idVendedor char(10) constraint pk_idVendedor primary key,
Nombre varchar(50) not null,
Direccion varchar(60) not null,
Telefono char(30) not null,
Observacion varchar2(200),
Sueldo decimal(10,2)
);

create table Habitacion (
idHabitacion char(10)constraint pk_idHabitacion primary key,
NumeroCamas int,
Descripcion varchar2(200),
Precio decimal(10,2),
idTipo char(5) constraint fk_idTipo references TipoHabitacion(idTipo),
Observacion varchar2(200)
);

create table Alquiler (
idAlquiler char(10),
Precio decimal(10,2),
FechaEntrada date,
FechaSalida date,
Observacion varchar2(200),
idVendedor char(10)constraint fky_idVendedor references Vendedor(idVendedor),
idCliente char(10)constraint fky_idCliente references Cliente(idCliente),
idHabitacion char(10)constraint fky_idHabitacion references Habitacion(idHabitacion)
);

-- tercera forma crear tablas
create table TipoHabitacion (
idTipo char(5) primary key not null,
Nombre varchar(35) not null
);

create table Cliente (
idCliente char(10) primary key not null,
DNI char(10) unique,
Nombre varchar(50) not null,
FechaNacimiento date,
LugarNacimiento varchar(50) not null,
Sexo char(1) check (Sexo in ('M','F')),
Observacion varchar2(200)
);

create table Vendedor (
idVendedor char(10) primary key not null,
Nombre varchar(50) not null,
Direccion varchar(60) not null,
Telefono char(30) not null,
Observacion varchar2(200),
Sueldo decimal(10,2)
);

create table Habitacion (
idHabitacion char(10) primary key not null,
NumeroCamas int,
Descripcion varchar2(200),
Precio decimal(10,2),
idTipo char(5) references TipoHabitacion(idTipo) ,
Observacion varchar2(200)
);

create table Alquiler (
idAlquiler char(10),
Precio decimal(10,2),
FechaEntrada date,
FechaSalida date,
Observacion varchar2(200),
idVendedor char(10) references Vendedor(idVendedor),
idCliente char(10) references  Clientes(idCliente),
idHabitacion char(10) references Habitacion(idHabitacion)
);

-- bd Ventas
create table tm_Clientes(
idCliente char(10),
Nombre nchar(60),
Direccion varchar(50),
Telefono char(25),
Observacion varchar(90)
);

create table tm_Productos (
idProducto char(10),
Nombre nchar(60),
Descripcion varchar(70),
PrecioUnitario decimal(10,2),
Observacion varchar(90)
);

create table tm_Ventas (
idVenta char(10),
Fecha date,
idCliente char(10),
Observacion varchar(90)
);

create table tm_DetalleVentas(
idVenta char(10),
idProducto char(10),
Cantidad number(3),
PrecioUnitario decimal(10,2)
);

-- Agregar Primary key
alter table tm_Clientes add constraint pky_idCliente primary key (idCliente);
alter table tm_Productos add constraint pky_idProducto primary key (idProducto);
alter table tm_Ventas add constraint pky_idVenta primary key (idVenta);
-- Agregar Foreign key
alter table tm_Ventas add constraint fky_idCliente foreign key (idCliente) references tm_Clientes(idCliente);
alter table tm_DetalleVentas add constraint fky_idVenta foreign key(idVenta) references tm_Ventas(idVenta);
alter table tm_DetalleVentas add constraint fky_idProducto foreign key(idProducto) references tm_Productos(idProducto);
-- eliminar constraint
alter table tm_Clientes drop constraint pky_idCliente;
alter table tm_Productos drop constraint pky_idProducto;
alter table tm_Ventas drop constraint pky_idVenta;
alter table tm_Ventas drop constraint fky_idCliente;
alter table tm_DetalleVentas drop constraint fky_idVenta;
alter table tm_DetalleVentas drop constraint fky_idProducto;
-- eliminar tablas
drop table tm_Clientes;
drop table tm_Productos;
drop table tm_Ventas;
drop table tm_DetalleVentas;
-- cambiar nombre columna
describe tm_clientes;
alter table tm_Clientes rename column Nombre to Nombres_Completos;

-- modificar columna
alter table tm_Clientes modify Observacion varchar(90) not null;



