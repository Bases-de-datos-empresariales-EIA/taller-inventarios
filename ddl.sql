-- DROP SCHEMA inventarios;

CREATE SCHEMA inventarios AUTHORIZATION postgres;

-- DROP TYPE inventarios."EnumTipoMovimiento";

CREATE TYPE inventarios."EnumTipoMovimiento" AS ENUM (
	'ENTRADA',
	'SALIDA');

-- DROP TYPE inventarios."EnumTipoTercero";

CREATE TYPE inventarios."EnumTipoTercero" AS ENUM (
	'CLIENTE',
	'PROVEEDOR');

-- DROP SEQUENCE inventarios."Categoria_id_seq";

CREATE SEQUENCE inventarios."Categoria_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."CentroDeCostos_id_seq";

CREATE SEQUENCE inventarios."CentroDeCostos_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."FacturaDeVenta_id_seq";

CREATE SEQUENCE inventarios."FacturaDeVenta_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."ListaDePrecios_id_seq";

CREATE SEQUENCE inventarios."ListaDePrecios_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."Movimiento_id_seq";

CREATE SEQUENCE inventarios."Movimiento_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."OrdenDeCompra_id_seq";

CREATE SEQUENCE inventarios."OrdenDeCompra_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."PrecioProducto_id_seq";

CREATE SEQUENCE inventarios."PrecioProducto_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."Producto_id_seq";

CREATE SEQUENCE inventarios."Producto_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."Tercero_id_seq";

CREATE SEQUENCE inventarios."Tercero_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE inventarios."Usuario_id_seq";

CREATE SEQUENCE inventarios."Usuario_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- inventarios."Categoria" definition

-- Drop table

-- DROP TABLE inventarios."Categoria";

CREATE TABLE inventarios."Categoria" (
	id serial4 NOT NULL,
	nombre text NOT NULL,
	descripcion text NOT NULL,
	CONSTRAINT "Categoria_pkey" PRIMARY KEY (id)
);


-- inventarios."CentroDeCostos" definition

-- Drop table

-- DROP TABLE inventarios."CentroDeCostos";

CREATE TABLE inventarios."CentroDeCostos" (
	id serial4 NOT NULL,
	codigo text NOT NULL,
	CONSTRAINT "CentroDeCostos_pkey" PRIMARY KEY (id)
);


-- inventarios."ListaDePrecios" definition

-- Drop table

-- DROP TABLE inventarios."ListaDePrecios";

CREATE TABLE inventarios."ListaDePrecios" (
	id serial4 NOT NULL,
	nombre text NOT NULL,
	fecha timestamp(3) NOT NULL,
	CONSTRAINT "ListaDePrecios_pkey" PRIMARY KEY (id)
);


-- inventarios."Tercero" definition

-- Drop table

-- DROP TABLE inventarios."Tercero";

CREATE TABLE inventarios."Tercero" (
	id serial4 NOT NULL,
	nombre text NOT NULL,
	nit text NOT NULL,
	tipo inventarios."EnumTipoTercero" NOT NULL,
	CONSTRAINT "Tercero_pkey" PRIMARY KEY (id)
);
CREATE UNIQUE INDEX "Tercero_nombre_key" ON inventarios."Tercero" USING btree (nombre);


-- inventarios."Usuario" definition

-- Drop table

-- DROP TABLE inventarios."Usuario";

CREATE TABLE inventarios."Usuario" (
	id serial4 NOT NULL,
	nombre text NOT NULL,
	correo text NOT NULL,
	identificacion text NOT NULL,
	CONSTRAINT "Usuario_pkey" PRIMARY KEY (id)
);
CREATE UNIQUE INDEX "Usuario_correo_key" ON inventarios."Usuario" USING btree (correo);
CREATE UNIQUE INDEX "Usuario_identificacion_key" ON inventarios."Usuario" USING btree (identificacion);


-- inventarios."_prisma_migrations" definition

-- Drop table

-- DROP TABLE inventarios."_prisma_migrations";

CREATE TABLE inventarios."_prisma_migrations" (
	id varchar(36) NOT NULL,
	checksum varchar(64) NOT NULL,
	finished_at timestamptz NULL,
	migration_name varchar(255) NOT NULL,
	logs text NULL,
	rolled_back_at timestamptz NULL,
	started_at timestamptz DEFAULT now() NOT NULL,
	applied_steps_count int4 DEFAULT 0 NOT NULL,
	CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY (id)
);


-- inventarios."FacturaDeVenta" definition

-- Drop table

-- DROP TABLE inventarios."FacturaDeVenta";

CREATE TABLE inventarios."FacturaDeVenta" (
	id serial4 NOT NULL,
	codigo text NOT NULL,
	total text NOT NULL,
	fecha timestamp(3) NOT NULL,
	"terceroId" int4 NOT NULL,
	CONSTRAINT "FacturaDeVenta_pkey" PRIMARY KEY (id),
	CONSTRAINT "FacturaDeVenta_terceroId_fkey" FOREIGN KEY ("terceroId") REFERENCES inventarios."Tercero"(id) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE UNIQUE INDEX "FacturaDeVenta_codigo_key" ON inventarios."FacturaDeVenta" USING btree (codigo);


-- inventarios."OrdenDeCompra" definition

-- Drop table

-- DROP TABLE inventarios."OrdenDeCompra";

CREATE TABLE inventarios."OrdenDeCompra" (
	id serial4 NOT NULL,
	codigo text NOT NULL,
	total text NOT NULL,
	fecha timestamp(3) NOT NULL,
	"centroDeCostosId" int4 NOT NULL,
	"terceroId" int4 NOT NULL,
	CONSTRAINT "OrdenDeCompra_pkey" PRIMARY KEY (id),
	CONSTRAINT "OrdenDeCompra_centroDeCostosId_fkey" FOREIGN KEY ("centroDeCostosId") REFERENCES inventarios."CentroDeCostos"(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT "OrdenDeCompra_terceroId_fkey" FOREIGN KEY ("terceroId") REFERENCES inventarios."Tercero"(id) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE UNIQUE INDEX "OrdenDeCompra_codigo_key" ON inventarios."OrdenDeCompra" USING btree (codigo);


-- inventarios."Producto" definition

-- Drop table

-- DROP TABLE inventarios."Producto";

CREATE TABLE inventarios."Producto" (
	id serial4 NOT NULL,
	nombre text NOT NULL,
	descripcion text NOT NULL,
	"categoriaId" int4 NOT NULL,
	CONSTRAINT "Producto_pkey" PRIMARY KEY (id),
	CONSTRAINT "Producto_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES inventarios."Categoria"(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- inventarios."Movimiento" definition

-- Drop table

-- DROP TABLE inventarios."Movimiento";

CREATE TABLE inventarios."Movimiento" (
	id serial4 NOT NULL,
	cantidad int4 NOT NULL,
	fecha timestamp(3) NOT NULL,
	tipo inventarios."EnumTipoMovimiento" NOT NULL,
	"productoId" int4 NOT NULL,
	"ordenDeCompraId" int4 NULL,
	"facturaDeVentaId" int4 NULL,
	"responsableId" int4 NOT NULL,
	CONSTRAINT "Movimiento_pkey" PRIMARY KEY (id),
	CONSTRAINT "Movimiento_facturaDeVentaId_fkey" FOREIGN KEY ("facturaDeVentaId") REFERENCES inventarios."FacturaDeVenta"(id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT "Movimiento_ordenDeCompraId_fkey" FOREIGN KEY ("ordenDeCompraId") REFERENCES inventarios."OrdenDeCompra"(id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT "Movimiento_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES inventarios."Producto"(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT "Movimiento_responsableId_fkey" FOREIGN KEY ("responsableId") REFERENCES inventarios."Usuario"(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- inventarios."PrecioProducto" definition

-- Drop table

-- DROP TABLE inventarios."PrecioProducto";

CREATE TABLE inventarios."PrecioProducto" (
	id serial4 NOT NULL,
	precio float8 NOT NULL,
	"productoId" int4 NOT NULL,
	"listaId" int4 NOT NULL,
	CONSTRAINT "PrecioProducto_pkey" PRIMARY KEY (id),
	CONSTRAINT "PrecioProducto_listaId_fkey" FOREIGN KEY ("listaId") REFERENCES inventarios."ListaDePrecios"(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT "PrecioProducto_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES inventarios."Producto"(id) ON DELETE RESTRICT ON UPDATE CASCADE
);