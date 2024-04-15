--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-03-22 11:29:39 -04

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
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 88113)
-- Name: t_categorias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200),
    idempresa bigint,
    descripcion character varying(500)
);


--
-- TOC entry 174 (class 1259 OID 88119)
-- Name: s_t_categorias_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_categorias_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 174
-- Name: s_t_categorias_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_categorias_id OWNED BY public.t_categorias.id;


--
-- TOC entry 175 (class 1259 OID 88121)
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
-- TOC entry 176 (class 1259 OID 88127)
-- Name: s_t_clientes_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_clientes_id
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 176
-- Name: s_t_clientes_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_clientes_id OWNED BY public.t_clientes.id;


--
-- TOC entry 177 (class 1259 OID 88129)
-- Name: t_empresas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_empresas (
    id bigint NOT NULL,
    empresa character varying(200),
    tasabcv double precision,
    urlfacturacion character varying(500),
    tokenfacturacion character varying(10000)
);


--
-- TOC entry 178 (class 1259 OID 88135)
-- Name: s_t_empresas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_empresas_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 178
-- Name: s_t_empresas_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;


--
-- TOC entry 179 (class 1259 OID 88137)
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
-- TOC entry 180 (class 1259 OID 88140)
-- Name: s_t_holds_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 180
-- Name: s_t_holds_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_id OWNED BY public.t_holds.id;


--
-- TOC entry 181 (class 1259 OID 88142)
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
-- TOC entry 182 (class 1259 OID 88145)
-- Name: s_t_holds_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_items_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 182
-- Name: s_t_holds_items_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_items_id OWNED BY public.t_holds_items.id;


--
-- TOC entry 183 (class 1259 OID 88147)
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
    inventario1 numeric(9,1)
);


--
-- TOC entry 184 (class 1259 OID 88153)
-- Name: s_t_productos_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_productos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 184
-- Name: s_t_productos_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_productos_id OWNED BY public.t_productos.id;


--
-- TOC entry 185 (class 1259 OID 88155)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_usuarios (
    id bigint NOT NULL,
    usuario character varying(100),
    clave character varying(100),
    nombre character varying(200),
    correo character varying(1000),
    idrol numeric(2,0),
    estatus numeric(2,0) DEFAULT 1 NOT NULL,
    resetearclave numeric(2,0) DEFAULT 0 NOT NULL,
    idempresa bigint
);


--
-- TOC entry 186 (class 1259 OID 88163)
-- Name: s_t_usuarios_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 186
-- Name: s_t_usuarios_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_usuarios_id OWNED BY public.t_usuarios.id;


--
-- TOC entry 192 (class 1259 OID 88211)
-- Name: s_t_ventas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_id
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 194 (class 1259 OID 96309)
-- Name: s_t_ventas_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_items_id
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 187 (class 1259 OID 88165)
-- Name: t_impuestos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_impuestos (
    id bigint NOT NULL,
    impuesto character varying(100),
    tasa double precision
);


--
-- TOC entry 188 (class 1259 OID 88168)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(100)
);


--
-- TOC entry 189 (class 1259 OID 88171)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100),
    abrev character varying(20)
);


--
-- TOC entry 195 (class 1259 OID 96327)
-- Name: t_tipofacturas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_tipofacturas (
    id numeric(2,0) NOT NULL,
    tipofactura character varying(100)
);


--
-- TOC entry 190 (class 1259 OID 88174)
-- Name: t_unidades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_unidades (
    id numeric(2,0) NOT NULL,
    unidad character varying(100)
);


--
-- TOC entry 191 (class 1259 OID 88177)
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
-- TOC entry 193 (class 1259 OID 96304)
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
-- TOC entry 1958 (class 2604 OID 88181)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias ALTER COLUMN id SET DEFAULT nextval('public.s_t_categorias_id'::regclass);


--
-- TOC entry 1959 (class 2604 OID 88182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id SET DEFAULT nextval('public.s_t_clientes_id'::regclass);


--
-- TOC entry 1960 (class 2604 OID 88183)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);


--
-- TOC entry 1961 (class 2604 OID 88184)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_id'::regclass);


--
-- TOC entry 1962 (class 2604 OID 88185)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_items_id'::regclass);


--
-- TOC entry 1963 (class 2604 OID 88186)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos ALTER COLUMN id SET DEFAULT nextval('public.s_t_productos_id'::regclass);


--
-- TOC entry 1966 (class 2604 OID 88187)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id SET DEFAULT nextval('public.s_t_usuarios_id'::regclass);


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 174
-- Name: s_t_categorias_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_categorias_id', 7, true);


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 176
-- Name: s_t_clientes_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_clientes_id', 32, true);


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 178
-- Name: s_t_empresas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_empresas_id', 21, true);


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 180
-- Name: s_t_holds_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_id', 63, true);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 182
-- Name: s_t_holds_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_items_id', 117, true);


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 184
-- Name: s_t_productos_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_productos_id', 7, true);


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 186
-- Name: s_t_usuarios_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_usuarios_id', 21, true);


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 192
-- Name: s_t_ventas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_id', 38, true);


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 194
-- Name: s_t_ventas_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_items_id', 36, true);


--
-- TOC entry 2108 (class 0 OID 88113)
-- Dependencies: 173
-- Data for Name: t_categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_categorias VALUES (3, 'Zapato', 20, 'Zapateria');
INSERT INTO public.t_categorias VALUES (4, 'Comida', 20, 'Restaurante');
INSERT INTO public.t_categorias VALUES (5, 'Lubricantes', 20, 'Aceite de motor, de caja y ligas de frenos');
INSERT INTO public.t_categorias VALUES (6, 'Peluquería', 22, 'Cepillos, Secadores, Tijeras, materiales de peluquería');
INSERT INTO public.t_categorias VALUES (7, 'Carniceria', 22, 'Carnes, Charcutería');


--
-- TOC entry 2110 (class 0 OID 88121)
-- Dependencies: 175
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_clientes VALUES (18, 'SUSEJ', 'DFGDFGDFGD', 1, '11222333', '234234234234', 'GHJFGHGFHGFHGF');
INSERT INTO public.t_clientes VALUES (11, 'JESÚS', 'ggggggg', 1, '11632453', '45345345345', 'rwerwerwrwerwerw');


--
-- TOC entry 2112 (class 0 OID 88129)
-- Dependencies: 177
-- Data for Name: t_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_empresas VALUES (20, 'SMART', 36.990000000000002, NULL, NULL);
INSERT INTO public.t_empresas VALUES (21, 'Pollos Lisboa', 0, NULL, NULL);
INSERT INTO public.t_empresas VALUES (22, 'PEQUEÑO EMISOR 56', 36.8988009999999989, 'http://localhost:5009/facturacion', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDQiLCJyaWYiOiJKLTAwMDAwMDU2LTUiLCJyYXpvbnNvY2lhbCI6IlBFUVVFw5FPIEVNSVNPUiA1NiIsImRpcmVjY2lvbiI6IkJvdWxldmFyZCBTYWJhbmEgR3JhbmRhLCBFc3F1aW5hIEVsIFJlY3JlbywgUHVlc3RvIDEzLUEiLCJlbWFpbCI6ImVtaXNvcjU2QGNvcnJlby5jb20iLCJ0ZWxlZm9ubyI6IjA0MTI4ODg1NTY2IiwidmFsaWRhcmludGVybm8iOiIyIn0sImlhdCI6MTcwOTgyNjgxMH0.CjG8yvJRcJ5PxvTBoM0UtJEagalzawsVmByyPXGOCTI');


--
-- TOC entry 2114 (class 0 OID 88137)
-- Dependencies: 179
-- Data for Name: t_holds; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2116 (class 0 OID 88142)
-- Dependencies: 181
-- Data for Name: t_holds_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2122 (class 0 OID 88165)
-- Dependencies: 187
-- Data for Name: t_impuestos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_impuestos VALUES (2, 'IVA (16%)', 16);
INSERT INTO public.t_impuestos VALUES (1, 'Exento', 0);
INSERT INTO public.t_impuestos VALUES (3, 'Reducido', 8);
INSERT INTO public.t_impuestos VALUES (4, 'Al lujo', 31);


--
-- TOC entry 2118 (class 0 OID 88147)
-- Dependencies: 183
-- Data for Name: t_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_productos VALUES (6, 'Secador de pelo OSTER 1234', 'Secador marca Oster', 6, 200, 500, 2, 1, NULL, 46.0);
INSERT INTO public.t_productos VALUES (5, 'Zoko', 'Zoko', 5, 333, 555, 2, 3, NULL, 30.0);
INSERT INTO public.t_productos VALUES (2, 'Pollo a la broster', 'Un combo de pollo a la broster', 4, 555, 666, 1, 2, '444444', 20.0);
INSERT INTO public.t_productos VALUES (3, 'Aceite de motor', 'PDV 15-40', 5, 200, 300, 2, 3, '123456', 100.0);
INSERT INTO public.t_productos VALUES (1, 'Deportivo', 'NIKE', 3, 1234, 2345, 2, 1, NULL, 10.0);
INSERT INTO public.t_productos VALUES (4, 'Casual', 'Kickers marrón', 3, 2000, 2500, 3, 1, '00022555', 121.0);
INSERT INTO public.t_productos VALUES (7, 'Pollo a la broster', 'Un combo de pollo a la broster', 4, 555, 666, 1, 2, '123456', 19.0);


--
-- TOC entry 2123 (class 0 OID 88168)
-- Dependencies: 188
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (2, 'Gerente');
INSERT INTO public.t_roles VALUES (3, 'Vendedor');


--
-- TOC entry 2124 (class 0 OID 88171)
-- Dependencies: 189
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Cédula de identidad', 'CI');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Pasaporte', 'PasP');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Registro información fiscal', 'RIF');


--
-- TOC entry 2130 (class 0 OID 96327)
-- Dependencies: 195
-- Data for Name: t_tipofacturas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipofacturas VALUES (1, 'Factura');
INSERT INTO public.t_tipofacturas VALUES (2, 'Nota de débito');
INSERT INTO public.t_tipofacturas VALUES (3, 'Nota de crédito');
INSERT INTO public.t_tipofacturas VALUES (4, 'Nota de entrega');
INSERT INTO public.t_tipofacturas VALUES (5, 'Guía de despacho');


--
-- TOC entry 2125 (class 0 OID 88174)
-- Dependencies: 190
-- Data for Name: t_unidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_unidades VALUES (1, 'Pieza');
INSERT INTO public.t_unidades VALUES (2, 'Kilos');
INSERT INTO public.t_unidades VALUES (3, 'Litros');
INSERT INTO public.t_unidades VALUES (4, 'Metros');


--
-- TOC entry 2120 (class 0 OID 88155)
-- Dependencies: 185
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (20, 'admin', '123456', 'Padro Rojas', 'belizarioja@gmail.com', 1, 1, 0, 20);
INSERT INTO public.t_usuarios VALUES (21, 'adminemisor56', '123456', 'Jesús Pérez', 'belizarioja@gmail.com', 1, 1, 0, 22);


--
-- TOC entry 2126 (class 0 OID 88177)
-- Dependencies: 191
-- Data for Name: t_ventas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas VALUES (26, 20, 20, 11, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.t_ventas VALUES (27, 20, 20, 11, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.t_ventas VALUES (28, 20, 20, 11, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.t_ventas VALUES (30, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000005', NULL, 5, NULL, NULL);
INSERT INTO public.t_ventas VALUES (29, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000004', NULL, 4, NULL, NULL);
INSERT INTO public.t_ventas VALUES (31, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000006', NULL, 6, NULL, NULL);
INSERT INTO public.t_ventas VALUES (32, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000007', NULL, 7, NULL, NULL);
INSERT INTO public.t_ventas VALUES (33, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000008', NULL, 8, NULL, NULL);
INSERT INTO public.t_ventas VALUES (34, 20, 20, 11, NULL, 6332, 200, 6532, 0, 0, 1, 1, '00000009', NULL, 9, NULL, NULL);
INSERT INTO public.t_ventas VALUES (35, 20, 20, 11, NULL, 1221, 88.7999999999999972, 1309.79999999999995, 0, 0, 1, 1, '00000010', NULL, 10, NULL, NULL);
INSERT INTO public.t_ventas VALUES (36, 20, 20, 11, NULL, 2232, 48, 2280, 0, 0, 1, 1, '00000011', NULL, 11, 36.990000000000002, 64.230000000000004);
INSERT INTO public.t_ventas VALUES (37, 20, 20, 11, '2024-03-21 09:30:30', 2220, 88.7999999999999972, 2308.80000000000018, 0, 0, 1, 1, '00000012', NULL, 12, 0, 'Infinity');
INSERT INTO public.t_ventas VALUES (38, 20, 20, 11, '2024-03-22 11:27:53', 4277, 423.199999999999989, 4700.19999999999982, 0, 0, 1, 1, '00000013', NULL, 13, 36.990000000000002, 128.360000000000014);


--
-- TOC entry 2128 (class 0 OID 96304)
-- Dependencies: 193
-- Data for Name: t_ventas_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas_items VALUES (15, 28, 4, 2500, 2, 200, 8, 5000, NULL, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (16, 28, 4, 2500, 2, 0, 8, 1332, NULL, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (17, 29, 4, 2500, 2, 200, 8, 5000, NULL, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (18, 29, 4, 2500, 2, 0, 8, 1332, NULL, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (19, 30, 4, 2500, 2, 200, 8, 5000, 0, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (20, 30, 4, 2500, 2, 0, 8, 1332, 0, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (21, 31, 4, 2500, 2, 200, 8, 5000, 0, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (22, 31, 4, 2500, 2, 0, 8, 1332, 0, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (23, 32, 4, 2500, 2, 200, 8, 5000, 0, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (24, 32, 4, 2500, 2, 0, 8, 1332, 0, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (25, 33, 4, 2500, 2, 200, 8, 5000, 0, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (26, 33, 4, 2500, 2, 0, 8, 1332, 0, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (27, 34, 4, 2500, 2, 200, 8, 5000, 0, 5200, 1);
INSERT INTO public.t_ventas_items VALUES (28, 34, 4, 2500, 2, 0, 8, 1332, 0, 1332, 1);
INSERT INTO public.t_ventas_items VALUES (29, 35, 5, 555, 1, 88.7999999999999972, 16, 555, 0, 643.799999999999955, 3);
INSERT INTO public.t_ventas_items VALUES (30, 35, 5, 555, 1, 0, 16, 666, 0, 666, 3);
INSERT INTO public.t_ventas_items VALUES (31, 36, 7, 666, 2, 0, 0, 1332, 0, 1332, 2);
INSERT INTO public.t_ventas_items VALUES (32, 36, 7, 666, 2, 48, 0, 900, 0, 948, 2);
INSERT INTO public.t_ventas_items VALUES (33, 37, 5, 555, 4, 88.7999999999999972, 16, 2220, 0, 2308.80000000000018, 3);
INSERT INTO public.t_ventas_items VALUES (34, 38, 2, 666, 2, 0, 0, 1332, 0, 1332, 2);
INSERT INTO public.t_ventas_items VALUES (35, 38, 2, 666, 2, 48, 0, 600, 0, 648, 2);
INSERT INTO public.t_ventas_items VALUES (36, 38, 2, 666, 2, 375.199999999999989, 0, 2345, 0, 2720.19999999999982, 2);


--
-- TOC entry 1972 (class 2606 OID 88189)
-- Name: t_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_categorias
    ADD CONSTRAINT t_categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 88191)
-- Name: t_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT t_clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 1976 (class 2606 OID 88193)
-- Name: t_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 88195)
-- Name: t_holds_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_holds_items
    ADD CONSTRAINT t_holds_items_pkey PRIMARY KEY (id);


--
-- TOC entry 1978 (class 2606 OID 88197)
-- Name: t_holds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_holds
    ADD CONSTRAINT t_holds_pkey PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 88199)
-- Name: t_impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_impuestos
    ADD CONSTRAINT t_impuestos_pkey PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 88201)
-- Name: t_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_productos
    ADD CONSTRAINT t_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 88203)
-- Name: t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 88205)
-- Name: t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 96331)
-- Name: t_tipofacturas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_tipofacturas
    ADD CONSTRAINT t_tipofacturas_pkey PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 88207)
-- Name: t_unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_unidades
    ADD CONSTRAINT t_unidades_pkey PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 88209)
-- Name: t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 96308)
-- Name: t_ventas_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_ventas_items
    ADD CONSTRAINT t_ventas_items_pkey PRIMARY KEY (id);


--
-- TOC entry 1994 (class 2606 OID 88215)
-- Name: t_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.t_ventas
    ADD CONSTRAINT t_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-03-22 11:29:39 -04

--
-- PostgreSQL database dump complete
--

