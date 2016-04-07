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
INSERT INTO configuracion_bien VALUES (67, 1, 'Despacho del Presidente', 'Categorías de Unidades Administrativas');
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


--
-- PostgreSQL database dump complete
--

