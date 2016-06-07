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
-- Name: bienesgeneral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bienesgeneral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bienesgeneral_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bienes (
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
    num_bien character varying(12),
    estado_bien integer,
    status integer DEFAULT 1 NOT NULL,
    fecha_modif timestamp without time zone,
    cat_unid_admin character varying(10),
    per_ini date,
    per_culm date,
    unidad_trabajo character varying(30),
    responsable_pa character varying(50),
    responsable_ad character varying(50),
    responsable_uso character varying(50),
    sede character varying(40)
);


ALTER TABLE bienes OWNER TO postgres;

--
-- Name: TABLE bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bienes IS 'Datos almacenados de los bienes';


--
-- Name: COLUMN bienes.cod_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.cod_general IS 'Codigo categoria general';


--
-- Name: COLUMN bienes.cod_subcat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.cod_subcat IS 'Codigo sub-categoria';


--
-- Name: COLUMN bienes.cod_catespf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.cod_catespf IS 'Codigo categoria especifica';


--
-- Name: COLUMN bienes.estatus_uso_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.estatus_uso_bien IS 'Estatus del uso del bien';


--
-- Name: COLUMN bienes.tipo_comp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.tipo_comp IS 'Tipo componente';


--
-- Name: COLUMN bienes.num_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.num_bien IS 'numero de bien';


--
-- Name: COLUMN bienes.estado_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.estado_bien IS 'Estado del bien';


--
-- Name: COLUMN bienes.cat_unid_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.cat_unid_admin IS 'Categoría de unidad administrativa';


--
-- Name: COLUMN bienes.per_ini; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.per_ini IS 'Periodo de inicio';


--
-- Name: COLUMN bienes.per_culm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.per_culm IS 'Periodo de culminación';


--
-- Name: COLUMN bienes.unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: COLUMN bienes.responsable_ad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienes.responsable_ad IS 'Responsable Administrativo';


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
-- Name: configuracion_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuracion_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE configuracion_admin_id_seq OWNER TO postgres;

--
-- Name: configuracion_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_admin (
    id integer DEFAULT nextval('configuracion_admin_id_seq'::regclass) NOT NULL,
    tipo character varying(60),
    descripcion character varying(60),
    status integer DEFAULT 1
);


ALTER TABLE configuracion_admin OWNER TO postgres;

--
-- Name: TABLE configuracion_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_admin IS 'Tabla de configuración para Sedes y Cargos';


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

--
-- Name: configuracion_bien; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_bien (
    id integer DEFAULT nextval('configuracion_bien_id_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    descripcion character varying(100),
    tipo character varying(50),
    status integer DEFAULT 1
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
-- Name: configuracion_equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_equipos (
    id integer NOT NULL,
    tipo character varying(60),
    descripcion character varying(60),
    status integer DEFAULT 1
);


ALTER TABLE configuracion_equipos OWNER TO postgres;

--
-- Name: TABLE configuracion_equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_equipos IS 'Tabla de configuración para Marcas, Modelos, descripción';


--
-- Name: configuracion_equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuracion_equipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuracion_equipos_id_seq OWNER TO postgres;

--
-- Name: configuracion_equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE configuracion_equipos_id_seq OWNED BY configuracion_equipos.id;


--
-- Name: dependencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dependencias_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE dependencias_id_seq OWNER TO postgres;

--
-- Name: dependencias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dependencias (
    id integer DEFAULT nextval('dependencias_id_seq'::regclass) NOT NULL,
    descripcion character varying(60),
    status integer,
    pertenece character varying(60)
);


ALTER TABLE dependencias OWNER TO postgres;

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
    serial character varying(30),
    color character varying(25),
    estado character varying(100),
    unidad_admin character varying(50),
    status integer,
    responsable character varying(50),
    caracteristicas character varying(150),
    fecha_modif timestamp without time zone,
    unidad_trabajo character varying(50),
    observaciones character varying(100),
    "serialSim" character varying(20),
    accesorios character varying(50),
    "planCelular" character varying(40),
    "numeroCelular" character varying(20),
    "estadoUsoEquipo" character varying(30),
    motivo character varying(150),
    "serialTelefono" character varying(17)
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
-- Name: niveles_usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE niveles_usuarios (
    id integer NOT NULL,
    codigo integer,
    nivel character varying(25)
);


ALTER TABLE niveles_usuarios OWNER TO postgres;

--
-- Name: TABLE niveles_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE niveles_usuarios IS 'Niveles de usuario del SCI';


--
-- Name: niveles_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE niveles_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE niveles_usuarios_id_seq OWNER TO postgres;

--
-- Name: niveles_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE niveles_usuarios_id_seq OWNED BY niveles_usuarios.id;


--
-- Name: numero_bien; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE numero_bien (
    id integer NOT NULL,
    numero_bien character varying(15),
    descripcion character varying(50),
    status integer
);


ALTER TABLE numero_bien OWNER TO postgres;

--
-- Name: numero_bien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numero_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE numero_bien_id_seq OWNER TO postgres;

--
-- Name: numero_bien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numero_bien_id_seq OWNED BY numero_bien.id;


--
-- Name: numero_biennns; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numero_biennns
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE numero_biennns OWNER TO postgres;

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
-- Name: personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE personal_id_seq OWNER TO postgres;

--
-- Name: reporteSolvencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "reporteSolvencia" (
    id integer NOT NULL,
    fecha timestamp without time zone
);


ALTER TABLE "reporteSolvencia" OWNER TO postgres;

--
-- Name: reportesolvencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reportesolvencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reportesolvencia_id_seq OWNER TO postgres;

--
-- Name: reportesolvencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reportesolvencia_id_seq OWNED BY "reporteSolvencia".id;


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
    nombres character varying(60),
    apellidos character varying(60),
    cedula integer,
    cargo character varying(60),
    unidad_trabajo character varying(60),
    unidad_admin character varying(50),
    fecha_creacion timestamp without time zone,
    fecha_modif timestamp without time zone,
    status integer
);


ALTER TABLE responsables OWNER TO postgres;

--
-- Name: TABLE responsables; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE responsables IS 'Tabla de responsables de uso de los bienes';


--
-- Name: COLUMN responsables.unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN responsables.unidad_trabajo IS 'Unidad de trabajo';


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
    id integer NOT NULL,
    descripcion character varying(60),
    status integer DEFAULT 1
);


ALTER TABLE unidad_admin OWNER TO postgres;

--
-- Name: TABLE unidad_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_admin IS 'Tabla de las unidades administrativas';


--
-- Name: unidad_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_admin_id_seq OWNER TO postgres;

--
-- Name: unidad_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_admin_id_seq OWNED BY unidad_admin.id;


--
-- Name: unidad_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_trabajo (
    id integer NOT NULL,
    descripcion character varying(60),
    status integer DEFAULT 1
);


ALTER TABLE unidad_trabajo OWNER TO postgres;

--
-- Name: TABLE unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_trabajo IS 'Tabla de las unidades de trabajo';


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
-- Name: unidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidades (
    id integer NOT NULL,
    descripcion character varying(60),
    status integer
);


ALTER TABLE unidades OWNER TO postgres;

--
-- Name: TABLE unidades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidades IS 'Tabla de los departamentos';


--
-- Name: unidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidades_id_seq OWNER TO postgres;

--
-- Name: unidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidades_id_seq OWNED BY unidades.id;


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
    primer_inicio integer,
    fecha_modif timestamp without time zone,
    pregunta character varying(20),
    respuesta character varying(20),
    ci_per character varying(12) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    correo character varying(70) NOT NULL,
    f_nac date,
    status integer NOT NULL,
    unidad_trabajo character varying(50),
    unidad_admin character varying(40),
    fecha_creacion timestamp without time zone
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY configuracion_equipos ALTER COLUMN id SET DEFAULT nextval('configuracion_equipos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY niveles_usuarios ALTER COLUMN id SET DEFAULT nextval('niveles_usuarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numero_bien ALTER COLUMN id SET DEFAULT nextval('numero_bien_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "reporteSolvencia" ALTER COLUMN id SET DEFAULT nextval('reportesolvencia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_admin ALTER COLUMN id SET DEFAULT nextval('unidad_admin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_trabajo ALTER COLUMN id SET DEFAULT nextval('unidad_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidades ALTER COLUMN id SET DEFAULT nextval('unidades_id_seq'::regclass);


--
-- Name: aignacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aignacion_id_seq', 1, false);


--
-- Name: aignación_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"aignación_id_seq"', 1, false);


--
-- Data for Name: bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bienes VALUES (1, '2000-00000', '12', '2010-00001', 'CELULAR', 2, 'VIT', 'EVOLUCION', 'AWDW432', '1', 2, '123213', 3, 1, '2016-06-06 10:35:15', '2', '2016-06-13', '2016-06-16', 'BIENES', 'NANCY MOGOLLÓN', 'NANCY MOGOLLÓN', 'NANCY MOGOLLÓN', 'ECSB');


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 1, true);


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, false);


--
-- Data for Name: catesp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catesp VALUES (1, '2010-00001', 'PRESIDENCIAL', 1, '2010-00000');
INSERT INTO catesp VALUES (2, '2014-00014', 'ESPECIALES', 1, '2014-00000');


--
-- Name: catesp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catesp_id_seq', 2, true);


--
-- Data for Name: catgen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catgen VALUES (1, '2000-00000', 'MUEBLES', 1);


--
-- Name: catgen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catgen_id_seq', 1, true);


--
-- Data for Name: configuracion_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_admin VALUES (1, 'SEDE', 'ECSB', 1);
INSERT INTO configuracion_admin VALUES (2, 'CARGO', 'GERENTE', 1);
INSERT INTO configuracion_admin VALUES (3, 'CARGO', 'COORDINADOR', 1);


--
-- Name: configuracion_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_admin_id_seq', 3, true);


--
-- Data for Name: configuracion_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_bien VALUES (1, 1, 'NEGRO', 'COLOR', 1);
INSERT INTO configuracion_bien VALUES (2, 2, 'ROJO', 'COLOR', 1);
INSERT INTO configuracion_bien VALUES (3, 3, 'AZUL', 'COLOR', 1);
INSERT INTO configuracion_bien VALUES (4, 1, 'ÓPTIMO', 'ESTADO DEL BIEN', 1);
INSERT INTO configuracion_bien VALUES (5, 2, 'DAÑADO', 'ESTADO DEL BIEN', 1);
INSERT INTO configuracion_bien VALUES (6, 3, 'REPARADO', 'ESTADO DEL BIEN', 1);
INSERT INTO configuracion_bien VALUES (7, 1, 'EN USO', 'ESTATUS DE USO DEL BIEN', 1);
INSERT INTO configuracion_bien VALUES (8, 2, 'POR ASIGNAR', 'ESTATUS DE USO DEL BIEN', 1);
INSERT INTO configuracion_bien VALUES (9, 1, 'FIBRA DE CARBONO', 'TIPO DE COMPONENTE', 1);


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 9, true);


--
-- Data for Name: configuracion_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_equipos VALUES (1, 'DESCRIPCIÓN', 'LAPTOP', 1);
INSERT INTO configuracion_equipos VALUES (2, 'DESCRIPCIÓN', 'CELULAR', 1);
INSERT INTO configuracion_equipos VALUES (3, 'DESCRIPCIÓN', 'COMPUTADORA', 1);
INSERT INTO configuracion_equipos VALUES (4, 'MARCA', 'SIRAGON', 1);
INSERT INTO configuracion_equipos VALUES (5, 'MARCA', 'VIT', 1);
INSERT INTO configuracion_equipos VALUES (6, 'MARCA', 'HP', 1);
INSERT INTO configuracion_equipos VALUES (7, 'MODELO', 'P2402', 1);
INSERT INTO configuracion_equipos VALUES (8, 'MODELO', 'PAVILION', 1);
INSERT INTO configuracion_equipos VALUES (9, 'MODELO', 'EVOLUCION', 1);


--
-- Name: configuracion_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_equipos_id_seq', 9, true);


--
-- Data for Name: dependencias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: dependencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dependencias_id_seq', 1, false);


--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_detalle_entrada_seq', 1, false);


--
-- Name: detalle_entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_seq', 1, false);


--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_detallle_salida_seq', 1, false);


--
-- Name: detalle_salida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_seq', 1, false);


--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipo VALUES (1, 'CELULAR', 'SIRAGON', 'EVOLUCION', '423aedw', 'NEGRO', 'ÓPTIMO', 'COORDINACIÓN', 1, 'LUIS LAVADO', '8GB, 2GB RAM, 1.9 GHZ', '2016-06-06 02:01:53', 'TELECOMUNICACIONES', 'NUEVO', '11234432', 'TODOS', 'FULL', '04121245215', 'EN USO', '', NULL);
INSERT INTO equipo VALUES (2, 'COMPUTADORA', 'VIT', 'P2402', 'a0001341', 'AZUL', 'ÓPTIMO', 'GERENCIA', 1, 'NANCY MOGOLLÓN', 'WDADW', '2016-06-06 02:06:58', 'FINANZAS', 'WADWD', '', '', '', '', 'EN USO', '', NULL);
INSERT INTO equipo VALUES (3, 'CELULAR', 'HP', 'EVOLUCION', '32rf324', 'ROJO', 'REPARADO', 'COORDINACIÓN', 1, 'NANCY MOGOLLÓN', 'WADWA12EWDA', '2016-06-06 03:05:07', 'BIENES', 'DASDWS', '21321441', 'DADWAD', 'FSDFE', '002133213', 'POR ASIGNAR', '', '1232112fa');


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_seq', 3, true);


--
-- Data for Name: niveles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: niveles_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('niveles_usuarios_id_seq', 1, false);


--
-- Data for Name: numero_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO numero_bien VALUES (1, '2-02', 'COMPUTACIÓN', 1);


--
-- Name: numero_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_bien_id_seq', 1, true);


--
-- Name: numero_biennns; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_biennns', 1, false);


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 1, false);


--
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_seq', 1, false);


--
-- Data for Name: reporteSolvencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "reporteSolvencia" VALUES (1, '2016-06-06 09:08:45');
INSERT INTO "reporteSolvencia" VALUES (2, '2016-06-06 09:39:20');
INSERT INTO "reporteSolvencia" VALUES (3, '2016-06-06 09:40:10');
INSERT INTO "reporteSolvencia" VALUES (4, '2016-06-06 09:41:38');
INSERT INTO "reporteSolvencia" VALUES (5, '2016-06-06 09:41:58');
INSERT INTO "reporteSolvencia" VALUES (6, '2016-06-06 09:46:52');
INSERT INTO "reporteSolvencia" VALUES (7, '2016-06-06 09:48:34');
INSERT INTO "reporteSolvencia" VALUES (8, '2016-06-06 09:52:15');
INSERT INTO "reporteSolvencia" VALUES (9, '2016-06-06 11:27:13');
INSERT INTO "reporteSolvencia" VALUES (10, '2016-06-06 11:41:39');


--
-- Name: reportesolvencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reportesolvencia_id_seq', 10, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO responsables VALUES (1, 'LUIS', 'LAVADO', 23603524, 'COORDINADOR', 'TELECOMUNICACIONES', 'COORDINACIÓN', '2016-06-06 01:59:51', '2016-06-06 01:59:51', 1);
INSERT INTO responsables VALUES (2, 'NANCY', 'MOGOLLÓN', 8587797, 'GERENTE', 'FINANZAS', 'GERENCIA', '2016-06-06 02:00:16', '2016-06-06 02:00:16', 1);


--
-- Name: responsables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('responsables_id_seq', 2, true);


--
-- Name: salida_id_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salida_id_salida_seq', 1, false);


--
-- Name: solvencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solvencia_id_seq', 1, false);


--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_categorias_bienes_id_seq', 1, false);


--
-- Data for Name: subcat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO subcat VALUES (1, '2010-00000', 'SILLA', 1, '2000-00000');
INSERT INTO subcat VALUES (2, '12', 'MESAS', 1, '2012-00000');
INSERT INTO subcat VALUES (3, '2014-00000', 'BANCOS', 1, '2000-00000');


--
-- Name: subcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subcat_id_seq', 3, true);


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 1, false);


--
-- Data for Name: unidad_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_admin VALUES (1, 'COORDINACIÓN', 1);
INSERT INTO unidad_admin VALUES (2, 'GERENCIA', 1);


--
-- Name: unidad_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_admin_id_seq', 2, true);


--
-- Data for Name: unidad_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_trabajo VALUES (1, 'TELECOMUNICACIONES', 1);
INSERT INTO unidad_trabajo VALUES (2, 'CCO', 1);
INSERT INTO unidad_trabajo VALUES (3, 'FINANZAS', 1);
INSERT INTO unidad_trabajo VALUES (4, 'BIENES', 1);


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_id_seq', 4, true);


--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: unidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidades_id_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'ADMIN', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, 1, '2016-06-06 03:11:03', '1', 'AQUI', '22333444', 'ADMINISTRADOR', 'PRUEBA', 'GERENTE', 4123334455, 'ADMIN@GMAIL.COM', '2016-06-05', 1, 'CCO', 'GERENCIA', '2016-06-06 13:01:20.715836');


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1, true);


--
-- Name: id_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT id_bienes PRIMARY KEY (id);


--
-- Name: id_cargen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY catgen
    ADD CONSTRAINT id_cargen PRIMARY KEY (id);


--
-- Name: id_cat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY catesp
    ADD CONSTRAINT id_cat PRIMARY KEY (id);


--
-- Name: id_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT id_equipo PRIMARY KEY (id);


--
-- Name: id_niveles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY niveles_usuarios
    ADD CONSTRAINT id_niveles PRIMARY KEY (id);


--
-- Name: pk_configadmin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_admin
    ADD CONSTRAINT pk_configadmin PRIMARY KEY (id);


--
-- Name: pk_configu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_bien
    ADD CONSTRAINT pk_configu PRIMARY KEY (id);


--
-- Name: pk_configuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_equipos
    ADD CONSTRAINT pk_configuracion PRIMARY KEY (id);


--
-- Name: pk_numero_bien; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numero_bien
    ADD CONSTRAINT pk_numero_bien PRIMARY KEY (id);


--
-- Name: pk_responsables; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT pk_responsables PRIMARY KEY (id);


--
-- Name: pk_subcat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcat
    ADD CONSTRAINT pk_subcat PRIMARY KEY (id);


--
-- Name: pk_unidad_trabajo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT pk_unidad_trabajo PRIMARY KEY (id);


--
-- Name: pk_unidades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dependencias
    ADD CONSTRAINT pk_unidades PRIMARY KEY (id);


--
-- Name: pk_uniddd; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT pk_uniddd PRIMARY KEY (id);


--
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);


--
-- Name: reporteSolvencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "reporteSolvencia"
    ADD CONSTRAINT "reporteSolvencia_pkey" PRIMARY KEY (id);


--
-- Name: un_adminn; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_admin
    ADD CONSTRAINT un_adminn UNIQUE (descripcion);


--
-- Name: un_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT un_cedula UNIQUE (ci_per);


--
-- Name: un_correo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT un_correo UNIQUE (correo);


--
-- Name: un_descrp; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_bien
    ADD CONSTRAINT un_descrp UNIQUE (descripcion);


--
-- Name: un_responsable; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT un_responsable UNIQUE (cedula);


--
-- Name: un_unidades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT un_unidades UNIQUE (descripcion);


--
-- Name: un_unidadesdep; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dependencias
    ADD CONSTRAINT un_unidadesdep UNIQUE (descripcion);


--
-- Name: unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades
    ADD CONSTRAINT unidades_pkey PRIMARY KEY (id);


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

