create table Direccion(
idDireccion char(7) not null constraint pk_idDireccion primary key,
Distrito nvarchar2(50) not null,
Direccion nvarchar2(50) not null
);

create table Persona( 
Dni char(10),
Nombre varchar(50) not null,
APaterno varchar(50) not null,
AMaterno varchar(50) not null,
FechaNacimiento date not null,
Sexo char(1) constraint chk_Sexo check(Sexo in ('M','F')),
constraint pk_Dni primary key (Dni)
);

create table Email(
idEmail char(7),
Dni char(10),
Email nvarchar2(30) not null,
Descripcion nvarchar2(30) not null,
constraint pk_Codigo primary key (idEmail,Dni)
);

create table Cargo (
idCargo char(7),
Cargo varchar2(30) not null,
Sueldo number(10,2)constraint chk_Sueldo check (Sueldo between 100.00 and 4000.40),
constraint pk_Cargo primary key (idCargo)
);

create table Telefono (
idTelefono char(7),
Dni char(10),
Telefono char(10) not null,
constraint pk_Telefono primary key (idTelefono,Dni)
);

/* alterar una tabla */
alter table Telefono
  add Marca nvarchar2(20);
  
/*MOdificar una columna*/
alter table Telefono
  modify (Marca not null)

/**Eliminar una columna */
alter table Telefono
  drop column Marca

/*Alterar una tabla*/
  
  alter table Telefono
  modify Marca varchar2(30) default 'ENTEL'
  
describe telefono

create table Cliente (
Dni char(10),
Fecha_Registro date null,
constraint pk_Cliente primary key (Dni),
foreign key (Dni) references Persona(Dni)
);

alter table Persona
add Direccion char(7);

alter table Persona
  add constraint pk_Direccion foreign key (Direccion) references Direccion (idDireccion)

create table Empleado (
idEmpleado char(7),
Dni char(10),
Jefe char(7),
Horas_trabajo number,
Cargo char(7),
constraint pk_Empleado primary key (idEmpleado),
foreign key (Cargo) references Cargo (idCargo)
);

alter table Empleado
add constraint fk_Empleado foreign key (Jefe) references Empleado (idEmpleado)

/* edad de en años*/
select floor(months_between(sysdate,TO_DATE ('02/01/1995', 'dd/mm/yyyy'))/12)
from dual

select * from

