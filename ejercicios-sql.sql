-- ¿Cuál es el primer proveedor con el que se negoció?
select 
t.nombre
 from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
order by fecha asc
limit 1;

-- ¿Cuál es la orden de compra más grande?
select 
oc.codigo
from inventarios."OrdenDeCompra" oc
order by total desc
limit 1

-- ¿A qué proveedor se le compró la primera orden de compra del 2024? Adicionalmente, ¿en qué centro de costos se cargó esa OC?
select
t.nombre,
cc.codigo
from inventarios."OrdenDeCompra" oc 
  join inventarios."Tercero" t 
    on oc."terceroId" = t.id
  join inventarios."CentroDeCostos" cc 
    on oc."centroDeCostosId" = cc.id  
where oc.fecha > '2024-01-01'
order by oc.fecha asc
limit 1;