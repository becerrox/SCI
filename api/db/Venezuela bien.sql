-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.2-alpha
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: "Venezuela" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "Venezuela";
-- CREATE DATABASE "Venezuela"
-- 	ENCODING = 'UTF8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: public.ciudades | type: TABLE --
-- DROP TABLE IF EXISTS public.ciudades CASCADE;
CREATE TABLE public.ciudades(
	id serial NOT NULL,
	ciudad varchar(200),
	capital smallint NOT NULL DEFAULT 0,
	id_estados integer,
	CONSTRAINT pk_ciudad PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.ciudades OWNER TO postgres;
-- ddl-end --

-- object: public.estados | type: TABLE --
-- DROP TABLE IF EXISTS public.estados CASCADE;
CREATE TABLE public.estados(
	id serial NOT NULL,
	estado varchar(250),
	"iso_3166-2" varchar(4),
	CONSTRAINT pk_estado PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.estados OWNER TO postgres;
-- ddl-end --

-- object: public.municipios | type: TABLE --
-- DROP TABLE IF EXISTS public.municipios CASCADE;
CREATE TABLE public.municipios(
	id serial NOT NULL,
	municipio varchar(100),
	id_estados integer,
	CONSTRAINT pk_municipios PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.municipios OWNER TO postgres;
-- ddl-end --

-- object: public.parroquias | type: TABLE --
-- DROP TABLE IF EXISTS public.parroquias CASCADE;
CREATE TABLE public.parroquias(
	id serial NOT NULL,
	parroquia varchar(250),
	id_municipios integer,
	CONSTRAINT pk_parroquias PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.parroquias OWNER TO postgres;
-- ddl-end --

-- object: estados_fk | type: CONSTRAINT --
-- ALTER TABLE public.ciudades DROP CONSTRAINT IF EXISTS estados_fk CASCADE;
ALTER TABLE public.ciudades ADD CONSTRAINT estados_fk FOREIGN KEY (id_estados)
REFERENCES public.estados (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: municipios_fk | type: CONSTRAINT --
-- ALTER TABLE public.parroquias DROP CONSTRAINT IF EXISTS municipios_fk CASCADE;
ALTER TABLE public.parroquias ADD CONSTRAINT municipios_fk FOREIGN KEY (id_municipios)
REFERENCES public.municipios (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: estados_fk | type: CONSTRAINT --
-- ALTER TABLE public.municipios DROP CONSTRAINT IF EXISTS estados_fk CASCADE;
ALTER TABLE public.municipios ADD CONSTRAINT estados_fk FOREIGN KEY (id_estados)
REFERENCES public.estados (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


