--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-04-18 12:56:13 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 120904)
-- Name: t_categorias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200),
    idempresa bigint,
    descripcion character varying(500)
);


--
-- TOC entry 174 (class 1259 OID 120910)
-- Name: s_t_categorias_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_categorias_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 174
-- Name: s_t_categorias_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_categorias_id OWNED BY public.t_categorias.id;


--
-- TOC entry 175 (class 1259 OID 120912)
-- Name: t_clientes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_clientes (
    id bigint NOT NULL,
    nombre character varying(500),
    correo character varying(500),
    idtipodocumento numeric(2,0),
    documento character varying(100),
    telefono character varying(100),
    direccion character varying(500)
);


--
-- TOC entry 176 (class 1259 OID 120918)
-- Name: s_t_clientes_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_clientes_id
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 176
-- Name: s_t_clientes_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_clientes_id OWNED BY public.t_clientes.id;


--
-- TOC entry 177 (class 1259 OID 120920)
-- Name: t_empresas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_empresas (
    id bigint NOT NULL,
    empresa character varying(200),
    tasabcv double precision,
    urlfacturacion character varying(500),
    tokenfacturacion character varying(10000),
    email character varying(500),
    telefono character varying(100),
    direccion character varying(500),
    rif character varying(100),
    estatus numeric(2,0) DEFAULT 1
);


--
-- TOC entry 178 (class 1259 OID 120927)
-- Name: s_t_empresas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_empresas_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 178
-- Name: s_t_empresas_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;


--
-- TOC entry 179 (class 1259 OID 120929)
-- Name: t_holds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_holds (
    id bigint NOT NULL,
    idusuario bigint,
    idcliente bigint,
    fecha timestamp without time zone,
    idtipofactura numeric(2,0)
);


--
-- TOC entry 180 (class 1259 OID 120932)
-- Name: s_t_holds_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 180
-- Name: s_t_holds_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_id OWNED BY public.t_holds.id;


--
-- TOC entry 181 (class 1259 OID 120934)
-- Name: t_holds_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_holds_items (
    id bigint NOT NULL,
    idhold bigint,
    idproducto bigint,
    precio double precision,
    cantidad double precision,
    tasa double precision,
    total double precision,
    idunidad numeric(2,0),
    descuento double precision
);


--
-- TOC entry 182 (class 1259 OID 120937)
-- Name: s_t_holds_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_items_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 182
-- Name: s_t_holds_items_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_items_id OWNED BY public.t_holds_items.id;


--
-- TOC entry 183 (class 1259 OID 120939)
-- Name: t_productos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_productos (
    id bigint NOT NULL,
    producto character varying(200),
    descripcion character varying(500),
    idcategoria bigint,
    costo double precision,
    precio double precision,
    idimpuesto numeric(2,0),
    idunidad numeric(2,0),
    sku character varying(100),
    inventario1 numeric(9,1),
    costousd double precision DEFAULT 0,
    preciousd double precision DEFAULT 0,
    utilidad double precision DEFAULT 0,
    intipoproducto numeric(2,0) DEFAULT 1 NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 120948)
-- Name: s_t_productos_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_productos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 184
-- Name: s_t_productos_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_productos_id OWNED BY public.t_productos.id;


--
-- TOC entry 185 (class 1259 OID 120950)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_usuarios (
    id bigint NOT NULL,
    usuario character varying(100),
    clave character varying(100),
    nombre character varying(200),
    email character varying(1000),
    idrol numeric(2,0),
    estatus numeric(2,0) DEFAULT 1 NOT NULL,
    resetearclave numeric(2,0) DEFAULT 0 NOT NULL,
    idempresa bigint
);


--
-- TOC entry 186 (class 1259 OID 120958)
-- Name: s_t_usuarios_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 186
-- Name: s_t_usuarios_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_usuarios_id OWNED BY public.t_usuarios.id;


--
-- TOC entry 187 (class 1259 OID 120960)
-- Name: s_t_ventas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_id
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 120962)
-- Name: s_t_ventas_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_items_id
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 189 (class 1259 OID 120964)
-- Name: t_impuestos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_impuestos (
    id bigint NOT NULL,
    impuesto character varying(100),
    tasa double precision
);


--
-- TOC entry 196 (class 1259 OID 129095)
-- Name: t_productos_compuesto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_productos_compuesto (
    idproductopadre bigint,
    idproductohijo bigint,
    idunidad numeric(2,0),
    cantidad double precision
);


--
-- TOC entry 190 (class 1259 OID 120967)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(100)
);


--
-- TOC entry 191 (class 1259 OID 120970)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100),
    abrev character varying(20)
);


--
-- TOC entry 192 (class 1259 OID 120973)
-- Name: t_tipofacturas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_tipofacturas (
    id numeric(2,0) NOT NULL,
    tipofactura character varying(100)
);


--
-- TOC entry 193 (class 1259 OID 120976)
-- Name: t_unidades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_unidades (
    id numeric(2,0) NOT NULL,
    unidad character varying(100)
);


--
-- TOC entry 194 (class 1259 OID 120979)
-- Name: t_ventas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_ventas (
    id bigint DEFAULT nextval('public.s_t_ventas_id'::regclass) NOT NULL,
    idusuario bigint,
    idempresa bigint,
    idcliente bigint,
    fecha timestamp without time zone,
    subtotal double precision,
    impuesto double precision,
    total double precision,
    descuentos double precision,
    igtf double precision,
    idtipofactura numeric(2,0),
    estatus numeric(2,0) DEFAULT 1,
    numerointerno character varying(50),
    numerocontrol character varying(50),
    secuencial integer DEFAULT 0 NOT NULL,
    tasausd double precision,
    totalusd double precision
);


--
-- TOC entry 195 (class 1259 OID 120985)
-- Name: t_ventas_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_ventas_items (
    id bigint DEFAULT nextval('public.s_t_ventas_items_id'::regclass) NOT NULL,
    idventa bigint,
    idproducto bigint,
    precio double precision,
    cantidad double precision,
    impuesto double precision,
    tasa double precision,
    subtotal double precision,
    descuento double precision,
    total double precision,
    idunidad numeric(2,0)
);


--
-- TOC entry 1962 (class 2604 OID 120989)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias ALTER COLUMN id SET DEFAULT nextval('public.s_t_categorias_id'::regclass);


--
-- TOC entry 1963 (class 2604 OID 120990)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id SET DEFAULT nextval('public.s_t_clientes_id'::regclass);


--
-- TOC entry 1965 (class 2604 OID 120991)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);


--
-- TOC entry 1966 (class 2604 OID 120992)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_id'::regclass);


--
-- TOC entry 1967 (class 2604 OID 120993)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_items_id'::regclass);


--
-- TOC entry 1971 (class 2604 OID 120994)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos ALTER COLUMN id SET DEFAULT nextval('public.s_t_productos_id'::regclass);


--
-- TOC entry 1975 (class 2604 OID 120995)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id SET DEFAULT nextval('public.s_t_usuarios_id'::regclass);


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 174
-- Name: s_t_categorias_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_categorias_id', 9, true);


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 176
-- Name: s_t_clientes_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_clientes_id', 35, true);


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 178
-- Name: s_t_empresas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_empresas_id', 23, true);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 180
-- Name: s_t_holds_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_id', 97, true);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 182
-- Name: s_t_holds_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_items_id', 163, true);


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 184
-- Name: s_t_productos_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_productos_id', 15, true);


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 186
-- Name: s_t_usuarios_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_usuarios_id', 23, true);


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 187
-- Name: s_t_ventas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_id', 94, true);


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 188
-- Name: s_t_ventas_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_items_id', 101, true);


--
-- TOC entry 2119 (class 0 OID 120904)
-- Dependencies: 173
-- Data for Name: t_categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (3, 'Zapato', 20, 'Zapateria');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (4, 'Comida', 20, 'Restaurante');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (5, 'Lubricantes', 20, 'Aceite de motor, de caja y ligas de frenos');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (6, 'Peluquería', 22, 'Cepillos, Secadores, Tijeras, materiales de peluquería');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (7, 'Carniceria', 22, 'Carnes, Charcutería');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (8, 'Facturacion Digital', 20, 'Creación de facturas y asignacion de numero correlativo');
INSERT INTO public.t_categorias (id, categoria, idempresa, descripcion) VALUES (9, 'Viveres y Alimentos', 23, 'Alimentos y Viveres en General');


--
-- TOC entry 2121 (class 0 OID 120912)
-- Dependencies: 175
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_clientes (id, nombre, correo, idtipodocumento, documento, telefono, direccion) VALUES (33, 'Susej Antonella', 'belizarioja@gmail.com', 1, '10000000', '', '');
INSERT INTO public.t_clientes (id, nombre, correo, idtipodocumento, documento, telefono, direccion) VALUES (34, 'EMPRESA DEMO', 'belizarioja@gmail.com', 3, 'J-12345678-9', '0212-1234567', 'Urbanización Don Rómulo Gallegos, calle 24 #183,Cumaná Estado Sucre.');
INSERT INTO public.t_clientes (id, nombre, correo, idtipodocumento, documento, telefono, direccion) VALUES (18, 'SUSEJ', 'jesusb.sacs@gmail.com', 1, '11222333', '234234234234', 'GHJFGHGFHGFHGF');
INSERT INTO public.t_clientes (id, nombre, correo, idtipodocumento, documento, telefono, direccion) VALUES (11, 'JESÚS', 'belizarioja@gmail.com', 1, '11632453', '45345345345', 'Urbanización Don Rómulo Gallegos, calle 24 #183');
INSERT INTO public.t_clientes (id, nombre, correo, idtipodocumento, documento, telefono, direccion) VALUES (35, 'GENERAL', '', 1, '0', '', '');


--
-- TOC entry 2123 (class 0 OID 120920)
-- Dependencies: 177
-- Data for Name: t_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_empresas (id, empresa, tasabcv, urlfacturacion, tokenfacturacion, email, telefono, direccion, rif, estatus) VALUES (21, 'Pollos Lisboa', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.t_empresas (id, empresa, tasabcv, urlfacturacion, tokenfacturacion, email, telefono, direccion, rif, estatus) VALUES (22, 'PEQUEÑO EMISOR 56', 36.8955550000000017, 'http://192.168.1.4:5009/facturacion', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDQiLCJyaWYiOiJKLTAwMDAwMDU2LTUiLCJyYXpvbnNvY2lhbCI6IlBFUVVFw5FPIEVNSVNPUiA1NiIsImRpcmVjY2lvbiI6IkJvdWxldmFyZCBTYWJhbmEgR3JhbmRhLCBFc3F1aW5hIEVsIFJlY3JlbywgUHVlc3RvIDEzLUEiLCJlbWFpbCI6ImVtaXNvcjU2QGNvcnJlby5jb20iLCJ0ZWxlZm9ubyI6IjA0MTI4ODg1NTY2IiwidmFsaWRhcmludGVybm8iOiIyIn0sImlhdCI6MTcwOTgyNjgxMH0.CjG8yvJRcJ5PxvTBoM0UtJEagalzawsVmByyPXGOCTI', 'emisor56@gmail.com', '+584245556666', 'Caracas, Venezuela', 'J-00000056-5', 1);
INSERT INTO public.t_empresas (id, empresa, tasabcv, urlfacturacion, tokenfacturacion, email, telefono, direccion, rif, estatus) VALUES (20, 'SMART INNOVACIONES TECNOLOGICAS', 36.8955550000000017, 'https://bck-test.factura-smart.com/facturacion', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDEiLCJyaWYiOiJKLTUwMzc1NzkwLTYiLCJyYXpvbnNvY2lhbCI6IlNNQVJUIElOTk9WQUNJT05FUyBURUNOT0xPR0lDQVMiLCJkaXJlY2Npb24iOiJBdi4gTGliZXJ0YWRvciB5IEF2LiBGcmFuY2lzY28gZGUgTWlyYW5kYS4gTXVsdGljZW50cm8gRW1wcmVzYXJpYWwgZGVsIEVzdGUuIFRvcnJlIEIuIFBpc28gMTUuIE9maWMgQi0xNTIuIENoYWNhby4gRWRvLiBNaXJhbmRhLiIsImVtYWlsIjoiYWRtaW5pc3RyYWNpb25Ac21hcnRpbnRlYy5uZXQiLCJ0ZWxlZm9ubyI6IjAyMTItNzUwNDAwNyIsInZhbGlkYXJpbnRlcm5vIjoiMiJ9LCJpYXQiOjE3MTA2ODQyNjN9.kouWmmEtMwIvrSPbPnVEKQ_1VgFo5LTHsh0_X2ytZZM', 'administracion@smartintec.net', '0212-7504007', 'Av. Libertador y Av. Francisco de Miranda. Multicentro Empresarial del Este. Torre B. Piso 15. Ofic B-152. Chacao. Edo. Miranda.', 'J-50375790-6', 1);
INSERT INTO public.t_empresas (id, empresa, tasabcv, urlfacturacion, tokenfacturacion, email, telefono, direccion, rif, estatus) VALUES (23, 'INVERSIONES 1234', 36.5588880000000032, '', '', 'correo@mail.com', '04121112233', 'Call eZea Nro 156', 'J-12356789-0', 1);


--
-- TOC entry 2125 (class 0 OID 120929)
-- Dependencies: 179
-- Data for Name: t_holds; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2127 (class 0 OID 120934)
-- Dependencies: 181
-- Data for Name: t_holds_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2135 (class 0 OID 120964)
-- Dependencies: 189
-- Data for Name: t_impuestos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_impuestos (id, impuesto, tasa) VALUES (2, 'IVA (16%)', 16);
INSERT INTO public.t_impuestos (id, impuesto, tasa) VALUES (1, 'Exento', 0);
INSERT INTO public.t_impuestos (id, impuesto, tasa) VALUES (3, 'Reducido', 8);
INSERT INTO public.t_impuestos (id, impuesto, tasa) VALUES (4, 'Al lujo', 31);


--
-- TOC entry 2129 (class 0 OID 120939)
-- Dependencies: 183
-- Data for Name: t_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (8, 'Paño ACM', 'Paño amarillo', 6, 450, 700, 2, 1, '444333', 45.0, 0, 0, 0, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (2, 'Pollo a la broster', 'Un combo de pollo a la broster', 4, 555, 666, 1, 2, '444444', 29.0, 15, 18, 20, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (4, 'Casual', 'Kickers marrón', 3, 2000, 2500, 3, 1, '00022555', 121.0, 54.0600000000000023, 67.5699999999999932, 25, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (7, 'Pollo a la brasa', 'Un combo de pollo a la brasa', 4, 555, 666, 1, 2, '123456', 19.0, 15, 18, 20, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (9, 'Plan Bronce', 'Plan dirigidos a negocios pequeños ', 8, 0, 2, 2, 1, '002255', 49970.0, 0, 0.0500000000000000028, 0, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (6, 'Secador de pelo OSTER 1234', 'Secador marca Oster', 6, 200, 500, 2, 1, '232323', 43.0, 0, 0, 0, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (12, 'Avena', 'Avena Tradicional', 9, 40, 70, 1, 2, '005588', 800.0, 1.09000000000000008, 1.90999999999999992, 75, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (1, 'Deportivo', 'NIKE', 3, 1234, 2345, 2, 1, '050505', 10.0, 33.3500000000000014, 63.3800000000000026, 90.0300000000000011, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (5, 'Zoko', 'Zoko', 5, 333, 555, 2, 3, '040404', 26.0, 0, 0, 0, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (3, 'Aceite de motor', 'PDV 15-40', 5, 200, 300, 2, 3, '1234567', 100.0, 5.41000000000000014, 8.10999999999999943, 50, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (15, 'Compuesto de masas', 'Compuesto de Harina de Trigo, Azúcar y Avena Artesanal', 9, 40, 60, 1, 1, '01020304', 0.0, 1.09000000000000008, 1.6399999999999999, 50, 2);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (10, 'Azúcar Refinada', 'Azúcar Refinada Blanca', 9, 50, 70, 2, 2, '001144', 580.0, 1.37000000000000011, 1.90999999999999992, 40, 1);
INSERT INTO public.t_productos (id, producto, descripcion, idcategoria, costo, precio, idimpuesto, idunidad, sku, inventario1, costousd, preciousd, utilidad, intipoproducto) VALUES (11, 'Harina de Trigo Leudante', 'Harina de Trigo Leudante Panadero', 9, 50, 60, 2, 2, '004477', 999.0, 1.37000000000000011, 1.6399999999999999, 20, 1);


--
-- TOC entry 2142 (class 0 OID 129095)
-- Dependencies: 196
-- Data for Name: t_productos_compuesto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_productos_compuesto (idproductopadre, idproductohijo, idunidad, cantidad) VALUES (15, 12, 2, 0);
INSERT INTO public.t_productos_compuesto (idproductopadre, idproductohijo, idunidad, cantidad) VALUES (15, 10, 2, 0);
INSERT INTO public.t_productos_compuesto (idproductopadre, idproductohijo, idunidad, cantidad) VALUES (15, 11, 2, 0);


--
-- TOC entry 2136 (class 0 OID 120967)
-- Dependencies: 190
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles (id, rol) VALUES (1, 'Administrador');
INSERT INTO public.t_roles (id, rol) VALUES (2, 'Gerente');
INSERT INTO public.t_roles (id, rol) VALUES (3, 'Vendedor');


--
-- TOC entry 2137 (class 0 OID 120970)
-- Dependencies: 191
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos (id, tipodocumento, abrev) VALUES (1, 'Cédula de identidad', 'CI');
INSERT INTO public.t_tipodocumentos (id, tipodocumento, abrev) VALUES (2, 'Pasaporte', 'PasP');
INSERT INTO public.t_tipodocumentos (id, tipodocumento, abrev) VALUES (3, 'Registro información fiscal', 'RIF');


--
-- TOC entry 2138 (class 0 OID 120973)
-- Dependencies: 192
-- Data for Name: t_tipofacturas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipofacturas (id, tipofactura) VALUES (1, 'Factura');
INSERT INTO public.t_tipofacturas (id, tipofactura) VALUES (2, 'Nota de débito');
INSERT INTO public.t_tipofacturas (id, tipofactura) VALUES (3, 'Nota de crédito');
INSERT INTO public.t_tipofacturas (id, tipofactura) VALUES (4, 'Nota de entrega');
INSERT INTO public.t_tipofacturas (id, tipofactura) VALUES (5, 'Guía de despacho');


--
-- TOC entry 2139 (class 0 OID 120976)
-- Dependencies: 193
-- Data for Name: t_unidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_unidades (id, unidad) VALUES (1, 'Pieza');
INSERT INTO public.t_unidades (id, unidad) VALUES (2, 'Kilos');
INSERT INTO public.t_unidades (id, unidad) VALUES (3, 'Litros');
INSERT INTO public.t_unidades (id, unidad) VALUES (4, 'Metros');


--
-- TOC entry 2131 (class 0 OID 120950)
-- Dependencies: 185
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios (id, usuario, clave, nombre, email, idrol, estatus, resetearclave, idempresa) VALUES (20, 'admin', '123456', 'María Rojas', 'belizarioja@gmail.com', 1, 1, 0, 20);
INSERT INTO public.t_usuarios (id, usuario, clave, nombre, email, idrol, estatus, resetearclave, idempresa) VALUES (22, 'emisor561', '123456', 'Caja 1', 'belizariojabe@gmail.com', 3, 1, 0, 22);
INSERT INTO public.t_usuarios (id, usuario, clave, nombre, email, idrol, estatus, resetearclave, idempresa) VALUES (21, 'adminemisor56', '123456', 'Jesús Pérez', 'belizarioja@gmail.com', 2, 1, 0, 22);
INSERT INTO public.t_usuarios (id, usuario, clave, nombre, email, idrol, estatus, resetearclave, idempresa) VALUES (23, 'admininversiones', '123456', 'Jesus Gonzalez', 'jesusb.sacs@gmail.com', 2, 1, 0, 23);


--
-- TOC entry 2140 (class 0 OID 120979)
-- Dependencies: 194
-- Data for Name: t_ventas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (45, 20, 20, 11, '2024-03-27 12:38:41', 4845, 575.200000000000045, 5420.19999999999982, 0, 0, 1, 1, '00000001', NULL, 1, 36.9977549999999979, 146.5);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (46, 20, 20, 11, '2024-03-27 12:45:32', 855, 136.800000000000011, 991.799999999999955, 0, 0, 1, 1, '00000002', NULL, 2, 36.9977549999999979, 26.8099999999999987);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (47, 20, 20, 33, '2024-03-27 12:48:16', 1332, 0, 1332, 0, 0, 1, 1, '00000003', NULL, 3, 36.9977549999999979, 36);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (48, 21, 22, 33, '2024-03-27 19:46:28', 2000, 80, 2080, 0, 0, 1, 1, '00000001', NULL, 1, 36.8955550000000017, 62.8800000000000026);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (49, 22, 22, 11, '2024-03-27 20:26:41', 500, 80, 580, 0, 0, 1, 1, '00000002', NULL, 2, 36.8955550000000017, 15.7200000000000006);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (50, 22, 22, 11, '2024-03-27 21:18:50', 500, 80, 580, 0, 0, 1, 1, '00000003', NULL, 3, 36.8955550000000017, 15.7200000000000006);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (51, 22, 22, 33, '2024-03-27 21:23:36', 2500, 80, 2580, 0, 0, 1, 1, '00000004', NULL, 4, 36.8955550000000017, 78.5999999999999943);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (52, 21, 22, 33, '2024-04-02 10:01:13', 2600, 192, 2792, 0, 0, 1, 2, '00000005', NULL, 5, 36.8955550000000017, 81.7399999999999949);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (54, 20, 20, 11, '2024-04-04 09:37:21', 5994, 0, 5994, 0, 0, 1, 1, '00000005', NULL, 5, 36.9977549999999979, 162.009999999999991);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (55, 20, 20, 11, '2024-04-04 10:12:58', 2220, 88.7999999999999972, 2308.80000000000018, 0, 0, 1, 1, '00000006', NULL, 6, 36.9977549999999979, 69.5999999999999943);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (56, 20, 20, 33, '2024-04-04 10:18:54', 2775, 88.7999999999999972, 2863.80000000000018, 0, 0, 1, 2, '00000007', NULL, 7, 36.9977549999999979, 87.0100000000000051);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (57, 20, 20, 33, '2024-04-04 16:13:19', 44, 0.320000000000000007, 44.3200000000000003, 0, 0, 1, 1, '00000008', NULL, 8, 36.9977549999999979, 1.37999999999999989);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (53, 20, 20, 33, '2024-04-04 09:35:14', 5994, 0, 5994, 0, 0, 1, 2, '00000004', NULL, 4, 36.9977549999999979, 162.009999999999991);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (58, 20, 20, 34, '2024-04-12 07:08:53', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 9, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (59, 20, 20, 34, '2024-04-12 08:58:18', 4010, 0.320000000000000007, 4010.32000000000016, 0, 0, 1, 1, '00000010', NULL, 10, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (60, 20, 20, 34, '2024-04-12 09:03:09', 4010, 0.320000000000000007, 4010.32000000000016, 0, 0, 1, 1, '00000011', NULL, 11, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (61, 20, 20, 34, '2024-04-12 09:04:11', 4010, 0.320000000000000007, 4010.32000000000016, 0, 0, 1, 1, '00000012', NULL, 12, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (62, 20, 20, 34, '2024-04-12 09:04:59', 4010, 0.320000000000000007, 4010.32000000000016, 0, 0, 1, 1, '00000013', NULL, 13, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (63, 20, 20, 34, '2024-04-12 09:10:41', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 14, 36.9977549999999979, 125.730000000000004);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (64, 21, 22, 11, '2024-04-12 09:31:13', 1500, 80, 1580, 0, 0, 1, 1, '00000006', NULL, 6, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (65, 21, 22, 11, '2024-04-12 09:33:01', 1500, 80, 1580, 0, 0, 1, 1, '00000007', NULL, 7, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (66, 21, 22, 11, '2024-04-12 09:34:53', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 8, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (67, 21, 22, 11, '2024-04-12 09:37:47', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 9, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (68, 21, 22, 11, '2024-04-12 09:38:55', 1500, 80, 1580, 0, 0, 1, 1, '00000010', NULL, 10, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (69, 21, 22, 11, '2024-04-12 09:43:44', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 11, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (70, 21, 22, 11, '2024-04-12 09:45:06', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 12, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (71, 21, 22, 11, '2024-04-12 09:47:21', 1500, 80, 1580, 0, 0, 1, 1, '00000013', NULL, 13, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (72, 21, 22, 11, '2024-04-12 09:48:58', 1500, 80, 1580, 0, 0, 1, 1, '00000014', NULL, 14, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (73, 21, 22, 11, '2024-04-12 09:52:40', 1500, 80, 1580, 0, 0, 1, 1, '00000015', NULL, 15, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (74, 21, 22, 11, '2024-04-12 09:54:44', 1500, 80, 1740, 0, 0, 1, 1, '00000016', NULL, 16, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (75, 21, 22, 11, '2024-04-12 09:56:15', 1500, 80, 1740, 0, 0, 1, 1, '00000017', NULL, 17, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (76, 21, 22, 11, '2024-04-12 09:57:02', 1500, 80, 1740, 0, 0, 1, 1, '00000018', NULL, 18, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (77, 21, 22, 11, '2024-04-12 09:58:39', 1500, 80, 1740, 0, 0, 1, 1, '00000019', NULL, 19, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (78, 21, 22, 11, '2024-04-12 10:10:38', 1500, 80, 1740, 0, 0, 1, 1, '00000020', NULL, 20, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (79, 21, 22, 11, '2024-04-12 10:12:10', 1500, 80, 1740, 0, 0, 1, 1, '00000021', NULL, 21, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (80, 21, 22, 11, '2024-04-12 10:14:02', 1500, 80, 1740, 0, 0, 1, 1, '00000022', NULL, 22, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (81, 21, 22, 11, '2024-04-12 10:14:24', 1500, 80, 1740, 0, 0, 1, 1, '00000023', NULL, 23, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (91, 21, 22, 11, '2024-04-12 10:36:50', 1500, 80, 1740, 0, 0, 1, 1, '00000026', '00-00000008', 26, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (92, 20, 20, 34, '2024-04-12 10:50:55', 4010, 0.320000000000000007, 4651.60000000000036, 0, 0, 1, 1, '00000005', '00-00000015', 15, 36.8955550000000017, 126.069999999999993);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (89, 21, 22, 11, '2024-04-12 10:30:09', 1500, 80, 1740, 0, 0, 1, 1, '00000024', '00-00000006', 24, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (90, 21, 22, 11, '2024-04-12 10:33:32', 1500, 80, 1740, 0, 0, 1, 1, '00000025', '00-00000007', 25, 36.8955550000000017, 47.1599999999999966);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (93, 23, 23, 11, '2024-04-15 11:16:16', 910, 11.1999999999999993, 1055.59999999999991, 0, 0, 1, 1, '00000001', '00-00000001', 1, 36.5588880000000032, 28.870000000000001);
INSERT INTO public.t_ventas (id, idusuario, idempresa, idcliente, fecha, subtotal, impuesto, total, descuentos, igtf, idtipofactura, estatus, numerointerno, numerocontrol, secuencial, tasausd, totalusd) VALUES (94, 23, 23, 35, '2024-04-18 09:17:38', 60, 9.59999999999999964, 69.5999999999999943, 0, 0, 1, 1, '00000002', '00-00000002', 2, 36.5588880000000032, 1.89999999999999991);


--
-- TOC entry 2141 (class 0 OID 120985)
-- Dependencies: 195
-- Data for Name: t_ventas_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (49, 45, 1, 2345, 1, 375.199999999999989, 16, 2345, 0, 2720.19999999999982, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (50, 45, 4, 2500, 1, 200, 8, 2500, 0, 2700, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (51, 46, 5, 555, 1, 88.7999999999999972, 16, 555, 0, 643.799999999999955, 3);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (52, 46, 3, 300, 1, 48, 16, 300, 0, 348, 3);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (53, 47, 7, 666, 2, 0, 0, 1332, 0, 1332, 2);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (54, 48, 6, 500, 4, 80, 16, 2000, 0, 2080, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (55, 49, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (56, 50, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (57, 51, 6, 500, 5, 80, 16, 2500, 0, 2580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (58, 52, 8, 700, 3, 112, 16, 2100, 0, 2212, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (59, 52, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (60, 53, 2, 666, 9, 0, 0, 5994, 0, 5994, 2);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (61, 54, 7, 666, 9, 0, 0, 5994, 0, 5994, 2);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (62, 55, 5, 555, 4, 88.7999999999999972, 16, 2220, 0, 2308.80000000000018, 3);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (63, 56, 5, 555, 5, 88.7999999999999972, 16, 2775, 0, 2863.80000000000018, 3);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (64, 57, 9, 2, 22, 0.320000000000000007, 16, 44, 0, 44.3200000000000003, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (65, 58, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (66, 59, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (67, 60, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (68, 61, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (69, 62, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (70, 63, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4010.32000000000016, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (71, 64, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (72, 65, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (73, 66, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (74, 67, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (75, 68, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (76, 69, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (77, 70, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (78, 71, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (79, 72, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (80, 73, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (81, 74, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (82, 75, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (83, 76, 6, 500, 3, 80, 16, 1500, 0, 1500, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (84, 77, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (85, 78, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (86, 79, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (87, 80, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (88, 81, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (96, 89, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (97, 90, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (98, 91, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (99, 92, 9, 2, 2005, 0.320000000000000007, 16, 4010, 0, 4651.60000000000036, 1);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (100, 93, 10, 70, 13, 11.1999999999999993, 16, 910, 0, 1055.59999999999991, 2);
INSERT INTO public.t_ventas_items (id, idventa, idproducto, precio, cantidad, impuesto, tasa, subtotal, descuento, total, idunidad) VALUES (101, 94, 11, 60, 1, 9.59999999999999964, 16, 60, 0, 69.5999999999999943, 2);


--
-- TOC entry 1981 (class 2606 OID 120997)
-- Name: t_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_categorias
    ADD CONSTRAINT t_categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 1983 (class 2606 OID 120999)
-- Name: t_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT t_clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 1985 (class 2606 OID 121001)
-- Name: t_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 1989 (class 2606 OID 121003)
-- Name: t_holds_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_holds_items
    ADD CONSTRAINT t_holds_items_pkey PRIMARY KEY (id);


--
-- TOC entry 1987 (class 2606 OID 121005)
-- Name: t_holds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_holds
    ADD CONSTRAINT t_holds_pkey PRIMARY KEY (id);


--
-- TOC entry 1995 (class 2606 OID 121007)
-- Name: t_impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_impuestos
    ADD CONSTRAINT t_impuestos_pkey PRIMARY KEY (id);


--
-- TOC entry 2009 (class 2606 OID 129099)
-- Name: t_productos_compuesto_idproductopadre_idproductohijo_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_productos_compuesto
    ADD CONSTRAINT t_productos_compuesto_idproductopadre_idproductohijo_key UNIQUE (idproductopadre, idproductohijo);


--
-- TOC entry 1991 (class 2606 OID 121009)
-- Name: t_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_productos
    ADD CONSTRAINT t_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 1997 (class 2606 OID 121011)
-- Name: t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1999 (class 2606 OID 121013)
-- Name: t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 2001 (class 2606 OID 121015)
-- Name: t_tipofacturas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_tipofacturas
    ADD CONSTRAINT t_tipofacturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2003 (class 2606 OID 121017)
-- Name: t_unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_unidades
    ADD CONSTRAINT t_unidades_pkey PRIMARY KEY (id);


--
-- TOC entry 1993 (class 2606 OID 121019)
-- Name: t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2007 (class 2606 OID 121021)
-- Name: t_ventas_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_ventas_items
    ADD CONSTRAINT t_ventas_items_pkey PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 121023)
-- Name: t_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_ventas
    ADD CONSTRAINT t_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-04-18 12:56:14 -04

--
-- PostgreSQL database dump complete
--

