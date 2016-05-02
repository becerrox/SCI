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

--
-- Name: auditusuario(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditusuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_usuario VALUES (old.usuario, old.pass, old.nivel, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditusuario() OWNER TO postgres;

--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuracion_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuracion_bien_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: configuracion_bien; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_bien (
    id integer DEFAULT nextval('configuracion_bien_id_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    descripcion character varying(100),
    tipo character varying(50)
);


ALTER TABLE configuracion_bien OWNER TO postgres;

--
-- Name: TABLE configuracion_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_bien IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, categoria de unidades administrativas';


--
-- Name: COLUMN configuracion_bien.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_bien.tipo IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, marca';


--
-- Name: Colores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "Colores" AS
 SELECT configuracion_bien.descripcion
   FROM configuracion_bien
  WHERE ((configuracion_bien.tipo)::text = 'Color'::text);


ALTER TABLE "Colores" OWNER TO postgres;

--
-- Name: VIEW "Colores"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW "Colores" IS 'Colores';


--
-- Name: aignacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aignacion_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE aignacion_id_seq OWNER TO postgres;

--
-- Name: aignacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aignacion (
    id integer DEFAULT nextval('aignacion_id_seq'::regclass) NOT NULL,
    fecha_asignacion timestamp without time zone,
    tipo_asignacion smallint,
    id_personal integer
);


ALTER TABLE aignacion OWNER TO postgres;

--
-- Name: TABLE aignacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE aignacion IS 'Detalles de asignaciones';


--
-- Name: aignación_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "aignación_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "aignación_id_seq" OWNER TO postgres;

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
-- Name: auditoria_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria_usuario (
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    status integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now()
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
-- Name: auditoria_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_usuario_id_seq OWNER TO postgres;

--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bienesgeneral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bienesgeneral_id_seq OWNER TO postgres;

--
-- Name: bienesgeneral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bienesgeneral (
    id integer DEFAULT nextval('bienesgeneral_id_seq'::regclass) NOT NULL,
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
    status integer DEFAULT 1 NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cat_unid_admin character varying(10),
    per_ini date,
    per_culm date,
    unidad_trabajo character varying(30),
    responsable_pa character varying(50),
    responsable_ad character varying(50),
    responsable_uso character varying(50)
);


ALTER TABLE bienesgeneral OWNER TO postgres;

--
-- Name: TABLE bienesgeneral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bienesgeneral IS 'Datos almacenados de los bienes';


--
-- Name: COLUMN bienesgeneral.cod_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_general IS 'Codigo categoria general';


--
-- Name: COLUMN bienesgeneral.cod_subcat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_subcat IS 'Codigo sub-categoria';


--
-- Name: COLUMN bienesgeneral.cod_catespf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_catespf IS 'Codigo categoria especifica';


--
-- Name: COLUMN bienesgeneral.estatus_uso_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.estatus_uso_bien IS 'Estatus del uso del bien';


--
-- Name: COLUMN bienesgeneral.tipo_comp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.tipo_comp IS 'Tipo componente';


--
-- Name: COLUMN bienesgeneral.num_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.num_bien IS 'numero de bien';


--
-- Name: COLUMN bienesgeneral.estado_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.estado_bien IS 'Estado del bien';


--
-- Name: COLUMN bienesgeneral.cat_unid_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cat_unid_admin IS 'Categoría de unidad administrativa';


--
-- Name: COLUMN bienesgeneral.per_ini; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.per_ini IS 'Periodo de inicio';


--
-- Name: COLUMN bienesgeneral.per_culm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.per_culm IS 'Periodo de culminación';


--
-- Name: COLUMN bienesgeneral.unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: COLUMN bienesgeneral.responsable_ad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.responsable_ad IS 'Responsable Administrativo';


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_general_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_general_bienes_id_seq OWNER TO postgres;

--
-- Name: catesp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE catesp_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE catesp_id_seq OWNER TO postgres;

--
-- Name: catesp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE catesp (
    id integer DEFAULT nextval('catesp_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    status integer NOT NULL,
    subcat character varying(12)
);


ALTER TABLE catesp OWNER TO postgres;

--
-- Name: TABLE catesp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE catesp IS 'Codigos de categoria especifica';


--
-- Name: catgen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE catgen_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE catgen_id_seq OWNER TO postgres;

--
-- Name: catgen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE catgen (
    id integer DEFAULT nextval('catgen_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE catgen OWNER TO postgres;

--
-- Name: TABLE catgen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE catgen IS 'Codigo general de los bienes';


--
-- Name: detalle_entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_entrada_id_seq OWNER TO postgres;

--
-- Name: detalle_entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_entrada (
    id integer DEFAULT nextval('detalle_entrada_id_seq'::regclass) NOT NULL,
    id_equipos integer NOT NULL,
    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40),
    id_entrada integer
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
-- Name: detalle_salida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_salida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_salida_id_seq OWNER TO postgres;

--
-- Name: detalle_salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_salida (
    id integer DEFAULT nextval('detalle_salida_id_seq'::regclass) NOT NULL,
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
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrada (
    id integer DEFAULT nextval('entrada_id_entrada_seq'::regclass) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40),
    usuario_entrada character varying(40),
    observacion character varying(200),
    id_usuario integer
);


ALTER TABLE entrada OWNER TO postgres;

--
-- Name: TABLE entrada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entrada IS 'Equipos que ingresan';


--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipo_id_seq OWNER TO postgres;

--
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipo (
    id integer DEFAULT nextval('equipo_id_seq'::regclass) NOT NULL,
    descripcion character varying(100),
    marca character varying(30),
    modelo character varying(30),
    serial character varying(30) NOT NULL,
    color character varying(10),
    estado character varying(100) NOT NULL,
    unidad_admin character varying(50),
    status integer DEFAULT 1 NOT NULL,
    responsable character varying(50),
    caracteristicas character varying(150),
    fecha_modif timestamp without time zone,
    unidad_trabajo character varying(50),
    observaciones character varying(100),
    "serialSim" character varying(20),
    accesorios character varying(50),
    "planCelular" character varying(40),
    "numeroCelular" character varying(20)
);


ALTER TABLE equipo OWNER TO postgres;

--
-- Name: TABLE equipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE equipo IS 'Tabla de los equipos';


--
-- Name: COLUMN equipo.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN equipo.status IS '0=cerrada;1=abierta';


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
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personal (
    id integer DEFAULT nextval('personal_id_personal_seq'::regclass) NOT NULL,
    ci_per character varying(12) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(50) NOT NULL,
    f_nac date,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    usuario_creacion character varying(20) NOT NULL,
    usuario_modif character varying(20),
    status integer,
    unidad_trabajo character varying(50),
    id_usuario integer
);


ALTER TABLE personal OWNER TO postgres;

--
-- Name: TABLE personal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE personal IS 'Tabla del personal';


--
-- Name: COLUMN personal.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personal.status IS '0=cerrada;1=abierta';


--
-- Name: COLUMN personal.unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personal.unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: responsables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE responsables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE responsables_id_seq OWNER TO postgres;

--
-- Name: responsables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE responsables (
    id integer DEFAULT nextval('responsables_id_seq'::regclass) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    uni_admin character varying(30),
    fecha_creacion timestamp without time zone,
    fecha_modif timestamp without time zone DEFAULT now(),
    status integer,
    ci_responsable character varying(12)
);


ALTER TABLE responsables OWNER TO postgres;

--
-- Name: TABLE responsables; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE responsables IS 'Responsables de inventarios';


--
-- Name: COLUMN responsables.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN responsables.status IS ' 0=cerrada;1=abierta';


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
-- Name: salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salida (
    id integer DEFAULT nextval('salida_id_salida_seq'::regclass) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cantidad integer NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    tipo_salida character varying(40),
    usuario_salida character varying(40),
    observacion character varying(200),
    id_usuario integer
);


ALTER TABLE salida OWNER TO postgres;

--
-- Name: TABLE salida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE salida IS 'equipos de salen';


--
-- Name: solvencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solvencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solvencia_id_seq OWNER TO postgres;

--
-- Name: solvencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solvencia (
    id integer DEFAULT nextval('solvencia_id_seq'::regclass) NOT NULL,
    fecha_solvencia smallint,
    id_personal integer
);


ALTER TABLE solvencia OWNER TO postgres;

--
-- Name: TABLE solvencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE solvencia IS 'Detalles de solvencia';


--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sub_categorias_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sub_categorias_bienes_id_seq OWNER TO postgres;

--
-- Name: subcat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subcat_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE subcat_id_seq OWNER TO postgres;

--
-- Name: subcat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subcat (
    id integer DEFAULT nextval('subcat_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    status integer NOT NULL,
    catgen character varying(12)
);


ALTER TABLE subcat OWNER TO postgres;

--
-- Name: TABLE subcat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE subcat IS 'Codigos de las subcategoria de bienes';


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
-- Name: unidad_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_admin (
    id integer DEFAULT nextval('"ubicacion_id_Ubicacion_seq"'::regclass) NOT NULL,
    nombre character varying(20)
);


ALTER TABLE unidad_admin OWNER TO postgres;

--
-- Name: TABLE unidad_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_admin IS 'Detalles de la Unidad Administrativa donde están ubicados los equipos y el personal';


--
-- Name: unidad_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_trabajo (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE unidad_trabajo OWNER TO postgres;

--
-- Name: TABLE unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_trabajo_id_seq OWNER TO postgres;

--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_trabajo_id_seq OWNED BY unidad_trabajo.id;


--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_trabajo_nombre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_trabajo_nombre_seq OWNER TO postgres;

--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_trabajo_nombre_seq OWNED BY unidad_trabajo.nombre;


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now(),
    status integer DEFAULT 1 NOT NULL,
    primer_inicio integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuario IS 'Tabla de los usuarios';


--
-- Name: COLUMN usuario.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.status IS '0=cerrada;1=abierta';


--
-- Name: COLUMN usuario.primer_inicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.primer_inicio IS 'Inicio por primera vez. 0 = nunca, 1 =iniciado';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_trabajo ALTER COLUMN id SET DEFAULT nextval('unidad_trabajo_id_seq'::regclass);


--
-- Data for Name: aignacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aignacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aignacion_id_seq', 1, false);


--
-- Name: aignación_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"aignación_id_seq"', 1, false);


--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_equipos_id_equipo_seq', 1, false);


--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_personal_id_personal_seq', 1, false);


--
-- Data for Name: auditoria_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria_usuario VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1, '2016-04-22 10:59:49.741052');


--
-- Name: auditoria_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_seq', 1, false);


--
-- Data for Name: bienesgeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bienesgeneral VALUES (1, NULL, NULL, NULL, 'cszcsz', 1, 'zscsz', 'zscsz', '242343ss', '1', 1, 424, 1, 1, '2016-04-07 11:06:59.460911', '1', '2016-04-21', '2016-04-21', '1', '1', '1', '1');
INSERT INTO bienesgeneral VALUES (2, NULL, NULL, NULL, 'awdwa', 1, 'dwadaw', 'awdwa', 'awdwa', '2', 1, 12321, 2, 1, '2016-04-07 14:15:57.276499', '2', '2016-04-07', '2016-04-19', '1', '0', '0', '0');
INSERT INTO bienesgeneral VALUES (3, NULL, NULL, NULL, 'awdwa', 1, 'dwadaw', 'awdwa', 'wasd', '2', 1, 322321312, 2, 1, '2016-04-07 14:16:26.908969', '2', '2016-04-07', '2016-04-19', '1', '0', '0', '0');
INSERT INTO bienesgeneral VALUES (4, NULL, NULL, NULL, 'wadawd', 2, 'zscsz', 'zscszzs', 'fsfeszh', '1', 1, 6453546, 2, 1, '2016-04-07 14:18:13.346263', '2', '2016-04-21', '2016-04-26', '1', '0', '0', '0');
INSERT INTO bienesgeneral VALUES (5, NULL, NULL, NULL, 'wdaawdwa', 1, 'adwa', 'awdwaa', 'wahjykugfthgefesrhtjyfhds', '2', 1, 435364, 2, 1, '2016-04-07 14:22:22.435507', '1', '2016-04-04', '2016-04-12', '1', '1', '0', '0');
INSERT INTO bienesgeneral VALUES (6, NULL, NULL, NULL, 'efse', 1, 'sefes', 'adwad', 'dwadw', '2', 35, 3213, 3, 1, '2016-04-08 10:33:35.995468', '1', '2016-04-20', '2016-04-27', '1', '1', '0', '0');
INSERT INTO bienesgeneral VALUES (7, NULL, NULL, NULL, 'efesf', 1, 'esf', 'sefs', '13456', '1', 10, 123456, 3, 1, NULL, '16', '2016-04-09', '2016-04-19', '5', '1', '1', '1');
INSERT INTO bienesgeneral VALUES (8, NULL, NULL, NULL, 'wadwa', 6, 'awdwa', 'awdwa', 'waawd', '1', 13, 1111, 3, 1, '2016-04-14 04:31:37', '17', '2016-04-15', '2016-04-15', '5', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (9, NULL, NULL, NULL, 'ddwdw', 1, 'wdwd', 'dwdwd', '23213', '1', 15, 112233, 6, 1, '2016-04-21 10:38:10', '19', '2016-04-11', '2016-04-13', '1', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (10, NULL, NULL, NULL, 'dwdwd', 1, 'fesf', 'awdawd', '23ewds', '2', 19, 223344, 4, 1, '2016-04-22 11:17:51.473785', '19', '2016-04-18', '2016-04-20', '5', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (11, '12', '122', '23', 'fefsefe', 1, 'ffsf', 'efsf', 'desf3435', '1', 18, 9999, 6, 1, '2016-04-22 14:17:59.781351', '18', '2016-04-11', '2016-04-16', '5', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (12, '12', '122', '23', 'fefsefe', 1, 'ffsf', 'efsf', 'desf34357', '1', 18, 8888, 6, 1, '2016-04-22 14:19:13.449695', '18', '2016-04-11', '2016-04-16', '5', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (13, '12', '122', '23', 'hola', 1, 'Siragon', 'fmod', '23wdasd23', '2', 7, 11235, 4, 1, '2016-04-26 08:28:18.323175', '5', '2016-04-11', '2016-04-14', '5', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón');
INSERT INTO bienesgeneral VALUES (14, '12', '122', '23', 'fwaaw', 1, 'afse', 'efsf', '1122334455', '1', 19, 1122334455, 6, 1, '2016-04-27 10:53:03.666672', '1', '2016-04-15', '2016-04-16', '5', 'Jose Figuera', 'Luis Ricardo Lavado Mogollón', 'Jose Figuera');
INSERT INTO bienesgeneral VALUES (15, '12', '122', '23', 'dadwa', 1, 'efse', 'eadaw', 'cacadwa', '1', 1, 323432432, 1, 0, '2016-05-02 02:06:23', '5', '2016-05-01', '2016-05-03', '3', 'Jose Figuera', 'Jose Figuera', 'Luis Ricardo Lavado Mogollón');


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 15, true);


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, true);


--
-- Data for Name: catesp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catesp VALUES (2, '23', 'wwad', 1, '1');
INSERT INTO catesp VALUES (1, '21213', 'Pequeño', 1, '12234');


--
-- Name: catesp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catesp_id_seq', 1, true);


--
-- Data for Name: catgen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catgen VALUES (1, '12', 'Escoba', 1);
INSERT INTO catgen VALUES (2, '1234', 'dwd', 1);
INSERT INTO catgen VALUES (3, '12343', 'dwd', 1);
INSERT INTO catgen VALUES (4, '123456', 'Fieltro', 1);
INSERT INTO catgen VALUES (5, '121213', 'Caucho', 1);


--
-- Name: catgen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catgen_id_seq', 5, true);


--
-- Data for Name: configuracion_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_bien VALUES (1, 1, 'Negro', 'Color');
INSERT INTO configuracion_bien VALUES (2, 2, 'Azul', 'Color');
INSERT INTO configuracion_bien VALUES (3, 3, 'Palo Rosa', 'Color');
INSERT INTO configuracion_bien VALUES (4, 4, 'Naranja', 'Color');
INSERT INTO configuracion_bien VALUES (5, 5, 'Verde', 'Color');
INSERT INTO configuracion_bien VALUES (6, 6, 'BEIGE', 'Color');
INSERT INTO configuracion_bien VALUES (7, 7, 'CROMÁTICO', 'Color');
INSERT INTO configuracion_bien VALUES (8, 8, 'VINOTINTO', 'Color');
INSERT INTO configuracion_bien VALUES (9, 9, 'GRIS/NEGRO', 'Color');
INSERT INTO configuracion_bien VALUES (10, 10, 'PLATEADO', 'Color');
INSERT INTO configuracion_bien VALUES (11, 11, 'BEIGE AUSTRALIA', 'Color');
INSERT INTO configuracion_bien VALUES (12, 12, 'PLATEADO FERROSO', 'Color');
INSERT INTO configuracion_bien VALUES (13, 13, 'PERLA', 'Color');
INSERT INTO configuracion_bien VALUES (14, 14, 'BEIGE OLÍMPICO', 'Color');
INSERT INTO configuracion_bien VALUES (15, 15, 'ARENA METALIZADO', 'Color');
INSERT INTO configuracion_bien VALUES (16, 16, 'PLATA', 'Color');
INSERT INTO configuracion_bien VALUES (17, 17, 'ROJO', 'Color');
INSERT INTO configuracion_bien VALUES (18, 18, 'AMARILLO', 'Color');
INSERT INTO configuracion_bien VALUES (19, 19, 'BEIGE DUNA', 'Color');
INSERT INTO configuracion_bien VALUES (21, 21, 'AZUL/BEIGE', 'Color');
INSERT INTO configuracion_bien VALUES (22, 22, 'MARRÓN/BEIGE', 'Color');
INSERT INTO configuracion_bien VALUES (23, 23, 'VERDE ESMERALDA', 'Color');
INSERT INTO configuracion_bien VALUES (24, 24, 'PLATA CLARO', 'Color');
INSERT INTO configuracion_bien VALUES (25, 25, 'PLATEADO BRILLANTE', 'Color');
INSERT INTO configuracion_bien VALUES (26, 26, 'MARRÓN PARDILLO BICAPA', 'Color');
INSERT INTO configuracion_bien VALUES (27, 27, 'GRIS PALMERA', 'Color');
INSERT INTO configuracion_bien VALUES (28, 28, 'DORADO', 'Color');
INSERT INTO configuracion_bien VALUES (29, 29, 'MADERA NATURAL', 'Color');
INSERT INTO configuracion_bien VALUES (30, 30, 'NEGRO/AMARILLO MOSTAZA', 'Color');
INSERT INTO configuracion_bien VALUES (31, 31, 'MARRÓN', 'Color');
INSERT INTO configuracion_bien VALUES (32, 32, 'BLANCO', 'Color');
INSERT INTO configuracion_bien VALUES (33, 33, 'GRIS', 'Color');
INSERT INTO configuracion_bien VALUES (34, 34, 'AZUL/GRIS', 'Color');
INSERT INTO configuracion_bien VALUES (35, 35, 'AZUL/NEGRO', 'Color');
INSERT INTO configuracion_bien VALUES (36, 36, 'ACERO', 'Color');
INSERT INTO configuracion_bien VALUES (37, 37, 'OTRO COLOR', 'Color');
INSERT INTO configuracion_bien VALUES (20, 20, 'MARRÓN/NEGRO', 'Color');
INSERT INTO configuracion_bien VALUES (39, 1, 'Compra Directa (por consulta de Precio)', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (40, 2, 'Permuta', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (41, 3, 'Dación en pago', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (42, 4, 'Donación', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (43, 5, 'Transferencia', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (44, 6, 'Expropiación', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (45, 7, 'Confiscación', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (46, 8, 'Compra por Concurso Abierto', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (47, 9, 'Compra por Concurso Cerrado', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (48, 10, 'Adjudicación', 'Forma de Adquisición del Bien');
INSERT INTO configuracion_bien VALUES (49, 1, 'En uso', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (50, 2, 'En comodato', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (51, 3, 'En arrendamiento', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (52, 4, 'En mantenimiento', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (53, 5, 'En reparación', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (54, 6, 'En proceso de disposición', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (55, 7, 'En desuso por obsolescencia', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (56, 8, 'En desuso por inservibilidad', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (57, 9, 'En desuso por obsolescencia e inservibilidad', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (58, 10, 'En Almacén o Depósito para su asignación', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (59, 11, 'Otro uso', 'Estatus de Uso del Bien');
INSERT INTO configuracion_bien VALUES (60, 1, 'Óptimo', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (61, 2, 'Regular', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (62, 3, 'Deteriorado', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (63, 4, 'Averiado', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (64, 5, 'Chatarra', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (65, 6, 'No operativo', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (66, 7, 'Otra condición física', 'Estado del Bien');
INSERT INTO configuracion_bien VALUES (68, 2, 'Despacho del Vicepresidente', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (69, 3, 'Despacho del Ministro', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (70, 4, 'Despacho Viceministro', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (71, 5, 'Dirección General', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (72, 6, 'Dirección de Linea', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (73, 7, 'Coordinación', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (74, 8, 'División', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (75, 9, 'Departamento', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (76, 10, 'Presidencia', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (77, 11, 'Gerencia General', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (78, 12, 'Gerencia', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (79, 13, 'Sub-Gerencia', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (80, 14, 'Despacho del Superintendente', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (81, 15, 'Dirección General Adjunta', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (82, 16, 'Intendencia', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (83, 17, 'Unidad Ad-Hoc', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (84, 18, 'Área Organizacional', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (85, 19, 'Área de Trabajo', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (86, 20, 'Otra categoría de Unidad', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (67, 1, 'Despacho del Presidente', 'Categoría de Unidades Administrativas');
INSERT INTO configuracion_bien VALUES (88, 2, 'Telecomunicaciones ', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (90, 4, 'Compras', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (89, 3, 'Presidencia', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (91, 5, 'Recaudación', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (87, 1, 'CCO', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (92, 45, 'Extraviado', '1');


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 92, true);


--
-- Data for Name: detalle_entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_detalle_entrada_seq', 1, false);


--
-- Name: detalle_entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_seq', 1, false);


--
-- Data for Name: detalle_salida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_detallle_salida_seq', 1, false);


--
-- Name: detalle_salida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_seq', 1, false);


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

INSERT INTO equipo VALUES (1, 'wadwadwa', 'awdwadwad', 'awdwad', 'wadwad', 'awdwa', '1', 'dwadwa', 1, 'awdwad', 'awdwad', '2016-04-07 10:26:49', 'wadaw', NULL, NULL, NULL, NULL, NULL);
INSERT INTO equipo VALUES (2, 'efes', 'sefs', 'efs', '1234', 'Negro', 'Óptimo', 'Despacho del Vicepresidente', 1, 'Luis Ricardo Lavado Mogollón', 'esfesf', '2016-04-13 10:51:06', 'Telecomunicaciones ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO equipo VALUES (3, 'celular', 'Epson', 'Pavilon', '323213213', 'Negro', 'Regular', 'Gerencia General', 1, 'Luis Ricardo Lavado Mogollón', 'dwadwad', '2016-05-02 02:03:14', 'Recaudación', 'wadwadwa', '4324324', 'wadhawdhawgb', 'esfefaedwdwa', '4324324324');


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_seq', 3, true);


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personal VALUES (1, '23603524', 'Luis Ricardo', 'Lavado Mogollón', 'sefsefes', 432423, 324324, 'adwad', '2016-04-05', '2016-04-06 15:08:05.893788', '2016-04-07 10:24:58.850254', 'dwadwa', 'awdwad', 1, 'sfefsef', 1);
INSERT INTO personal VALUES (2, '11235813', 'Jose', 'Figuera', 'El Mayor', 324421, 3423, 'nifnig@fig.com', '2016-04-25', '2016-04-26 08:54:42.243163', '2016-04-26 08:54:42.243163', '0', '0', 1, 'CCO', 2);


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 2, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO responsables VALUES (1, 'Jose', 'dwdwdw', 'djodjod', '2016-04-08 11:42:54.490961', '2016-04-08 11:42:54.490961', 1, NULL);


--
-- Name: responsables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('responsables_id_seq', 1, true);


--
-- Data for Name: salida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: salida_id_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salida_id_salida_seq', 1, false);


--
-- Data for Name: solvencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: solvencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solvencia_id_seq', 1, false);


--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_categorias_bienes_id_seq', 5, true);


--
-- Data for Name: subcat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO subcat VALUES (1, '122', 'adwd', 1, '1');
INSERT INTO subcat VALUES (3, '1234', 'De pala', 1, NULL);
INSERT INTO subcat VALUES (4, '12343', 'De pala', 1, NULL);
INSERT INTO subcat VALUES (5, '123435', 'De pala', 1, '12');
INSERT INTO subcat VALUES (2, '1234351', 'De pala', 1, '12');
INSERT INTO subcat VALUES (6, '12343511', 'De pala', 1, '12');
INSERT INTO subcat VALUES (7, '12234', 'Pesado', 1, '121213');


--
-- Name: subcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subcat_id_seq', 7, true);


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 1, false);


--
-- Data for Name: unidad_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: unidad_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_id_seq', 1, false);


--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_nombre_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, '2016-04-06 15:06:59.467127', 1, 1);
INSERT INTO usuario VALUES (2, 'luisrlavado', '8cb2237d0679ca88db6464eac60da96345513964', 2, '2016-04-26 08:34:33', 1, 0);
INSERT INTO usuario VALUES (3, 'Jose', '8cb2237d0679ca88db6464eac60da96345513964', 1, '2016-05-02 01:32:03', 1, 0);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 3, true);


--
-- Name: PK_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "PK_personal" PRIMARY KEY (id);


--
-- Name: UN_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "UN_personal" UNIQUE (ci_per);


--
-- Name: UN_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
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
    ADD CONSTRAINT personal_uq UNIQUE (id_usuario);

ALTER TABLE personal CLUSTER ON personal_uq;


--
-- Name: pk configuracion_bien; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_bien
    ADD CONSTRAINT "pk configuracion_bien" PRIMARY KEY (id);


--
-- Name: pk_asignacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aignacion
    ADD CONSTRAINT pk_asignacion PRIMARY KEY (id);


--
-- Name: pk_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienesgeneral
    ADD CONSTRAINT pk_bienes PRIMARY KEY (id);


--
-- Name: pk_catesp; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY catesp
    ADD CONSTRAINT pk_catesp PRIMARY KEY (id);


--
-- Name: pk_catgen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY catgen
    ADD CONSTRAINT pk_catgen PRIMARY KEY (id);


--
-- Name: pk_detalle_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_entrada
    ADD CONSTRAINT pk_detalle_entrada PRIMARY KEY (id);


--
-- Name: pk_detalle_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT pk_detalle_salida PRIMARY KEY (id);


--
-- Name: pk_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT pk_entrada PRIMARY KEY (id);


--
-- Name: pk_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id);


--
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- Name: pk_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salida
    ADD CONSTRAINT pk_salida PRIMARY KEY (id);


--
-- Name: pk_serial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT pk_serial PRIMARY KEY (id);


--
-- Name: pk_solvencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solvencia
    ADD CONSTRAINT pk_solvencia PRIMARY KEY (id);


--
-- Name: pk_subcat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcat
    ADD CONSTRAINT pk_subcat PRIMARY KEY (id);


--
-- Name: pk_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT pk_ubicacion PRIMARY KEY (id);


--
-- Name: un_bien_serial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienesgeneral
    ADD CONSTRAINT un_bien_serial UNIQUE (serial);


--
-- Name: un_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT un_equipo UNIQUE (serial);


--
-- Name: unidad_trabajo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT unidad_trabajo_nombre_key UNIQUE (nombre);


--
-- Name: unidad_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT unidad_trabajo_pkey PRIMARY KEY (id);


--
-- Name: actualizarusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarusuario AFTER UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: auditusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditusuario AFTER DELETE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_entrada
    ADD CONSTRAINT entrada_fk FOREIGN KEY (id_entrada) REFERENCES entrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: personal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aignacion
    ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal) REFERENCES personal(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: personal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solvencia
    ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal) REFERENCES personal(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT salida_fk FOREIGN KEY (id_salida_salida) REFERENCES salida(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salida
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


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

