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
-- Name: auditequipos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditequipos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_equipos VALUES (old.item, old.descripcion, old.marca, old.modelo, old.serial, old.color, old.estado, old.cod_bien, old.cantidad, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditequipos() OWNER TO postgres;

--
-- Name: auditoriabienesgenerales(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditoriabienesgenerales() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_bienesgeneral VALUES (old.id,old.item,old.cod_general,old.cod_subcat,old,cod_catespf,old.descripcion,old.estatus_uso_bien,old.marca,old.modelo,old.serial,old.tipo_comp,old.colores,old.num_bien,old.estado_bien,old.status,old.fecha_modif);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditoriabienesgenerales() OWNER TO postgres;

--
-- Name: auditoriaresponsables(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditoriaresponsables() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

 BEGIN

        INSERT INTO auditoria_responsables VALUES (old.nombres, old.apellidos, old.departamento, old.gerencia, old.fecha_modif, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditoriaresponsables() OWNER TO postgres;

--
-- Name: auditusuario(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditusuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$    BEGIN

        INSERT INTO auditoria_usuario VALUES (old.usuario, old.pass, old.nivel, old.status, old.fecha_modif, old.ci_per, old.nombres, old.apellidos, old.cargo, old.gerencia, old.departamento, old.telf_pers, old.telf_casa, old.correo, old.f_nac);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditusuario() OWNER TO postgres;

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aignación; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "aignación" (
    id integer DEFAULT nextval('"aignación_id_seq"'::regclass) NOT NULL,
    fecha_asignacion timestamp without time zone,
    "tipo_asignación" smallint,
    id_personal integer,
    id_usuario integer
);


ALTER TABLE "aignación" OWNER TO postgres;

--
-- Name: TABLE "aignación"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "aignación" IS 'Detalles de asignaciones';


--
-- Name: auditoria_bienesgeneral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria_bienesgeneral (
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
    fecha_modif timestamp without time zone DEFAULT now()
);


ALTER TABLE auditoria_bienesgeneral OWNER TO postgres;

--
-- Name: TABLE auditoria_bienesgeneral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_bienesgeneral IS 'Auditoria en cambios hechos en la tabla de bienes';


--
-- Name: COLUMN auditoria_bienesgeneral.item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.item IS 'Nro. Inventario';


--
-- Name: COLUMN auditoria_bienesgeneral.cod_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.cod_general IS 'Codigo categoria general';


--
-- Name: COLUMN auditoria_bienesgeneral.cod_subcat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.cod_subcat IS 'Codigo sub-categoria';


--
-- Name: COLUMN auditoria_bienesgeneral.cod_catespf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.cod_catespf IS 'Codigo categoria especifica';


--
-- Name: COLUMN auditoria_bienesgeneral.estatus_uso_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.estatus_uso_bien IS 'Estatus del uso del bien';


--
-- Name: COLUMN auditoria_bienesgeneral.tipo_comp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.tipo_comp IS 'Tipo componente';


--
-- Name: COLUMN auditoria_bienesgeneral.num_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.num_bien IS 'numero de bien';


--
-- Name: COLUMN auditoria_bienesgeneral.estado_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_bienesgeneral.estado_bien IS 'Estado del bien';


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
    cantidad integer,
    status integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now()
);


ALTER TABLE auditoria_equipos OWNER TO postgres;

--
-- Name: TABLE auditoria_equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_equipos IS 'Cambios o eliminaciones realizados en la tabla equipos';


--
-- Name: COLUMN auditoria_equipos.status; Type: COMMENT; Schema: public; Owner: postgres
--

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
-- Name: auditoria_responsables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria_responsables (
    nombres character varying(40),
    apellidos character varying(40),
    departamento character varying(30),
    gerencia character varying(30),
    fecha_modif timestamp without time zone DEFAULT now(),
    status integer
);


ALTER TABLE auditoria_responsables OWNER TO postgres;

--
-- Name: TABLE auditoria_responsables; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_responsables IS 'Cambios generados en la tabla responsables';


--
-- Name: COLUMN auditoria_responsables.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_responsables.status IS ' 0=cerrada;1=abierta';


--
-- Name: auditoria_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria_usuario (
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    status integer,
    fecha_modif timestamp without time zone DEFAULT now(),
    ci_per character varying(10) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    gerencia character varying(30),
    departamento character varying(30),
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(50) NOT NULL,
    f_nac date
);


ALTER TABLE auditoria_usuario OWNER TO postgres;

--
-- Name: TABLE auditoria_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_usuario IS 'Tabla de los usuarios';


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
    status integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cat_unid_admin character varying(10),
    fecha_elab date,
    per_ini date,
    per_culm date
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
    fecha_creacion timestamp without time zone NOT NULL,
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
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipo (
    id integer DEFAULT nextval('equipo_id_equipo_seq'::regclass) NOT NULL,
    item integer NOT NULL,
    descripcion character varying(100),
    marca character varying(30),
    modelo character varying(30),
    serial character varying(30),
    color character varying(10),
    estado character varying(100) NOT NULL,
    cod_bien character varying(20),
    cantidad integer,
    status integer NOT NULL,
    ubicacion character varying(30),
    encargado character varying(30)
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
    departamento character varying(30),
    gerencia character varying(30),
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
    fecha_creacion timestamp without time zone NOT NULL,
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
    id_personal integer,
    id_usuario integer
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
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ubicacion (
    id integer DEFAULT nextval('"ubicacion_id_Ubicacion_seq"'::regclass) NOT NULL,
    nombre character varying(20),
    id_personal integer
);


ALTER TABLE ubicacion OWNER TO postgres;

--
-- Name: TABLE ubicacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ubicacion IS 'Detalles de la ubicacion de los equipos y el personal';


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
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer DEFAULT nextval('usuario_id_usuario_seq'::regclass) NOT NULL,
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    ci_per character varying(10) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(50) NOT NULL,
    f_nac date,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    usuario_creacion character varying(20) NOT NULL,
    usuario_modif character varying(20),
    status integer,
    unid_admin character varying(30)
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
-- Data for Name: aignación; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aignación_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"aignación_id_seq"', 1, false);


--
-- Data for Name: auditoria_bienesgeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auditoria_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_equipos_id_equipo_seq', 1, false);


--
-- Data for Name: auditoria_responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria_responsables VALUES ('wwdbjb', 'bjkbjkbk', 'bjbkbk', 'bjkbkjbkj', '2016-03-14 14:13:27.143947', 1);


--
-- Data for Name: auditoria_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria_usuario VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1, '2016-03-14 13:40:12.456946', '23603524', 'Luis', 'Lavado', 'jefe', 'fwfw', 'fesfe', 4324324, 2342342, 'luisrlavado@gmail.com', '2016-03-13');
INSERT INTO auditoria_usuario VALUES ('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1, '2016-03-14 13:40:12.456946', '23603524', 'Luiss', 'Lavado', 'jefe', 'fwfw', 'fesfe', 4324324, 2342342, 'luisrlavado@gmail.com', '2016-03-13');


--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_usuario_seq', 1, false);


--
-- Data for Name: bienesgeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 1, false);


--
-- Data for Name: categoria_general_bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, false);


--
-- Data for Name: configuracion_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 1, false);


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



--
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_equipo_seq', 1, false);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO responsables VALUES (1, 'wwdbjbd', 'bjkbjkbk', 'bjbkbk', 'bjkbkjbkj', '2016-03-14 14:13:27.143947', '2016-03-14 14:13:27.143947', 1);


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
-- Data for Name: sub_categorias_bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_categorias_bienes_id_seq', 1, false);


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

INSERT INTO usuario VALUES (1, 'admins', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, '23603524', 'Luiss', 'Lavado', 'jefe', 4324324, 2342342, 'luisrlavado@gmail.com', '2016-03-13', '2016-03-14 13:40:12.456946', '2016-03-14 13:40:12.456946', '0', '0', 1, NULL);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


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

ALTER TABLE ONLY "aignación"
    ADD CONSTRAINT pk_asignacion PRIMARY KEY (id);


--
-- Name: pk_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienesgeneral
    ADD CONSTRAINT pk_bienes PRIMARY KEY (id);


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

ALTER TABLE ONLY ubicacion
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
-- Name: actualizarbienes; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarbienes AFTER UPDATE ON bienesgeneral FOR EACH ROW EXECUTE PROCEDURE auditoriabienesgenerales();


--
-- Name: actualizarequipo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarequipo AFTER UPDATE ON equipo FOR EACH ROW EXECUTE PROCEDURE auditequipos();


--
-- Name: actualizarresponsables; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarresponsables AFTER UPDATE ON responsables FOR EACH ROW EXECUTE PROCEDURE auditoriaresponsables();


--
-- Name: actualizarusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarusuario AFTER UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: auditbienesgeneral; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditbienesgeneral AFTER DELETE ON bienesgeneral FOR EACH ROW EXECUTE PROCEDURE auditoriabienesgenerales();


--
-- Name: auditequipos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditequipos AFTER DELETE ON equipo FOR EACH ROW EXECUTE PROCEDURE auditequipos();


--
-- Name: auditoriaresponsables; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditoriaresponsables AFTER DELETE ON responsables FOR EACH ROW EXECUTE PROCEDURE auditoriaresponsables();


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

ALTER TABLE ONLY salida
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "aignación"
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solvencia
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

