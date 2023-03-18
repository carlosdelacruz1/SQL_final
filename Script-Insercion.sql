--------------------
-- CREACION SCHEMA
--------------------
CREATE SCHEMA practica_Carlosdelacruz;

SET SCHEMA 'Carlosdelacruz';

------------------------------
-- CREACION TABLA grupos_marca
------------------------------

-- Tabla grupos_marca
create table practica_Carlosdelacruz.grupos_marca(
	ID_grupo_marca varchar(10) not null, -- PK
	nombre_grupo_marca varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla grupos_marca
alter table practica_Carlosdelacruz.grupos_marca
add constraint grupos_marca_PK primary key (ID_grupo_marca);

------------------------
-- CREACION TABLA marcas
------------------------

-- Tabla marcas
create table practica_Carlosdelacruz.marcas(
	ID_marca varchar(10) not null, -- PK
	ID_grupo_marca varchar(10) not null, -- FK grupos_marca
	nombre_marca varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla marcas
alter table practica_Carlosdelacruz.marcas
add constraint marcas_PK primary key (ID_marca);

-- FK marcas - grupos_marca
alter table practica_Carlosdelacruz.marcas
add constraint marcas_grupos_marca_FK foreign key (ID_grupo_marca)
references practica_Carlosdelacruz.grupos_marca (ID_grupo_marca);

-------------------------
-- CREACION TABLA modelos
-------------------------

-- Tabla modelos
create table practica_Carlosdelacruz.modelos(
	ID_modelo varchar(10) not null, -- PK
	ID_marca varchar(10) not null, -- FK marcas
	nombre_modelo varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla modelos
alter table practica_Carlosdelacruz.modelos
add constraint modelos_PK primary key (ID_modelo);

-- FK modelos - marcas
alter table practica_Carlosdelacruz.modelos
add constraint modelos_marcas_FK foreign key (ID_marca)
references practica_Carlosdelacruz.marcas (ID_marca);

-------------------------
-- CREACION TABLA colores
-------------------------

-- Tabla colores
create table practica_Carlosdelacruz.colores(
	ID_color varchar(10) not null, -- PK
	nombre_color varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla colores
alter table practica_Carlosdelacruz.colores
add constraint colores_PK primary key (ID_color);

------------------------------
-- CREACION TABLA aseguradoras
------------------------------

-- Tabla aseguradoras
create table practica_Carlosdelacruz.aseguradoras(
	ID_aseguradora varchar(10) not null, -- PK
	nombre_aseguradora varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla aseguradoras
alter table practica_Carlosdelacruz.aseguradoras
add constraint aseguradoras_PK primary key (ID_aseguradora);

---------------------------
-- CREACION TABLA empleados
---------------------------

-- Tabla empleados
create table practica_Carlosdelacruz.empleados(
	ID_empleado varchar(10) not null, -- PK
	nombre varchar(50) not null,
	apellido1 varchar(50) not null,
	apellido2 varchar(50) null,
	descripcion varchar(500) null
);

-- PK Tabla empleados
alter table practica_Carlosdelacruz.empleados
add constraint empleados_PK primary key (ID_empleado);

------------------------
-- CREACION TABLA coches
------------------------

-- Tabla coches
create table practica_Carlosdelacruz.coches(
	matricula varchar(50) not null, -- PK
	fecha_compra date not null,
	poliza varchar(50) not null,
	kilometraje int not null,
	ID_grupo_marca varchar(10) not null, -- FK grupos_marca
	ID_marca varchar(10) not null, -- FK marcas
	ID_modelo varchar(10) not null, -- FK modelos
	ID_color varchar(10) not null, -- FK colores
	ID_aseguradora varchar(10) not null, -- FK aseguradoras
	ID_empleado varchar(10) not null, -- FK empleados
	descripcion varchar(500) null
);

-- PK Tabla coches
alter table practica_Carlosdelacruz.coches
add constraint coches_PK primary key (matricula);

-- FK coches - grupos_marca
alter table practica_Carlosdelacruz.coches
add constraint coches_grupos_marca_FK foreign key (ID_grupo_marca)
references practica_Carlosdelacruz.grupos_marca (ID_grupo_marca);

-- FK coches - marcas
alter table practica_Carlosdelacruz.coches
add constraint coches_marcas_FK foreign key (ID_marca)
references practica_Carlosdelacruz.marcas (ID_marca);

-- FK coches - modelos
alter table practica_Carlosdelacruz.coches
add constraint coches_modelos_FK foreign key (ID_modelo)
references practica_Carlosdelacruz.modelos (ID_modelo);

-- FK coches - colores
alter table practica_Carlosdelacruz.coches
add constraint coches_colores_FK foreign key (ID_color)
references practica_Carlosdelacruz.colores (ID_color);

-- FK coches - aseguradoras
alter table practica_Carlosdelacruz.coches
add constraint coches_aseguradoras_FK foreign key (ID_aseguradora)
references practica_Carlosdelacruz.aseguradoras (ID_aseguradora);

-- FK coches - empleados
alter table practica_Carlosdelacruz.coches
add constraint coches_empleados_FK foreign key (ID_empleado)
references practica_Carlosdelacruz.empleados (ID_empleado);

----------------------------
-- CREACION TABLA revisiones
----------------------------

-- Tabla revisiones
create table practica_Carlosdelacruz.revisiones(
	ID_revision varchar(10) not null, -- PK
	categoria_revision varchar(50) not null,
	descripcion varchar(500) null
);

-- PK Tabla revisiones
alter table practica_Carlosdelacruz.revisiones
add constraint revisiones_PK primary key (ID_revision);

-------------------------
-- CREACION TABLA monedas
-------------------------

-- Tabla monedas
create table practica_Carlosdelacruz.monedas(
	tipo_moneda varchar(10) not null, -- PK
	nombre_moneda varchar(100) not null,
	descripcion varchar(500) null
);

-- PK Tabla monedas
alter table practica_Carlosdelacruz.monedas
add constraint monedas_PK primary key (tipo_moneda);

----------------------------------------
-- CREACION TABLA hist_revisiones_coches
----------------------------------------

-- Tabla hist_revisiones_coches
create table practica_Carlosdelacruz.hist_revisiones_coches(
	matricula varchar(50) not null, -- PK y FK coches
	ID_revision varchar(10) not null, -- PK y FK revisiones
	km_revision int not null,
	fecha_revision date not null,
	costo_revision int not null,
	tipo_moneda varchar(10) not null, -- FK monedas
	descripcion varchar(500) null
);

-- PK Tabla hist_revisiones_coches
alter table practica_Carlosdelacruz.hist_revisiones_coches
add constraint hist_revisiones_coches_PK primary key (matricula, ID_revision);

-- FK hist_revisiones_coches - coches
alter table practica_Carlosdelacruz.hist_revisiones_coches
add constraint hist_revisiones_coches_coches_FK foreign key (matricula)
references practica_Carlosdelacruz.coches (matricula);

-- FK hist_revisiones_coches - revisiones
alter table practica_Carlosdelacruz.hist_revisiones_coches
add constraint hist_revisiones_coches_revisiones_FK foreign key (ID_revision)
references practica_Carlosdelacruz.revisiones (ID_revision);

-- FK hist_revisiones_coches - monedas
alter table practica_Carlosdelacruz.hist_revisiones_coches
add constraint hist_revisiones_coches_monedas_FK foreign key (tipo_moneda)
references practica_Carlosdelacruz.monedas (tipo_moneda);

-------------------------------
-- RELLENADO TABLA grupos_marca
-------------------------------

insert into practica_Carlosdelacruz.grupos_marca
(id_grupo_marca, nombre_grupo_marca)
values ('GM1', 'Grupo Toyota');

insert into practica_Carlosdelacruz.grupos_marca
(id_grupo_marca, nombre_grupo_marca)
values ('GM2', 'Grupo Honda');

insert into practica_Carlosdelacruz.grupos_marca
(id_grupo_marca, nombre_grupo_marca)
values ('GM3', 'Grupo Ford');


-------------------------
-- RELLENADO TABLA marcas
-------------------------

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M1', 'GM1', 'Toyota');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M2', 'GM1', 'Lexus');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M3', 'GM1', 'Daihatsu');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M4', 'GM2', 'Honda');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M5', 'GM2', 'Acura');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M6', 'GM3', 'Lincoln');

insert into practica_Carlosdelacruz.marcas
(id_marca, id_grupo_marca, nombre_marca)
values ('M7', 'GM3', 'Ford');


--------------------------
-- RELLENADO TABLA modelos
--------------------------

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO1', 'M1', 'Corolla');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO2', 'M1', 'Rav4');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO3', 'M2', 'RX 350');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO4', 'M2', 'LX 470');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO5', 'M3', 'Terios');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO6', 'M3', 'Mira');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO7', 'M4', 'Civic');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO8', 'M4', 'Pilot');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO9', 'M5', 'ILX');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO10', 'M5', 'MDX');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO11', 'M6', 'Aviator');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO12', 'M6', 'Continental');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO13', 'M7', 'Focus');

insert into practica_Carlosdelacruz.modelos
(id_modelo, id_marca, nombre_modelo)
values ('MO14', 'M7', 'Escape');


--------------------------
-- RELLENADO TABLA colores
--------------------------

insert into practica_Carlosdelacruz.colores
(id_color, nombre_color)
values('C1', 'Verde');

insert into practica_Carlosdelacruz.colores
(id_color, nombre_color)
values('C2', 'Naranja');

insert into practica_Carlosdelacruz.colores
(id_color, nombre_color)
values('C3', 'Negro');

insert into practica_Carlosdelacruz.colores
(id_color, nombre_color)
values('C4', 'Plateado');

-------------------------------
-- RELLENADO TABLA aseguradoras
-------------------------------

insert into practica_Carlosdelacruz.aseguradoras
(id_aseguradora, nombre_aseguradora)
values('A1', 'Seguros AXXA');

insert into practica_Carlosdelacruz.aseguradoras
(id_aseguradora, nombre_aseguradora)
values('A2', 'Seguros Mapfre');

insert into practica_Carlosdelacruz.aseguradoras
(id_aseguradora, nombre_aseguradora)
values('A3', 'Seguros REALE');


----------------------------
-- RELLENADO TABLA empleados
----------------------------

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E1', 'Jose', 'Manolin', 'Jimenez');

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E2', 'Lola', 'lolita', 'lola');

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E3', 'Laura', 'de la Cruz', 'Benal');

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E4', 'Carlos', 'Torcido', 'Leon');

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E5', 'Antonio', 'Magallanes', 'Newton');

insert into practica_Carlosdelacruz.empleados
(id_empleado, nombre, apellido1, apellido2)
values('E6', 'Veneno', 'del bueno', 'Para los fisicos');


-----------------------------
-- RELLENADO TABLA revisiones
-----------------------------

insert into practica_Carlosdelacruz.revisiones
(id_revision, categoria_revision)
values('R1', 'Renovar aceite');


insert into practica_Carlosdelacruz.revisiones
(id_revision, categoria_revision)
values('R2', 'Cambio de frenos');

insert into practica_Carlosdelacruz.revisiones
(id_revision, categoria_revision)
values('R3', 'Estado Motor');

insert into practica_Carlosdelacruz.revisiones
(id_revision, categoria_revision)
values('R4', 'Cambio pintura');

--------------------------
-- RELLENADO TABLA monedas
--------------------------

insert into practica_Carlosdelacruz.monedas
(tipo_moneda, nombre_moneda)
values('EUR', 'Euro €');

insert into practica_Carlosdelacruz.monedas
(tipo_moneda, nombre_moneda)
values('USD', 'Dolar $');

insert into practica_Carlosdelacruz.monedas
(tipo_moneda, nombre_moneda)
values('GBP', 'Libra');

-------------------------
-- RELLENADO TABLA coches
-------------------------

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('7895 DKB', now(), '098452', 35000, 'GM1', 'M1', 'MO1', 'C1', 'A1', 'E1');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('4526 DQW', now(), '489752', 3000, 'GM3', 'M7', 'MO9', 'C4', 'A3', 'E2');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('4568 HRT', now(), '450055', 45600, 'GM2', 'M4', 'MO8', 'C2', 'A2', 'E4');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('4650 DQN', now(), '645687', 7000, 'GM3', 'M6', 'MO7', 'C3', 'A3', 'E6');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('7468 AQQ', now(), '05632', 6500, 'GM1', 'M2', 'MO3', 'C1', 'A1', 'E4');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('7489 HJK', now(), '4658987', 8500, 'GM3', 'M7', 'MO6', 'C3', 'A3', 'E2');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('6258 KLF', now(), '78923', 78955, 'GM1', 'M3', 'MO5', 'C1', 'A1', 'E1');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('7980 OLP', now(), '015687', 405684, 'GM2', 'M5', 'MO2', 'C2', 'A2', 'E3');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('0156 ASD', now(), '684280', 9885, 'GM3', 'M7', 'MO4', 'C3', 'A3', 'E4');

insert into practica_Carlosdelacruz.coches
(matricula, fecha_compra, poliza, kilometraje, id_grupo_marca,
id_marca, id_modelo, id_color, id_aseguradora, id_empleado)
values('4168 HJU', now(), '80889', 8000, 'GM2', 'M4', 'MO7', 'C2', 'A2', 'E2');

-----------------------------------------
-- RELLENADO TABLA hist_revisiones_coches
-----------------------------------------

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('7980 OLP', 'R1', 8000, now(), 250, 'EUR');

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('0156 ASD', 'R3', 9885, now(), 300, 'USD');

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('7489 HJK', 'R3', 64056, now(), 150, 'GBP');

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('7468 AQQ', 'R4', 9000, now(), 500, 'EUR');

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('4568 HRT', 'R2', 68420, now(), 100, 'GBP');

insert into practica_Carlosdelacruz.hist_revisiones_coches
(matricula, id_revision, km_revision, fecha_revision, costo_revision, tipo_moneda)
values('7895 DKB', 'R4', 5098, now(), 100, 'USD');
