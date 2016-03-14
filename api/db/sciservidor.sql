-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2-alpha
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --

-- object: telecom | type: ROLE --
-- DROP ROLE IF EXISTS telecom;
CREATE ROLE telecom WITH 
	SUPERUSER
	ENCRYPTED PASSWORD 'transbarca.telecom';
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: sci | type: DATABASE --
-- -- Sistema de control de inventario --
-- -- DROP DATABASE IF EXISTS sci;
-- CREATE DATABASE sci
-- 	ENCODING = 'UTF8'
-- 	TABLESPACE = pg_default
-- 	OWNER = telecom
-- ;
-- -- ddl-end --
-- 

-- object: public.auditequipos | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.auditequipos() CASCADE;
CREATE FUNCTION public.auditequipos ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$


    BEGIN

        INSERT INTO auditoria_equipos VALUES (old.item, old.descripcion, old.marca, old.modelo, old.serial, old.color, old.estado, old.cod_bien, old.cantidad, old.status);

        RETURN NULL;

    END;


$$;
-- ddl-end --
ALTER FUNCTION public.auditequipos() OWNER TO postgres;
-- ddl-end --

-- object: public.auditoriabienesgenerales | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.auditoriabienesgenerales() CASCADE;
CREATE FUNCTION public.auditoriabienesgenerales ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$
    BEGIN

        INSERT INTO auditoria_bienesgeneral VALUES (old.id,old.item,old.cod_general,old.cod_subcat,old,cod_catespf,old.descripcion,old.estatus_uso_bien,old.marca,old.modelo,old.serial,old.tipo_comp,old.colores,old.num_bien,old.estado_bien,old.status,old.fecha_modif);

        RETURN NULL;

    END;


$$;
-- ddl-end --
ALTER FUNCTION public.auditoriabienesgenerales() OWNER TO postgres;
-- ddl-end --

-- object: public.auditoriaresponsables | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.auditoriaresponsables() CASCADE;
CREATE FUNCTION public.auditoriaresponsables ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$
 BEGIN

        INSERT INTO auditoria_responsables VALUES (old.nombres, old.apellidos, old.departamento, old.gerencia, old.fecha_modif, old.status);

        RETURN NULL;

    END;
$$;
-- ddl-end --
ALTER FUNCTION public.auditoriaresponsables() OWNER TO postgres;
-- ddl-end --

CREATE FUNCTION public.auditusuario ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$
    BEGIN

        INSERT INTO auditoria_usuario VALUES (old.usuario, old.pass, old.nivel, old.status);

        RETURN NULL;

    END;


$$;
-- ddl-end --
ALTER FUNCTION public.auditusuario() OWNER TO postgres;
-- ddl-end --

-- object: public."aignación_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."aignación_id_seq" CASCADE;
CREATE SEQUENCE public."aignación_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."aignación_id_seq" OWNER TO postgres;
-- ddl-end --

-- object: public."aignación" | type: TABLE --
-- DROP TABLE IF EXISTS public."aignación" CASCADE;
CREATE TABLE public."aignación"(
	id integer NOT NULL DEFAULT nextval('public."aignación_id_seq"'::regclass),
	fecha_asignacion timestamp,
	"tipo_asignación" smallint,
	id_personal integer,
	CONSTRAINT pk_asignacion PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public."aignación" IS 'Detalles de asignaciones';
-- ddl-end --
ALTER TABLE public."aignación" OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_bienesgeneral | type: TABLE --
-- DROP TABLE IF EXISTS public.auditoria_bienesgeneral CASCADE;
CREATE TABLE public.auditoria_bienesgeneral(
	item integer,
	cod_general character varying(10),
	cod_subcat character varying(10),
	cod_catespf character varying(10),
	descripcion character varying(150),
	estatus_uso_bien integer,
	marca character varying(50),
	modelo character varying(50),
	serial character varying(50),
	tipo_comp character varying(30),
	colores integer,
	num_bien integer,
	estado_bien integer,
	status integer,
	fecha_modif timestamp DEFAULT now()
);
-- ddl-end --
COMMENT ON TABLE public.auditoria_bienesgeneral IS 'Auditoria en cambios hechos en la tabla de bienes';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.item IS 'Nro. Inventario';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.cod_general IS 'Codigo categoria general';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.cod_subcat IS 'Codigo sub-categoria';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.cod_catespf IS 'Codigo categoria especifica';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.estatus_uso_bien IS 'Estatus del uso del bien';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.tipo_comp IS 'Tipo componente';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.num_bien IS 'numero de bien';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_bienesgeneral.estado_bien IS 'Estado del bien';
-- ddl-end --
ALTER TABLE public.auditoria_bienesgeneral OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_equipos | type: TABLE --
-- DROP TABLE IF EXISTS public.auditoria_equipos CASCADE;
CREATE TABLE public.auditoria_equipos(
	item integer NOT NULL,
	descripcion character varying(100),
	marca character varying(15),
	modelo character varying(15),
	serial character varying(30),
	color character varying(10),
	estado character varying(100) NOT NULL,
	cod_bien character varying(15),
	cantidad integer,
	status integer NOT NULL,
	fecha_modif timestamp DEFAULT now()
);
-- ddl-end --
COMMENT ON TABLE public.auditoria_equipos IS 'Cambios o eliminaciones realizados en la tabla equipos';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_equipos.status IS '0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.auditoria_equipos OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_equipos_id_equipo_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.auditoria_equipos_id_equipo_seq CASCADE;
CREATE SEQUENCE public.auditoria_equipos_id_equipo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.auditoria_equipos_id_equipo_seq OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_responsables | type: TABLE --
-- DROP TABLE IF EXISTS public.auditoria_responsables CASCADE;
CREATE TABLE public.auditoria_responsables(
	nombres character varying(40),
	apellidos character varying(40),
	departamento character varying(30),
	gerencia character varying(30),
	fecha_modif timestamp DEFAULT now(),
	status integer
);
-- ddl-end --
COMMENT ON TABLE public.auditoria_responsables IS 'Cambios generados en la tabla responsables';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_responsables.status IS ' 0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.auditoria_responsables OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.auditoria_usuario CASCADE;
CREATE TABLE public.auditoria_usuario(
	usuario character varying(20) NOT NULL,
	pass character varying(500) NOT NULL,
	nivel integer NOT NULL,
	status integer NOT NULL,
	fecha_modif timestamp DEFAULT now()
);
-- ddl-end --
COMMENT ON TABLE public.auditoria_usuario IS 'Cambios o eliminaciones realizados en la tabla usuario';
-- ddl-end --
COMMENT ON COLUMN public.auditoria_usuario.status IS '0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.auditoria_usuario OWNER TO postgres;
-- ddl-end --

-- object: public.auditoria_usuario_id_usuario_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.auditoria_usuario_id_usuario_seq CASCADE;
CREATE SEQUENCE public.auditoria_usuario_id_usuario_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.auditoria_usuario_id_usuario_seq OWNER TO postgres;
-- ddl-end --

-- object: public.bienesgeneral_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.bienesgeneral_id_seq CASCADE;
CREATE SEQUENCE public.bienesgeneral_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.bienesgeneral_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.bienesgeneral | type: TABLE --
-- DROP TABLE IF EXISTS public.bienesgeneral CASCADE;
CREATE TABLE public.bienesgeneral(
	id integer NOT NULL DEFAULT nextval('public.bienesgeneral_id_seq'::regclass),
	item integer,
	cod_general character varying(10),
	cod_subcat character varying(10),
	cod_catespf character varying(10),
	descripcion character varying(150),
	estatus_uso_bien integer,
	marca character varying(50),
	modelo character varying(50),
	serial character varying(50),
	tipo_comp character varying(30),
	colores integer,
	num_bien integer,
	estado_bien integer,
	status integer NOT NULL,
	fecha_modif timestamp DEFAULT now(),
	cat_unid_admin character varying(10),
	fecha_elab date,
	per_ini date,
	per_culm date,
	CONSTRAINT pk_bienes PRIMARY KEY (id),
	CONSTRAINT un_bien_serial UNIQUE (serial)

);
-- ddl-end --
COMMENT ON TABLE public.bienesgeneral IS 'Datos almacenados de los bienes';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.item IS 'Nro. Inventario';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.cod_general IS 'Codigo categoria general';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.cod_subcat IS 'Codigo sub-categoria';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.cod_catespf IS 'Codigo categoria especifica';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.estatus_uso_bien IS 'Estatus del uso del bien';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.tipo_comp IS 'Tipo componente';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.num_bien IS 'numero de bien';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.estado_bien IS 'Estado del bien';
-- ddl-end --
ALTER TABLE public.bienesgeneral OWNER TO postgres;
-- ddl-end --

-- object: public.categoria_general_bienes_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.categoria_general_bienes_id_seq CASCADE;
CREATE SEQUENCE public.categoria_general_bienes_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.categoria_general_bienes_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.categoria_general_bienes | type: TABLE --
-- DROP TABLE IF EXISTS public.categoria_general_bienes CASCADE;
CREATE TABLE public.categoria_general_bienes(
	id integer NOT NULL DEFAULT nextval('public.categoria_general_bienes_id_seq'::regclass),
	codigo character varying(12) NOT NULL,
	descripcion character varying(100) NOT NULL,
	tipo integer NOT NULL,
	CONSTRAINT "pk categoria_general_bienes" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.categoria_general_bienes IS 'Codigo general de los bienes';
-- ddl-end --
ALTER TABLE public.categoria_general_bienes OWNER TO postgres;
-- ddl-end --

-- object: public.configuracion_bien_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.configuracion_bien_id_seq CASCADE;
CREATE SEQUENCE public.configuracion_bien_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.configuracion_bien_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.configuracion_bien | type: TABLE --
-- DROP TABLE IF EXISTS public.configuracion_bien CASCADE;
CREATE TABLE public.configuracion_bien(
	id integer NOT NULL DEFAULT nextval('public.configuracion_bien_id_seq'::regclass),
	codigo integer NOT NULL,
	descripcion character varying(100),
	tipo character varying(50),
	CONSTRAINT "pk configuracion_bien" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.configuracion_bien IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, categoria de unidades administrativas';
-- ddl-end --
COMMENT ON COLUMN public.configuracion_bien.tipo IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, marca';
-- ddl-end --
ALTER TABLE public.configuracion_bien OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_entrada_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.detalle_entrada_id_seq CASCADE;
CREATE SEQUENCE public.detalle_entrada_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.detalle_entrada_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_entrada | type: TABLE --
-- DROP TABLE IF EXISTS public.detalle_entrada CASCADE;
CREATE TABLE public.detalle_entrada(
	id integer NOT NULL DEFAULT nextval('public.detalle_entrada_id_seq'::regclass),
	id_equipos integer NOT NULL,
	cantidad integer NOT NULL,
	fecha_entrada timestamp NOT NULL,
	tipo_entrada character varying(40),
	id_entrada integer,
	CONSTRAINT pk_detalle_entrada PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.detalle_entrada OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_entrada_id_detalle_entrada_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.detalle_entrada_id_detalle_entrada_seq CASCADE;
CREATE SEQUENCE public.detalle_entrada_id_detalle_entrada_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.detalle_entrada_id_detalle_entrada_seq OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_salida_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.detalle_salida_id_seq CASCADE;
CREATE SEQUENCE public.detalle_salida_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.detalle_salida_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_salida | type: TABLE --
-- DROP TABLE IF EXISTS public.detalle_salida CASCADE;
CREATE TABLE public.detalle_salida(
	id integer NOT NULL DEFAULT nextval('public.detalle_salida_id_seq'::regclass),
	id_salida_salida integer NOT NULL,
	id_equipos integer NOT NULL,
	cantidad integer NOT NULL,
	fecha_salida timestamp NOT NULL,
	tipo_salida character varying(40),
	CONSTRAINT pk_detalle_salida PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.detalle_salida OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_salida_id_detallle_salida_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.detalle_salida_id_detallle_salida_seq CASCADE;
CREATE SEQUENCE public.detalle_salida_id_detallle_salida_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.detalle_salida_id_detallle_salida_seq OWNER TO postgres;
-- ddl-end --

-- object: public.entrada_id_entrada_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.entrada_id_entrada_seq CASCADE;
CREATE SEQUENCE public.entrada_id_entrada_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.entrada_id_entrada_seq OWNER TO postgres;
-- ddl-end --

-- object: public.entrada | type: TABLE --
-- DROP TABLE IF EXISTS public.entrada CASCADE;
CREATE TABLE public.entrada(
	id integer NOT NULL DEFAULT nextval('public.entrada_id_entrada_seq'::regclass),
	fecha_creacion timestamp NOT NULL,
	fecha_modif timestamp DEFAULT now(),
	cantidad integer NOT NULL,
	fecha_entrada timestamp NOT NULL,
	tipo_entrada character varying(40),
	usuario_entrada character varying(40),
	observacion character varying(200),
	id_usuario integer,
	CONSTRAINT pk_entrada PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.entrada IS 'Equipos que ingresan';
-- ddl-end --
ALTER TABLE public.entrada OWNER TO postgres;
-- ddl-end --

-- object: public.equipo_id_equipo_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.equipo_id_equipo_seq CASCADE;
CREATE SEQUENCE public.equipo_id_equipo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.equipo_id_equipo_seq OWNER TO postgres;
-- ddl-end --

-- object: public.equipo | type: TABLE --
-- DROP TABLE IF EXISTS public.equipo CASCADE;
CREATE TABLE public.equipo(
	id integer NOT NULL DEFAULT nextval('public.equipo_id_equipo_seq'::regclass),
	item integer NOT NULL,
	descripcion character varying(100),
	marca character varying(30),
	modelo character varying(30),
	serial character varying(30),
	color character varying(10),
	estado character varying(100) NOT NULL,
	cod_bien character varying(20),
	cantidad integer,
	id_ubicacion integer,
	status integer NOT NULL,
	CONSTRAINT pk_equipo PRIMARY KEY (id),
	CONSTRAINT un_equipo UNIQUE (serial)

);
-- ddl-end --
COMMENT ON TABLE public.equipo IS 'Tabla de los equipos';
-- ddl-end --
COMMENT ON COLUMN public.equipo.status IS '0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.equipo OWNER TO postgres;
-- ddl-end --

-- object: public.responsables_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.responsables_id_seq CASCADE;
CREATE SEQUENCE public.responsables_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.responsables_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.responsables | type: TABLE --
-- DROP TABLE IF EXISTS public.responsables CASCADE;
CREATE TABLE public.responsables(
	id integer NOT NULL DEFAULT nextval('public.responsables_id_seq'::regclass),
	nombres character varying(40),
	apellidos character varying(40),
	departamento character varying(30),
	gerencia character varying(30),
	fecha_creacion timestamp,
	fecha_modif timestamp DEFAULT now(),
	status integer,
	CONSTRAINT pk_serial PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.responsables IS 'Responsables de inventarios';
-- ddl-end --
COMMENT ON COLUMN public.responsables.status IS ' 0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.responsables OWNER TO postgres;
-- ddl-end --

-- object: public.salida_id_salida_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.salida_id_salida_seq CASCADE;
CREATE SEQUENCE public.salida_id_salida_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.salida_id_salida_seq OWNER TO postgres;
-- ddl-end --

-- object: public.salida | type: TABLE --
-- DROP TABLE IF EXISTS public.salida CASCADE;
CREATE TABLE public.salida(
	id integer NOT NULL DEFAULT nextval('public.salida_id_salida_seq'::regclass),
	fecha_creacion timestamp NOT NULL,
	fecha_modif timestamp DEFAULT now(),
	cantidad integer NOT NULL,
	fecha_salida timestamp NOT NULL,
	tipo_salida character varying(40),
	usuario_salida character varying(40),
	observacion character varying(200),
	id_usuario integer,
	CONSTRAINT pk_salida PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.salida IS 'equipos de salen';
-- ddl-end --
ALTER TABLE public.salida OWNER TO postgres;
-- ddl-end --

-- object: public.solvencia_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.solvencia_id_seq CASCADE;
CREATE SEQUENCE public.solvencia_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.solvencia_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.solvencia | type: TABLE --
-- DROP TABLE IF EXISTS public.solvencia CASCADE;
CREATE TABLE public.solvencia(
	id integer NOT NULL DEFAULT nextval('public.solvencia_id_seq'::regclass),
	fecha_solvencia smallint,
	id_personal integer,
	CONSTRAINT pk_solvencia PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.solvencia IS 'Detalles de solvencia';
-- ddl-end --
ALTER TABLE public.solvencia OWNER TO postgres;
-- ddl-end --

-- object: public.sub_categorias_bienes_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.sub_categorias_bienes_id_seq CASCADE;
CREATE SEQUENCE public.sub_categorias_bienes_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.sub_categorias_bienes_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.sub_categorias_bienes | type: TABLE --
-- DROP TABLE IF EXISTS public.sub_categorias_bienes CASCADE;
CREATE TABLE public.sub_categorias_bienes(
	id integer NOT NULL DEFAULT nextval('public.sub_categorias_bienes_id_seq'::regclass),
	codigo character varying(12) NOT NULL,
	descripcion character varying(100) NOT NULL,
	tipo integer NOT NULL,
	id_categoria_general_bienes integer,
	CONSTRAINT "pk  sub_categorias_bienes" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.sub_categorias_bienes IS 'Codigos de las subcategoria de bienes';
-- ddl-end --
ALTER TABLE public.sub_categorias_bienes OWNER TO postgres;
-- ddl-end --

-- object: public."ubicacion_id_Ubicacion_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."ubicacion_id_Ubicacion_seq" CASCADE;
CREATE SEQUENCE public."ubicacion_id_Ubicacion_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."ubicacion_id_Ubicacion_seq" OWNER TO postgres;
-- ddl-end --

-- object: public.ubicacion | type: TABLE --
-- DROP TABLE IF EXISTS public.ubicacion CASCADE;
CREATE TABLE public.ubicacion(
	id integer NOT NULL DEFAULT nextval('public."ubicacion_id_Ubicacion_seq"'::regclass),
	nombre character varying(20),
	id_personal integer,
	CONSTRAINT "UN_ubicacion" UNIQUE (nombre),
	CONSTRAINT pk_ubicacion PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.ubicacion IS 'Detalles de la ubicacion de los equipos y el personal';
-- ddl-end --
ALTER TABLE public.ubicacion OWNER TO postgres;
-- ddl-end --

-- object: public.usuario_id_usuario_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.usuario_id_usuario_seq CASCADE;
CREATE SEQUENCE public.usuario_id_usuario_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario(
	id integer NOT NULL DEFAULT nextval('public.usuario_id_usuario_seq'::regclass),
	usuario character varying(20) NOT NULL,
	pass character varying(500) NOT NULL,
	nivel integer NOT NULL,
	ci_per character varying(10) NOT NULL,
	nombres character varying(40),
	apellidos character varying(40),
	cargo character varying(30) NOT NULL,
	gerencia character varying(30),
	departamento character varying(30),
	telf_pers numeric(12,0) NOT NULL,
	telf_casa numeric(12,0),
	correo character varying(50) NOT NULL,
	f_nac date,
	fecha_creacion timestamp NOT NULL,
	fecha_modif timestamp DEFAULT now(),
	usuario_creacion character varying(20) NOT NULL,
	usuario_modif character varying(20),
	status integer,
	CONSTRAINT "UN_usuario" UNIQUE (usuario),
	CONSTRAINT pk_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.usuario IS 'Tabla de los usuarios';
-- ddl-end --
COMMENT ON COLUMN public.usuario.status IS '0=cerrada;1=abierta';
-- ddl-end --
ALTER TABLE public.usuario OWNER TO postgres;
-- ddl-end --

-- object: actualizarbienes | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarbienes ON public.bienesgeneral CASCADE;
CREATE TRIGGER actualizarbienes
	AFTER UPDATE
	ON public.bienesgeneral
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditoriabienesgenerales();
-- ddl-end --

-- object: actualizarequipo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarequipo ON public.equipo CASCADE;
CREATE TRIGGER actualizarequipo
	AFTER UPDATE
	ON public.equipo
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditequipos();
-- ddl-end --

-- object: actualizarpersonal | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarpersonal ON public.personal CASCADE;

-- ddl-end --

-- object: actualizarresponsables | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarresponsables ON public.responsables CASCADE;
CREATE TRIGGER actualizarresponsables
	AFTER UPDATE
	ON public.responsables
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditoriaresponsables();
-- ddl-end --

-- object: actualizarusuario | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarusuario ON public.usuario CASCADE;
CREATE TRIGGER actualizarusuario
	AFTER UPDATE
	ON public.usuario
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditusuario();
-- ddl-end --

-- object: auditbienesgeneral | type: TRIGGER --
-- DROP TRIGGER IF EXISTS auditbienesgeneral ON public.bienesgeneral CASCADE;
CREATE TRIGGER auditbienesgeneral
	AFTER DELETE 
	ON public.bienesgeneral
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditoriabienesgenerales();
-- ddl-end --

-- object: auditequipos | type: TRIGGER --
-- DROP TRIGGER IF EXISTS auditequipos ON public.equipo CASCADE;
CREATE TRIGGER auditequipos
	AFTER DELETE 
	ON public.equipo
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditequipos();
-- ddl-end --

-- object: auditoriaresponsables | type: TRIGGER --
-- DROP TRIGGER IF EXISTS auditoriaresponsables ON public.responsables CASCADE;
CREATE TRIGGER auditoriaresponsables
	AFTER DELETE 
	ON public.responsables
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditoriaresponsables();
-- ddl-end --

-- object: auditpersonal | type: TRIGGER --
-- DROP TRIGGER IF EXISTS auditpersonal ON public.personal CASCADE;
-- ddl-end --

-- object: auditusuario | type: TRIGGER --
-- DROP TRIGGER IF EXISTS auditusuario ON public.usuario CASCADE;
CREATE TRIGGER auditusuario
	AFTER DELETE 
	ON public.usuario
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditusuario();
-- ddl-end --

-- object: personal_fk | type: CONSTRAINT --
-- ALTER TABLE public."aignación" DROP CONSTRAINT IF EXISTS personal_fk CASCADE;

-- ddl-end --

-- object: entrada_fk | type: CONSTRAINT --
-- ALTER TABLE public.detalle_entrada DROP CONSTRAINT IF EXISTS entrada_fk CASCADE;
ALTER TABLE public.detalle_entrada ADD CONSTRAINT entrada_fk FOREIGN KEY (id_entrada)
REFERENCES public.entrada (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: salida_fk | type: CONSTRAINT --
-- ALTER TABLE public.detalle_salida DROP CONSTRAINT IF EXISTS salida_fk CASCADE;
ALTER TABLE public.detalle_salida ADD CONSTRAINT salida_fk FOREIGN KEY (id_salida_salida)
REFERENCES public.salida (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.entrada DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.entrada ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.personal DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;

-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.salida DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.salida ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: personal_fk | type: CONSTRAINT --

-- ddl-end --

-- object: categoria_general_bienes_fk | type: CONSTRAINT --
-- ALTER TABLE public.sub_categorias_bienes DROP CONSTRAINT IF EXISTS categoria_general_bienes_fk CASCADE;
ALTER TABLE public.sub_categorias_bienes ADD CONSTRAINT categoria_general_bienes_fk FOREIGN KEY (id_categoria_general_bienes)
REFERENCES public.categoria_general_bienes (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: grant_31fa0183f5 | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE sci
   TO PUBLIC;
-- ddl-end --

-- object: grant_10005cd40a | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE sci
   TO telecom;
-- ddl-end --


