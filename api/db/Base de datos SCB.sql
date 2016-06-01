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
-- Name: configuracion_equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_equipos (
    id integer NOT NULL,
    tipo character varying(60),
    descripcion character varying(60)
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
-- Name: configuracion_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_admin (
    id integer DEFAULT nextval('configuracion_equipos_id_seq'::regclass) NOT NULL,
    tipo character varying(60),
    descripcion character varying(60)
);


ALTER TABLE configuracion_admin OWNER TO postgres;

--
-- Name: TABLE configuracion_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_admin IS 'Tabla de configuración para Marcas, Modelos, descripción';


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
-- Name: detalles_configuracion_bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalles_configuracion_bienes (
    id integer NOT NULL,
    descripcion character varying(60)
);


ALTER TABLE detalles_configuracion_bienes OWNER TO postgres;

--
-- Name: TABLE detalles_configuracion_bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE detalles_configuracion_bienes IS 'Detalles para los tipos de configuración de bienes';


--
-- Name: detalles_configuracion_bienes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalles_configuracion_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalles_configuracion_bienes_id_seq OWNER TO postgres;

--
-- Name: detalles_configuracion_bienes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalles_configuracion_bienes_id_seq OWNED BY detalles_configuracion_bienes.id;


--
-- Name: detalles_configuración_equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "detalles_configuración_equipos" (
    id integer NOT NULL,
    descripcion character varying(60)
);


ALTER TABLE "detalles_configuración_equipos" OWNER TO postgres;

--
-- Name: TABLE "detalles_configuración_equipos"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "detalles_configuración_equipos" IS 'Tabla para los tipos de configuración de los equipos';


--
-- Name: detalles_configuración_equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "detalles_configuración_equipos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "detalles_configuración_equipos_id_seq" OWNER TO postgres;

--
-- Name: detalles_configuración_equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "detalles_configuración_equipos_id_seq" OWNED BY "detalles_configuración_equipos".id;


--
-- Name: detalles_configuración_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "detalles_configuración_admin" (
    id integer DEFAULT nextval('"detalles_configuración_equipos_id_seq"'::regclass) NOT NULL,
    descripcion character varying(60)
);


ALTER TABLE "detalles_configuración_admin" OWNER TO postgres;

--
-- Name: TABLE "detalles_configuración_admin"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "detalles_configuración_admin" IS 'Tabla para los tipos de configuración de los equipos';


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
    serial character varying(30) NOT NULL,
    color character varying(25),
    estado character varying(100),
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
    "numeroCelular" character varying(20),
    "estadoUsoEquipo" character varying(30),
    motivo character varying(150)
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
    descripcion character varying(50)
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
    descripcion character varying(60)
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
    descripcion character varying(60)
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

ALTER TABLE ONLY detalles_configuracion_bienes ALTER COLUMN id SET DEFAULT nextval('detalles_configuracion_bienes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "detalles_configuración_equipos" ALTER COLUMN id SET DEFAULT nextval('"detalles_configuración_equipos_id_seq"'::regclass);


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

INSERT INTO bienes VALUES (25, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', 'SCDWWEQ243', '1', 1, '02', 1, 1, '2016-05-19 11:09:23', '3', '2016-05-01', '2016-05-02', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (26, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 3, 'HUAWEI', 'EDX-443', 'efes324', '1', 1, '2', 12, 1, '2016-05-20 02:26:21', '3', '2016-05-01', '2016-05-03', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (27, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 3, 'HUAWEI', 'EDX-443', 'efes325', '1', 1, '2', 12, 1, '2016-05-20 02:26:33', '3', '2016-05-01', '2016-05-03', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (28, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 3, 'HUAWEI', 'EDX-443', 'efes326', '1', 1, '02', 12, 1, '2016-05-20 02:27:45', '3', '2016-05-01', '2016-05-03', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (30, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'NO APLICA', '33334', '1', 1, '3', 12, 1, '2016-05-23 11:47:50', '3', '2016-05-09', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (31, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'NO APLICA', '3333433', '1', 1, '2-0100', 12, 1, '2016-05-23 11:49:06', '3', '2016-05-09', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (32, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'NO APLICA', '333343333', '1', 1, '3', 12, 1, '2016-05-23 11:51:13', '3', '2016-05-09', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (33, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'NO APLICA', 'S3', '1', 1, '5', 12, 1, '2016-05-23 11:51:26', '3', '2016-05-09', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (34, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', 'SDASD', '1', 1, '2-0100', 12, 1, '2016-05-23 01:13:21', '3', '2016-05-11', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (35, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', 'SDASDH', '1', 1, '2-0100', 12, 1, '2016-05-23 01:14:27', '3', '2016-05-11', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (36, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', 'QQ', '1', 1, '2-0100', 12, 1, '2016-05-23 01:15:29', '3', '2016-05-11', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (37, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', 'QQ4', '1', 1, '2-0100', 12, 1, '2016-05-23 01:15:59', '3', '2016-05-11', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (38, '2000-00000', '2010-00000', '2010-00001', 'CELULAR', 1, 'HUAWEI', 'EDX-443', '33232', '1', 1, '2-0100', 12, 1, '2016-05-23 01:16:35', '3', '2016-05-11', '2016-05-25', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (39, '2000-00000', '2010-00000', '2010-00001', 'CELULAR', 1, 'HUAWEI', 'EDX-443', 'SDSW3', '1', 1, '2-0100', 12, 1, '2016-05-23 01:18:07', '3', '2016-05-11', '2016-05-25', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (40, '2000-00000', '2010-00000', '2010-00001', 'CELULAR', 1, 'HUAWEI', 'EDX-443', '112', '1', 1, '2-0100', 12, 1, '2016-05-23 01:19:53', '3', '2016-05-11', '2016-05-25', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'LUIS LAVADO', 'LUIS LAVADO', 'ECSB');
INSERT INTO bienes VALUES (29, '2000-00000', '2010-00000', '2010-00001', 'LAPTOP', 1, 'HUAWEI', 'EDX-443', '3333', '1', 1, '2-0100', 12, 1, '2016-05-24 02:04:20', '3', '2016-05-09', '2016-05-17', 'TELECOMUNICACIONES', 'LUIS LAVADO', 'NO APLICA', 'NO APLICA', 'ECSB');


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 40, true);


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, true);


--
-- Data for Name: catesp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catesp VALUES (2, '2010-00001', 'RECLINABLE', 1, '2010-00000');


--
-- Name: catesp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catesp_id_seq', 2, true);


--
-- Data for Name: catgen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO catgen VALUES (6, '2000-00000', 'MUEBLES', 1);


--
-- Name: catgen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catgen_id_seq', 6, true);


--
-- Data for Name: configuracion_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_admin VALUES (13, 'SEDE', 'ECSB');
INSERT INTO configuracion_admin VALUES (17, 'CARGO', 'GERENTE');


--
-- Data for Name: configuracion_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_bien VALUES (100, 1, 'BLANCO/MARRÓN', 'COLOR');
INSERT INTO configuracion_bien VALUES (101, 1, 'PLÁSTICO', 'TIPO DE COMPONENTE');
INSERT INTO configuracion_bien VALUES (102, 1, 'EN USO', 'ESTATUS DE USO DEL BIEN');
INSERT INTO configuracion_bien VALUES (103, 12, 'ÓPTIMO', 'ESTADO DEL BIEN');
INSERT INTO configuracion_bien VALUES (104, 3, 'EN PROCESO DE DISPOCISIÓN', 'ESTATUS DE USO DEL BIEN');


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 104, true);


--
-- Data for Name: configuracion_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_equipos VALUES (18, 'MODELO', 'EDX-443');
INSERT INTO configuracion_equipos VALUES (19, 'MARCA', 'HUAWEI');
INSERT INTO configuracion_equipos VALUES (20, 'DESCRIPCIÓN', 'LAPTOP');
INSERT INTO configuracion_equipos VALUES (21, 'DESCRIPCIÓN', 'CELULAR');


--
-- Name: configuracion_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_equipos_id_seq', 21, true);


--
-- Data for Name: dependencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dependencias VALUES (1, 'GERENCIA DE TELECOMUNICACIONES', NULL, 'GERENCIA DE TELECOMUNICACIONES');


--
-- Name: dependencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dependencias_id_seq', 1, true);


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
-- Data for Name: detalles_configuracion_bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detalles_configuracion_bienes VALUES (7, 'ESTATUS DE USO DEL BIEN');
INSERT INTO detalles_configuracion_bienes VALUES (8, 'ESTADO DEL BIEN');
INSERT INTO detalles_configuracion_bienes VALUES (9, 'COLOR');
INSERT INTO detalles_configuracion_bienes VALUES (10, 'TIPO DE COMPONENTE');


--
-- Name: detalles_configuracion_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_configuracion_bienes_id_seq', 10, true);


--
-- Data for Name: detalles_configuración_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "detalles_configuración_admin" VALUES (18, 'SEDE');
INSERT INTO "detalles_configuración_admin" VALUES (19, 'CARGO');


--
-- Data for Name: detalles_configuración_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "detalles_configuración_equipos" VALUES (20, 'MODELO');
INSERT INTO "detalles_configuración_equipos" VALUES (21, 'MARCA');
INSERT INTO "detalles_configuración_equipos" VALUES (22, 'DESCRIPCIÓN');


--
-- Name: detalles_configuración_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"detalles_configuración_equipos_id_seq"', 22, true);


--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipo VALUES (12, 'LAPTOP', 'HUAWEI', 'EDX-443', '3333', 'BLANCO/MARRÓN', 'ÓPTIMO', 'GERENCIA', 1, 'LUIS LAVADO', '2GB RAM', '2016-05-24 02:07:42', 'TELECOMUNICACIONES', 'NUEVO', '', '', '', '', 'EN USO', '');
INSERT INTO equipo VALUES (13, 'CELULAR', 'HUAWEI', 'EDX-443', 'dwadwa423', 'BLANCO/MARRÓN', 'ÓPTIMO', 'GERENCIA', 1, 'NO APLICA', 'OCTACORE', '2016-05-24 02:12:41', 'TELECOMUNICACIONES', '', '2412421', 'AUDÍFONOS', 'FULL', '04161112233', 'EN PROCESO DE DISPOCISIÓN', '');


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_seq', 13, true);


--
-- Data for Name: niveles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO niveles_usuarios VALUES (2, 1, 'Administrador de Bienes');
INSERT INTO niveles_usuarios VALUES (1, 0, 'Administrador del sistema');
INSERT INTO niveles_usuarios VALUES (3, 2, 'Encargado de bienes');
INSERT INTO niveles_usuarios VALUES (4, 3, 'Responsable de bienes');


--
-- Name: niveles_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('niveles_usuarios_id_seq', 4, true);


--
-- Data for Name: numero_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO numero_bien VALUES (1, '2-0100', 'COMPUTACIÓN');


--
-- Name: numero_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_bien_id_seq', 3, true);


--
-- Name: numero_biennns; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_biennns', 0, true);


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 7, true);


--
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_seq', 22, true);


--
-- Data for Name: reporteSolvencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "reporteSolvencia" VALUES (1, '2016-05-26 10:18:59');
INSERT INTO "reporteSolvencia" VALUES (2, '2016-05-26 10:20:41');
INSERT INTO "reporteSolvencia" VALUES (3, '2016-05-26 10:21:04');
INSERT INTO "reporteSolvencia" VALUES (4, '2016-05-26 10:22:03');
INSERT INTO "reporteSolvencia" VALUES (5, '2016-05-26 10:22:37');
INSERT INTO "reporteSolvencia" VALUES (6, '2016-05-26 10:23:24');
INSERT INTO "reporteSolvencia" VALUES (7, '2016-05-26 10:24:21');
INSERT INTO "reporteSolvencia" VALUES (8, '2016-05-26 10:25:51');
INSERT INTO "reporteSolvencia" VALUES (9, '2016-05-26 10:26:22');
INSERT INTO "reporteSolvencia" VALUES (10, '2016-05-26 10:28:36');
INSERT INTO "reporteSolvencia" VALUES (11, '2016-05-26 10:29:30');
INSERT INTO "reporteSolvencia" VALUES (12, '2016-05-26 10:30:23');
INSERT INTO "reporteSolvencia" VALUES (13, '2016-05-26 10:32:30');
INSERT INTO "reporteSolvencia" VALUES (14, '2016-05-26 10:32:56');
INSERT INTO "reporteSolvencia" VALUES (15, '2016-05-26 10:34:53');
INSERT INTO "reporteSolvencia" VALUES (16, '2016-05-26 10:36:31');
INSERT INTO "reporteSolvencia" VALUES (17, '2016-05-26 11:08:31');
INSERT INTO "reporteSolvencia" VALUES (18, '2016-05-26 11:12:05');
INSERT INTO "reporteSolvencia" VALUES (19, '2016-05-26 11:14:46');
INSERT INTO "reporteSolvencia" VALUES (20, '2016-05-26 11:16:38');
INSERT INTO "reporteSolvencia" VALUES (21, '2016-05-26 11:17:47');
INSERT INTO "reporteSolvencia" VALUES (22, '2016-05-26 11:18:49');
INSERT INTO "reporteSolvencia" VALUES (23, '2016-05-26 11:21:41');


--
-- Name: reportesolvencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reportesolvencia_id_seq', 23, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO responsables VALUES (2, 'LUIS', 'LAVADO', 23603524, 'GERENTE', 'TELECOMUNICACIONES', 'GERENCIA', '2016-05-19 08:27:18', '2016-05-19 08:27:18', 1);


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

SELECT pg_catalog.setval('sub_categorias_bienes_id_seq', 5, true);


--
-- Data for Name: subcat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO subcat VALUES (8, '2010-00000', 'NORMAL', 1, '2000-00000');


--
-- Name: subcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subcat_id_seq', 8, true);


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 1, false);


--
-- Data for Name: unidad_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_admin VALUES (3, 'GERENCIA');


--
-- Name: unidad_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_admin_id_seq', 3, true);


--
-- Data for Name: unidad_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_trabajo VALUES (3, 'TELECOMUNICACIONES');


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_id_seq', 3, true);


--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidades VALUES (1, 'GERENCIA DE TELECOMUNICACIONES', NULL);


--
-- Name: unidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidades_id_seq', 1, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (23, 'luisrlavado', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, 1, '2016-05-24 08:41:57', '1', '1231', '1231412', 'DAWDW', 'DWNDO', 'GERENTE', 12345, 'DWADWA@GMAIL.COM', '1992-05-20', 1, 'TELECOMUNICACIONES', 'GERENCIA', '2016-05-24 08:41:24');
INSERT INTO usuario VALUES (22, 'ADMIN', '8cb2237d0679ca88db6464eac60da96345513964', 0, 1, '2016-05-26 08:14:49', '1', 'BIEN', '11223344', 'Luis', 'Lavado', 'Gerente', 4167390457, 'LUIS@GMAIL.COM', '2016-05-23', 1, '1', '2', '2016-05-24 15:20:55.327181');


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 23, true);


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
-- Name: pk_admin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "detalles_configuración_admin"
    ADD CONSTRAINT pk_admin PRIMARY KEY (id);


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
-- Name: pk_configuracion_admin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_admin
    ADD CONSTRAINT pk_configuracion_admin PRIMARY KEY (id);


--
-- Name: pk_detalles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "detalles_configuración_equipos"
    ADD CONSTRAINT pk_detalles PRIMARY KEY (id);


--
-- Name: pk_detalles_1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalles_configuracion_bienes
    ADD CONSTRAINT pk_detalles_1 PRIMARY KEY (id);


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
-- Name: un_numero_bien; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numero_bien
    ADD CONSTRAINT un_numero_bien UNIQUE (numero_bien);


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

