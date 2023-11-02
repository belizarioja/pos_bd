
CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200)
);

CREATE TABLE public.t_empresas (
    id bigint,
    empresa character varying(200)
);

CREATE TABLE public.t_holds (
    id bigint,
    idusuario bigint,
    idcliente bigint,
    fecha timestamp without time zone
);

CREATE TABLE public.t_holds_items (
    id bigint,
    idhold bigint,
    idproducto bigint,
    precio double precision,
    cantidad double precision,
    tasa double precision,
    total double precision,
    idunidad numeric(2,0)
);

CREATE TABLE public.t_impuestos (
    id bigint,
    impuesto character varying(100),
    tasa double precision
);

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

CREATE TABLE public.t_roles (
    id numeric(2,0),
    rol character varying(100)
);

CREATE TABLE public.t_usuarios (
    id bigint,
    usuario character varying(100),
    clave character varying(100),
    nombre character varying(200),
    correo character varying(1000),
    co_rol numeric(2,0),
    in_estatus numeric(2,0),
    in_resetear numeric(2,0)
);
