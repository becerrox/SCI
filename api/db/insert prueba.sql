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
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'admin', 'admin', 1, '2016-03-10 11:46:05.450743', '2016-03-10 11:46:05.450743', '0', '0', 0);


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personal VALUES (2, '121212', 'luis', 'lavado', 'jefe', 232323, 23232, 'idwi@hdhwd.com', '1994-02-16', '2016-03-10 11:47:16.169404', '2016-03-10 11:47:16.169404', 'admin', 'admin', 1, '', 'telecom', 1);


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

INSERT INTO auditoria_equipos VALUES (1, 'dbfb', 'dbd', 'dbuwdbu', 'ddbfbu', 'dndb', 'dbedbue', 'dnidni', 1, 1, '2016-03-11 07:58:22.891808');


--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_equipos_id_equipo_seq', 1, false);


--
-- Data for Name: auditoria_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria_personal VALUES ('23603524', 'dhwidhw', 'dndnd', 'fhirihier', 3753275237, 5757577575, 'cbcbe@jij.com', '1994-02-16', 1, '2016-03-11 08:05:49.57575', '', 'hwdhidw');


--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_personal_id_personal_seq', 1, false);


--
-- Data for Name: auditoria_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auditoria_usuario VALUES ('admin', 'admin', 1, 1, '2016-03-11 07:57:55.211987');


--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_usuario_seq', 1, false);


--
-- Data for Name: bienesgeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bienesgeneral VALUES (1, 1, '2123123', '3434535', '35435345', 'hedghegh', 13, 'bdbdbhjd', 'dfhjdfj', 'fdydfudfu', 'dfuiduidu', 12, 2121, 12, 1, '2016-03-11 08:07:39.897887');


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 1, true);


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
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
-- Data for Name: salida; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipo VALUES (4, 1, 'dbfb', 'dbd', 'dbuwdbu', 'ddbfbu', 'dndb', 'dbedbue', 'dnidni', 1, 3, 0);


--
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_equipo_seq', 4, true);


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 2, true);


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

INSERT INTO ubicacion VALUES (3, 'telecom', 2);


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 3, true);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- PostgreSQL database dump complete
--

