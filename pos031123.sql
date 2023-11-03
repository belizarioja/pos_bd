PGDMP     ;    0            
    {            puntodeventa    15.3    15.3 A    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    81937    puntodeventa    DATABASE     �   CREATE DATABASE puntodeventa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE puntodeventa;
                postgres    false            �            1259    81966    t_categorias    TABLE     �   CREATE TABLE public.t_categorias (
    id bigint NOT NULL,
    categoria character varying(200),
    idempresa bigint,
    descripcion character varying(500)
);
     DROP TABLE public.t_categorias;
       public         heap    postgres    false            �            1259    81998    s_t_categorias_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_categorias_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;
 (   DROP SEQUENCE public.s_t_categorias_id;
       public          postgres    false    214            X           0    0    s_t_categorias_id    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.s_t_categorias_id OWNED BY public.t_categorias.id;
          public          postgres    false    223            �            1259    82043 
   t_clientes    TABLE       CREATE TABLE public.t_clientes (
    id bigint NOT NULL,
    nombre character varying(500),
    correo character varying(500),
    idtipodocumento numeric(2,0),
    documento character varying(100),
    telefono character varying(100),
    direccion character varying(500)
);
    DROP TABLE public.t_clientes;
       public         heap    postgres    false            �            1259    82050    s_t_clientes_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_clientes_id
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;
 &   DROP SEQUENCE public.s_t_clientes_id;
       public          postgres    false    230            Y           0    0    s_t_clientes_id    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.s_t_clientes_id OWNED BY public.t_clientes.id;
          public          postgres    false    231            �            1259    81969 
   t_empresas    TABLE     _   CREATE TABLE public.t_empresas (
    id bigint NOT NULL,
    empresa character varying(200)
);
    DROP TABLE public.t_empresas;
       public         heap    postgres    false            �            1259    82006    s_t_empresas_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_empresas_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;
 &   DROP SEQUENCE public.s_t_empresas_id;
       public          postgres    false    215            Z           0    0    s_t_empresas_id    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;
          public          postgres    false    225            �            1259    81972    t_holds    TABLE     �   CREATE TABLE public.t_holds (
    id bigint NOT NULL,
    idusuario bigint,
    idcliente bigint,
    fecha timestamp without time zone
);
    DROP TABLE public.t_holds;
       public         heap    postgres    false            �            1259    82010    s_t_holds_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_holds_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;
 #   DROP SEQUENCE public.s_t_holds_id;
       public          postgres    false    216            [           0    0    s_t_holds_id    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.s_t_holds_id OWNED BY public.t_holds.id;
          public          postgres    false    226            �            1259    81975    t_holds_items    TABLE     �   CREATE TABLE public.t_holds_items (
    id bigint NOT NULL,
    idhold bigint,
    idproducto bigint,
    precio double precision,
    cantidad double precision,
    tasa double precision,
    total double precision,
    idunidad numeric(2,0)
);
 !   DROP TABLE public.t_holds_items;
       public         heap    postgres    false            �            1259    82014    s_t_holds_items_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_holds_items_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;
 )   DROP SEQUENCE public.s_t_holds_items_id;
       public          postgres    false    217            \           0    0    s_t_holds_items_id    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.s_t_holds_items_id OWNED BY public.t_holds_items.id;
          public          postgres    false    227            �            1259    81981    t_productos    TABLE     P  CREATE TABLE public.t_productos (
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
    DROP TABLE public.t_productos;
       public         heap    postgres    false            �            1259    82002    s_t_productos_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_productos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999
    CACHE 1;
 '   DROP SEQUENCE public.s_t_productos_id;
       public          postgres    false    219            ]           0    0    s_t_productos_id    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.s_t_productos_id OWNED BY public.t_productos.id;
          public          postgres    false    224            �            1259    81989 
   t_usuarios    TABLE     V  CREATE TABLE public.t_usuarios (
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
    DROP TABLE public.t_usuarios;
       public         heap    postgres    false            �            1259    81994    s_t_usuarios_id    SEQUENCE     �   CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;
 &   DROP SEQUENCE public.s_t_usuarios_id;
       public          postgres    false    221            ^           0    0    s_t_usuarios_id    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.s_t_usuarios_id OWNED BY public.t_usuarios.id;
          public          postgres    false    222            �            1259    81978    t_impuestos    TABLE     |   CREATE TABLE public.t_impuestos (
    id bigint NOT NULL,
    impuesto character varying(100),
    tasa double precision
);
    DROP TABLE public.t_impuestos;
       public         heap    postgres    false            �            1259    81986    t_roles    TABLE     ^   CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(100)
);
    DROP TABLE public.t_roles;
       public         heap    postgres    false            �            1259    82038    t_tipodocumentos    TABLE     �   CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100),
    abrev character varying(20)
);
 $   DROP TABLE public.t_tipodocumentos;
       public         heap    postgres    false            �            1259    82033 
   t_unidades    TABLE     d   CREATE TABLE public.t_unidades (
    id numeric(2,0) NOT NULL,
    unidad character varying(100)
);
    DROP TABLE public.t_unidades;
       public         heap    postgres    false            �           2604    81999    t_categorias id    DEFAULT     p   ALTER TABLE ONLY public.t_categorias ALTER COLUMN id SET DEFAULT nextval('public.s_t_categorias_id'::regclass);
 >   ALTER TABLE public.t_categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    214            �           2604    82051    t_clientes id    DEFAULT     l   ALTER TABLE ONLY public.t_clientes ALTER COLUMN id SET DEFAULT nextval('public.s_t_clientes_id'::regclass);
 <   ALTER TABLE public.t_clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            �           2604    82007    t_empresas id    DEFAULT     l   ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);
 <   ALTER TABLE public.t_empresas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    215            �           2604    82011 
   t_holds id    DEFAULT     f   ALTER TABLE ONLY public.t_holds ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_id'::regclass);
 9   ALTER TABLE public.t_holds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    216            �           2604    82015    t_holds_items id    DEFAULT     r   ALTER TABLE ONLY public.t_holds_items ALTER COLUMN id SET DEFAULT nextval('public.s_t_holds_items_id'::regclass);
 ?   ALTER TABLE public.t_holds_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    217            �           2604    82003    t_productos id    DEFAULT     n   ALTER TABLE ONLY public.t_productos ALTER COLUMN id SET DEFAULT nextval('public.s_t_productos_id'::regclass);
 =   ALTER TABLE public.t_productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    219            �           2604    81995    t_usuarios id    DEFAULT     l   ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id SET DEFAULT nextval('public.s_t_usuarios_id'::regclass);
 <   ALTER TABLE public.t_usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            @          0    81966    t_categorias 
   TABLE DATA                 public          postgres    false    214   �C       P          0    82043 
   t_clientes 
   TABLE DATA                 public          postgres    false    230   6D       A          0    81969 
   t_empresas 
   TABLE DATA                 public          postgres    false    215   �D       B          0    81972    t_holds 
   TABLE DATA                 public          postgres    false    216   2E       C          0    81975    t_holds_items 
   TABLE DATA                 public          postgres    false    217   LE       D          0    81978    t_impuestos 
   TABLE DATA                 public          postgres    false    218   fE       E          0    81981    t_productos 
   TABLE DATA                 public          postgres    false    219   �E       F          0    81986    t_roles 
   TABLE DATA                 public          postgres    false    220   �F       O          0    82038    t_tipodocumentos 
   TABLE DATA                 public          postgres    false    229   �F       N          0    82033 
   t_unidades 
   TABLE DATA                 public          postgres    false    228   �G       G          0    81989 
   t_usuarios 
   TABLE DATA                 public          postgres    false    221   
H       _           0    0    s_t_categorias_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.s_t_categorias_id', 4, true);
          public          postgres    false    223            `           0    0    s_t_clientes_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.s_t_clientes_id', 18, true);
          public          postgres    false    231            a           0    0    s_t_empresas_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.s_t_empresas_id', 21, true);
          public          postgres    false    225            b           0    0    s_t_holds_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.s_t_holds_id', 20, false);
          public          postgres    false    226            c           0    0    s_t_holds_items_id    SEQUENCE SET     B   SELECT pg_catalog.setval('public.s_t_holds_items_id', 20, false);
          public          postgres    false    227            d           0    0    s_t_productos_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.s_t_productos_id', 2, true);
          public          postgres    false    224            e           0    0    s_t_usuarios_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.s_t_usuarios_id', 20, true);
          public          postgres    false    222            �           2606    82001    t_categorias t_categorias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_categorias
    ADD CONSTRAINT t_categorias_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.t_categorias DROP CONSTRAINT t_categorias_pkey;
       public            postgres    false    214            �           2606    82049    t_clientes t_clientes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT t_clientes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_clientes DROP CONSTRAINT t_clientes_pkey;
       public            postgres    false    230            �           2606    82009    t_empresas t_empresas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_empresas DROP CONSTRAINT t_empresas_pkey;
       public            postgres    false    215            �           2606    82017     t_holds_items t_holds_items_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.t_holds_items
    ADD CONSTRAINT t_holds_items_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.t_holds_items DROP CONSTRAINT t_holds_items_pkey;
       public            postgres    false    217            �           2606    82013    t_holds t_holds_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.t_holds
    ADD CONSTRAINT t_holds_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.t_holds DROP CONSTRAINT t_holds_pkey;
       public            postgres    false    216            �           2606    82019    t_impuestos t_impuestos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_impuestos
    ADD CONSTRAINT t_impuestos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.t_impuestos DROP CONSTRAINT t_impuestos_pkey;
       public            postgres    false    218            �           2606    82005    t_productos t_productos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_productos
    ADD CONSTRAINT t_productos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.t_productos DROP CONSTRAINT t_productos_pkey;
       public            postgres    false    219            �           2606    82021    t_roles t_roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.t_roles DROP CONSTRAINT t_roles_pkey;
       public            postgres    false    220            �           2606    82042 &   t_tipodocumentos t_tipodocumentos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.t_tipodocumentos DROP CONSTRAINT t_tipodocumentos_pkey;
       public            postgres    false    229            �           2606    82037    t_unidades t_unidades_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_unidades
    ADD CONSTRAINT t_unidades_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_unidades DROP CONSTRAINT t_unidades_pkey;
       public            postgres    false    228            �           2606    81997    t_usuarios t_usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_usuarios DROP CONSTRAINT t_usuarios_pkey;
       public            postgres    false    221            @   e   x���v
Q���W((M��L�+�ON,IM�/�L,Vs�	uV�0�QP�J,H,�W�Q02��R���5��<�4���9?73%fLPjqIbiQb^I*� .. �,Y      P   �   x���v
Q���W((M��L�+�O��L�+I-Vs�	uV�04�QP�J-.-V2�! �	����d���E�`��5��<����=84��d���;��42226�idlG ������������ �\=l      A   S   x���v
Q���W((M��L�+�O�-(J-N,Vs�	uV�02�QP�u
Q״��$N�!PO@~NN~��OfqR~"H/ ��"2      B   
   x���          C   
   x���          D   v   x���v
Q���W((M��L�+���-(M-.�/Vs�	uV�0�QP�sT�04S�T�Q04Ӵ��$N�!P�kEj^I>P�������RSJ�3S@:-��i�阣�S��hl��� /ME(      E   �   x����
�0E�~�ݪ��6����Ŷ�Ҵ
�������8��˅�8W�<7P�9�-�N�&\��a�͸쫶��J�bt������V��3H�l+�ș\t[U�w��O���%t���9��ej���f����y�r)�[�~-��'�@�      F   [   x���v
Q���W((M��L�+�/��I-Vs�	uV�0�QPwL����,.)JL�/R״��$����=�(5�$�H�@a�y)�PK�� ��0�      O   �   x���v
Q���W((M��L�+�/�,�O�O.�M�+�/Vs�	uV�0�QPw>�2�4'Q!%U!3(������T״��$�4#�����Ă���Tu'�TC����R�3�K��2���r�3o�SH�,NN����2�� �|L�      N   [   x���v
Q���W((M��L�+�/��LILI-Vs�	uV�0�QP�L�JT״��$J�P�wfN~1�Z��Z|2K�H�c��
��� D�?A      G   o   x���v
Q���W((M��L�+�/-.M,��/Vs�	uV�02�QPOL���S2��ML�@��Ĕ�|�����b7)5'�
�3+�!=713G/9?(aF@3�4���� 7�!�     