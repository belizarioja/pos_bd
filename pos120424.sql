--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-04-12 11:07:42

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
-- TOC entry 214 (class 1259 OID 147613)
-- Name: t_categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200),
    idempresa bigint,
    descripcion character varying(500)
);


--
-- TOC entry 215 (class 1259 OID 147618)
-- Name: s_t_categorias_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_categorias_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 215
-- Name: s_t_categorias_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_categorias_id OWNED BY public.t_categorias.id;


--
-- TOC entry 216 (class 1259 OID 147619)
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
-- TOC entry 217 (class 1259 OID 147624)
-- Name: s_t_clientes_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_clientes_id
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 217
-- Name: s_t_clientes_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_clientes_id OWNED BY public.t_clientes.id;


--
-- TOC entry 218 (class 1259 OID 147625)
-- Name: t_empresas; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 219 (class 1259 OID 147631)
-- Name: s_t_empresas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_empresas_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 219
-- Name: s_t_empresas_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;


--
-- TOC entry 220 (class 1259 OID 147632)
-- Name: t_holds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_holds (
    id bigint NOT NULL,
    idusuario bigint,
    idcliente bigint,
    fecha timestamp without time zone,
    idtipofactura numeric(2,0)
);


--
-- TOC entry 221 (class 1259 OID 147635)
-- Name: s_t_holds_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 221
-- Name: s_t_holds_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_id OWNED BY public.t_holds.id;


--
-- TOC entry 222 (class 1259 OID 147636)
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
    idunidad numeric(2,0),
    descuento double precision
);


--
-- TOC entry 223 (class 1259 OID 147639)
-- Name: s_t_holds_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_holds_items_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 223
-- Name: s_t_holds_items_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_holds_items_id OWNED BY public.t_holds_items.id;


--
-- TOC entry 224 (class 1259 OID 147640)
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
    inventario1 numeric(9,1),
    costousd double precision DEFAULT 0,
    preciousd double precision DEFAULT 0,
    utilidad double precision DEFAULT 0
);


--
-- TOC entry 225 (class 1259 OID 147648)
-- Name: s_t_productos_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_productos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 225
-- Name: s_t_productos_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_productos_id OWNED BY public.t_productos.id;


--
-- TOC entry 226 (class 1259 OID 147649)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 227 (class 1259 OID 147656)
-- Name: s_t_usuarios_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 227
-- Name: s_t_usuarios_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_usuarios_id OWNED BY public.t_usuarios.id;


--
-- TOC entry 228 (class 1259 OID 147657)
-- Name: s_t_ventas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_id
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;


--
-- TOC entry 229 (class 1259 OID 147658)
-- Name: s_t_ventas_items_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_ventas_items_id
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 147659)
-- Name: t_impuestos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_impuestos (
    id bigint NOT NULL,
    impuesto character varying(100),
    tasa double precision
);


--
-- TOC entry 231 (class 1259 OID 147662)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(100)
);


--
-- TOC entry 232 (class 1259 OID 147665)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100),
    abrev character varying(20)
);


--
-- TOC entry 233 (class 1259 OID 147668)
-- Name: t_tipofacturas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipofacturas (
    id numeric(2,0) NOT NULL,
    tipofactura character varying(100)
);


--
-- TOC entry 234 (class 1259 OID 147671)
-- Name: t_unidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_unidades (
    id numeric(2,0) NOT NULL,
    unidad character varying(100)
);


--
-- TOC entry 235 (class 1259 OID 147674)
-- Name: t_ventas; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 236 (class 1259 OID 147680)
-- Name: t_ventas_items; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 3233 (class 2604 OID 147684)
-- Name: t_categorias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias ALTER COLUMN id SET DEFAULT nextval('public.s_t_categorias_id'::regclass);


--
-- TOC entry 3234 (class 2604 OID 147685)
-- Name: t_clientes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id SET DEFAULT nextval('public.s_t_clientes_id'::regclass);


--
-- TOC entry 3235 (class 2604 OID 147686)
-- Name: t_empresas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);


--
-- TOC entry 3237 (class 2604 OID 147687)
-- Name: t_holds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_id'::regclass);


--
-- TOC entry 3238 (class 2604 OID 147688)
-- Name: t_holds_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_items_id'::regclass);


--
-- TOC entry 3239 (class 2604 OID 147689)
-- Name: t_productos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos ALTER COLUMN id SET DEFAULT nextval('public.s_t_productos_id'::regclass);


--
-- TOC entry 3243 (class 2604 OID 147690)
-- Name: t_usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id SET DEFAULT nextval('public.s_t_usuarios_id'::regclass);


--
-- TOC entry 3420 (class 0 OID 147613)
-- Dependencies: 214
-- Data for Name: t_categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_categorias VALUES (3, 'Zapato', 20, 'Zapateria');
INSERT INTO public.t_categorias VALUES (4, 'Comida', 20, 'Restaurante');
INSERT INTO public.t_categorias VALUES (5, 'Lubricantes', 20, 'Aceite de motor, de caja y ligas de frenos');
INSERT INTO public.t_categorias VALUES (6, 'Peluquería', 22, 'Cepillos, Secadores, Tijeras, materiales de peluquería');
INSERT INTO public.t_categorias VALUES (7, 'Carniceria', 22, 'Carnes, Charcutería');
INSERT INTO public.t_categorias VALUES (8, 'Facturacion Digital', 20, 'Creación de facturas y asignacion de numero correlativo');


--
-- TOC entry 3422 (class 0 OID 147619)
-- Dependencies: 216
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_clientes VALUES (33, 'Susej Antonella', 'belizarioja@gmail.com', 1, '10000000', '', '');
INSERT INTO public.t_clientes VALUES (34, 'EMPRESA DEMO', 'belizarioja@gmail.com', 3, 'J-12345678-9', '0212-1234567', 'Urbanización Don Rómulo Gallegos, calle 24 #183,Cumaná Estado Sucre.');
INSERT INTO public.t_clientes VALUES (18, 'SUSEJ', 'jesusb.sacs@gmail.com', 1, '11222333', '234234234234', 'GHJFGHGFHGFHGF');
INSERT INTO public.t_clientes VALUES (11, 'JESÚS', 'belizarioja@gmail.com', 1, '11632453', '45345345345', 'Urbanización Don Rómulo Gallegos, calle 24 #183');


--
-- TOC entry 3424 (class 0 OID 147625)
-- Dependencies: 218
-- Data for Name: t_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_empresas VALUES (21, 'Pollos Lisboa', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.t_empresas VALUES (22, 'PEQUEÑO EMISOR 56', 36.895555, 'http://192.168.1.4:5009/facturacion', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDQiLCJyaWYiOiJKLTAwMDAwMDU2LTUiLCJyYXpvbnNvY2lhbCI6IlBFUVVFw5FPIEVNSVNPUiA1NiIsImRpcmVjY2lvbiI6IkJvdWxldmFyZCBTYWJhbmEgR3JhbmRhLCBFc3F1aW5hIEVsIFJlY3JlbywgUHVlc3RvIDEzLUEiLCJlbWFpbCI6ImVtaXNvcjU2QGNvcnJlby5jb20iLCJ0ZWxlZm9ubyI6IjA0MTI4ODg1NTY2IiwidmFsaWRhcmludGVybm8iOiIyIn0sImlhdCI6MTcwOTgyNjgxMH0.CjG8yvJRcJ5PxvTBoM0UtJEagalzawsVmByyPXGOCTI', 'emisor56@gmail.com', '+584245556666', 'Caracas, Venezuela', 'J-00000056-5', 1);
INSERT INTO public.t_empresas VALUES (20, 'SMART INNOVACIONES TECNOLOGICAS', 36.895555, 'https://bck-test.factura-smart.com/facturacion', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDEiLCJyaWYiOiJKLTUwMzc1NzkwLTYiLCJyYXpvbnNvY2lhbCI6IlNNQVJUIElOTk9WQUNJT05FUyBURUNOT0xPR0lDQVMiLCJkaXJlY2Npb24iOiJBdi4gTGliZXJ0YWRvciB5IEF2LiBGcmFuY2lzY28gZGUgTWlyYW5kYS4gTXVsdGljZW50cm8gRW1wcmVzYXJpYWwgZGVsIEVzdGUuIFRvcnJlIEIuIFBpc28gMTUuIE9maWMgQi0xNTIuIENoYWNhby4gRWRvLiBNaXJhbmRhLiIsImVtYWlsIjoiYWRtaW5pc3RyYWNpb25Ac21hcnRpbnRlYy5uZXQiLCJ0ZWxlZm9ubyI6IjAyMTItNzUwNDAwNyIsInZhbGlkYXJpbnRlcm5vIjoiMiJ9LCJpYXQiOjE3MTA2ODQyNjN9.kouWmmEtMwIvrSPbPnVEKQ_1VgFo5LTHsh0_X2ytZZM', 'administracion@smartintec.net', '0212-7504007', 'Av. Libertador y Av. Francisco de Miranda. Multicentro Empresarial del Este. Torre B. Piso 15. Ofic B-152. Chacao. Edo. Miranda.', 'J-50375790-6', 0);


--
-- TOC entry 3426 (class 0 OID 147632)
-- Dependencies: 220
-- Data for Name: t_holds; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3428 (class 0 OID 147636)
-- Dependencies: 222
-- Data for Name: t_holds_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3436 (class 0 OID 147659)
-- Dependencies: 230
-- Data for Name: t_impuestos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_impuestos VALUES (2, 'IVA (16%)', 16);
INSERT INTO public.t_impuestos VALUES (1, 'Exento', 0);
INSERT INTO public.t_impuestos VALUES (3, 'Reducido', 8);
INSERT INTO public.t_impuestos VALUES (4, 'Al lujo', 31);


--
-- TOC entry 3430 (class 0 OID 147640)
-- Dependencies: 224
-- Data for Name: t_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_productos VALUES (8, 'Paño ACM', 'Paño amarillo', 6, 450, 700, 2, 1, '444333', 45.0, 0, 0, 0);
INSERT INTO public.t_productos VALUES (3, 'Aceite de motor', 'PDV 15-40', 5, 200, 300, 2, 3, '123456', 100.0, 5.41, 8.11, 50);
INSERT INTO public.t_productos VALUES (5, 'Zoko', 'Zoko', 5, 333, 555, 2, 3, NULL, 26.0, 0, 0, 0);
INSERT INTO public.t_productos VALUES (2, 'Pollo a la broster', 'Un combo de pollo a la broster', 4, 555, 666, 1, 2, '444444', 29.0, 15, 18, 20);
INSERT INTO public.t_productos VALUES (1, 'Deportivo', 'NIKE', 3, 1234, 2345, 2, 1, NULL, 10.0, 33.35, 63.38, 90.03);
INSERT INTO public.t_productos VALUES (4, 'Casual', 'Kickers marrón', 3, 2000, 2500, 3, 1, '00022555', 121.0, 54.06, 67.57, 25);
INSERT INTO public.t_productos VALUES (7, 'Pollo a la brasa', 'Un combo de pollo a la brasa', 4, 555, 666, 1, 2, '123456', 19.0, 15, 18, 20);
INSERT INTO public.t_productos VALUES (9, 'Plan Bronce', 'Plan dirigidos a negocios pequeños ', 8, 0, 2, 2, 1, '002255', 49970.0, 0, 0.05, 0);
INSERT INTO public.t_productos VALUES (6, 'Secador de pelo OSTER 1234', 'Secador marca Oster', 6, 200, 500, 2, 1, '232323', 43.0, 0, 0, 0);


--
-- TOC entry 3437 (class 0 OID 147662)
-- Dependencies: 231
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (2, 'Gerente');
INSERT INTO public.t_roles VALUES (3, 'Vendedor');


--
-- TOC entry 3438 (class 0 OID 147665)
-- Dependencies: 232
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Cédula de identidad', 'CI');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Pasaporte', 'PasP');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Registro información fiscal', 'RIF');


--
-- TOC entry 3439 (class 0 OID 147668)
-- Dependencies: 233
-- Data for Name: t_tipofacturas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipofacturas VALUES (1, 'Factura');
INSERT INTO public.t_tipofacturas VALUES (2, 'Nota de débito');
INSERT INTO public.t_tipofacturas VALUES (3, 'Nota de crédito');
INSERT INTO public.t_tipofacturas VALUES (4, 'Nota de entrega');
INSERT INTO public.t_tipofacturas VALUES (5, 'Guía de despacho');


--
-- TOC entry 3440 (class 0 OID 147671)
-- Dependencies: 234
-- Data for Name: t_unidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_unidades VALUES (1, 'Pieza');
INSERT INTO public.t_unidades VALUES (2, 'Kilos');
INSERT INTO public.t_unidades VALUES (3, 'Litros');
INSERT INTO public.t_unidades VALUES (4, 'Metros');


--
-- TOC entry 3432 (class 0 OID 147649)
-- Dependencies: 226
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (20, 'admin', '123456', 'María Rojas', 'belizarioja@gmail.com', 1, 1, 0, 20);
INSERT INTO public.t_usuarios VALUES (22, 'emisor561', '123456', 'Caja 1', 'belizariojabe@gmail.com', 3, 1, 0, 22);
INSERT INTO public.t_usuarios VALUES (21, 'adminemisor56', '123456', 'Jesús Pérez', 'belizarioja@gmail.com', 2, 1, 0, 22);


--
-- TOC entry 3441 (class 0 OID 147674)
-- Dependencies: 235
-- Data for Name: t_ventas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas VALUES (45, 20, 20, 11, '2024-03-27 12:38:41', 4845, 575.2, 5420.2, 0, 0, 1, 1, '00000001', NULL, 1, 36.997755, 146.5);
INSERT INTO public.t_ventas VALUES (46, 20, 20, 11, '2024-03-27 12:45:32', 855, 136.8, 991.8, 0, 0, 1, 1, '00000002', NULL, 2, 36.997755, 26.81);
INSERT INTO public.t_ventas VALUES (47, 20, 20, 33, '2024-03-27 12:48:16', 1332, 0, 1332, 0, 0, 1, 1, '00000003', NULL, 3, 36.997755, 36);
INSERT INTO public.t_ventas VALUES (48, 21, 22, 33, '2024-03-27 19:46:28', 2000, 80, 2080, 0, 0, 1, 1, '00000001', NULL, 1, 36.895555, 62.88);
INSERT INTO public.t_ventas VALUES (49, 22, 22, 11, '2024-03-27 20:26:41', 500, 80, 580, 0, 0, 1, 1, '00000002', NULL, 2, 36.895555, 15.72);
INSERT INTO public.t_ventas VALUES (50, 22, 22, 11, '2024-03-27 21:18:50', 500, 80, 580, 0, 0, 1, 1, '00000003', NULL, 3, 36.895555, 15.72);
INSERT INTO public.t_ventas VALUES (51, 22, 22, 33, '2024-03-27 21:23:36', 2500, 80, 2580, 0, 0, 1, 1, '00000004', NULL, 4, 36.895555, 78.6);
INSERT INTO public.t_ventas VALUES (52, 21, 22, 33, '2024-04-02 10:01:13', 2600, 192, 2792, 0, 0, 1, 2, '00000005', NULL, 5, 36.895555, 81.74);
INSERT INTO public.t_ventas VALUES (54, 20, 20, 11, '2024-04-04 09:37:21', 5994, 0, 5994, 0, 0, 1, 1, '00000005', NULL, 5, 36.997755, 162.01);
INSERT INTO public.t_ventas VALUES (55, 20, 20, 11, '2024-04-04 10:12:58', 2220, 88.8, 2308.8, 0, 0, 1, 1, '00000006', NULL, 6, 36.997755, 69.6);
INSERT INTO public.t_ventas VALUES (56, 20, 20, 33, '2024-04-04 10:18:54', 2775, 88.8, 2863.8, 0, 0, 1, 2, '00000007', NULL, 7, 36.997755, 87.01);
INSERT INTO public.t_ventas VALUES (57, 20, 20, 33, '2024-04-04 16:13:19', 44, 0.32, 44.32, 0, 0, 1, 1, '00000008', NULL, 8, 36.997755, 1.38);
INSERT INTO public.t_ventas VALUES (53, 20, 20, 33, '2024-04-04 09:35:14', 5994, 0, 5994, 0, 0, 1, 2, '00000004', NULL, 4, 36.997755, 162.01);
INSERT INTO public.t_ventas VALUES (58, 20, 20, 34, '2024-04-12 07:08:53', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 9, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (59, 20, 20, 34, '2024-04-12 08:58:18', 4010, 0.32, 4010.32, 0, 0, 1, 1, '00000010', NULL, 10, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (60, 20, 20, 34, '2024-04-12 09:03:09', 4010, 0.32, 4010.32, 0, 0, 1, 1, '00000011', NULL, 11, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (61, 20, 20, 34, '2024-04-12 09:04:11', 4010, 0.32, 4010.32, 0, 0, 1, 1, '00000012', NULL, 12, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (62, 20, 20, 34, '2024-04-12 09:04:59', 4010, 0.32, 4010.32, 0, 0, 1, 1, '00000013', NULL, 13, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (63, 20, 20, 34, '2024-04-12 09:10:41', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 14, 36.997755, 125.73);
INSERT INTO public.t_ventas VALUES (64, 21, 22, 11, '2024-04-12 09:31:13', 1500, 80, 1580, 0, 0, 1, 1, '00000006', NULL, 6, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (65, 21, 22, 11, '2024-04-12 09:33:01', 1500, 80, 1580, 0, 0, 1, 1, '00000007', NULL, 7, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (66, 21, 22, 11, '2024-04-12 09:34:53', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 8, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (67, 21, 22, 11, '2024-04-12 09:37:47', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 9, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (68, 21, 22, 11, '2024-04-12 09:38:55', 1500, 80, 1580, 0, 0, 1, 1, '00000010', NULL, 10, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (69, 21, 22, 11, '2024-04-12 09:43:44', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 11, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (70, 21, 22, 11, '2024-04-12 09:45:06', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 12, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (71, 21, 22, 11, '2024-04-12 09:47:21', 1500, 80, 1580, 0, 0, 1, 1, '00000013', NULL, 13, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (72, 21, 22, 11, '2024-04-12 09:48:58', 1500, 80, 1580, 0, 0, 1, 1, '00000014', NULL, 14, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (73, 21, 22, 11, '2024-04-12 09:52:40', 1500, 80, 1580, 0, 0, 1, 1, '00000015', NULL, 15, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (74, 21, 22, 11, '2024-04-12 09:54:44', 1500, 80, 1740, 0, 0, 1, 1, '00000016', NULL, 16, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (75, 21, 22, 11, '2024-04-12 09:56:15', 1500, 80, 1740, 0, 0, 1, 1, '00000017', NULL, 17, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (76, 21, 22, 11, '2024-04-12 09:57:02', 1500, 80, 1740, 0, 0, 1, 1, '00000018', NULL, 18, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (77, 21, 22, 11, '2024-04-12 09:58:39', 1500, 80, 1740, 0, 0, 1, 1, '00000019', NULL, 19, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (78, 21, 22, 11, '2024-04-12 10:10:38', 1500, 80, 1740, 0, 0, 1, 1, '00000020', NULL, 20, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (79, 21, 22, 11, '2024-04-12 10:12:10', 1500, 80, 1740, 0, 0, 1, 1, '00000021', NULL, 21, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (80, 21, 22, 11, '2024-04-12 10:14:02', 1500, 80, 1740, 0, 0, 1, 1, '00000022', NULL, 22, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (81, 21, 22, 11, '2024-04-12 10:14:24', 1500, 80, 1740, 0, 0, 1, 1, '00000023', NULL, 23, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (91, 21, 22, 11, '2024-04-12 10:36:50', 1500, 80, 1740, 0, 0, 1, 1, '00000026', '00-00000008', 26, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (92, 20, 20, 34, '2024-04-12 10:50:55', 4010, 0.32, 4651.6, 0, 0, 1, 1, '00000005', '00-00000015', 15, 36.895555, 126.07);
INSERT INTO public.t_ventas VALUES (89, 21, 22, 11, '2024-04-12 10:30:09', 1500, 80, 1740, 0, 0, 1, 1, '00000024', '00-00000006', 24, 36.895555, 47.16);
INSERT INTO public.t_ventas VALUES (90, 21, 22, 11, '2024-04-12 10:33:32', 1500, 80, 1740, 0, 0, 1, 1, '00000025', '00-00000007', 25, 36.895555, 47.16);


--
-- TOC entry 3442 (class 0 OID 147680)
-- Dependencies: 236
-- Data for Name: t_ventas_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ventas_items VALUES (49, 45, 1, 2345, 1, 375.2, 16, 2345, 0, 2720.2, 1);
INSERT INTO public.t_ventas_items VALUES (50, 45, 4, 2500, 1, 200, 8, 2500, 0, 2700, 1);
INSERT INTO public.t_ventas_items VALUES (51, 46, 5, 555, 1, 88.8, 16, 555, 0, 643.8, 3);
INSERT INTO public.t_ventas_items VALUES (52, 46, 3, 300, 1, 48, 16, 300, 0, 348, 3);
INSERT INTO public.t_ventas_items VALUES (53, 47, 7, 666, 2, 0, 0, 1332, 0, 1332, 2);
INSERT INTO public.t_ventas_items VALUES (54, 48, 6, 500, 4, 80, 16, 2000, 0, 2080, 1);
INSERT INTO public.t_ventas_items VALUES (55, 49, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items VALUES (56, 50, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items VALUES (57, 51, 6, 500, 5, 80, 16, 2500, 0, 2580, 1);
INSERT INTO public.t_ventas_items VALUES (58, 52, 8, 700, 3, 112, 16, 2100, 0, 2212, 1);
INSERT INTO public.t_ventas_items VALUES (59, 52, 6, 500, 1, 80, 16, 500, 0, 580, 1);
INSERT INTO public.t_ventas_items VALUES (60, 53, 2, 666, 9, 0, 0, 5994, 0, 5994, 2);
INSERT INTO public.t_ventas_items VALUES (61, 54, 7, 666, 9, 0, 0, 5994, 0, 5994, 2);
INSERT INTO public.t_ventas_items VALUES (62, 55, 5, 555, 4, 88.8, 16, 2220, 0, 2308.8, 3);
INSERT INTO public.t_ventas_items VALUES (63, 56, 5, 555, 5, 88.8, 16, 2775, 0, 2863.8, 3);
INSERT INTO public.t_ventas_items VALUES (64, 57, 9, 2, 22, 0.32, 16, 44, 0, 44.32, 1);
INSERT INTO public.t_ventas_items VALUES (65, 58, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (66, 59, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (67, 60, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (68, 61, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (69, 62, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (70, 63, 9, 2, 2005, 0.32, 16, 4010, 0, 4010.32, 1);
INSERT INTO public.t_ventas_items VALUES (71, 64, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (72, 65, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (73, 66, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (74, 67, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (75, 68, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (76, 69, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (77, 70, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (78, 71, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (79, 72, 6, 500, 3, 80, 16, 1500, 0, 1580, 1);
INSERT INTO public.t_ventas_items VALUES (80, 73, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (81, 74, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (82, 75, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (83, 76, 6, 500, 3, 80, 16, 1500, 0, 1500, 1);
INSERT INTO public.t_ventas_items VALUES (84, 77, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (85, 78, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (86, 79, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (87, 80, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (88, 81, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (96, 89, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (97, 90, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (98, 91, 6, 500, 3, 80, 16, 1500, 0, 1740, 1);
INSERT INTO public.t_ventas_items VALUES (99, 92, 9, 2, 2005, 0.32, 16, 4010, 0, 4651.6, 1);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 215
-- Name: s_t_categorias_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_categorias_id', 8, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 217
-- Name: s_t_clientes_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_clientes_id', 34, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 219
-- Name: s_t_empresas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_empresas_id', 21, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 221
-- Name: s_t_holds_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_id', 89, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 223
-- Name: s_t_holds_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_holds_items_id', 155, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 225
-- Name: s_t_productos_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_productos_id', 9, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 227
-- Name: s_t_usuarios_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_usuarios_id', 22, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 228
-- Name: s_t_ventas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_id', 92, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 229
-- Name: s_t_ventas_items_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_ventas_items_id', 99, true);


--
-- TOC entry 3251 (class 2606 OID 147692)
-- Name: t_categorias t_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_categorias
    ADD CONSTRAINT t_categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 147694)
-- Name: t_clientes t_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT t_clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 147696)
-- Name: t_empresas t_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 147698)
-- Name: t_holds_items t_holds_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds_items
    ADD CONSTRAINT t_holds_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 147700)
-- Name: t_holds t_holds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_holds
    ADD CONSTRAINT t_holds_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 147702)
-- Name: t_impuestos t_impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_impuestos
    ADD CONSTRAINT t_impuestos_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 147704)
-- Name: t_productos t_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_productos
    ADD CONSTRAINT t_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 147706)
-- Name: t_roles t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 147708)
-- Name: t_tipodocumentos t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 147710)
-- Name: t_tipofacturas t_tipofacturas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipofacturas
    ADD CONSTRAINT t_tipofacturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 147712)
-- Name: t_unidades t_unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_unidades
    ADD CONSTRAINT t_unidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 147714)
-- Name: t_usuarios t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 147716)
-- Name: t_ventas_items t_ventas_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_ventas_items
    ADD CONSTRAINT t_ventas_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 147718)
-- Name: t_ventas t_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_ventas
    ADD CONSTRAINT t_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-04-12 11:07:42

--
-- PostgreSQL database dump complete
--

