--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cargos (
    id integer NOT NULL,
    cargo character varying(50)
);


ALTER TABLE cargos OWNER TO postgres;

--
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargos_id_seq OWNER TO postgres;

--
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cargos_id_seq OWNED BY cargos.id;


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
    "descripción" character varying(60)
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
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personal (
    id integer DEFAULT nextval('personal_id_seq'::regclass) NOT NULL,
    ci_per character varying(12) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    correo character varying(50) NOT NULL,
    f_nac date,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    status integer,
    unidad_trabajo character varying(50),
    id_usuario integer,
    unidad_admin character varying(40)
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
    fecha_modif timestamp without time zone
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
-- Name: sedes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sedes (
    id integer NOT NULL,
    sede character varying(60)
);


ALTER TABLE sedes OWNER TO postgres;

--
-- Name: sedes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sedes_id_seq OWNER TO postgres;

--
-- Name: sedes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sedes_id_seq OWNED BY sedes.id;


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
    codigo integer NOT NULL,
    descripcion character varying(60)
);


ALTER TABLE unidad_admin OWNER TO postgres;

--
-- Name: TABLE unidad_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_admin IS 'Tabla de las unidades administrativas';


--
-- Name: unidad_admin_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_admin_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_admin_codigo_seq OWNER TO postgres;

--
-- Name: unidad_admin_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_admin_codigo_seq OWNED BY unidad_admin.codigo;


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
    codigo integer NOT NULL,
    descripcion character varying(60)
);


ALTER TABLE unidad_trabajo OWNER TO postgres;

--
-- Name: TABLE unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_trabajo IS 'Tabla de las unidades de trabajo';


--
-- Name: unidad_trabajo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_trabajo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_trabajo_codigo_seq OWNER TO postgres;

--
-- Name: unidad_trabajo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_trabajo_codigo_seq OWNED BY unidad_trabajo.codigo;


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
    primer_inicio integer,
    fecha_modif timestamp without time zone
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

ALTER TABLE ONLY cargos ALTER COLUMN id SET DEFAULT nextval('cargos_id_seq'::regclass);


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

ALTER TABLE ONLY sedes ALTER COLUMN id SET DEFAULT nextval('sedes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_admin ALTER COLUMN id SET DEFAULT nextval('unidad_admin_id_seq'::regclass);


--
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_admin ALTER COLUMN codigo SET DEFAULT nextval('unidad_admin_codigo_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_trabajo ALTER COLUMN id SET DEFAULT nextval('unidad_trabajo_id_seq'::regclass);


--
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_trabajo ALTER COLUMN codigo SET DEFAULT nextval('unidad_trabajo_codigo_seq'::regclass);


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
-- Name: auditoria_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_seq', 1, false);


--
-- Data for Name: bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY bienes (id, cod_general, cod_subcat, cod_catespf, descripcion, estatus_uso_bien, marca, modelo, serial, tipo_comp, colores, num_bien, estado_bien, status, fecha_modif, cat_unid_admin, per_ini, per_culm, unidad_trabajo, responsable_pa, responsable_ad, responsable_uso, sede) FROM stdin;
17	12	122	23	Computadora	1	Siragon	Men	112233	1	1	11223344	1	1	2016-05-09 14:31:50.527912	2	2016-05-01	2016-05-02	Telecomunicaciones 	Transbar Ca	Transbar Ca	Transbar Ca	\N
18	123456	12343	21213	wdiawd	3	dwadaw	dwad	ffer23	2	4	2134	3	1	2016-05-09 14:36:36.13766	4	2016-05-11	2016-05-21	Presidencia	Jose Figuera	Jose Figuera	Transbar Ca	\N
19	121213	12234	21213	wdwdwadwa	1	wadwa	wadawd	1112233	1	16	1112233	1	1	2016-05-10 12:49:56.353963	7	2016-05-01	2016-05-02	Compras	Transbar Ca	Luis Lavado	Transbar Ca	\N
20	12	12343	23	adwadwa	4	ddawd	awdwa	awdwad	1	3	445566	4	1	2016-05-12 01:20:39	5	2016-05-01	2016-05-02	Telecomunicaciones 	Luis Ricardo Lavado Mogollón	Luis Ricardo Lavado Mogollón	Jose Figuera	awdwad
24	12	12343	23	adwadwa	4	ddawd	awdwa	awdwade	1	3	445566	4	1	2016-05-12 01:24:50	5	2016-05-01	2016-05-02	Telecomunicaciones 	Luis Ricardo Lavado Mogollón	Luis Ricardo Lavado Mogollón	Jose Figuera	awdwad
\.
INSERT INTO bienes VALUES (17, '12', '122', '23', 'Computadora', 1, 'Siragon', 'Men', '112233', '1', 1, '11223344', 1, 1, '2016-05-09 14:31:50.527912', '2', '2016-05-01', '2016-05-02', 'Telecomunicaciones ', 'Transbar Ca', 'Transbar Ca', 'Transbar Ca', NULL);
INSERT INTO bienes VALUES (18, '123456', '12343', '21213', 'wdiawd', 3, 'dwadaw', 'dwad', 'ffer23', '2', 4, '2134', 3, 1, '2016-05-09 14:36:36.13766', '4', '2016-05-11', '2016-05-21', 'Presidencia', 'Jose Figuera', 'Jose Figuera', 'Transbar Ca', NULL);
INSERT INTO bienes VALUES (19, '121213', '12234', '21213', 'wdwdwadwa', 1, 'wadwa', 'wadawd', '1112233', '1', 16, '1112233', 1, 1, '2016-05-10 12:49:56.353963', '7', '2016-05-01', '2016-05-02', 'Compras', 'Transbar Ca', 'Luis Lavado', 'Transbar Ca', NULL);
INSERT INTO bienes VALUES (20, '12', '12343', '23', 'adwadwa', 4, 'ddawd', 'awdwa', 'awdwad', '1', 3, '445566', 4, 1, '2016-05-12 01:20:39', '5', '2016-05-01', '2016-05-02', 'Telecomunicaciones ', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Jose Figuera', 'awdwad');
INSERT INTO bienes VALUES (24, '12', '12343', '23', 'adwadwa', 4, 'ddawd', 'awdwa', 'awdwade', '1', 3, '445566', 4, 1, '2016-05-12 01:24:50', '5', '2016-05-01', '2016-05-02', 'Telecomunicaciones ', 'Luis Ricardo Lavado Mogollón', 'Luis Ricardo Lavado Mogollón', 'Jose Figuera', 'awdwad');


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 24, true);


--
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cargos (id, cargo) FROM stdin;
\.


--
-- Name: cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cargos_id_seq', 1, false);


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, true);


--
-- Data for Name: catesp; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY catesp (id, codigo, descripcion, status, subcat) FROM stdin;
2	23	wwad	1	1
1	21213	Pequeño	1	12234
\.
INSERT INTO catesp VALUES (2, '23', 'wwad', 1, '1');
INSERT INTO catesp VALUES (1, '21213', 'Pequeño', 1, '12234');


--
-- Name: catesp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catesp_id_seq', 1, true);


--
-- Data for Name: catgen; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY catgen (id, codigo, descripcion, status) FROM stdin;
1	12	Escoba	1
2	1234	dwd	1
3	12343	dwd	1
4	123456	Fieltro	1
5	121213	Caucho	1
\.
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


COPY configuracion_bien (id, codigo, descripcion, tipo) FROM stdin;
1	1	Negro	Color
2	2	Azul	Color
3	3	Palo Rosa	Color
4	4	Naranja	Color
5	5	Verde	Color
6	6	BEIGE	Color
7	7	CROMÁTICO	Color
8	8	VINOTINTO	Color
9	9	GRIS/NEGRO	Color
10	10	PLATEADO	Color
11	11	BEIGE AUSTRALIA	Color
12	12	PLATEADO FERROSO	Color
13	13	PERLA	Color
14	14	BEIGE OLÍMPICO	Color
15	15	ARENA METALIZADO	Color
16	16	PLATA	Color
17	17	ROJO	Color
18	18	AMARILLO	Color
19	19	BEIGE DUNA	Color
21	21	AZUL/BEIGE	Color
22	22	MARRÓN/BEIGE	Color
23	23	VERDE ESMERALDA	Color
24	24	PLATA CLARO	Color
25	25	PLATEADO BRILLANTE	Color
26	26	MARRÓN PARDILLO BICAPA	Color
27	27	GRIS PALMERA	Color
28	28	DORADO	Color
29	29	MADERA NATURAL	Color
30	30	NEGRO/AMARILLO MOSTAZA	Color
31	31	MARRÓN	Color
32	32	BLANCO	Color
33	33	GRIS	Color
34	34	AZUL/GRIS	Color
35	35	AZUL/NEGRO	Color
36	36	ACERO	Color
37	37	OTRO COLOR	Color
20	20	MARRÓN/NEGRO	Color
39	1	Compra Directa (por consulta de Precio)	Forma de Adquisición del Bien
40	2	Permuta	Forma de Adquisición del Bien
41	3	Dación en pago	Forma de Adquisición del Bien
42	4	Donación	Forma de Adquisición del Bien
43	5	Transferencia	Forma de Adquisición del Bien
44	6	Expropiación	Forma de Adquisición del Bien
45	7	Confiscación	Forma de Adquisición del Bien
46	8	Compra por Concurso Abierto	Forma de Adquisición del Bien
47	9	Compra por Concurso Cerrado	Forma de Adquisición del Bien
48	10	Adjudicación	Forma de Adquisición del Bien
49	1	En uso	Estatus de Uso del Bien
50	2	En comodato	Estatus de Uso del Bien
51	3	En arrendamiento	Estatus de Uso del Bien
52	4	En mantenimiento	Estatus de Uso del Bien
53	5	En reparación	Estatus de Uso del Bien
54	6	En proceso de disposición	Estatus de Uso del Bien
55	7	En desuso por obsolescencia	Estatus de Uso del Bien
56	8	En desuso por inservibilidad	Estatus de Uso del Bien
57	9	En desuso por obsolescencia e inservibilidad	Estatus de Uso del Bien
58	10	En Almacén o Depósito para su asignación	Estatus de Uso del Bien
59	11	Otro uso	Estatus de Uso del Bien
60	1	Óptimo	Estado del Bien
61	2	Regular	Estado del Bien
62	3	Deteriorado	Estado del Bien
63	4	Averiado	Estado del Bien
64	5	Chatarra	Estado del Bien
65	6	No operativo	Estado del Bien
66	7	Otra condición física	Estado del Bien
68	2	Despacho del Vicepresidente	Categoría de Unidades Administrativas
69	3	Despacho del Ministro	Categoría de Unidades Administrativas
70	4	Despacho Viceministro	Categoría de Unidades Administrativas
71	5	Dirección General	Categoría de Unidades Administrativas
72	6	Dirección de Linea	Categoría de Unidades Administrativas
73	7	Coordinación	Categoría de Unidades Administrativas
74	8	División	Categoría de Unidades Administrativas
75	9	Departamento	Categoría de Unidades Administrativas
76	10	Presidencia	Categoría de Unidades Administrativas
77	11	Gerencia General	Categoría de Unidades Administrativas
78	12	Gerencia	Categoría de Unidades Administrativas
79	13	Sub-Gerencia	Categoría de Unidades Administrativas
80	14	Despacho del Superintendente	Categoría de Unidades Administrativas
81	15	Dirección General Adjunta	Categoría de Unidades Administrativas
82	16	Intendencia	Categoría de Unidades Administrativas
83	17	Unidad Ad-Hoc	Categoría de Unidades Administrativas
84	18	Área Organizacional	Categoría de Unidades Administrativas
85	19	Área de Trabajo	Categoría de Unidades Administrativas
86	20	Otra categoría de Unidad	Categoría de Unidades Administrativas
67	1	Despacho del Presidente	Categoría de Unidades Administrativas
90	4	Compras	Unidad de Trabajo
89	3	Presidencia	Unidad de Trabajo
91	5	Recaudación	Unidad de Trabajo
87	1	CCO	Unidad de Trabajo
88	2	Telecomunicaciones	Unidad de Trabajo
\.
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
INSERT INTO configuracion_bien VALUES (90, 4, 'Compras', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (89, 3, 'Presidencia', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (91, 5, 'Recaudación', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (87, 1, 'CCO', 'Unidad de Trabajo');
INSERT INTO configuracion_bien VALUES (88, 2, 'Telecomunicaciones', 'Unidad de Trabajo');


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 92, true);


--
-- Data for Name: configuracion_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY configuracion_equipos (id, tipo, "descripción") FROM stdin;
\.


--
-- Name: configuracion_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_equipos_id_seq', 1, false);


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

COPY detalles_configuracion_bienes (id, descripcion) FROM stdin;
\.


--
-- Name: detalles_configuracion_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_configuracion_bienes_id_seq', 1, false);


--
-- Data for Name: detalles_configuración_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "detalles_configuración_equipos" (id, descripcion) FROM stdin;
\.


--
-- Name: detalles_configuración_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"detalles_configuración_equipos_id_seq"', 1, false);


--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY equipo (id, descripcion, marca, modelo, serial, color, estado, unidad_admin, status, responsable, caracteristicas, fecha_modif, unidad_trabajo, observaciones, "serialSim", accesorios, "planCelular", "numeroCelular", "estadoUsoEquipo", motivo) FROM stdin;
1	celular	HP	PAvilon	12341	Azul	Regular	Presidencia	1	Transbar Ca	Todas	2016-05-03 02:12:21	Compras	Ninguna	123213	Todos	Full	32131321	\N	\N
4	awdaw	awdwa	wadaw	awdwadwa	Palo Rosa	Chatarra	Intendencia	0	Jose Figuera	awdwad	2016-05-12 01:26:09	Compras						\N	\N
3	celular	Epson	Pavilon	323213213	Negro	Regular	Gerencia General	1	Luis Ricardo Lavado Mogollón	dwadwad	2016-05-13 02:38:21	Recaudación	adwwad	4324324	wadhawdhawgb	esfefaedwdwa	4324324324	En proceso de disposición	ddwadwadwa
2	efes	sefs	efs	1234	Negro	Óptimo	Dirección General	1	Luis Ricardo Lavado Mogollón	esfesf	2016-05-16 10:05:47	Telecomunicaciones 	\N					En proceso de disposición	\N
\.
INSERT INTO equipo VALUES (1, 'celular', 'HP', 'PAvilon', '12341', 'Azul', 'Regular', 'Presidencia', 1, 'Transbar Ca', 'Todas', '2016-05-03 02:12:21', 'Compras', 'Ninguna', '123213', 'Todos', 'Full', '32131321', NULL, NULL);
INSERT INTO equipo VALUES (4, 'awdaw', 'awdwa', 'wadaw', 'awdwadwa', 'Palo Rosa', 'Chatarra', 'Intendencia', 0, 'Jose Figuera', 'awdwad', '2016-05-12 01:26:09', 'Compras', '', '', '', '', '', NULL, NULL);
INSERT INTO equipo VALUES (3, 'celular', 'Epson', 'Pavilon', '323213213', 'Negro', 'Regular', 'Gerencia General', 1, 'Luis Ricardo Lavado Mogollón', 'dwadwad', '2016-05-13 02:38:21', 'Recaudación', 'adwwad', '4324324', 'wadhawdhawgb', 'esfefaedwdwa', '4324324324', 'En proceso de disposición', 'ddwadwadwa');
INSERT INTO equipo VALUES (2, 'efes', 'sefs', 'efs', '1234', 'Negro', 'Óptimo', 'Dirección General', 1, 'Luis Ricardo Lavado Mogollón', 'esfesf', '2016-05-16 10:05:47', 'Telecomunicaciones ', NULL, '', '', '', '', 'En proceso de disposición', NULL);


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_seq', 4, true);


--
-- Data for Name: niveles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY niveles_usuarios (id, codigo, nivel) FROM stdin;
2	1	Administrador de Bienes
1	0	Administrador del sistema
3	2	Encargado de bienes
4	3	Responsable de bienes
\.
INSERT INTO niveles_usuarios VALUES (1, 0, 'Administrados');
INSERT INTO niveles_usuarios VALUES (2, 1, 'Administrador de Bienes');
INSERT INTO niveles_usuarios VALUES (3, 2, 'Regular de bienes');
INSERT INTO niveles_usuarios VALUES (4, 3, 'Responsable');


--
-- Name: niveles_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('niveles_usuarios_id_seq', 4, true);


--
-- Data for Name: numero_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numero_bien (id, numero_bien, descripcion) FROM stdin;
\.


--
-- Name: numero_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_bien_id_seq', 1, false);


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personal (id, ci_per, nombres, apellidos, cargo, telf_pers, correo, f_nac, fecha_creacion, fecha_modif, status, unidad_trabajo, id_usuario, unidad_admin) FROM stdin;
4	11223344	Luis	Lavado	1	232132131	transbarca@gmail.com	1996-05-31	2016-05-09 10:19:09	2016-05-09 10:19:09	1	\N	7	\N
5	1122334	Juan	Juans	1	11232	wadwad@gmail.com	1986-05-21	2016-05-12 10:09:33	2016-05-12 10:09:33	1	\N	8	12
6	12321	dwadwa	feafwa	1	21321	wwdwada@gmai.com	1993-05-20	2016-05-12 10:12:09	2016-05-12 10:12:09	1	\N	9	3
7	21321	wadwaaw	dawd	1	2121321	daw@fmda.com	1993-05-18	2016-05-12 10:15:11	2016-05-12 10:15:11	1	\N	10	Gerencia
14	2432423	dwadwawa	dwaaw	dwa	24324	adw	2016-05-11	2016-05-12 22:24:00.47127	2016-05-12 22:24:00.47127	1	dawda	12	wdwa
15	1242341	adwa	awdwa	1	3242341	dwaadwa@gmaol.com	1996-05-21	2016-05-12 10:24:23	2016-05-12 10:24:23	1	\N	13	Dirección General
16	1231415	awdawdwa	dwadwa	1	3213123	wdwadw@gmail.com	2016-05-01	2016-05-13 08:43:52	2016-05-13 08:43:52	1	\N	14	Despacho Viceministro
17	1231115	dadwa	dwadwa	1	3213123	wdwad2@gmail.com	2016-05-01	2016-05-13 08:45:34	2016-05-13 08:45:34	1	Telecomunicaciones 	15	Despacho Viceministro
1	23603524	Luis Ricardo	Lavado Mogollón	sefsefes	432423	adwad	2016-04-05	2016-04-06 15:08:05.893788	2016-04-07 10:24:58.850254	1	Telecomunicaciones	1	Coordinación
18	221234	DWADWA	aefesrrs	2	2133123	awdwa@gmail.com	1974-05-21	2016-05-13 02:26:43	2016-05-13 02:26:43	1	Presidencia	16	Despacho Viceministro
2	11235813	Jose	Figuera	Gerente	324421	nifnig@fig.com	2016-04-25	2016-04-26 08:54:42.243163	2016-05-16 10:11:58	1	CCO	2	Gerencia
3	123213	Transbar	Ca	Gerente	2432423	transbarca@transbarca.con	1985-05-14	2016-05-03 11:23:54	2016-05-16 10:15:55	1	Presidencia	\N	Presidencia
\.
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personal VALUES (4, '11223344', 'Luis', 'Lavado', '1', 232132131, 'transbarca@gmail.com', '1996-05-31', '2016-05-09 10:19:09', '2016-05-09 10:19:09', 1, NULL, 7, NULL);
INSERT INTO personal VALUES (5, '1122334', 'Juan', 'Juans', '1', 11232, 'wadwad@gmail.com', '1986-05-21', '2016-05-12 10:09:33', '2016-05-12 10:09:33', 1, NULL, 8, '12');
INSERT INTO personal VALUES (6, '12321', 'dwadwa', 'feafwa', '1', 21321, 'wwdwada@gmai.com', '1993-05-20', '2016-05-12 10:12:09', '2016-05-12 10:12:09', 1, NULL, 9, '3');
INSERT INTO personal VALUES (7, '21321', 'wadwaaw', 'dawd', '1', 2121321, 'daw@fmda.com', '1993-05-18', '2016-05-12 10:15:11', '2016-05-12 10:15:11', 1, NULL, 10, 'Gerencia');
INSERT INTO personal VALUES (14, '2432423', 'dwadwawa', 'dwaaw', 'dwa', 24324, 'adw', '2016-05-11', '2016-05-12 22:24:00.47127', '2016-05-12 22:24:00.47127', 1, 'dawda', 12, 'wdwa');
INSERT INTO personal VALUES (15, '1242341', 'adwa', 'awdwa', '1', 3242341, 'dwaadwa@gmaol.com', '1996-05-21', '2016-05-12 10:24:23', '2016-05-12 10:24:23', 1, NULL, 13, 'Dirección General');
INSERT INTO personal VALUES (16, '1231415', 'awdawdwa', 'dwadwa', '1', 3213123, 'wdwadw@gmail.com', '2016-05-01', '2016-05-13 08:43:52', '2016-05-13 08:43:52', 1, NULL, 14, 'Despacho Viceministro');
INSERT INTO personal VALUES (17, '1231115', 'dadwa', 'dwadwa', '1', 3213123, 'wdwad2@gmail.com', '2016-05-01', '2016-05-13 08:45:34', '2016-05-13 08:45:34', 1, 'Telecomunicaciones ', 15, 'Despacho Viceministro');
INSERT INTO personal VALUES (1, '23603524', 'Luis Ricardo', 'Lavado Mogollón', 'sefsefes', 432423, 'adwad', '2016-04-05', '2016-04-06 15:08:05.893788', '2016-04-07 10:24:58.850254', 1, 'Telecomunicaciones', 1, 'Coordinación');
INSERT INTO personal VALUES (18, '221234', 'DWADWA', 'aefesrrs', '2', 2133123, 'awdwa@gmail.com', '1974-05-21', '2016-05-13 02:26:43', '2016-05-13 02:26:43', 1, 'Presidencia', 16, 'Despacho Viceministro');
INSERT INTO personal VALUES (2, '11235813', 'Jose', 'Figuera', 'Gerente', 324421, 'nifnig@fig.com', '2016-04-25', '2016-04-26 08:54:42.243163', '2016-05-16 10:11:58', 1, 'CCO', 2, 'Gerencia');
INSERT INTO personal VALUES (3, '123213', 'Transbar', 'Ca', 'Gerente', 2432423, 'transbarca@transbarca.con', '1985-05-14', '2016-05-03 11:23:54', '2016-05-16 10:15:55', 1, 'Presidencia', NULL, 'Presidencia');


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 7, true);


--
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_seq', 18, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY responsables (id, nombres, apellidos, cedula, cargo, unidad_trabajo, unidad_admin, fecha_creacion, fecha_modif) FROM stdin;
\.


--
-- Name: responsables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('responsables_id_seq', 1, true);


--
-- Name: salida_id_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salida_id_salida_seq', 1, false);


--
-- Data for Name: sedes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sedes (id, sede) FROM stdin;
\.


--
-- Name: sedes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sedes_id_seq', 1, false);


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


COPY subcat (id, codigo, descripcion, status, catgen) FROM stdin;
1	122	adwd	1	1
3	1234	De pala	1	\N
4	12343	De pala	1	\N
5	123435	De pala	1	12
2	1234351	De pala	1	12
6	12343511	De pala	1	12
7	12234	Pesado	1	121213
\.
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

COPY unidad_admin (id, codigo, descripcion) FROM stdin;
\.


--
-- Name: unidad_admin_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_admin_codigo_seq', 1, false);


--
-- Name: unidad_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_admin_id_seq', 1, false);


--
-- Data for Name: unidad_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad_trabajo (id, codigo, descripcion) FROM stdin;
\.


--
-- Name: unidad_trabajo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_codigo_seq', 1, false);


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_id_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, usuario, pass, nivel, fecha_creacion, status, primer_inicio, fecha_modif) FROM stdin;
3	Jose	8cb2237d0679ca88db6464eac60da96345513964	1	2016-05-02 01:32:03	1	1	2016-05-09 10:11:28
2	luisrlavado	8cb2237d0679ca88db6464eac60da96345513964	2	2016-04-26 08:34:33	1	1	2016-05-09 10:15:28
7	luis	d033e22ae348aeb5660fc2140aec35850c4da997	2	2016-05-09 10:19:08	1	1	2016-05-09 10:30:40
8	juan	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-12 10:09:33	1	0	2016-05-12 10:09:33
9	pims	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-12 10:12:09	1	0	2016-05-12 10:12:09
10	awdwa	7248feaa77e873d31d864b5cf5b4d35a779d07b9	0	2016-05-12 10:15:11	1	0	2016-05-12 10:15:11
11	awdwa1	7248feaa77e873d31d864b5cf5b4d35a779d07b9	0	2016-05-12 10:19:48	1	0	2016-05-12 10:19:48
12	wadaxa	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-12 10:20:54	1	0	2016-05-12 10:20:54
13	wadaxa23	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-12 10:24:23	1	0	2016-05-12 10:24:23
14	dwadwa	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-13 08:43:51	1	0	2016-05-13 08:43:51
15	dwadwaa	8cb2237d0679ca88db6464eac60da96345513964	0	2016-05-13 08:45:34	1	0	2016-05-13 08:45:34
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	0	2016-04-06 15:06:59.467127	1	1	2016-05-13 11:26:58
16	dwadwadawd	231f831d54efcf1bb9c7ba2b191c1675bde79340	0	2016-05-13 02:26:43	1	0	2016-05-13 02:26:43
\.
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (3, 'Jose', '8cb2237d0679ca88db6464eac60da96345513964', 1, '2016-05-02 01:32:03', 1, 1, '2016-05-09 10:11:28');
INSERT INTO usuario VALUES (2, 'luisrlavado', '8cb2237d0679ca88db6464eac60da96345513964', 2, '2016-04-26 08:34:33', 1, 1, '2016-05-09 10:15:28');
INSERT INTO usuario VALUES (7, 'luis', 'd033e22ae348aeb5660fc2140aec35850c4da997', 2, '2016-05-09 10:19:08', 1, 1, '2016-05-09 10:30:40');
INSERT INTO usuario VALUES (8, 'juan', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-12 10:09:33', 1, 0, '2016-05-12 10:09:33');
INSERT INTO usuario VALUES (9, 'pims', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-12 10:12:09', 1, 0, '2016-05-12 10:12:09');
INSERT INTO usuario VALUES (10, 'awdwa', '7248feaa77e873d31d864b5cf5b4d35a779d07b9', 0, '2016-05-12 10:15:11', 1, 0, '2016-05-12 10:15:11');
INSERT INTO usuario VALUES (11, 'awdwa1', '7248feaa77e873d31d864b5cf5b4d35a779d07b9', 0, '2016-05-12 10:19:48', 1, 0, '2016-05-12 10:19:48');
INSERT INTO usuario VALUES (12, 'wadaxa', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-12 10:20:54', 1, 0, '2016-05-12 10:20:54');
INSERT INTO usuario VALUES (13, 'wadaxa23', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-12 10:24:23', 1, 0, '2016-05-12 10:24:23');
INSERT INTO usuario VALUES (14, 'dwadwa', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-13 08:43:51', 1, 0, '2016-05-13 08:43:51');
INSERT INTO usuario VALUES (15, 'dwadwaa', '8cb2237d0679ca88db6464eac60da96345513964', 0, '2016-05-13 08:45:34', 1, 0, '2016-05-13 08:45:34');
INSERT INTO usuario VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, '2016-04-06 15:06:59.467127', 1, 1, '2016-05-13 11:26:58');
INSERT INTO usuario VALUES (16, 'dwadwadawd', '231f831d54efcf1bb9c7ba2b191c1675bde79340', 0, '2016-05-13 02:26:43', 1, 0, '2016-05-13 02:26:43');


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 16, true);


--
-- Name: UN_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "UN_personal" UNIQUE (ci_per);


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
-- Name: pk_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT pk_bienes PRIMARY KEY (id);


--
-- Name: pk_cargos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT pk_cargos PRIMARY KEY (id);


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
-- Name: pk_configuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_equipos
    ADD CONSTRAINT pk_configuracion PRIMARY KEY (id);


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
-- Name: pk_niveles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY niveles_usuarios
    ADD CONSTRAINT pk_niveles PRIMARY KEY (id);


--
-- Name: pk_numero_bien; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numero_bien
    ADD CONSTRAINT pk_numero_bien PRIMARY KEY (id);


--
-- Name: pk_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT pk_personal PRIMARY KEY (id);


--
-- Name: pk_responsables; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT pk_responsables PRIMARY KEY (id);


--
-- Name: pk_sede; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sedes
    ADD CONSTRAINT pk_sede PRIMARY KEY (id);


--
-- Name: pk_subcat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcat
    ADD CONSTRAINT pk_subcat PRIMARY KEY (id);


--
-- Name: pk_unidad_administrativa; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT pk_unidad_administrativa PRIMARY KEY (id);


--
-- Name: pk_unidad_trabajo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT pk_unidad_trabajo PRIMARY KEY (id);


--
-- Name: un_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT un_equipo UNIQUE (serial);


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
-- Name: un_serial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT un_serial UNIQUE (serial);


--
-- Name: un_unidad_admin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT un_unidad_admin UNIQUE (codigo);


--
-- Name: un_unidad_trabajo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT un_unidad_trabajo UNIQUE (codigo);


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
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

