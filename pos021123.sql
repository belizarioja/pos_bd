--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-11-02 07:10:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 81966)
-- Name: t_categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200),
    idempresa bigint,
    descripcion character varying(500)
);


--
-- TOC entry 223 (class 1259 OID 81998)
-- Name: s_t_categorias_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_categorias_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 223
-- Name: s_t_categorias_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_categorias_id OWNED BY public.t_categorias.id;


--
-- TOC entry 230 (class 1259 OID 82043)
-- Name: t_clientes; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 231 (class 1259 OID 82050)
-- Name: s_t_clientes_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_clientes_id
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 231
-- Name: s_t_clientes_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_clientes_id OWNED BY public.t_clientes.id;


--
-- TOC entry 215 (class 1259 OID 81969)
-- Name: t_empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_empresas (
    id bigint NOT NULL,
    empresa character varying(200)
);


--
-- TOC entry 225 (class 1259 OID 82006)
-- Name: s_t_empresas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_empresas_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: s_t_empresas_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;


--
-- TOC entry 216 (class 1259 OID 81972)
-- Name: t_holds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_holds (
    id bigint NOT NULL,
    idusuario bigint,
    idcliente bigint,
    fecha timestamp without time zone
);


--
-- TOC entry 226 (class 1259 OID 82010)
-- Name: s_t_holds_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 226
-- Name: s_t_holds_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_id OWNED BY public.t_holds.id;


--
-- TOC entry 217 (class 1259 OID 81975)
-- Name: t_holds_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_holds_items (
    id bigint NOT NULL,
    idhold bigint,
    idproducto bigint,
    precio double precision,
    cantidad double precision,
    tasa double precision,
    total double precision,
    idunidad numeric(2,0)
);


--
-- TOC entry 227 (class 1259 OID 82014)
-- Name: s_t_holds_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_items_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 227
-- Name: s_t_holds_items_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_items_id OWNED BY public.t_holds_items.id;


--
-- TOC entry 219 (class 1259 OID 81981)
-- Name: t_productos; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 224 (class 1259 OID 82002)
-- Name: s_t_productos_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_productos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 224
-- Name: s_t_productos_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_productos_id OWNED BY public.t_productos.id;


--
-- TOC entry 221 (class 1259 OID 81989)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 222 (class 1259 OID 81994)
-- Name: s_t_usuarios_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 222
-- Name: s_t_usuarios_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_usuarios_id OWNED BY public.t_usuarios.id;


--
-- TOC entry 218 (class 1259 OID 81978)
-- Name: t_impuestos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_impuestos (
    id bigint NOT NULL,
    impuesto character varying(100),
    tasa double precision
);


--
-- TOC entry 220 (class 1259 OID 81986)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(100)
);


--
-- TOC entry 229 (class 1259 OID 82038)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100),
    abrev character varying(20)
);


--
-- TOC entry 228 (class 1259 OID 82033)
-- Name: t_unidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_unidades (
    id numeric(2,0) NOT NULL,
    unidad character varying(100)
);


--
-- TOC entry 3219 (class 2604 OID 81999)
-- Name: t_categorias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias ALTER COLUMN id SET DEFAULT nextval('public.s_t_categorias_id'::regclass);


--
-- TOC entry 3227 (class 2604 OID 82051)
-- Name: t_clientes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id SET DEFAULT nextval('public.s_t_clientes_id'::regclass);


--
-- TOC entry 3220 (class 2604 OID 82007)
-- Name: t_empresas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);


--
-- TOC entry 3221 (class 2604 OID 82011)
-- Name: t_holds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_id'::regclass);


--
-- TOC entry 3222 (class 2604 OID 82015)
-- Name: t_holds_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_items_id'::regclass);


--
-- TOC entry 3223 (class 2604 OID 82003)
-- Name: t_productos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos ALTER COLUMN id SET DEFAULT nextval('public.s_t_productos_id'::regclass);


--
-- TOC entry 3224 (class 2604 OID 81995)
-- Name: t_usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id SET DEFAULT nextval('public.s_t_usuarios_id'::regclass);


--
-- TOC entry 3392 (class 0 OID 81966)
-- Dependencies: 214
-- Data for Name: t_categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_categorias VALUES (3, 'Zapato', 20, 'Zapateria');
INSERT INTO public.t_categorias VALUES (4, 'Comida', 20, 'Restaurante');


--
-- TOC entry 3408 (class 0 OID 82043)
-- Dependencies: 230
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_clientes VALUES (11, 'jesus', 'ggggggg', 1, '11632453', '45345345345', 'rwerwerwrwerwerw');
INSERT INTO public.t_clientes VALUES (18, 'SUSEJ', 'DFGDFGDFGD', 1, '11222333', '234234234234', 'GHJFGHGFHGFHGF');


--
-- TOC entry 3393 (class 0 OID 81969)
-- Dependencies: 215
-- Data for Name: t_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_empresas VALUES (20, 'SMART');
INSERT INTO public.t_empresas VALUES (21, 'Pollos Lisboa');


--
-- TOC entry 3394 (class 0 OID 81972)
-- Dependencies: 216
-- Data for Name: t_holds; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3395 (class 0 OID 81975)
-- Dependencies: 217
-- Data for Name: t_holds_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3396 (class 0 OID 81978)
-- Dependencies: 218
-- Data for Name: t_impuestos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_impuestos VALUES (2, 'IVA (16%)', 16);
INSERT INTO public.t_impuestos VALUES (1, 'Exento', 0);
INSERT INTO public.t_impuestos VALUES (3, 'Reducido', 8);
INSERT INTO public.t_impuestos VALUES (4, 'Al lujo', 31);


--
-- TOC entry 3397 (class 0 OID 81981)
-- Dependencies: 219
-- Data for Name: t_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_productos VALUES (1, 'Deportivo', 'NIKE', 3, 1234, 2345, 2, 1, NULL, NULL);
INSERT INTO public.t_productos VALUES (2, 'Pollo a la broster', 'Un combo de pollo a la broster', 4, 555, 666, 1, 2, NULL, NULL);


--
-- TOC entry 3398 (class 0 OID 81986)
-- Dependencies: 220
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (2, 'Gerente');
INSERT INTO public.t_roles VALUES (3, 'Vendedor');


--
-- TOC entry 3407 (class 0 OID 82038)
-- Dependencies: 229
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Cédula de identidad', 'CI');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Pasaporte', 'PasP');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Registro información fiscal', 'RIF');


--
-- TOC entry 3406 (class 0 OID 82033)
-- Dependencies: 228
-- Data for Name: t_unidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_unidades VALUES (1, 'Pieza');
INSERT INTO public.t_unidades VALUES (2, 'Kilos');
INSERT INTO public.t_unidades VALUES (3, 'Litros');
INSERT INTO public.t_unidades VALUES (4, 'Metros');


--
-- TOC entry 3399 (class 0 OID 81989)
-- Dependencies: 221
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (20, 'admin', '123456', 'Padro Rojas', 'belizarioja@gmail.com', 1, 1, 0, 20);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 223
-- Name: s_t_categorias_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_categorias_id', 4, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 231
-- Name: s_t_clientes_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_clientes_id', 18, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 225
-- Name: s_t_empresas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_empresas_id', 21, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 226
-- Name: s_t_holds_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_id', 20, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 227
-- Name: s_t_holds_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_items_id', 20, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 224
-- Name: s_t_productos_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_productos_id', 2, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 222
-- Name: s_t_usuarios_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_usuarios_id', 20, true);


--
-- TOC entry 3229 (class 2606 OID 82001)
-- Name: t_categorias t_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias
    ADD CONSTRAINT t_categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 82049)
-- Name: t_clientes t_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT t_clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 82009)
-- Name: t_empresas t_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 82017)
-- Name: t_holds_items t_holds_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items
    ADD CONSTRAINT t_holds_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 82013)
-- Name: t_holds t_holds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds
    ADD CONSTRAINT t_holds_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 82019)
-- Name: t_impuestos t_impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_impuestos
    ADD CONSTRAINT t_impuestos_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 82005)
-- Name: t_productos t_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos
    ADD CONSTRAINT t_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 82021)
-- Name: t_roles t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 82042)
-- Name: t_tipodocumentos t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 82037)
-- Name: t_unidades t_unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_unidades
    ADD CONSTRAINT t_unidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 81997)
-- Name: t_usuarios t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


-- Completed on 2023-11-02 07:10:50

--
-- PostgreSQL database dump complete
--

