-- ¿Cuál es el primer proveedor con el que se negoció?
select 
t.nombre
 from inventarios."OrdenDeCompra" oc
  join inventarios."Tercero" t
    on oc."terceroId" = t.id
order by fecha asc
limit 1;