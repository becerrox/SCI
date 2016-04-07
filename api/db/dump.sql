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
    status integer DEFAULT 1 NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cat_unid_admin character varying(10),
    fecha_elab date,
    per_ini date,
    per_culm date,
    uni_trabajo character varying(30),
    componentes character varying(50),
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
-- Name: COLUMN bienesgeneral.item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.item IS 'Nro. Inventario';


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
-- Name: COLUMN bienesgeneral.uni_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.uni_trabajo IS 'Unidad de Trabajo';


--
-- Name: COLUMN bienesgeneral.componentes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.componentes IS 'Tipo de Componentes';


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
-- Name: categoria_general_bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_general_bienes (
    id integer DEFAULT nextval('categoria_general_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL
);


ALTER TABLE categoria_general_bienes OWNER TO postgres;

--
-- Name: TABLE categoria_general_bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE categoria_general_bienes IS 'Codigo general de los bienes';


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
-- Name: cod_categoria_especifica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cod_categoria_especifica (
    id integer DEFAULT nextval('sub_categorias_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    id_sub_categorias_bienes integer
);


ALTER TABLE cod_categoria_especifica OWNER TO postgres;

--
-- Name: TABLE cod_categoria_especifica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cod_categoria_especifica IS 'Codigos de categoria especifica';


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
    unidad_trabajo character varying(50)
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
    id_usuario integer DEFAULT nextval('personal_id_personal_seq'::regclass)
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
    status integer
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
-- Name: sub_categorias_bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_categorias_bienes (
    id integer DEFAULT nextval('sub_categorias_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    id_categoria_general_bienes integer
);


ALTER TABLE sub_categorias_bienes OWNER TO postgres;

--
-- Name: TABLE sub_categorias_bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sub_categorias_bienes IS 'Codigos de las subcategoria de bienes';


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
    fecha_creacion timestamp without time zone,
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
-- Name: pk  sub_categorias_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_categorias_bienes
    ADD CONSTRAINT "pk  sub_categorias_bienes" PRIMARY KEY (id);


--
-- Name: pk categoria_general_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_general_bienes
    ADD CONSTRAINT "pk categoria_general_bienes" PRIMARY KEY (id);


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
-- Name: pk_cat_especifica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cod_categoria_especifica
    ADD CONSTRAINT pk_cat_especifica PRIMARY KEY (id);


--
-- Name: CONSTRAINT pk_cat_especifica ON cod_categoria_especifica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_cat_especifica ON cod_categoria_especifica IS 'Categoria especifica';


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
-- Name: categoria_general_bienes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_categorias_bienes
    ADD CONSTRAINT categoria_general_bienes_fk FOREIGN KEY (id_categoria_general_bienes) REFERENCES categoria_general_bienes(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_entrada
    ADD CONSTRAINT entrada_fk FOREIGN KEY (id_entrada) REFERENCES entrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_especifica_sub; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cod_categoria_especifica
    ADD CONSTRAINT fk_especifica_sub FOREIGN KEY (id_sub_categorias_bienes) REFERENCES sub_categorias_bienes(id);


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

