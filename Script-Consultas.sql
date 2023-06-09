----------------
-- CONSULTAS SQL
----------------

-- Nombre de modelos, marca y grupo de coches
select a.nombre_grupo_marca, b.nombre_marca, c.nombre_modelo
from practica_Carlosdelacruz.grupos_marca a
inner join practica_Carlosdelacruz.marcas b on a.id_grupo_marca = b.id_grupo_marca
inner join practica_Carlosdelacruz.modelos c on b.id_marca = c.id_marca;

-- Fecha de compra
select a.matricula, b.nombre_marca, c.nombre_modelo, a.fecha_compra
from practica_Carlosdelacruz.coches a
inner join practica_Carlosdelacruz.marcas b on a.id_marca = b.id_marca
inner join practica_Carlosdelacruz.modelos c on a.id_modelo = c.id_modelo;

-- Matrícula
select matricula from practica_Carlosdelacruz.coches;

-- Nombre del color del coche
select a.matricula, b.nombre_color
from practica_Carlosdelacruz.coches a
inner join practica_Carlosdelacruz.colores b on a.id_color = b.id_color;

-- Total de kilómetros
select matricula, concat(kilometraje,' ','Km') as kilometraje from practica_Carlosdelacruz.coches;

-- Nombre empresa a la que está asegurado el coche
select a.matricula, b.nombre_aseguradora
from practica_Carlosdelacruz.coches a
inner join practica_Carlosdelacruz.aseguradoras b on a.id_aseguradora = b.id_aseguradora;

-- Número de póliza
select matricula, poliza from practica_Carlosdelacruz.coches;

-- Coche con su revisión y precio de revisión
select
	a.matricula,
	b.nombre_marca,
	c.nombre_modelo,
	e.categoria_revision,
	d.costo_revision || ' ' || d.tipo_moneda as Costo_revision	
from practica_Carlosdelacruz.coches a
inner join practica_Carlosdelacruz.marcas b on a.id_marca = b.id_marca
inner join practica_Carlosdelacruz.modelos c on a.id_modelo = c.id_modelo
inner join practica_Carlosdelacruz.hist_revisiones_coches d on a.matricula = d.matricula
inner join practica_Carlosdelacruz.revisiones e on d.id_revision = e.id_revision;