--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

--
-- Name: auditequipos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditequipos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_equipos VALUES (old.item, old.descripcion, old.marca, old.modelo, old.serial, old.color, old.estado, old.cod_bien, old.id_equipo, old.cantidad, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditequipos() OWNER TO postgres;

--
-- Name: auditpersonal(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditpersonal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_personal VALUES (old.CI_per, old.nombres, old.apellidos, old.cargo, old.telf_pers, old.telf_casa, old.correo, old.f_nac, old.id_personal, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditpersonal() OWNER TO postgres;

--
-- Name: auditusuario(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditusuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_usuario VALUES (old.usuario, old.pass, old.nivel, old.id_usuario, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditusuario() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auditoria_equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE auditoria_equipos (
    item integer NOT NULL,
    descripcion character varying(100),
    marca character varying(15),
    modelo character varying(15),
    serial character varying(30),
    color character varying(10),
    estado character varying(100) NOT NULL,
    cod_bien character varying(15),
    id_equipo integer NOT NULL,
    cantidad integer,
    status integer NOT NULL
);


ALTER TABLE auditoria_equipos OWNER TO postgres;

--
-- Name: TABLE auditoria_equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_equipos IS 'Cambios o eliminaciones realizados en la tabla equipos';


--
-- Name: COLUMN auditoria_equipos.status; Type: COMMENT; Schema: public; Owner: postgres
--

-- tablas para las localidades

CREATE TABLE localidad (
    id bigint NOT NULL,
    tabla character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    localidad_id bigint,
    CONSTRAINT chk_localidad CHECK (((tabla)::text = ANY (ARRAY['pais'::text, 'estado'::text, 'municipio'::text, 'parroquia'::text])))
);
COMMENT ON TABLE localidad IS 'Entidad que contiene la informacion de localidades (Pais, Estado, Municipio, Parroquia). Desarrollado por Jose Rodriguez <josearodrigueze@gmail.com> @josearodrigueze';
COMMENT ON COLUMN localidad.id IS 'Identificador de la localidad.';
COMMENT ON COLUMN localidad.tabla IS 'Indica el suborden al que pertenece registro almacenado. Ej. pais, estado, municipio, parroquia.';
COMMENT ON COLUMN localidad.nombre IS 'Nombre de la localidad almacenada.';
COMMENT ON COLUMN localidad.localidad_id IS 'Identificador del padre de la localidad.';

CREATE SEQUENCE localidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



COMMENT ON COLUMN auditoria_equipos.status IS '0=cerrada;1=abierta';


--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_equipos_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_equipos_id_equipo_seq OWNER TO postgres;

--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auditoria_equipos_id_equipo_seq OWNED BY auditoria_equipos.id_equipo;


--
-- Name: auditoria_personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE auditoria_personal (
    "CI_per" character varying(8) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(15) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(25) NOT NULL,
    f_nac date,
    id_personal integer NOT NULL,
    status integer
);


ALTER TABLE auditoria_personal OWNER TO postgres;

--
-- Name: TABLE auditoria_personal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_personal IS 'Cambios o eliminaciones realizados en la tabla personal';


--
-- Name: COLUMN auditoria_personal.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_personal.status IS '0=cerrada;1=abierta';


--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_personal_id_personal_seq OWNER TO postgres;

--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auditoria_personal_id_personal_seq OWNED BY auditoria_personal.id_personal;


--
-- Name: auditoria_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE auditoria_usuario (
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    id_usuario integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE auditoria_usuario OWNER TO postgres;

--
-- Name: TABLE auditoria_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_usuario IS 'Cambios o eliminaciones realizados en la tabla usuario';


--
-- Name: COLUMN auditoria_usuario.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_usuario.status IS '0=cerrada;1=abierta';


--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auditoria_usuario_id_usuario_seq OWNED BY auditoria_usuario.id_usuario;


--
-- Name: bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

/*
CREATE TABLE codigo_bienes (
    id_bienes serial NOT NULL,
    cod_cat_gen character varying(10),
    cod_sub_cat character varying(10),
    cod_cat_especifico character varying(10),
    descripcion character varying(50),
    estatus_uso_bien character varying(10),
    marca character varying(10),
    modelo character varying(10),
    serial character varying(20),
    tipo_comp character varying(10),
    color character varying(10),
    num_bien character varying(10),
    estado_bien_fisicas character varying(10),
    cat_unidad_admin character varying(20)
);
*/

CREATE TABLE categoria_general_bienes(
    id serial NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL
);

-- 0 Mueble
-- 1 Inmueble

ALTER TABLE categoria_general_bienes OWNER TO postgres;


CREATE TABLE  sub_categorias_bienes(
  id serial NOT NULL,
  id_categoria_general_bienes integer NOT NULL,
  codigo character varying(12) NOT NULL,
  descripcion character varying(100) NOT NULL,
  tipo integer NOT NULL
);

ALTER TABLE sub_categorias_bienes OWNER TO postgres;

CREATE TABLE configuracion_bien(
  id serial,
  codigo integer NOT NULL,
  descripcion character varying(100),
  tipo  character varying(50)
);

-- TIPOS
-- forma adquision
-- colores
-- estatus de uso de bien
-- condiciones fisicas
-- marcas


ALTER TABLE configuracion_bien OWNER TO postgres;
--
-- Name: bienes_id_bienes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

/*CREATE SEQUENCE bienes_id_bienes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bienes_id_bienes_seq OWNER TO postgres;

--
-- Name: bienes_id_bienes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bienes_id_bienes_seq OWNED BY bienes.id_bienes;
*/

--
-- Name: detalle_entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE detalle_entrada (
    id serial,
    id_entrada_entrada integer NOT NULL,
    id_equipos integer NOT NULL,
    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40)
);


ALTER TABLE detalle_entrada OWNER TO postgres;

--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_entrada_id_detalle_entrada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_entrada_id_detalle_entrada_seq OWNER TO postgres;

--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE detalle_entrada_id_detalle_entrada_seq OWNED BY detalle_entrada.id_detalle_entrada;


--
-- Name: detalle_salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE detalle_salida (
    id serial,
    id_salida_salida integer NOT NULL,
    id_equipos integer NOT NULL,
    cantidad integer NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    tipo_salida character varying(40)
);


ALTER TABLE detalle_salida OWNER TO postgres;

--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_salida_id_detallle_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_salida_id_detallle_salida_seq OWNER TO postgres;

--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--


--
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE entrada (
    id_entrada integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modif timestamp without time zone,    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40),
    usuario_entrada character varying(40),
    observacion character varying(200)
);


ALTER TABLE entrada OWNER TO postgres;

--
-- Name: TABLE entrada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entrada IS 'Equipos que ingresan';


--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entrada_id_entrada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entrada_id_entrada_seq OWNER TO postgres;

--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entrada_id_entrada_seq OWNED BY entrada.id_entrada;


--
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE equipo (
    item integer NOT NULL,
    descripcion character varying(100),
    marca character varying(15),
    modelo character varying(15),
    serial character varying(30),
    color character varying(10),
    estado character varying(100) NOT NULL,
    cod_bien character varying(15),
    id_equipo integer NOT NULL,
    cantidad integer,
    "id_Ubicacion_ubicacion" integer,
    status integer NOT NULL
);


ALTER TABLE equipo OWNER TO postgres;

--
-- Name: COLUMN equipo.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN equipo.status IS '0=cerrada;1=abierta';


--
-- Name: equipo_id_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipo_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipo_id_equipo_seq OWNER TO postgres;

--
-- Name: equipo_id_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE equipo_id_equipo_seq OWNED BY equipo.id_equipo;


--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE personal (
    "CI_per" character varying(8) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(15) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(25) NOT NULL,
    f_nac date,
    id_personal integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modif timestamp without time zone,
    usuario_creacion character varying(20) NOT NULL,
    usuario_modif character varying(20),
    id_entrada_entrada integer,
    id_salida_salida integer,
    id_usuario_usuario integer,
    "id_Ubicacion_ubicacion" integer,
    status integer
);


ALTER TABLE personal OWNER TO postgres;

--
-- Name: COLUMN personal.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personal.status IS '0=cerrada;1=abierta';


--
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personal_id_personal_seq OWNER TO postgres;

--
-- Name: personal_id_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personal_id_personal_seq OWNED BY personal.id_personal;


--
-- Name: salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE salida (
    id_salida integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modif timestamp without time zone,    cantidad integer NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    tipo_salida character varying(40),
    usuario_salida character varying(40),
    observacion character varying(200)
);


ALTER TABLE salida OWNER TO postgres;

--
-- Name: TABLE salida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE salida IS 'equipos de salen';


--
-- Name: salida_id_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salida_id_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salida_id_salida_seq OWNER TO postgres;

--
-- Name: salida_id_salida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salida_id_salida_seq OWNED BY salida.id_salida;


--
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ubicacion (
    nombre character varying(20),
    "id_Ubicacion" integer NOT NULL
);


ALTER TABLE ubicacion OWNER TO postgres;

--
-- Name: TABLE ubicacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ubicacion IS 'Detalles de la ubicacion de los equipos y el personal';


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ubicacion_id_Ubicacion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ubicacion_id_Ubicacion_seq" OWNER TO postgres;

--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "ubicacion_id_Ubicacion_seq" OWNED BY ubicacion."id_Ubicacion";


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE usuario (
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modif timestamp without time zone,
    usuario_creacion character varying(20) NOT NULL,
    usuario_modif character varying(20),
    status integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: COLUMN usuario.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.status IS '0=cerrada;1=abierta';


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- Name: id_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auditoria_equipos ALTER COLUMN id_equipo SET DEFAULT nextval('auditoria_equipos_id_equipo_seq'::regclass);


--
-- Name: id_personal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auditoria_personal ALTER COLUMN id_personal SET DEFAULT nextval('auditoria_personal_id_personal_seq'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auditoria_usuario ALTER COLUMN id_usuario SET DEFAULT nextval('auditoria_usuario_id_usuario_seq'::regclass);


--
-- Name: id_detalle_entrada; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY detalle_entrada ALTER COLUMN id_detalle_entrada SET DEFAULT nextval('detalle_entrada_id_detalle_entrada_seq'::regclass);


--
-- Name: id_detallle_salida; Type: DEFAULT; Schema: public; Owner: postgres
--


--
-- Name: id_entrada; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada ALTER COLUMN id_entrada SET DEFAULT nextval('entrada_id_entrada_seq'::regclass);


--
-- Name: id_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipo ALTER COLUMN id_equipo SET DEFAULT nextval('equipo_id_equipo_seq'::regclass);


--
-- Name: id_personal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal ALTER COLUMN id_personal SET DEFAULT nextval('personal_id_personal_seq'::regclass);


--
-- Name: id_salida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salida ALTER COLUMN id_salida SET DEFAULT nextval('salida_id_salida_seq'::regclass);


--
-- Name: id_Ubicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubicacion ALTER COLUMN "id_Ubicacion" SET DEFAULT nextval('"ubicacion_id_Ubicacion_seq"'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- Data for Name: auditoria_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_equipos_id_equipo_seq', 1, false);


--
-- Data for Name: auditoria_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_personal_id_personal_seq', 1, false);


--
-- Data for Name: auditoria_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_usuario_seq', 1, false);


--
-- Data for Name: bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: bienes_id_bienes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--SELECT pg_catalog.setval('bienes_id_bienes_seq', 1, false);


--
-- Data for Name: detalle_entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_detalle_entrada_seq', 1, false);


--
-- Data for Name: detalle_salida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_detallle_salida_seq', 1, false);


--
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_equipo_seq', 1, false);


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 1, false);


--
-- Data for Name: salida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: salida_id_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salida_id_salida_seq', 1, false);


--
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, false);


--
-- Name: PK_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "PK_personal" PRIMARY KEY (id_personal);


ALTER TABLE ONLY categoria_general_bienes
  ADD CONSTRAINT "pk categoria_general_bienes" PRIMARY KEY (id);

ALTER TABLE ONLY sub_categorias_bienes
  ADD CONSTRAINT "pk  sub_categorias_bienes" PRIMARY KEY (id);

ALTER TABLE ONLY configuracion_bien
  ADD CONSTRAINT "pk configuracion_bien" PRIMARY KEY (id);


--
-- Name: UN_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "UN_personal" UNIQUE ("CI_per");


--
-- Name: UN_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ubicacion
    ADD CONSTRAINT "UN_ubicacion" UNIQUE (nombre);


--
-- Name: UN_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "UN_usuario" UNIQUE (usuario);


--
-- Name: personal_uq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT personal_uq UNIQUE (id_entrada_entrada);


--
-- Name: personal_uq1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT personal_uq1 UNIQUE (id_salida_salida);


--
-- Name: personal_uq2; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT personal_uq2 UNIQUE (id_usuario_usuario);


--
-- Name: personal_uq3; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT personal_uq3 UNIQUE ("id_Ubicacion_ubicacion");


--
-- Name: pk_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

--ALTER TABLE ONLY bienes
--    ADD CONSTRAINT pk_bienes PRIMARY KEY (id_bienes);


--
-- Name: pk_detalle_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--
--
-- Name: pk_detalle_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT pk_detalle_salida PRIMARY KEY (id);


--
-- Name: pk_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT pk_entrada PRIMARY KEY (id_entrada);


--
-- Name: pk_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id_equipo);


--
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id_usuario);


--
-- Name: pk_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY salida
    ADD CONSTRAINT pk_salida PRIMARY KEY (id_salida);


--
-- Name: pk_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ubicacion
    ADD CONSTRAINT pk_ubicacion PRIMARY KEY ("id_Ubicacion");


--
-- Name: un_car_gen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--


--
-- Name: CONSTRAINT un_car_gen ON bienes; Type: COMMENT; Schema: public; Owner: postgres
--

--COMMENT ON CONSTRAINT un_car_gen ON bienes IS 'codigo de categor�a general';


--
-- Name: un_cat_especifica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--


--
-- Name: un_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT un_equipo UNIQUE (serial);


--
-- Name: un_sub_cat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--


--
-- Name: CONSTRAINT un_sub_cat ON bienes; Type: COMMENT; Schema: public; Owner: postgres
--

--COMMENT ON CONSTRAINT un_sub_cat ON bienes IS 'Codigo de sub-categor�a';


--
-- Name: usuario_uq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--



--
-- Name: actualizarequipo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarequipo AFTER UPDATE ON equipo FOR EACH ROW EXECUTE PROCEDURE auditequipos();


--
-- Name: actualizarpersonal; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarpersonal AFTER UPDATE ON personal FOR EACH ROW EXECUTE PROCEDURE auditpersonal();


--
-- Name: actualizarusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarusuario AFTER UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: auditequipos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditequipos AFTER DELETE ON equipo FOR EACH ROW EXECUTE PROCEDURE auditequipos();


--
-- Name: auditpersonal; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditpersonal AFTER DELETE ON personal FOR EACH ROW EXECUTE PROCEDURE auditpersonal();


--
-- Name: auditusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditusuario AFTER DELETE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT entrada_fk FOREIGN KEY (id_entrada_entrada) REFERENCES entrada(id_entrada) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

--
-- Name: salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
--
-- Name: salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT salida_fk FOREIGN KEY (id_salida_salida) REFERENCES salida(id_salida) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT salida_fk FOREIGN KEY (id_salida_salida) REFERENCES salida(id_salida) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;



--
-- Name: ubicacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT ubicacion_fk FOREIGN KEY ("id_Ubicacion_ubicacion") REFERENCES ubicacion("id_Ubicacion") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ubicacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT ubicacion_fk FOREIGN KEY ("id_Ubicacion_ubicacion") REFERENCES ubicacion("id_Ubicacion") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario_usuario) REFERENCES usuario(id_usuario) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
