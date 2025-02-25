---------------- punto 1
-- ¿Cuál es el primer proveedor con el que se negoció?
select 
t.nombre,
oc.fecha
from "Tercero" t
	join "OrdenDeCompra" oc
		on oc."terceroId"  = t.id
order by oc.fecha asc
limit 1

---------------- punto 2
-- ¿Cuál es la orden de compra más grande?
select * from "OrdenDeCompra" oc
order by oc.total desc
limit 1


---------------- punto 3
-- ¿A qué proveedor se le compró la orden de compra más reciente? 
-- Adicionalmente, ¿en qué centro de costos se cargó esa OC?
select 
oc.codigo,
oc.fecha,
t.nombre,
cc.codigo
from "OrdenDeCompra" oc
	join "Tercero" t
		on oc."terceroId" = t.id
	join "CentroDeCostos" cc
		on oc."centroDeCostosId" = cc.id
order by fecha desc
limit 1


-- ¿A qué proveedor se le compró la primera orden de compra del 2024? 
-- Adicionalmente, ¿en qué centro de costos se cargó esa OC?

-- filtro de fecha con between
select * from "OrdenDeCompra" oc
where oc.fecha between '2024-01-01' and '2024-12-31'
order by fecha asc

-- filtro de fecha con extract
select 
oc.codigo,
oc.fecha,
t.nombre,
cc.codigo
from "OrdenDeCompra" oc
	join "Tercero" t
		on oc."terceroId" = t.id
	join "CentroDeCostos" cc
		on oc."centroDeCostosId" = cc.id
where extract(year from oc.fecha) = 2024
order by fecha asc
limit 1

-- obtener el proveedor y el centro de costos de la última compra del 2023
select 
oc.codigo,
oc.fecha,
t.nombre,
cc.codigo
from "OrdenDeCompra" oc
	join "Tercero" t
		on oc."terceroId" = t.id
	join "CentroDeCostos" cc
		on oc."centroDeCostosId" = cc.id
where extract(year from oc.fecha) = 2023
order by fecha desc
limit 1


-- 4. ¿Cuál es el proveedor al que se le ha pagado la orden de compra más cara en el centro de costos CC-1001? ¿Cuál fue el valor de esa OC y en qué fecha se dio?
select 
t.nombre,
oc.fecha,
oc.total
from inventarios."OrdenDeCompra" oc
  join inventarios."CentroDeCostos" cc
    on oc."centroDeCostosId" = cc.id
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
where cc.codigo = ' CC-1001'
order by oc.total desc
limit 1;

-- 5. ¿Cuál es el total de compras realizadas en el centro de costos CC-1002?
select 
cc.codigo,
sum(oc.total)
from inventarios."CentroDeCostos" cc
  join inventarios."OrdenDeCompra" oc
    on oc."centroDeCostosId" = cc.id
where cc.codigo = ' CC-1002'
group by cc.codigo;

-- 6. Calcular el total de compras realizadas en cada centro de costos en el 2024.
select 
cc.codigo,
sum(oc.total)
from inventarios."CentroDeCostos" cc
  join inventarios."OrdenDeCompra" oc
    on oc."centroDeCostosId" = cc.id
where fecha >= '2024-01-01'
group by cc.codigo
order by sum(oc.total) desc;

-- 7. Calcular el total de compras realizadas por cada proveedor en el centro de costos CC-1003 en el año 2024.
select 
t.nombre,
sum(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
  join inventarios."CentroDeCostos" cc
    on oc."centroDeCostosId" = cc.id
where oc.fecha>'2024-01-01' and cc.codigo = ' CC-1003'
group by t.nombre
order by sum(oc.total) desc;

-- 8. Calcular el total de compras realizadas en cada centro de costos para el proveedor Almacén RopaViva en el 2023.
select 
cc.codigo,
sum(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
  join inventarios."CentroDeCostos" cc
    on oc."centroDeCostosId" = cc.id
where 
t.nombre = ' Almacén RopaViva'
--and oc.fecha between '2023-01-01' and '2023-12-31'
and extract(year from oc.fecha) = 2023
group by cc.codigo
order by sum(oc.total) desc;

-- 9. Calcular el mes del 2023 con más compras.
select 
extract(month from oc.fecha) as "mes",
sum(oc.total)
from inventarios."OrdenDeCompra" oc
where extract(year from oc.fecha) = 2023
group by extract(month from oc.fecha)
order by sum(oc.total) desc
limit 1;

-- 10. Calcular el top 3 de proveedores a los que más se les ha comprado en el 2024.
select 
t.nombre,
sum(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
where extract(year from oc.fecha) = 2024
group by t.nombre
order by sum(oc.total) desc
limit 3;

-- 11. Calcular el valor de la orden de compra más cara para cada proveedor.
select 
t.nombre,
max(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
group by t.nombre;

-- 12. Calcular los 3 de centros de costos que menos se usaron durante el 2021.
select 
cc.codigo,
sum(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."CentroDeCostos" cc
    on oc."centroDeCostosId" = cc.id
where extract(year from oc.fecha) = 2021
group by cc.codigo
order by sum(oc.total) asc
limit 3;

-- 13. ¿Cuáles son los 5 centros de costos con compras, en promedio, más altas?
select 
cc.codigo,
avg(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."CentroDeCostos" cc
    on oc."centroDeCostosId" = cc.id
group by cc.codigo
order by avg(oc.total) desc
limit 5;

-- 14. ¿Cuáles son los 5 proveedores más baratos en promedio del 2023?
select 
t.nombre,
avg(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
where extract(year from oc.fecha) = 2023
group by t.nombre
order by avg(oc.total) asc
limit 5;

-- 15. ¿Cuáles son los 3 proveedores a los que más se les compró en enero del 2024?
select 
t.nombre,
sum(oc.total)
from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
where extract(year from oc.fecha) = 2024 and extract(month from oc.fecha) = 1
group by t.nombre
order by sum(oc.total) desc
limit 3;
