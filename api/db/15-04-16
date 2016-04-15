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
	ENCRYPTED PASSWORD '********';
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: sci2 | type: DATABASE --
-- -- DROP DATABASE IF EXISTS sci2;
-- CREATE DATABASE sci2
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'es_ES.UTF8'
-- 	LC_CTYPE = 'es_ES.UTF8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: public.auditusuario | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.auditusuario() CASCADE;
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

-- object: public."Colores" | type: VIEW --
-- DROP VIEW IF EXISTS public."Colores" CASCADE;
CREATE VIEW public."Colores"
AS 

SELECT configuracion_bien.descripcion
   FROM configuracion_bien
  WHERE ((configuracion_bien.tipo)::text = 'Color'::text);
-- ddl-end --
COMMENT ON VIEW public."Colores" IS 'Colores';
-- ddl-end --
ALTER VIEW public."Colores" OWNER TO postgres;
-- ddl-end --

-- object: public.aignacion_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.aignacion_id_seq CASCADE;
CREATE SEQUENCE public.aignacion_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.aignacion_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.aignacion | type: TABLE --
-- DROP TABLE IF EXISTS public.aignacion CASCADE;
CREATE TABLE public.aignacion(
	id integer NOT NULL DEFAULT nextval('public.aignacion_id_seq'::regclass),
	fecha_asignacion timestamp,
	tipo_asignacion smallint,
	id_personal integer,
	CONSTRAINT pk_asignacion PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.aignacion IS 'Detalles de asignaciones';
-- ddl-end --
ALTER TABLE public.aignacion OWNER TO postgres;
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

-- object: public.auditoria_personal_id_personal_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.auditoria_personal_id_personal_seq CASCADE;
CREATE SEQUENCE public.auditoria_personal_id_personal_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.auditoria_personal_id_personal_seq OWNER TO postgres;
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

-- object: public.auditoria_usuario_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.auditoria_usuario_id_seq CASCADE;
CREATE SEQUENCE public.auditoria_usuario_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.auditoria_usuario_id_seq OWNER TO postgres;
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
	status integer NOT NULL DEFAULT 1,
	fecha_modif timestamp DEFAULT now(),
	cat_unid_admin character varying(10),
	fecha_elab date,
	per_ini date,
	per_culm date,
	unidad_trabajo character varying(30),
	responsable_pa character varying(50),
	responsable_ad character varying(50),
	responsable_uso character varying(50),
	CONSTRAINT pk_bienes PRIMARY KEY (id),
	CONSTRAINT un_bien_serial UNIQUE (serial)

);
-- ddl-end --
COMMENT ON TABLE public.bienesgeneral IS 'Datos almacenados de los bienes';
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
COMMENT ON COLUMN public.bienesgeneral.cat_unid_admin IS 'Categoría de unidad administrativa';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.per_ini IS 'Periodo de inicio';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.per_culm IS 'Periodo de culminación';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.unidad_trabajo IS 'Unidad de Trabajo';
-- ddl-end --
COMMENT ON COLUMN public.bienesgeneral.responsable_ad IS 'Responsable Administrativo';
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

-- object: public.catesp | type: TABLE --
-- DROP TABLE IF EXISTS public.catesp CASCADE;
CREATE TABLE public.catesp(
	id serial NOT NULL,
	codigo character varying(12) NOT NULL,
	descripcion character varying(100) NOT NULL,
	status integer NOT NULL,
	subcat character varying(12),
	CONSTRAINT pk_catesp PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.catesp IS 'Codigos de categoria especifica';
-- ddl-end --
ALTER TABLE public.catesp OWNER TO postgres;
-- ddl-end --

-- object: public.catgen | type: TABLE --
-- DROP TABLE IF EXISTS public.catgen CASCADE;
CREATE TABLE public.catgen(
	id serial NOT NULL,
	codigo character varying(12) NOT NULL,
	descripcion character varying(100) NOT NULL,
	status integer NOT NULL DEFAULT 1,
	CONSTRAINT pk_catgen PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.catgen IS 'Codigo general de los bienes';
-- ddl-end --
ALTER TABLE public.catgen OWNER TO postgres;
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
	fecha_creacion timestamp NOT NULL DEFAULT now(),
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

-- object: public.equipo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.equipo_id_seq CASCADE;
CREATE SEQUENCE public.equipo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.equipo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.equipo | type: TABLE --
-- DROP TABLE IF EXISTS public.equipo CASCADE;
CREATE TABLE public.equipo(
	id integer NOT NULL DEFAULT nextval('public.equipo_id_seq'::regclass),
	descripcion character varying(100),
	marca character varying(30),
	modelo character varying(30),
	serial character varying(30) NOT NULL,
	color character varying(10),
	estado character varying(100) NOT NULL,
	unidad_admin character varying(50),
	status integer NOT NULL DEFAULT 1,
	responsable character varying(50),
	caracteristicas character varying(150),
	fecha_modif timestamp,
	unidad_trabajo character varying(50),
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

-- object: public.personal_id_personal_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.personal_id_personal_seq CASCADE;
CREATE SEQUENCE public.personal_id_personal_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.personal_id_personal_seq OWNER TO postgres;
-- ddl-end --

-- object: public.personal | type: TABLE --
-- DROP TABLE IF EXISTS public.personal CASCADE;
CREATE TABLE public.personal(
	id integer NOT NULL DEFAULT nextval('public.personal_id_personal_seq'::regclass),
	ci_per character varying(12) NOT NULL,
	nombres character varying(40),
	apellidos character varying(40),
	cargo character varying(30) NOT NULL,
	telf_pers numeric(12,0) NOT NULL,
	telf_casa numeric(12,0),
	correo character varying(50) NOT NULL,
	f_nac date,
	fecha_creacion timestamp NOT NULL DEFAULT now(),
	fecha_modif timestamp DEFAULT now(),
	usuario_creacion character varying(20) NOT NULL,
	usuario_modif character varying(20),
	status integer,
	unidad_trabajo character varying(50),
	id_usuario integer,
	CONSTRAINT "PK_personal" PRIMARY KEY (id),
	CONSTRAINT "UN_personal" UNIQUE (ci_per),
	CONSTRAINT personal_uq UNIQUE (id_usuario)

);
-- ddl-end --
COMMENT ON TABLE public.personal IS 'Tabla del personal';
-- ddl-end --
COMMENT ON COLUMN public.personal.status IS '0=cerrada;1=abierta';
-- ddl-end --
COMMENT ON COLUMN public.personal.unidad_trabajo IS 'Unidad de Trabajo';
-- ddl-end --
ALTER TABLE public.personal OWNER TO postgres;
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
	uni_admin character varying(30),
	fecha_creacion timestamp,
	fecha_modif timestamp DEFAULT now(),
	status integer,
	ci_responsable character varying(12),
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
	fecha_creacion timestamp NOT NULL DEFAULT now(),
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

-- object: public.subcat | type: TABLE --
-- DROP TABLE IF EXISTS public.subcat CASCADE;
CREATE TABLE public.subcat(
	id serial NOT NULL,
	codigo character varying(12) NOT NULL,
	descripcion character varying(100) NOT NULL,
	status integer NOT NULL,
	catgen character varying(12),
	CONSTRAINT pk_subcat PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.subcat IS 'Codigos de las subcategoria de bienes';
-- ddl-end --
ALTER TABLE public.subcat OWNER TO postgres;
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

-- object: public.unidad_admin | type: TABLE --
-- DROP TABLE IF EXISTS public.unidad_admin CASCADE;
CREATE TABLE public.unidad_admin(
	id integer NOT NULL DEFAULT nextval('public."ubicacion_id_Ubicacion_seq"'::regclass),
	nombre character varying(20),
	CONSTRAINT "UN_ubicacion" UNIQUE (nombre),
	CONSTRAINT pk_ubicacion PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.unidad_admin IS 'Detalles de la Unidad Administrativa donde están ubicados los equipos y el personal';
-- ddl-end --
ALTER TABLE public.unidad_admin OWNER TO postgres;
-- ddl-end --

-- object: public.unidad_trabajo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.unidad_trabajo_id_seq CASCADE;
CREATE SEQUENCE public.unidad_trabajo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.unidad_trabajo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.unidad_trabajo_nombre_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.unidad_trabajo_nombre_seq CASCADE;
CREATE SEQUENCE public.unidad_trabajo_nombre_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.unidad_trabajo_nombre_seq OWNER TO postgres;
-- ddl-end --

-- object: public.unidad_trabajo | type: TABLE --
-- DROP TABLE IF EXISTS public.unidad_trabajo CASCADE;
CREATE TABLE public.unidad_trabajo(
	id integer NOT NULL DEFAULT nextval('public.unidad_trabajo_id_seq'::regclass),
	nombre character varying(40) NOT NULL,
	CONSTRAINT unidad_trabajo_nombre_key UNIQUE (nombre),
	CONSTRAINT unidad_trabajo_pkey PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.unidad_trabajo IS 'Unidad de Trabajo';
-- ddl-end --
ALTER TABLE public.unidad_trabajo OWNER TO postgres;
-- ddl-end --

-- object: public.usuario_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.usuario_id_seq CASCADE;
CREATE SEQUENCE public.usuario_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario(
	id integer NOT NULL DEFAULT nextval('public.usuario_id_seq'::regclass),
	usuario character varying(20) NOT NULL,
	pass character varying(500) NOT NULL,
	nivel integer NOT NULL,
	fecha_creacion timestamp DEFAULT now(),
	status integer NOT NULL DEFAULT 1,
	primer_inicio integer,
	CONSTRAINT "UN_usuario" UNIQUE (usuario),
	CONSTRAINT pk_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.usuario IS 'Tabla de los usuarios';
-- ddl-end --
COMMENT ON COLUMN public.usuario.status IS '0=cerrada;1=abierta';
-- ddl-end --
COMMENT ON COLUMN public.usuario.primer_inicio IS 'Inicio por primera vez. 0 = nunca, 1 =iniciado';
-- ddl-end --
ALTER TABLE public.usuario OWNER TO postgres;
-- ddl-end --

-- object: actualizarusuario | type: TRIGGER --
-- DROP TRIGGER IF EXISTS actualizarusuario ON public.usuario CASCADE;
CREATE TRIGGER actualizarusuario
	AFTER UPDATE
	ON public.usuario
	FOR EACH ROW
	EXECUTE PROCEDURE public.auditusuario();
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
-- ALTER TABLE public.aignacion DROP CONSTRAINT IF EXISTS personal_fk CASCADE;
ALTER TABLE public.aignacion ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal)
REFERENCES public.personal (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
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
ALTER TABLE public.personal ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.salida DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.salida ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: personal_fk | type: CONSTRAINT --
-- ALTER TABLE public.solvencia DROP CONSTRAINT IF EXISTS personal_fk CASCADE;
ALTER TABLE public.solvencia ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal)
REFERENCES public.personal (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


