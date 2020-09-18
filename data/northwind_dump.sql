--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_id integer,
    category_name character varying(100) NOT NULL,
    description character varying,
    picture character varying
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    city character varying(50),
    population integer,
    birth_rate real,
    country character varying(50)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    customer_id character(5) NOT NULL,
    company_name character varying NOT NULL,
    contact_name character varying NOT NULL,
    contact_title character varying NOT NULL,
    address character varying NOT NULL,
    city character varying NOT NULL,
    region character varying,
    postal_code character varying(10),
    country character varying,
    phone character varying,
    fax character varying
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: employee_territorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_territorities (
    id integer NOT NULL,
    employee_id smallint,
    territory_id integer
);


ALTER TABLE public.employee_territorities OWNER TO postgres;

--
-- Name: employee_territorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_territorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_territorities_id_seq OWNER TO postgres;

--
-- Name: employee_territorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_territorities_id_seq OWNED BY public.employee_territorities.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    last_name character varying(300) NOT NULL,
    first_name character varying(300) NOT NULL,
    title_of_courtesy character varying(5),
    birth_date timestamp without time zone NOT NULL,
    hire_date timestamp without time zone NOT NULL,
    address character varying(500) NOT NULL,
    city character varying(500) NOT NULL,
    region character varying(100),
    postal_code character varying(10),
    country character varying(300),
    phone character varying(50),
    extension integer,
    photo character varying(500),
    notes character varying,
    reports_to integer,
    photo_path character varying
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_id smallint NOT NULL,
    customer_id character(5) NOT NULL,
    employee_id smallint NOT NULL,
    order_date timestamp without time zone NOT NULL,
    required_date timestamp without time zone,
    shipped_date character varying,
    ship_via smallint NOT NULL,
    freight real NOT NULL,
    ship_name character varying(500) NOT NULL,
    ship_adress character varying(500) NOT NULL,
    ship_city character varying(500) NOT NULL,
    ship_region character varying(500),
    ship_postal_code character varying(100) NOT NULL,
    ship_country character varying(200) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_id smallint,
    product_name character varying(500) NOT NULL,
    supplier_id smallint NOT NULL,
    category_id smallint NOT NULL,
    quantity_per_unit character varying(200) NOT NULL,
    unit_price real NOT NULL,
    units_in_stock smallint NOT NULL,
    units_on_order smallint NOT NULL,
    reorder_level smallint NOT NULL,
    discontinued smallint NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region_id smallint,
    region_description character varying(200)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    id integer NOT NULL,
    shipper_id smallint,
    company_name character varying(300) NOT NULL,
    phone character varying(50)
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- Name: shippers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shippers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippers_id_seq OWNER TO postgres;

--
-- Name: shippers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shippers_id_seq OWNED BY public.shippers.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    supplier_id smallint NOT NULL,
    company_name character varying(300) NOT NULL,
    contact_name character varying(300) NOT NULL,
    contact_title character varying(300) NOT NULL,
    address character varying NOT NULL,
    city character varying(300) NOT NULL,
    region character varying,
    postal_code character varying(10) NOT NULL,
    country character varying NOT NULL,
    phone character varying(20),
    fax character varying(20),
    homepage character varying
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_id_seq OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territories (
    id integer NOT NULL,
    territory_id integer,
    territory_description character varying,
    region_id smallint
);


ALTER TABLE public.territories OWNER TO postgres;

--
-- Name: territories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.territories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.territories_id_seq OWNER TO postgres;

--
-- Name: territories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.territories_id_seq OWNED BY public.territories.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: employee_territorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territorities ALTER COLUMN id SET DEFAULT nextval('public.employee_territorities_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: shippers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers ALTER COLUMN id SET DEFAULT nextval('public.shippers_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: territories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories ALTER COLUMN id SET DEFAULT nextval('public.territories_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category_id, category_name, description, picture) FROM stdin;
1	1	Beverages	Soft drinks coffees teas beers and ales	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
2	2	Condiments	Sweet and savory sauces relishes spreads and seasonings	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
3	3	Confections	Desserts candies and sweet breads	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
4	4	Dairy Products	Cheeses	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
5	5	Grains/Cereals	Breads crackers pasta and cereal	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
6	6	Meat/Poultry	Prepared meats	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
7	7	Produce	Dried fruit and bean curd	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
8	8	Seafood	Seaweed and fish	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
9	1	Beverages	Soft drinks coffees teas beers and ales	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
10	2	Condiments	Sweet and savory sauces relishes spreads and seasonings	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
11	3	Confections	Desserts candies and sweet breads	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
12	4	Dairy Products	Cheeses	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
13	5	Grains/Cereals	Breads crackers pasta and cereal	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
14	6	Meat/Poultry	Prepared meats	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
15	7	Produce	Dried fruit and bean curd	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
16	8	Seafood	Seaweed and fish	0x151C2F00020000000D000E0014002100FFFFFFFF4269746D617020496D616765005061696E742E5069637475726500010500000200000007000000504272757368000000000000000000A0290000424D98290000000000005600000028000000AC00000078000000010004000000000000000000880B0000880B0000080000
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, city, population, birth_rate, country) FROM stdin;
1	Berlin	25	1.2	Germany
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax) FROM stdin;
1	ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	NULL	12209	Germany	030-0074321	030-0076545
2	ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Owner	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico	(5) 555-4729	(5) 555-3745
3	ANTON	Antonio Moreno Taquería	Antonio Moreno	Owner	Mataderos  2312	México D.F.	NULL	05023	Mexico	(5) 555-3932	NULL
4	AROUT	Around the Horn	Thomas Hardy	Sales Representative	120 Hanover Sq.	London	NULL	WA1 1DP	UK	(171) 555-7788	(171) 555-6750
5	BERGS	Berglunds snabbköp	Christina Berglund	Order Administrator	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden	0921-12 34 65	0921-12 34 67
6	BLAUS	Blauer See Delikatessen	Hanna Moos	Sales Representative	Forsterstr. 57	Mannheim	NULL	68306	Germany	0621-08460	0621-08924
7	BLONP	Blondesddsl père et fils	Frédérique Citeaux	Marketing Manager	24 place Kléber	Strasbourg	NULL	67000	France	88.60.15.31	88.60.15.32
8	BOLID	Bólido Comidas preparadas	Martín Sommer	Owner	67C Araquil	Madrid	NULL	28023	Spain	(91) 555 22 82	(91) 555 91 99
9	BONAP	Bon app'	Laurence Lebihan	Owner	12 rue des Bouchers	Marseille	NULL	13008	France	91.24.45.40	91.24.45.41
10	BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Accounting Manager	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada	(604) 555-4729	(604) 555-3745
11	BSBEV	B's Beverages	Victoria Ashworth	Sales Representative	Fauntleroy Circus	London	NULL	EC2 5NT	UK	(171) 555-1212	NULL
12	CACTU	Cactus Comidas para llevar	Patricio Simpson	Sales Agent	Cerrito 333	Buenos Aires	NULL	1010	Argentina	(1) 135-5555	(1) 135-4892
13	CENTC	Centro comercial Moctezuma	Francisco Chang	Marketing Manager	Sierras de Granada 9993	México D.F.	NULL	05022	Mexico	(5) 555-3392	(5) 555-7293
14	CHOPS	Chop-suey Chinese	Yang Wang	Owner	Hauptstr. 29	Bern	NULL	3012	Switzerland	0452-076545	NULL
15	COMMI	Comércio Mineiro	Pedro Afonso	Sales Associate	23 Av. dos Lusíadas	Sao Paulo	SP	05432-043	Brazil	(11) 555-7647	NULL
16	CONSH	Consolidated Holdings	Elizabeth Brown	Sales Representative	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK	(171) 555-2282	(171) 555-9199
17	DRACD	Drachenblut Delikatessen	Sven Ottlieb	Order Administrator	Walserweg 21	Aachen	NULL	52066	Germany	0241-039123	0241-059428
18	DUMON	Du monde entier	Janine Labrune	Owner	67 rue des Cinquante Otages	Nantes	NULL	44000	France	40.67.88.88	40.67.89.89
19	EASTC	Eastern Connection	Ann Devon	Sales Agent	35 King George	London	NULL	WX3 6FW	UK	(171) 555-0297	(171) 555-3373
20	ERNSH	Ernst Handel	Roland Mendel	Sales Manager	Kirchgasse 6	Graz	NULL	8010	Austria	7675-3425	7675-3426
21	FAMIA	Familia Arquibaldo	Aria Cruz	Marketing Assistant	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil	(11) 555-9857	NULL
22	FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Accounting Manager	C/ Moralzarzal 86	Madrid	NULL	28034	Spain	(91) 555 94 44	(91) 555 55 93
23	FOLIG	Folies gourmandes	Martine Rancé	Assistant Sales Agent	184 chaussée de Tournai	Lille	NULL	59000	France	20.16.10.16	20.16.10.17
24	FOLKO	Folk och fä HB	Maria Larsson	Owner	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden	0695-34 67 21	NULL
25	FRANK	Frankenversand	Peter Franken	Marketing Manager	Berliner Platz 43	München	NULL	80805	Germany	089-0877310	089-0877451
26	FRANR	France restauration	Carine Schmitt	Marketing Manager	54 rue Royale	Nantes	NULL	44000	France	40.32.21.21	40.32.21.20
27	FRANS	Franchi S.p.A.	Paolo Accorti	Sales Representative	Via Monte Bianco 34	Torino	NULL	10100	Italy	011-4988260	011-4988261
28	FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez	Sales Manager	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal	(1) 354-2534	(1) 354-2535
29	GALED	Galería del gastrónomo	Eduardo Saavedra	Marketing Manager	Rambla de Cataluña 23	Barcelona	NULL	08022	Spain	(93) 203 4560	(93) 203 4561
30	GODOS	Godos Cocina Típica	José Pedro Freyre	Sales Manager	C/ Romero 33	Sevilla	NULL	41101	Spain	(95) 555 82 82	NULL
31	GOURL	Gourmet Lanchonetes	André Fonseca	Sales Associate	Av. Brasil 442	Campinas	SP	04876-786	Brazil	(11) 555-9482	NULL
32	GREAL	Great Lakes Food Market	Howard Snyder	Marketing Manager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	NULL
33	GROSR	GROSELLA-Restaurante	Manuel Pereira	Owner	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
34	HANAR	Hanari Carnes	Mario Pontes	Accounting Manager	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil	(21) 555-0091	(21) 555-8765
35	HILAA	HILARION-Abastos	Carlos Hernández	Sales Representative	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela	(5) 555-1340	(5) 555-1948
36	HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Sales Representative	City Center Plaza 516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
37	HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Sales Associate	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland	2967 542	2967 3333
38	ISLAT	Island Trading	Helen Bennett	Marketing Manager	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK	(198) 555-8888	NULL
39	KOENE	Königlich Essen	Philip Cramer	Sales Associate	Maubelstr. 90	Brandenburg	NULL	14776	Germany	0555-09876	NULL
40	LACOR	La corne d'abondance	Daniel Tonini	Sales Representative	67 avenue de l'Europe	Versailles	NULL	78000	France	30.59.84.10	30.59.85.11
41	LAMAI	La maison d'Asie	Annette Roulet	Sales Manager	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France	61.77.61.10	61.77.61.11
42	LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketing Assistant	1900 Oak St.	Vancouver	BC	V3F 2K1	Canada	(604) 555-3392	(604) 555-7293
43	LAZYK	Lazy K Kountry Store	John Steel	Marketing Manager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
44	LEHMS	Lehmanns Marktstand	Renate Messner	Sales Representative	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany	069-0245984	069-0245874
45	LETSS	Let's Stop N Shop	Jaime Yorres	Owner	87 Polk St. Suite 5	San Francisco	CA	94117	USA	(415) 555-5938	NULL
46	LILAS	LILA-Supermercado	Carlos González	Accounting Manager	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
47	LINOD	LINO-Delicateses	Felipe Izquierdo	Owner	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
48	LONEP	Lonesome Pine Restaurant	Fran Wilson	Sales Manager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
49	MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketing Manager	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy	035-640230	035-640231
50	MAISD	Maison Dewey	Catherine Dewey	Sales Agent	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium	(02) 201 24 67	(02) 201 24 68
51	MEREP	Mère Paillarde	Jean Fresnière	Marketing Assistant	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-8054	(514) 555-8055
52	MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketing Assistant	Heerstr. 22	Leipzig	NULL	04179	Germany	0342-023176	NULL
53	NORTS	North/South	Simon Crowther	Sales Associate	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK	(171) 555-7733	(171) 555-2530
54	OCEAN	Océano Atlántico Ltda.	Yvonne Moncada	Sales Agent	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina	(1) 135-5333	(1) 135-5535
55	OLDWO	Old World Delicatessen	Rene Phillips	Sales Representative	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
56	OTTIK	Ottilies Käseladen	Henriette Pfalzheim	Owner	Mehrheimerstr. 369	Köln	NULL	50739	Germany	0221-0644327	0221-0765721
57	PARIS	Paris spécialités	Marie Bertrand	Owner	265 boulevard Charonne	Paris	NULL	75012	France	(1) 42.34.22.66	(1) 42.34.22.77
58	PERIC	Pericles Comidas clásicas	Guillermo Fernández	Sales Representative	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico	(5) 552-3745	(5) 545-3745
59	PICCO	Piccolo und mehr	Georg Pipps	Sales Manager	Geislweg 14	Salzburg	NULL	5020	Austria	6562-9722	6562-9723
60	PRINI	Princesa Isabel Vinhos	Isabel de Castro	Sales Representative	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal	(1) 356-5634	NULL
61	QUEDE	Que Delícia	Bernardo Batista	Accounting Manager	Rua da Panificadora	 12Rio de Janeiro	RJ	02389-673	Brazil	(21) 555-4252	(21) 555-4545
62	QUEEN	Queen Cozinha	Lúcia Carvalho	Marketing Assistant	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil	(11) 555-1189	NULL
63	QUICK	QUICK-Stop	Horst Kloss	Accounting Manager	Taucherstraße 10	Cunewalde	NULL	01307	Germany	0372-035188	NULL
64	RANCH	Rancho grande	Sergio Gutiérrez	Sales Representative	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina	(1) 123-5555	(1) 123-5556
65	RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Assistant Sales Representative	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
66	REGGC	Reggiani Caseifici	Maurizio Moroni	Sales Associate	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy	0522-556721	0522-556722
67	RICAR	Ricardo Adocicados	Janete Limeira	Assistant Sales Agent	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil	(21) 555-3412	NULL
68	RICSU	Richter Supermarkt	Michael Holz	Sales Manager	Grenzacherweg 237	Genève	NULL	1203	Switzerland	0897-034214	NULL
69	ROMEY	Romero y tomillo	Alejandra Camino	Accounting Manager	Gran Vía 1	Madrid	NULL	28001	Spain	(91) 745 6200	(91) 745 6210
70	SANTG	Santé Gourmet	Jonas Bergulfsen	Owner	Erling Skakkes gate 78	Stavern	NULL	4110	Norway	07-98 92 35	07-98 92 47
71	SAVEA	Save-a-lot Markets	Jose Pavarotti	Sales Representative	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	NULL
72	SEVES	Seven Seas Imports	Hari Kumar	Sales Manager	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK	(171) 555-1717	(171) 555-5646
73	SIMOB	Simons bistro	Jytte Petersen	Owner	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark	31 12 34 56	31 13 35 57
74	SPECD	Spécialités du monde	Dominique Perrier	Marketing Manager	25 rue Lauriston	Paris	NULL	75016	France	(1) 47.55.60.10	(1) 47.55.60.20
75	SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Sales Manager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
76	SUPRD	Suprêmes délices	Pascale Cartrain	Accounting Manager	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium	(071) 23 67 22 20	(071) 23 67 22 21
77	THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way Suite 2	Portland	OR	97201	USA	(503) 555-3612	NULL
78	THECR	The Cracker Box	Liu Wong	Marketing Assistant	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
79	TOMSP	Toms Spezialitäten	Karin Josephs	Marketing Manager	Luisenstr. 48	Münster	NULL	44087	Germany	0251-031259	0251-035695
80	TORTU	Tortuga Restaurante	Miguel Angel Paolino	Owner	Avda. Azteca 123	México D.F.	NULL	05033	Mexico	(5) 555-2933	NULL
81	TRADH	Tradição Hipermercados	Anabela Domingues	Sales Representative	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil	(11) 555-2167	(11) 555-2168
82	TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Sales Associate	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
83	VAFFE	Vaffeljernet	Palle Ibsen	Sales Manager	Smagsloget 45	Århus	NULL	8200	Denmark	86 21 32 43	86 22 33 44
84	VICTE	Victuailles en stock	Mary Saveley	Sales Agent	2 rue du Commerce	Lyon	NULL	69004	France	78.32.54.86	78.32.54.87
85	VINET	Vins et alcools Chevalier	Paul Henriot	Accounting Manager	59 rue de l'Abbaye	Reims	NULL	51100	France	26.47.15.10	26.47.15.11
86	WANDK	Die Wandernde Kuh	Rita Müller	Sales Representative	Adenauerallee 900	Stuttgart	NULL	70563	Germany	0711-020361	0711-035428
87	WARTH	Wartian Herkku	Pirkko Koskitalo	Accounting Manager	Torikatu 38	Oulu	NULL	90110	Finland	981-443655	981-443655
88	WELLI	Wellington Importadora	Paula Parente	Sales Manager	Rua do Mercado 12	Resende	SP	08737-363	Brazil	(14) 555-8122	NULL
89	WHITC	White Clover Markets	Karl Jablonski	Owner	305 - 14th Ave. S. Suite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
90	WILMK	Wilman Kala	Matti Karttunen	Owner/Marketing Assistant	Keskuskatu 45	Helsinki	NULL	21240	Finland	90-224 8858	90-224 8858
91	WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Owner	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland	(26) 642-7012	(26) 642-7012
92	ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	NULL	12209	Germany	030-0074321	030-0076545
93	ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Owner	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico	(5) 555-4729	(5) 555-3745
94	ANTON	Antonio Moreno Taquería	Antonio Moreno	Owner	Mataderos  2312	México D.F.	NULL	05023	Mexico	(5) 555-3932	NULL
95	AROUT	Around the Horn	Thomas Hardy	Sales Representative	120 Hanover Sq.	London	NULL	WA1 1DP	UK	(171) 555-7788	(171) 555-6750
96	BERGS	Berglunds snabbköp	Christina Berglund	Order Administrator	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden	0921-12 34 65	0921-12 34 67
97	BLAUS	Blauer See Delikatessen	Hanna Moos	Sales Representative	Forsterstr. 57	Mannheim	NULL	68306	Germany	0621-08460	0621-08924
98	BLONP	Blondesddsl père et fils	Frédérique Citeaux	Marketing Manager	24 place Kléber	Strasbourg	NULL	67000	France	88.60.15.31	88.60.15.32
99	BOLID	Bólido Comidas preparadas	Martín Sommer	Owner	67C Araquil	Madrid	NULL	28023	Spain	(91) 555 22 82	(91) 555 91 99
100	BONAP	Bon app'	Laurence Lebihan	Owner	12 rue des Bouchers	Marseille	NULL	13008	France	91.24.45.40	91.24.45.41
101	BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Accounting Manager	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada	(604) 555-4729	(604) 555-3745
102	BSBEV	B's Beverages	Victoria Ashworth	Sales Representative	Fauntleroy Circus	London	NULL	EC2 5NT	UK	(171) 555-1212	NULL
103	CACTU	Cactus Comidas para llevar	Patricio Simpson	Sales Agent	Cerrito 333	Buenos Aires	NULL	1010	Argentina	(1) 135-5555	(1) 135-4892
104	CENTC	Centro comercial Moctezuma	Francisco Chang	Marketing Manager	Sierras de Granada 9993	México D.F.	NULL	05022	Mexico	(5) 555-3392	(5) 555-7293
105	CHOPS	Chop-suey Chinese	Yang Wang	Owner	Hauptstr. 29	Bern	NULL	3012	Switzerland	0452-076545	NULL
106	COMMI	Comércio Mineiro	Pedro Afonso	Sales Associate	23 Av. dos Lusíadas	Sao Paulo	SP	05432-043	Brazil	(11) 555-7647	NULL
107	CONSH	Consolidated Holdings	Elizabeth Brown	Sales Representative	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK	(171) 555-2282	(171) 555-9199
108	DRACD	Drachenblut Delikatessen	Sven Ottlieb	Order Administrator	Walserweg 21	Aachen	NULL	52066	Germany	0241-039123	0241-059428
109	DUMON	Du monde entier	Janine Labrune	Owner	67 rue des Cinquante Otages	Nantes	NULL	44000	France	40.67.88.88	40.67.89.89
110	EASTC	Eastern Connection	Ann Devon	Sales Agent	35 King George	London	NULL	WX3 6FW	UK	(171) 555-0297	(171) 555-3373
111	ERNSH	Ernst Handel	Roland Mendel	Sales Manager	Kirchgasse 6	Graz	NULL	8010	Austria	7675-3425	7675-3426
112	FAMIA	Familia Arquibaldo	Aria Cruz	Marketing Assistant	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil	(11) 555-9857	NULL
113	FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Accounting Manager	C/ Moralzarzal 86	Madrid	NULL	28034	Spain	(91) 555 94 44	(91) 555 55 93
114	FOLIG	Folies gourmandes	Martine Rancé	Assistant Sales Agent	184 chaussée de Tournai	Lille	NULL	59000	France	20.16.10.16	20.16.10.17
115	FOLKO	Folk och fä HB	Maria Larsson	Owner	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden	0695-34 67 21	NULL
116	FRANK	Frankenversand	Peter Franken	Marketing Manager	Berliner Platz 43	München	NULL	80805	Germany	089-0877310	089-0877451
117	FRANR	France restauration	Carine Schmitt	Marketing Manager	54 rue Royale	Nantes	NULL	44000	France	40.32.21.21	40.32.21.20
118	FRANS	Franchi S.p.A.	Paolo Accorti	Sales Representative	Via Monte Bianco 34	Torino	NULL	10100	Italy	011-4988260	011-4988261
119	FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez	Sales Manager	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal	(1) 354-2534	(1) 354-2535
120	GALED	Galería del gastrónomo	Eduardo Saavedra	Marketing Manager	Rambla de Cataluña 23	Barcelona	NULL	08022	Spain	(93) 203 4560	(93) 203 4561
121	GODOS	Godos Cocina Típica	José Pedro Freyre	Sales Manager	C/ Romero 33	Sevilla	NULL	41101	Spain	(95) 555 82 82	NULL
122	GOURL	Gourmet Lanchonetes	André Fonseca	Sales Associate	Av. Brasil 442	Campinas	SP	04876-786	Brazil	(11) 555-9482	NULL
123	GREAL	Great Lakes Food Market	Howard Snyder	Marketing Manager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	NULL
124	GROSR	GROSELLA-Restaurante	Manuel Pereira	Owner	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
125	HANAR	Hanari Carnes	Mario Pontes	Accounting Manager	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil	(21) 555-0091	(21) 555-8765
126	HILAA	HILARION-Abastos	Carlos Hernández	Sales Representative	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela	(5) 555-1340	(5) 555-1948
127	HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Sales Representative	City Center Plaza 516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
128	HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Sales Associate	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland	2967 542	2967 3333
129	ISLAT	Island Trading	Helen Bennett	Marketing Manager	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK	(198) 555-8888	NULL
130	KOENE	Königlich Essen	Philip Cramer	Sales Associate	Maubelstr. 90	Brandenburg	NULL	14776	Germany	0555-09876	NULL
131	LACOR	La corne d'abondance	Daniel Tonini	Sales Representative	67 avenue de l'Europe	Versailles	NULL	78000	France	30.59.84.10	30.59.85.11
132	LAMAI	La maison d'Asie	Annette Roulet	Sales Manager	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France	61.77.61.10	61.77.61.11
133	LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketing Assistant	1900 Oak St.	Vancouver	BC	V3F 2K1	Canada	(604) 555-3392	(604) 555-7293
134	LAZYK	Lazy K Kountry Store	John Steel	Marketing Manager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
135	LEHMS	Lehmanns Marktstand	Renate Messner	Sales Representative	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany	069-0245984	069-0245874
136	LETSS	Let's Stop N Shop	Jaime Yorres	Owner	87 Polk St. Suite 5	San Francisco	CA	94117	USA	(415) 555-5938	NULL
137	LILAS	LILA-Supermercado	Carlos González	Accounting Manager	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
138	LINOD	LINO-Delicateses	Felipe Izquierdo	Owner	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
139	LONEP	Lonesome Pine Restaurant	Fran Wilson	Sales Manager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
140	MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketing Manager	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy	035-640230	035-640231
141	MAISD	Maison Dewey	Catherine Dewey	Sales Agent	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium	(02) 201 24 67	(02) 201 24 68
142	MEREP	Mère Paillarde	Jean Fresnière	Marketing Assistant	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-8054	(514) 555-8055
143	MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketing Assistant	Heerstr. 22	Leipzig	NULL	04179	Germany	0342-023176	NULL
144	NORTS	North/South	Simon Crowther	Sales Associate	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK	(171) 555-7733	(171) 555-2530
145	OCEAN	Océano Atlántico Ltda.	Yvonne Moncada	Sales Agent	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina	(1) 135-5333	(1) 135-5535
146	OLDWO	Old World Delicatessen	Rene Phillips	Sales Representative	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
147	OTTIK	Ottilies Käseladen	Henriette Pfalzheim	Owner	Mehrheimerstr. 369	Köln	NULL	50739	Germany	0221-0644327	0221-0765721
148	PARIS	Paris spécialités	Marie Bertrand	Owner	265 boulevard Charonne	Paris	NULL	75012	France	(1) 42.34.22.66	(1) 42.34.22.77
149	PERIC	Pericles Comidas clásicas	Guillermo Fernández	Sales Representative	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico	(5) 552-3745	(5) 545-3745
150	PICCO	Piccolo und mehr	Georg Pipps	Sales Manager	Geislweg 14	Salzburg	NULL	5020	Austria	6562-9722	6562-9723
151	PRINI	Princesa Isabel Vinhos	Isabel de Castro	Sales Representative	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal	(1) 356-5634	NULL
152	QUEDE	Que Delícia	Bernardo Batista	Accounting Manager	Rua da Panificadora	 12Rio de Janeiro	RJ	02389-673	Brazil	(21) 555-4252	(21) 555-4545
153	QUEEN	Queen Cozinha	Lúcia Carvalho	Marketing Assistant	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil	(11) 555-1189	NULL
154	QUICK	QUICK-Stop	Horst Kloss	Accounting Manager	Taucherstraße 10	Cunewalde	NULL	01307	Germany	0372-035188	NULL
155	RANCH	Rancho grande	Sergio Gutiérrez	Sales Representative	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina	(1) 123-5555	(1) 123-5556
156	RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Assistant Sales Representative	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
157	REGGC	Reggiani Caseifici	Maurizio Moroni	Sales Associate	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy	0522-556721	0522-556722
158	RICAR	Ricardo Adocicados	Janete Limeira	Assistant Sales Agent	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil	(21) 555-3412	NULL
159	RICSU	Richter Supermarkt	Michael Holz	Sales Manager	Grenzacherweg 237	Genève	NULL	1203	Switzerland	0897-034214	NULL
160	ROMEY	Romero y tomillo	Alejandra Camino	Accounting Manager	Gran Vía 1	Madrid	NULL	28001	Spain	(91) 745 6200	(91) 745 6210
161	SANTG	Santé Gourmet	Jonas Bergulfsen	Owner	Erling Skakkes gate 78	Stavern	NULL	4110	Norway	07-98 92 35	07-98 92 47
162	SAVEA	Save-a-lot Markets	Jose Pavarotti	Sales Representative	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	NULL
163	SEVES	Seven Seas Imports	Hari Kumar	Sales Manager	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK	(171) 555-1717	(171) 555-5646
164	SIMOB	Simons bistro	Jytte Petersen	Owner	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark	31 12 34 56	31 13 35 57
165	SPECD	Spécialités du monde	Dominique Perrier	Marketing Manager	25 rue Lauriston	Paris	NULL	75016	France	(1) 47.55.60.10	(1) 47.55.60.20
166	SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Sales Manager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
167	SUPRD	Suprêmes délices	Pascale Cartrain	Accounting Manager	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium	(071) 23 67 22 20	(071) 23 67 22 21
168	THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way Suite 2	Portland	OR	97201	USA	(503) 555-3612	NULL
169	THECR	The Cracker Box	Liu Wong	Marketing Assistant	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
170	TOMSP	Toms Spezialitäten	Karin Josephs	Marketing Manager	Luisenstr. 48	Münster	NULL	44087	Germany	0251-031259	0251-035695
171	TORTU	Tortuga Restaurante	Miguel Angel Paolino	Owner	Avda. Azteca 123	México D.F.	NULL	05033	Mexico	(5) 555-2933	NULL
172	TRADH	Tradição Hipermercados	Anabela Domingues	Sales Representative	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil	(11) 555-2167	(11) 555-2168
173	TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Sales Associate	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
174	VAFFE	Vaffeljernet	Palle Ibsen	Sales Manager	Smagsloget 45	Århus	NULL	8200	Denmark	86 21 32 43	86 22 33 44
175	VICTE	Victuailles en stock	Mary Saveley	Sales Agent	2 rue du Commerce	Lyon	NULL	69004	France	78.32.54.86	78.32.54.87
176	VINET	Vins et alcools Chevalier	Paul Henriot	Accounting Manager	59 rue de l'Abbaye	Reims	NULL	51100	France	26.47.15.10	26.47.15.11
177	WANDK	Die Wandernde Kuh	Rita Müller	Sales Representative	Adenauerallee 900	Stuttgart	NULL	70563	Germany	0711-020361	0711-035428
178	WARTH	Wartian Herkku	Pirkko Koskitalo	Accounting Manager	Torikatu 38	Oulu	NULL	90110	Finland	981-443655	981-443655
179	WELLI	Wellington Importadora	Paula Parente	Sales Manager	Rua do Mercado 12	Resende	SP	08737-363	Brazil	(14) 555-8122	NULL
180	WHITC	White Clover Markets	Karl Jablonski	Owner	305 - 14th Ave. S. Suite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
181	WILMK	Wilman Kala	Matti Karttunen	Owner/Marketing Assistant	Keskuskatu 45	Helsinki	NULL	21240	Finland	90-224 8858	90-224 8858
182	WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Owner	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland	(26) 642-7012	(26) 642-7012
\.


--
-- Data for Name: employee_territorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_territorities (id, employee_id, territory_id) FROM stdin;
1	1	6897
2	1	19713
3	2	1581
4	2	1730
5	2	1833
6	2	2116
7	2	2139
8	2	2184
9	2	40222
10	3	30346
11	3	31406
12	3	32859
13	3	33607
14	4	20852
15	4	27403
16	4	27511
17	5	2903
18	5	7960
19	5	8837
20	5	10019
21	5	10038
22	5	11747
23	5	14450
24	6	85014
25	6	85251
26	6	98004
27	6	98052
28	6	98104
29	7	60179
30	7	60601
31	7	80202
32	7	80909
33	7	90405
34	7	94025
35	7	94105
36	7	95008
37	7	95054
38	7	95060
39	8	19428
40	8	44122
41	8	45839
42	8	53404
43	9	3049
44	9	3801
45	9	48075
46	9	48084
47	9	48304
48	9	55113
49	9	55439
50	1	6897
51	1	19713
52	2	1581
53	2	1730
54	2	1833
55	2	2116
56	2	2139
57	2	2184
58	2	40222
59	3	30346
60	3	31406
61	3	32859
62	3	33607
63	4	20852
64	4	27403
65	4	27511
66	5	2903
67	5	7960
68	5	8837
69	5	10019
70	5	10038
71	5	11747
72	5	14450
73	6	85014
74	6	85251
75	6	98004
76	6	98052
77	6	98104
78	7	60179
79	7	60601
80	7	80202
81	7	80909
82	7	90405
83	7	94025
84	7	94105
85	7	95008
86	7	95054
87	7	95060
88	8	19428
89	8	44122
90	8	45839
91	8	53404
92	9	3049
93	9	3801
94	9	48075
95	9	48084
96	9	48304
97	9	55113
98	9	55439
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, last_name, first_name, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, phone, extension, photo, notes, reports_to, photo_path) FROM stdin;
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (id, order_id, product_id, unit_price, quantity, discount) FROM stdin;
1	10248	11	14	12	0
2	10248	42	9.8	10	0
3	10248	72	34.8	5	0
4	10249	14	18.6	9	0
5	10249	51	42.4	40	0
6	10250	41	7.7	10	0
7	10250	51	42.4	35	0.15
8	10250	65	16.8	15	0.15
9	10251	22	16.8	6	0.05
10	10251	57	15.6	15	0.05
11	10251	65	16.8	20	0
12	10252	20	64.8	40	0.05
13	10252	33	2	25	0.05
14	10252	60	27.2	40	0
15	10253	31	10	20	0
16	10253	39	14.4	42	0
17	10253	49	16	40	0
18	10254	24	3.6	15	0.15
19	10254	55	19.2	21	0.15
20	10254	74	8	21	0
21	10255	2	15.2	20	0
22	10255	16	13.9	35	0
23	10255	36	15.2	25	0
24	10255	59	44	30	0
25	10256	53	26.2	15	0
26	10256	77	10.4	12	0
27	10257	27	35.1	25	0
28	10257	39	14.4	6	0
29	10257	77	10.4	15	0
30	10258	2	15.2	50	0.2
31	10258	5	17	65	0.2
32	10258	32	25.6	6	0.2
33	10259	21	8	10	0
34	10259	37	20.8	1	0
35	10260	41	7.7	16	0.25
36	10260	57	15.6	50	0
37	10260	62	39.4	15	0.25
38	10260	70	12	21	0.25
39	10261	21	8	20	0
40	10261	35	14.4	20	0
41	10262	5	17	12	0.2
42	10262	7	24	15	0
43	10262	56	30.4	2	0
44	10263	16	13.9	60	0.25
45	10263	24	3.6	28	0
46	10263	30	20.7	60	0.25
47	10263	74	8	36	0.25
48	10264	2	15.2	35	0
49	10264	41	7.7	25	0.15
50	10265	17	31.2	30	0
51	10265	70	12	20	0
52	10266	12	30.4	12	0.05
53	10267	40	14.7	50	0
54	10267	59	44	70	0.15
55	10267	76	14.4	15	0.15
56	10268	29	99	10	0
57	10268	72	27.8	4	0
58	10269	33	2	60	0.05
59	10269	72	27.8	20	0.05
60	10270	36	15.2	30	0
61	10270	43	36.8	25	0
62	10271	33	2	24	0
63	10272	20	64.8	6	0
64	10272	31	10	40	0
65	10272	72	27.8	24	0
66	10273	10	24.8	24	0.05
67	10273	31	10	15	0.05
68	10273	33	2	20	0
69	10273	40	14.7	60	0.05
70	10273	76	14.4	33	0.05
71	10274	71	17.2	20	0
72	10274	72	27.8	7	0
73	10275	24	3.6	12	0.05
74	10275	59	44	6	0.05
75	10276	10	24.8	15	0
76	10276	13	4.8	10	0
77	10277	28	36.4	20	0
78	10277	62	39.4	12	0
79	10278	44	15.5	16	0
80	10278	59	44	15	0
81	10278	63	35.1	8	0
82	10278	73	12	25	0
83	10279	17	31.2	15	0.25
84	10280	24	3.6	12	0
85	10280	55	19.2	20	0
86	10280	75	6.2	30	0
87	10281	19	7.3	1	0
88	10281	24	3.6	6	0
89	10281	35	14.4	4	0
90	10282	30	20.7	6	0
91	10282	57	15.6	2	0
92	10283	15	12.4	20	0
93	10283	19	7.3	18	0
94	10283	60	27.2	35	0
95	10283	72	27.8	3	0
96	10284	27	35.1	15	0.25
97	10284	44	15.5	21	0
98	10284	60	27.2	20	0.25
99	10284	67	11.2	5	0.25
100	10285	1	14.4	45	0.2
101	10285	40	14.7	40	0.2
102	10285	53	26.2	36	0.2
103	10286	35	14.4	100	0
104	10286	62	39.4	40	0
105	10287	16	13.9	40	0.15
106	10287	34	11.2	20	0
107	10287	46	9.6	15	0.15
108	10288	54	5.9	10	0.1
109	10288	68	10	3	0.1
110	10289	3	8	30	0
111	10289	64	26.6	9	0
112	10290	5	17	20	0
113	10290	29	99	15	0
114	10290	49	16	15	0
115	10290	77	10.4	10	0
116	10291	13	4.8	20	0.1
117	10291	44	15.5	24	0.1
118	10291	51	42.4	2	0.1
119	10292	20	64.8	20	0
120	10293	18	50	12	0
121	10293	24	3.6	10	0
122	10293	63	35.1	5	0
123	10293	75	6.2	6	0
124	10294	1	14.4	18	0
125	10294	17	31.2	15	0
126	10294	43	36.8	15	0
127	10294	60	27.2	21	0
128	10294	75	6.2	6	0
129	10295	56	30.4	4	0
130	10296	11	16.8	12	0
131	10296	16	13.9	30	0
132	10296	69	28.8	15	0
133	10297	39	14.4	60	0
134	10297	72	27.8	20	0
135	10298	2	15.2	40	0
136	10298	36	15.2	40	0.25
137	10298	59	44	30	0.25
138	10298	62	39.4	15	0
139	10299	19	7.3	15	0
140	10299	70	12	20	0
141	10300	66	13.6	30	0
142	10300	68	10	20	0
143	10301	40	14.7	10	0
144	10301	56	30.4	20	0
145	10302	17	31.2	40	0
146	10302	28	36.4	28	0
147	10302	43	36.8	12	0
148	10303	40	14.7	40	0.1
149	10303	65	16.8	30	0.1
150	10303	68	10	15	0.1
151	10304	49	16	30	0
152	10304	59	44	10	0
153	10304	71	17.2	2	0
154	10305	18	50	25	0.1
155	10305	29	99	25	0.1
156	10305	39	14.4	30	0.1
157	10306	30	20.7	10	0
158	10306	53	26.2	10	0
159	10306	54	5.9	5	0
160	10307	62	39.4	10	0
161	10307	68	10	3	0
162	10308	69	28.8	1	0
163	10308	70	12	5	0
164	10309	4	17.6	20	0
165	10309	6	20	30	0
166	10309	42	11.2	2	0
167	10309	43	36.8	20	0
168	10309	71	17.2	3	0
169	10310	16	13.9	10	0
170	10310	62	39.4	5	0
171	10311	42	11.2	6	0
172	10311	69	28.8	7	0
173	10312	28	36.4	4	0
174	10312	43	36.8	24	0
175	10312	53	26.2	20	0
176	10312	75	6.2	10	0
177	10313	36	15.2	12	0
178	10314	32	25.6	40	0.1
179	10314	58	10.6	30	0.1
180	10314	62	39.4	25	0.1
181	10315	34	11.2	14	0
182	10315	70	12	30	0
183	10316	41	7.7	10	0
184	10316	62	39.4	70	0
185	10317	1	14.4	20	0
186	10318	41	7.7	20	0
187	10318	76	14.4	6	0
188	10319	17	31.2	8	0
189	10319	28	36.4	14	0
190	10319	76	14.4	30	0
191	10320	71	17.2	30	0
192	10321	35	14.4	10	0
193	10322	52	5.6	20	0
194	10323	15	12.4	5	0
195	10323	25	11.2	4	0
196	10323	39	14.4	4	0
197	10324	16	13.9	21	0.15
198	10324	35	14.4	70	0.15
199	10324	46	9.6	30	0
200	10324	59	44	40	0.15
201	10324	63	35.1	80	0.15
202	10325	6	20	6	0
203	10325	13	4.8	12	0
204	10325	14	18.6	9	0
205	10325	31	10	4	0
206	10325	72	27.8	40	0
207	10326	4	17.6	24	0
208	10326	57	15.6	16	0
209	10326	75	6.2	50	0
210	10327	2	15.2	25	0.2
211	10327	11	16.8	50	0.2
212	10327	30	20.7	35	0.2
213	10327	58	10.6	30	0.2
214	10328	59	44	9	0
215	10328	65	16.8	40	0
216	10328	68	10	10	0
217	10329	19	7.3	10	0.05
218	10329	30	20.7	8	0.05
219	10329	38	210.8	20	0.05
220	10329	56	30.4	12	0.05
221	10330	26	24.9	50	0.15
222	10330	72	27.8	25	0.15
223	10331	54	5.9	15	0
224	10332	18	50	40	0.2
225	10332	42	11.2	10	0.2
226	10332	47	7.6	16	0.2
227	10333	14	18.6	10	0
228	10333	21	8	10	0.1
229	10333	71	17.2	40	0.1
230	10334	52	5.6	8	0
231	10334	68	10	10	0
232	10335	2	15.2	7	0.2
233	10335	31	10	25	0.2
234	10335	32	25.6	6	0.2
235	10335	51	42.4	48	0.2
236	10336	4	17.6	18	0.1
237	10337	23	7.2	40	0
238	10337	26	24.9	24	0
239	10337	36	15.2	20	0
240	10337	37	20.8	28	0
241	10337	72	27.8	25	0
242	10338	17	31.2	20	0
243	10338	30	20.7	15	0
244	10339	4	17.6	10	0
245	10339	17	31.2	70	0.05
246	10339	62	39.4	28	0
247	10340	18	50	20	0.05
248	10340	41	7.7	12	0.05
249	10340	43	36.8	40	0.05
250	10341	33	2	8	0
251	10341	59	44	9	0.15
252	10342	2	15.2	24	0.2
253	10342	31	10	56	0.2
254	10342	36	15.2	40	0.2
255	10342	55	19.2	40	0.2
256	10343	64	26.6	50	0
257	10343	68	10	4	0.05
258	10343	76	14.4	15	0
259	10344	4	17.6	35	0
260	10344	8	32	70	0.25
261	10345	8	32	70	0
262	10345	19	7.3	80	0
263	10345	42	11.2	9	0
264	10346	17	31.2	36	0.1
265	10346	56	30.4	20	0
266	10347	25	11.2	10	0
267	10347	39	14.4	50	0.15
268	10347	40	14.7	4	0
269	10347	75	6.2	6	0.15
270	10348	1	14.4	15	0.15
271	10348	23	7.2	25	0
272	10349	54	5.9	24	0
273	10350	50	13	15	0.1
274	10350	69	28.8	18	0.1
275	10351	38	210.8	20	0.05
276	10351	41	7.7	13	0
277	10351	44	15.5	77	0.05
278	10351	65	16.8	10	0.05
279	10352	24	3.6	10	0
280	10352	54	5.9	20	0.15
281	10353	11	16.8	12	0.2
282	10353	38	210.8	50	0.2
283	10354	1	14.4	12	0
284	10354	29	99	4	0
285	10355	24	3.6	25	0
286	10355	57	15.6	25	0
287	10356	31	10	30	0
288	10356	55	19.2	12	0
289	10356	69	28.8	20	0
290	10357	10	24.8	30	0.2
291	10357	26	24.9	16	0
292	10357	60	27.2	8	0.2
293	10358	24	3.6	10	0.05
294	10358	34	11.2	10	0.05
295	10358	36	15.2	20	0.05
296	10359	16	13.9	56	0.05
297	10359	31	10	70	0.05
298	10359	60	27.2	80	0.05
299	10360	28	36.4	30	0
300	10360	29	99	35	0
301	10360	38	210.8	10	0
302	10360	49	16	35	0
303	10360	54	5.9	28	0
304	10361	39	14.4	54	0.1
305	10361	60	27.2	55	0.1
306	10362	25	11.2	50	0
307	10362	51	42.4	20	0
308	10362	54	5.9	24	0
309	10363	31	10	20	0
310	10363	75	6.2	12	0
311	10363	76	14.4	12	0
312	10364	69	28.8	30	0
313	10364	71	17.2	5	0
314	10365	11	16.8	24	0
315	10366	65	16.8	5	0
316	10366	77	10.4	5	0
317	10367	34	11.2	36	0
318	10367	54	5.9	18	0
319	10367	65	16.8	15	0
320	10367	77	10.4	7	0
321	10368	21	8	5	0.1
322	10368	28	36.4	13	0.1
323	10368	57	15.6	25	0
324	10368	64	26.6	35	0.1
325	10369	29	99	20	0
326	10369	56	30.4	18	0.25
327	10370	1	14.4	15	0.15
328	10370	64	26.6	30	0
329	10370	74	8	20	0.15
330	10371	36	15.2	6	0.2
331	10372	20	64.8	12	0.25
332	10372	38	210.8	40	0.25
333	10372	60	27.2	70	0.25
334	10372	72	27.8	42	0.25
335	10373	58	10.6	80	0.2
336	10373	71	17.2	50	0.2
337	10374	31	10	30	0
338	10374	58	10.6	15	0
339	10375	14	18.6	15	0
340	10375	54	5.9	10	0
341	10376	31	10	42	0.05
342	10377	28	36.4	20	0.15
343	10377	39	14.4	20	0.15
344	10378	71	17.2	6	0
345	10379	41	7.7	8	0.1
346	10379	63	35.1	16	0.1
347	10379	65	16.8	20	0.1
348	10380	30	20.7	18	0.1
349	10380	53	26.2	20	0.1
350	10380	60	27.2	6	0.1
351	10380	70	12	30	0
352	10381	74	8	14	0
353	10382	5	17	32	0
354	10382	18	50	9	0
355	10382	29	99	14	0
356	10382	33	2	60	0
357	10382	74	8	50	0
358	10383	13	4.8	20	0
359	10383	50	13	15	0
360	10383	56	30.4	20	0
361	10384	20	64.8	28	0
362	10384	60	27.2	15	0
363	10385	7	24	10	0.2
364	10385	60	27.2	20	0.2
365	10385	68	10	8	0.2
366	10386	24	3.6	15	0
367	10386	34	11.2	10	0
368	10387	24	3.6	15	0
369	10387	28	36.4	6	0
370	10387	59	44	12	0
371	10387	71	17.2	15	0
372	10388	45	7.6	15	0.2
373	10388	52	5.6	20	0.2
374	10388	53	26.2	40	0
375	10389	10	24.8	16	0
376	10389	55	19.2	15	0
377	10389	62	39.4	20	0
378	10389	70	12	30	0
379	10390	31	10	60	0.1
380	10390	35	14.4	40	0.1
381	10390	46	9.6	45	0
382	10390	72	27.8	24	0.1
383	10391	13	4.8	18	0
384	10392	69	28.8	50	0
385	10393	2	15.2	25	0.25
386	10393	14	18.6	42	0.25
387	10393	25	11.2	7	0.25
388	10393	26	24.9	70	0.25
389	10393	31	10	32	0
390	10394	13	4.8	10	0
391	10394	62	39.4	10	0
392	10395	46	9.6	28	0.1
393	10395	53	26.2	70	0.1
394	10395	69	28.8	8	0
395	10396	23	7.2	40	0
396	10396	71	17.2	60	0
397	10396	72	27.8	21	0
398	10397	21	8	10	0.15
399	10397	51	42.4	18	0.15
400	10398	35	14.4	30	0
401	10398	55	19.2	120	0.1
402	10399	68	10	60	0
403	10399	71	17.2	30	0
404	10399	76	14.4	35	0
405	10399	77	10.4	14	0
406	10400	29	99	21	0
407	10400	35	14.4	35	0
408	10400	49	16	30	0
409	10401	30	20.7	18	0
410	10401	56	30.4	70	0
411	10401	65	16.8	20	0
412	10401	71	17.2	60	0
413	10402	23	7.2	60	0
414	10402	63	35.1	65	0
415	10403	16	13.9	21	0.15
416	10403	48	10.2	70	0.15
417	10404	26	24.9	30	0.05
418	10404	42	11.2	40	0.05
419	10404	49	16	30	0.05
420	10405	3	8	50	0
421	10406	1	14.4	10	0
422	10406	21	8	30	0.1
423	10406	28	36.4	42	0.1
424	10406	36	15.2	5	0.1
425	10406	40	14.7	2	0.1
426	10407	11	16.8	30	0
427	10407	69	28.8	15	0
428	10407	71	17.2	15	0
429	10408	37	20.8	10	0
430	10408	54	5.9	6	0
431	10408	62	39.4	35	0
432	10409	14	18.6	12	0
433	10409	21	8	12	0
434	10410	33	2	49	0
435	10410	59	44	16	0
436	10411	41	7.7	25	0.2
437	10411	44	15.5	40	0.2
438	10411	59	44	9	0.2
439	10412	14	18.6	20	0.1
440	10413	1	14.4	24	0
441	10413	62	39.4	40	0
442	10413	76	14.4	14	0
443	10414	19	7.3	18	0.05
444	10414	33	2	50	0
445	10415	17	31.2	2	0
446	10415	33	2	20	0
447	10416	19	7.3	20	0
448	10416	53	26.2	10	0
449	10416	57	15.6	20	0
450	10417	38	210.8	50	0
451	10417	46	9.6	2	0.25
452	10417	68	10	36	0.25
453	10417	77	10.4	35	0
454	10418	2	15.2	60	0
455	10418	47	7.6	55	0
456	10418	61	22.8	16	0
457	10418	74	8	15	0
458	10419	60	27.2	60	0.05
459	10419	69	28.8	20	0.05
460	10420	9	77.6	20	0.1
461	10420	13	4.8	2	0.1
462	10420	70	12	8	0.1
463	10420	73	12	20	0.1
464	10421	19	7.3	4	0.15
465	10421	26	24.9	30	0
466	10421	53	26.2	15	0.15
467	10421	77	10.4	10	0.15
468	10422	26	24.9	2	0
469	10423	31	10	14	0
470	10423	59	44	20	0
471	10424	35	14.4	60	0.2
472	10424	38	210.8	49	0.2
473	10424	68	10	30	0.2
474	10425	55	19.2	10	0.25
475	10425	76	14.4	20	0.25
476	10426	56	30.4	5	0
477	10426	64	26.6	7	0
478	10427	14	18.6	35	0
479	10428	46	9.6	20	0
480	10429	50	13	40	0
481	10429	63	35.1	35	0.25
482	10430	17	31.2	45	0.2
483	10430	21	8	50	0
484	10430	56	30.4	30	0
485	10430	59	44	70	0.2
486	10431	17	31.2	50	0.25
487	10431	40	14.7	50	0.25
488	10431	47	7.6	30	0.25
489	10432	26	24.9	10	0
490	10432	54	5.9	40	0
491	10433	56	30.4	28	0
492	10434	11	16.8	6	0
493	10434	76	14.4	18	0.15
494	10435	2	15.2	10	0
495	10435	22	16.8	12	0
496	10435	72	27.8	10	0
497	10436	46	9.6	5	0
498	10436	56	30.4	40	0.1
499	10436	64	26.6	30	0.1
500	10436	75	6.2	24	0.1
501	10437	53	26.2	15	0
502	10438	19	7.3	15	0.2
503	10438	34	11.2	20	0.2
504	10438	57	15.6	15	0.2
505	10439	12	30.4	15	0
506	10439	16	13.9	16	0
507	10439	64	26.6	6	0
508	10439	74	8	30	0
509	10440	2	15.2	45	0.15
510	10440	16	13.9	49	0.15
511	10440	29	99	24	0.15
512	10440	61	22.8	90	0.15
513	10441	27	35.1	50	0
514	10442	11	16.8	30	0
515	10442	54	5.9	80	0
516	10442	66	13.6	60	0
517	10443	11	16.8	6	0.2
518	10443	28	36.4	12	0
519	10444	17	31.2	10	0
520	10444	26	24.9	15	0
521	10444	35	14.4	8	0
522	10444	41	7.7	30	0
523	10445	39	14.4	6	0
524	10445	54	5.9	15	0
525	10446	19	7.3	12	0.1
526	10446	24	3.6	20	0.1
527	10446	31	10	3	0.1
528	10446	52	5.6	15	0.1
529	10447	19	7.3	40	0
530	10447	65	16.8	35	0
531	10447	71	17.2	2	0
532	10448	26	24.9	6	0
533	10448	40	14.7	20	0
534	10449	10	24.8	14	0
535	10449	52	5.6	20	0
536	10449	62	39.4	35	0
537	10450	10	24.8	20	0.2
538	10450	54	5.9	6	0.2
539	10451	55	19.2	120	0.1
540	10451	64	26.6	35	0.1
541	10451	65	16.8	28	0.1
542	10451	77	10.4	55	0.1
543	10452	28	36.4	15	0
544	10452	44	15.5	100	0.05
545	10453	48	10.2	15	0.1
546	10453	70	12	25	0.1
547	10454	16	13.9	20	0.2
548	10454	33	2	20	0.2
549	10454	46	9.6	10	0.2
550	10455	39	14.4	20	0
551	10455	53	26.2	50	0
552	10455	61	22.8	25	0
553	10455	71	17.2	30	0
554	10456	21	8	40	0.15
555	10456	49	16	21	0.15
556	10457	59	44	36	0
557	10458	26	24.9	30	0
558	10458	28	36.4	30	0
559	10458	43	36.8	20	0
560	10458	56	30.4	15	0
561	10458	71	17.2	50	0
562	10459	7	24	16	0.05
563	10459	46	9.6	20	0.05
564	10459	72	27.8	40	0
565	10460	68	10	21	0.25
566	10460	75	6.2	4	0.25
567	10461	21	8	40	0.25
568	10461	30	20.7	28	0.25
569	10461	55	19.2	60	0.25
570	10462	13	4.8	1	0
571	10462	23	7.2	21	0
572	10463	19	7.3	21	0
573	10463	42	11.2	50	0
574	10464	4	17.6	16	0.2
575	10464	43	36.8	3	0
576	10464	56	30.4	30	0.2
577	10464	60	27.2	20	0
578	10465	24	3.6	25	0
579	10465	29	99	18	0.1
580	10465	40	14.7	20	0
581	10465	45	7.6	30	0.1
582	10465	50	13	25	0
583	10466	11	16.8	10	0
584	10466	46	9.6	5	0
585	10467	24	3.6	28	0
586	10467	25	11.2	12	0
587	10468	30	20.7	8	0
588	10468	43	36.8	15	0
589	10469	2	15.2	40	0.15
590	10469	16	13.9	35	0.15
591	10469	44	15.5	2	0.15
592	10470	18	50	30	0
593	10470	23	7.2	15	0
594	10470	64	26.6	8	0
595	10471	7	24	30	0
596	10471	56	30.4	20	0
597	10472	24	3.6	80	0.05
598	10472	51	42.4	18	0
599	10473	33	2	12	0
600	10473	71	17.2	12	0
601	10474	14	18.6	12	0
602	10474	28	36.4	18	0
603	10474	40	14.7	21	0
604	10474	75	6.2	10	0
605	10475	31	10	35	0.15
606	10475	66	13.6	60	0.15
607	10475	76	14.4	42	0.15
608	10476	55	19.2	2	0.05
609	10476	70	12	12	0
610	10477	1	14.4	15	0
611	10477	21	8	21	0.25
612	10477	39	14.4	20	0.25
613	10478	10	24.8	20	0.05
614	10479	38	210.8	30	0
615	10479	53	26.2	28	0
616	10479	59	44	60	0
617	10479	64	26.6	30	0
618	10480	47	7.6	30	0
619	10480	59	44	12	0
620	10481	49	16	24	0
621	10481	60	27.2	40	0
622	10482	40	14.7	10	0
623	10483	34	11.2	35	0.05
624	10483	77	10.4	30	0.05
625	10484	21	8	14	0
626	10484	40	14.7	10	0
627	10484	51	42.4	3	0
628	10485	2	15.2	20	0.1
629	10485	3	8	20	0.1
630	10485	55	19.2	30	0.1
631	10485	70	12	60	0.1
632	10486	11	16.8	5	0
633	10486	51	42.4	25	0
634	10486	74	8	16	0
635	10487	19	7.3	5	0
636	10487	26	24.9	30	0
637	10487	54	5.9	24	0.25
638	10488	59	44	30	0
639	10488	73	12	20	0.2
640	10489	11	16.8	15	0.25
641	10489	16	13.9	18	0
642	10490	59	44	60	0
643	10490	68	10	30	0
644	10490	75	6.2	36	0
645	10491	44	15.5	15	0.15
646	10491	77	10.4	7	0.15
647	10492	25	11.2	60	0.05
648	10492	42	11.2	20	0.05
649	10493	65	16.8	15	0.1
650	10493	66	13.6	10	0.1
651	10493	69	28.8	10	0.1
652	10494	56	30.4	30	0
653	10495	23	7.2	10	0
654	10495	41	7.7	20	0
655	10495	77	10.4	5	0
656	10496	31	10	20	0.05
657	10497	56	30.4	14	0
658	10497	72	27.8	25	0
659	10497	77	10.4	25	0
660	10498	24	4.5	14	0
661	10498	40	18.4	5	0
662	10498	42	14	30	0
663	10499	28	45.6	20	0
664	10499	49	20	25	0
665	10500	15	15.5	12	0.05
666	10500	28	45.6	8	0.05
667	10501	54	7.45	20	0
668	10502	45	9.5	21	0
669	10502	53	32.8	6	0
670	10502	67	14	30	0
671	10503	14	23.25	70	0
672	10503	65	21.05	20	0
673	10504	2	19	12	0
674	10504	21	10	12	0
675	10504	53	32.8	10	0
676	10504	61	28.5	25	0
677	10505	62	49.3	3	0
678	10506	25	14	18	0.1
679	10506	70	15	14	0.1
680	10507	43	46	15	0.15
681	10507	48	12.75	15	0.15
682	10508	13	6	10	0
683	10508	39	18	10	0
684	10509	28	45.6	3	0
685	10510	29	123.79	36	0
686	10510	75	7.75	36	0.1
687	10511	4	22	50	0.15
688	10511	7	30	50	0.15
689	10511	8	40	10	0.15
690	10512	24	4.5	10	0.15
691	10512	46	12	9	0.15
692	10512	47	9.5	6	0.15
693	10512	60	34	12	0.15
694	10513	21	10	40	0.2
695	10513	32	32	50	0.2
696	10513	61	28.5	15	0.2
697	10514	20	81	39	0
698	10514	28	45.6	35	0
699	10514	56	38	70	0
700	10514	65	21.05	39	0
701	10514	75	7.75	50	0
702	10515	9	97	16	0.15
703	10515	16	17.45	50	0
704	10515	27	43.9	120	0
705	10515	33	2.5	16	0.15
706	10515	60	34	84	0.15
707	10516	18	62.5	25	0.1
708	10516	41	9.65	80	0.1
709	10516	42	14	20	0
710	10517	52	7	6	0
711	10517	59	55	4	0
712	10517	70	15	6	0
713	10518	24	4.5	5	0
714	10518	38	263.5	15	0
715	10518	44	19.45	9	0
716	10519	10	31	16	0.05
717	10519	56	38	40	0
718	10519	60	34	10	0.05
719	10520	24	4.5	8	0
720	10520	53	32.8	5	0
721	10521	35	18	3	0
722	10521	41	9.65	10	0
723	10521	68	12.5	6	0
724	10522	1	18	40	0.2
725	10522	8	40	24	0
726	10522	30	25.89	20	0.2
727	10522	40	18.4	25	0.2
728	10523	17	39	25	0.1
729	10523	20	81	15	0.1
730	10523	37	26	18	0.1
731	10523	41	9.65	6	0.1
732	10524	10	31	2	0
733	10524	30	25.89	10	0
734	10524	43	46	60	0
735	10524	54	7.45	15	0
736	10525	36	19	30	0
737	10525	40	18.4	15	0.1
738	10526	1	18	8	0.15
739	10526	13	6	10	0
740	10526	56	38	30	0.15
741	10527	4	22	50	0.1
742	10527	36	19	30	0.1
743	10528	11	21	3	0
744	10528	33	2.5	8	0.2
745	10528	72	34.8	9	0
746	10529	55	24	14	0
747	10529	68	12.5	20	0
748	10529	69	36	10	0
749	10530	17	39	40	0
750	10530	43	46	25	0
751	10530	61	28.5	20	0
752	10530	76	18	50	0
753	10531	59	55	2	0
754	10532	30	25.89	15	0
755	10532	66	17	24	0
756	10533	4	22	50	0.05
757	10533	72	34.8	24	0
758	10533	73	15	24	0.05
759	10534	30	25.89	10	0
760	10534	40	18.4	10	0.2
761	10534	54	7.45	10	0.2
762	10535	11	21	50	0.1
763	10535	40	18.4	10	0.1
764	10535	57	19.5	5	0.1
765	10535	59	55	15	0.1
766	10536	12	38	15	0.25
767	10536	31	12.5	20	0
768	10536	33	2.5	30	0
769	10536	60	34	35	0.25
770	10537	31	12.5	30	0
771	10537	51	53	6	0
772	10537	58	13.25	20	0
773	10537	72	34.8	21	0
774	10537	73	15	9	0
775	10538	70	15	7	0
776	10538	72	34.8	1	0
777	10539	13	6	8	0
778	10539	21	10	15	0
779	10539	33	2.5	15	0
780	10539	49	20	6	0
781	10540	3	10	60	0
782	10540	26	31.23	40	0
783	10540	38	263.5	30	0
784	10540	68	12.5	35	0
785	10541	24	4.5	35	0.1
786	10541	38	263.5	4	0.1
787	10541	65	21.05	36	0.1
788	10541	71	21.5	9	0.1
789	10542	11	21	15	0.05
790	10542	54	7.45	24	0.05
791	10543	12	38	30	0.15
792	10543	23	9	70	0.15
793	10544	28	45.6	7	0
794	10544	67	14	7	0
795	10545	11	21	10	0
796	10546	7	30	10	0
797	10546	35	18	30	0
798	10546	62	49.3	40	0
799	10547	32	32	24	0.15
800	10547	36	19	60	0
801	10548	34	14	10	0.25
802	10548	41	9.65	14	0
803	10549	31	12.5	55	0.15
804	10549	45	9.5	100	0.15
805	10549	51	53	48	0.15
806	10550	17	39	8	0.1
807	10550	19	9.2	10	0
808	10550	21	10	6	0.1
809	10550	61	28.5	10	0.1
810	10551	16	17.45	40	0.15
811	10551	35	18	20	0.15
812	10551	44	19.45	40	0
813	10552	69	36	18	0
814	10552	75	7.75	30	0
815	10553	11	21	15	0
816	10553	16	17.45	14	0
817	10553	22	21	24	0
818	10553	31	12.5	30	0
819	10553	35	18	6	0
820	10554	16	17.45	30	0.05
821	10554	23	9	20	0.05
822	10554	62	49.3	20	0.05
823	10554	77	13	10	0.05
824	10555	14	23.25	30	0.2
825	10555	19	9.2	35	0.2
826	10555	24	4.5	18	0.2
827	10555	51	53	20	0.2
828	10555	56	38	40	0.2
829	10556	72	34.8	24	0
830	10557	64	33.25	30	0
831	10557	75	7.75	20	0
832	10558	47	9.5	25	0
833	10558	51	53	20	0
834	10558	52	7	30	0
835	10558	53	32.8	18	0
836	10558	73	15	3	0
837	10559	41	9.65	12	0.05
838	10559	55	24	18	0.05
839	10560	30	25.89	20	0
840	10560	62	49.3	15	0.25
841	10561	44	19.45	10	0
842	10561	51	53	50	0
843	10562	33	2.5	20	0.1
844	10562	62	49.3	10	0.1
845	10563	36	19	25	0
846	10563	52	7	70	0
847	10564	17	39	16	0.05
848	10564	31	12.5	6	0.05
849	10564	55	24	25	0.05
850	10565	24	4.5	25	0.1
851	10565	64	33.25	18	0.1
852	10566	11	21	35	0.15
853	10566	18	62.5	18	0.15
854	10566	76	18	10	0
855	10567	31	12.5	60	0.2
856	10567	51	53	3	0
857	10567	59	55	40	0.2
858	10568	10	31	5	0
859	10569	31	12.5	35	0.2
860	10569	76	18	30	0
861	10570	11	21	15	0.05
862	10570	56	38	60	0.05
863	10571	14	23.25	11	0.15
864	10571	42	14	28	0.15
865	10572	16	17.45	12	0.1
866	10572	32	32	10	0.1
867	10572	40	18.4	50	0
868	10572	75	7.75	15	0.1
869	10573	17	39	18	0
870	10573	34	14	40	0
871	10573	53	32.8	25	0
872	10574	33	2.5	14	0
873	10574	40	18.4	2	0
874	10574	62	49.3	10	0
875	10574	64	33.25	6	0
876	10575	59	55	12	0
877	10575	63	43.9	6	0
878	10575	72	34.8	30	0
879	10575	76	18	10	0
880	10576	1	18	10	0
881	10576	31	12.5	20	0
882	10576	44	19.45	21	0
883	10577	39	18	10	0
884	10577	75	7.75	20	0
885	10577	77	13	18	0
886	10578	35	18	20	0
887	10578	57	19.5	6	0
888	10579	15	15.5	10	0
889	10579	75	7.75	21	0
890	10580	14	23.25	15	0.05
891	10580	41	9.65	9	0.05
892	10580	65	21.05	30	0.05
893	10581	75	7.75	50	0.2
894	10582	57	19.5	4	0
895	10582	76	18	14	0
896	10583	29	123.79	10	0
897	10583	60	34	24	0.15
898	10583	69	36	10	0.15
899	10584	31	12.5	50	0.05
900	10585	47	9.5	15	0
901	10586	52	7	4	0.15
902	10587	26	31.23	6	0
903	10587	35	18	20	0
904	10587	77	13	20	0
905	10588	18	62.5	40	0.2
906	10588	42	14	100	0.2
907	10589	35	18	4	0
908	10590	1	18	20	0
909	10590	77	13	60	0.05
910	10591	3	10	14	0
911	10591	7	30	10	0
912	10591	54	7.45	50	0
913	10592	15	15.5	25	0.05
914	10592	26	31.23	5	0.05
915	10593	20	81	21	0.2
916	10593	69	36	20	0.2
917	10593	76	18	4	0.2
918	10594	52	7	24	0
919	10594	58	13.25	30	0
920	10595	35	18	30	0.25
921	10595	61	28.5	120	0.25
922	10595	69	36	65	0.25
923	10596	56	38	5	0.2
924	10596	63	43.9	24	0.2
925	10596	75	7.75	30	0.2
926	10597	24	4.5	35	0.2
927	10597	57	19.5	20	0
928	10597	65	21.05	12	0.2
929	10598	27	43.9	50	0
930	10598	71	21.5	9	0
931	10599	62	49.3	10	0
932	10600	54	7.45	4	0
933	10600	73	15	30	0
934	10601	13	6	60	0
935	10601	59	55	35	0
936	10602	77	13	5	0.25
937	10603	22	21	48	0
938	10603	49	20	25	0.05
939	10604	48	12.75	6	0.1
940	10604	76	18	10	0.1
941	10605	16	17.45	30	0.05
942	10605	59	55	20	0.05
943	10605	60	34	70	0.05
944	10605	71	21.5	15	0.05
945	10606	4	22	20	0.2
946	10606	55	24	20	0.2
947	10606	62	49.3	10	0.2
948	10607	7	30	45	0
949	10607	17	39	100	0
950	10607	33	2.5	14	0
951	10607	40	18.4	42	0
952	10607	72	34.8	12	0
953	10608	56	38	28	0
954	10609	1	18	3	0
955	10609	10	31	10	0
956	10609	21	10	6	0
957	10610	36	19	21	0.25
958	10611	1	18	6	0
959	10611	2	19	10	0
960	10611	60	34	15	0
961	10612	10	31	70	0
962	10612	36	19	55	0
963	10612	49	20	18	0
964	10612	60	34	40	0
965	10612	76	18	80	0
966	10613	13	6	8	0.1
967	10613	75	7.75	40	0
968	10614	11	21	14	0
969	10614	21	10	8	0
970	10614	39	18	5	0
971	10615	55	24	5	0
972	10616	38	263.5	15	0.05
973	10616	56	38	14	0
974	10616	70	15	15	0.05
975	10616	71	21.5	15	0.05
976	10617	59	55	30	0.15
977	10618	6	25	70	0
978	10618	56	38	20	0
979	10618	68	12.5	15	0
980	10619	21	10	42	0
981	10619	22	21	40	0
982	10620	24	4.5	5	0
983	10620	52	7	5	0
984	10621	19	9.2	5	0
985	10621	23	9	10	0
986	10621	70	15	20	0
987	10621	71	21.5	15	0
988	10622	2	19	20	0
989	10622	68	12.5	18	0.2
990	10623	14	23.25	21	0
991	10623	19	9.2	15	0.1
992	10623	21	10	25	0.1
993	10623	24	4.5	3	0
994	10623	35	18	30	0.1
995	10624	28	45.6	10	0
996	10624	29	123.79	6	0
997	10624	44	19.45	10	0
998	10625	14	23.25	3	0
999	10625	42	14	5	0
1000	10625	60	34	10	0
1001	10626	53	32.8	12	0
1002	10626	60	34	20	0
1003	10626	71	21.5	20	0
1004	10627	62	49.3	15	0
1005	10627	73	15	35	0.15
1006	10628	1	18	25	0
1007	10629	29	123.79	20	0
1008	10629	64	33.25	9	0
1009	10630	55	24	12	0.05
1010	10630	76	18	35	0
1011	10631	75	7.75	8	0.1
1012	10632	2	19	30	0.05
1013	10632	33	2.5	20	0.05
1014	10633	12	38	36	0.15
1015	10633	13	6	13	0.15
1016	10633	26	31.23	35	0.15
1017	10633	62	49.3	80	0.15
1018	10634	7	30	35	0
1019	10634	18	62.5	50	0
1020	10634	51	53	15	0
1021	10634	75	7.75	2	0
1022	10635	4	22	10	0.1
1023	10635	5	21.35	15	0.1
1024	10635	22	21	40	0
1025	10636	4	22	25	0
1026	10636	58	13.25	6	0
1027	10637	11	21	10	0
1028	10637	50	16.25	25	0.05
1029	10637	56	38	60	0.05
1030	10638	45	9.5	20	0
1031	10638	65	21.05	21	0
1032	10638	72	34.8	60	0
1033	10639	18	62.5	8	0
1034	10640	69	36	20	0.25
1035	10640	70	15	15	0.25
1036	10641	2	19	50	0
1037	10641	40	18.4	60	0
1038	10642	21	10	30	0.2
1039	10642	61	28.5	20	0.2
1040	10643	28	45.6	15	0.25
1041	10643	39	18	21	0.25
1042	10643	46	12	2	0.25
1043	10644	18	62.5	4	0.1
1044	10644	43	46	20	0
1045	10644	46	12	21	0.1
1046	10645	18	62.5	20	0
1047	10645	36	19	15	0
1048	10646	1	18	15	0.25
1049	10646	10	31	18	0.25
1050	10646	71	21.5	30	0.25
1051	10646	77	13	35	0.25
1052	10647	19	9.2	30	0
1053	10647	39	18	20	0
1054	10648	22	21	15	0
1055	10648	24	4.5	15	0.15
1056	10649	28	45.6	20	0
1057	10649	72	34.8	15	0
1058	10650	30	25.89	30	0
1059	10650	53	32.8	25	0.05
1060	10650	54	7.45	30	0
1061	10651	19	9.2	12	0.25
1062	10651	22	21	20	0.25
1063	10652	30	25.89	2	0.25
1064	10652	42	14	20	0
1065	10653	16	17.45	30	0.1
1066	10653	60	34	20	0.1
1067	10654	4	22	12	0.1
1068	10654	39	18	20	0.1
1069	10654	54	7.45	6	0.1
1070	10655	41	9.65	20	0.2
1071	10656	14	23.25	3	0.1
1072	10656	44	19.45	28	0.1
1073	10656	47	9.5	6	0.1
1074	10657	15	15.5	50	0
1075	10657	41	9.65	24	0
1076	10657	46	12	45	0
1077	10657	47	9.5	10	0
1078	10657	56	38	45	0
1079	10657	60	34	30	0
1080	10658	21	10	60	0
1081	10658	40	18.4	70	0.05
1082	10658	60	34	55	0.05
1083	10658	77	13	70	0.05
1084	10659	31	12.5	20	0.05
1085	10659	40	18.4	24	0.05
1086	10659	70	15	40	0.05
1087	10660	20	81	21	0
1088	10661	39	18	3	0.2
1089	10661	58	13.25	49	0.2
1090	10662	68	12.5	10	0
1091	10663	40	18.4	30	0.05
1092	10663	42	14	30	0.05
1093	10663	51	53	20	0.05
1094	10664	10	31	24	0.15
1095	10664	56	38	12	0.15
1096	10664	65	21.05	15	0.15
1097	10665	51	53	20	0
1098	10665	59	55	1	0
1099	10665	76	18	10	0
1100	10666	29	123.79	36	0
1101	10666	65	21.05	10	0
1102	10667	69	36	45	0.2
1103	10667	71	21.5	14	0.2
1104	10668	31	12.5	8	0.1
1105	10668	55	24	4	0.1
1106	10668	64	33.25	15	0.1
1107	10669	36	19	30	0
1108	10670	23	9	32	0
1109	10670	46	12	60	0
1110	10670	67	14	25	0
1111	10670	73	15	50	0
1112	10670	75	7.75	25	0
1113	10671	16	17.45	10	0
1114	10671	62	49.3	10	0
1115	10671	65	21.05	12	0
1116	10672	38	263.5	15	0.1
1117	10672	71	21.5	12	0
1118	10673	16	17.45	3	0
1119	10673	42	14	6	0
1120	10673	43	46	6	0
1121	10674	23	9	5	0
1122	10675	14	23.25	30	0
1123	10675	53	32.8	10	0
1124	10675	58	13.25	30	0
1125	10676	10	31	2	0
1126	10676	19	9.2	7	0
1127	10676	44	19.45	21	0
1128	10677	26	31.23	30	0.15
1129	10677	33	2.5	8	0.15
1130	10678	12	38	100	0
1131	10678	33	2.5	30	0
1132	10678	41	9.65	120	0
1133	10678	54	7.45	30	0
1134	10679	59	55	12	0
1135	10680	16	17.45	50	0.25
1136	10680	31	12.5	20	0.25
1137	10680	42	14	40	0.25
1138	10681	19	9.2	30	0.1
1139	10681	21	10	12	0.1
1140	10681	64	33.25	28	0
1141	10682	33	2.5	30	0
1142	10682	66	17	4	0
1143	10682	75	7.75	30	0
1144	10683	52	7	9	0
1145	10684	40	18.4	20	0
1146	10684	47	9.5	40	0
1147	10684	60	34	30	0
1148	10685	10	31	20	0
1149	10685	41	9.65	4	0
1150	10685	47	9.5	15	0
1151	10686	17	39	30	0.2
1152	10686	26	31.23	15	0
1153	10687	9	97	50	0.25
1154	10687	29	123.79	10	0
1155	10687	36	19	6	0.25
1156	10688	10	31	18	0.1
1157	10688	28	45.6	60	0.1
1158	10688	34	14	14	0
1159	10689	1	18	35	0.25
1160	10690	56	38	20	0.25
1161	10690	77	13	30	0.25
1162	10691	1	18	30	0
1163	10691	29	123.79	40	0
1164	10691	43	46	40	0
1165	10691	44	19.45	24	0
1166	10691	62	49.3	48	0
1167	10692	63	43.9	20	0
1168	10693	9	97	6	0
1169	10693	54	7.45	60	0.15
1170	10693	69	36	30	0.15
1171	10693	73	15	15	0.15
1172	10694	7	30	90	0
1173	10694	59	55	25	0
1174	10694	70	15	50	0
1175	10695	8	40	10	0
1176	10695	12	38	4	0
1177	10695	24	4.5	20	0
1178	10696	17	39	20	0
1179	10696	46	12	18	0
1180	10697	19	9.2	7	0.25
1181	10697	35	18	9	0.25
1182	10697	58	13.25	30	0.25
1183	10697	70	15	30	0.25
1184	10698	11	21	15	0
1185	10698	17	39	8	0.05
1186	10698	29	123.79	12	0.05
1187	10698	65	21.05	65	0.05
1188	10698	70	15	8	0.05
1189	10699	47	9.5	12	0
1190	10700	1	18	5	0.2
1191	10700	34	14	12	0.2
1192	10700	68	12.5	40	0.2
1193	10700	71	21.5	60	0.2
1194	10701	59	55	42	0.15
1195	10701	71	21.5	20	0.15
1196	10701	76	18	35	0.15
1197	10702	3	10	6	0
1198	10702	76	18	15	0
1199	10703	2	19	5	0
1200	10703	59	55	35	0
1201	10703	73	15	35	0
1202	10704	4	22	6	0
1203	10704	24	4.5	35	0
1204	10704	48	12.75	24	0
1205	10705	31	12.5	20	0
1206	10705	32	32	4	0
1207	10706	16	17.45	20	0
1208	10706	43	46	24	0
1209	10706	59	55	8	0
1210	10707	55	24	21	0
1211	10707	57	19.5	40	0
1212	10707	70	15	28	0.15
1213	10708	5	21.35	4	0
1214	10708	36	19	5	0
1215	10709	8	40	40	0
1216	10709	51	53	28	0
1217	10709	60	34	10	0
1218	10710	19	9.2	5	0
1219	10710	47	9.5	5	0
1220	10711	19	9.2	12	0
1221	10711	41	9.65	42	0
1222	10711	53	32.8	120	0
1223	10712	53	32.8	3	0.05
1224	10712	56	38	30	0
1225	10713	10	31	18	0
1226	10713	26	31.23	30	0
1227	10713	45	9.5	110	0
1228	10713	46	12	24	0
1229	10714	2	19	30	0.25
1230	10714	17	39	27	0.25
1231	10714	47	9.5	50	0.25
1232	10714	56	38	18	0.25
1233	10714	58	13.25	12	0.25
1234	10715	10	31	21	0
1235	10715	71	21.5	30	0
1236	10716	21	10	5	0
1237	10716	51	53	7	0
1238	10716	61	28.5	10	0
1239	10717	21	10	32	0.05
1240	10717	54	7.45	15	0
1241	10717	69	36	25	0.05
1242	10718	12	38	36	0
1243	10718	16	17.45	20	0
1244	10718	36	19	40	0
1245	10718	62	49.3	20	0
1246	10719	18	62.5	12	0.25
1247	10719	30	25.89	3	0.25
1248	10719	54	7.45	40	0.25
1249	10720	35	18	21	0
1250	10720	71	21.5	8	0
1251	10721	44	19.45	50	0.05
1252	10722	2	19	3	0
1253	10722	31	12.5	50	0
1254	10722	68	12.5	45	0
1255	10722	75	7.75	42	0
1256	10723	26	31.23	15	0
1257	10724	10	31	16	0
1258	10724	61	28.5	5	0
1259	10725	41	9.65	12	0
1260	10725	52	7	4	0
1261	10725	55	24	6	0
1262	10726	4	22	25	0
1263	10726	11	21	5	0
1264	10727	17	39	20	0.05
1265	10727	56	38	10	0.05
1266	10727	59	55	10	0.05
1267	10728	30	25.89	15	0
1268	10728	40	18.4	6	0
1269	10728	55	24	12	0
1270	10728	60	34	15	0
1271	10729	1	18	50	0
1272	10729	21	10	30	0
1273	10729	50	16.25	40	0
1274	10730	16	17.45	15	0.05
1275	10730	31	12.5	3	0.05
1276	10730	65	21.05	10	0.05
1277	10731	21	10	40	0.05
1278	10731	51	53	30	0.05
1279	10732	76	18	20	0
1280	10733	14	23.25	16	0
1281	10733	28	45.6	20	0
1282	10733	52	7	25	0
1283	10734	6	25	30	0
1284	10734	30	25.89	15	0
1285	10734	76	18	20	0
1286	10735	61	28.5	20	0.1
1287	10735	77	13	2	0.1
1288	10736	65	21.05	40	0
1289	10736	75	7.75	20	0
1290	10737	13	6	4	0
1291	10737	41	9.65	12	0
1292	10738	16	17.45	3	0
1293	10739	36	19	6	0
1294	10739	52	7	18	0
1295	10740	28	45.6	5	0.2
1296	10740	35	18	35	0.2
1297	10740	45	9.5	40	0.2
1298	10740	56	38	14	0.2
1299	10741	2	19	15	0.2
1300	10742	3	10	20	0
1301	10742	60	34	50	0
1302	10742	72	34.8	35	0
1303	10743	46	12	28	0.05
1304	10744	40	18.4	50	0.2
1305	10745	18	62.5	24	0
1306	10745	44	19.45	16	0
1307	10745	59	55	45	0
1308	10745	72	34.8	7	0
1309	10746	13	6	6	0
1310	10746	42	14	28	0
1311	10746	62	49.3	9	0
1312	10746	69	36	40	0
1313	10747	31	12.5	8	0
1314	10747	41	9.65	35	0
1315	10747	63	43.9	9	0
1316	10747	69	36	30	0
1317	10748	23	9	44	0
1318	10748	40	18.4	40	0
1319	10748	56	38	28	0
1320	10749	56	38	15	0
1321	10749	59	55	6	0
1322	10749	76	18	10	0
1323	10750	14	23.25	5	0.15
1324	10750	45	9.5	40	0.15
1325	10750	59	55	25	0.15
1326	10751	26	31.23	12	0.1
1327	10751	30	25.89	30	0
1328	10751	50	16.25	20	0.1
1329	10751	73	15	15	0
1330	10752	1	18	8	0
1331	10752	69	36	3	0
1332	10753	45	9.5	4	0
1333	10753	74	10	5	0
1334	10754	40	18.4	3	0
1335	10755	47	9.5	30	0.25
1336	10755	56	38	30	0.25
1337	10755	57	19.5	14	0.25
1338	10755	69	36	25	0.25
1339	10756	18	62.5	21	0.2
1340	10756	36	19	20	0.2
1341	10756	68	12.5	6	0.2
1342	10756	69	36	20	0.2
1343	10757	34	14	30	0
1344	10757	59	55	7	0
1345	10757	62	49.3	30	0
1346	10757	64	33.25	24	0
1347	10758	26	31.23	20	0
1348	10758	52	7	60	0
1349	10758	70	15	40	0
1350	10759	32	32	10	0
1351	10760	25	14	12	0.25
1352	10760	27	43.9	40	0
1353	10760	43	46	30	0.25
1354	10761	25	14	35	0.25
1355	10761	75	7.75	18	0
1356	10762	39	18	16	0
1357	10762	47	9.5	30	0
1358	10762	51	53	28	0
1359	10762	56	38	60	0
1360	10763	21	10	40	0
1361	10763	22	21	6	0
1362	10763	24	4.5	20	0
1363	10764	3	10	20	0.1
1364	10764	39	18	130	0.1
1365	10765	65	21.05	80	0.1
1366	10766	2	19	40	0
1367	10766	7	30	35	0
1368	10766	68	12.5	40	0
1369	10767	42	14	2	0
1370	10768	22	21	4	0
1371	10768	31	12.5	50	0
1372	10768	60	34	15	0
1373	10768	71	21.5	12	0
1374	10769	41	9.65	30	0.05
1375	10769	52	7	15	0.05
1376	10769	61	28.5	20	0
1377	10769	62	49.3	15	0
1378	10770	11	21	15	0.25
1379	10771	71	21.5	16	0
1380	10772	29	123.79	18	0
1381	10772	59	55	25	0
1382	10773	17	39	33	0
1383	10773	31	12.5	70	0.2
1384	10773	75	7.75	7	0.2
1385	10774	31	12.5	2	0.25
1386	10774	66	17	50	0
1387	10775	10	31	6	0
1388	10775	67	14	3	0
1389	10776	31	12.5	16	0.05
1390	10776	42	14	12	0.05
1391	10776	45	9.5	27	0.05
1392	10776	51	53	120	0.05
1393	10777	42	14	20	0.2
1394	10778	41	9.65	10	0
1395	10779	16	17.45	20	0
1396	10779	62	49.3	20	0
1397	10780	70	15	35	0
1398	10780	77	13	15	0
1399	10781	54	7.45	3	0.2
1400	10781	56	38	20	0.2
1401	10781	74	10	35	0
1402	10782	31	12.5	1	0
1403	10783	31	12.5	10	0
1404	10783	38	263.5	5	0
1405	10784	36	19	30	0
1406	10784	39	18	2	0.15
1407	10784	72	34.8	30	0.15
1408	10785	10	31	10	0
1409	10785	75	7.75	10	0
1410	10786	8	40	30	0.2
1411	10786	30	25.89	15	0.2
1412	10786	75	7.75	42	0.2
1413	10787	2	19	15	0.05
1414	10787	29	123.79	20	0.05
1415	10788	19	9.2	50	0.05
1416	10788	75	7.75	40	0.05
1417	10789	18	62.5	30	0
1418	10789	35	18	15	0
1419	10789	63	43.9	30	0
1420	10789	68	12.5	18	0
1421	10790	7	30	3	0.15
1422	10790	56	38	20	0.15
1423	10791	29	123.79	14	0.05
1424	10791	41	9.65	20	0.05
1425	10792	2	19	10	0
1426	10792	54	7.45	3	0
1427	10792	68	12.5	15	0
1428	10793	41	9.65	14	0
1429	10793	52	7	8	0
1430	10794	14	23.25	15	0.2
1431	10794	54	7.45	6	0.2
1432	10795	16	17.45	65	0
1433	10795	17	39	35	0.25
1434	10796	26	31.23	21	0.2
1435	10796	44	19.45	10	0
1436	10796	64	33.25	35	0.2
1437	10796	69	36	24	0.2
1438	10797	11	21	20	0
1439	10798	62	49.3	2	0
1440	10798	72	34.8	10	0
1441	10799	13	6	20	0.15
1442	10799	24	4.5	20	0.15
1443	10799	59	55	25	0
1444	10800	11	21	50	0.1
1445	10800	51	53	10	0.1
1446	10800	54	7.45	7	0.1
1447	10801	17	39	40	0.25
1448	10801	29	123.79	20	0.25
1449	10802	30	25.89	25	0.25
1450	10802	51	53	30	0.25
1451	10802	55	24	60	0.25
1452	10802	62	49.3	5	0.25
1453	10803	19	9.2	24	0.05
1454	10803	25	14	15	0.05
1455	10803	59	55	15	0.05
1456	10804	10	31	36	0
1457	10804	28	45.6	24	0
1458	10804	49	20	4	0.15
1459	10805	34	14	10	0
1460	10805	38	263.5	10	0
1461	10806	2	19	20	0.25
1462	10806	65	21.05	2	0
1463	10806	74	10	15	0.25
1464	10807	40	18.4	1	0
1465	10808	56	38	20	0.15
1466	10808	76	18	50	0.15
1467	10809	52	7	20	0
1468	10810	13	6	7	0
1469	10810	25	14	5	0
1470	10810	70	15	5	0
1471	10811	19	9.2	15	0
1472	10811	23	9	18	0
1473	10811	40	18.4	30	0
1474	10812	31	12.5	16	0.1
1475	10812	72	34.8	40	0.1
1476	10812	77	13	20	0
1477	10813	2	19	12	0.2
1478	10813	46	12	35	0
1479	10814	41	9.65	20	0
1480	10814	43	46	20	0.15
1481	10814	48	12.75	8	0.15
1482	10814	61	28.5	30	0.15
1483	10815	33	2.5	16	0
1484	10816	38	263.5	30	0.05
1485	10816	62	49.3	20	0.05
1486	10817	26	31.23	40	0.15
1487	10817	38	263.5	30	0
1488	10817	40	18.4	60	0.15
1489	10817	62	49.3	25	0.15
1490	10818	32	32	20	0
1491	10818	41	9.65	20	0
1492	10819	43	46	7	0
1493	10819	75	7.75	20	0
1494	10820	56	38	30	0
1495	10821	35	18	20	0
1496	10821	51	53	6	0
1497	10822	62	49.3	3	0
1498	10822	70	15	6	0
1499	10823	11	21	20	0.1
1500	10823	57	19.5	15	0
1501	10823	59	55	40	0.1
1502	10823	77	13	15	0.1
1503	10824	41	9.65	12	0
1504	10824	70	15	9	0
1505	10825	26	31.23	12	0
1506	10825	53	32.8	20	0
1507	10826	31	12.5	35	0
1508	10826	57	19.5	15	0
1509	10827	10	31	15	0
1510	10827	39	18	21	0
1511	10828	20	81	5	0
1512	10828	38	263.5	2	0
1513	10829	2	19	10	0
1514	10829	8	40	20	0
1515	10829	13	6	10	0
1516	10829	60	34	21	0
1517	10830	6	25	6	0
1518	10830	39	18	28	0
1519	10830	60	34	30	0
1520	10830	68	12.5	24	0
1521	10831	19	9.2	2	0
1522	10831	35	18	8	0
1523	10831	38	263.5	8	0
1524	10831	43	46	9	0
1525	10832	13	6	3	0.2
1526	10832	25	14	10	0.2
1527	10832	44	19.45	16	0.2
1528	10832	64	33.25	3	0
1529	10833	7	30	20	0.1
1530	10833	31	12.5	9	0.1
1531	10833	53	32.8	9	0.1
1532	10834	29	123.79	8	0.05
1533	10834	30	25.89	20	0.05
1534	10835	59	55	15	0
1535	10835	77	13	2	0.2
1536	10836	22	21	52	0
1537	10836	35	18	6	0
1538	10836	57	19.5	24	0
1539	10836	60	34	60	0
1540	10836	64	33.25	30	0
1541	10837	13	6	6	0
1542	10837	40	18.4	25	0
1543	10837	47	9.5	40	0.25
1544	10837	76	18	21	0.25
1545	10838	1	18	4	0.25
1546	10838	18	62.5	25	0.25
1547	10838	36	19	50	0.25
1548	10839	58	13.25	30	0.1
1549	10839	72	34.8	15	0.1
1550	10840	25	14	6	0.2
1551	10840	39	18	10	0.2
1552	10841	10	31	16	0
1553	10841	56	38	30	0
1554	10841	59	55	50	0
1555	10841	77	13	15	0
1556	10842	11	21	15	0
1557	10842	43	46	5	0
1558	10842	68	12.5	20	0
1559	10842	70	15	12	0
1560	10843	51	53	4	0.25
1561	10844	22	21	35	0
1562	10845	23	9	70	0.1
1563	10845	35	18	25	0.1
1564	10845	42	14	42	0.1
1565	10845	58	13.25	60	0.1
1566	10845	64	33.25	48	0
1567	10846	4	22	21	0
1568	10846	70	15	30	0
1569	10846	74	10	20	0
1570	10847	1	18	80	0.2
1571	10847	19	9.2	12	0.2
1572	10847	37	26	60	0.2
1573	10847	45	9.5	36	0.2
1574	10847	60	34	45	0.2
1575	10847	71	21.5	55	0.2
1576	10848	5	21.35	30	0
1577	10848	9	97	3	0
1578	10849	3	10	49	0
1579	10849	26	31.23	18	0.15
1580	10850	25	14	20	0.15
1581	10850	33	2.5	4	0.15
1582	10850	70	15	30	0.15
1583	10851	2	19	5	0.05
1584	10851	25	14	10	0.05
1585	10851	57	19.5	10	0.05
1586	10851	59	55	42	0.05
1587	10852	2	19	15	0
1588	10852	17	39	6	0
1589	10852	62	49.3	50	0
1590	10853	18	62.5	10	0
1591	10854	10	31	100	0.15
1592	10854	13	6	65	0.15
1593	10855	16	17.45	50	0
1594	10855	31	12.5	14	0
1595	10855	56	38	24	0
1596	10855	65	21.05	15	0.15
1597	10856	2	19	20	0
1598	10856	42	14	20	0
1599	10857	3	10	30	0
1600	10857	26	31.23	35	0.25
1601	10857	29	123.79	10	0.25
1602	10858	7	30	5	0
1603	10858	27	43.9	10	0
1604	10858	70	15	4	0
1605	10859	24	4.5	40	0.25
1606	10859	54	7.45	35	0.25
1607	10859	64	33.25	30	0.25
1608	10860	51	53	3	0
1609	10860	76	18	20	0
1610	10861	17	39	42	0
1611	10861	18	62.5	20	0
1612	10861	21	10	40	0
1613	10861	33	2.5	35	0
1614	10861	62	49.3	3	0
1615	10862	11	21	25	0
1616	10862	52	7	8	0
1617	10863	1	18	20	0.15
1618	10863	58	13.25	12	0.15
1619	10864	35	18	4	0
1620	10864	67	14	15	0
1621	10865	38	263.5	60	0.05
1622	10865	39	18	80	0.05
1623	10866	2	19	21	0.25
1624	10866	24	4.5	6	0.25
1625	10866	30	25.89	40	0.25
1626	10867	53	32.8	3	0
1627	10868	26	31.23	20	0
1628	10868	35	18	30	0
1629	10868	49	20	42	0.1
1630	10869	1	18	40	0
1631	10869	11	21	10	0
1632	10869	23	9	50	0
1633	10869	68	12.5	20	0
1634	10870	35	18	3	0
1635	10870	51	53	2	0
1636	10871	6	25	50	0.05
1637	10871	16	17.45	12	0.05
1638	10871	17	39	16	0.05
1639	10872	55	24	10	0.05
1640	10872	62	49.3	20	0.05
1641	10872	64	33.25	15	0.05
1642	10872	65	21.05	21	0.05
1643	10873	21	10	20	0
1644	10873	28	45.6	3	0
1645	10874	10	31	10	0
1646	10875	19	9.2	25	0
1647	10875	47	9.5	21	0.1
1648	10875	49	20	15	0
1649	10876	46	12	21	0
1650	10876	64	33.25	20	0
1651	10877	16	17.45	30	0.25
1652	10877	18	62.5	25	0
1653	10878	20	81	20	0.05
1654	10879	40	18.4	12	0
1655	10879	65	21.05	10	0
1656	10879	76	18	10	0
1657	10880	23	9	30	0.2
1658	10880	61	28.5	30	0.2
1659	10880	70	15	50	0.2
1660	10881	73	15	10	0
1661	10882	42	14	25	0
1662	10882	49	20	20	0.15
1663	10882	54	7.45	32	0.15
1664	10883	24	4.5	8	0
1665	10884	21	10	40	0.05
1666	10884	56	38	21	0.05
1667	10884	65	21.05	12	0.05
1668	10885	2	19	20	0
1669	10885	24	4.5	12	0
1670	10885	70	15	30	0
1671	10885	77	13	25	0
1672	10886	10	31	70	0
1673	10886	31	12.5	35	0
1674	10886	77	13	40	0
1675	10887	25	14	5	0
1676	10888	2	19	20	0
1677	10888	68	12.5	18	0
1678	10889	11	21	40	0
1679	10889	38	263.5	40	0
1680	10890	17	39	15	0
1681	10890	34	14	10	0
1682	10890	41	9.65	14	0
1683	10891	30	25.89	15	0.05
1684	10892	59	55	40	0.05
1685	10893	8	40	30	0
1686	10893	24	4.5	10	0
1687	10893	29	123.79	24	0
1688	10893	30	25.89	35	0
1689	10893	36	19	20	0
1690	10894	13	6	28	0.05
1691	10894	69	36	50	0.05
1692	10894	75	7.75	120	0.05
1693	10895	24	4.5	110	0
1694	10895	39	18	45	0
1695	10895	40	18.4	91	0
1696	10895	60	34	100	0
1697	10896	45	9.5	15	0
1698	10896	56	38	16	0
1699	10897	29	123.79	80	0
1700	10897	30	25.89	36	0
1701	10898	13	6	5	0
1702	10899	39	18	8	0.15
1703	10900	70	15	3	0.25
1704	10901	41	9.65	30	0
1705	10901	71	21.5	30	0
1706	10902	55	24	30	0.15
1707	10902	62	49.3	6	0.15
1708	10903	13	6	40	0
1709	10903	65	21.05	21	0
1710	10903	68	12.5	20	0
1711	10904	58	13.25	15	0
1712	10904	62	49.3	35	0
1713	10905	1	18	20	0.05
1714	10906	61	28.5	15	0
1715	10907	75	7.75	14	0
1716	10908	7	30	20	0.05
1717	10908	52	7	14	0.05
1718	10909	7	30	12	0
1719	10909	16	17.45	15	0
1720	10909	41	9.65	5	0
1721	10910	19	9.2	12	0
1722	10910	49	20	10	0
1723	10910	61	28.5	5	0
1724	10911	1	18	10	0
1725	10911	17	39	12	0
1726	10911	67	14	15	0
1727	10912	11	21	40	0.25
1728	10912	29	123.79	60	0.25
1729	10913	4	22	30	0.25
1730	10913	33	2.5	40	0.25
1731	10913	58	13.25	15	0
1732	10914	71	21.5	25	0
1733	10915	17	39	10	0
1734	10915	33	2.5	30	0
1735	10915	54	7.45	10	0
1736	10916	16	17.45	6	0
1737	10916	32	32	6	0
1738	10916	57	19.5	20	0
1739	10917	30	25.89	1	0
1740	10917	60	34	10	0
1741	10918	1	18	60	0.25
1742	10918	60	34	25	0.25
1743	10919	16	17.45	24	0
1744	10919	25	14	24	0
1745	10919	40	18.4	20	0
1746	10920	50	16.25	24	0
1747	10921	35	18	10	0
1748	10921	63	43.9	40	0
1749	10922	17	39	15	0
1750	10922	24	4.5	35	0
1751	10923	42	14	10	0.2
1752	10923	43	46	10	0.2
1753	10923	67	14	24	0.2
1754	10924	10	31	20	0.1
1755	10924	28	45.6	30	0.1
1756	10924	75	7.75	6	0
1757	10925	36	19	25	0.15
1758	10925	52	7	12	0.15
1759	10926	11	21	2	0
1760	10926	13	6	10	0
1761	10926	19	9.2	7	0
1762	10926	72	34.8	10	0
1763	10927	20	81	5	0
1764	10927	52	7	5	0
1765	10927	76	18	20	0
1766	10928	47	9.5	5	0
1767	10928	76	18	5	0
1768	10929	21	10	60	0
1769	10929	75	7.75	49	0
1770	10929	77	13	15	0
1771	10930	21	10	36	0
1772	10930	27	43.9	25	0
1773	10930	55	24	25	0.2
1774	10930	58	13.25	30	0.2
1775	10931	13	6	42	0.15
1776	10931	57	19.5	30	0
1777	10932	16	17.45	30	0.1
1778	10932	62	49.3	14	0.1
1779	10932	72	34.8	16	0
1780	10932	75	7.75	20	0.1
1781	10933	53	32.8	2	0
1782	10933	61	28.5	30	0
1783	10934	6	25	20	0
1784	10935	1	18	21	0
1785	10935	18	62.5	4	0.25
1786	10935	23	9	8	0.25
1787	10936	36	19	30	0.2
1788	10937	28	45.6	8	0
1789	10937	34	14	20	0
1790	10938	13	6	20	0.25
1791	10938	43	46	24	0.25
1792	10938	60	34	49	0.25
1793	10938	71	21.5	35	0.25
1794	10939	2	19	10	0.15
1795	10939	67	14	40	0.15
1796	10940	7	30	8	0
1797	10940	13	6	20	0
1798	10941	31	12.5	44	0.25
1799	10941	62	49.3	30	0.25
1800	10941	68	12.5	80	0.25
1801	10941	72	34.8	50	0
1802	10942	49	20	28	0
1803	10943	13	6	15	0
1804	10943	22	21	21	0
1805	10943	46	12	15	0
1806	10944	11	21	5	0.25
1807	10944	44	19.45	18	0.25
1808	10944	56	38	18	0
1809	10945	13	6	20	0
1810	10945	31	12.5	10	0
1811	10946	10	31	25	0
1812	10946	24	4.5	25	0
1813	10946	77	13	40	0
1814	10947	59	55	4	0
1815	10948	50	16.25	9	0
1816	10948	51	53	40	0
1817	10948	55	24	4	0
1818	10949	6	25	12	0
1819	10949	10	31	30	0
1820	10949	17	39	6	0
1821	10949	62	49.3	60	0
1822	10950	4	22	5	0
1823	10951	33	2.5	15	0.05
1824	10951	41	9.65	6	0.05
1825	10951	75	7.75	50	0.05
1826	10952	6	25	16	0.05
1827	10952	28	45.6	2	0
1828	10953	20	81	50	0.05
1829	10953	31	12.5	50	0.05
1830	10954	16	17.45	28	0.15
1831	10954	31	12.5	25	0.15
1832	10954	45	9.5	30	0
1833	10954	60	34	24	0.15
1834	10955	75	7.75	12	0.2
1835	10956	21	10	12	0
1836	10956	47	9.5	14	0
1837	10956	51	53	8	0
1838	10957	30	25.89	30	0
1839	10957	35	18	40	0
1840	10957	64	33.25	8	0
1841	10958	5	21.35	20	0
1842	10958	7	30	6	0
1843	10958	72	34.8	5	0
1844	10959	75	7.75	20	0.15
1845	10960	24	4.5	10	0.25
1846	10960	41	9.65	24	0
1847	10961	52	7	6	0.05
1848	10961	76	18	60	0
1849	10962	7	30	45	0
1850	10962	13	6	77	0
1851	10962	53	32.8	20	0
1852	10962	69	36	9	0
1853	10962	76	18	44	0
1854	10963	60	34	2	0.15
1855	10964	18	62.5	6	0
1856	10964	38	263.5	5	0
1857	10964	69	36	10	0
1858	10965	51	53	16	0
1859	10966	37	26	8	0
1860	10966	56	38	12	0.15
1861	10966	62	49.3	12	0.15
1862	10967	19	9.2	12	0
1863	10967	49	20	40	0
1864	10968	12	38	30	0
1865	10968	24	4.5	30	0
1866	10968	64	33.25	4	0
1867	10969	46	12	9	0
1868	10970	52	7	40	0.2
1869	10971	29	123.79	14	0
1870	10972	17	39	6	0
1871	10972	33	2.5	7	0
1872	10973	26	31.23	5	0
1873	10973	41	9.65	6	0
1874	10973	75	7.75	10	0
1875	10974	63	43.9	10	0
1876	10975	8	40	16	0
1877	10975	75	7.75	10	0
1878	10976	28	45.6	20	0
1879	10977	39	18	30	0
1880	10977	47	9.5	30	0
1881	10977	51	53	10	0
1882	10977	63	43.9	20	0
1883	10978	8	40	20	0.15
1884	10978	21	10	40	0.15
1885	10978	40	18.4	10	0
1886	10978	44	19.45	6	0.15
1887	10979	7	30	18	0
1888	10979	12	38	20	0
1889	10979	24	4.5	80	0
1890	10979	27	43.9	30	0
1891	10979	31	12.5	24	0
1892	10979	63	43.9	35	0
1893	10980	75	7.75	40	0.2
1894	10981	38	263.5	60	0
1895	10982	7	30	20	0
1896	10982	43	46	9	0
1897	10983	13	6	84	0.15
1898	10983	57	19.5	15	0
1899	10984	16	17.45	55	0
1900	10984	24	4.5	20	0
1901	10984	36	19	40	0
1902	10985	16	17.45	36	0.1
1903	10985	18	62.5	8	0.1
1904	10985	32	32	35	0.1
1905	10986	11	21	30	0
1906	10986	20	81	15	0
1907	10986	76	18	10	0
1908	10986	77	13	15	0
1909	10987	7	30	60	0
1910	10987	43	46	6	0
1911	10987	72	34.8	20	0
1912	10988	7	30	60	0
1913	10988	62	49.3	40	0.1
1914	10989	6	25	40	0
1915	10989	11	21	15	0
1916	10989	41	9.65	4	0
1917	10990	21	10	65	0
1918	10990	34	14	60	0.15
1919	10990	55	24	65	0.15
1920	10990	61	28.5	66	0.15
1921	10991	2	19	50	0.2
1922	10991	70	15	20	0.2
1923	10991	76	18	90	0.2
1924	10992	72	34.8	2	0
1925	10993	29	123.79	50	0.25
1926	10993	41	9.65	35	0.25
1927	10994	59	55	18	0.05
1928	10995	51	53	20	0
1929	10995	60	34	4	0
1930	10996	42	14	40	0
1931	10997	32	32	50	0
1932	10997	46	12	20	0.25
1933	10997	52	7	20	0.25
1934	10998	24	4.5	12	0
1935	10998	61	28.5	7	0
1936	10998	74	10	20	0
1937	10998	75	7.75	30	0
1938	10999	41	9.65	20	0.05
1939	10999	51	53	15	0.05
1940	10999	77	13	21	0.05
1941	11000	4	22	25	0.25
1942	11000	24	4.5	30	0.25
1943	11000	77	13	30	0
1944	11001	7	30	60	0
1945	11001	22	21	25	0
1946	11001	46	12	25	0
1947	11001	55	24	6	0
1948	11002	13	6	56	0
1949	11002	35	18	15	0.15
1950	11002	42	14	24	0.15
1951	11002	55	24	40	0
1952	11003	1	18	4	0
1953	11003	40	18.4	10	0
1954	11003	52	7	10	0
1955	11004	26	31.23	6	0
1956	11004	76	18	6	0
1957	11005	1	18	2	0
1958	11005	59	55	10	0
1959	11006	1	18	8	0
1960	11006	29	123.79	2	0.25
1961	11007	8	40	30	0
1962	11007	29	123.79	10	0
1963	11007	42	14	14	0
1964	11008	28	45.6	70	0.05
1965	11008	34	14	90	0.05
1966	11008	71	21.5	21	0
1967	11009	24	4.5	12	0
1968	11009	36	19	18	0.25
1969	11009	60	34	9	0
1970	11010	7	30	20	0
1971	11010	24	4.5	10	0
1972	11011	58	13.25	40	0.05
1973	11011	71	21.5	20	0
1974	11012	19	9.2	50	0.05
1975	11012	60	34	36	0.05
1976	11012	71	21.5	60	0.05
1977	11013	23	9	10	0
1978	11013	42	14	4	0
1979	11013	45	9.5	20	0
1980	11013	68	12.5	2	0
1981	11014	41	9.65	28	0.1
1982	11015	30	25.89	15	0
1983	11015	77	13	18	0
1984	11016	31	12.5	15	0
1985	11016	36	19	16	0
1986	11017	3	10	25	0
1987	11017	59	55	110	0
1988	11017	70	15	30	0
1989	11018	12	38	20	0
1990	11018	18	62.5	10	0
1991	11018	56	38	5	0
1992	11019	46	12	3	0
1993	11019	49	20	2	0
1994	11020	10	31	24	0.15
1995	11021	2	19	11	0.25
1996	11021	20	81	15	0
1997	11021	26	31.23	63	0
1998	11021	51	53	44	0.25
1999	11021	72	34.8	35	0
2000	11022	19	9.2	35	0
2001	11022	69	36	30	0
2002	11023	7	30	4	0
2003	11023	43	46	30	0
2004	11024	26	31.23	12	0
2005	11024	33	2.5	30	0
2006	11024	65	21.05	21	0
2007	11024	71	21.5	50	0
2008	11025	1	18	10	0.1
2009	11025	13	6	20	0.1
2010	11026	18	62.5	8	0
2011	11026	51	53	10	0
2012	11027	24	4.5	30	0.25
2013	11027	62	49.3	21	0.25
2014	11028	55	24	35	0
2015	11028	59	55	24	0
2016	11029	56	38	20	0
2017	11029	63	43.9	12	0
2018	11030	2	19	100	0.25
2019	11030	5	21.35	70	0
2020	11030	29	123.79	60	0.25
2021	11030	59	55	100	0.25
2022	11031	1	18	45	0
2023	11031	13	6	80	0
2024	11031	24	4.5	21	0
2025	11031	64	33.25	20	0
2026	11031	71	21.5	16	0
2027	11032	36	19	35	0
2028	11032	38	263.5	25	0
2029	11032	59	55	30	0
2030	11033	53	32.8	70	0.1
2031	11033	69	36	36	0.1
2032	11034	21	10	15	0.1
2033	11034	44	19.45	12	0
2034	11034	61	28.5	6	0
2035	11035	1	18	10	0
2036	11035	35	18	60	0
2037	11035	42	14	30	0
2038	11035	54	7.45	10	0
2039	11036	13	6	7	0
2040	11036	59	55	30	0
2041	11037	70	15	4	0
2042	11038	40	18.4	5	0.2
2043	11038	52	7	2	0
2044	11038	71	21.5	30	0
2045	11039	28	45.6	20	0
2046	11039	35	18	24	0
2047	11039	49	20	60	0
2048	11039	57	19.5	28	0
2049	11040	21	10	20	0
2050	11041	2	19	30	0.2
2051	11041	63	43.9	30	0
2052	11042	44	19.45	15	0
2053	11042	61	28.5	4	0
2054	11043	11	21	10	0
2055	11044	62	49.3	12	0
2056	11045	33	2.5	15	0
2057	11045	51	53	24	0
2058	11046	12	38	20	0.05
2059	11046	32	32	15	0.05
2060	11046	35	18	18	0.05
2061	11047	1	18	25	0.25
2062	11047	5	21.35	30	0.25
2063	11048	68	12.5	42	0
2064	11049	2	19	10	0.2
2065	11049	12	38	4	0.2
2066	11050	76	18	50	0.1
2067	11051	24	4.5	10	0.2
2068	11052	43	46	30	0.2
2069	11052	61	28.5	10	0.2
2070	11053	18	62.5	35	0.2
2071	11053	32	32	20	0
2072	11053	64	33.25	25	0.2
2073	11054	33	2.5	10	0
2074	11054	67	14	20	0
2075	11055	24	4.5	15	0
2076	11055	25	14	15	0
2077	11055	51	53	20	0
2078	11055	57	19.5	20	0
2079	11056	7	30	40	0
2080	11056	55	24	35	0
2081	11056	60	34	50	0
2082	11057	70	15	3	0
2083	11058	21	10	3	0
2084	11058	60	34	21	0
2085	11058	61	28.5	4	0
2086	11059	13	6	30	0
2087	11059	17	39	12	0
2088	11059	60	34	35	0
2089	11060	60	34	4	0
2090	11060	77	13	10	0
2091	11061	60	34	15	0
2092	11062	53	32.8	10	0.2
2093	11062	70	15	12	0.2
2094	11063	34	14	30	0
2095	11063	40	18.4	40	0.1
2096	11063	41	9.65	30	0.1
2097	11064	17	39	77	0.1
2098	11064	41	9.65	12	0
2099	11064	53	32.8	25	0.1
2100	11064	55	24	4	0.1
2101	11064	68	12.5	55	0
2102	11065	30	25.89	4	0.25
2103	11065	54	7.45	20	0.25
2104	11066	16	17.45	3	0
2105	11066	19	9.2	42	0
2106	11066	34	14	35	0
2107	11067	41	9.65	9	0
2108	11068	28	45.6	8	0.15
2109	11068	43	46	36	0.15
2110	11068	77	13	28	0.15
2111	11069	39	18	20	0
2112	11070	1	18	40	0.15
2113	11070	2	19	20	0.15
2114	11070	16	17.45	30	0.15
2115	11070	31	12.5	20	0
2116	11071	7	30	15	0.05
2117	11071	13	6	10	0.05
2118	11072	2	19	8	0
2119	11072	41	9.65	40	0
2120	11072	50	16.25	22	0
2121	11072	64	33.25	130	0
2122	11073	11	21	10	0
2123	11073	24	4.5	20	0
2124	11074	16	17.45	14	0.05
2125	11075	2	19	10	0.15
2126	11075	46	12	30	0.15
2127	11075	76	18	2	0.15
2128	11076	6	25	20	0.25
2129	11076	14	23.25	20	0.25
2130	11076	19	9.2	10	0.25
2131	11077	2	19	24	0.2
2132	11077	3	10	4	0
2133	11077	4	22	1	0
2134	11077	6	25	1	0.02
2135	11077	7	30	1	0.05
2136	11077	8	40	2	0.1
2137	11077	10	31	1	0
2138	11077	12	38	2	0.05
2139	11077	13	6	4	0
2140	11077	14	23.25	1	0.03
2141	11077	16	17.45	2	0.03
2142	11077	20	81	1	0.04
2143	11077	23	9	2	0
2144	11077	32	32	1	0
2145	11077	39	18	2	0.05
2146	11077	41	9.65	3	0
2147	11077	46	12	3	0.02
2148	11077	52	7	2	0
2149	11077	55	24	2	0
2150	11077	60	34	2	0.06
2151	11077	64	33.25	2	0.03
2152	11077	66	17	1	0
2153	11077	73	15	2	0.01
2154	11077	75	7.75	4	0
2155	11077	77	13	2	0
2156	10248	11	14	12	0
2157	10248	42	9.8	10	0
2158	10248	72	34.8	5	0
2159	10249	14	18.6	9	0
2160	10249	51	42.4	40	0
2161	10250	41	7.7	10	0
2162	10250	51	42.4	35	0.15
2163	10250	65	16.8	15	0.15
2164	10251	22	16.8	6	0.05
2165	10251	57	15.6	15	0.05
2166	10251	65	16.8	20	0
2167	10252	20	64.8	40	0.05
2168	10252	33	2	25	0.05
2169	10252	60	27.2	40	0
2170	10253	31	10	20	0
2171	10253	39	14.4	42	0
2172	10253	49	16	40	0
2173	10254	24	3.6	15	0.15
2174	10254	55	19.2	21	0.15
2175	10254	74	8	21	0
2176	10255	2	15.2	20	0
2177	10255	16	13.9	35	0
2178	10255	36	15.2	25	0
2179	10255	59	44	30	0
2180	10256	53	26.2	15	0
2181	10256	77	10.4	12	0
2182	10257	27	35.1	25	0
2183	10257	39	14.4	6	0
2184	10257	77	10.4	15	0
2185	10258	2	15.2	50	0.2
2186	10258	5	17	65	0.2
2187	10258	32	25.6	6	0.2
2188	10259	21	8	10	0
2189	10259	37	20.8	1	0
2190	10260	41	7.7	16	0.25
2191	10260	57	15.6	50	0
2192	10260	62	39.4	15	0.25
2193	10260	70	12	21	0.25
2194	10261	21	8	20	0
2195	10261	35	14.4	20	0
2196	10262	5	17	12	0.2
2197	10262	7	24	15	0
2198	10262	56	30.4	2	0
2199	10263	16	13.9	60	0.25
2200	10263	24	3.6	28	0
2201	10263	30	20.7	60	0.25
2202	10263	74	8	36	0.25
2203	10264	2	15.2	35	0
2204	10264	41	7.7	25	0.15
2205	10265	17	31.2	30	0
2206	10265	70	12	20	0
2207	10266	12	30.4	12	0.05
2208	10267	40	14.7	50	0
2209	10267	59	44	70	0.15
2210	10267	76	14.4	15	0.15
2211	10268	29	99	10	0
2212	10268	72	27.8	4	0
2213	10269	33	2	60	0.05
2214	10269	72	27.8	20	0.05
2215	10270	36	15.2	30	0
2216	10270	43	36.8	25	0
2217	10271	33	2	24	0
2218	10272	20	64.8	6	0
2219	10272	31	10	40	0
2220	10272	72	27.8	24	0
2221	10273	10	24.8	24	0.05
2222	10273	31	10	15	0.05
2223	10273	33	2	20	0
2224	10273	40	14.7	60	0.05
2225	10273	76	14.4	33	0.05
2226	10274	71	17.2	20	0
2227	10274	72	27.8	7	0
2228	10275	24	3.6	12	0.05
2229	10275	59	44	6	0.05
2230	10276	10	24.8	15	0
2231	10276	13	4.8	10	0
2232	10277	28	36.4	20	0
2233	10277	62	39.4	12	0
2234	10278	44	15.5	16	0
2235	10278	59	44	15	0
2236	10278	63	35.1	8	0
2237	10278	73	12	25	0
2238	10279	17	31.2	15	0.25
2239	10280	24	3.6	12	0
2240	10280	55	19.2	20	0
2241	10280	75	6.2	30	0
2242	10281	19	7.3	1	0
2243	10281	24	3.6	6	0
2244	10281	35	14.4	4	0
2245	10282	30	20.7	6	0
2246	10282	57	15.6	2	0
2247	10283	15	12.4	20	0
2248	10283	19	7.3	18	0
2249	10283	60	27.2	35	0
2250	10283	72	27.8	3	0
2251	10284	27	35.1	15	0.25
2252	10284	44	15.5	21	0
2253	10284	60	27.2	20	0.25
2254	10284	67	11.2	5	0.25
2255	10285	1	14.4	45	0.2
2256	10285	40	14.7	40	0.2
2257	10285	53	26.2	36	0.2
2258	10286	35	14.4	100	0
2259	10286	62	39.4	40	0
2260	10287	16	13.9	40	0.15
2261	10287	34	11.2	20	0
2262	10287	46	9.6	15	0.15
2263	10288	54	5.9	10	0.1
2264	10288	68	10	3	0.1
2265	10289	3	8	30	0
2266	10289	64	26.6	9	0
2267	10290	5	17	20	0
2268	10290	29	99	15	0
2269	10290	49	16	15	0
2270	10290	77	10.4	10	0
2271	10291	13	4.8	20	0.1
2272	10291	44	15.5	24	0.1
2273	10291	51	42.4	2	0.1
2274	10292	20	64.8	20	0
2275	10293	18	50	12	0
2276	10293	24	3.6	10	0
2277	10293	63	35.1	5	0
2278	10293	75	6.2	6	0
2279	10294	1	14.4	18	0
2280	10294	17	31.2	15	0
2281	10294	43	36.8	15	0
2282	10294	60	27.2	21	0
2283	10294	75	6.2	6	0
2284	10295	56	30.4	4	0
2285	10296	11	16.8	12	0
2286	10296	16	13.9	30	0
2287	10296	69	28.8	15	0
2288	10297	39	14.4	60	0
2289	10297	72	27.8	20	0
2290	10298	2	15.2	40	0
2291	10298	36	15.2	40	0.25
2292	10298	59	44	30	0.25
2293	10298	62	39.4	15	0
2294	10299	19	7.3	15	0
2295	10299	70	12	20	0
2296	10300	66	13.6	30	0
2297	10300	68	10	20	0
2298	10301	40	14.7	10	0
2299	10301	56	30.4	20	0
2300	10302	17	31.2	40	0
2301	10302	28	36.4	28	0
2302	10302	43	36.8	12	0
2303	10303	40	14.7	40	0.1
2304	10303	65	16.8	30	0.1
2305	10303	68	10	15	0.1
2306	10304	49	16	30	0
2307	10304	59	44	10	0
2308	10304	71	17.2	2	0
2309	10305	18	50	25	0.1
2310	10305	29	99	25	0.1
2311	10305	39	14.4	30	0.1
2312	10306	30	20.7	10	0
2313	10306	53	26.2	10	0
2314	10306	54	5.9	5	0
2315	10307	62	39.4	10	0
2316	10307	68	10	3	0
2317	10308	69	28.8	1	0
2318	10308	70	12	5	0
2319	10309	4	17.6	20	0
2320	10309	6	20	30	0
2321	10309	42	11.2	2	0
2322	10309	43	36.8	20	0
2323	10309	71	17.2	3	0
2324	10310	16	13.9	10	0
2325	10310	62	39.4	5	0
2326	10311	42	11.2	6	0
2327	10311	69	28.8	7	0
2328	10312	28	36.4	4	0
2329	10312	43	36.8	24	0
2330	10312	53	26.2	20	0
2331	10312	75	6.2	10	0
2332	10313	36	15.2	12	0
2333	10314	32	25.6	40	0.1
2334	10314	58	10.6	30	0.1
2335	10314	62	39.4	25	0.1
2336	10315	34	11.2	14	0
2337	10315	70	12	30	0
2338	10316	41	7.7	10	0
2339	10316	62	39.4	70	0
2340	10317	1	14.4	20	0
2341	10318	41	7.7	20	0
2342	10318	76	14.4	6	0
2343	10319	17	31.2	8	0
2344	10319	28	36.4	14	0
2345	10319	76	14.4	30	0
2346	10320	71	17.2	30	0
2347	10321	35	14.4	10	0
2348	10322	52	5.6	20	0
2349	10323	15	12.4	5	0
2350	10323	25	11.2	4	0
2351	10323	39	14.4	4	0
2352	10324	16	13.9	21	0.15
2353	10324	35	14.4	70	0.15
2354	10324	46	9.6	30	0
2355	10324	59	44	40	0.15
2356	10324	63	35.1	80	0.15
2357	10325	6	20	6	0
2358	10325	13	4.8	12	0
2359	10325	14	18.6	9	0
2360	10325	31	10	4	0
2361	10325	72	27.8	40	0
2362	10326	4	17.6	24	0
2363	10326	57	15.6	16	0
2364	10326	75	6.2	50	0
2365	10327	2	15.2	25	0.2
2366	10327	11	16.8	50	0.2
2367	10327	30	20.7	35	0.2
2368	10327	58	10.6	30	0.2
2369	10328	59	44	9	0
2370	10328	65	16.8	40	0
2371	10328	68	10	10	0
2372	10329	19	7.3	10	0.05
2373	10329	30	20.7	8	0.05
2374	10329	38	210.8	20	0.05
2375	10329	56	30.4	12	0.05
2376	10330	26	24.9	50	0.15
2377	10330	72	27.8	25	0.15
2378	10331	54	5.9	15	0
2379	10332	18	50	40	0.2
2380	10332	42	11.2	10	0.2
2381	10332	47	7.6	16	0.2
2382	10333	14	18.6	10	0
2383	10333	21	8	10	0.1
2384	10333	71	17.2	40	0.1
2385	10334	52	5.6	8	0
2386	10334	68	10	10	0
2387	10335	2	15.2	7	0.2
2388	10335	31	10	25	0.2
2389	10335	32	25.6	6	0.2
2390	10335	51	42.4	48	0.2
2391	10336	4	17.6	18	0.1
2392	10337	23	7.2	40	0
2393	10337	26	24.9	24	0
2394	10337	36	15.2	20	0
2395	10337	37	20.8	28	0
2396	10337	72	27.8	25	0
2397	10338	17	31.2	20	0
2398	10338	30	20.7	15	0
2399	10339	4	17.6	10	0
2400	10339	17	31.2	70	0.05
2401	10339	62	39.4	28	0
2402	10340	18	50	20	0.05
2403	10340	41	7.7	12	0.05
2404	10340	43	36.8	40	0.05
2405	10341	33	2	8	0
2406	10341	59	44	9	0.15
2407	10342	2	15.2	24	0.2
2408	10342	31	10	56	0.2
2409	10342	36	15.2	40	0.2
2410	10342	55	19.2	40	0.2
2411	10343	64	26.6	50	0
2412	10343	68	10	4	0.05
2413	10343	76	14.4	15	0
2414	10344	4	17.6	35	0
2415	10344	8	32	70	0.25
2416	10345	8	32	70	0
2417	10345	19	7.3	80	0
2418	10345	42	11.2	9	0
2419	10346	17	31.2	36	0.1
2420	10346	56	30.4	20	0
2421	10347	25	11.2	10	0
2422	10347	39	14.4	50	0.15
2423	10347	40	14.7	4	0
2424	10347	75	6.2	6	0.15
2425	10348	1	14.4	15	0.15
2426	10348	23	7.2	25	0
2427	10349	54	5.9	24	0
2428	10350	50	13	15	0.1
2429	10350	69	28.8	18	0.1
2430	10351	38	210.8	20	0.05
2431	10351	41	7.7	13	0
2432	10351	44	15.5	77	0.05
2433	10351	65	16.8	10	0.05
2434	10352	24	3.6	10	0
2435	10352	54	5.9	20	0.15
2436	10353	11	16.8	12	0.2
2437	10353	38	210.8	50	0.2
2438	10354	1	14.4	12	0
2439	10354	29	99	4	0
2440	10355	24	3.6	25	0
2441	10355	57	15.6	25	0
2442	10356	31	10	30	0
2443	10356	55	19.2	12	0
2444	10356	69	28.8	20	0
2445	10357	10	24.8	30	0.2
2446	10357	26	24.9	16	0
2447	10357	60	27.2	8	0.2
2448	10358	24	3.6	10	0.05
2449	10358	34	11.2	10	0.05
2450	10358	36	15.2	20	0.05
2451	10359	16	13.9	56	0.05
2452	10359	31	10	70	0.05
2453	10359	60	27.2	80	0.05
2454	10360	28	36.4	30	0
2455	10360	29	99	35	0
2456	10360	38	210.8	10	0
2457	10360	49	16	35	0
2458	10360	54	5.9	28	0
2459	10361	39	14.4	54	0.1
2460	10361	60	27.2	55	0.1
2461	10362	25	11.2	50	0
2462	10362	51	42.4	20	0
2463	10362	54	5.9	24	0
2464	10363	31	10	20	0
2465	10363	75	6.2	12	0
2466	10363	76	14.4	12	0
2467	10364	69	28.8	30	0
2468	10364	71	17.2	5	0
2469	10365	11	16.8	24	0
2470	10366	65	16.8	5	0
2471	10366	77	10.4	5	0
2472	10367	34	11.2	36	0
2473	10367	54	5.9	18	0
2474	10367	65	16.8	15	0
2475	10367	77	10.4	7	0
2476	10368	21	8	5	0.1
2477	10368	28	36.4	13	0.1
2478	10368	57	15.6	25	0
2479	10368	64	26.6	35	0.1
2480	10369	29	99	20	0
2481	10369	56	30.4	18	0.25
2482	10370	1	14.4	15	0.15
2483	10370	64	26.6	30	0
2484	10370	74	8	20	0.15
2485	10371	36	15.2	6	0.2
2486	10372	20	64.8	12	0.25
2487	10372	38	210.8	40	0.25
2488	10372	60	27.2	70	0.25
2489	10372	72	27.8	42	0.25
2490	10373	58	10.6	80	0.2
2491	10373	71	17.2	50	0.2
2492	10374	31	10	30	0
2493	10374	58	10.6	15	0
2494	10375	14	18.6	15	0
2495	10375	54	5.9	10	0
2496	10376	31	10	42	0.05
2497	10377	28	36.4	20	0.15
2498	10377	39	14.4	20	0.15
2499	10378	71	17.2	6	0
2500	10379	41	7.7	8	0.1
2501	10379	63	35.1	16	0.1
2502	10379	65	16.8	20	0.1
2503	10380	30	20.7	18	0.1
2504	10380	53	26.2	20	0.1
2505	10380	60	27.2	6	0.1
2506	10380	70	12	30	0
2507	10381	74	8	14	0
2508	10382	5	17	32	0
2509	10382	18	50	9	0
2510	10382	29	99	14	0
2511	10382	33	2	60	0
2512	10382	74	8	50	0
2513	10383	13	4.8	20	0
2514	10383	50	13	15	0
2515	10383	56	30.4	20	0
2516	10384	20	64.8	28	0
2517	10384	60	27.2	15	0
2518	10385	7	24	10	0.2
2519	10385	60	27.2	20	0.2
2520	10385	68	10	8	0.2
2521	10386	24	3.6	15	0
2522	10386	34	11.2	10	0
2523	10387	24	3.6	15	0
2524	10387	28	36.4	6	0
2525	10387	59	44	12	0
2526	10387	71	17.2	15	0
2527	10388	45	7.6	15	0.2
2528	10388	52	5.6	20	0.2
2529	10388	53	26.2	40	0
2530	10389	10	24.8	16	0
2531	10389	55	19.2	15	0
2532	10389	62	39.4	20	0
2533	10389	70	12	30	0
2534	10390	31	10	60	0.1
2535	10390	35	14.4	40	0.1
2536	10390	46	9.6	45	0
2537	10390	72	27.8	24	0.1
2538	10391	13	4.8	18	0
2539	10392	69	28.8	50	0
2540	10393	2	15.2	25	0.25
2541	10393	14	18.6	42	0.25
2542	10393	25	11.2	7	0.25
2543	10393	26	24.9	70	0.25
2544	10393	31	10	32	0
2545	10394	13	4.8	10	0
2546	10394	62	39.4	10	0
2547	10395	46	9.6	28	0.1
2548	10395	53	26.2	70	0.1
2549	10395	69	28.8	8	0
2550	10396	23	7.2	40	0
2551	10396	71	17.2	60	0
2552	10396	72	27.8	21	0
2553	10397	21	8	10	0.15
2554	10397	51	42.4	18	0.15
2555	10398	35	14.4	30	0
2556	10398	55	19.2	120	0.1
2557	10399	68	10	60	0
2558	10399	71	17.2	30	0
2559	10399	76	14.4	35	0
2560	10399	77	10.4	14	0
2561	10400	29	99	21	0
2562	10400	35	14.4	35	0
2563	10400	49	16	30	0
2564	10401	30	20.7	18	0
2565	10401	56	30.4	70	0
2566	10401	65	16.8	20	0
2567	10401	71	17.2	60	0
2568	10402	23	7.2	60	0
2569	10402	63	35.1	65	0
2570	10403	16	13.9	21	0.15
2571	10403	48	10.2	70	0.15
2572	10404	26	24.9	30	0.05
2573	10404	42	11.2	40	0.05
2574	10404	49	16	30	0.05
2575	10405	3	8	50	0
2576	10406	1	14.4	10	0
2577	10406	21	8	30	0.1
2578	10406	28	36.4	42	0.1
2579	10406	36	15.2	5	0.1
2580	10406	40	14.7	2	0.1
2581	10407	11	16.8	30	0
2582	10407	69	28.8	15	0
2583	10407	71	17.2	15	0
2584	10408	37	20.8	10	0
2585	10408	54	5.9	6	0
2586	10408	62	39.4	35	0
2587	10409	14	18.6	12	0
2588	10409	21	8	12	0
2589	10410	33	2	49	0
2590	10410	59	44	16	0
2591	10411	41	7.7	25	0.2
2592	10411	44	15.5	40	0.2
2593	10411	59	44	9	0.2
2594	10412	14	18.6	20	0.1
2595	10413	1	14.4	24	0
2596	10413	62	39.4	40	0
2597	10413	76	14.4	14	0
2598	10414	19	7.3	18	0.05
2599	10414	33	2	50	0
2600	10415	17	31.2	2	0
2601	10415	33	2	20	0
2602	10416	19	7.3	20	0
2603	10416	53	26.2	10	0
2604	10416	57	15.6	20	0
2605	10417	38	210.8	50	0
2606	10417	46	9.6	2	0.25
2607	10417	68	10	36	0.25
2608	10417	77	10.4	35	0
2609	10418	2	15.2	60	0
2610	10418	47	7.6	55	0
2611	10418	61	22.8	16	0
2612	10418	74	8	15	0
2613	10419	60	27.2	60	0.05
2614	10419	69	28.8	20	0.05
2615	10420	9	77.6	20	0.1
2616	10420	13	4.8	2	0.1
2617	10420	70	12	8	0.1
2618	10420	73	12	20	0.1
2619	10421	19	7.3	4	0.15
2620	10421	26	24.9	30	0
2621	10421	53	26.2	15	0.15
2622	10421	77	10.4	10	0.15
2623	10422	26	24.9	2	0
2624	10423	31	10	14	0
2625	10423	59	44	20	0
2626	10424	35	14.4	60	0.2
2627	10424	38	210.8	49	0.2
2628	10424	68	10	30	0.2
2629	10425	55	19.2	10	0.25
2630	10425	76	14.4	20	0.25
2631	10426	56	30.4	5	0
2632	10426	64	26.6	7	0
2633	10427	14	18.6	35	0
2634	10428	46	9.6	20	0
2635	10429	50	13	40	0
2636	10429	63	35.1	35	0.25
2637	10430	17	31.2	45	0.2
2638	10430	21	8	50	0
2639	10430	56	30.4	30	0
2640	10430	59	44	70	0.2
2641	10431	17	31.2	50	0.25
2642	10431	40	14.7	50	0.25
2643	10431	47	7.6	30	0.25
2644	10432	26	24.9	10	0
2645	10432	54	5.9	40	0
2646	10433	56	30.4	28	0
2647	10434	11	16.8	6	0
2648	10434	76	14.4	18	0.15
2649	10435	2	15.2	10	0
2650	10435	22	16.8	12	0
2651	10435	72	27.8	10	0
2652	10436	46	9.6	5	0
2653	10436	56	30.4	40	0.1
2654	10436	64	26.6	30	0.1
2655	10436	75	6.2	24	0.1
2656	10437	53	26.2	15	0
2657	10438	19	7.3	15	0.2
2658	10438	34	11.2	20	0.2
2659	10438	57	15.6	15	0.2
2660	10439	12	30.4	15	0
2661	10439	16	13.9	16	0
2662	10439	64	26.6	6	0
2663	10439	74	8	30	0
2664	10440	2	15.2	45	0.15
2665	10440	16	13.9	49	0.15
2666	10440	29	99	24	0.15
2667	10440	61	22.8	90	0.15
2668	10441	27	35.1	50	0
2669	10442	11	16.8	30	0
2670	10442	54	5.9	80	0
2671	10442	66	13.6	60	0
2672	10443	11	16.8	6	0.2
2673	10443	28	36.4	12	0
2674	10444	17	31.2	10	0
2675	10444	26	24.9	15	0
2676	10444	35	14.4	8	0
2677	10444	41	7.7	30	0
2678	10445	39	14.4	6	0
2679	10445	54	5.9	15	0
2680	10446	19	7.3	12	0.1
2681	10446	24	3.6	20	0.1
2682	10446	31	10	3	0.1
2683	10446	52	5.6	15	0.1
2684	10447	19	7.3	40	0
2685	10447	65	16.8	35	0
2686	10447	71	17.2	2	0
2687	10448	26	24.9	6	0
2688	10448	40	14.7	20	0
2689	10449	10	24.8	14	0
2690	10449	52	5.6	20	0
2691	10449	62	39.4	35	0
2692	10450	10	24.8	20	0.2
2693	10450	54	5.9	6	0.2
2694	10451	55	19.2	120	0.1
2695	10451	64	26.6	35	0.1
2696	10451	65	16.8	28	0.1
2697	10451	77	10.4	55	0.1
2698	10452	28	36.4	15	0
2699	10452	44	15.5	100	0.05
2700	10453	48	10.2	15	0.1
2701	10453	70	12	25	0.1
2702	10454	16	13.9	20	0.2
2703	10454	33	2	20	0.2
2704	10454	46	9.6	10	0.2
2705	10455	39	14.4	20	0
2706	10455	53	26.2	50	0
2707	10455	61	22.8	25	0
2708	10455	71	17.2	30	0
2709	10456	21	8	40	0.15
2710	10456	49	16	21	0.15
2711	10457	59	44	36	0
2712	10458	26	24.9	30	0
2713	10458	28	36.4	30	0
2714	10458	43	36.8	20	0
2715	10458	56	30.4	15	0
2716	10458	71	17.2	50	0
2717	10459	7	24	16	0.05
2718	10459	46	9.6	20	0.05
2719	10459	72	27.8	40	0
2720	10460	68	10	21	0.25
2721	10460	75	6.2	4	0.25
2722	10461	21	8	40	0.25
2723	10461	30	20.7	28	0.25
2724	10461	55	19.2	60	0.25
2725	10462	13	4.8	1	0
2726	10462	23	7.2	21	0
2727	10463	19	7.3	21	0
2728	10463	42	11.2	50	0
2729	10464	4	17.6	16	0.2
2730	10464	43	36.8	3	0
2731	10464	56	30.4	30	0.2
2732	10464	60	27.2	20	0
2733	10465	24	3.6	25	0
2734	10465	29	99	18	0.1
2735	10465	40	14.7	20	0
2736	10465	45	7.6	30	0.1
2737	10465	50	13	25	0
2738	10466	11	16.8	10	0
2739	10466	46	9.6	5	0
2740	10467	24	3.6	28	0
2741	10467	25	11.2	12	0
2742	10468	30	20.7	8	0
2743	10468	43	36.8	15	0
2744	10469	2	15.2	40	0.15
2745	10469	16	13.9	35	0.15
2746	10469	44	15.5	2	0.15
2747	10470	18	50	30	0
2748	10470	23	7.2	15	0
2749	10470	64	26.6	8	0
2750	10471	7	24	30	0
2751	10471	56	30.4	20	0
2752	10472	24	3.6	80	0.05
2753	10472	51	42.4	18	0
2754	10473	33	2	12	0
2755	10473	71	17.2	12	0
2756	10474	14	18.6	12	0
2757	10474	28	36.4	18	0
2758	10474	40	14.7	21	0
2759	10474	75	6.2	10	0
2760	10475	31	10	35	0.15
2761	10475	66	13.6	60	0.15
2762	10475	76	14.4	42	0.15
2763	10476	55	19.2	2	0.05
2764	10476	70	12	12	0
2765	10477	1	14.4	15	0
2766	10477	21	8	21	0.25
2767	10477	39	14.4	20	0.25
2768	10478	10	24.8	20	0.05
2769	10479	38	210.8	30	0
2770	10479	53	26.2	28	0
2771	10479	59	44	60	0
2772	10479	64	26.6	30	0
2773	10480	47	7.6	30	0
2774	10480	59	44	12	0
2775	10481	49	16	24	0
2776	10481	60	27.2	40	0
2777	10482	40	14.7	10	0
2778	10483	34	11.2	35	0.05
2779	10483	77	10.4	30	0.05
2780	10484	21	8	14	0
2781	10484	40	14.7	10	0
2782	10484	51	42.4	3	0
2783	10485	2	15.2	20	0.1
2784	10485	3	8	20	0.1
2785	10485	55	19.2	30	0.1
2786	10485	70	12	60	0.1
2787	10486	11	16.8	5	0
2788	10486	51	42.4	25	0
2789	10486	74	8	16	0
2790	10487	19	7.3	5	0
2791	10487	26	24.9	30	0
2792	10487	54	5.9	24	0.25
2793	10488	59	44	30	0
2794	10488	73	12	20	0.2
2795	10489	11	16.8	15	0.25
2796	10489	16	13.9	18	0
2797	10490	59	44	60	0
2798	10490	68	10	30	0
2799	10490	75	6.2	36	0
2800	10491	44	15.5	15	0.15
2801	10491	77	10.4	7	0.15
2802	10492	25	11.2	60	0.05
2803	10492	42	11.2	20	0.05
2804	10493	65	16.8	15	0.1
2805	10493	66	13.6	10	0.1
2806	10493	69	28.8	10	0.1
2807	10494	56	30.4	30	0
2808	10495	23	7.2	10	0
2809	10495	41	7.7	20	0
2810	10495	77	10.4	5	0
2811	10496	31	10	20	0.05
2812	10497	56	30.4	14	0
2813	10497	72	27.8	25	0
2814	10497	77	10.4	25	0
2815	10498	24	4.5	14	0
2816	10498	40	18.4	5	0
2817	10498	42	14	30	0
2818	10499	28	45.6	20	0
2819	10499	49	20	25	0
2820	10500	15	15.5	12	0.05
2821	10500	28	45.6	8	0.05
2822	10501	54	7.45	20	0
2823	10502	45	9.5	21	0
2824	10502	53	32.8	6	0
2825	10502	67	14	30	0
2826	10503	14	23.25	70	0
2827	10503	65	21.05	20	0
2828	10504	2	19	12	0
2829	10504	21	10	12	0
2830	10504	53	32.8	10	0
2831	10504	61	28.5	25	0
2832	10505	62	49.3	3	0
2833	10506	25	14	18	0.1
2834	10506	70	15	14	0.1
2835	10507	43	46	15	0.15
2836	10507	48	12.75	15	0.15
2837	10508	13	6	10	0
2838	10508	39	18	10	0
2839	10509	28	45.6	3	0
2840	10510	29	123.79	36	0
2841	10510	75	7.75	36	0.1
2842	10511	4	22	50	0.15
2843	10511	7	30	50	0.15
2844	10511	8	40	10	0.15
2845	10512	24	4.5	10	0.15
2846	10512	46	12	9	0.15
2847	10512	47	9.5	6	0.15
2848	10512	60	34	12	0.15
2849	10513	21	10	40	0.2
2850	10513	32	32	50	0.2
2851	10513	61	28.5	15	0.2
2852	10514	20	81	39	0
2853	10514	28	45.6	35	0
2854	10514	56	38	70	0
2855	10514	65	21.05	39	0
2856	10514	75	7.75	50	0
2857	10515	9	97	16	0.15
2858	10515	16	17.45	50	0
2859	10515	27	43.9	120	0
2860	10515	33	2.5	16	0.15
2861	10515	60	34	84	0.15
2862	10516	18	62.5	25	0.1
2863	10516	41	9.65	80	0.1
2864	10516	42	14	20	0
2865	10517	52	7	6	0
2866	10517	59	55	4	0
2867	10517	70	15	6	0
2868	10518	24	4.5	5	0
2869	10518	38	263.5	15	0
2870	10518	44	19.45	9	0
2871	10519	10	31	16	0.05
2872	10519	56	38	40	0
2873	10519	60	34	10	0.05
2874	10520	24	4.5	8	0
2875	10520	53	32.8	5	0
2876	10521	35	18	3	0
2877	10521	41	9.65	10	0
2878	10521	68	12.5	6	0
2879	10522	1	18	40	0.2
2880	10522	8	40	24	0
2881	10522	30	25.89	20	0.2
2882	10522	40	18.4	25	0.2
2883	10523	17	39	25	0.1
2884	10523	20	81	15	0.1
2885	10523	37	26	18	0.1
2886	10523	41	9.65	6	0.1
2887	10524	10	31	2	0
2888	10524	30	25.89	10	0
2889	10524	43	46	60	0
2890	10524	54	7.45	15	0
2891	10525	36	19	30	0
2892	10525	40	18.4	15	0.1
2893	10526	1	18	8	0.15
2894	10526	13	6	10	0
2895	10526	56	38	30	0.15
2896	10527	4	22	50	0.1
2897	10527	36	19	30	0.1
2898	10528	11	21	3	0
2899	10528	33	2.5	8	0.2
2900	10528	72	34.8	9	0
2901	10529	55	24	14	0
2902	10529	68	12.5	20	0
2903	10529	69	36	10	0
2904	10530	17	39	40	0
2905	10530	43	46	25	0
2906	10530	61	28.5	20	0
2907	10530	76	18	50	0
2908	10531	59	55	2	0
2909	10532	30	25.89	15	0
2910	10532	66	17	24	0
2911	10533	4	22	50	0.05
2912	10533	72	34.8	24	0
2913	10533	73	15	24	0.05
2914	10534	30	25.89	10	0
2915	10534	40	18.4	10	0.2
2916	10534	54	7.45	10	0.2
2917	10535	11	21	50	0.1
2918	10535	40	18.4	10	0.1
2919	10535	57	19.5	5	0.1
2920	10535	59	55	15	0.1
2921	10536	12	38	15	0.25
2922	10536	31	12.5	20	0
2923	10536	33	2.5	30	0
2924	10536	60	34	35	0.25
2925	10537	31	12.5	30	0
2926	10537	51	53	6	0
2927	10537	58	13.25	20	0
2928	10537	72	34.8	21	0
2929	10537	73	15	9	0
2930	10538	70	15	7	0
2931	10538	72	34.8	1	0
2932	10539	13	6	8	0
2933	10539	21	10	15	0
2934	10539	33	2.5	15	0
2935	10539	49	20	6	0
2936	10540	3	10	60	0
2937	10540	26	31.23	40	0
2938	10540	38	263.5	30	0
2939	10540	68	12.5	35	0
2940	10541	24	4.5	35	0.1
2941	10541	38	263.5	4	0.1
2942	10541	65	21.05	36	0.1
2943	10541	71	21.5	9	0.1
2944	10542	11	21	15	0.05
2945	10542	54	7.45	24	0.05
2946	10543	12	38	30	0.15
2947	10543	23	9	70	0.15
2948	10544	28	45.6	7	0
2949	10544	67	14	7	0
2950	10545	11	21	10	0
2951	10546	7	30	10	0
2952	10546	35	18	30	0
2953	10546	62	49.3	40	0
2954	10547	32	32	24	0.15
2955	10547	36	19	60	0
2956	10548	34	14	10	0.25
2957	10548	41	9.65	14	0
2958	10549	31	12.5	55	0.15
2959	10549	45	9.5	100	0.15
2960	10549	51	53	48	0.15
2961	10550	17	39	8	0.1
2962	10550	19	9.2	10	0
2963	10550	21	10	6	0.1
2964	10550	61	28.5	10	0.1
2965	10551	16	17.45	40	0.15
2966	10551	35	18	20	0.15
2967	10551	44	19.45	40	0
2968	10552	69	36	18	0
2969	10552	75	7.75	30	0
2970	10553	11	21	15	0
2971	10553	16	17.45	14	0
2972	10553	22	21	24	0
2973	10553	31	12.5	30	0
2974	10553	35	18	6	0
2975	10554	16	17.45	30	0.05
2976	10554	23	9	20	0.05
2977	10554	62	49.3	20	0.05
2978	10554	77	13	10	0.05
2979	10555	14	23.25	30	0.2
2980	10555	19	9.2	35	0.2
2981	10555	24	4.5	18	0.2
2982	10555	51	53	20	0.2
2983	10555	56	38	40	0.2
2984	10556	72	34.8	24	0
2985	10557	64	33.25	30	0
2986	10557	75	7.75	20	0
2987	10558	47	9.5	25	0
2988	10558	51	53	20	0
2989	10558	52	7	30	0
2990	10558	53	32.8	18	0
2991	10558	73	15	3	0
2992	10559	41	9.65	12	0.05
2993	10559	55	24	18	0.05
2994	10560	30	25.89	20	0
2995	10560	62	49.3	15	0.25
2996	10561	44	19.45	10	0
2997	10561	51	53	50	0
2998	10562	33	2.5	20	0.1
2999	10562	62	49.3	10	0.1
3000	10563	36	19	25	0
3001	10563	52	7	70	0
3002	10564	17	39	16	0.05
3003	10564	31	12.5	6	0.05
3004	10564	55	24	25	0.05
3005	10565	24	4.5	25	0.1
3006	10565	64	33.25	18	0.1
3007	10566	11	21	35	0.15
3008	10566	18	62.5	18	0.15
3009	10566	76	18	10	0
3010	10567	31	12.5	60	0.2
3011	10567	51	53	3	0
3012	10567	59	55	40	0.2
3013	10568	10	31	5	0
3014	10569	31	12.5	35	0.2
3015	10569	76	18	30	0
3016	10570	11	21	15	0.05
3017	10570	56	38	60	0.05
3018	10571	14	23.25	11	0.15
3019	10571	42	14	28	0.15
3020	10572	16	17.45	12	0.1
3021	10572	32	32	10	0.1
3022	10572	40	18.4	50	0
3023	10572	75	7.75	15	0.1
3024	10573	17	39	18	0
3025	10573	34	14	40	0
3026	10573	53	32.8	25	0
3027	10574	33	2.5	14	0
3028	10574	40	18.4	2	0
3029	10574	62	49.3	10	0
3030	10574	64	33.25	6	0
3031	10575	59	55	12	0
3032	10575	63	43.9	6	0
3033	10575	72	34.8	30	0
3034	10575	76	18	10	0
3035	10576	1	18	10	0
3036	10576	31	12.5	20	0
3037	10576	44	19.45	21	0
3038	10577	39	18	10	0
3039	10577	75	7.75	20	0
3040	10577	77	13	18	0
3041	10578	35	18	20	0
3042	10578	57	19.5	6	0
3043	10579	15	15.5	10	0
3044	10579	75	7.75	21	0
3045	10580	14	23.25	15	0.05
3046	10580	41	9.65	9	0.05
3047	10580	65	21.05	30	0.05
3048	10581	75	7.75	50	0.2
3049	10582	57	19.5	4	0
3050	10582	76	18	14	0
3051	10583	29	123.79	10	0
3052	10583	60	34	24	0.15
3053	10583	69	36	10	0.15
3054	10584	31	12.5	50	0.05
3055	10585	47	9.5	15	0
3056	10586	52	7	4	0.15
3057	10587	26	31.23	6	0
3058	10587	35	18	20	0
3059	10587	77	13	20	0
3060	10588	18	62.5	40	0.2
3061	10588	42	14	100	0.2
3062	10589	35	18	4	0
3063	10590	1	18	20	0
3064	10590	77	13	60	0.05
3065	10591	3	10	14	0
3066	10591	7	30	10	0
3067	10591	54	7.45	50	0
3068	10592	15	15.5	25	0.05
3069	10592	26	31.23	5	0.05
3070	10593	20	81	21	0.2
3071	10593	69	36	20	0.2
3072	10593	76	18	4	0.2
3073	10594	52	7	24	0
3074	10594	58	13.25	30	0
3075	10595	35	18	30	0.25
3076	10595	61	28.5	120	0.25
3077	10595	69	36	65	0.25
3078	10596	56	38	5	0.2
3079	10596	63	43.9	24	0.2
3080	10596	75	7.75	30	0.2
3081	10597	24	4.5	35	0.2
3082	10597	57	19.5	20	0
3083	10597	65	21.05	12	0.2
3084	10598	27	43.9	50	0
3085	10598	71	21.5	9	0
3086	10599	62	49.3	10	0
3087	10600	54	7.45	4	0
3088	10600	73	15	30	0
3089	10601	13	6	60	0
3090	10601	59	55	35	0
3091	10602	77	13	5	0.25
3092	10603	22	21	48	0
3093	10603	49	20	25	0.05
3094	10604	48	12.75	6	0.1
3095	10604	76	18	10	0.1
3096	10605	16	17.45	30	0.05
3097	10605	59	55	20	0.05
3098	10605	60	34	70	0.05
3099	10605	71	21.5	15	0.05
3100	10606	4	22	20	0.2
3101	10606	55	24	20	0.2
3102	10606	62	49.3	10	0.2
3103	10607	7	30	45	0
3104	10607	17	39	100	0
3105	10607	33	2.5	14	0
3106	10607	40	18.4	42	0
3107	10607	72	34.8	12	0
3108	10608	56	38	28	0
3109	10609	1	18	3	0
3110	10609	10	31	10	0
3111	10609	21	10	6	0
3112	10610	36	19	21	0.25
3113	10611	1	18	6	0
3114	10611	2	19	10	0
3115	10611	60	34	15	0
3116	10612	10	31	70	0
3117	10612	36	19	55	0
3118	10612	49	20	18	0
3119	10612	60	34	40	0
3120	10612	76	18	80	0
3121	10613	13	6	8	0.1
3122	10613	75	7.75	40	0
3123	10614	11	21	14	0
3124	10614	21	10	8	0
3125	10614	39	18	5	0
3126	10615	55	24	5	0
3127	10616	38	263.5	15	0.05
3128	10616	56	38	14	0
3129	10616	70	15	15	0.05
3130	10616	71	21.5	15	0.05
3131	10617	59	55	30	0.15
3132	10618	6	25	70	0
3133	10618	56	38	20	0
3134	10618	68	12.5	15	0
3135	10619	21	10	42	0
3136	10619	22	21	40	0
3137	10620	24	4.5	5	0
3138	10620	52	7	5	0
3139	10621	19	9.2	5	0
3140	10621	23	9	10	0
3141	10621	70	15	20	0
3142	10621	71	21.5	15	0
3143	10622	2	19	20	0
3144	10622	68	12.5	18	0.2
3145	10623	14	23.25	21	0
3146	10623	19	9.2	15	0.1
3147	10623	21	10	25	0.1
3148	10623	24	4.5	3	0
3149	10623	35	18	30	0.1
3150	10624	28	45.6	10	0
3151	10624	29	123.79	6	0
3152	10624	44	19.45	10	0
3153	10625	14	23.25	3	0
3154	10625	42	14	5	0
3155	10625	60	34	10	0
3156	10626	53	32.8	12	0
3157	10626	60	34	20	0
3158	10626	71	21.5	20	0
3159	10627	62	49.3	15	0
3160	10627	73	15	35	0.15
3161	10628	1	18	25	0
3162	10629	29	123.79	20	0
3163	10629	64	33.25	9	0
3164	10630	55	24	12	0.05
3165	10630	76	18	35	0
3166	10631	75	7.75	8	0.1
3167	10632	2	19	30	0.05
3168	10632	33	2.5	20	0.05
3169	10633	12	38	36	0.15
3170	10633	13	6	13	0.15
3171	10633	26	31.23	35	0.15
3172	10633	62	49.3	80	0.15
3173	10634	7	30	35	0
3174	10634	18	62.5	50	0
3175	10634	51	53	15	0
3176	10634	75	7.75	2	0
3177	10635	4	22	10	0.1
3178	10635	5	21.35	15	0.1
3179	10635	22	21	40	0
3180	10636	4	22	25	0
3181	10636	58	13.25	6	0
3182	10637	11	21	10	0
3183	10637	50	16.25	25	0.05
3184	10637	56	38	60	0.05
3185	10638	45	9.5	20	0
3186	10638	65	21.05	21	0
3187	10638	72	34.8	60	0
3188	10639	18	62.5	8	0
3189	10640	69	36	20	0.25
3190	10640	70	15	15	0.25
3191	10641	2	19	50	0
3192	10641	40	18.4	60	0
3193	10642	21	10	30	0.2
3194	10642	61	28.5	20	0.2
3195	10643	28	45.6	15	0.25
3196	10643	39	18	21	0.25
3197	10643	46	12	2	0.25
3198	10644	18	62.5	4	0.1
3199	10644	43	46	20	0
3200	10644	46	12	21	0.1
3201	10645	18	62.5	20	0
3202	10645	36	19	15	0
3203	10646	1	18	15	0.25
3204	10646	10	31	18	0.25
3205	10646	71	21.5	30	0.25
3206	10646	77	13	35	0.25
3207	10647	19	9.2	30	0
3208	10647	39	18	20	0
3209	10648	22	21	15	0
3210	10648	24	4.5	15	0.15
3211	10649	28	45.6	20	0
3212	10649	72	34.8	15	0
3213	10650	30	25.89	30	0
3214	10650	53	32.8	25	0.05
3215	10650	54	7.45	30	0
3216	10651	19	9.2	12	0.25
3217	10651	22	21	20	0.25
3218	10652	30	25.89	2	0.25
3219	10652	42	14	20	0
3220	10653	16	17.45	30	0.1
3221	10653	60	34	20	0.1
3222	10654	4	22	12	0.1
3223	10654	39	18	20	0.1
3224	10654	54	7.45	6	0.1
3225	10655	41	9.65	20	0.2
3226	10656	14	23.25	3	0.1
3227	10656	44	19.45	28	0.1
3228	10656	47	9.5	6	0.1
3229	10657	15	15.5	50	0
3230	10657	41	9.65	24	0
3231	10657	46	12	45	0
3232	10657	47	9.5	10	0
3233	10657	56	38	45	0
3234	10657	60	34	30	0
3235	10658	21	10	60	0
3236	10658	40	18.4	70	0.05
3237	10658	60	34	55	0.05
3238	10658	77	13	70	0.05
3239	10659	31	12.5	20	0.05
3240	10659	40	18.4	24	0.05
3241	10659	70	15	40	0.05
3242	10660	20	81	21	0
3243	10661	39	18	3	0.2
3244	10661	58	13.25	49	0.2
3245	10662	68	12.5	10	0
3246	10663	40	18.4	30	0.05
3247	10663	42	14	30	0.05
3248	10663	51	53	20	0.05
3249	10664	10	31	24	0.15
3250	10664	56	38	12	0.15
3251	10664	65	21.05	15	0.15
3252	10665	51	53	20	0
3253	10665	59	55	1	0
3254	10665	76	18	10	0
3255	10666	29	123.79	36	0
3256	10666	65	21.05	10	0
3257	10667	69	36	45	0.2
3258	10667	71	21.5	14	0.2
3259	10668	31	12.5	8	0.1
3260	10668	55	24	4	0.1
3261	10668	64	33.25	15	0.1
3262	10669	36	19	30	0
3263	10670	23	9	32	0
3264	10670	46	12	60	0
3265	10670	67	14	25	0
3266	10670	73	15	50	0
3267	10670	75	7.75	25	0
3268	10671	16	17.45	10	0
3269	10671	62	49.3	10	0
3270	10671	65	21.05	12	0
3271	10672	38	263.5	15	0.1
3272	10672	71	21.5	12	0
3273	10673	16	17.45	3	0
3274	10673	42	14	6	0
3275	10673	43	46	6	0
3276	10674	23	9	5	0
3277	10675	14	23.25	30	0
3278	10675	53	32.8	10	0
3279	10675	58	13.25	30	0
3280	10676	10	31	2	0
3281	10676	19	9.2	7	0
3282	10676	44	19.45	21	0
3283	10677	26	31.23	30	0.15
3284	10677	33	2.5	8	0.15
3285	10678	12	38	100	0
3286	10678	33	2.5	30	0
3287	10678	41	9.65	120	0
3288	10678	54	7.45	30	0
3289	10679	59	55	12	0
3290	10680	16	17.45	50	0.25
3291	10680	31	12.5	20	0.25
3292	10680	42	14	40	0.25
3293	10681	19	9.2	30	0.1
3294	10681	21	10	12	0.1
3295	10681	64	33.25	28	0
3296	10682	33	2.5	30	0
3297	10682	66	17	4	0
3298	10682	75	7.75	30	0
3299	10683	52	7	9	0
3300	10684	40	18.4	20	0
3301	10684	47	9.5	40	0
3302	10684	60	34	30	0
3303	10685	10	31	20	0
3304	10685	41	9.65	4	0
3305	10685	47	9.5	15	0
3306	10686	17	39	30	0.2
3307	10686	26	31.23	15	0
3308	10687	9	97	50	0.25
3309	10687	29	123.79	10	0
3310	10687	36	19	6	0.25
3311	10688	10	31	18	0.1
3312	10688	28	45.6	60	0.1
3313	10688	34	14	14	0
3314	10689	1	18	35	0.25
3315	10690	56	38	20	0.25
3316	10690	77	13	30	0.25
3317	10691	1	18	30	0
3318	10691	29	123.79	40	0
3319	10691	43	46	40	0
3320	10691	44	19.45	24	0
3321	10691	62	49.3	48	0
3322	10692	63	43.9	20	0
3323	10693	9	97	6	0
3324	10693	54	7.45	60	0.15
3325	10693	69	36	30	0.15
3326	10693	73	15	15	0.15
3327	10694	7	30	90	0
3328	10694	59	55	25	0
3329	10694	70	15	50	0
3330	10695	8	40	10	0
3331	10695	12	38	4	0
3332	10695	24	4.5	20	0
3333	10696	17	39	20	0
3334	10696	46	12	18	0
3335	10697	19	9.2	7	0.25
3336	10697	35	18	9	0.25
3337	10697	58	13.25	30	0.25
3338	10697	70	15	30	0.25
3339	10698	11	21	15	0
3340	10698	17	39	8	0.05
3341	10698	29	123.79	12	0.05
3342	10698	65	21.05	65	0.05
3343	10698	70	15	8	0.05
3344	10699	47	9.5	12	0
3345	10700	1	18	5	0.2
3346	10700	34	14	12	0.2
3347	10700	68	12.5	40	0.2
3348	10700	71	21.5	60	0.2
3349	10701	59	55	42	0.15
3350	10701	71	21.5	20	0.15
3351	10701	76	18	35	0.15
3352	10702	3	10	6	0
3353	10702	76	18	15	0
3354	10703	2	19	5	0
3355	10703	59	55	35	0
3356	10703	73	15	35	0
3357	10704	4	22	6	0
3358	10704	24	4.5	35	0
3359	10704	48	12.75	24	0
3360	10705	31	12.5	20	0
3361	10705	32	32	4	0
3362	10706	16	17.45	20	0
3363	10706	43	46	24	0
3364	10706	59	55	8	0
3365	10707	55	24	21	0
3366	10707	57	19.5	40	0
3367	10707	70	15	28	0.15
3368	10708	5	21.35	4	0
3369	10708	36	19	5	0
3370	10709	8	40	40	0
3371	10709	51	53	28	0
3372	10709	60	34	10	0
3373	10710	19	9.2	5	0
3374	10710	47	9.5	5	0
3375	10711	19	9.2	12	0
3376	10711	41	9.65	42	0
3377	10711	53	32.8	120	0
3378	10712	53	32.8	3	0.05
3379	10712	56	38	30	0
3380	10713	10	31	18	0
3381	10713	26	31.23	30	0
3382	10713	45	9.5	110	0
3383	10713	46	12	24	0
3384	10714	2	19	30	0.25
3385	10714	17	39	27	0.25
3386	10714	47	9.5	50	0.25
3387	10714	56	38	18	0.25
3388	10714	58	13.25	12	0.25
3389	10715	10	31	21	0
3390	10715	71	21.5	30	0
3391	10716	21	10	5	0
3392	10716	51	53	7	0
3393	10716	61	28.5	10	0
3394	10717	21	10	32	0.05
3395	10717	54	7.45	15	0
3396	10717	69	36	25	0.05
3397	10718	12	38	36	0
3398	10718	16	17.45	20	0
3399	10718	36	19	40	0
3400	10718	62	49.3	20	0
3401	10719	18	62.5	12	0.25
3402	10719	30	25.89	3	0.25
3403	10719	54	7.45	40	0.25
3404	10720	35	18	21	0
3405	10720	71	21.5	8	0
3406	10721	44	19.45	50	0.05
3407	10722	2	19	3	0
3408	10722	31	12.5	50	0
3409	10722	68	12.5	45	0
3410	10722	75	7.75	42	0
3411	10723	26	31.23	15	0
3412	10724	10	31	16	0
3413	10724	61	28.5	5	0
3414	10725	41	9.65	12	0
3415	10725	52	7	4	0
3416	10725	55	24	6	0
3417	10726	4	22	25	0
3418	10726	11	21	5	0
3419	10727	17	39	20	0.05
3420	10727	56	38	10	0.05
3421	10727	59	55	10	0.05
3422	10728	30	25.89	15	0
3423	10728	40	18.4	6	0
3424	10728	55	24	12	0
3425	10728	60	34	15	0
3426	10729	1	18	50	0
3427	10729	21	10	30	0
3428	10729	50	16.25	40	0
3429	10730	16	17.45	15	0.05
3430	10730	31	12.5	3	0.05
3431	10730	65	21.05	10	0.05
3432	10731	21	10	40	0.05
3433	10731	51	53	30	0.05
3434	10732	76	18	20	0
3435	10733	14	23.25	16	0
3436	10733	28	45.6	20	0
3437	10733	52	7	25	0
3438	10734	6	25	30	0
3439	10734	30	25.89	15	0
3440	10734	76	18	20	0
3441	10735	61	28.5	20	0.1
3442	10735	77	13	2	0.1
3443	10736	65	21.05	40	0
3444	10736	75	7.75	20	0
3445	10737	13	6	4	0
3446	10737	41	9.65	12	0
3447	10738	16	17.45	3	0
3448	10739	36	19	6	0
3449	10739	52	7	18	0
3450	10740	28	45.6	5	0.2
3451	10740	35	18	35	0.2
3452	10740	45	9.5	40	0.2
3453	10740	56	38	14	0.2
3454	10741	2	19	15	0.2
3455	10742	3	10	20	0
3456	10742	60	34	50	0
3457	10742	72	34.8	35	0
3458	10743	46	12	28	0.05
3459	10744	40	18.4	50	0.2
3460	10745	18	62.5	24	0
3461	10745	44	19.45	16	0
3462	10745	59	55	45	0
3463	10745	72	34.8	7	0
3464	10746	13	6	6	0
3465	10746	42	14	28	0
3466	10746	62	49.3	9	0
3467	10746	69	36	40	0
3468	10747	31	12.5	8	0
3469	10747	41	9.65	35	0
3470	10747	63	43.9	9	0
3471	10747	69	36	30	0
3472	10748	23	9	44	0
3473	10748	40	18.4	40	0
3474	10748	56	38	28	0
3475	10749	56	38	15	0
3476	10749	59	55	6	0
3477	10749	76	18	10	0
3478	10750	14	23.25	5	0.15
3479	10750	45	9.5	40	0.15
3480	10750	59	55	25	0.15
3481	10751	26	31.23	12	0.1
3482	10751	30	25.89	30	0
3483	10751	50	16.25	20	0.1
3484	10751	73	15	15	0
3485	10752	1	18	8	0
3486	10752	69	36	3	0
3487	10753	45	9.5	4	0
3488	10753	74	10	5	0
3489	10754	40	18.4	3	0
3490	10755	47	9.5	30	0.25
3491	10755	56	38	30	0.25
3492	10755	57	19.5	14	0.25
3493	10755	69	36	25	0.25
3494	10756	18	62.5	21	0.2
3495	10756	36	19	20	0.2
3496	10756	68	12.5	6	0.2
3497	10756	69	36	20	0.2
3498	10757	34	14	30	0
3499	10757	59	55	7	0
3500	10757	62	49.3	30	0
3501	10757	64	33.25	24	0
3502	10758	26	31.23	20	0
3503	10758	52	7	60	0
3504	10758	70	15	40	0
3505	10759	32	32	10	0
3506	10760	25	14	12	0.25
3507	10760	27	43.9	40	0
3508	10760	43	46	30	0.25
3509	10761	25	14	35	0.25
3510	10761	75	7.75	18	0
3511	10762	39	18	16	0
3512	10762	47	9.5	30	0
3513	10762	51	53	28	0
3514	10762	56	38	60	0
3515	10763	21	10	40	0
3516	10763	22	21	6	0
3517	10763	24	4.5	20	0
3518	10764	3	10	20	0.1
3519	10764	39	18	130	0.1
3520	10765	65	21.05	80	0.1
3521	10766	2	19	40	0
3522	10766	7	30	35	0
3523	10766	68	12.5	40	0
3524	10767	42	14	2	0
3525	10768	22	21	4	0
3526	10768	31	12.5	50	0
3527	10768	60	34	15	0
3528	10768	71	21.5	12	0
3529	10769	41	9.65	30	0.05
3530	10769	52	7	15	0.05
3531	10769	61	28.5	20	0
3532	10769	62	49.3	15	0
3533	10770	11	21	15	0.25
3534	10771	71	21.5	16	0
3535	10772	29	123.79	18	0
3536	10772	59	55	25	0
3537	10773	17	39	33	0
3538	10773	31	12.5	70	0.2
3539	10773	75	7.75	7	0.2
3540	10774	31	12.5	2	0.25
3541	10774	66	17	50	0
3542	10775	10	31	6	0
3543	10775	67	14	3	0
3544	10776	31	12.5	16	0.05
3545	10776	42	14	12	0.05
3546	10776	45	9.5	27	0.05
3547	10776	51	53	120	0.05
3548	10777	42	14	20	0.2
3549	10778	41	9.65	10	0
3550	10779	16	17.45	20	0
3551	10779	62	49.3	20	0
3552	10780	70	15	35	0
3553	10780	77	13	15	0
3554	10781	54	7.45	3	0.2
3555	10781	56	38	20	0.2
3556	10781	74	10	35	0
3557	10782	31	12.5	1	0
3558	10783	31	12.5	10	0
3559	10783	38	263.5	5	0
3560	10784	36	19	30	0
3561	10784	39	18	2	0.15
3562	10784	72	34.8	30	0.15
3563	10785	10	31	10	0
3564	10785	75	7.75	10	0
3565	10786	8	40	30	0.2
3566	10786	30	25.89	15	0.2
3567	10786	75	7.75	42	0.2
3568	10787	2	19	15	0.05
3569	10787	29	123.79	20	0.05
3570	10788	19	9.2	50	0.05
3571	10788	75	7.75	40	0.05
3572	10789	18	62.5	30	0
3573	10789	35	18	15	0
3574	10789	63	43.9	30	0
3575	10789	68	12.5	18	0
3576	10790	7	30	3	0.15
3577	10790	56	38	20	0.15
3578	10791	29	123.79	14	0.05
3579	10791	41	9.65	20	0.05
3580	10792	2	19	10	0
3581	10792	54	7.45	3	0
3582	10792	68	12.5	15	0
3583	10793	41	9.65	14	0
3584	10793	52	7	8	0
3585	10794	14	23.25	15	0.2
3586	10794	54	7.45	6	0.2
3587	10795	16	17.45	65	0
3588	10795	17	39	35	0.25
3589	10796	26	31.23	21	0.2
3590	10796	44	19.45	10	0
3591	10796	64	33.25	35	0.2
3592	10796	69	36	24	0.2
3593	10797	11	21	20	0
3594	10798	62	49.3	2	0
3595	10798	72	34.8	10	0
3596	10799	13	6	20	0.15
3597	10799	24	4.5	20	0.15
3598	10799	59	55	25	0
3599	10800	11	21	50	0.1
3600	10800	51	53	10	0.1
3601	10800	54	7.45	7	0.1
3602	10801	17	39	40	0.25
3603	10801	29	123.79	20	0.25
3604	10802	30	25.89	25	0.25
3605	10802	51	53	30	0.25
3606	10802	55	24	60	0.25
3607	10802	62	49.3	5	0.25
3608	10803	19	9.2	24	0.05
3609	10803	25	14	15	0.05
3610	10803	59	55	15	0.05
3611	10804	10	31	36	0
3612	10804	28	45.6	24	0
3613	10804	49	20	4	0.15
3614	10805	34	14	10	0
3615	10805	38	263.5	10	0
3616	10806	2	19	20	0.25
3617	10806	65	21.05	2	0
3618	10806	74	10	15	0.25
3619	10807	40	18.4	1	0
3620	10808	56	38	20	0.15
3621	10808	76	18	50	0.15
3622	10809	52	7	20	0
3623	10810	13	6	7	0
3624	10810	25	14	5	0
3625	10810	70	15	5	0
3626	10811	19	9.2	15	0
3627	10811	23	9	18	0
3628	10811	40	18.4	30	0
3629	10812	31	12.5	16	0.1
3630	10812	72	34.8	40	0.1
3631	10812	77	13	20	0
3632	10813	2	19	12	0.2
3633	10813	46	12	35	0
3634	10814	41	9.65	20	0
3635	10814	43	46	20	0.15
3636	10814	48	12.75	8	0.15
3637	10814	61	28.5	30	0.15
3638	10815	33	2.5	16	0
3639	10816	38	263.5	30	0.05
3640	10816	62	49.3	20	0.05
3641	10817	26	31.23	40	0.15
3642	10817	38	263.5	30	0
3643	10817	40	18.4	60	0.15
3644	10817	62	49.3	25	0.15
3645	10818	32	32	20	0
3646	10818	41	9.65	20	0
3647	10819	43	46	7	0
3648	10819	75	7.75	20	0
3649	10820	56	38	30	0
3650	10821	35	18	20	0
3651	10821	51	53	6	0
3652	10822	62	49.3	3	0
3653	10822	70	15	6	0
3654	10823	11	21	20	0.1
3655	10823	57	19.5	15	0
3656	10823	59	55	40	0.1
3657	10823	77	13	15	0.1
3658	10824	41	9.65	12	0
3659	10824	70	15	9	0
3660	10825	26	31.23	12	0
3661	10825	53	32.8	20	0
3662	10826	31	12.5	35	0
3663	10826	57	19.5	15	0
3664	10827	10	31	15	0
3665	10827	39	18	21	0
3666	10828	20	81	5	0
3667	10828	38	263.5	2	0
3668	10829	2	19	10	0
3669	10829	8	40	20	0
3670	10829	13	6	10	0
3671	10829	60	34	21	0
3672	10830	6	25	6	0
3673	10830	39	18	28	0
3674	10830	60	34	30	0
3675	10830	68	12.5	24	0
3676	10831	19	9.2	2	0
3677	10831	35	18	8	0
3678	10831	38	263.5	8	0
3679	10831	43	46	9	0
3680	10832	13	6	3	0.2
3681	10832	25	14	10	0.2
3682	10832	44	19.45	16	0.2
3683	10832	64	33.25	3	0
3684	10833	7	30	20	0.1
3685	10833	31	12.5	9	0.1
3686	10833	53	32.8	9	0.1
3687	10834	29	123.79	8	0.05
3688	10834	30	25.89	20	0.05
3689	10835	59	55	15	0
3690	10835	77	13	2	0.2
3691	10836	22	21	52	0
3692	10836	35	18	6	0
3693	10836	57	19.5	24	0
3694	10836	60	34	60	0
3695	10836	64	33.25	30	0
3696	10837	13	6	6	0
3697	10837	40	18.4	25	0
3698	10837	47	9.5	40	0.25
3699	10837	76	18	21	0.25
3700	10838	1	18	4	0.25
3701	10838	18	62.5	25	0.25
3702	10838	36	19	50	0.25
3703	10839	58	13.25	30	0.1
3704	10839	72	34.8	15	0.1
3705	10840	25	14	6	0.2
3706	10840	39	18	10	0.2
3707	10841	10	31	16	0
3708	10841	56	38	30	0
3709	10841	59	55	50	0
3710	10841	77	13	15	0
3711	10842	11	21	15	0
3712	10842	43	46	5	0
3713	10842	68	12.5	20	0
3714	10842	70	15	12	0
3715	10843	51	53	4	0.25
3716	10844	22	21	35	0
3717	10845	23	9	70	0.1
3718	10845	35	18	25	0.1
3719	10845	42	14	42	0.1
3720	10845	58	13.25	60	0.1
3721	10845	64	33.25	48	0
3722	10846	4	22	21	0
3723	10846	70	15	30	0
3724	10846	74	10	20	0
3725	10847	1	18	80	0.2
3726	10847	19	9.2	12	0.2
3727	10847	37	26	60	0.2
3728	10847	45	9.5	36	0.2
3729	10847	60	34	45	0.2
3730	10847	71	21.5	55	0.2
3731	10848	5	21.35	30	0
3732	10848	9	97	3	0
3733	10849	3	10	49	0
3734	10849	26	31.23	18	0.15
3735	10850	25	14	20	0.15
3736	10850	33	2.5	4	0.15
3737	10850	70	15	30	0.15
3738	10851	2	19	5	0.05
3739	10851	25	14	10	0.05
3740	10851	57	19.5	10	0.05
3741	10851	59	55	42	0.05
3742	10852	2	19	15	0
3743	10852	17	39	6	0
3744	10852	62	49.3	50	0
3745	10853	18	62.5	10	0
3746	10854	10	31	100	0.15
3747	10854	13	6	65	0.15
3748	10855	16	17.45	50	0
3749	10855	31	12.5	14	0
3750	10855	56	38	24	0
3751	10855	65	21.05	15	0.15
3752	10856	2	19	20	0
3753	10856	42	14	20	0
3754	10857	3	10	30	0
3755	10857	26	31.23	35	0.25
3756	10857	29	123.79	10	0.25
3757	10858	7	30	5	0
3758	10858	27	43.9	10	0
3759	10858	70	15	4	0
3760	10859	24	4.5	40	0.25
3761	10859	54	7.45	35	0.25
3762	10859	64	33.25	30	0.25
3763	10860	51	53	3	0
3764	10860	76	18	20	0
3765	10861	17	39	42	0
3766	10861	18	62.5	20	0
3767	10861	21	10	40	0
3768	10861	33	2.5	35	0
3769	10861	62	49.3	3	0
3770	10862	11	21	25	0
3771	10862	52	7	8	0
3772	10863	1	18	20	0.15
3773	10863	58	13.25	12	0.15
3774	10864	35	18	4	0
3775	10864	67	14	15	0
3776	10865	38	263.5	60	0.05
3777	10865	39	18	80	0.05
3778	10866	2	19	21	0.25
3779	10866	24	4.5	6	0.25
3780	10866	30	25.89	40	0.25
3781	10867	53	32.8	3	0
3782	10868	26	31.23	20	0
3783	10868	35	18	30	0
3784	10868	49	20	42	0.1
3785	10869	1	18	40	0
3786	10869	11	21	10	0
3787	10869	23	9	50	0
3788	10869	68	12.5	20	0
3789	10870	35	18	3	0
3790	10870	51	53	2	0
3791	10871	6	25	50	0.05
3792	10871	16	17.45	12	0.05
3793	10871	17	39	16	0.05
3794	10872	55	24	10	0.05
3795	10872	62	49.3	20	0.05
3796	10872	64	33.25	15	0.05
3797	10872	65	21.05	21	0.05
3798	10873	21	10	20	0
3799	10873	28	45.6	3	0
3800	10874	10	31	10	0
3801	10875	19	9.2	25	0
3802	10875	47	9.5	21	0.1
3803	10875	49	20	15	0
3804	10876	46	12	21	0
3805	10876	64	33.25	20	0
3806	10877	16	17.45	30	0.25
3807	10877	18	62.5	25	0
3808	10878	20	81	20	0.05
3809	10879	40	18.4	12	0
3810	10879	65	21.05	10	0
3811	10879	76	18	10	0
3812	10880	23	9	30	0.2
3813	10880	61	28.5	30	0.2
3814	10880	70	15	50	0.2
3815	10881	73	15	10	0
3816	10882	42	14	25	0
3817	10882	49	20	20	0.15
3818	10882	54	7.45	32	0.15
3819	10883	24	4.5	8	0
3820	10884	21	10	40	0.05
3821	10884	56	38	21	0.05
3822	10884	65	21.05	12	0.05
3823	10885	2	19	20	0
3824	10885	24	4.5	12	0
3825	10885	70	15	30	0
3826	10885	77	13	25	0
3827	10886	10	31	70	0
3828	10886	31	12.5	35	0
3829	10886	77	13	40	0
3830	10887	25	14	5	0
3831	10888	2	19	20	0
3832	10888	68	12.5	18	0
3833	10889	11	21	40	0
3834	10889	38	263.5	40	0
3835	10890	17	39	15	0
3836	10890	34	14	10	0
3837	10890	41	9.65	14	0
3838	10891	30	25.89	15	0.05
3839	10892	59	55	40	0.05
3840	10893	8	40	30	0
3841	10893	24	4.5	10	0
3842	10893	29	123.79	24	0
3843	10893	30	25.89	35	0
3844	10893	36	19	20	0
3845	10894	13	6	28	0.05
3846	10894	69	36	50	0.05
3847	10894	75	7.75	120	0.05
3848	10895	24	4.5	110	0
3849	10895	39	18	45	0
3850	10895	40	18.4	91	0
3851	10895	60	34	100	0
3852	10896	45	9.5	15	0
3853	10896	56	38	16	0
3854	10897	29	123.79	80	0
3855	10897	30	25.89	36	0
3856	10898	13	6	5	0
3857	10899	39	18	8	0.15
3858	10900	70	15	3	0.25
3859	10901	41	9.65	30	0
3860	10901	71	21.5	30	0
3861	10902	55	24	30	0.15
3862	10902	62	49.3	6	0.15
3863	10903	13	6	40	0
3864	10903	65	21.05	21	0
3865	10903	68	12.5	20	0
3866	10904	58	13.25	15	0
3867	10904	62	49.3	35	0
3868	10905	1	18	20	0.05
3869	10906	61	28.5	15	0
3870	10907	75	7.75	14	0
3871	10908	7	30	20	0.05
3872	10908	52	7	14	0.05
3873	10909	7	30	12	0
3874	10909	16	17.45	15	0
3875	10909	41	9.65	5	0
3876	10910	19	9.2	12	0
3877	10910	49	20	10	0
3878	10910	61	28.5	5	0
3879	10911	1	18	10	0
3880	10911	17	39	12	0
3881	10911	67	14	15	0
3882	10912	11	21	40	0.25
3883	10912	29	123.79	60	0.25
3884	10913	4	22	30	0.25
3885	10913	33	2.5	40	0.25
3886	10913	58	13.25	15	0
3887	10914	71	21.5	25	0
3888	10915	17	39	10	0
3889	10915	33	2.5	30	0
3890	10915	54	7.45	10	0
3891	10916	16	17.45	6	0
3892	10916	32	32	6	0
3893	10916	57	19.5	20	0
3894	10917	30	25.89	1	0
3895	10917	60	34	10	0
3896	10918	1	18	60	0.25
3897	10918	60	34	25	0.25
3898	10919	16	17.45	24	0
3899	10919	25	14	24	0
3900	10919	40	18.4	20	0
3901	10920	50	16.25	24	0
3902	10921	35	18	10	0
3903	10921	63	43.9	40	0
3904	10922	17	39	15	0
3905	10922	24	4.5	35	0
3906	10923	42	14	10	0.2
3907	10923	43	46	10	0.2
3908	10923	67	14	24	0.2
3909	10924	10	31	20	0.1
3910	10924	28	45.6	30	0.1
3911	10924	75	7.75	6	0
3912	10925	36	19	25	0.15
3913	10925	52	7	12	0.15
3914	10926	11	21	2	0
3915	10926	13	6	10	0
3916	10926	19	9.2	7	0
3917	10926	72	34.8	10	0
3918	10927	20	81	5	0
3919	10927	52	7	5	0
3920	10927	76	18	20	0
3921	10928	47	9.5	5	0
3922	10928	76	18	5	0
3923	10929	21	10	60	0
3924	10929	75	7.75	49	0
3925	10929	77	13	15	0
3926	10930	21	10	36	0
3927	10930	27	43.9	25	0
3928	10930	55	24	25	0.2
3929	10930	58	13.25	30	0.2
3930	10931	13	6	42	0.15
3931	10931	57	19.5	30	0
3932	10932	16	17.45	30	0.1
3933	10932	62	49.3	14	0.1
3934	10932	72	34.8	16	0
3935	10932	75	7.75	20	0.1
3936	10933	53	32.8	2	0
3937	10933	61	28.5	30	0
3938	10934	6	25	20	0
3939	10935	1	18	21	0
3940	10935	18	62.5	4	0.25
3941	10935	23	9	8	0.25
3942	10936	36	19	30	0.2
3943	10937	28	45.6	8	0
3944	10937	34	14	20	0
3945	10938	13	6	20	0.25
3946	10938	43	46	24	0.25
3947	10938	60	34	49	0.25
3948	10938	71	21.5	35	0.25
3949	10939	2	19	10	0.15
3950	10939	67	14	40	0.15
3951	10940	7	30	8	0
3952	10940	13	6	20	0
3953	10941	31	12.5	44	0.25
3954	10941	62	49.3	30	0.25
3955	10941	68	12.5	80	0.25
3956	10941	72	34.8	50	0
3957	10942	49	20	28	0
3958	10943	13	6	15	0
3959	10943	22	21	21	0
3960	10943	46	12	15	0
3961	10944	11	21	5	0.25
3962	10944	44	19.45	18	0.25
3963	10944	56	38	18	0
3964	10945	13	6	20	0
3965	10945	31	12.5	10	0
3966	10946	10	31	25	0
3967	10946	24	4.5	25	0
3968	10946	77	13	40	0
3969	10947	59	55	4	0
3970	10948	50	16.25	9	0
3971	10948	51	53	40	0
3972	10948	55	24	4	0
3973	10949	6	25	12	0
3974	10949	10	31	30	0
3975	10949	17	39	6	0
3976	10949	62	49.3	60	0
3977	10950	4	22	5	0
3978	10951	33	2.5	15	0.05
3979	10951	41	9.65	6	0.05
3980	10951	75	7.75	50	0.05
3981	10952	6	25	16	0.05
3982	10952	28	45.6	2	0
3983	10953	20	81	50	0.05
3984	10953	31	12.5	50	0.05
3985	10954	16	17.45	28	0.15
3986	10954	31	12.5	25	0.15
3987	10954	45	9.5	30	0
3988	10954	60	34	24	0.15
3989	10955	75	7.75	12	0.2
3990	10956	21	10	12	0
3991	10956	47	9.5	14	0
3992	10956	51	53	8	0
3993	10957	30	25.89	30	0
3994	10957	35	18	40	0
3995	10957	64	33.25	8	0
3996	10958	5	21.35	20	0
3997	10958	7	30	6	0
3998	10958	72	34.8	5	0
3999	10959	75	7.75	20	0.15
4000	10960	24	4.5	10	0.25
4001	10960	41	9.65	24	0
4002	10961	52	7	6	0.05
4003	10961	76	18	60	0
4004	10962	7	30	45	0
4005	10962	13	6	77	0
4006	10962	53	32.8	20	0
4007	10962	69	36	9	0
4008	10962	76	18	44	0
4009	10963	60	34	2	0.15
4010	10964	18	62.5	6	0
4011	10964	38	263.5	5	0
4012	10964	69	36	10	0
4013	10965	51	53	16	0
4014	10966	37	26	8	0
4015	10966	56	38	12	0.15
4016	10966	62	49.3	12	0.15
4017	10967	19	9.2	12	0
4018	10967	49	20	40	0
4019	10968	12	38	30	0
4020	10968	24	4.5	30	0
4021	10968	64	33.25	4	0
4022	10969	46	12	9	0
4023	10970	52	7	40	0.2
4024	10971	29	123.79	14	0
4025	10972	17	39	6	0
4026	10972	33	2.5	7	0
4027	10973	26	31.23	5	0
4028	10973	41	9.65	6	0
4029	10973	75	7.75	10	0
4030	10974	63	43.9	10	0
4031	10975	8	40	16	0
4032	10975	75	7.75	10	0
4033	10976	28	45.6	20	0
4034	10977	39	18	30	0
4035	10977	47	9.5	30	0
4036	10977	51	53	10	0
4037	10977	63	43.9	20	0
4038	10978	8	40	20	0.15
4039	10978	21	10	40	0.15
4040	10978	40	18.4	10	0
4041	10978	44	19.45	6	0.15
4042	10979	7	30	18	0
4043	10979	12	38	20	0
4044	10979	24	4.5	80	0
4045	10979	27	43.9	30	0
4046	10979	31	12.5	24	0
4047	10979	63	43.9	35	0
4048	10980	75	7.75	40	0.2
4049	10981	38	263.5	60	0
4050	10982	7	30	20	0
4051	10982	43	46	9	0
4052	10983	13	6	84	0.15
4053	10983	57	19.5	15	0
4054	10984	16	17.45	55	0
4055	10984	24	4.5	20	0
4056	10984	36	19	40	0
4057	10985	16	17.45	36	0.1
4058	10985	18	62.5	8	0.1
4059	10985	32	32	35	0.1
4060	10986	11	21	30	0
4061	10986	20	81	15	0
4062	10986	76	18	10	0
4063	10986	77	13	15	0
4064	10987	7	30	60	0
4065	10987	43	46	6	0
4066	10987	72	34.8	20	0
4067	10988	7	30	60	0
4068	10988	62	49.3	40	0.1
4069	10989	6	25	40	0
4070	10989	11	21	15	0
4071	10989	41	9.65	4	0
4072	10990	21	10	65	0
4073	10990	34	14	60	0.15
4074	10990	55	24	65	0.15
4075	10990	61	28.5	66	0.15
4076	10991	2	19	50	0.2
4077	10991	70	15	20	0.2
4078	10991	76	18	90	0.2
4079	10992	72	34.8	2	0
4080	10993	29	123.79	50	0.25
4081	10993	41	9.65	35	0.25
4082	10994	59	55	18	0.05
4083	10995	51	53	20	0
4084	10995	60	34	4	0
4085	10996	42	14	40	0
4086	10997	32	32	50	0
4087	10997	46	12	20	0.25
4088	10997	52	7	20	0.25
4089	10998	24	4.5	12	0
4090	10998	61	28.5	7	0
4091	10998	74	10	20	0
4092	10998	75	7.75	30	0
4093	10999	41	9.65	20	0.05
4094	10999	51	53	15	0.05
4095	10999	77	13	21	0.05
4096	11000	4	22	25	0.25
4097	11000	24	4.5	30	0.25
4098	11000	77	13	30	0
4099	11001	7	30	60	0
4100	11001	22	21	25	0
4101	11001	46	12	25	0
4102	11001	55	24	6	0
4103	11002	13	6	56	0
4104	11002	35	18	15	0.15
4105	11002	42	14	24	0.15
4106	11002	55	24	40	0
4107	11003	1	18	4	0
4108	11003	40	18.4	10	0
4109	11003	52	7	10	0
4110	11004	26	31.23	6	0
4111	11004	76	18	6	0
4112	11005	1	18	2	0
4113	11005	59	55	10	0
4114	11006	1	18	8	0
4115	11006	29	123.79	2	0.25
4116	11007	8	40	30	0
4117	11007	29	123.79	10	0
4118	11007	42	14	14	0
4119	11008	28	45.6	70	0.05
4120	11008	34	14	90	0.05
4121	11008	71	21.5	21	0
4122	11009	24	4.5	12	0
4123	11009	36	19	18	0.25
4124	11009	60	34	9	0
4125	11010	7	30	20	0
4126	11010	24	4.5	10	0
4127	11011	58	13.25	40	0.05
4128	11011	71	21.5	20	0
4129	11012	19	9.2	50	0.05
4130	11012	60	34	36	0.05
4131	11012	71	21.5	60	0.05
4132	11013	23	9	10	0
4133	11013	42	14	4	0
4134	11013	45	9.5	20	0
4135	11013	68	12.5	2	0
4136	11014	41	9.65	28	0.1
4137	11015	30	25.89	15	0
4138	11015	77	13	18	0
4139	11016	31	12.5	15	0
4140	11016	36	19	16	0
4141	11017	3	10	25	0
4142	11017	59	55	110	0
4143	11017	70	15	30	0
4144	11018	12	38	20	0
4145	11018	18	62.5	10	0
4146	11018	56	38	5	0
4147	11019	46	12	3	0
4148	11019	49	20	2	0
4149	11020	10	31	24	0.15
4150	11021	2	19	11	0.25
4151	11021	20	81	15	0
4152	11021	26	31.23	63	0
4153	11021	51	53	44	0.25
4154	11021	72	34.8	35	0
4155	11022	19	9.2	35	0
4156	11022	69	36	30	0
4157	11023	7	30	4	0
4158	11023	43	46	30	0
4159	11024	26	31.23	12	0
4160	11024	33	2.5	30	0
4161	11024	65	21.05	21	0
4162	11024	71	21.5	50	0
4163	11025	1	18	10	0.1
4164	11025	13	6	20	0.1
4165	11026	18	62.5	8	0
4166	11026	51	53	10	0
4167	11027	24	4.5	30	0.25
4168	11027	62	49.3	21	0.25
4169	11028	55	24	35	0
4170	11028	59	55	24	0
4171	11029	56	38	20	0
4172	11029	63	43.9	12	0
4173	11030	2	19	100	0.25
4174	11030	5	21.35	70	0
4175	11030	29	123.79	60	0.25
4176	11030	59	55	100	0.25
4177	11031	1	18	45	0
4178	11031	13	6	80	0
4179	11031	24	4.5	21	0
4180	11031	64	33.25	20	0
4181	11031	71	21.5	16	0
4182	11032	36	19	35	0
4183	11032	38	263.5	25	0
4184	11032	59	55	30	0
4185	11033	53	32.8	70	0.1
4186	11033	69	36	36	0.1
4187	11034	21	10	15	0.1
4188	11034	44	19.45	12	0
4189	11034	61	28.5	6	0
4190	11035	1	18	10	0
4191	11035	35	18	60	0
4192	11035	42	14	30	0
4193	11035	54	7.45	10	0
4194	11036	13	6	7	0
4195	11036	59	55	30	0
4196	11037	70	15	4	0
4197	11038	40	18.4	5	0.2
4198	11038	52	7	2	0
4199	11038	71	21.5	30	0
4200	11039	28	45.6	20	0
4201	11039	35	18	24	0
4202	11039	49	20	60	0
4203	11039	57	19.5	28	0
4204	11040	21	10	20	0
4205	11041	2	19	30	0.2
4206	11041	63	43.9	30	0
4207	11042	44	19.45	15	0
4208	11042	61	28.5	4	0
4209	11043	11	21	10	0
4210	11044	62	49.3	12	0
4211	11045	33	2.5	15	0
4212	11045	51	53	24	0
4213	11046	12	38	20	0.05
4214	11046	32	32	15	0.05
4215	11046	35	18	18	0.05
4216	11047	1	18	25	0.25
4217	11047	5	21.35	30	0.25
4218	11048	68	12.5	42	0
4219	11049	2	19	10	0.2
4220	11049	12	38	4	0.2
4221	11050	76	18	50	0.1
4222	11051	24	4.5	10	0.2
4223	11052	43	46	30	0.2
4224	11052	61	28.5	10	0.2
4225	11053	18	62.5	35	0.2
4226	11053	32	32	20	0
4227	11053	64	33.25	25	0.2
4228	11054	33	2.5	10	0
4229	11054	67	14	20	0
4230	11055	24	4.5	15	0
4231	11055	25	14	15	0
4232	11055	51	53	20	0
4233	11055	57	19.5	20	0
4234	11056	7	30	40	0
4235	11056	55	24	35	0
4236	11056	60	34	50	0
4237	11057	70	15	3	0
4238	11058	21	10	3	0
4239	11058	60	34	21	0
4240	11058	61	28.5	4	0
4241	11059	13	6	30	0
4242	11059	17	39	12	0
4243	11059	60	34	35	0
4244	11060	60	34	4	0
4245	11060	77	13	10	0
4246	11061	60	34	15	0
4247	11062	53	32.8	10	0.2
4248	11062	70	15	12	0.2
4249	11063	34	14	30	0
4250	11063	40	18.4	40	0.1
4251	11063	41	9.65	30	0.1
4252	11064	17	39	77	0.1
4253	11064	41	9.65	12	0
4254	11064	53	32.8	25	0.1
4255	11064	55	24	4	0.1
4256	11064	68	12.5	55	0
4257	11065	30	25.89	4	0.25
4258	11065	54	7.45	20	0.25
4259	11066	16	17.45	3	0
4260	11066	19	9.2	42	0
4261	11066	34	14	35	0
4262	11067	41	9.65	9	0
4263	11068	28	45.6	8	0.15
4264	11068	43	46	36	0.15
4265	11068	77	13	28	0.15
4266	11069	39	18	20	0
4267	11070	1	18	40	0.15
4268	11070	2	19	20	0.15
4269	11070	16	17.45	30	0.15
4270	11070	31	12.5	20	0
4271	11071	7	30	15	0.05
4272	11071	13	6	10	0.05
4273	11072	2	19	8	0
4274	11072	41	9.65	40	0
4275	11072	50	16.25	22	0
4276	11072	64	33.25	130	0
4277	11073	11	21	10	0
4278	11073	24	4.5	20	0
4279	11074	16	17.45	14	0.05
4280	11075	2	19	10	0.15
4281	11075	46	12	30	0.15
4282	11075	76	18	2	0.15
4283	11076	6	25	20	0.25
4284	11076	14	23.25	20	0.25
4285	11076	19	9.2	10	0.25
4286	11077	2	19	24	0.2
4287	11077	3	10	4	0
4288	11077	4	22	1	0
4289	11077	6	25	1	0.02
4290	11077	7	30	1	0.05
4291	11077	8	40	2	0.1
4292	11077	10	31	1	0
4293	11077	12	38	2	0.05
4294	11077	13	6	4	0
4295	11077	14	23.25	1	0.03
4296	11077	16	17.45	2	0.03
4297	11077	20	81	1	0.04
4298	11077	23	9	2	0
4299	11077	32	32	1	0
4300	11077	39	18	2	0.05
4301	11077	41	9.65	3	0
4302	11077	46	12	3	0.02
4303	11077	52	7	2	0
4304	11077	55	24	2	0
4305	11077	60	34	2	0.06
4306	11077	64	33.25	2	0.03
4307	11077	66	17	1	0
4308	11077	73	15	2	0.01
4309	11077	75	7.75	4	0
4310	11077	77	13	2	0
4311	10248	11	14	12	0
4312	10248	42	9.8	10	0
4313	10248	72	34.8	5	0
4314	10249	14	18.6	9	0
4315	10249	51	42.4	40	0
4316	10250	41	7.7	10	0
4317	10250	51	42.4	35	0.15
4318	10250	65	16.8	15	0.15
4319	10251	22	16.8	6	0.05
4320	10251	57	15.6	15	0.05
4321	10251	65	16.8	20	0
4322	10252	20	64.8	40	0.05
4323	10252	33	2	25	0.05
4324	10252	60	27.2	40	0
4325	10253	31	10	20	0
4326	10253	39	14.4	42	0
4327	10253	49	16	40	0
4328	10254	24	3.6	15	0.15
4329	10254	55	19.2	21	0.15
4330	10254	74	8	21	0
4331	10255	2	15.2	20	0
4332	10255	16	13.9	35	0
4333	10255	36	15.2	25	0
4334	10255	59	44	30	0
4335	10256	53	26.2	15	0
4336	10256	77	10.4	12	0
4337	10257	27	35.1	25	0
4338	10257	39	14.4	6	0
4339	10257	77	10.4	15	0
4340	10258	2	15.2	50	0.2
4341	10258	5	17	65	0.2
4342	10258	32	25.6	6	0.2
4343	10259	21	8	10	0
4344	10259	37	20.8	1	0
4345	10260	41	7.7	16	0.25
4346	10260	57	15.6	50	0
4347	10260	62	39.4	15	0.25
4348	10260	70	12	21	0.25
4349	10261	21	8	20	0
4350	10261	35	14.4	20	0
4351	10262	5	17	12	0.2
4352	10262	7	24	15	0
4353	10262	56	30.4	2	0
4354	10263	16	13.9	60	0.25
4355	10263	24	3.6	28	0
4356	10263	30	20.7	60	0.25
4357	10263	74	8	36	0.25
4358	10264	2	15.2	35	0
4359	10264	41	7.7	25	0.15
4360	10265	17	31.2	30	0
4361	10265	70	12	20	0
4362	10266	12	30.4	12	0.05
4363	10267	40	14.7	50	0
4364	10267	59	44	70	0.15
4365	10267	76	14.4	15	0.15
4366	10268	29	99	10	0
4367	10268	72	27.8	4	0
4368	10269	33	2	60	0.05
4369	10269	72	27.8	20	0.05
4370	10270	36	15.2	30	0
4371	10270	43	36.8	25	0
4372	10271	33	2	24	0
4373	10272	20	64.8	6	0
4374	10272	31	10	40	0
4375	10272	72	27.8	24	0
4376	10273	10	24.8	24	0.05
4377	10273	31	10	15	0.05
4378	10273	33	2	20	0
4379	10273	40	14.7	60	0.05
4380	10273	76	14.4	33	0.05
4381	10274	71	17.2	20	0
4382	10274	72	27.8	7	0
4383	10275	24	3.6	12	0.05
4384	10275	59	44	6	0.05
4385	10276	10	24.8	15	0
4386	10276	13	4.8	10	0
4387	10277	28	36.4	20	0
4388	10277	62	39.4	12	0
4389	10278	44	15.5	16	0
4390	10278	59	44	15	0
4391	10278	63	35.1	8	0
4392	10278	73	12	25	0
4393	10279	17	31.2	15	0.25
4394	10280	24	3.6	12	0
4395	10280	55	19.2	20	0
4396	10280	75	6.2	30	0
4397	10281	19	7.3	1	0
4398	10281	24	3.6	6	0
4399	10281	35	14.4	4	0
4400	10282	30	20.7	6	0
4401	10282	57	15.6	2	0
4402	10283	15	12.4	20	0
4403	10283	19	7.3	18	0
4404	10283	60	27.2	35	0
4405	10283	72	27.8	3	0
4406	10284	27	35.1	15	0.25
4407	10284	44	15.5	21	0
4408	10284	60	27.2	20	0.25
4409	10284	67	11.2	5	0.25
4410	10285	1	14.4	45	0.2
4411	10285	40	14.7	40	0.2
4412	10285	53	26.2	36	0.2
4413	10286	35	14.4	100	0
4414	10286	62	39.4	40	0
4415	10287	16	13.9	40	0.15
4416	10287	34	11.2	20	0
4417	10287	46	9.6	15	0.15
4418	10288	54	5.9	10	0.1
4419	10288	68	10	3	0.1
4420	10289	3	8	30	0
4421	10289	64	26.6	9	0
4422	10290	5	17	20	0
4423	10290	29	99	15	0
4424	10290	49	16	15	0
4425	10290	77	10.4	10	0
4426	10291	13	4.8	20	0.1
4427	10291	44	15.5	24	0.1
4428	10291	51	42.4	2	0.1
4429	10292	20	64.8	20	0
4430	10293	18	50	12	0
4431	10293	24	3.6	10	0
4432	10293	63	35.1	5	0
4433	10293	75	6.2	6	0
4434	10294	1	14.4	18	0
4435	10294	17	31.2	15	0
4436	10294	43	36.8	15	0
4437	10294	60	27.2	21	0
4438	10294	75	6.2	6	0
4439	10295	56	30.4	4	0
4440	10296	11	16.8	12	0
4441	10296	16	13.9	30	0
4442	10296	69	28.8	15	0
4443	10297	39	14.4	60	0
4444	10297	72	27.8	20	0
4445	10298	2	15.2	40	0
4446	10298	36	15.2	40	0.25
4447	10298	59	44	30	0.25
4448	10298	62	39.4	15	0
4449	10299	19	7.3	15	0
4450	10299	70	12	20	0
4451	10300	66	13.6	30	0
4452	10300	68	10	20	0
4453	10301	40	14.7	10	0
4454	10301	56	30.4	20	0
4455	10302	17	31.2	40	0
4456	10302	28	36.4	28	0
4457	10302	43	36.8	12	0
4458	10303	40	14.7	40	0.1
4459	10303	65	16.8	30	0.1
4460	10303	68	10	15	0.1
4461	10304	49	16	30	0
4462	10304	59	44	10	0
4463	10304	71	17.2	2	0
4464	10305	18	50	25	0.1
4465	10305	29	99	25	0.1
4466	10305	39	14.4	30	0.1
4467	10306	30	20.7	10	0
4468	10306	53	26.2	10	0
4469	10306	54	5.9	5	0
4470	10307	62	39.4	10	0
4471	10307	68	10	3	0
4472	10308	69	28.8	1	0
4473	10308	70	12	5	0
4474	10309	4	17.6	20	0
4475	10309	6	20	30	0
4476	10309	42	11.2	2	0
4477	10309	43	36.8	20	0
4478	10309	71	17.2	3	0
4479	10310	16	13.9	10	0
4480	10310	62	39.4	5	0
4481	10311	42	11.2	6	0
4482	10311	69	28.8	7	0
4483	10312	28	36.4	4	0
4484	10312	43	36.8	24	0
4485	10312	53	26.2	20	0
4486	10312	75	6.2	10	0
4487	10313	36	15.2	12	0
4488	10314	32	25.6	40	0.1
4489	10314	58	10.6	30	0.1
4490	10314	62	39.4	25	0.1
4491	10315	34	11.2	14	0
4492	10315	70	12	30	0
4493	10316	41	7.7	10	0
4494	10316	62	39.4	70	0
4495	10317	1	14.4	20	0
4496	10318	41	7.7	20	0
4497	10318	76	14.4	6	0
4498	10319	17	31.2	8	0
4499	10319	28	36.4	14	0
4500	10319	76	14.4	30	0
4501	10320	71	17.2	30	0
4502	10321	35	14.4	10	0
4503	10322	52	5.6	20	0
4504	10323	15	12.4	5	0
4505	10323	25	11.2	4	0
4506	10323	39	14.4	4	0
4507	10324	16	13.9	21	0.15
4508	10324	35	14.4	70	0.15
4509	10324	46	9.6	30	0
4510	10324	59	44	40	0.15
4511	10324	63	35.1	80	0.15
4512	10325	6	20	6	0
4513	10325	13	4.8	12	0
4514	10325	14	18.6	9	0
4515	10325	31	10	4	0
4516	10325	72	27.8	40	0
4517	10326	4	17.6	24	0
4518	10326	57	15.6	16	0
4519	10326	75	6.2	50	0
4520	10327	2	15.2	25	0.2
4521	10327	11	16.8	50	0.2
4522	10327	30	20.7	35	0.2
4523	10327	58	10.6	30	0.2
4524	10328	59	44	9	0
4525	10328	65	16.8	40	0
4526	10328	68	10	10	0
4527	10329	19	7.3	10	0.05
4528	10329	30	20.7	8	0.05
4529	10329	38	210.8	20	0.05
4530	10329	56	30.4	12	0.05
4531	10330	26	24.9	50	0.15
4532	10330	72	27.8	25	0.15
4533	10331	54	5.9	15	0
4534	10332	18	50	40	0.2
4535	10332	42	11.2	10	0.2
4536	10332	47	7.6	16	0.2
4537	10333	14	18.6	10	0
4538	10333	21	8	10	0.1
4539	10333	71	17.2	40	0.1
4540	10334	52	5.6	8	0
4541	10334	68	10	10	0
4542	10335	2	15.2	7	0.2
4543	10335	31	10	25	0.2
4544	10335	32	25.6	6	0.2
4545	10335	51	42.4	48	0.2
4546	10336	4	17.6	18	0.1
4547	10337	23	7.2	40	0
4548	10337	26	24.9	24	0
4549	10337	36	15.2	20	0
4550	10337	37	20.8	28	0
4551	10337	72	27.8	25	0
4552	10338	17	31.2	20	0
4553	10338	30	20.7	15	0
4554	10339	4	17.6	10	0
4555	10339	17	31.2	70	0.05
4556	10339	62	39.4	28	0
4557	10340	18	50	20	0.05
4558	10340	41	7.7	12	0.05
4559	10340	43	36.8	40	0.05
4560	10341	33	2	8	0
4561	10341	59	44	9	0.15
4562	10342	2	15.2	24	0.2
4563	10342	31	10	56	0.2
4564	10342	36	15.2	40	0.2
4565	10342	55	19.2	40	0.2
4566	10343	64	26.6	50	0
4567	10343	68	10	4	0.05
4568	10343	76	14.4	15	0
4569	10344	4	17.6	35	0
4570	10344	8	32	70	0.25
4571	10345	8	32	70	0
4572	10345	19	7.3	80	0
4573	10345	42	11.2	9	0
4574	10346	17	31.2	36	0.1
4575	10346	56	30.4	20	0
4576	10347	25	11.2	10	0
4577	10347	39	14.4	50	0.15
4578	10347	40	14.7	4	0
4579	10347	75	6.2	6	0.15
4580	10348	1	14.4	15	0.15
4581	10348	23	7.2	25	0
4582	10349	54	5.9	24	0
4583	10350	50	13	15	0.1
4584	10350	69	28.8	18	0.1
4585	10351	38	210.8	20	0.05
4586	10351	41	7.7	13	0
4587	10351	44	15.5	77	0.05
4588	10351	65	16.8	10	0.05
4589	10352	24	3.6	10	0
4590	10352	54	5.9	20	0.15
4591	10353	11	16.8	12	0.2
4592	10353	38	210.8	50	0.2
4593	10354	1	14.4	12	0
4594	10354	29	99	4	0
4595	10355	24	3.6	25	0
4596	10355	57	15.6	25	0
4597	10356	31	10	30	0
4598	10356	55	19.2	12	0
4599	10356	69	28.8	20	0
4600	10357	10	24.8	30	0.2
4601	10357	26	24.9	16	0
4602	10357	60	27.2	8	0.2
4603	10358	24	3.6	10	0.05
4604	10358	34	11.2	10	0.05
4605	10358	36	15.2	20	0.05
4606	10359	16	13.9	56	0.05
4607	10359	31	10	70	0.05
4608	10359	60	27.2	80	0.05
4609	10360	28	36.4	30	0
4610	10360	29	99	35	0
4611	10360	38	210.8	10	0
4612	10360	49	16	35	0
4613	10360	54	5.9	28	0
4614	10361	39	14.4	54	0.1
4615	10361	60	27.2	55	0.1
4616	10362	25	11.2	50	0
4617	10362	51	42.4	20	0
4618	10362	54	5.9	24	0
4619	10363	31	10	20	0
4620	10363	75	6.2	12	0
4621	10363	76	14.4	12	0
4622	10364	69	28.8	30	0
4623	10364	71	17.2	5	0
4624	10365	11	16.8	24	0
4625	10366	65	16.8	5	0
4626	10366	77	10.4	5	0
4627	10367	34	11.2	36	0
4628	10367	54	5.9	18	0
4629	10367	65	16.8	15	0
4630	10367	77	10.4	7	0
4631	10368	21	8	5	0.1
4632	10368	28	36.4	13	0.1
4633	10368	57	15.6	25	0
4634	10368	64	26.6	35	0.1
4635	10369	29	99	20	0
4636	10369	56	30.4	18	0.25
4637	10370	1	14.4	15	0.15
4638	10370	64	26.6	30	0
4639	10370	74	8	20	0.15
4640	10371	36	15.2	6	0.2
4641	10372	20	64.8	12	0.25
4642	10372	38	210.8	40	0.25
4643	10372	60	27.2	70	0.25
4644	10372	72	27.8	42	0.25
4645	10373	58	10.6	80	0.2
4646	10373	71	17.2	50	0.2
4647	10374	31	10	30	0
4648	10374	58	10.6	15	0
4649	10375	14	18.6	15	0
4650	10375	54	5.9	10	0
4651	10376	31	10	42	0.05
4652	10377	28	36.4	20	0.15
4653	10377	39	14.4	20	0.15
4654	10378	71	17.2	6	0
4655	10379	41	7.7	8	0.1
4656	10379	63	35.1	16	0.1
4657	10379	65	16.8	20	0.1
4658	10380	30	20.7	18	0.1
4659	10380	53	26.2	20	0.1
4660	10380	60	27.2	6	0.1
4661	10380	70	12	30	0
4662	10381	74	8	14	0
4663	10382	5	17	32	0
4664	10382	18	50	9	0
4665	10382	29	99	14	0
4666	10382	33	2	60	0
4667	10382	74	8	50	0
4668	10383	13	4.8	20	0
4669	10383	50	13	15	0
4670	10383	56	30.4	20	0
4671	10384	20	64.8	28	0
4672	10384	60	27.2	15	0
4673	10385	7	24	10	0.2
4674	10385	60	27.2	20	0.2
4675	10385	68	10	8	0.2
4676	10386	24	3.6	15	0
4677	10386	34	11.2	10	0
4678	10387	24	3.6	15	0
4679	10387	28	36.4	6	0
4680	10387	59	44	12	0
4681	10387	71	17.2	15	0
4682	10388	45	7.6	15	0.2
4683	10388	52	5.6	20	0.2
4684	10388	53	26.2	40	0
4685	10389	10	24.8	16	0
4686	10389	55	19.2	15	0
4687	10389	62	39.4	20	0
4688	10389	70	12	30	0
4689	10390	31	10	60	0.1
4690	10390	35	14.4	40	0.1
4691	10390	46	9.6	45	0
4692	10390	72	27.8	24	0.1
4693	10391	13	4.8	18	0
4694	10392	69	28.8	50	0
4695	10393	2	15.2	25	0.25
4696	10393	14	18.6	42	0.25
4697	10393	25	11.2	7	0.25
4698	10393	26	24.9	70	0.25
4699	10393	31	10	32	0
4700	10394	13	4.8	10	0
4701	10394	62	39.4	10	0
4702	10395	46	9.6	28	0.1
4703	10395	53	26.2	70	0.1
4704	10395	69	28.8	8	0
4705	10396	23	7.2	40	0
4706	10396	71	17.2	60	0
4707	10396	72	27.8	21	0
4708	10397	21	8	10	0.15
4709	10397	51	42.4	18	0.15
4710	10398	35	14.4	30	0
4711	10398	55	19.2	120	0.1
4712	10399	68	10	60	0
4713	10399	71	17.2	30	0
4714	10399	76	14.4	35	0
4715	10399	77	10.4	14	0
4716	10400	29	99	21	0
4717	10400	35	14.4	35	0
4718	10400	49	16	30	0
4719	10401	30	20.7	18	0
4720	10401	56	30.4	70	0
4721	10401	65	16.8	20	0
4722	10401	71	17.2	60	0
4723	10402	23	7.2	60	0
4724	10402	63	35.1	65	0
4725	10403	16	13.9	21	0.15
4726	10403	48	10.2	70	0.15
4727	10404	26	24.9	30	0.05
4728	10404	42	11.2	40	0.05
4729	10404	49	16	30	0.05
4730	10405	3	8	50	0
4731	10406	1	14.4	10	0
4732	10406	21	8	30	0.1
4733	10406	28	36.4	42	0.1
4734	10406	36	15.2	5	0.1
4735	10406	40	14.7	2	0.1
4736	10407	11	16.8	30	0
4737	10407	69	28.8	15	0
4738	10407	71	17.2	15	0
4739	10408	37	20.8	10	0
4740	10408	54	5.9	6	0
4741	10408	62	39.4	35	0
4742	10409	14	18.6	12	0
4743	10409	21	8	12	0
4744	10410	33	2	49	0
4745	10410	59	44	16	0
4746	10411	41	7.7	25	0.2
4747	10411	44	15.5	40	0.2
4748	10411	59	44	9	0.2
4749	10412	14	18.6	20	0.1
4750	10413	1	14.4	24	0
4751	10413	62	39.4	40	0
4752	10413	76	14.4	14	0
4753	10414	19	7.3	18	0.05
4754	10414	33	2	50	0
4755	10415	17	31.2	2	0
4756	10415	33	2	20	0
4757	10416	19	7.3	20	0
4758	10416	53	26.2	10	0
4759	10416	57	15.6	20	0
4760	10417	38	210.8	50	0
4761	10417	46	9.6	2	0.25
4762	10417	68	10	36	0.25
4763	10417	77	10.4	35	0
4764	10418	2	15.2	60	0
4765	10418	47	7.6	55	0
4766	10418	61	22.8	16	0
4767	10418	74	8	15	0
4768	10419	60	27.2	60	0.05
4769	10419	69	28.8	20	0.05
4770	10420	9	77.6	20	0.1
4771	10420	13	4.8	2	0.1
4772	10420	70	12	8	0.1
4773	10420	73	12	20	0.1
4774	10421	19	7.3	4	0.15
4775	10421	26	24.9	30	0
4776	10421	53	26.2	15	0.15
4777	10421	77	10.4	10	0.15
4778	10422	26	24.9	2	0
4779	10423	31	10	14	0
4780	10423	59	44	20	0
4781	10424	35	14.4	60	0.2
4782	10424	38	210.8	49	0.2
4783	10424	68	10	30	0.2
4784	10425	55	19.2	10	0.25
4785	10425	76	14.4	20	0.25
4786	10426	56	30.4	5	0
4787	10426	64	26.6	7	0
4788	10427	14	18.6	35	0
4789	10428	46	9.6	20	0
4790	10429	50	13	40	0
4791	10429	63	35.1	35	0.25
4792	10430	17	31.2	45	0.2
4793	10430	21	8	50	0
4794	10430	56	30.4	30	0
4795	10430	59	44	70	0.2
4796	10431	17	31.2	50	0.25
4797	10431	40	14.7	50	0.25
4798	10431	47	7.6	30	0.25
4799	10432	26	24.9	10	0
4800	10432	54	5.9	40	0
4801	10433	56	30.4	28	0
4802	10434	11	16.8	6	0
4803	10434	76	14.4	18	0.15
4804	10435	2	15.2	10	0
4805	10435	22	16.8	12	0
4806	10435	72	27.8	10	0
4807	10436	46	9.6	5	0
4808	10436	56	30.4	40	0.1
4809	10436	64	26.6	30	0.1
4810	10436	75	6.2	24	0.1
4811	10437	53	26.2	15	0
4812	10438	19	7.3	15	0.2
4813	10438	34	11.2	20	0.2
4814	10438	57	15.6	15	0.2
4815	10439	12	30.4	15	0
4816	10439	16	13.9	16	0
4817	10439	64	26.6	6	0
4818	10439	74	8	30	0
4819	10440	2	15.2	45	0.15
4820	10440	16	13.9	49	0.15
4821	10440	29	99	24	0.15
4822	10440	61	22.8	90	0.15
4823	10441	27	35.1	50	0
4824	10442	11	16.8	30	0
4825	10442	54	5.9	80	0
4826	10442	66	13.6	60	0
4827	10443	11	16.8	6	0.2
4828	10443	28	36.4	12	0
4829	10444	17	31.2	10	0
4830	10444	26	24.9	15	0
4831	10444	35	14.4	8	0
4832	10444	41	7.7	30	0
4833	10445	39	14.4	6	0
4834	10445	54	5.9	15	0
4835	10446	19	7.3	12	0.1
4836	10446	24	3.6	20	0.1
4837	10446	31	10	3	0.1
4838	10446	52	5.6	15	0.1
4839	10447	19	7.3	40	0
4840	10447	65	16.8	35	0
4841	10447	71	17.2	2	0
4842	10448	26	24.9	6	0
4843	10448	40	14.7	20	0
4844	10449	10	24.8	14	0
4845	10449	52	5.6	20	0
4846	10449	62	39.4	35	0
4847	10450	10	24.8	20	0.2
4848	10450	54	5.9	6	0.2
4849	10451	55	19.2	120	0.1
4850	10451	64	26.6	35	0.1
4851	10451	65	16.8	28	0.1
4852	10451	77	10.4	55	0.1
4853	10452	28	36.4	15	0
4854	10452	44	15.5	100	0.05
4855	10453	48	10.2	15	0.1
4856	10453	70	12	25	0.1
4857	10454	16	13.9	20	0.2
4858	10454	33	2	20	0.2
4859	10454	46	9.6	10	0.2
4860	10455	39	14.4	20	0
4861	10455	53	26.2	50	0
4862	10455	61	22.8	25	0
4863	10455	71	17.2	30	0
4864	10456	21	8	40	0.15
4865	10456	49	16	21	0.15
4866	10457	59	44	36	0
4867	10458	26	24.9	30	0
4868	10458	28	36.4	30	0
4869	10458	43	36.8	20	0
4870	10458	56	30.4	15	0
4871	10458	71	17.2	50	0
4872	10459	7	24	16	0.05
4873	10459	46	9.6	20	0.05
4874	10459	72	27.8	40	0
4875	10460	68	10	21	0.25
4876	10460	75	6.2	4	0.25
4877	10461	21	8	40	0.25
4878	10461	30	20.7	28	0.25
4879	10461	55	19.2	60	0.25
4880	10462	13	4.8	1	0
4881	10462	23	7.2	21	0
4882	10463	19	7.3	21	0
4883	10463	42	11.2	50	0
4884	10464	4	17.6	16	0.2
4885	10464	43	36.8	3	0
4886	10464	56	30.4	30	0.2
4887	10464	60	27.2	20	0
4888	10465	24	3.6	25	0
4889	10465	29	99	18	0.1
4890	10465	40	14.7	20	0
4891	10465	45	7.6	30	0.1
4892	10465	50	13	25	0
4893	10466	11	16.8	10	0
4894	10466	46	9.6	5	0
4895	10467	24	3.6	28	0
4896	10467	25	11.2	12	0
4897	10468	30	20.7	8	0
4898	10468	43	36.8	15	0
4899	10469	2	15.2	40	0.15
4900	10469	16	13.9	35	0.15
4901	10469	44	15.5	2	0.15
4902	10470	18	50	30	0
4903	10470	23	7.2	15	0
4904	10470	64	26.6	8	0
4905	10471	7	24	30	0
4906	10471	56	30.4	20	0
4907	10472	24	3.6	80	0.05
4908	10472	51	42.4	18	0
4909	10473	33	2	12	0
4910	10473	71	17.2	12	0
4911	10474	14	18.6	12	0
4912	10474	28	36.4	18	0
4913	10474	40	14.7	21	0
4914	10474	75	6.2	10	0
4915	10475	31	10	35	0.15
4916	10475	66	13.6	60	0.15
4917	10475	76	14.4	42	0.15
4918	10476	55	19.2	2	0.05
4919	10476	70	12	12	0
4920	10477	1	14.4	15	0
4921	10477	21	8	21	0.25
4922	10477	39	14.4	20	0.25
4923	10478	10	24.8	20	0.05
4924	10479	38	210.8	30	0
4925	10479	53	26.2	28	0
4926	10479	59	44	60	0
4927	10479	64	26.6	30	0
4928	10480	47	7.6	30	0
4929	10480	59	44	12	0
4930	10481	49	16	24	0
4931	10481	60	27.2	40	0
4932	10482	40	14.7	10	0
4933	10483	34	11.2	35	0.05
4934	10483	77	10.4	30	0.05
4935	10484	21	8	14	0
4936	10484	40	14.7	10	0
4937	10484	51	42.4	3	0
4938	10485	2	15.2	20	0.1
4939	10485	3	8	20	0.1
4940	10485	55	19.2	30	0.1
4941	10485	70	12	60	0.1
4942	10486	11	16.8	5	0
4943	10486	51	42.4	25	0
4944	10486	74	8	16	0
4945	10487	19	7.3	5	0
4946	10487	26	24.9	30	0
4947	10487	54	5.9	24	0.25
4948	10488	59	44	30	0
4949	10488	73	12	20	0.2
4950	10489	11	16.8	15	0.25
4951	10489	16	13.9	18	0
4952	10490	59	44	60	0
4953	10490	68	10	30	0
4954	10490	75	6.2	36	0
4955	10491	44	15.5	15	0.15
4956	10491	77	10.4	7	0.15
4957	10492	25	11.2	60	0.05
4958	10492	42	11.2	20	0.05
4959	10493	65	16.8	15	0.1
4960	10493	66	13.6	10	0.1
4961	10493	69	28.8	10	0.1
4962	10494	56	30.4	30	0
4963	10495	23	7.2	10	0
4964	10495	41	7.7	20	0
4965	10495	77	10.4	5	0
4966	10496	31	10	20	0.05
4967	10497	56	30.4	14	0
4968	10497	72	27.8	25	0
4969	10497	77	10.4	25	0
4970	10498	24	4.5	14	0
4971	10498	40	18.4	5	0
4972	10498	42	14	30	0
4973	10499	28	45.6	20	0
4974	10499	49	20	25	0
4975	10500	15	15.5	12	0.05
4976	10500	28	45.6	8	0.05
4977	10501	54	7.45	20	0
4978	10502	45	9.5	21	0
4979	10502	53	32.8	6	0
4980	10502	67	14	30	0
4981	10503	14	23.25	70	0
4982	10503	65	21.05	20	0
4983	10504	2	19	12	0
4984	10504	21	10	12	0
4985	10504	53	32.8	10	0
4986	10504	61	28.5	25	0
4987	10505	62	49.3	3	0
4988	10506	25	14	18	0.1
4989	10506	70	15	14	0.1
4990	10507	43	46	15	0.15
4991	10507	48	12.75	15	0.15
4992	10508	13	6	10	0
4993	10508	39	18	10	0
4994	10509	28	45.6	3	0
4995	10510	29	123.79	36	0
4996	10510	75	7.75	36	0.1
4997	10511	4	22	50	0.15
4998	10511	7	30	50	0.15
4999	10511	8	40	10	0.15
5000	10512	24	4.5	10	0.15
5001	10512	46	12	9	0.15
5002	10512	47	9.5	6	0.15
5003	10512	60	34	12	0.15
5004	10513	21	10	40	0.2
5005	10513	32	32	50	0.2
5006	10513	61	28.5	15	0.2
5007	10514	20	81	39	0
5008	10514	28	45.6	35	0
5009	10514	56	38	70	0
5010	10514	65	21.05	39	0
5011	10514	75	7.75	50	0
5012	10515	9	97	16	0.15
5013	10515	16	17.45	50	0
5014	10515	27	43.9	120	0
5015	10515	33	2.5	16	0.15
5016	10515	60	34	84	0.15
5017	10516	18	62.5	25	0.1
5018	10516	41	9.65	80	0.1
5019	10516	42	14	20	0
5020	10517	52	7	6	0
5021	10517	59	55	4	0
5022	10517	70	15	6	0
5023	10518	24	4.5	5	0
5024	10518	38	263.5	15	0
5025	10518	44	19.45	9	0
5026	10519	10	31	16	0.05
5027	10519	56	38	40	0
5028	10519	60	34	10	0.05
5029	10520	24	4.5	8	0
5030	10520	53	32.8	5	0
5031	10521	35	18	3	0
5032	10521	41	9.65	10	0
5033	10521	68	12.5	6	0
5034	10522	1	18	40	0.2
5035	10522	8	40	24	0
5036	10522	30	25.89	20	0.2
5037	10522	40	18.4	25	0.2
5038	10523	17	39	25	0.1
5039	10523	20	81	15	0.1
5040	10523	37	26	18	0.1
5041	10523	41	9.65	6	0.1
5042	10524	10	31	2	0
5043	10524	30	25.89	10	0
5044	10524	43	46	60	0
5045	10524	54	7.45	15	0
5046	10525	36	19	30	0
5047	10525	40	18.4	15	0.1
5048	10526	1	18	8	0.15
5049	10526	13	6	10	0
5050	10526	56	38	30	0.15
5051	10527	4	22	50	0.1
5052	10527	36	19	30	0.1
5053	10528	11	21	3	0
5054	10528	33	2.5	8	0.2
5055	10528	72	34.8	9	0
5056	10529	55	24	14	0
5057	10529	68	12.5	20	0
5058	10529	69	36	10	0
5059	10530	17	39	40	0
5060	10530	43	46	25	0
5061	10530	61	28.5	20	0
5062	10530	76	18	50	0
5063	10531	59	55	2	0
5064	10532	30	25.89	15	0
5065	10532	66	17	24	0
5066	10533	4	22	50	0.05
5067	10533	72	34.8	24	0
5068	10533	73	15	24	0.05
5069	10534	30	25.89	10	0
5070	10534	40	18.4	10	0.2
5071	10534	54	7.45	10	0.2
5072	10535	11	21	50	0.1
5073	10535	40	18.4	10	0.1
5074	10535	57	19.5	5	0.1
5075	10535	59	55	15	0.1
5076	10536	12	38	15	0.25
5077	10536	31	12.5	20	0
5078	10536	33	2.5	30	0
5079	10536	60	34	35	0.25
5080	10537	31	12.5	30	0
5081	10537	51	53	6	0
5082	10537	58	13.25	20	0
5083	10537	72	34.8	21	0
5084	10537	73	15	9	0
5085	10538	70	15	7	0
5086	10538	72	34.8	1	0
5087	10539	13	6	8	0
5088	10539	21	10	15	0
5089	10539	33	2.5	15	0
5090	10539	49	20	6	0
5091	10540	3	10	60	0
5092	10540	26	31.23	40	0
5093	10540	38	263.5	30	0
5094	10540	68	12.5	35	0
5095	10541	24	4.5	35	0.1
5096	10541	38	263.5	4	0.1
5097	10541	65	21.05	36	0.1
5098	10541	71	21.5	9	0.1
5099	10542	11	21	15	0.05
5100	10542	54	7.45	24	0.05
5101	10543	12	38	30	0.15
5102	10543	23	9	70	0.15
5103	10544	28	45.6	7	0
5104	10544	67	14	7	0
5105	10545	11	21	10	0
5106	10546	7	30	10	0
5107	10546	35	18	30	0
5108	10546	62	49.3	40	0
5109	10547	32	32	24	0.15
5110	10547	36	19	60	0
5111	10548	34	14	10	0.25
5112	10548	41	9.65	14	0
5113	10549	31	12.5	55	0.15
5114	10549	45	9.5	100	0.15
5115	10549	51	53	48	0.15
5116	10550	17	39	8	0.1
5117	10550	19	9.2	10	0
5118	10550	21	10	6	0.1
5119	10550	61	28.5	10	0.1
5120	10551	16	17.45	40	0.15
5121	10551	35	18	20	0.15
5122	10551	44	19.45	40	0
5123	10552	69	36	18	0
5124	10552	75	7.75	30	0
5125	10553	11	21	15	0
5126	10553	16	17.45	14	0
5127	10553	22	21	24	0
5128	10553	31	12.5	30	0
5129	10553	35	18	6	0
5130	10554	16	17.45	30	0.05
5131	10554	23	9	20	0.05
5132	10554	62	49.3	20	0.05
5133	10554	77	13	10	0.05
5134	10555	14	23.25	30	0.2
5135	10555	19	9.2	35	0.2
5136	10555	24	4.5	18	0.2
5137	10555	51	53	20	0.2
5138	10555	56	38	40	0.2
5139	10556	72	34.8	24	0
5140	10557	64	33.25	30	0
5141	10557	75	7.75	20	0
5142	10558	47	9.5	25	0
5143	10558	51	53	20	0
5144	10558	52	7	30	0
5145	10558	53	32.8	18	0
5146	10558	73	15	3	0
5147	10559	41	9.65	12	0.05
5148	10559	55	24	18	0.05
5149	10560	30	25.89	20	0
5150	10560	62	49.3	15	0.25
5151	10561	44	19.45	10	0
5152	10561	51	53	50	0
5153	10562	33	2.5	20	0.1
5154	10562	62	49.3	10	0.1
5155	10563	36	19	25	0
5156	10563	52	7	70	0
5157	10564	17	39	16	0.05
5158	10564	31	12.5	6	0.05
5159	10564	55	24	25	0.05
5160	10565	24	4.5	25	0.1
5161	10565	64	33.25	18	0.1
5162	10566	11	21	35	0.15
5163	10566	18	62.5	18	0.15
5164	10566	76	18	10	0
5165	10567	31	12.5	60	0.2
5166	10567	51	53	3	0
5167	10567	59	55	40	0.2
5168	10568	10	31	5	0
5169	10569	31	12.5	35	0.2
5170	10569	76	18	30	0
5171	10570	11	21	15	0.05
5172	10570	56	38	60	0.05
5173	10571	14	23.25	11	0.15
5174	10571	42	14	28	0.15
5175	10572	16	17.45	12	0.1
5176	10572	32	32	10	0.1
5177	10572	40	18.4	50	0
5178	10572	75	7.75	15	0.1
5179	10573	17	39	18	0
5180	10573	34	14	40	0
5181	10573	53	32.8	25	0
5182	10574	33	2.5	14	0
5183	10574	40	18.4	2	0
5184	10574	62	49.3	10	0
5185	10574	64	33.25	6	0
5186	10575	59	55	12	0
5187	10575	63	43.9	6	0
5188	10575	72	34.8	30	0
5189	10575	76	18	10	0
5190	10576	1	18	10	0
5191	10576	31	12.5	20	0
5192	10576	44	19.45	21	0
5193	10577	39	18	10	0
5194	10577	75	7.75	20	0
5195	10577	77	13	18	0
5196	10578	35	18	20	0
5197	10578	57	19.5	6	0
5198	10579	15	15.5	10	0
5199	10579	75	7.75	21	0
5200	10580	14	23.25	15	0.05
5201	10580	41	9.65	9	0.05
5202	10580	65	21.05	30	0.05
5203	10581	75	7.75	50	0.2
5204	10582	57	19.5	4	0
5205	10582	76	18	14	0
5206	10583	29	123.79	10	0
5207	10583	60	34	24	0.15
5208	10583	69	36	10	0.15
5209	10584	31	12.5	50	0.05
5210	10585	47	9.5	15	0
5211	10586	52	7	4	0.15
5212	10587	26	31.23	6	0
5213	10587	35	18	20	0
5214	10587	77	13	20	0
5215	10588	18	62.5	40	0.2
5216	10588	42	14	100	0.2
5217	10589	35	18	4	0
5218	10590	1	18	20	0
5219	10590	77	13	60	0.05
5220	10591	3	10	14	0
5221	10591	7	30	10	0
5222	10591	54	7.45	50	0
5223	10592	15	15.5	25	0.05
5224	10592	26	31.23	5	0.05
5225	10593	20	81	21	0.2
5226	10593	69	36	20	0.2
5227	10593	76	18	4	0.2
5228	10594	52	7	24	0
5229	10594	58	13.25	30	0
5230	10595	35	18	30	0.25
5231	10595	61	28.5	120	0.25
5232	10595	69	36	65	0.25
5233	10596	56	38	5	0.2
5234	10596	63	43.9	24	0.2
5235	10596	75	7.75	30	0.2
5236	10597	24	4.5	35	0.2
5237	10597	57	19.5	20	0
5238	10597	65	21.05	12	0.2
5239	10598	27	43.9	50	0
5240	10598	71	21.5	9	0
5241	10599	62	49.3	10	0
5242	10600	54	7.45	4	0
5243	10600	73	15	30	0
5244	10601	13	6	60	0
5245	10601	59	55	35	0
5246	10602	77	13	5	0.25
5247	10603	22	21	48	0
5248	10603	49	20	25	0.05
5249	10604	48	12.75	6	0.1
5250	10604	76	18	10	0.1
5251	10605	16	17.45	30	0.05
5252	10605	59	55	20	0.05
5253	10605	60	34	70	0.05
5254	10605	71	21.5	15	0.05
5255	10606	4	22	20	0.2
5256	10606	55	24	20	0.2
5257	10606	62	49.3	10	0.2
5258	10607	7	30	45	0
5259	10607	17	39	100	0
5260	10607	33	2.5	14	0
5261	10607	40	18.4	42	0
5262	10607	72	34.8	12	0
5263	10608	56	38	28	0
5264	10609	1	18	3	0
5265	10609	10	31	10	0
5266	10609	21	10	6	0
5267	10610	36	19	21	0.25
5268	10611	1	18	6	0
5269	10611	2	19	10	0
5270	10611	60	34	15	0
5271	10612	10	31	70	0
5272	10612	36	19	55	0
5273	10612	49	20	18	0
5274	10612	60	34	40	0
5275	10612	76	18	80	0
5276	10613	13	6	8	0.1
5277	10613	75	7.75	40	0
5278	10614	11	21	14	0
5279	10614	21	10	8	0
5280	10614	39	18	5	0
5281	10615	55	24	5	0
5282	10616	38	263.5	15	0.05
5283	10616	56	38	14	0
5284	10616	70	15	15	0.05
5285	10616	71	21.5	15	0.05
5286	10617	59	55	30	0.15
5287	10618	6	25	70	0
5288	10618	56	38	20	0
5289	10618	68	12.5	15	0
5290	10619	21	10	42	0
5291	10619	22	21	40	0
5292	10620	24	4.5	5	0
5293	10620	52	7	5	0
5294	10621	19	9.2	5	0
5295	10621	23	9	10	0
5296	10621	70	15	20	0
5297	10621	71	21.5	15	0
5298	10622	2	19	20	0
5299	10622	68	12.5	18	0.2
5300	10623	14	23.25	21	0
5301	10623	19	9.2	15	0.1
5302	10623	21	10	25	0.1
5303	10623	24	4.5	3	0
5304	10623	35	18	30	0.1
5305	10624	28	45.6	10	0
5306	10624	29	123.79	6	0
5307	10624	44	19.45	10	0
5308	10625	14	23.25	3	0
5309	10625	42	14	5	0
5310	10625	60	34	10	0
5311	10626	53	32.8	12	0
5312	10626	60	34	20	0
5313	10626	71	21.5	20	0
5314	10627	62	49.3	15	0
5315	10627	73	15	35	0.15
5316	10628	1	18	25	0
5317	10629	29	123.79	20	0
5318	10629	64	33.25	9	0
5319	10630	55	24	12	0.05
5320	10630	76	18	35	0
5321	10631	75	7.75	8	0.1
5322	10632	2	19	30	0.05
5323	10632	33	2.5	20	0.05
5324	10633	12	38	36	0.15
5325	10633	13	6	13	0.15
5326	10633	26	31.23	35	0.15
5327	10633	62	49.3	80	0.15
5328	10634	7	30	35	0
5329	10634	18	62.5	50	0
5330	10634	51	53	15	0
5331	10634	75	7.75	2	0
5332	10635	4	22	10	0.1
5333	10635	5	21.35	15	0.1
5334	10635	22	21	40	0
5335	10636	4	22	25	0
5336	10636	58	13.25	6	0
5337	10637	11	21	10	0
5338	10637	50	16.25	25	0.05
5339	10637	56	38	60	0.05
5340	10638	45	9.5	20	0
5341	10638	65	21.05	21	0
5342	10638	72	34.8	60	0
5343	10639	18	62.5	8	0
5344	10640	69	36	20	0.25
5345	10640	70	15	15	0.25
5346	10641	2	19	50	0
5347	10641	40	18.4	60	0
5348	10642	21	10	30	0.2
5349	10642	61	28.5	20	0.2
5350	10643	28	45.6	15	0.25
5351	10643	39	18	21	0.25
5352	10643	46	12	2	0.25
5353	10644	18	62.5	4	0.1
5354	10644	43	46	20	0
5355	10644	46	12	21	0.1
5356	10645	18	62.5	20	0
5357	10645	36	19	15	0
5358	10646	1	18	15	0.25
5359	10646	10	31	18	0.25
5360	10646	71	21.5	30	0.25
5361	10646	77	13	35	0.25
5362	10647	19	9.2	30	0
5363	10647	39	18	20	0
5364	10648	22	21	15	0
5365	10648	24	4.5	15	0.15
5366	10649	28	45.6	20	0
5367	10649	72	34.8	15	0
5368	10650	30	25.89	30	0
5369	10650	53	32.8	25	0.05
5370	10650	54	7.45	30	0
5371	10651	19	9.2	12	0.25
5372	10651	22	21	20	0.25
5373	10652	30	25.89	2	0.25
5374	10652	42	14	20	0
5375	10653	16	17.45	30	0.1
5376	10653	60	34	20	0.1
5377	10654	4	22	12	0.1
5378	10654	39	18	20	0.1
5379	10654	54	7.45	6	0.1
5380	10655	41	9.65	20	0.2
5381	10656	14	23.25	3	0.1
5382	10656	44	19.45	28	0.1
5383	10656	47	9.5	6	0.1
5384	10657	15	15.5	50	0
5385	10657	41	9.65	24	0
5386	10657	46	12	45	0
5387	10657	47	9.5	10	0
5388	10657	56	38	45	0
5389	10657	60	34	30	0
5390	10658	21	10	60	0
5391	10658	40	18.4	70	0.05
5392	10658	60	34	55	0.05
5393	10658	77	13	70	0.05
5394	10659	31	12.5	20	0.05
5395	10659	40	18.4	24	0.05
5396	10659	70	15	40	0.05
5397	10660	20	81	21	0
5398	10661	39	18	3	0.2
5399	10661	58	13.25	49	0.2
5400	10662	68	12.5	10	0
5401	10663	40	18.4	30	0.05
5402	10663	42	14	30	0.05
5403	10663	51	53	20	0.05
5404	10664	10	31	24	0.15
5405	10664	56	38	12	0.15
5406	10664	65	21.05	15	0.15
5407	10665	51	53	20	0
5408	10665	59	55	1	0
5409	10665	76	18	10	0
5410	10666	29	123.79	36	0
5411	10666	65	21.05	10	0
5412	10667	69	36	45	0.2
5413	10667	71	21.5	14	0.2
5414	10668	31	12.5	8	0.1
5415	10668	55	24	4	0.1
5416	10668	64	33.25	15	0.1
5417	10669	36	19	30	0
5418	10670	23	9	32	0
5419	10670	46	12	60	0
5420	10670	67	14	25	0
5421	10670	73	15	50	0
5422	10670	75	7.75	25	0
5423	10671	16	17.45	10	0
5424	10671	62	49.3	10	0
5425	10671	65	21.05	12	0
5426	10672	38	263.5	15	0.1
5427	10672	71	21.5	12	0
5428	10673	16	17.45	3	0
5429	10673	42	14	6	0
5430	10673	43	46	6	0
5431	10674	23	9	5	0
5432	10675	14	23.25	30	0
5433	10675	53	32.8	10	0
5434	10675	58	13.25	30	0
5435	10676	10	31	2	0
5436	10676	19	9.2	7	0
5437	10676	44	19.45	21	0
5438	10677	26	31.23	30	0.15
5439	10677	33	2.5	8	0.15
5440	10678	12	38	100	0
5441	10678	33	2.5	30	0
5442	10678	41	9.65	120	0
5443	10678	54	7.45	30	0
5444	10679	59	55	12	0
5445	10680	16	17.45	50	0.25
5446	10680	31	12.5	20	0.25
5447	10680	42	14	40	0.25
5448	10681	19	9.2	30	0.1
5449	10681	21	10	12	0.1
5450	10681	64	33.25	28	0
5451	10682	33	2.5	30	0
5452	10682	66	17	4	0
5453	10682	75	7.75	30	0
5454	10683	52	7	9	0
5455	10684	40	18.4	20	0
5456	10684	47	9.5	40	0
5457	10684	60	34	30	0
5458	10685	10	31	20	0
5459	10685	41	9.65	4	0
5460	10685	47	9.5	15	0
5461	10686	17	39	30	0.2
5462	10686	26	31.23	15	0
5463	10687	9	97	50	0.25
5464	10687	29	123.79	10	0
5465	10687	36	19	6	0.25
5466	10688	10	31	18	0.1
5467	10688	28	45.6	60	0.1
5468	10688	34	14	14	0
5469	10689	1	18	35	0.25
5470	10690	56	38	20	0.25
5471	10690	77	13	30	0.25
5472	10691	1	18	30	0
5473	10691	29	123.79	40	0
5474	10691	43	46	40	0
5475	10691	44	19.45	24	0
5476	10691	62	49.3	48	0
5477	10692	63	43.9	20	0
5478	10693	9	97	6	0
5479	10693	54	7.45	60	0.15
5480	10693	69	36	30	0.15
5481	10693	73	15	15	0.15
5482	10694	7	30	90	0
5483	10694	59	55	25	0
5484	10694	70	15	50	0
5485	10695	8	40	10	0
5486	10695	12	38	4	0
5487	10695	24	4.5	20	0
5488	10696	17	39	20	0
5489	10696	46	12	18	0
5490	10697	19	9.2	7	0.25
5491	10697	35	18	9	0.25
5492	10697	58	13.25	30	0.25
5493	10697	70	15	30	0.25
5494	10698	11	21	15	0
5495	10698	17	39	8	0.05
5496	10698	29	123.79	12	0.05
5497	10698	65	21.05	65	0.05
5498	10698	70	15	8	0.05
5499	10699	47	9.5	12	0
5500	10700	1	18	5	0.2
5501	10700	34	14	12	0.2
5502	10700	68	12.5	40	0.2
5503	10700	71	21.5	60	0.2
5504	10701	59	55	42	0.15
5505	10701	71	21.5	20	0.15
5506	10701	76	18	35	0.15
5507	10702	3	10	6	0
5508	10702	76	18	15	0
5509	10703	2	19	5	0
5510	10703	59	55	35	0
5511	10703	73	15	35	0
5512	10704	4	22	6	0
5513	10704	24	4.5	35	0
5514	10704	48	12.75	24	0
5515	10705	31	12.5	20	0
5516	10705	32	32	4	0
5517	10706	16	17.45	20	0
5518	10706	43	46	24	0
5519	10706	59	55	8	0
5520	10707	55	24	21	0
5521	10707	57	19.5	40	0
5522	10707	70	15	28	0.15
5523	10708	5	21.35	4	0
5524	10708	36	19	5	0
5525	10709	8	40	40	0
5526	10709	51	53	28	0
5527	10709	60	34	10	0
5528	10710	19	9.2	5	0
5529	10710	47	9.5	5	0
5530	10711	19	9.2	12	0
5531	10711	41	9.65	42	0
5532	10711	53	32.8	120	0
5533	10712	53	32.8	3	0.05
5534	10712	56	38	30	0
5535	10713	10	31	18	0
5536	10713	26	31.23	30	0
5537	10713	45	9.5	110	0
5538	10713	46	12	24	0
5539	10714	2	19	30	0.25
5540	10714	17	39	27	0.25
5541	10714	47	9.5	50	0.25
5542	10714	56	38	18	0.25
5543	10714	58	13.25	12	0.25
5544	10715	10	31	21	0
5545	10715	71	21.5	30	0
5546	10716	21	10	5	0
5547	10716	51	53	7	0
5548	10716	61	28.5	10	0
5549	10717	21	10	32	0.05
5550	10717	54	7.45	15	0
5551	10717	69	36	25	0.05
5552	10718	12	38	36	0
5553	10718	16	17.45	20	0
5554	10718	36	19	40	0
5555	10718	62	49.3	20	0
5556	10719	18	62.5	12	0.25
5557	10719	30	25.89	3	0.25
5558	10719	54	7.45	40	0.25
5559	10720	35	18	21	0
5560	10720	71	21.5	8	0
5561	10721	44	19.45	50	0.05
5562	10722	2	19	3	0
5563	10722	31	12.5	50	0
5564	10722	68	12.5	45	0
5565	10722	75	7.75	42	0
5566	10723	26	31.23	15	0
5567	10724	10	31	16	0
5568	10724	61	28.5	5	0
5569	10725	41	9.65	12	0
5570	10725	52	7	4	0
5571	10725	55	24	6	0
5572	10726	4	22	25	0
5573	10726	11	21	5	0
5574	10727	17	39	20	0.05
5575	10727	56	38	10	0.05
5576	10727	59	55	10	0.05
5577	10728	30	25.89	15	0
5578	10728	40	18.4	6	0
5579	10728	55	24	12	0
5580	10728	60	34	15	0
5581	10729	1	18	50	0
5582	10729	21	10	30	0
5583	10729	50	16.25	40	0
5584	10730	16	17.45	15	0.05
5585	10730	31	12.5	3	0.05
5586	10730	65	21.05	10	0.05
5587	10731	21	10	40	0.05
5588	10731	51	53	30	0.05
5589	10732	76	18	20	0
5590	10733	14	23.25	16	0
5591	10733	28	45.6	20	0
5592	10733	52	7	25	0
5593	10734	6	25	30	0
5594	10734	30	25.89	15	0
5595	10734	76	18	20	0
5596	10735	61	28.5	20	0.1
5597	10735	77	13	2	0.1
5598	10736	65	21.05	40	0
5599	10736	75	7.75	20	0
5600	10737	13	6	4	0
5601	10737	41	9.65	12	0
5602	10738	16	17.45	3	0
5603	10739	36	19	6	0
5604	10739	52	7	18	0
5605	10740	28	45.6	5	0.2
5606	10740	35	18	35	0.2
5607	10740	45	9.5	40	0.2
5608	10740	56	38	14	0.2
5609	10741	2	19	15	0.2
5610	10742	3	10	20	0
5611	10742	60	34	50	0
5612	10742	72	34.8	35	0
5613	10743	46	12	28	0.05
5614	10744	40	18.4	50	0.2
5615	10745	18	62.5	24	0
5616	10745	44	19.45	16	0
5617	10745	59	55	45	0
5618	10745	72	34.8	7	0
5619	10746	13	6	6	0
5620	10746	42	14	28	0
5621	10746	62	49.3	9	0
5622	10746	69	36	40	0
5623	10747	31	12.5	8	0
5624	10747	41	9.65	35	0
5625	10747	63	43.9	9	0
5626	10747	69	36	30	0
5627	10748	23	9	44	0
5628	10748	40	18.4	40	0
5629	10748	56	38	28	0
5630	10749	56	38	15	0
5631	10749	59	55	6	0
5632	10749	76	18	10	0
5633	10750	14	23.25	5	0.15
5634	10750	45	9.5	40	0.15
5635	10750	59	55	25	0.15
5636	10751	26	31.23	12	0.1
5637	10751	30	25.89	30	0
5638	10751	50	16.25	20	0.1
5639	10751	73	15	15	0
5640	10752	1	18	8	0
5641	10752	69	36	3	0
5642	10753	45	9.5	4	0
5643	10753	74	10	5	0
5644	10754	40	18.4	3	0
5645	10755	47	9.5	30	0.25
5646	10755	56	38	30	0.25
5647	10755	57	19.5	14	0.25
5648	10755	69	36	25	0.25
5649	10756	18	62.5	21	0.2
5650	10756	36	19	20	0.2
5651	10756	68	12.5	6	0.2
5652	10756	69	36	20	0.2
5653	10757	34	14	30	0
5654	10757	59	55	7	0
5655	10757	62	49.3	30	0
5656	10757	64	33.25	24	0
5657	10758	26	31.23	20	0
5658	10758	52	7	60	0
5659	10758	70	15	40	0
5660	10759	32	32	10	0
5661	10760	25	14	12	0.25
5662	10760	27	43.9	40	0
5663	10760	43	46	30	0.25
5664	10761	25	14	35	0.25
5665	10761	75	7.75	18	0
5666	10762	39	18	16	0
5667	10762	47	9.5	30	0
5668	10762	51	53	28	0
5669	10762	56	38	60	0
5670	10763	21	10	40	0
5671	10763	22	21	6	0
5672	10763	24	4.5	20	0
5673	10764	3	10	20	0.1
5674	10764	39	18	130	0.1
5675	10765	65	21.05	80	0.1
5676	10766	2	19	40	0
5677	10766	7	30	35	0
5678	10766	68	12.5	40	0
5679	10767	42	14	2	0
5680	10768	22	21	4	0
5681	10768	31	12.5	50	0
5682	10768	60	34	15	0
5683	10768	71	21.5	12	0
5684	10769	41	9.65	30	0.05
5685	10769	52	7	15	0.05
5686	10769	61	28.5	20	0
5687	10769	62	49.3	15	0
5688	10770	11	21	15	0.25
5689	10771	71	21.5	16	0
5690	10772	29	123.79	18	0
5691	10772	59	55	25	0
5692	10773	17	39	33	0
5693	10773	31	12.5	70	0.2
5694	10773	75	7.75	7	0.2
5695	10774	31	12.5	2	0.25
5696	10774	66	17	50	0
5697	10775	10	31	6	0
5698	10775	67	14	3	0
5699	10776	31	12.5	16	0.05
5700	10776	42	14	12	0.05
5701	10776	45	9.5	27	0.05
5702	10776	51	53	120	0.05
5703	10777	42	14	20	0.2
5704	10778	41	9.65	10	0
5705	10779	16	17.45	20	0
5706	10779	62	49.3	20	0
5707	10780	70	15	35	0
5708	10780	77	13	15	0
5709	10781	54	7.45	3	0.2
5710	10781	56	38	20	0.2
5711	10781	74	10	35	0
5712	10782	31	12.5	1	0
5713	10783	31	12.5	10	0
5714	10783	38	263.5	5	0
5715	10784	36	19	30	0
5716	10784	39	18	2	0.15
5717	10784	72	34.8	30	0.15
5718	10785	10	31	10	0
5719	10785	75	7.75	10	0
5720	10786	8	40	30	0.2
5721	10786	30	25.89	15	0.2
5722	10786	75	7.75	42	0.2
5723	10787	2	19	15	0.05
5724	10787	29	123.79	20	0.05
5725	10788	19	9.2	50	0.05
5726	10788	75	7.75	40	0.05
5727	10789	18	62.5	30	0
5728	10789	35	18	15	0
5729	10789	63	43.9	30	0
5730	10789	68	12.5	18	0
5731	10790	7	30	3	0.15
5732	10790	56	38	20	0.15
5733	10791	29	123.79	14	0.05
5734	10791	41	9.65	20	0.05
5735	10792	2	19	10	0
5736	10792	54	7.45	3	0
5737	10792	68	12.5	15	0
5738	10793	41	9.65	14	0
5739	10793	52	7	8	0
5740	10794	14	23.25	15	0.2
5741	10794	54	7.45	6	0.2
5742	10795	16	17.45	65	0
5743	10795	17	39	35	0.25
5744	10796	26	31.23	21	0.2
5745	10796	44	19.45	10	0
5746	10796	64	33.25	35	0.2
5747	10796	69	36	24	0.2
5748	10797	11	21	20	0
5749	10798	62	49.3	2	0
5750	10798	72	34.8	10	0
5751	10799	13	6	20	0.15
5752	10799	24	4.5	20	0.15
5753	10799	59	55	25	0
5754	10800	11	21	50	0.1
5755	10800	51	53	10	0.1
5756	10800	54	7.45	7	0.1
5757	10801	17	39	40	0.25
5758	10801	29	123.79	20	0.25
5759	10802	30	25.89	25	0.25
5760	10802	51	53	30	0.25
5761	10802	55	24	60	0.25
5762	10802	62	49.3	5	0.25
5763	10803	19	9.2	24	0.05
5764	10803	25	14	15	0.05
5765	10803	59	55	15	0.05
5766	10804	10	31	36	0
5767	10804	28	45.6	24	0
5768	10804	49	20	4	0.15
5769	10805	34	14	10	0
5770	10805	38	263.5	10	0
5771	10806	2	19	20	0.25
5772	10806	65	21.05	2	0
5773	10806	74	10	15	0.25
5774	10807	40	18.4	1	0
5775	10808	56	38	20	0.15
5776	10808	76	18	50	0.15
5777	10809	52	7	20	0
5778	10810	13	6	7	0
5779	10810	25	14	5	0
5780	10810	70	15	5	0
5781	10811	19	9.2	15	0
5782	10811	23	9	18	0
5783	10811	40	18.4	30	0
5784	10812	31	12.5	16	0.1
5785	10812	72	34.8	40	0.1
5786	10812	77	13	20	0
5787	10813	2	19	12	0.2
5788	10813	46	12	35	0
5789	10814	41	9.65	20	0
5790	10814	43	46	20	0.15
5791	10814	48	12.75	8	0.15
5792	10814	61	28.5	30	0.15
5793	10815	33	2.5	16	0
5794	10816	38	263.5	30	0.05
5795	10816	62	49.3	20	0.05
5796	10817	26	31.23	40	0.15
5797	10817	38	263.5	30	0
5798	10817	40	18.4	60	0.15
5799	10817	62	49.3	25	0.15
5800	10818	32	32	20	0
5801	10818	41	9.65	20	0
5802	10819	43	46	7	0
5803	10819	75	7.75	20	0
5804	10820	56	38	30	0
5805	10821	35	18	20	0
5806	10821	51	53	6	0
5807	10822	62	49.3	3	0
5808	10822	70	15	6	0
5809	10823	11	21	20	0.1
5810	10823	57	19.5	15	0
5811	10823	59	55	40	0.1
5812	10823	77	13	15	0.1
5813	10824	41	9.65	12	0
5814	10824	70	15	9	0
5815	10825	26	31.23	12	0
5816	10825	53	32.8	20	0
5817	10826	31	12.5	35	0
5818	10826	57	19.5	15	0
5819	10827	10	31	15	0
5820	10827	39	18	21	0
5821	10828	20	81	5	0
5822	10828	38	263.5	2	0
5823	10829	2	19	10	0
5824	10829	8	40	20	0
5825	10829	13	6	10	0
5826	10829	60	34	21	0
5827	10830	6	25	6	0
5828	10830	39	18	28	0
5829	10830	60	34	30	0
5830	10830	68	12.5	24	0
5831	10831	19	9.2	2	0
5832	10831	35	18	8	0
5833	10831	38	263.5	8	0
5834	10831	43	46	9	0
5835	10832	13	6	3	0.2
5836	10832	25	14	10	0.2
5837	10832	44	19.45	16	0.2
5838	10832	64	33.25	3	0
5839	10833	7	30	20	0.1
5840	10833	31	12.5	9	0.1
5841	10833	53	32.8	9	0.1
5842	10834	29	123.79	8	0.05
5843	10834	30	25.89	20	0.05
5844	10835	59	55	15	0
5845	10835	77	13	2	0.2
5846	10836	22	21	52	0
5847	10836	35	18	6	0
5848	10836	57	19.5	24	0
5849	10836	60	34	60	0
5850	10836	64	33.25	30	0
5851	10837	13	6	6	0
5852	10837	40	18.4	25	0
5853	10837	47	9.5	40	0.25
5854	10837	76	18	21	0.25
5855	10838	1	18	4	0.25
5856	10838	18	62.5	25	0.25
5857	10838	36	19	50	0.25
5858	10839	58	13.25	30	0.1
5859	10839	72	34.8	15	0.1
5860	10840	25	14	6	0.2
5861	10840	39	18	10	0.2
5862	10841	10	31	16	0
5863	10841	56	38	30	0
5864	10841	59	55	50	0
5865	10841	77	13	15	0
5866	10842	11	21	15	0
5867	10842	43	46	5	0
5868	10842	68	12.5	20	0
5869	10842	70	15	12	0
5870	10843	51	53	4	0.25
5871	10844	22	21	35	0
5872	10845	23	9	70	0.1
5873	10845	35	18	25	0.1
5874	10845	42	14	42	0.1
5875	10845	58	13.25	60	0.1
5876	10845	64	33.25	48	0
5877	10846	4	22	21	0
5878	10846	70	15	30	0
5879	10846	74	10	20	0
5880	10847	1	18	80	0.2
5881	10847	19	9.2	12	0.2
5882	10847	37	26	60	0.2
5883	10847	45	9.5	36	0.2
5884	10847	60	34	45	0.2
5885	10847	71	21.5	55	0.2
5886	10848	5	21.35	30	0
5887	10848	9	97	3	0
5888	10849	3	10	49	0
5889	10849	26	31.23	18	0.15
5890	10850	25	14	20	0.15
5891	10850	33	2.5	4	0.15
5892	10850	70	15	30	0.15
5893	10851	2	19	5	0.05
5894	10851	25	14	10	0.05
5895	10851	57	19.5	10	0.05
5896	10851	59	55	42	0.05
5897	10852	2	19	15	0
5898	10852	17	39	6	0
5899	10852	62	49.3	50	0
5900	10853	18	62.5	10	0
5901	10854	10	31	100	0.15
5902	10854	13	6	65	0.15
5903	10855	16	17.45	50	0
5904	10855	31	12.5	14	0
5905	10855	56	38	24	0
5906	10855	65	21.05	15	0.15
5907	10856	2	19	20	0
5908	10856	42	14	20	0
5909	10857	3	10	30	0
5910	10857	26	31.23	35	0.25
5911	10857	29	123.79	10	0.25
5912	10858	7	30	5	0
5913	10858	27	43.9	10	0
5914	10858	70	15	4	0
5915	10859	24	4.5	40	0.25
5916	10859	54	7.45	35	0.25
5917	10859	64	33.25	30	0.25
5918	10860	51	53	3	0
5919	10860	76	18	20	0
5920	10861	17	39	42	0
5921	10861	18	62.5	20	0
5922	10861	21	10	40	0
5923	10861	33	2.5	35	0
5924	10861	62	49.3	3	0
5925	10862	11	21	25	0
5926	10862	52	7	8	0
5927	10863	1	18	20	0.15
5928	10863	58	13.25	12	0.15
5929	10864	35	18	4	0
5930	10864	67	14	15	0
5931	10865	38	263.5	60	0.05
5932	10865	39	18	80	0.05
5933	10866	2	19	21	0.25
5934	10866	24	4.5	6	0.25
5935	10866	30	25.89	40	0.25
5936	10867	53	32.8	3	0
5937	10868	26	31.23	20	0
5938	10868	35	18	30	0
5939	10868	49	20	42	0.1
5940	10869	1	18	40	0
5941	10869	11	21	10	0
5942	10869	23	9	50	0
5943	10869	68	12.5	20	0
5944	10870	35	18	3	0
5945	10870	51	53	2	0
5946	10871	6	25	50	0.05
5947	10871	16	17.45	12	0.05
5948	10871	17	39	16	0.05
5949	10872	55	24	10	0.05
5950	10872	62	49.3	20	0.05
5951	10872	64	33.25	15	0.05
5952	10872	65	21.05	21	0.05
5953	10873	21	10	20	0
5954	10873	28	45.6	3	0
5955	10874	10	31	10	0
5956	10875	19	9.2	25	0
5957	10875	47	9.5	21	0.1
5958	10875	49	20	15	0
5959	10876	46	12	21	0
5960	10876	64	33.25	20	0
5961	10877	16	17.45	30	0.25
5962	10877	18	62.5	25	0
5963	10878	20	81	20	0.05
5964	10879	40	18.4	12	0
5965	10879	65	21.05	10	0
5966	10879	76	18	10	0
5967	10880	23	9	30	0.2
5968	10880	61	28.5	30	0.2
5969	10880	70	15	50	0.2
5970	10881	73	15	10	0
5971	10882	42	14	25	0
5972	10882	49	20	20	0.15
5973	10882	54	7.45	32	0.15
5974	10883	24	4.5	8	0
5975	10884	21	10	40	0.05
5976	10884	56	38	21	0.05
5977	10884	65	21.05	12	0.05
5978	10885	2	19	20	0
5979	10885	24	4.5	12	0
5980	10885	70	15	30	0
5981	10885	77	13	25	0
5982	10886	10	31	70	0
5983	10886	31	12.5	35	0
5984	10886	77	13	40	0
5985	10887	25	14	5	0
5986	10888	2	19	20	0
5987	10888	68	12.5	18	0
5988	10889	11	21	40	0
5989	10889	38	263.5	40	0
5990	10890	17	39	15	0
5991	10890	34	14	10	0
5992	10890	41	9.65	14	0
5993	10891	30	25.89	15	0.05
5994	10892	59	55	40	0.05
5995	10893	8	40	30	0
5996	10893	24	4.5	10	0
5997	10893	29	123.79	24	0
5998	10893	30	25.89	35	0
5999	10893	36	19	20	0
6000	10894	13	6	28	0.05
6001	10894	69	36	50	0.05
6002	10894	75	7.75	120	0.05
6003	10895	24	4.5	110	0
6004	10895	39	18	45	0
6005	10895	40	18.4	91	0
6006	10895	60	34	100	0
6007	10896	45	9.5	15	0
6008	10896	56	38	16	0
6009	10897	29	123.79	80	0
6010	10897	30	25.89	36	0
6011	10898	13	6	5	0
6012	10899	39	18	8	0.15
6013	10900	70	15	3	0.25
6014	10901	41	9.65	30	0
6015	10901	71	21.5	30	0
6016	10902	55	24	30	0.15
6017	10902	62	49.3	6	0.15
6018	10903	13	6	40	0
6019	10903	65	21.05	21	0
6020	10903	68	12.5	20	0
6021	10904	58	13.25	15	0
6022	10904	62	49.3	35	0
6023	10905	1	18	20	0.05
6024	10906	61	28.5	15	0
6025	10907	75	7.75	14	0
6026	10908	7	30	20	0.05
6027	10908	52	7	14	0.05
6028	10909	7	30	12	0
6029	10909	16	17.45	15	0
6030	10909	41	9.65	5	0
6031	10910	19	9.2	12	0
6032	10910	49	20	10	0
6033	10910	61	28.5	5	0
6034	10911	1	18	10	0
6035	10911	17	39	12	0
6036	10911	67	14	15	0
6037	10912	11	21	40	0.25
6038	10912	29	123.79	60	0.25
6039	10913	4	22	30	0.25
6040	10913	33	2.5	40	0.25
6041	10913	58	13.25	15	0
6042	10914	71	21.5	25	0
6043	10915	17	39	10	0
6044	10915	33	2.5	30	0
6045	10915	54	7.45	10	0
6046	10916	16	17.45	6	0
6047	10916	32	32	6	0
6048	10916	57	19.5	20	0
6049	10917	30	25.89	1	0
6050	10917	60	34	10	0
6051	10918	1	18	60	0.25
6052	10918	60	34	25	0.25
6053	10919	16	17.45	24	0
6054	10919	25	14	24	0
6055	10919	40	18.4	20	0
6056	10920	50	16.25	24	0
6057	10921	35	18	10	0
6058	10921	63	43.9	40	0
6059	10922	17	39	15	0
6060	10922	24	4.5	35	0
6061	10923	42	14	10	0.2
6062	10923	43	46	10	0.2
6063	10923	67	14	24	0.2
6064	10924	10	31	20	0.1
6065	10924	28	45.6	30	0.1
6066	10924	75	7.75	6	0
6067	10925	36	19	25	0.15
6068	10925	52	7	12	0.15
6069	10926	11	21	2	0
6070	10926	13	6	10	0
6071	10926	19	9.2	7	0
6072	10926	72	34.8	10	0
6073	10927	20	81	5	0
6074	10927	52	7	5	0
6075	10927	76	18	20	0
6076	10928	47	9.5	5	0
6077	10928	76	18	5	0
6078	10929	21	10	60	0
6079	10929	75	7.75	49	0
6080	10929	77	13	15	0
6081	10930	21	10	36	0
6082	10930	27	43.9	25	0
6083	10930	55	24	25	0.2
6084	10930	58	13.25	30	0.2
6085	10931	13	6	42	0.15
6086	10931	57	19.5	30	0
6087	10932	16	17.45	30	0.1
6088	10932	62	49.3	14	0.1
6089	10932	72	34.8	16	0
6090	10932	75	7.75	20	0.1
6091	10933	53	32.8	2	0
6092	10933	61	28.5	30	0
6093	10934	6	25	20	0
6094	10935	1	18	21	0
6095	10935	18	62.5	4	0.25
6096	10935	23	9	8	0.25
6097	10936	36	19	30	0.2
6098	10937	28	45.6	8	0
6099	10937	34	14	20	0
6100	10938	13	6	20	0.25
6101	10938	43	46	24	0.25
6102	10938	60	34	49	0.25
6103	10938	71	21.5	35	0.25
6104	10939	2	19	10	0.15
6105	10939	67	14	40	0.15
6106	10940	7	30	8	0
6107	10940	13	6	20	0
6108	10941	31	12.5	44	0.25
6109	10941	62	49.3	30	0.25
6110	10941	68	12.5	80	0.25
6111	10941	72	34.8	50	0
6112	10942	49	20	28	0
6113	10943	13	6	15	0
6114	10943	22	21	21	0
6115	10943	46	12	15	0
6116	10944	11	21	5	0.25
6117	10944	44	19.45	18	0.25
6118	10944	56	38	18	0
6119	10945	13	6	20	0
6120	10945	31	12.5	10	0
6121	10946	10	31	25	0
6122	10946	24	4.5	25	0
6123	10946	77	13	40	0
6124	10947	59	55	4	0
6125	10948	50	16.25	9	0
6126	10948	51	53	40	0
6127	10948	55	24	4	0
6128	10949	6	25	12	0
6129	10949	10	31	30	0
6130	10949	17	39	6	0
6131	10949	62	49.3	60	0
6132	10950	4	22	5	0
6133	10951	33	2.5	15	0.05
6134	10951	41	9.65	6	0.05
6135	10951	75	7.75	50	0.05
6136	10952	6	25	16	0.05
6137	10952	28	45.6	2	0
6138	10953	20	81	50	0.05
6139	10953	31	12.5	50	0.05
6140	10954	16	17.45	28	0.15
6141	10954	31	12.5	25	0.15
6142	10954	45	9.5	30	0
6143	10954	60	34	24	0.15
6144	10955	75	7.75	12	0.2
6145	10956	21	10	12	0
6146	10956	47	9.5	14	0
6147	10956	51	53	8	0
6148	10957	30	25.89	30	0
6149	10957	35	18	40	0
6150	10957	64	33.25	8	0
6151	10958	5	21.35	20	0
6152	10958	7	30	6	0
6153	10958	72	34.8	5	0
6154	10959	75	7.75	20	0.15
6155	10960	24	4.5	10	0.25
6156	10960	41	9.65	24	0
6157	10961	52	7	6	0.05
6158	10961	76	18	60	0
6159	10962	7	30	45	0
6160	10962	13	6	77	0
6161	10962	53	32.8	20	0
6162	10962	69	36	9	0
6163	10962	76	18	44	0
6164	10963	60	34	2	0.15
6165	10964	18	62.5	6	0
6166	10964	38	263.5	5	0
6167	10964	69	36	10	0
6168	10965	51	53	16	0
6169	10966	37	26	8	0
6170	10966	56	38	12	0.15
6171	10966	62	49.3	12	0.15
6172	10967	19	9.2	12	0
6173	10967	49	20	40	0
6174	10968	12	38	30	0
6175	10968	24	4.5	30	0
6176	10968	64	33.25	4	0
6177	10969	46	12	9	0
6178	10970	52	7	40	0.2
6179	10971	29	123.79	14	0
6180	10972	17	39	6	0
6181	10972	33	2.5	7	0
6182	10973	26	31.23	5	0
6183	10973	41	9.65	6	0
6184	10973	75	7.75	10	0
6185	10974	63	43.9	10	0
6186	10975	8	40	16	0
6187	10975	75	7.75	10	0
6188	10976	28	45.6	20	0
6189	10977	39	18	30	0
6190	10977	47	9.5	30	0
6191	10977	51	53	10	0
6192	10977	63	43.9	20	0
6193	10978	8	40	20	0.15
6194	10978	21	10	40	0.15
6195	10978	40	18.4	10	0
6196	10978	44	19.45	6	0.15
6197	10979	7	30	18	0
6198	10979	12	38	20	0
6199	10979	24	4.5	80	0
6200	10979	27	43.9	30	0
6201	10979	31	12.5	24	0
6202	10979	63	43.9	35	0
6203	10980	75	7.75	40	0.2
6204	10981	38	263.5	60	0
6205	10982	7	30	20	0
6206	10982	43	46	9	0
6207	10983	13	6	84	0.15
6208	10983	57	19.5	15	0
6209	10984	16	17.45	55	0
6210	10984	24	4.5	20	0
6211	10984	36	19	40	0
6212	10985	16	17.45	36	0.1
6213	10985	18	62.5	8	0.1
6214	10985	32	32	35	0.1
6215	10986	11	21	30	0
6216	10986	20	81	15	0
6217	10986	76	18	10	0
6218	10986	77	13	15	0
6219	10987	7	30	60	0
6220	10987	43	46	6	0
6221	10987	72	34.8	20	0
6222	10988	7	30	60	0
6223	10988	62	49.3	40	0.1
6224	10989	6	25	40	0
6225	10989	11	21	15	0
6226	10989	41	9.65	4	0
6227	10990	21	10	65	0
6228	10990	34	14	60	0.15
6229	10990	55	24	65	0.15
6230	10990	61	28.5	66	0.15
6231	10991	2	19	50	0.2
6232	10991	70	15	20	0.2
6233	10991	76	18	90	0.2
6234	10992	72	34.8	2	0
6235	10993	29	123.79	50	0.25
6236	10993	41	9.65	35	0.25
6237	10994	59	55	18	0.05
6238	10995	51	53	20	0
6239	10995	60	34	4	0
6240	10996	42	14	40	0
6241	10997	32	32	50	0
6242	10997	46	12	20	0.25
6243	10997	52	7	20	0.25
6244	10998	24	4.5	12	0
6245	10998	61	28.5	7	0
6246	10998	74	10	20	0
6247	10998	75	7.75	30	0
6248	10999	41	9.65	20	0.05
6249	10999	51	53	15	0.05
6250	10999	77	13	21	0.05
6251	11000	4	22	25	0.25
6252	11000	24	4.5	30	0.25
6253	11000	77	13	30	0
6254	11001	7	30	60	0
6255	11001	22	21	25	0
6256	11001	46	12	25	0
6257	11001	55	24	6	0
6258	11002	13	6	56	0
6259	11002	35	18	15	0.15
6260	11002	42	14	24	0.15
6261	11002	55	24	40	0
6262	11003	1	18	4	0
6263	11003	40	18.4	10	0
6264	11003	52	7	10	0
6265	11004	26	31.23	6	0
6266	11004	76	18	6	0
6267	11005	1	18	2	0
6268	11005	59	55	10	0
6269	11006	1	18	8	0
6270	11006	29	123.79	2	0.25
6271	11007	8	40	30	0
6272	11007	29	123.79	10	0
6273	11007	42	14	14	0
6274	11008	28	45.6	70	0.05
6275	11008	34	14	90	0.05
6276	11008	71	21.5	21	0
6277	11009	24	4.5	12	0
6278	11009	36	19	18	0.25
6279	11009	60	34	9	0
6280	11010	7	30	20	0
6281	11010	24	4.5	10	0
6282	11011	58	13.25	40	0.05
6283	11011	71	21.5	20	0
6284	11012	19	9.2	50	0.05
6285	11012	60	34	36	0.05
6286	11012	71	21.5	60	0.05
6287	11013	23	9	10	0
6288	11013	42	14	4	0
6289	11013	45	9.5	20	0
6290	11013	68	12.5	2	0
6291	11014	41	9.65	28	0.1
6292	11015	30	25.89	15	0
6293	11015	77	13	18	0
6294	11016	31	12.5	15	0
6295	11016	36	19	16	0
6296	11017	3	10	25	0
6297	11017	59	55	110	0
6298	11017	70	15	30	0
6299	11018	12	38	20	0
6300	11018	18	62.5	10	0
6301	11018	56	38	5	0
6302	11019	46	12	3	0
6303	11019	49	20	2	0
6304	11020	10	31	24	0.15
6305	11021	2	19	11	0.25
6306	11021	20	81	15	0
6307	11021	26	31.23	63	0
6308	11021	51	53	44	0.25
6309	11021	72	34.8	35	0
6310	11022	19	9.2	35	0
6311	11022	69	36	30	0
6312	11023	7	30	4	0
6313	11023	43	46	30	0
6314	11024	26	31.23	12	0
6315	11024	33	2.5	30	0
6316	11024	65	21.05	21	0
6317	11024	71	21.5	50	0
6318	11025	1	18	10	0.1
6319	11025	13	6	20	0.1
6320	11026	18	62.5	8	0
6321	11026	51	53	10	0
6322	11027	24	4.5	30	0.25
6323	11027	62	49.3	21	0.25
6324	11028	55	24	35	0
6325	11028	59	55	24	0
6326	11029	56	38	20	0
6327	11029	63	43.9	12	0
6328	11030	2	19	100	0.25
6329	11030	5	21.35	70	0
6330	11030	29	123.79	60	0.25
6331	11030	59	55	100	0.25
6332	11031	1	18	45	0
6333	11031	13	6	80	0
6334	11031	24	4.5	21	0
6335	11031	64	33.25	20	0
6336	11031	71	21.5	16	0
6337	11032	36	19	35	0
6338	11032	38	263.5	25	0
6339	11032	59	55	30	0
6340	11033	53	32.8	70	0.1
6341	11033	69	36	36	0.1
6342	11034	21	10	15	0.1
6343	11034	44	19.45	12	0
6344	11034	61	28.5	6	0
6345	11035	1	18	10	0
6346	11035	35	18	60	0
6347	11035	42	14	30	0
6348	11035	54	7.45	10	0
6349	11036	13	6	7	0
6350	11036	59	55	30	0
6351	11037	70	15	4	0
6352	11038	40	18.4	5	0.2
6353	11038	52	7	2	0
6354	11038	71	21.5	30	0
6355	11039	28	45.6	20	0
6356	11039	35	18	24	0
6357	11039	49	20	60	0
6358	11039	57	19.5	28	0
6359	11040	21	10	20	0
6360	11041	2	19	30	0.2
6361	11041	63	43.9	30	0
6362	11042	44	19.45	15	0
6363	11042	61	28.5	4	0
6364	11043	11	21	10	0
6365	11044	62	49.3	12	0
6366	11045	33	2.5	15	0
6367	11045	51	53	24	0
6368	11046	12	38	20	0.05
6369	11046	32	32	15	0.05
6370	11046	35	18	18	0.05
6371	11047	1	18	25	0.25
6372	11047	5	21.35	30	0.25
6373	11048	68	12.5	42	0
6374	11049	2	19	10	0.2
6375	11049	12	38	4	0.2
6376	11050	76	18	50	0.1
6377	11051	24	4.5	10	0.2
6378	11052	43	46	30	0.2
6379	11052	61	28.5	10	0.2
6380	11053	18	62.5	35	0.2
6381	11053	32	32	20	0
6382	11053	64	33.25	25	0.2
6383	11054	33	2.5	10	0
6384	11054	67	14	20	0
6385	11055	24	4.5	15	0
6386	11055	25	14	15	0
6387	11055	51	53	20	0
6388	11055	57	19.5	20	0
6389	11056	7	30	40	0
6390	11056	55	24	35	0
6391	11056	60	34	50	0
6392	11057	70	15	3	0
6393	11058	21	10	3	0
6394	11058	60	34	21	0
6395	11058	61	28.5	4	0
6396	11059	13	6	30	0
6397	11059	17	39	12	0
6398	11059	60	34	35	0
6399	11060	60	34	4	0
6400	11060	77	13	10	0
6401	11061	60	34	15	0
6402	11062	53	32.8	10	0.2
6403	11062	70	15	12	0.2
6404	11063	34	14	30	0
6405	11063	40	18.4	40	0.1
6406	11063	41	9.65	30	0.1
6407	11064	17	39	77	0.1
6408	11064	41	9.65	12	0
6409	11064	53	32.8	25	0.1
6410	11064	55	24	4	0.1
6411	11064	68	12.5	55	0
6412	11065	30	25.89	4	0.25
6413	11065	54	7.45	20	0.25
6414	11066	16	17.45	3	0
6415	11066	19	9.2	42	0
6416	11066	34	14	35	0
6417	11067	41	9.65	9	0
6418	11068	28	45.6	8	0.15
6419	11068	43	46	36	0.15
6420	11068	77	13	28	0.15
6421	11069	39	18	20	0
6422	11070	1	18	40	0.15
6423	11070	2	19	20	0.15
6424	11070	16	17.45	30	0.15
6425	11070	31	12.5	20	0
6426	11071	7	30	15	0.05
6427	11071	13	6	10	0.05
6428	11072	2	19	8	0
6429	11072	41	9.65	40	0
6430	11072	50	16.25	22	0
6431	11072	64	33.25	130	0
6432	11073	11	21	10	0
6433	11073	24	4.5	20	0
6434	11074	16	17.45	14	0.05
6435	11075	2	19	10	0.15
6436	11075	46	12	30	0.15
6437	11075	76	18	2	0.15
6438	11076	6	25	20	0.25
6439	11076	14	23.25	20	0.25
6440	11076	19	9.2	10	0.25
6441	11077	2	19	24	0.2
6442	11077	3	10	4	0
6443	11077	4	22	1	0
6444	11077	6	25	1	0.02
6445	11077	7	30	1	0.05
6446	11077	8	40	2	0.1
6447	11077	10	31	1	0
6448	11077	12	38	2	0.05
6449	11077	13	6	4	0
6450	11077	14	23.25	1	0.03
6451	11077	16	17.45	2	0.03
6452	11077	20	81	1	0.04
6453	11077	23	9	2	0
6454	11077	32	32	1	0
6455	11077	39	18	2	0.05
6456	11077	41	9.65	3	0
6457	11077	46	12	3	0.02
6458	11077	52	7	2	0
6459	11077	55	24	2	0
6460	11077	60	34	2	0.06
6461	11077	64	33.25	2	0.03
6462	11077	66	17	1	0
6463	11077	73	15	2	0.01
6464	11077	75	7.75	4	0
6465	11077	77	13	2	0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_adress, ship_city, ship_region, ship_postal_code, ship_country) FROM stdin;
1	10248	VINET	5	1996-07-04 00:00:00	1996-08-01 00:00:00	1996-07-16 00:00:00.000	3	32.38	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
2	10249	TOMSP	6	1996-07-05 00:00:00	1996-08-16 00:00:00	1996-07-10 00:00:00.000	1	11.61	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
3	10250	HANAR	4	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-12 00:00:00.000	2	65.83	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
4	10251	VICTE	3	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-15 00:00:00.000	1	41.34	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
5	10252	SUPRD	4	1996-07-09 00:00:00	1996-08-06 00:00:00	1996-07-11 00:00:00.000	2	51.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
6	10253	HANAR	3	1996-07-10 00:00:00	1996-07-24 00:00:00	1996-07-16 00:00:00.000	2	58.17	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
7	10254	CHOPS	5	1996-07-11 00:00:00	1996-08-08 00:00:00	1996-07-23 00:00:00.000	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
8	10255	RICSU	9	1996-07-12 00:00:00	1996-08-09 00:00:00	1996-07-15 00:00:00.000	3	148.33	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
9	10256	WELLI	3	1996-07-15 00:00:00	1996-08-12 00:00:00	1996-07-17 00:00:00.000	2	13.97	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10	10257	HILAA	4	1996-07-16 00:00:00	1996-08-13 00:00:00	1996-07-22 00:00:00.000	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
11	10258	ERNSH	1	1996-07-17 00:00:00	1996-08-14 00:00:00	1996-07-23 00:00:00.000	1	140.51	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
12	10259	CENTC	4	1996-07-18 00:00:00	1996-08-15 00:00:00	1996-07-25 00:00:00.000	3	3.25	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	NULL	05022	Mexico
13	10260	OTTIK	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-29 00:00:00.000	1	55.09	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
14	10261	QUEDE	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-30 00:00:00.000	2	3.05	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
15	10262	RATTC	8	1996-07-22 00:00:00	1996-08-19 00:00:00	1996-07-25 00:00:00.000	3	48.29	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
16	10263	ERNSH	9	1996-07-23 00:00:00	1996-08-20 00:00:00	1996-07-31 00:00:00.000	3	146.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
17	10264	FOLKO	6	1996-07-24 00:00:00	1996-08-21 00:00:00	1996-08-23 00:00:00.000	3	3.67	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
18	10265	BLONP	2	1996-07-25 00:00:00	1996-08-22 00:00:00	1996-08-12 00:00:00.000	1	55.28	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
19	10266	WARTH	3	1996-07-26 00:00:00	1996-09-06 00:00:00	1996-07-31 00:00:00.000	3	25.73	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
20	10267	FRANK	4	1996-07-29 00:00:00	1996-08-26 00:00:00	1996-08-06 00:00:00.000	1	208.58	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
21	10268	GROSR	8	1996-07-30 00:00:00	1996-08-27 00:00:00	1996-08-02 00:00:00.000	3	66.29	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
22	10269	WHITC	5	1996-07-31 00:00:00	1996-08-14 00:00:00	1996-08-09 00:00:00.000	1	4.56	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
23	10270	WARTH	1	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-02 00:00:00.000	1	136.54	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
24	10271	SPLIR	6	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-30 00:00:00.000	2	4.54	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
25	10272	RATTC	6	1996-08-02 00:00:00	1996-08-30 00:00:00	1996-08-06 00:00:00.000	2	98.03	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
26	10273	QUICK	3	1996-08-05 00:00:00	1996-09-02 00:00:00	1996-08-12 00:00:00.000	3	76.07	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
27	10274	VINET	6	1996-08-06 00:00:00	1996-09-03 00:00:00	1996-08-16 00:00:00.000	1	6.01	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
28	10275	MAGAA	1	1996-08-07 00:00:00	1996-09-04 00:00:00	1996-08-09 00:00:00.000	1	26.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
29	10276	TORTU	8	1996-08-08 00:00:00	1996-08-22 00:00:00	1996-08-14 00:00:00.000	3	13.84	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
30	10277	MORGK	2	1996-08-09 00:00:00	1996-09-06 00:00:00	1996-08-13 00:00:00.000	3	125.77	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
31	10278	BERGS	8	1996-08-12 00:00:00	1996-09-09 00:00:00	1996-08-16 00:00:00.000	2	92.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
32	10279	LEHMS	8	1996-08-13 00:00:00	1996-09-10 00:00:00	1996-08-16 00:00:00.000	2	25.83	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
33	10280	BERGS	2	1996-08-14 00:00:00	1996-09-11 00:00:00	1996-09-12 00:00:00.000	1	8.98	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
34	10281	ROMEY	4	1996-08-14 00:00:00	1996-08-28 00:00:00	1996-08-21 00:00:00.000	1	2.94	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
35	10282	ROMEY	4	1996-08-15 00:00:00	1996-09-12 00:00:00	1996-08-21 00:00:00.000	1	12.69	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
36	10283	LILAS	3	1996-08-16 00:00:00	1996-09-13 00:00:00	1996-08-23 00:00:00.000	3	84.81	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
37	10284	LEHMS	4	1996-08-19 00:00:00	1996-09-16 00:00:00	1996-08-27 00:00:00.000	1	76.56	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
38	10285	QUICK	1	1996-08-20 00:00:00	1996-09-17 00:00:00	1996-08-26 00:00:00.000	2	76.83	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
39	10286	QUICK	8	1996-08-21 00:00:00	1996-09-18 00:00:00	1996-08-30 00:00:00.000	3	229.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
40	10287	RICAR	8	1996-08-22 00:00:00	1996-09-19 00:00:00	1996-08-28 00:00:00.000	3	12.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
41	10288	REGGC	4	1996-08-23 00:00:00	1996-09-20 00:00:00	1996-09-03 00:00:00.000	1	7.45	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
42	10289	BSBEV	7	1996-08-26 00:00:00	1996-09-23 00:00:00	1996-08-28 00:00:00.000	3	22.77	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
43	10290	COMMI	8	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-03 00:00:00.000	1	79.7	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
44	10291	QUEDE	6	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-04 00:00:00.000	2	6.4	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
45	10292	TRADH	1	1996-08-28 00:00:00	1996-09-25 00:00:00	1996-09-02 00:00:00.000	2	1.35	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
46	10293	TORTU	1	1996-08-29 00:00:00	1996-09-26 00:00:00	1996-09-11 00:00:00.000	3	21.18	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
47	10294	RATTC	4	1996-08-30 00:00:00	1996-09-27 00:00:00	1996-09-05 00:00:00.000	2	147.26	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
48	10295	VINET	2	1996-09-02 00:00:00	1996-09-30 00:00:00	1996-09-10 00:00:00.000	2	1.15	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
49	10296	LILAS	6	1996-09-03 00:00:00	1996-10-01 00:00:00	1996-09-11 00:00:00.000	1	0.12	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
50	10297	BLONP	5	1996-09-04 00:00:00	1996-10-16 00:00:00	1996-09-10 00:00:00.000	2	5.74	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
51	10298	HUNGO	6	1996-09-05 00:00:00	1996-10-03 00:00:00	1996-09-11 00:00:00.000	2	168.22	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
52	10299	RICAR	4	1996-09-06 00:00:00	1996-10-04 00:00:00	1996-09-13 00:00:00.000	2	29.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
53	10300	MAGAA	2	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-18 00:00:00.000	2	17.68	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
54	10301	WANDK	8	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-17 00:00:00.000	2	45.08	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
55	10302	SUPRD	4	1996-09-10 00:00:00	1996-10-08 00:00:00	1996-10-09 00:00:00.000	2	6.27	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
56	10303	GODOS	7	1996-09-11 00:00:00	1996-10-09 00:00:00	1996-09-18 00:00:00.000	2	107.83	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
57	10304	TORTU	1	1996-09-12 00:00:00	1996-10-10 00:00:00	1996-09-17 00:00:00.000	2	63.79	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
58	10305	OLDWO	8	1996-09-13 00:00:00	1996-10-11 00:00:00	1996-10-09 00:00:00.000	3	257.62	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
59	10306	ROMEY	1	1996-09-16 00:00:00	1996-10-14 00:00:00	1996-09-23 00:00:00.000	3	7.56	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
60	10307	LONEP	2	1996-09-17 00:00:00	1996-10-15 00:00:00	1996-09-25 00:00:00.000	2	0.56	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
61	10308	ANATR	7	1996-09-18 00:00:00	1996-10-16 00:00:00	1996-09-24 00:00:00.000	3	1.61	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
62	10309	HUNGO	3	1996-09-19 00:00:00	1996-10-17 00:00:00	1996-10-23 00:00:00.000	1	47.3	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
63	10310	THEBI	8	1996-09-20 00:00:00	1996-10-18 00:00:00	1996-09-27 00:00:00.000	2	17.52	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
64	10311	DUMON	1	1996-09-20 00:00:00	1996-10-04 00:00:00	1996-09-26 00:00:00.000	3	24.69	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
65	10312	WANDK	2	1996-09-23 00:00:00	1996-10-21 00:00:00	1996-10-03 00:00:00.000	2	40.26	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
66	10313	QUICK	2	1996-09-24 00:00:00	1996-10-22 00:00:00	1996-10-04 00:00:00.000	2	1.96	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
67	10314	RATTC	1	1996-09-25 00:00:00	1996-10-23 00:00:00	1996-10-04 00:00:00.000	2	74.16	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
68	10315	ISLAT	4	1996-09-26 00:00:00	1996-10-24 00:00:00	1996-10-03 00:00:00.000	2	41.76	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
69	10316	RATTC	1	1996-09-27 00:00:00	1996-10-25 00:00:00	1996-10-08 00:00:00.000	3	150.15	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
70	10317	LONEP	6	1996-09-30 00:00:00	1996-10-28 00:00:00	1996-10-10 00:00:00.000	1	12.69	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
71	10318	ISLAT	8	1996-10-01 00:00:00	1996-10-29 00:00:00	1996-10-04 00:00:00.000	2	4.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
72	10319	TORTU	7	1996-10-02 00:00:00	1996-10-30 00:00:00	1996-10-11 00:00:00.000	3	64.5	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
73	10320	WARTH	5	1996-10-03 00:00:00	1996-10-17 00:00:00	1996-10-18 00:00:00.000	3	34.57	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
74	10321	ISLAT	3	1996-10-03 00:00:00	1996-10-31 00:00:00	1996-10-11 00:00:00.000	2	3.43	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
75	10322	PERIC	7	1996-10-04 00:00:00	1996-11-01 00:00:00	1996-10-23 00:00:00.000	3	0.4	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
76	10323	KOENE	4	1996-10-07 00:00:00	1996-11-04 00:00:00	1996-10-14 00:00:00.000	1	4.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
77	10324	SAVEA	9	1996-10-08 00:00:00	1996-11-05 00:00:00	1996-10-10 00:00:00.000	1	214.27	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
78	10325	KOENE	1	1996-10-09 00:00:00	1996-10-23 00:00:00	1996-10-14 00:00:00.000	3	64.86	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
79	10326	BOLID	4	1996-10-10 00:00:00	1996-11-07 00:00:00	1996-10-14 00:00:00.000	2	77.92	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
80	10327	FOLKO	2	1996-10-11 00:00:00	1996-11-08 00:00:00	1996-10-14 00:00:00.000	1	63.36	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
81	10328	FURIB	4	1996-10-14 00:00:00	1996-11-11 00:00:00	1996-10-17 00:00:00.000	3	87.03	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
82	10329	SPLIR	4	1996-10-15 00:00:00	1996-11-26 00:00:00	1996-10-23 00:00:00.000	2	191.67	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
83	10330	LILAS	3	1996-10-16 00:00:00	1996-11-13 00:00:00	1996-10-28 00:00:00.000	1	12.75	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
84	10331	BONAP	9	1996-10-16 00:00:00	1996-11-27 00:00:00	1996-10-21 00:00:00.000	1	10.19	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
85	10332	MEREP	3	1996-10-17 00:00:00	1996-11-28 00:00:00	1996-10-21 00:00:00.000	2	52.84	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
86	10333	WARTH	5	1996-10-18 00:00:00	1996-11-15 00:00:00	1996-10-25 00:00:00.000	3	0.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
87	10334	VICTE	8	1996-10-21 00:00:00	1996-11-18 00:00:00	1996-10-28 00:00:00.000	2	8.56	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
88	10335	HUNGO	7	1996-10-22 00:00:00	1996-11-19 00:00:00	1996-10-24 00:00:00.000	2	42.11	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
89	10336	PRINI	7	1996-10-23 00:00:00	1996-11-20 00:00:00	1996-10-25 00:00:00.000	2	15.51	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
90	10337	FRANK	4	1996-10-24 00:00:00	1996-11-21 00:00:00	1996-10-29 00:00:00.000	3	108.26	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
91	10338	OLDWO	4	1996-10-25 00:00:00	1996-11-22 00:00:00	1996-10-29 00:00:00.000	3	84.21	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
92	10339	MEREP	2	1996-10-28 00:00:00	1996-11-25 00:00:00	1996-11-04 00:00:00.000	2	15.66	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
93	10340	BONAP	1	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-08 00:00:00.000	3	166.31	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
94	10341	SIMOB	7	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-05 00:00:00.000	3	26.78	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
95	10342	FRANK	4	1996-10-30 00:00:00	1996-11-13 00:00:00	1996-11-04 00:00:00.000	2	54.83	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
96	10343	LEHMS	4	1996-10-31 00:00:00	1996-11-28 00:00:00	1996-11-06 00:00:00.000	1	110.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
97	10344	WHITC	4	1996-11-01 00:00:00	1996-11-29 00:00:00	1996-11-05 00:00:00.000	2	23.29	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
98	10345	QUICK	2	1996-11-04 00:00:00	1996-12-02 00:00:00	1996-11-11 00:00:00.000	2	249.06	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
99	10346	RATTC	3	1996-11-05 00:00:00	1996-12-17 00:00:00	1996-11-08 00:00:00.000	3	142.08	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
100	10347	FAMIA	4	1996-11-06 00:00:00	1996-12-04 00:00:00	1996-11-08 00:00:00.000	3	3.1	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
101	10348	WANDK	4	1996-11-07 00:00:00	1996-12-05 00:00:00	1996-11-15 00:00:00.000	2	0.78	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
102	10349	SPLIR	7	1996-11-08 00:00:00	1996-12-06 00:00:00	1996-11-15 00:00:00.000	1	8.63	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
103	10350	LAMAI	6	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-12-03 00:00:00.000	2	64.19	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
104	10351	ERNSH	1	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-11-20 00:00:00.000	1	162.33	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
105	10352	FURIB	3	1996-11-12 00:00:00	1996-11-26 00:00:00	1996-11-18 00:00:00.000	3	1.3	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
106	10353	PICCO	7	1996-11-13 00:00:00	1996-12-11 00:00:00	1996-11-25 00:00:00.000	3	360.63	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
107	10354	PERIC	8	1996-11-14 00:00:00	1996-12-12 00:00:00	1996-11-20 00:00:00.000	3	53.8	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
108	10355	AROUT	6	1996-11-15 00:00:00	1996-12-13 00:00:00	1996-11-20 00:00:00.000	1	41.95	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
109	10356	WANDK	6	1996-11-18 00:00:00	1996-12-16 00:00:00	1996-11-27 00:00:00.000	2	36.71	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
110	10357	LILAS	1	1996-11-19 00:00:00	1996-12-17 00:00:00	1996-12-02 00:00:00.000	3	34.88	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
111	10358	LAMAI	5	1996-11-20 00:00:00	1996-12-18 00:00:00	1996-11-27 00:00:00.000	1	19.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
112	10359	SEVES	5	1996-11-21 00:00:00	1996-12-19 00:00:00	1996-11-26 00:00:00.000	3	288.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
113	10360	BLONP	4	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-02 00:00:00.000	3	131.7	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
114	10361	QUICK	1	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-03 00:00:00.000	2	183.17	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
115	10362	BONAP	3	1996-11-25 00:00:00	1996-12-23 00:00:00	1996-11-28 00:00:00.000	1	96.04	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
116	10363	DRACD	4	1996-11-26 00:00:00	1996-12-24 00:00:00	1996-12-04 00:00:00.000	3	30.54	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
117	10364	EASTC	1	1996-11-26 00:00:00	1997-01-07 00:00:00	1996-12-04 00:00:00.000	1	71.97	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
118	10365	ANTON	3	1996-11-27 00:00:00	1996-12-25 00:00:00	1996-12-02 00:00:00.000	2	22	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
119	10366	GALED	8	1996-11-28 00:00:00	1997-01-09 00:00:00	1996-12-30 00:00:00.000	2	10.14	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
120	10367	VAFFE	7	1996-11-28 00:00:00	1996-12-26 00:00:00	1996-12-02 00:00:00.000	3	13.55	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
121	10368	ERNSH	2	1996-11-29 00:00:00	1996-12-27 00:00:00	1996-12-02 00:00:00.000	2	101.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
122	10369	SPLIR	8	1996-12-02 00:00:00	1996-12-30 00:00:00	1996-12-09 00:00:00.000	2	195.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
123	10370	CHOPS	6	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-27 00:00:00.000	2	1.17	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
124	10371	LAMAI	1	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-24 00:00:00.000	1	0.45	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
125	10372	QUEEN	5	1996-12-04 00:00:00	1997-01-01 00:00:00	1996-12-09 00:00:00.000	2	890.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
126	10373	HUNGO	4	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-11 00:00:00.000	3	124.12	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
127	10374	WOLZA	1	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-09 00:00:00.000	3	3.94	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
128	10375	HUNGC	3	1996-12-06 00:00:00	1997-01-03 00:00:00	1996-12-09 00:00:00.000	2	20.12	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
129	10376	MEREP	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	2	20.39	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
130	10377	SEVES	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	3	22.21	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
131	10378	FOLKO	5	1996-12-10 00:00:00	1997-01-07 00:00:00	1996-12-19 00:00:00.000	3	5.44	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
132	10379	QUEDE	2	1996-12-11 00:00:00	1997-01-08 00:00:00	1996-12-13 00:00:00.000	1	45.03	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
133	10380	HUNGO	8	1996-12-12 00:00:00	1997-01-09 00:00:00	1997-01-16 00:00:00.000	3	35.03	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
134	10381	LILAS	3	1996-12-12 00:00:00	1997-01-09 00:00:00	1996-12-13 00:00:00.000	3	7.99	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
135	10382	ERNSH	4	1996-12-13 00:00:00	1997-01-10 00:00:00	1996-12-16 00:00:00.000	1	94.77	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
136	10383	AROUT	8	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-18 00:00:00.000	3	34.24	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
137	10384	BERGS	3	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-20 00:00:00.000	3	168.64	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
138	10385	SPLIR	1	1996-12-17 00:00:00	1997-01-14 00:00:00	1996-12-23 00:00:00.000	2	30.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
139	10386	FAMIA	9	1996-12-18 00:00:00	1997-01-01 00:00:00	1996-12-25 00:00:00.000	3	13.99	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
140	10387	SANTG	1	1996-12-18 00:00:00	1997-01-15 00:00:00	1996-12-20 00:00:00.000	2	93.63	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
141	10388	SEVES	2	1996-12-19 00:00:00	1997-01-16 00:00:00	1996-12-20 00:00:00.000	1	34.86	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
142	10389	BOTTM	4	1996-12-20 00:00:00	1997-01-17 00:00:00	1996-12-24 00:00:00.000	2	47.42	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
143	10390	ERNSH	6	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-26 00:00:00.000	1	126.38	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
144	10391	DRACD	3	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-31 00:00:00.000	3	5.45	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
145	10392	PICCO	2	1996-12-24 00:00:00	1997-01-21 00:00:00	1997-01-01 00:00:00.000	3	122.46	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
146	10393	SAVEA	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	126.56	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
147	10394	HUNGC	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	30.34	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
148	10395	HILAA	6	1996-12-26 00:00:00	1997-01-23 00:00:00	1997-01-03 00:00:00.000	1	184.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
149	10396	FRANK	1	1996-12-27 00:00:00	1997-01-10 00:00:00	1997-01-06 00:00:00.000	3	135.35	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
150	10397	PRINI	5	1996-12-27 00:00:00	1997-01-24 00:00:00	1997-01-02 00:00:00.000	1	60.26	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
151	10398	SAVEA	2	1996-12-30 00:00:00	1997-01-27 00:00:00	1997-01-09 00:00:00.000	3	89.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
152	10399	VAFFE	8	1996-12-31 00:00:00	1997-01-14 00:00:00	1997-01-08 00:00:00.000	3	27.36	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
153	10400	EASTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-16 00:00:00.000	3	83.93	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
154	10401	RATTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-10 00:00:00.000	1	12.51	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
155	10402	ERNSH	8	1997-01-02 00:00:00	1997-02-13 00:00:00	1997-01-10 00:00:00.000	2	67.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
156	10403	ERNSH	4	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-09 00:00:00.000	3	73.79	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
157	10404	MAGAA	2	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-08 00:00:00.000	1	155.97	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
158	10405	LINOD	1	1997-01-06 00:00:00	1997-02-03 00:00:00	1997-01-22 00:00:00.000	1	34.82	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
159	10406	QUEEN	7	1997-01-07 00:00:00	1997-02-18 00:00:00	1997-01-13 00:00:00.000	1	108.04	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
160	10407	OTTIK	2	1997-01-07 00:00:00	1997-02-04 00:00:00	1997-01-30 00:00:00.000	2	91.48	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
161	10408	FOLIG	8	1997-01-08 00:00:00	1997-02-05 00:00:00	1997-01-14 00:00:00.000	1	11.26	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
162	10409	OCEAN	3	1997-01-09 00:00:00	1997-02-06 00:00:00	1997-01-14 00:00:00.000	1	29.83	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
163	10410	BOTTM	3	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-15 00:00:00.000	3	2.4	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
164	10411	BOTTM	9	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-21 00:00:00.000	3	23.65	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
165	10412	WARTH	8	1997-01-13 00:00:00	1997-02-10 00:00:00	1997-01-15 00:00:00.000	2	3.77	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
166	10413	LAMAI	3	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-16 00:00:00.000	2	95.66	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
167	10414	FAMIA	2	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-17 00:00:00.000	3	21.48	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
168	10415	HUNGC	3	1997-01-15 00:00:00	1997-02-12 00:00:00	1997-01-24 00:00:00.000	1	0.2	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
169	10416	WARTH	8	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-27 00:00:00.000	3	22.72	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
170	10417	SIMOB	4	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-28 00:00:00.000	3	70.29	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
171	10418	QUICK	4	1997-01-17 00:00:00	1997-02-14 00:00:00	1997-01-24 00:00:00.000	1	17.55	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
172	10419	RICSU	4	1997-01-20 00:00:00	1997-02-17 00:00:00	1997-01-30 00:00:00.000	2	137.35	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
173	10420	WELLI	3	1997-01-21 00:00:00	1997-02-18 00:00:00	1997-01-27 00:00:00.000	1	44.12	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
174	10421	QUEDE	8	1997-01-21 00:00:00	1997-03-04 00:00:00	1997-01-27 00:00:00.000	1	99.23	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
175	10422	FRANS	2	1997-01-22 00:00:00	1997-02-19 00:00:00	1997-01-31 00:00:00.000	1	3.02	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
176	10423	GOURL	6	1997-01-23 00:00:00	1997-02-06 00:00:00	1997-02-24 00:00:00.000	3	24.5	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
177	10424	MEREP	7	1997-01-23 00:00:00	1997-02-20 00:00:00	1997-01-27 00:00:00.000	2	370.61	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
178	10425	LAMAI	6	1997-01-24 00:00:00	1997-02-21 00:00:00	1997-02-14 00:00:00.000	2	7.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
179	10426	GALED	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-02-06 00:00:00.000	1	18.69	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
180	10427	PICCO	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-03-03 00:00:00.000	2	31.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
181	10428	REGGC	7	1997-01-28 00:00:00	1997-02-25 00:00:00	1997-02-04 00:00:00.000	1	11.09	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
182	10429	HUNGO	3	1997-01-29 00:00:00	1997-03-12 00:00:00	1997-02-07 00:00:00.000	2	56.63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
183	10430	ERNSH	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-03 00:00:00.000	1	458.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
184	10431	BOTTM	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-07 00:00:00.000	2	44.17	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
185	10432	SPLIR	3	1997-01-31 00:00:00	1997-02-14 00:00:00	1997-02-07 00:00:00.000	2	4.34	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
186	10433	PRINI	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-03-04 00:00:00.000	3	73.83	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
187	10434	FOLKO	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-02-13 00:00:00.000	2	17.92	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
188	10435	CONSH	8	1997-02-04 00:00:00	1997-03-18 00:00:00	1997-02-07 00:00:00.000	2	9.21	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
189	10436	BLONP	3	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-11 00:00:00.000	2	156.66	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
190	10437	WARTH	8	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-12 00:00:00.000	1	19.97	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
191	10438	TOMSP	3	1997-02-06 00:00:00	1997-03-06 00:00:00	1997-02-14 00:00:00.000	2	8.24	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
192	10439	MEREP	6	1997-02-07 00:00:00	1997-03-07 00:00:00	1997-02-10 00:00:00.000	3	4.07	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
193	10440	SAVEA	4	1997-02-10 00:00:00	1997-03-10 00:00:00	1997-02-28 00:00:00.000	2	86.53	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
194	10441	OLDWO	3	1997-02-10 00:00:00	1997-03-24 00:00:00	1997-03-14 00:00:00.000	2	73.02	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
195	10442	ERNSH	3	1997-02-11 00:00:00	1997-03-11 00:00:00	1997-02-18 00:00:00.000	2	47.94	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
196	10443	REGGC	8	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-14 00:00:00.000	1	13.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
197	10444	BERGS	3	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-21 00:00:00.000	3	3.5	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
198	10445	BERGS	3	1997-02-13 00:00:00	1997-03-13 00:00:00	1997-02-20 00:00:00.000	1	9.3	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
199	10446	TOMSP	6	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-02-19 00:00:00.000	1	14.68	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
200	10447	RICAR	4	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-03-07 00:00:00.000	2	68.66	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
201	10448	RANCH	4	1997-02-17 00:00:00	1997-03-17 00:00:00	1997-02-24 00:00:00.000	2	38.82	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
202	10449	BLONP	3	1997-02-18 00:00:00	1997-03-18 00:00:00	1997-02-27 00:00:00.000	2	53.3	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
203	10450	VICTE	8	1997-02-19 00:00:00	1997-03-19 00:00:00	1997-03-11 00:00:00.000	2	7.23	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
204	10451	QUICK	4	1997-02-19 00:00:00	1997-03-05 00:00:00	1997-03-12 00:00:00.000	3	189.09	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
205	10452	SAVEA	8	1997-02-20 00:00:00	1997-03-20 00:00:00	1997-02-26 00:00:00.000	1	140.26	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
206	10453	AROUT	1	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-26 00:00:00.000	2	25.36	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
207	10454	LAMAI	4	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-25 00:00:00.000	3	2.74	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
208	10455	WARTH	8	1997-02-24 00:00:00	1997-04-07 00:00:00	1997-03-03 00:00:00.000	2	180.45	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
209	10456	KOENE	8	1997-02-25 00:00:00	1997-04-08 00:00:00	1997-02-28 00:00:00.000	2	8.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
210	10457	KOENE	2	1997-02-25 00:00:00	1997-03-25 00:00:00	1997-03-03 00:00:00.000	1	11.57	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
211	10458	SUPRD	7	1997-02-26 00:00:00	1997-03-26 00:00:00	1997-03-04 00:00:00.000	3	147.06	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
212	10459	VICTE	4	1997-02-27 00:00:00	1997-03-27 00:00:00	1997-02-28 00:00:00.000	2	25.09	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
213	10460	FOLKO	8	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-03 00:00:00.000	1	16.27	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
214	10461	LILAS	1	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-05 00:00:00.000	3	148.61	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
215	10462	CONSH	2	1997-03-03 00:00:00	1997-03-31 00:00:00	1997-03-18 00:00:00.000	1	6.17	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
216	10463	SUPRD	5	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-06 00:00:00.000	3	14.78	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
217	10464	FURIB	4	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-14 00:00:00.000	2	89	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
218	10465	VAFFE	1	1997-03-05 00:00:00	1997-04-02 00:00:00	1997-03-14 00:00:00.000	3	145.04	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
219	10466	COMMI	4	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-13 00:00:00.000	1	11.93	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
220	10467	MAGAA	8	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-11 00:00:00.000	2	4.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
221	10468	KOENE	3	1997-03-07 00:00:00	1997-04-04 00:00:00	1997-03-12 00:00:00.000	3	44.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
222	10469	WHITC	1	1997-03-10 00:00:00	1997-04-07 00:00:00	1997-03-14 00:00:00.000	1	60.18	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
223	10470	BONAP	4	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-14 00:00:00.000	2	64.56	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
224	10471	BSBEV	2	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-18 00:00:00.000	3	45.59	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
225	10472	SEVES	8	1997-03-12 00:00:00	1997-04-09 00:00:00	1997-03-19 00:00:00.000	1	4.2	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
226	10473	ISLAT	1	1997-03-13 00:00:00	1997-03-27 00:00:00	1997-03-21 00:00:00.000	3	16.37	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
227	10474	PERIC	5	1997-03-13 00:00:00	1997-04-10 00:00:00	1997-03-21 00:00:00.000	2	83.49	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
228	10475	SUPRD	9	1997-03-14 00:00:00	1997-04-11 00:00:00	1997-04-04 00:00:00.000	1	68.52	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
229	10476	HILAA	8	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-24 00:00:00.000	3	4.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
230	10477	PRINI	5	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-25 00:00:00.000	2	13.02	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
231	10478	VICTE	2	1997-03-18 00:00:00	1997-04-01 00:00:00	1997-03-26 00:00:00.000	3	4.81	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
232	10479	RATTC	3	1997-03-19 00:00:00	1997-04-16 00:00:00	1997-03-21 00:00:00.000	3	708.95	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
233	10480	FOLIG	6	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-24 00:00:00.000	2	1.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
234	10481	RICAR	8	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-25 00:00:00.000	2	64.33	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
235	10482	LAZYK	1	1997-03-21 00:00:00	1997-04-18 00:00:00	1997-04-10 00:00:00.000	3	7.48	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
236	10483	WHITC	7	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-25 00:00:00.000	2	15.28	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
237	10484	BSBEV	3	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-01 00:00:00.000	3	6.88	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
238	10485	LINOD	4	1997-03-25 00:00:00	1997-04-08 00:00:00	1997-03-31 00:00:00.000	2	64.45	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
239	10486	HILAA	1	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-04-02 00:00:00.000	2	30.53	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
240	10487	QUEEN	2	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-03-28 00:00:00.000	2	71.07	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
241	10488	FRANK	8	1997-03-27 00:00:00	1997-04-24 00:00:00	1997-04-02 00:00:00.000	2	4.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
242	10489	PICCO	6	1997-03-28 00:00:00	1997-04-25 00:00:00	1997-04-09 00:00:00.000	2	5.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
243	10490	HILAA	7	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-03 00:00:00.000	2	210.19	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
244	10491	FURIB	8	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-08 00:00:00.000	3	16.96	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
245	10492	BOTTM	3	1997-04-01 00:00:00	1997-04-29 00:00:00	1997-04-11 00:00:00.000	1	62.89	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
246	10493	LAMAI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-10 00:00:00.000	3	10.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
247	10494	COMMI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-09 00:00:00.000	2	65.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
248	10495	LAUGB	3	1997-04-03 00:00:00	1997-05-01 00:00:00	1997-04-11 00:00:00.000	3	4.65	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
249	10496	TRADH	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	2	46.77	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
250	10497	LEHMS	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	1	36.21	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
251	10498	HILAA	8	1997-04-07 00:00:00	1997-05-05 00:00:00	1997-04-11 00:00:00.000	2	29.75	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
252	10499	LILAS	4	1997-04-08 00:00:00	1997-05-06 00:00:00	1997-04-16 00:00:00.000	2	102.02	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
253	10500	LAMAI	6	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-17 00:00:00.000	1	42.68	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
254	10501	BLAUS	9	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-16 00:00:00.000	3	8.85	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
255	10502	PERIC	2	1997-04-10 00:00:00	1997-05-08 00:00:00	1997-04-29 00:00:00.000	1	69.32	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
256	10503	HUNGO	6	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-16 00:00:00.000	2	16.74	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
257	10504	WHITC	4	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-18 00:00:00.000	3	59.13	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
258	10505	MEREP	3	1997-04-14 00:00:00	1997-05-12 00:00:00	1997-04-21 00:00:00.000	3	7.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
259	10506	KOENE	9	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-05-02 00:00:00.000	2	21.19	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
260	10507	ANTON	7	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-04-22 00:00:00.000	1	47.45	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
261	10508	OTTIK	1	1997-04-16 00:00:00	1997-05-14 00:00:00	1997-05-13 00:00:00.000	2	4.99	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
262	10509	BLAUS	4	1997-04-17 00:00:00	1997-05-15 00:00:00	1997-04-29 00:00:00.000	1	0.15	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
263	10510	SAVEA	6	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-28 00:00:00.000	3	367.63	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
264	10511	BONAP	4	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-21 00:00:00.000	3	350.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
265	10512	FAMIA	7	1997-04-21 00:00:00	1997-05-19 00:00:00	1997-04-24 00:00:00.000	2	3.53	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
266	10513	WANDK	7	1997-04-22 00:00:00	1997-06-03 00:00:00	1997-04-28 00:00:00.000	1	105.65	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
267	10514	ERNSH	3	1997-04-22 00:00:00	1997-05-20 00:00:00	1997-05-16 00:00:00.000	2	789.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
268	10515	QUICK	2	1997-04-23 00:00:00	1997-05-07 00:00:00	1997-05-23 00:00:00.000	1	204.47	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
269	10516	HUNGO	2	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-05-01 00:00:00.000	3	62.78	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
270	10517	NORTS	3	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-04-29 00:00:00.000	3	32.07	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
271	10518	TORTU	4	1997-04-25 00:00:00	1997-05-09 00:00:00	1997-05-05 00:00:00.000	2	218.15	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
272	10519	CHOPS	6	1997-04-28 00:00:00	1997-05-26 00:00:00	1997-05-01 00:00:00.000	3	91.76	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
273	10520	SANTG	7	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-01 00:00:00.000	1	13.37	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
274	10521	CACTU	8	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-02 00:00:00.000	2	17.22	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
275	10522	LEHMS	4	1997-04-30 00:00:00	1997-05-28 00:00:00	1997-05-06 00:00:00.000	1	45.33	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
276	10523	SEVES	7	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-30 00:00:00.000	2	77.63	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
277	10524	BERGS	1	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-07 00:00:00.000	2	244.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
278	10525	BONAP	1	1997-05-02 00:00:00	1997-05-30 00:00:00	1997-05-23 00:00:00.000	2	11.06	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
279	10526	WARTH	4	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-15 00:00:00.000	2	58.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
280	10527	QUICK	7	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-07 00:00:00.000	1	41.9	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
281	10528	GREAL	6	1997-05-06 00:00:00	1997-05-20 00:00:00	1997-05-09 00:00:00.000	2	3.35	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
282	10529	MAISD	5	1997-05-07 00:00:00	1997-06-04 00:00:00	1997-05-09 00:00:00.000	2	66.69	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
283	10530	PICCO	3	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-12 00:00:00.000	2	339.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
284	10531	OCEAN	7	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-19 00:00:00.000	1	8.12	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
285	10532	EASTC	7	1997-05-09 00:00:00	1997-06-06 00:00:00	1997-05-12 00:00:00.000	3	74.46	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
286	10533	FOLKO	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-22 00:00:00.000	1	188.04	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
287	10534	LEHMS	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-14 00:00:00.000	2	27.94	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
288	10535	ANTON	4	1997-05-13 00:00:00	1997-06-10 00:00:00	1997-05-21 00:00:00.000	1	15.64	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
289	10536	LEHMS	3	1997-05-14 00:00:00	1997-06-11 00:00:00	1997-06-06 00:00:00.000	2	58.88	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
290	10537	RICSU	1	1997-05-14 00:00:00	1997-05-28 00:00:00	1997-05-19 00:00:00.000	1	78.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
291	10538	BSBEV	9	1997-05-15 00:00:00	1997-06-12 00:00:00	1997-05-16 00:00:00.000	3	4.87	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
292	10539	BSBEV	6	1997-05-16 00:00:00	1997-06-13 00:00:00	1997-05-23 00:00:00.000	3	12.36	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
293	10540	QUICK	3	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-06-13 00:00:00.000	3	1007.64	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
294	10541	HANAR	2	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-05-29 00:00:00.000	1	68.65	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
295	10542	KOENE	1	1997-05-20 00:00:00	1997-06-17 00:00:00	1997-05-26 00:00:00.000	3	10.95	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
296	10543	LILAS	8	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-23 00:00:00.000	2	48.17	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
297	10544	LONEP	4	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-30 00:00:00.000	1	24.91	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
298	10545	LAZYK	8	1997-05-22 00:00:00	1997-06-19 00:00:00	1997-06-26 00:00:00.000	2	11.92	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
299	10546	VICTE	1	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-05-27 00:00:00.000	3	194.72	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
300	10547	SEVES	3	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-06-02 00:00:00.000	2	178.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
301	10548	TOMSP	3	1997-05-26 00:00:00	1997-06-23 00:00:00	1997-06-02 00:00:00.000	2	1.43	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
302	10549	QUICK	5	1997-05-27 00:00:00	1997-06-10 00:00:00	1997-05-30 00:00:00.000	1	171.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
303	10550	GODOS	7	1997-05-28 00:00:00	1997-06-25 00:00:00	1997-06-06 00:00:00.000	3	4.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
304	10551	FURIB	4	1997-05-28 00:00:00	1997-07-09 00:00:00	1997-06-06 00:00:00.000	3	72.95	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
305	10552	HILAA	2	1997-05-29 00:00:00	1997-06-26 00:00:00	1997-06-05 00:00:00.000	1	83.22	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
306	10553	WARTH	2	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-03 00:00:00.000	2	149.49	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
307	10554	OTTIK	4	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-05 00:00:00.000	3	120.97	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
308	10555	SAVEA	6	1997-06-02 00:00:00	1997-06-30 00:00:00	1997-06-04 00:00:00.000	3	252.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
309	10556	SIMOB	2	1997-06-03 00:00:00	1997-07-15 00:00:00	1997-06-13 00:00:00.000	1	9.8	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
310	10557	LEHMS	9	1997-06-03 00:00:00	1997-06-17 00:00:00	1997-06-06 00:00:00.000	2	96.72	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
311	10558	AROUT	1	1997-06-04 00:00:00	1997-07-02 00:00:00	1997-06-10 00:00:00.000	2	72.97	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
312	10559	BLONP	6	1997-06-05 00:00:00	1997-07-03 00:00:00	1997-06-13 00:00:00.000	1	8.05	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
313	10560	FRANK	8	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	1	36.65	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
314	10561	FOLKO	2	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	2	242.21	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
315	10562	REGGC	1	1997-06-09 00:00:00	1997-07-07 00:00:00	1997-06-12 00:00:00.000	1	22.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
316	10563	RICAR	2	1997-06-10 00:00:00	1997-07-22 00:00:00	1997-06-24 00:00:00.000	2	60.43	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
317	10564	RATTC	4	1997-06-10 00:00:00	1997-07-08 00:00:00	1997-06-16 00:00:00.000	3	13.75	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
318	10565	MEREP	8	1997-06-11 00:00:00	1997-07-09 00:00:00	1997-06-18 00:00:00.000	2	7.15	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
319	10566	BLONP	9	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-18 00:00:00.000	1	88.4	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
320	10567	HUNGO	1	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-17 00:00:00.000	1	33.97	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
321	10568	GALED	3	1997-06-13 00:00:00	1997-07-11 00:00:00	1997-07-09 00:00:00.000	3	6.54	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
322	10569	RATTC	5	1997-06-16 00:00:00	1997-07-14 00:00:00	1997-07-11 00:00:00.000	1	58.98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
323	10570	MEREP	3	1997-06-17 00:00:00	1997-07-15 00:00:00	1997-06-19 00:00:00.000	3	188.99	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
324	10571	ERNSH	8	1997-06-17 00:00:00	1997-07-29 00:00:00	1997-07-04 00:00:00.000	3	26.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
325	10572	BERGS	3	1997-06-18 00:00:00	1997-07-16 00:00:00	1997-06-25 00:00:00.000	2	116.43	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
326	10573	ANTON	7	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-20 00:00:00.000	3	84.84	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
327	10574	TRAIH	4	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-30 00:00:00.000	2	37.6	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
328	10575	MORGK	5	1997-06-20 00:00:00	1997-07-04 00:00:00	1997-06-30 00:00:00.000	1	127.34	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
329	10576	TORTU	3	1997-06-23 00:00:00	1997-07-07 00:00:00	1997-06-30 00:00:00.000	3	18.56	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
330	10577	TRAIH	9	1997-06-23 00:00:00	1997-08-04 00:00:00	1997-06-30 00:00:00.000	2	25.41	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
331	10578	BSBEV	4	1997-06-24 00:00:00	1997-07-22 00:00:00	1997-07-25 00:00:00.000	3	29.6	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
332	10579	LETSS	1	1997-06-25 00:00:00	1997-07-23 00:00:00	1997-07-04 00:00:00.000	2	13.73	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
333	10580	OTTIK	4	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-01 00:00:00.000	3	75.89	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
334	10581	FAMIA	3	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-02 00:00:00.000	1	3.01	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
335	10582	BLAUS	3	1997-06-27 00:00:00	1997-07-25 00:00:00	1997-07-14 00:00:00.000	2	27.71	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
336	10583	WARTH	2	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	2	7.28	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
337	10584	BLONP	4	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	1	59.14	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
338	10585	WELLI	7	1997-07-01 00:00:00	1997-07-29 00:00:00	1997-07-10 00:00:00.000	1	13.41	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
339	10586	REGGC	9	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	0.48	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
340	10587	QUEDE	1	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	62.52	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
341	10588	QUICK	2	1997-07-03 00:00:00	1997-07-31 00:00:00	1997-07-10 00:00:00.000	3	194.67	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
342	10589	GREAL	8	1997-07-04 00:00:00	1997-08-01 00:00:00	1997-07-14 00:00:00.000	2	4.42	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
343	10590	MEREP	4	1997-07-07 00:00:00	1997-08-04 00:00:00	1997-07-14 00:00:00.000	3	44.77	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
344	10591	VAFFE	1	1997-07-07 00:00:00	1997-07-21 00:00:00	1997-07-16 00:00:00.000	1	55.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
345	10592	LEHMS	3	1997-07-08 00:00:00	1997-08-05 00:00:00	1997-07-16 00:00:00.000	1	32.1	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
346	10593	LEHMS	7	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-08-13 00:00:00.000	2	174.2	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
347	10594	OLDWO	3	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-07-16 00:00:00.000	2	5.24	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
348	10595	ERNSH	2	1997-07-10 00:00:00	1997-08-07 00:00:00	1997-07-14 00:00:00.000	1	96.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
349	10596	WHITC	8	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-08-12 00:00:00.000	1	16.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
350	10597	PICCO	7	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-07-18 00:00:00.000	3	35.12	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
351	10598	RATTC	1	1997-07-14 00:00:00	1997-08-11 00:00:00	1997-07-18 00:00:00.000	3	44.42	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
352	10599	BSBEV	6	1997-07-15 00:00:00	1997-08-26 00:00:00	1997-07-21 00:00:00.000	3	29.98	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
353	10600	HUNGC	4	1997-07-16 00:00:00	1997-08-13 00:00:00	1997-07-21 00:00:00.000	1	45.13	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
354	10601	HILAA	7	1997-07-16 00:00:00	1997-08-27 00:00:00	1997-07-22 00:00:00.000	1	58.3	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
355	10602	VAFFE	8	1997-07-17 00:00:00	1997-08-14 00:00:00	1997-07-22 00:00:00.000	2	2.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
356	10603	SAVEA	8	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-08-08 00:00:00.000	2	48.77	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
357	10604	FURIB	1	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-07-29 00:00:00.000	1	7.46	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
358	10605	MEREP	1	1997-07-21 00:00:00	1997-08-18 00:00:00	1997-07-29 00:00:00.000	2	379.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
359	10606	TRADH	4	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-31 00:00:00.000	3	79.4	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
360	10607	SAVEA	5	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-25 00:00:00.000	1	200.24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
361	10608	TOMSP	4	1997-07-23 00:00:00	1997-08-20 00:00:00	1997-08-01 00:00:00.000	2	27.79	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
362	10609	DUMON	7	1997-07-24 00:00:00	1997-08-21 00:00:00	1997-07-30 00:00:00.000	2	1.85	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
363	10610	LAMAI	8	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-06 00:00:00.000	1	26.78	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
364	10611	WOLZA	6	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-01 00:00:00.000	2	80.65	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
365	10612	SAVEA	1	1997-07-28 00:00:00	1997-08-25 00:00:00	1997-08-01 00:00:00.000	2	544.08	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
366	10613	HILAA	4	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	2	8.11	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
367	10614	BLAUS	8	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	3	1.93	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
368	10615	WILMK	2	1997-07-30 00:00:00	1997-08-27 00:00:00	1997-08-06 00:00:00.000	3	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
369	10616	GREAL	1	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-05 00:00:00.000	2	116.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
370	10617	GREAL	4	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-04 00:00:00.000	2	18.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
371	10618	MEREP	1	1997-08-01 00:00:00	1997-09-12 00:00:00	1997-08-08 00:00:00.000	1	154.68	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
372	10619	MEREP	3	1997-08-04 00:00:00	1997-09-01 00:00:00	1997-08-07 00:00:00.000	3	91.05	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
373	10620	LAUGB	2	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-14 00:00:00.000	3	0.94	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
374	10621	ISLAT	4	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-11 00:00:00.000	2	23.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
375	10622	RICAR	4	1997-08-06 00:00:00	1997-09-03 00:00:00	1997-08-11 00:00:00.000	3	50.97	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
376	10623	FRANK	8	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-12 00:00:00.000	2	97.18	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
377	10624	THECR	4	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-19 00:00:00.000	2	94.8	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
378	10625	ANATR	3	1997-08-08 00:00:00	1997-09-05 00:00:00	1997-08-14 00:00:00.000	1	43.9	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
379	10626	BERGS	1	1997-08-11 00:00:00	1997-09-08 00:00:00	1997-08-20 00:00:00.000	2	138.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
380	10627	SAVEA	8	1997-08-11 00:00:00	1997-09-22 00:00:00	1997-08-21 00:00:00.000	3	107.46	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
381	10628	BLONP	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	30.36	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
382	10629	GODOS	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	85.46	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
383	10630	KOENE	1	1997-08-13 00:00:00	1997-09-10 00:00:00	1997-08-19 00:00:00.000	2	32.35	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
384	10631	LAMAI	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-15 00:00:00.000	1	0.87	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
385	10632	WANDK	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-19 00:00:00.000	1	41.38	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
386	10633	ERNSH	7	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-18 00:00:00.000	3	477.9	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
387	10634	FOLIG	4	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-21 00:00:00.000	3	487.38	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
388	10635	MAGAA	8	1997-08-18 00:00:00	1997-09-15 00:00:00	1997-08-21 00:00:00.000	3	47.46	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
389	10636	WARTH	4	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	1.15	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
390	10637	QUEEN	6	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	201.29	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
391	10638	LINOD	3	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-09-01 00:00:00.000	1	158.44	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
392	10639	SANTG	7	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-08-27 00:00:00.000	3	38.64	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
393	10640	WANDK	4	1997-08-21 00:00:00	1997-09-18 00:00:00	1997-08-28 00:00:00.000	1	23.55	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
394	10641	HILAA	4	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-08-26 00:00:00.000	2	179.61	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
395	10642	SIMOB	7	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-09-05 00:00:00.000	3	41.89	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
396	10643	ALFKI	6	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-02 00:00:00.000	1	29.46	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
397	10644	WELLI	3	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-01 00:00:00.000	2	0.14	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
398	10645	HANAR	4	1997-08-26 00:00:00	1997-09-23 00:00:00	1997-09-02 00:00:00.000	1	12.41	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
399	10646	HUNGO	9	1997-08-27 00:00:00	1997-10-08 00:00:00	1997-09-03 00:00:00.000	3	142.33	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
400	10647	QUEDE	4	1997-08-27 00:00:00	1997-09-10 00:00:00	1997-09-03 00:00:00.000	2	45.54	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
401	10648	RICAR	5	1997-08-28 00:00:00	1997-10-09 00:00:00	1997-09-09 00:00:00.000	2	14.25	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
402	10649	MAISD	5	1997-08-28 00:00:00	1997-09-25 00:00:00	1997-08-29 00:00:00.000	3	6.2	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
403	10650	FAMIA	5	1997-08-29 00:00:00	1997-09-26 00:00:00	1997-09-03 00:00:00.000	3	176.81	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
404	10651	WANDK	8	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-11 00:00:00.000	2	20.6	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
405	10652	GOURL	4	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-08 00:00:00.000	2	7.14	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
406	10653	FRANK	1	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-19 00:00:00.000	1	93.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
407	10654	BERGS	5	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-11 00:00:00.000	1	55.26	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
408	10655	REGGC	1	1997-09-03 00:00:00	1997-10-01 00:00:00	1997-09-11 00:00:00.000	2	4.41	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
409	10656	GREAL	6	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-10 00:00:00.000	1	57.15	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
410	10657	SAVEA	2	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-15 00:00:00.000	2	352.69	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
411	10658	QUICK	4	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-08 00:00:00.000	1	364.15	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
412	10659	QUEEN	7	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-10 00:00:00.000	2	105.81	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
413	10660	HUNGC	8	1997-09-08 00:00:00	1997-10-06 00:00:00	1997-10-15 00:00:00.000	1	111.29	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
414	10661	HUNGO	7	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-15 00:00:00.000	3	17.55	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
415	10662	LONEP	3	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-18 00:00:00.000	2	1.28	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
416	10663	BONAP	2	1997-09-10 00:00:00	1997-09-24 00:00:00	1997-10-03 00:00:00.000	2	113.15	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
417	10664	FURIB	1	1997-09-10 00:00:00	1997-10-08 00:00:00	1997-09-19 00:00:00.000	3	1.27	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
418	10665	LONEP	1	1997-09-11 00:00:00	1997-10-09 00:00:00	1997-09-17 00:00:00.000	2	26.31	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
419	10666	RICSU	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-22 00:00:00.000	2	232.42	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
420	10667	ERNSH	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-19 00:00:00.000	1	78.09	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
421	10668	WANDK	1	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-23 00:00:00.000	2	47.22	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
422	10669	SIMOB	2	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-22 00:00:00.000	1	24.39	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
423	10670	FRANK	4	1997-09-16 00:00:00	1997-10-14 00:00:00	1997-09-18 00:00:00.000	1	203.48	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
424	10671	FRANR	1	1997-09-17 00:00:00	1997-10-15 00:00:00	1997-09-24 00:00:00.000	1	30.34	France restauration	54 rue Royale	Nantes	NULL	44000	France
425	10672	BERGS	9	1997-09-17 00:00:00	1997-10-01 00:00:00	1997-09-26 00:00:00.000	2	95.75	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
426	10673	WILMK	2	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-19 00:00:00.000	1	22.76	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
427	10674	ISLAT	4	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-30 00:00:00.000	2	0.9	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
428	10675	FRANK	5	1997-09-19 00:00:00	1997-10-17 00:00:00	1997-09-23 00:00:00.000	2	31.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
429	10676	TORTU	2	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-29 00:00:00.000	2	2.01	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
430	10677	ANTON	1	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-26 00:00:00.000	3	4.03	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
431	10678	SAVEA	7	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-10-16 00:00:00.000	3	388.98	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
432	10679	BLONP	8	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-09-30 00:00:00.000	3	27.94	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
433	10680	OLDWO	1	1997-09-24 00:00:00	1997-10-22 00:00:00	1997-09-26 00:00:00.000	1	26.61	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
434	10681	GREAL	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-09-30 00:00:00.000	3	76.13	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
435	10682	ANTON	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-10-01 00:00:00.000	2	36.13	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
436	10683	DUMON	2	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-10-01 00:00:00.000	1	4.4	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
437	10684	OTTIK	3	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-09-30 00:00:00.000	1	145.63	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
438	10685	GOURL	4	1997-09-29 00:00:00	1997-10-13 00:00:00	1997-10-03 00:00:00.000	2	33.75	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
439	10686	PICCO	2	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-08 00:00:00.000	1	96.5	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
440	10687	HUNGO	9	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-30 00:00:00.000	2	296.43	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
441	10688	VAFFE	4	1997-10-01 00:00:00	1997-10-15 00:00:00	1997-10-07 00:00:00.000	2	299.09	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
442	10689	BERGS	1	1997-10-01 00:00:00	1997-10-29 00:00:00	1997-10-07 00:00:00.000	2	13.42	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
443	10690	HANAR	1	1997-10-02 00:00:00	1997-10-30 00:00:00	1997-10-03 00:00:00.000	1	15.8	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
444	10691	QUICK	2	1997-10-03 00:00:00	1997-11-14 00:00:00	1997-10-22 00:00:00.000	2	810.05	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
445	10692	ALFKI	4	1997-10-03 00:00:00	1997-10-31 00:00:00	1997-10-13 00:00:00.000	2	61.02	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
446	10693	WHITC	3	1997-10-06 00:00:00	1997-10-20 00:00:00	1997-10-10 00:00:00.000	3	139.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
447	10694	QUICK	8	1997-10-06 00:00:00	1997-11-03 00:00:00	1997-10-09 00:00:00.000	3	398.36	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
448	10695	WILMK	7	1997-10-07 00:00:00	1997-11-18 00:00:00	1997-10-14 00:00:00.000	1	16.72	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
449	10696	WHITC	8	1997-10-08 00:00:00	1997-11-19 00:00:00	1997-10-14 00:00:00.000	3	102.55	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
450	10697	LINOD	3	1997-10-08 00:00:00	1997-11-05 00:00:00	1997-10-14 00:00:00.000	1	45.52	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
451	10698	ERNSH	4	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-17 00:00:00.000	1	272.47	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
452	10699	MORGK	3	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-13 00:00:00.000	3	0.58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
453	10700	SAVEA	3	1997-10-10 00:00:00	1997-11-07 00:00:00	1997-10-16 00:00:00.000	1	65.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
454	10701	HUNGO	6	1997-10-13 00:00:00	1997-10-27 00:00:00	1997-10-15 00:00:00.000	3	220.31	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
455	10702	ALFKI	4	1997-10-13 00:00:00	1997-11-24 00:00:00	1997-10-21 00:00:00.000	1	23.94	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
456	10703	FOLKO	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-10-20 00:00:00.000	2	152.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
457	10704	QUEEN	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-11-07 00:00:00.000	1	4.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
458	10705	HILAA	9	1997-10-15 00:00:00	1997-11-12 00:00:00	1997-11-18 00:00:00.000	2	3.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
459	10706	OLDWO	8	1997-10-16 00:00:00	1997-11-13 00:00:00	1997-10-21 00:00:00.000	3	135.63	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
460	10707	AROUT	4	1997-10-16 00:00:00	1997-10-30 00:00:00	1997-10-23 00:00:00.000	3	21.74	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
461	10708	THEBI	6	1997-10-17 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	2	2.96	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
462	10709	GOURL	1	1997-10-17 00:00:00	1997-11-14 00:00:00	1997-11-20 00:00:00.000	3	210.8	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
463	10710	FRANS	1	1997-10-20 00:00:00	1997-11-17 00:00:00	1997-10-23 00:00:00.000	1	4.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
464	10711	SAVEA	5	1997-10-21 00:00:00	1997-12-02 00:00:00	1997-10-29 00:00:00.000	2	52.41	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
465	10712	HUNGO	3	1997-10-21 00:00:00	1997-11-18 00:00:00	1997-10-31 00:00:00.000	1	89.93	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
466	10713	SAVEA	1	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-24 00:00:00.000	1	167.05	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
467	10714	SAVEA	5	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-27 00:00:00.000	3	24.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
468	10715	BONAP	3	1997-10-23 00:00:00	1997-11-06 00:00:00	1997-10-29 00:00:00.000	1	63.2	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
469	10716	RANCH	4	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-27 00:00:00.000	2	22.57	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
470	10717	FRANK	1	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-29 00:00:00.000	2	59.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
471	10718	KOENE	1	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-10-29 00:00:00.000	3	170.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
472	10719	LETSS	8	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-11-05 00:00:00.000	2	51.44	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
473	10720	QUEDE	8	1997-10-28 00:00:00	1997-11-11 00:00:00	1997-11-05 00:00:00.000	2	9.53	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
474	10721	QUICK	5	1997-10-29 00:00:00	1997-11-26 00:00:00	1997-10-31 00:00:00.000	3	48.92	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
475	10722	SAVEA	8	1997-10-29 00:00:00	1997-12-10 00:00:00	1997-11-04 00:00:00.000	1	74.58	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
476	10723	WHITC	3	1997-10-30 00:00:00	1997-11-27 00:00:00	1997-11-25 00:00:00.000	1	21.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
477	10724	MEREP	8	1997-10-30 00:00:00	1997-12-11 00:00:00	1997-11-05 00:00:00.000	2	57.75	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
478	10725	FAMIA	4	1997-10-31 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	3	10.83	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
479	10726	EASTC	4	1997-11-03 00:00:00	1997-11-17 00:00:00	1997-12-05 00:00:00.000	1	16.56	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
480	10727	REGGC	2	1997-11-03 00:00:00	1997-12-01 00:00:00	1997-12-05 00:00:00.000	1	89.9	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
481	10728	QUEEN	4	1997-11-04 00:00:00	1997-12-02 00:00:00	1997-11-11 00:00:00.000	2	58.33	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
482	10729	LINOD	8	1997-11-04 00:00:00	1997-12-16 00:00:00	1997-11-14 00:00:00.000	3	141.06	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
483	10730	BONAP	5	1997-11-05 00:00:00	1997-12-03 00:00:00	1997-11-14 00:00:00.000	1	20.12	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
484	10731	CHOPS	7	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-14 00:00:00.000	1	96.65	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
485	10732	BONAP	3	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-07 00:00:00.000	1	16.97	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
486	10733	BERGS	1	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-10 00:00:00.000	3	110.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
487	10734	GOURL	2	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-12 00:00:00.000	3	1.63	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
488	10735	LETSS	6	1997-11-10 00:00:00	1997-12-08 00:00:00	1997-11-21 00:00:00.000	2	45.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
489	10736	HUNGO	9	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-21 00:00:00.000	2	44.1	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
490	10737	VINET	2	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-18 00:00:00.000	2	7.79	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
491	10738	SPECD	2	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-18 00:00:00.000	1	2.91	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
492	10739	VINET	3	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-17 00:00:00.000	3	11.08	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
493	10740	WHITC	4	1997-11-13 00:00:00	1997-12-11 00:00:00	1997-11-25 00:00:00.000	2	81.88	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
494	10741	AROUT	4	1997-11-14 00:00:00	1997-11-28 00:00:00	1997-11-18 00:00:00.000	3	10.96	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
495	10742	BOTTM	3	1997-11-14 00:00:00	1997-12-12 00:00:00	1997-11-18 00:00:00.000	3	243.73	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
496	10743	AROUT	1	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-21 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
497	10744	VAFFE	6	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-24 00:00:00.000	1	69.19	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
498	10745	QUICK	9	1997-11-18 00:00:00	1997-12-16 00:00:00	1997-11-27 00:00:00.000	1	3.52	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
499	10746	CHOPS	1	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-21 00:00:00.000	3	31.43	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
500	10747	PICCO	6	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-26 00:00:00.000	1	117.33	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
501	10748	SAVEA	3	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-11-28 00:00:00.000	1	232.55	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
502	10749	ISLAT	4	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-12-19 00:00:00.000	2	61.53	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
503	10750	WARTH	9	1997-11-21 00:00:00	1997-12-19 00:00:00	1997-11-24 00:00:00.000	1	79.3	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
504	10751	RICSU	3	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-12-03 00:00:00.000	3	130.79	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
505	10752	NORTS	2	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-11-28 00:00:00.000	3	1.39	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
506	10753	FRANS	3	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	1	7.7	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
507	10754	MAGAA	6	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	3	2.38	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
508	10755	BONAP	4	1997-11-26 00:00:00	1997-12-24 00:00:00	1997-11-28 00:00:00.000	2	16.71	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
509	10756	SPLIR	8	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-02 00:00:00.000	2	73.21	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
510	10757	SAVEA	6	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-15 00:00:00.000	1	8.19	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
511	10758	RICSU	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-04 00:00:00.000	3	138.17	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
512	10759	ANATR	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-12 00:00:00.000	3	11.99	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
513	10760	MAISD	4	1997-12-01 00:00:00	1997-12-29 00:00:00	1997-12-10 00:00:00.000	1	155.64	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
514	10761	RATTC	5	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-08 00:00:00.000	2	18.66	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
515	10762	FOLKO	3	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-09 00:00:00.000	1	328.74	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
516	10763	FOLIG	3	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	37.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
517	10764	ERNSH	6	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	145.45	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
518	10765	QUICK	3	1997-12-04 00:00:00	1998-01-01 00:00:00	1997-12-09 00:00:00.000	3	42.74	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
519	10766	OTTIK	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-09 00:00:00.000	1	157.55	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
520	10767	SUPRD	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-15 00:00:00.000	3	1.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
521	10768	AROUT	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-15 00:00:00.000	2	146.32	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
522	10769	VAFFE	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-12 00:00:00.000	1	65.06	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
523	10770	HANAR	8	1997-12-09 00:00:00	1998-01-06 00:00:00	1997-12-17 00:00:00.000	3	5.32	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
524	10771	ERNSH	9	1997-12-10 00:00:00	1998-01-07 00:00:00	1998-01-02 00:00:00.000	2	11.19	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
525	10772	LEHMS	3	1997-12-10 00:00:00	1998-01-07 00:00:00	1997-12-19 00:00:00.000	2	91.28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
526	10773	ERNSH	1	1997-12-11 00:00:00	1998-01-08 00:00:00	1997-12-16 00:00:00.000	3	96.43	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
527	10774	FOLKO	4	1997-12-11 00:00:00	1997-12-25 00:00:00	1997-12-12 00:00:00.000	1	48.2	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
528	10775	THECR	7	1997-12-12 00:00:00	1998-01-09 00:00:00	1997-12-26 00:00:00.000	1	20.25	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
529	10776	ERNSH	1	1997-12-15 00:00:00	1998-01-12 00:00:00	1997-12-18 00:00:00.000	3	351.53	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
530	10777	GOURL	7	1997-12-15 00:00:00	1997-12-29 00:00:00	1998-01-21 00:00:00.000	2	3.01	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
531	10778	BERGS	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1997-12-24 00:00:00.000	1	6.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
532	10779	MORGK	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1998-01-14 00:00:00.000	2	58.13	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
533	10780	LILAS	2	1997-12-16 00:00:00	1997-12-30 00:00:00	1997-12-25 00:00:00.000	1	42.13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
534	10781	WARTH	2	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-19 00:00:00.000	3	73.16	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
535	10782	CACTU	9	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-22 00:00:00.000	3	1.1	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
536	10783	HANAR	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-19 00:00:00.000	2	124.98	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
537	10784	MAGAA	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-22 00:00:00.000	3	70.09	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
538	10785	GROSR	1	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-24 00:00:00.000	3	1.51	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
539	10786	QUEEN	8	1997-12-19 00:00:00	1998-01-16 00:00:00	1997-12-23 00:00:00.000	1	110.87	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
540	10787	LAMAI	2	1997-12-19 00:00:00	1998-01-02 00:00:00	1997-12-26 00:00:00.000	1	249.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
541	10788	QUICK	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1998-01-19 00:00:00.000	2	42.7	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
542	10789	FOLIG	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-31 00:00:00.000	2	100.6	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
543	10790	GOURL	6	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-26 00:00:00.000	1	28.23	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
544	10791	FRANK	6	1997-12-23 00:00:00	1998-01-20 00:00:00	1998-01-01 00:00:00.000	2	16.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
545	10792	WOLZA	1	1997-12-23 00:00:00	1998-01-20 00:00:00	1997-12-31 00:00:00.000	3	23.79	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
546	10793	AROUT	3	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-08 00:00:00.000	3	4.52	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
547	10794	QUEDE	6	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-02 00:00:00.000	1	21.49	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
548	10795	ERNSH	8	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-20 00:00:00.000	2	126.66	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
549	10796	HILAA	3	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-14 00:00:00.000	1	26.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
550	10797	DRACD	7	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-05 00:00:00.000	2	33.35	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
551	10798	ISLAT	2	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	1	2.33	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
552	10799	KOENE	9	1997-12-26 00:00:00	1998-02-06 00:00:00	1998-01-05 00:00:00.000	3	30.76	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
553	10800	SEVES	1	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	3	137.44	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
554	10801	BOLID	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1997-12-31 00:00:00.000	2	97.09	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
555	10802	SIMOB	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1998-01-02 00:00:00.000	2	257.26	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
556	10803	WELLI	4	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-06 00:00:00.000	1	55.23	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
557	10804	SEVES	6	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-07 00:00:00.000	2	27.33	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
558	10805	THEBI	2	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-09 00:00:00.000	3	237.34	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
559	10806	VICTE	3	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-05 00:00:00.000	2	22.11	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
560	10807	FRANS	4	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-30 00:00:00.000	1	1.36	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
561	10808	OLDWO	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-09 00:00:00.000	3	45.53	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
562	10809	WELLI	7	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	1	4.87	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
563	10810	LAUGB	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	3	4.33	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
564	10811	LINOD	8	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-08 00:00:00.000	1	31.22	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
565	10812	REGGC	5	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-12 00:00:00.000	1	59.78	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
566	10813	RICAR	1	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-09 00:00:00.000	1	47.38	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
567	10814	VICTE	3	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	130.94	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
568	10815	SAVEA	2	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	14.62	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
569	10816	GREAL	4	1998-01-06 00:00:00	1998-02-03 00:00:00	1998-02-04 00:00:00.000	2	719.78	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
570	10817	KOENE	3	1998-01-06 00:00:00	1998-01-20 00:00:00	1998-01-13 00:00:00.000	2	306.07	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
571	10818	MAGAA	7	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-12 00:00:00.000	3	65.48	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
572	10819	CACTU	2	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-16 00:00:00.000	3	19.76	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
573	10820	RATTC	3	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-13 00:00:00.000	2	37.52	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
574	10821	SPLIR	1	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-15 00:00:00.000	1	36.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
575	10822	TRAIH	6	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-16 00:00:00.000	3	7	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
576	10823	LILAS	5	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-13 00:00:00.000	2	163.97	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
577	10824	FOLKO	8	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-30 00:00:00.000	1	1.23	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
578	10825	DRACD	1	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-14 00:00:00.000	1	79.25	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
579	10826	BLONP	6	1998-01-12 00:00:00	1998-02-09 00:00:00	1998-02-06 00:00:00.000	1	7.09	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
580	10827	BONAP	1	1998-01-12 00:00:00	1998-01-26 00:00:00	1998-02-06 00:00:00.000	2	63.54	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
581	10828	RANCH	9	1998-01-13 00:00:00	1998-01-27 00:00:00	1998-02-04 00:00:00.000	1	90.85	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
582	10829	ISLAT	9	1998-01-13 00:00:00	1998-02-10 00:00:00	1998-01-23 00:00:00.000	1	154.72	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
583	10830	TRADH	4	1998-01-13 00:00:00	1998-02-24 00:00:00	1998-01-21 00:00:00.000	2	81.83	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
584	10831	SANTG	3	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-23 00:00:00.000	2	72.19	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
585	10832	LAMAI	2	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-19 00:00:00.000	2	43.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
586	10833	OTTIK	6	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-23 00:00:00.000	2	71.49	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
587	10834	TRADH	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-19 00:00:00.000	3	29.78	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
588	10835	ALFKI	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-21 00:00:00.000	3	69.53	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
589	10836	ERNSH	7	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-21 00:00:00.000	1	411.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
590	10837	BERGS	9	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-23 00:00:00.000	3	13.32	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
591	10838	LINOD	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-23 00:00:00.000	3	59.28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
592	10839	TRADH	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-22 00:00:00.000	3	35.43	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
593	10840	LINOD	4	1998-01-19 00:00:00	1998-03-02 00:00:00	1998-02-16 00:00:00.000	2	2.71	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
594	10841	SUPRD	5	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	2	424.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
595	10842	TORTU	1	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	3	54.42	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
596	10843	VICTE	4	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	9.26	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
597	10844	PICCO	8	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	25.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
598	10845	QUICK	8	1998-01-21 00:00:00	1998-02-04 00:00:00	1998-01-30 00:00:00.000	1	212.98	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
599	10846	SUPRD	2	1998-01-22 00:00:00	1998-03-05 00:00:00	1998-01-23 00:00:00.000	3	56.46	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
600	10847	SAVEA	4	1998-01-22 00:00:00	1998-02-05 00:00:00	1998-02-10 00:00:00.000	3	487.57	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
601	10848	CONSH	7	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-29 00:00:00.000	2	38.24	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
602	10849	KOENE	9	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-30 00:00:00.000	2	0.56	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
603	10850	VICTE	1	1998-01-23 00:00:00	1998-03-06 00:00:00	1998-01-30 00:00:00.000	1	49.19	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
604	10851	RICAR	5	1998-01-26 00:00:00	1998-02-23 00:00:00	1998-02-02 00:00:00.000	1	160.55	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
605	10852	RATTC	8	1998-01-26 00:00:00	1998-02-09 00:00:00	1998-01-30 00:00:00.000	1	174.05	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
606	10853	BLAUS	9	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-03 00:00:00.000	2	53.83	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
607	10854	ERNSH	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-05 00:00:00.000	2	100.22	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
608	10855	OLDWO	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-04 00:00:00.000	1	170.97	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
609	10856	ANTON	3	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-10 00:00:00.000	2	58.43	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
610	10857	BERGS	8	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-06 00:00:00.000	2	188.85	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
611	10858	LACOR	2	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-03 00:00:00.000	1	52.51	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
612	10859	FRANK	1	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-02 00:00:00.000	2	76.1	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
613	10860	FRANR	3	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-04 00:00:00.000	3	19.26	France restauration	54 rue Royale	Nantes	NULL	44000	France
614	10861	WHITC	4	1998-01-30 00:00:00	1998-02-27 00:00:00	1998-02-17 00:00:00.000	2	14.93	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
615	10862	LEHMS	8	1998-01-30 00:00:00	1998-03-13 00:00:00	1998-02-02 00:00:00.000	2	53.23	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
616	10863	HILAA	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-17 00:00:00.000	2	30.26	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
617	10864	AROUT	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-09 00:00:00.000	2	3.04	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
618	10865	QUICK	2	1998-02-02 00:00:00	1998-02-16 00:00:00	1998-02-12 00:00:00.000	1	348.14	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
619	10866	BERGS	5	1998-02-03 00:00:00	1998-03-03 00:00:00	1998-02-12 00:00:00.000	1	109.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
620	10867	LONEP	6	1998-02-03 00:00:00	1998-03-17 00:00:00	1998-02-11 00:00:00.000	1	1.93	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
621	10868	QUEEN	7	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-23 00:00:00.000	2	191.27	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
622	10869	SEVES	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-09 00:00:00.000	1	143.28	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
623	10870	WOLZA	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-13 00:00:00.000	3	12.04	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
624	10871	BONAP	9	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-10 00:00:00.000	2	112.27	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
625	10872	GODOS	5	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-09 00:00:00.000	2	175.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
626	10873	WILMK	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-09 00:00:00.000	1	0.82	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
627	10874	GODOS	5	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-11 00:00:00.000	2	19.58	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
628	10875	BERGS	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-03-03 00:00:00.000	2	32.37	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
629	10876	BONAP	7	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-12 00:00:00.000	3	60.42	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
630	10877	RICAR	1	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-19 00:00:00.000	1	38.06	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
631	10878	QUICK	4	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	1	46.69	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
632	10879	WILMK	3	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	3	8.5	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
633	10880	FOLKO	7	1998-02-10 00:00:00	1998-03-24 00:00:00	1998-02-18 00:00:00.000	1	88.01	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
634	10881	CACTU	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-18 00:00:00.000	1	2.84	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
635	10882	SAVEA	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-20 00:00:00.000	3	23.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
636	10883	LONEP	8	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-20 00:00:00.000	3	0.53	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
637	10884	LETSS	4	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-13 00:00:00.000	2	90.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
638	10885	SUPRD	6	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-18 00:00:00.000	3	5.64	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
639	10886	HANAR	1	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-03-02 00:00:00.000	1	4.99	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
640	10887	GALED	8	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-02-16 00:00:00.000	3	1.25	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
641	10888	GODOS	1	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	2	51.87	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
642	10889	RATTC	9	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	3	280.61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
643	10890	DUMON	7	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-18 00:00:00.000	1	32.76	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
644	10891	LEHMS	7	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	20.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
645	10892	MAISD	4	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	120.27	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
646	10893	KOENE	9	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	2	77.78	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
647	10894	SAVEA	1	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	1	116.13	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
648	10895	ERNSH	3	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-23 00:00:00.000	1	162.75	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
649	10896	MAISD	7	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-27 00:00:00.000	3	32.45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
650	10897	HUNGO	3	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-25 00:00:00.000	2	603.54	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
651	10898	OCEAN	4	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-06 00:00:00.000	2	1.27	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
652	10899	LILAS	5	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-02-26 00:00:00.000	3	1.21	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
653	10900	WELLI	1	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-04 00:00:00.000	2	1.66	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
654	10901	HILAA	4	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-02-26 00:00:00.000	1	62.09	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
655	10902	FOLKO	1	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-03-03 00:00:00.000	1	44.15	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
656	10903	HANAR	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-04 00:00:00.000	3	36.71	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
657	10904	WHITC	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-02-27 00:00:00.000	3	162.95	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
658	10905	WELLI	9	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-06 00:00:00.000	2	13.72	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
659	10906	WOLZA	4	1998-02-25 00:00:00	1998-03-11 00:00:00	1998-03-03 00:00:00.000	3	26.29	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
660	10907	SPECD	6	1998-02-25 00:00:00	1998-03-25 00:00:00	1998-02-27 00:00:00.000	3	9.19	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
661	10908	REGGC	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-06 00:00:00.000	2	32.96	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
662	10909	SANTG	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-10 00:00:00.000	2	53.05	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
663	10910	WILMK	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	3	38.11	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
664	10911	GODOS	3	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-05 00:00:00.000	1	38.19	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
665	10912	HUNGO	2	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-18 00:00:00.000	2	580.91	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
666	10913	QUEEN	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	1	33.05	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
667	10914	QUEEN	6	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	1	21.19	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
668	10915	TORTU	2	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	2	3.51	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
669	10916	RANCH	1	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-09 00:00:00.000	2	63.77	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
670	10917	ROMEY	4	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	2	8.29	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
671	10918	BOTTM	3	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	3	48.83	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
672	10919	LINOD	2	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-04 00:00:00.000	2	19.8	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
673	10920	AROUT	4	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-09 00:00:00.000	2	29.61	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
674	10921	VAFFE	1	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-09 00:00:00.000	1	176.48	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
675	10922	HANAR	5	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-05 00:00:00.000	3	62.74	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
676	10923	LAMAI	7	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-13 00:00:00.000	3	68.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
677	10924	BERGS	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-04-08 00:00:00.000	2	151.52	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
678	10925	HANAR	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-13 00:00:00.000	1	2.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
679	10926	ANATR	4	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-11 00:00:00.000	3	39.92	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
680	10927	LACOR	4	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	19.79	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
681	10928	GALED	1	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-18 00:00:00.000	1	1.36	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
682	10929	FRANK	6	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-12 00:00:00.000	1	33.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
683	10930	SUPRD	4	1998-03-06 00:00:00	1998-04-17 00:00:00	1998-03-18 00:00:00.000	3	15.55	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
684	10931	RICSU	4	1998-03-06 00:00:00	1998-03-20 00:00:00	1998-03-19 00:00:00.000	2	13.6	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
685	10932	BONAP	8	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-24 00:00:00.000	1	134.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
686	10933	ISLAT	6	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-16 00:00:00.000	3	54.15	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
687	10934	LEHMS	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-12 00:00:00.000	3	32.01	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
688	10935	WELLI	4	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	3	47.59	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
689	10936	GREAL	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	2	33.68	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
690	10937	CACTU	7	1998-03-10 00:00:00	1998-03-24 00:00:00	1998-03-13 00:00:00.000	3	31.51	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
691	10938	QUICK	3	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-16 00:00:00.000	2	31.89	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
692	10939	MAGAA	2	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-13 00:00:00.000	2	76.33	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
693	10940	BONAP	8	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-23 00:00:00.000	3	19.77	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
694	10941	SAVEA	7	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-20 00:00:00.000	2	400.81	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
695	10942	REGGC	9	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-18 00:00:00.000	3	17.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
696	10943	BSBEV	4	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-19 00:00:00.000	2	2.17	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
697	10944	BOTTM	6	1998-03-12 00:00:00	1998-03-26 00:00:00	1998-03-13 00:00:00.000	3	52.92	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
698	10945	MORGK	4	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-18 00:00:00.000	1	10.22	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
699	10946	VAFFE	1	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-19 00:00:00.000	2	27.2	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
700	10947	BSBEV	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-16 00:00:00.000	2	3.26	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
701	10948	GODOS	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-19 00:00:00.000	3	23.39	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
702	10949	BOTTM	2	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-17 00:00:00.000	3	74.44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
703	10950	MAGAA	1	1998-03-16 00:00:00	1998-04-13 00:00:00	1998-03-23 00:00:00.000	2	2.5	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
704	10951	RICSU	9	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-04-07 00:00:00.000	2	30.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
705	10952	ALFKI	1	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-03-24 00:00:00.000	1	40.42	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
706	10953	AROUT	9	1998-03-16 00:00:00	1998-03-30 00:00:00	1998-03-25 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
707	10954	LINOD	5	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	1	27.91	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
708	10955	FOLKO	8	1998-03-17 00:00:00	1998-04-14 00:00:00	1998-03-20 00:00:00.000	2	3.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
709	10956	BLAUS	6	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	2	44.65	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
710	10957	HILAA	8	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	3	105.36	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
711	10958	OCEAN	7	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	2	49.56	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
712	10959	GOURL	6	1998-03-18 00:00:00	1998-04-29 00:00:00	1998-03-23 00:00:00.000	2	4.98	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
713	10960	HILAA	3	1998-03-19 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	2.08	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
714	10961	QUEEN	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-30 00:00:00.000	1	104.47	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
715	10962	QUICK	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-23 00:00:00.000	2	275.79	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
716	10963	FURIB	9	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-26 00:00:00.000	3	2.7	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
717	10964	SPECD	3	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-24 00:00:00.000	2	87.38	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
718	10965	OLDWO	6	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-30 00:00:00.000	3	144.38	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
719	10966	CHOPS	4	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-04-08 00:00:00.000	1	27.19	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
720	10967	TOMSP	2	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-02 00:00:00.000	2	62.22	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
721	10968	ERNSH	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-01 00:00:00.000	3	74.6	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
722	10969	COMMI	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-03-30 00:00:00.000	2	0.21	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
723	10970	BOLID	9	1998-03-24 00:00:00	1998-04-07 00:00:00	1998-04-24 00:00:00.000	1	16.16	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
724	10971	FRANR	2	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-04-02 00:00:00.000	2	121.82	France restauration	54 rue Royale	Nantes	NULL	44000	France
725	10972	LACOR	4	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-26 00:00:00.000	2	0.02	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
726	10973	LACOR	6	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-27 00:00:00.000	2	15.17	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
727	10974	SPLIR	3	1998-03-25 00:00:00	1998-04-08 00:00:00	1998-04-03 00:00:00.000	3	12.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
728	10975	BOTTM	1	1998-03-25 00:00:00	1998-04-22 00:00:00	1998-03-27 00:00:00.000	3	32.27	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
729	10976	HILAA	1	1998-03-25 00:00:00	1998-05-06 00:00:00	1998-04-03 00:00:00.000	1	37.97	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
730	10977	FOLKO	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-10 00:00:00.000	3	208.5	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
731	10978	MAISD	9	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-23 00:00:00.000	2	32.82	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
732	10979	ERNSH	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-03-31 00:00:00.000	2	353.07	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
733	10980	FOLKO	4	1998-03-27 00:00:00	1998-05-08 00:00:00	1998-04-17 00:00:00.000	1	1.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
734	10981	HANAR	1	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-02 00:00:00.000	2	193.37	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
735	10982	BOTTM	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-08 00:00:00.000	1	14.01	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
736	10983	SAVEA	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-06 00:00:00.000	2	657.54	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
737	10984	SAVEA	1	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-03 00:00:00.000	3	211.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
738	10985	HUNGO	2	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-02 00:00:00.000	1	91.51	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
739	10986	OCEAN	8	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-21 00:00:00.000	2	217.86	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
740	10987	EASTC	8	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-06 00:00:00.000	1	185.48	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
741	10988	RATTC	3	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-10 00:00:00.000	2	61.14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
742	10989	QUEDE	2	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-02 00:00:00.000	1	34.76	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
743	10990	ERNSH	2	1998-04-01 00:00:00	1998-05-13 00:00:00	1998-04-07 00:00:00.000	3	117.61	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
744	10991	QUICK	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-07 00:00:00.000	1	38.51	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
745	10992	THEBI	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-03 00:00:00.000	3	4.27	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
746	10993	FOLKO	7	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-10 00:00:00.000	3	8.81	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
747	10994	VAFFE	2	1998-04-02 00:00:00	1998-04-16 00:00:00	1998-04-09 00:00:00.000	3	65.53	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
748	10995	PERIC	1	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-06 00:00:00.000	3	46	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
749	10996	QUICK	4	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-10 00:00:00.000	2	1.12	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
750	10997	LILAS	8	1998-04-03 00:00:00	1998-05-15 00:00:00	1998-04-13 00:00:00.000	2	73.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
751	10998	WOLZA	8	1998-04-03 00:00:00	1998-04-17 00:00:00	1998-04-17 00:00:00.000	2	20.31	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
752	10999	OTTIK	6	1998-04-03 00:00:00	1998-05-01 00:00:00	1998-04-10 00:00:00.000	2	96.35	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
753	11000	RATTC	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	3	55.12	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
754	11001	FOLKO	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	2	197.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
755	11002	SAVEA	4	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-16 00:00:00.000	1	141.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
756	11003	THECR	3	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-08 00:00:00.000	3	14.91	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
757	11004	MAISD	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-20 00:00:00.000	1	44.84	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
758	11005	WILMK	2	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-10 00:00:00.000	1	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
759	11006	GREAL	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-15 00:00:00.000	2	25.19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
760	11007	PRINI	8	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-13 00:00:00.000	2	202.24	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
761	11008	ERNSH	7	1998-04-08 00:00:00	1998-05-06 00:00:00	NULL	3	79.46	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
762	11009	GODOS	2	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-10 00:00:00.000	1	59.11	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
763	11010	REGGC	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-21 00:00:00.000	2	28.71	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
764	11011	ALFKI	3	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-13 00:00:00.000	1	1.21	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
765	11012	FRANK	1	1998-04-09 00:00:00	1998-04-23 00:00:00	1998-04-17 00:00:00.000	3	242.95	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
766	11013	ROMEY	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-10 00:00:00.000	1	32.99	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
767	11014	LINOD	2	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-15 00:00:00.000	3	23.6	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
768	11015	SANTG	2	1998-04-10 00:00:00	1998-04-24 00:00:00	1998-04-20 00:00:00.000	2	4.62	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
769	11016	AROUT	9	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-13 00:00:00.000	2	33.8	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
770	11017	ERNSH	9	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-20 00:00:00.000	2	754.26	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
771	11018	LONEP	4	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-16 00:00:00.000	2	11.65	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
772	11019	RANCH	6	1998-04-13 00:00:00	1998-05-11 00:00:00	NULL	3	3.17	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
773	11020	OTTIK	2	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-16 00:00:00.000	2	43.3	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
774	11021	QUICK	3	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-21 00:00:00.000	1	297.18	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
775	11022	HANAR	9	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-05-04 00:00:00.000	2	6.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
776	11023	BSBEV	1	1998-04-14 00:00:00	1998-04-28 00:00:00	1998-04-24 00:00:00.000	2	123.83	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
777	11024	EASTC	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-20 00:00:00.000	1	74.36	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
778	11025	WARTH	6	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-24 00:00:00.000	3	29.17	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
779	11026	FRANS	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-28 00:00:00.000	1	47.09	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
780	11027	BOTTM	1	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-20 00:00:00.000	1	52.52	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
781	11028	KOENE	2	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-22 00:00:00.000	1	29.59	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
782	11029	CHOPS	4	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-27 00:00:00.000	1	47.84	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
783	11030	SAVEA	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-27 00:00:00.000	2	830.75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
784	11031	SAVEA	6	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-24 00:00:00.000	2	227.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
785	11032	WHITC	2	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	606.19	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
786	11033	RICSU	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	84.74	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
787	11034	OLDWO	8	1998-04-20 00:00:00	1998-06-01 00:00:00	1998-04-27 00:00:00.000	1	40.32	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
788	11035	SUPRD	2	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-24 00:00:00.000	2	0.17	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
789	11036	DRACD	8	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-22 00:00:00.000	3	149.47	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
790	11037	GODOS	7	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-27 00:00:00.000	1	3.2	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
791	11038	SUPRD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-30 00:00:00.000	2	29.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
792	11039	LINOD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	NULL	2	65	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
793	11040	GREAL	4	1998-04-22 00:00:00	1998-05-20 00:00:00	NULL	3	18.84	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
794	11041	CHOPS	3	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-28 00:00:00.000	2	48.22	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
795	11042	COMMI	2	1998-04-22 00:00:00	1998-05-06 00:00:00	1998-05-01 00:00:00.000	1	29.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
796	11043	SPECD	5	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-29 00:00:00.000	2	8.8	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
797	11044	WOLZA	4	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-05-01 00:00:00.000	1	8.72	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
798	11045	BOTTM	6	1998-04-23 00:00:00	1998-05-21 00:00:00	NULL	2	70.58	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
799	11046	WANDK	8	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-04-24 00:00:00.000	2	71.64	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
800	11047	EASTC	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-01 00:00:00.000	3	46.62	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
801	11048	BOTTM	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-04-30 00:00:00.000	3	24.12	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
802	11049	GOURL	3	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-04 00:00:00.000	1	8.34	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
803	11050	FOLKO	8	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-05 00:00:00.000	2	59.41	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
804	11051	LAMAI	7	1998-04-27 00:00:00	1998-05-25 00:00:00	NULL	3	2.79	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
805	11052	HANAR	3	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-01 00:00:00.000	1	67.26	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
806	11053	PICCO	2	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-04-29 00:00:00.000	2	53.05	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
807	11054	CACTU	8	1998-04-28 00:00:00	1998-05-26 00:00:00	NULL	1	0.33	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
808	11055	HILAA	7	1998-04-28 00:00:00	1998-05-26 00:00:00	1998-05-05 00:00:00.000	2	120.92	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
809	11056	EASTC	8	1998-04-28 00:00:00	1998-05-12 00:00:00	1998-05-01 00:00:00.000	2	278.96	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
810	11057	NORTS	3	1998-04-29 00:00:00	1998-05-27 00:00:00	1998-05-01 00:00:00.000	3	4.13	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
811	11058	BLAUS	9	1998-04-29 00:00:00	1998-05-27 00:00:00	NULL	3	31.14	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
812	11059	RICAR	2	1998-04-29 00:00:00	1998-06-10 00:00:00	NULL	2	85.8	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
813	11060	FRANS	2	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-04 00:00:00.000	2	10.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
814	11061	GREAL	4	1998-04-30 00:00:00	1998-06-11 00:00:00	NULL	3	14.01	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
815	11062	REGGC	4	1998-04-30 00:00:00	1998-05-28 00:00:00	NULL	2	29.93	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
816	11063	HUNGO	3	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-06 00:00:00.000	2	81.73	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
817	11064	SAVEA	1	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	1	30.09	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
818	11065	LILAS	8	1998-05-01 00:00:00	1998-05-29 00:00:00	NULL	1	12.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
819	11066	WHITC	7	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	2	44.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
820	11067	DRACD	1	1998-05-04 00:00:00	1998-05-18 00:00:00	1998-05-06 00:00:00.000	2	7.98	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
821	11068	QUEEN	8	1998-05-04 00:00:00	1998-06-01 00:00:00	NULL	2	81.75	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
822	11069	TORTU	1	1998-05-04 00:00:00	1998-06-01 00:00:00	1998-05-06 00:00:00.000	2	15.67	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
823	11070	LEHMS	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	136	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
824	11071	LILAS	1	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	0.93	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
825	11072	ERNSH	4	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	258.64	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
826	11073	PERIC	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	24.95	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
827	11074	SIMOB	7	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	18.44	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
828	11075	RICSU	8	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	6.19	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
829	11076	BONAP	4	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	38.28	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
830	11077	RATTC	1	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	8.53	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
831	10248	VINET	5	1996-07-04 00:00:00	1996-08-01 00:00:00	1996-07-16 00:00:00.000	3	32.38	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
832	10249	TOMSP	6	1996-07-05 00:00:00	1996-08-16 00:00:00	1996-07-10 00:00:00.000	1	11.61	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
833	10250	HANAR	4	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-12 00:00:00.000	2	65.83	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
834	10251	VICTE	3	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-15 00:00:00.000	1	41.34	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
835	10252	SUPRD	4	1996-07-09 00:00:00	1996-08-06 00:00:00	1996-07-11 00:00:00.000	2	51.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
836	10253	HANAR	3	1996-07-10 00:00:00	1996-07-24 00:00:00	1996-07-16 00:00:00.000	2	58.17	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
837	10254	CHOPS	5	1996-07-11 00:00:00	1996-08-08 00:00:00	1996-07-23 00:00:00.000	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
838	10255	RICSU	9	1996-07-12 00:00:00	1996-08-09 00:00:00	1996-07-15 00:00:00.000	3	148.33	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
839	10256	WELLI	3	1996-07-15 00:00:00	1996-08-12 00:00:00	1996-07-17 00:00:00.000	2	13.97	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
840	10257	HILAA	4	1996-07-16 00:00:00	1996-08-13 00:00:00	1996-07-22 00:00:00.000	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
841	10258	ERNSH	1	1996-07-17 00:00:00	1996-08-14 00:00:00	1996-07-23 00:00:00.000	1	140.51	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
842	10259	CENTC	4	1996-07-18 00:00:00	1996-08-15 00:00:00	1996-07-25 00:00:00.000	3	3.25	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	NULL	05022	Mexico
843	10260	OTTIK	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-29 00:00:00.000	1	55.09	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
844	10261	QUEDE	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-30 00:00:00.000	2	3.05	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
845	10262	RATTC	8	1996-07-22 00:00:00	1996-08-19 00:00:00	1996-07-25 00:00:00.000	3	48.29	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
846	10263	ERNSH	9	1996-07-23 00:00:00	1996-08-20 00:00:00	1996-07-31 00:00:00.000	3	146.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
847	10264	FOLKO	6	1996-07-24 00:00:00	1996-08-21 00:00:00	1996-08-23 00:00:00.000	3	3.67	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
848	10265	BLONP	2	1996-07-25 00:00:00	1996-08-22 00:00:00	1996-08-12 00:00:00.000	1	55.28	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
849	10266	WARTH	3	1996-07-26 00:00:00	1996-09-06 00:00:00	1996-07-31 00:00:00.000	3	25.73	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
850	10267	FRANK	4	1996-07-29 00:00:00	1996-08-26 00:00:00	1996-08-06 00:00:00.000	1	208.58	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
851	10268	GROSR	8	1996-07-30 00:00:00	1996-08-27 00:00:00	1996-08-02 00:00:00.000	3	66.29	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
852	10269	WHITC	5	1996-07-31 00:00:00	1996-08-14 00:00:00	1996-08-09 00:00:00.000	1	4.56	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
853	10270	WARTH	1	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-02 00:00:00.000	1	136.54	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
854	10271	SPLIR	6	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-30 00:00:00.000	2	4.54	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
855	10272	RATTC	6	1996-08-02 00:00:00	1996-08-30 00:00:00	1996-08-06 00:00:00.000	2	98.03	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
856	10273	QUICK	3	1996-08-05 00:00:00	1996-09-02 00:00:00	1996-08-12 00:00:00.000	3	76.07	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
857	10274	VINET	6	1996-08-06 00:00:00	1996-09-03 00:00:00	1996-08-16 00:00:00.000	1	6.01	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
858	10275	MAGAA	1	1996-08-07 00:00:00	1996-09-04 00:00:00	1996-08-09 00:00:00.000	1	26.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
859	10276	TORTU	8	1996-08-08 00:00:00	1996-08-22 00:00:00	1996-08-14 00:00:00.000	3	13.84	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
860	10277	MORGK	2	1996-08-09 00:00:00	1996-09-06 00:00:00	1996-08-13 00:00:00.000	3	125.77	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
861	10278	BERGS	8	1996-08-12 00:00:00	1996-09-09 00:00:00	1996-08-16 00:00:00.000	2	92.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
862	10279	LEHMS	8	1996-08-13 00:00:00	1996-09-10 00:00:00	1996-08-16 00:00:00.000	2	25.83	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
863	10280	BERGS	2	1996-08-14 00:00:00	1996-09-11 00:00:00	1996-09-12 00:00:00.000	1	8.98	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
864	10281	ROMEY	4	1996-08-14 00:00:00	1996-08-28 00:00:00	1996-08-21 00:00:00.000	1	2.94	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
865	10282	ROMEY	4	1996-08-15 00:00:00	1996-09-12 00:00:00	1996-08-21 00:00:00.000	1	12.69	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
866	10283	LILAS	3	1996-08-16 00:00:00	1996-09-13 00:00:00	1996-08-23 00:00:00.000	3	84.81	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
867	10284	LEHMS	4	1996-08-19 00:00:00	1996-09-16 00:00:00	1996-08-27 00:00:00.000	1	76.56	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
868	10285	QUICK	1	1996-08-20 00:00:00	1996-09-17 00:00:00	1996-08-26 00:00:00.000	2	76.83	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
869	10286	QUICK	8	1996-08-21 00:00:00	1996-09-18 00:00:00	1996-08-30 00:00:00.000	3	229.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
870	10287	RICAR	8	1996-08-22 00:00:00	1996-09-19 00:00:00	1996-08-28 00:00:00.000	3	12.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
871	10288	REGGC	4	1996-08-23 00:00:00	1996-09-20 00:00:00	1996-09-03 00:00:00.000	1	7.45	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
872	10289	BSBEV	7	1996-08-26 00:00:00	1996-09-23 00:00:00	1996-08-28 00:00:00.000	3	22.77	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
873	10290	COMMI	8	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-03 00:00:00.000	1	79.7	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
874	10291	QUEDE	6	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-04 00:00:00.000	2	6.4	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
875	10292	TRADH	1	1996-08-28 00:00:00	1996-09-25 00:00:00	1996-09-02 00:00:00.000	2	1.35	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
876	10293	TORTU	1	1996-08-29 00:00:00	1996-09-26 00:00:00	1996-09-11 00:00:00.000	3	21.18	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
877	10294	RATTC	4	1996-08-30 00:00:00	1996-09-27 00:00:00	1996-09-05 00:00:00.000	2	147.26	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
878	10295	VINET	2	1996-09-02 00:00:00	1996-09-30 00:00:00	1996-09-10 00:00:00.000	2	1.15	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
879	10296	LILAS	6	1996-09-03 00:00:00	1996-10-01 00:00:00	1996-09-11 00:00:00.000	1	0.12	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
880	10297	BLONP	5	1996-09-04 00:00:00	1996-10-16 00:00:00	1996-09-10 00:00:00.000	2	5.74	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
881	10298	HUNGO	6	1996-09-05 00:00:00	1996-10-03 00:00:00	1996-09-11 00:00:00.000	2	168.22	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
882	10299	RICAR	4	1996-09-06 00:00:00	1996-10-04 00:00:00	1996-09-13 00:00:00.000	2	29.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
883	10300	MAGAA	2	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-18 00:00:00.000	2	17.68	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
884	10301	WANDK	8	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-17 00:00:00.000	2	45.08	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
885	10302	SUPRD	4	1996-09-10 00:00:00	1996-10-08 00:00:00	1996-10-09 00:00:00.000	2	6.27	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
886	10303	GODOS	7	1996-09-11 00:00:00	1996-10-09 00:00:00	1996-09-18 00:00:00.000	2	107.83	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
887	10304	TORTU	1	1996-09-12 00:00:00	1996-10-10 00:00:00	1996-09-17 00:00:00.000	2	63.79	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
888	10305	OLDWO	8	1996-09-13 00:00:00	1996-10-11 00:00:00	1996-10-09 00:00:00.000	3	257.62	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
889	10306	ROMEY	1	1996-09-16 00:00:00	1996-10-14 00:00:00	1996-09-23 00:00:00.000	3	7.56	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
890	10307	LONEP	2	1996-09-17 00:00:00	1996-10-15 00:00:00	1996-09-25 00:00:00.000	2	0.56	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
891	10308	ANATR	7	1996-09-18 00:00:00	1996-10-16 00:00:00	1996-09-24 00:00:00.000	3	1.61	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
892	10309	HUNGO	3	1996-09-19 00:00:00	1996-10-17 00:00:00	1996-10-23 00:00:00.000	1	47.3	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
893	10310	THEBI	8	1996-09-20 00:00:00	1996-10-18 00:00:00	1996-09-27 00:00:00.000	2	17.52	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
894	10311	DUMON	1	1996-09-20 00:00:00	1996-10-04 00:00:00	1996-09-26 00:00:00.000	3	24.69	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
895	10312	WANDK	2	1996-09-23 00:00:00	1996-10-21 00:00:00	1996-10-03 00:00:00.000	2	40.26	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
896	10313	QUICK	2	1996-09-24 00:00:00	1996-10-22 00:00:00	1996-10-04 00:00:00.000	2	1.96	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
897	10314	RATTC	1	1996-09-25 00:00:00	1996-10-23 00:00:00	1996-10-04 00:00:00.000	2	74.16	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
898	10315	ISLAT	4	1996-09-26 00:00:00	1996-10-24 00:00:00	1996-10-03 00:00:00.000	2	41.76	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
899	10316	RATTC	1	1996-09-27 00:00:00	1996-10-25 00:00:00	1996-10-08 00:00:00.000	3	150.15	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
900	10317	LONEP	6	1996-09-30 00:00:00	1996-10-28 00:00:00	1996-10-10 00:00:00.000	1	12.69	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
901	10318	ISLAT	8	1996-10-01 00:00:00	1996-10-29 00:00:00	1996-10-04 00:00:00.000	2	4.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
902	10319	TORTU	7	1996-10-02 00:00:00	1996-10-30 00:00:00	1996-10-11 00:00:00.000	3	64.5	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
903	10320	WARTH	5	1996-10-03 00:00:00	1996-10-17 00:00:00	1996-10-18 00:00:00.000	3	34.57	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
904	10321	ISLAT	3	1996-10-03 00:00:00	1996-10-31 00:00:00	1996-10-11 00:00:00.000	2	3.43	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
905	10322	PERIC	7	1996-10-04 00:00:00	1996-11-01 00:00:00	1996-10-23 00:00:00.000	3	0.4	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
906	10323	KOENE	4	1996-10-07 00:00:00	1996-11-04 00:00:00	1996-10-14 00:00:00.000	1	4.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
907	10324	SAVEA	9	1996-10-08 00:00:00	1996-11-05 00:00:00	1996-10-10 00:00:00.000	1	214.27	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
908	10325	KOENE	1	1996-10-09 00:00:00	1996-10-23 00:00:00	1996-10-14 00:00:00.000	3	64.86	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
909	10326	BOLID	4	1996-10-10 00:00:00	1996-11-07 00:00:00	1996-10-14 00:00:00.000	2	77.92	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
910	10327	FOLKO	2	1996-10-11 00:00:00	1996-11-08 00:00:00	1996-10-14 00:00:00.000	1	63.36	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
911	10328	FURIB	4	1996-10-14 00:00:00	1996-11-11 00:00:00	1996-10-17 00:00:00.000	3	87.03	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
912	10329	SPLIR	4	1996-10-15 00:00:00	1996-11-26 00:00:00	1996-10-23 00:00:00.000	2	191.67	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
913	10330	LILAS	3	1996-10-16 00:00:00	1996-11-13 00:00:00	1996-10-28 00:00:00.000	1	12.75	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
914	10331	BONAP	9	1996-10-16 00:00:00	1996-11-27 00:00:00	1996-10-21 00:00:00.000	1	10.19	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
915	10332	MEREP	3	1996-10-17 00:00:00	1996-11-28 00:00:00	1996-10-21 00:00:00.000	2	52.84	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
916	10333	WARTH	5	1996-10-18 00:00:00	1996-11-15 00:00:00	1996-10-25 00:00:00.000	3	0.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
917	10334	VICTE	8	1996-10-21 00:00:00	1996-11-18 00:00:00	1996-10-28 00:00:00.000	2	8.56	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
918	10335	HUNGO	7	1996-10-22 00:00:00	1996-11-19 00:00:00	1996-10-24 00:00:00.000	2	42.11	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
919	10336	PRINI	7	1996-10-23 00:00:00	1996-11-20 00:00:00	1996-10-25 00:00:00.000	2	15.51	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
920	10337	FRANK	4	1996-10-24 00:00:00	1996-11-21 00:00:00	1996-10-29 00:00:00.000	3	108.26	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
921	10338	OLDWO	4	1996-10-25 00:00:00	1996-11-22 00:00:00	1996-10-29 00:00:00.000	3	84.21	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
922	10339	MEREP	2	1996-10-28 00:00:00	1996-11-25 00:00:00	1996-11-04 00:00:00.000	2	15.66	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
923	10340	BONAP	1	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-08 00:00:00.000	3	166.31	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
924	10341	SIMOB	7	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-05 00:00:00.000	3	26.78	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
925	10342	FRANK	4	1996-10-30 00:00:00	1996-11-13 00:00:00	1996-11-04 00:00:00.000	2	54.83	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
926	10343	LEHMS	4	1996-10-31 00:00:00	1996-11-28 00:00:00	1996-11-06 00:00:00.000	1	110.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
927	10344	WHITC	4	1996-11-01 00:00:00	1996-11-29 00:00:00	1996-11-05 00:00:00.000	2	23.29	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
928	10345	QUICK	2	1996-11-04 00:00:00	1996-12-02 00:00:00	1996-11-11 00:00:00.000	2	249.06	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
929	10346	RATTC	3	1996-11-05 00:00:00	1996-12-17 00:00:00	1996-11-08 00:00:00.000	3	142.08	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
930	10347	FAMIA	4	1996-11-06 00:00:00	1996-12-04 00:00:00	1996-11-08 00:00:00.000	3	3.1	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
931	10348	WANDK	4	1996-11-07 00:00:00	1996-12-05 00:00:00	1996-11-15 00:00:00.000	2	0.78	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
932	10349	SPLIR	7	1996-11-08 00:00:00	1996-12-06 00:00:00	1996-11-15 00:00:00.000	1	8.63	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
933	10350	LAMAI	6	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-12-03 00:00:00.000	2	64.19	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
934	10351	ERNSH	1	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-11-20 00:00:00.000	1	162.33	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
935	10352	FURIB	3	1996-11-12 00:00:00	1996-11-26 00:00:00	1996-11-18 00:00:00.000	3	1.3	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
936	10353	PICCO	7	1996-11-13 00:00:00	1996-12-11 00:00:00	1996-11-25 00:00:00.000	3	360.63	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
937	10354	PERIC	8	1996-11-14 00:00:00	1996-12-12 00:00:00	1996-11-20 00:00:00.000	3	53.8	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
938	10355	AROUT	6	1996-11-15 00:00:00	1996-12-13 00:00:00	1996-11-20 00:00:00.000	1	41.95	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
939	10356	WANDK	6	1996-11-18 00:00:00	1996-12-16 00:00:00	1996-11-27 00:00:00.000	2	36.71	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
940	10357	LILAS	1	1996-11-19 00:00:00	1996-12-17 00:00:00	1996-12-02 00:00:00.000	3	34.88	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
941	10358	LAMAI	5	1996-11-20 00:00:00	1996-12-18 00:00:00	1996-11-27 00:00:00.000	1	19.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
942	10359	SEVES	5	1996-11-21 00:00:00	1996-12-19 00:00:00	1996-11-26 00:00:00.000	3	288.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
943	10360	BLONP	4	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-02 00:00:00.000	3	131.7	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
944	10361	QUICK	1	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-03 00:00:00.000	2	183.17	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
945	10362	BONAP	3	1996-11-25 00:00:00	1996-12-23 00:00:00	1996-11-28 00:00:00.000	1	96.04	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
946	10363	DRACD	4	1996-11-26 00:00:00	1996-12-24 00:00:00	1996-12-04 00:00:00.000	3	30.54	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
947	10364	EASTC	1	1996-11-26 00:00:00	1997-01-07 00:00:00	1996-12-04 00:00:00.000	1	71.97	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
948	10365	ANTON	3	1996-11-27 00:00:00	1996-12-25 00:00:00	1996-12-02 00:00:00.000	2	22	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
949	10366	GALED	8	1996-11-28 00:00:00	1997-01-09 00:00:00	1996-12-30 00:00:00.000	2	10.14	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
950	10367	VAFFE	7	1996-11-28 00:00:00	1996-12-26 00:00:00	1996-12-02 00:00:00.000	3	13.55	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
951	10368	ERNSH	2	1996-11-29 00:00:00	1996-12-27 00:00:00	1996-12-02 00:00:00.000	2	101.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
952	10369	SPLIR	8	1996-12-02 00:00:00	1996-12-30 00:00:00	1996-12-09 00:00:00.000	2	195.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
953	10370	CHOPS	6	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-27 00:00:00.000	2	1.17	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
954	10371	LAMAI	1	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-24 00:00:00.000	1	0.45	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
955	10372	QUEEN	5	1996-12-04 00:00:00	1997-01-01 00:00:00	1996-12-09 00:00:00.000	2	890.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
956	10373	HUNGO	4	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-11 00:00:00.000	3	124.12	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
957	10374	WOLZA	1	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-09 00:00:00.000	3	3.94	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
958	10375	HUNGC	3	1996-12-06 00:00:00	1997-01-03 00:00:00	1996-12-09 00:00:00.000	2	20.12	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
959	10376	MEREP	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	2	20.39	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
960	10377	SEVES	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	3	22.21	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
961	10378	FOLKO	5	1996-12-10 00:00:00	1997-01-07 00:00:00	1996-12-19 00:00:00.000	3	5.44	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
962	10379	QUEDE	2	1996-12-11 00:00:00	1997-01-08 00:00:00	1996-12-13 00:00:00.000	1	45.03	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
963	10380	HUNGO	8	1996-12-12 00:00:00	1997-01-09 00:00:00	1997-01-16 00:00:00.000	3	35.03	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
964	10381	LILAS	3	1996-12-12 00:00:00	1997-01-09 00:00:00	1996-12-13 00:00:00.000	3	7.99	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
965	10382	ERNSH	4	1996-12-13 00:00:00	1997-01-10 00:00:00	1996-12-16 00:00:00.000	1	94.77	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
966	10383	AROUT	8	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-18 00:00:00.000	3	34.24	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
967	10384	BERGS	3	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-20 00:00:00.000	3	168.64	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
968	10385	SPLIR	1	1996-12-17 00:00:00	1997-01-14 00:00:00	1996-12-23 00:00:00.000	2	30.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
969	10386	FAMIA	9	1996-12-18 00:00:00	1997-01-01 00:00:00	1996-12-25 00:00:00.000	3	13.99	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
970	10387	SANTG	1	1996-12-18 00:00:00	1997-01-15 00:00:00	1996-12-20 00:00:00.000	2	93.63	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
971	10388	SEVES	2	1996-12-19 00:00:00	1997-01-16 00:00:00	1996-12-20 00:00:00.000	1	34.86	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
972	10389	BOTTM	4	1996-12-20 00:00:00	1997-01-17 00:00:00	1996-12-24 00:00:00.000	2	47.42	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
973	10390	ERNSH	6	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-26 00:00:00.000	1	126.38	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
974	10391	DRACD	3	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-31 00:00:00.000	3	5.45	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
975	10392	PICCO	2	1996-12-24 00:00:00	1997-01-21 00:00:00	1997-01-01 00:00:00.000	3	122.46	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
976	10393	SAVEA	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	126.56	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
977	10394	HUNGC	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	30.34	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
978	10395	HILAA	6	1996-12-26 00:00:00	1997-01-23 00:00:00	1997-01-03 00:00:00.000	1	184.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
979	10396	FRANK	1	1996-12-27 00:00:00	1997-01-10 00:00:00	1997-01-06 00:00:00.000	3	135.35	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
980	10397	PRINI	5	1996-12-27 00:00:00	1997-01-24 00:00:00	1997-01-02 00:00:00.000	1	60.26	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
981	10398	SAVEA	2	1996-12-30 00:00:00	1997-01-27 00:00:00	1997-01-09 00:00:00.000	3	89.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
982	10399	VAFFE	8	1996-12-31 00:00:00	1997-01-14 00:00:00	1997-01-08 00:00:00.000	3	27.36	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
983	10400	EASTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-16 00:00:00.000	3	83.93	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
984	10401	RATTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-10 00:00:00.000	1	12.51	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
985	10402	ERNSH	8	1997-01-02 00:00:00	1997-02-13 00:00:00	1997-01-10 00:00:00.000	2	67.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
986	10403	ERNSH	4	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-09 00:00:00.000	3	73.79	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
987	10404	MAGAA	2	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-08 00:00:00.000	1	155.97	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
988	10405	LINOD	1	1997-01-06 00:00:00	1997-02-03 00:00:00	1997-01-22 00:00:00.000	1	34.82	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
989	10406	QUEEN	7	1997-01-07 00:00:00	1997-02-18 00:00:00	1997-01-13 00:00:00.000	1	108.04	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
990	10407	OTTIK	2	1997-01-07 00:00:00	1997-02-04 00:00:00	1997-01-30 00:00:00.000	2	91.48	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
991	10408	FOLIG	8	1997-01-08 00:00:00	1997-02-05 00:00:00	1997-01-14 00:00:00.000	1	11.26	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
992	10409	OCEAN	3	1997-01-09 00:00:00	1997-02-06 00:00:00	1997-01-14 00:00:00.000	1	29.83	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
993	10410	BOTTM	3	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-15 00:00:00.000	3	2.4	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
994	10411	BOTTM	9	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-21 00:00:00.000	3	23.65	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
995	10412	WARTH	8	1997-01-13 00:00:00	1997-02-10 00:00:00	1997-01-15 00:00:00.000	2	3.77	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
996	10413	LAMAI	3	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-16 00:00:00.000	2	95.66	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
997	10414	FAMIA	2	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-17 00:00:00.000	3	21.48	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
998	10415	HUNGC	3	1997-01-15 00:00:00	1997-02-12 00:00:00	1997-01-24 00:00:00.000	1	0.2	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
999	10416	WARTH	8	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-27 00:00:00.000	3	22.72	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1000	10417	SIMOB	4	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-28 00:00:00.000	3	70.29	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1001	10418	QUICK	4	1997-01-17 00:00:00	1997-02-14 00:00:00	1997-01-24 00:00:00.000	1	17.55	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1002	10419	RICSU	4	1997-01-20 00:00:00	1997-02-17 00:00:00	1997-01-30 00:00:00.000	2	137.35	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1003	10420	WELLI	3	1997-01-21 00:00:00	1997-02-18 00:00:00	1997-01-27 00:00:00.000	1	44.12	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1004	10421	QUEDE	8	1997-01-21 00:00:00	1997-03-04 00:00:00	1997-01-27 00:00:00.000	1	99.23	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1005	10422	FRANS	2	1997-01-22 00:00:00	1997-02-19 00:00:00	1997-01-31 00:00:00.000	1	3.02	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1006	10423	GOURL	6	1997-01-23 00:00:00	1997-02-06 00:00:00	1997-02-24 00:00:00.000	3	24.5	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1007	10424	MEREP	7	1997-01-23 00:00:00	1997-02-20 00:00:00	1997-01-27 00:00:00.000	2	370.61	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1008	10425	LAMAI	6	1997-01-24 00:00:00	1997-02-21 00:00:00	1997-02-14 00:00:00.000	2	7.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1009	10426	GALED	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-02-06 00:00:00.000	1	18.69	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1010	10427	PICCO	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-03-03 00:00:00.000	2	31.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1011	10428	REGGC	7	1997-01-28 00:00:00	1997-02-25 00:00:00	1997-02-04 00:00:00.000	1	11.09	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1012	10429	HUNGO	3	1997-01-29 00:00:00	1997-03-12 00:00:00	1997-02-07 00:00:00.000	2	56.63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1013	10430	ERNSH	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-03 00:00:00.000	1	458.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1014	10431	BOTTM	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-07 00:00:00.000	2	44.17	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1015	10432	SPLIR	3	1997-01-31 00:00:00	1997-02-14 00:00:00	1997-02-07 00:00:00.000	2	4.34	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1016	10433	PRINI	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-03-04 00:00:00.000	3	73.83	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1017	10434	FOLKO	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-02-13 00:00:00.000	2	17.92	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1018	10435	CONSH	8	1997-02-04 00:00:00	1997-03-18 00:00:00	1997-02-07 00:00:00.000	2	9.21	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
1019	10436	BLONP	3	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-11 00:00:00.000	2	156.66	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1020	10437	WARTH	8	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-12 00:00:00.000	1	19.97	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1021	10438	TOMSP	3	1997-02-06 00:00:00	1997-03-06 00:00:00	1997-02-14 00:00:00.000	2	8.24	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1022	10439	MEREP	6	1997-02-07 00:00:00	1997-03-07 00:00:00	1997-02-10 00:00:00.000	3	4.07	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1023	10440	SAVEA	4	1997-02-10 00:00:00	1997-03-10 00:00:00	1997-02-28 00:00:00.000	2	86.53	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1024	10441	OLDWO	3	1997-02-10 00:00:00	1997-03-24 00:00:00	1997-03-14 00:00:00.000	2	73.02	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1025	10442	ERNSH	3	1997-02-11 00:00:00	1997-03-11 00:00:00	1997-02-18 00:00:00.000	2	47.94	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1026	10443	REGGC	8	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-14 00:00:00.000	1	13.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1027	10444	BERGS	3	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-21 00:00:00.000	3	3.5	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1028	10445	BERGS	3	1997-02-13 00:00:00	1997-03-13 00:00:00	1997-02-20 00:00:00.000	1	9.3	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1029	10446	TOMSP	6	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-02-19 00:00:00.000	1	14.68	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1030	10447	RICAR	4	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-03-07 00:00:00.000	2	68.66	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1031	10448	RANCH	4	1997-02-17 00:00:00	1997-03-17 00:00:00	1997-02-24 00:00:00.000	2	38.82	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1032	10449	BLONP	3	1997-02-18 00:00:00	1997-03-18 00:00:00	1997-02-27 00:00:00.000	2	53.3	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1033	10450	VICTE	8	1997-02-19 00:00:00	1997-03-19 00:00:00	1997-03-11 00:00:00.000	2	7.23	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1034	10451	QUICK	4	1997-02-19 00:00:00	1997-03-05 00:00:00	1997-03-12 00:00:00.000	3	189.09	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1035	10452	SAVEA	8	1997-02-20 00:00:00	1997-03-20 00:00:00	1997-02-26 00:00:00.000	1	140.26	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1036	10453	AROUT	1	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-26 00:00:00.000	2	25.36	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1037	10454	LAMAI	4	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-25 00:00:00.000	3	2.74	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1038	10455	WARTH	8	1997-02-24 00:00:00	1997-04-07 00:00:00	1997-03-03 00:00:00.000	2	180.45	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1039	10456	KOENE	8	1997-02-25 00:00:00	1997-04-08 00:00:00	1997-02-28 00:00:00.000	2	8.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1040	10457	KOENE	2	1997-02-25 00:00:00	1997-03-25 00:00:00	1997-03-03 00:00:00.000	1	11.57	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1041	10458	SUPRD	7	1997-02-26 00:00:00	1997-03-26 00:00:00	1997-03-04 00:00:00.000	3	147.06	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1042	10459	VICTE	4	1997-02-27 00:00:00	1997-03-27 00:00:00	1997-02-28 00:00:00.000	2	25.09	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1043	10460	FOLKO	8	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-03 00:00:00.000	1	16.27	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1044	10461	LILAS	1	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-05 00:00:00.000	3	148.61	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1045	10462	CONSH	2	1997-03-03 00:00:00	1997-03-31 00:00:00	1997-03-18 00:00:00.000	1	6.17	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
1046	10463	SUPRD	5	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-06 00:00:00.000	3	14.78	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1047	10464	FURIB	4	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-14 00:00:00.000	2	89	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1048	10465	VAFFE	1	1997-03-05 00:00:00	1997-04-02 00:00:00	1997-03-14 00:00:00.000	3	145.04	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1049	10466	COMMI	4	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-13 00:00:00.000	1	11.93	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1050	10467	MAGAA	8	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-11 00:00:00.000	2	4.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1051	10468	KOENE	3	1997-03-07 00:00:00	1997-04-04 00:00:00	1997-03-12 00:00:00.000	3	44.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1052	10469	WHITC	1	1997-03-10 00:00:00	1997-04-07 00:00:00	1997-03-14 00:00:00.000	1	60.18	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1053	10470	BONAP	4	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-14 00:00:00.000	2	64.56	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1054	10471	BSBEV	2	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-18 00:00:00.000	3	45.59	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1055	10472	SEVES	8	1997-03-12 00:00:00	1997-04-09 00:00:00	1997-03-19 00:00:00.000	1	4.2	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1056	10473	ISLAT	1	1997-03-13 00:00:00	1997-03-27 00:00:00	1997-03-21 00:00:00.000	3	16.37	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1057	10474	PERIC	5	1997-03-13 00:00:00	1997-04-10 00:00:00	1997-03-21 00:00:00.000	2	83.49	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1058	10475	SUPRD	9	1997-03-14 00:00:00	1997-04-11 00:00:00	1997-04-04 00:00:00.000	1	68.52	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1059	10476	HILAA	8	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-24 00:00:00.000	3	4.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1060	10477	PRINI	5	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-25 00:00:00.000	2	13.02	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1061	10478	VICTE	2	1997-03-18 00:00:00	1997-04-01 00:00:00	1997-03-26 00:00:00.000	3	4.81	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1062	10479	RATTC	3	1997-03-19 00:00:00	1997-04-16 00:00:00	1997-03-21 00:00:00.000	3	708.95	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1063	10480	FOLIG	6	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-24 00:00:00.000	2	1.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1064	10481	RICAR	8	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-25 00:00:00.000	2	64.33	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1065	10482	LAZYK	1	1997-03-21 00:00:00	1997-04-18 00:00:00	1997-04-10 00:00:00.000	3	7.48	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
1066	10483	WHITC	7	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-25 00:00:00.000	2	15.28	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1067	10484	BSBEV	3	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-01 00:00:00.000	3	6.88	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1068	10485	LINOD	4	1997-03-25 00:00:00	1997-04-08 00:00:00	1997-03-31 00:00:00.000	2	64.45	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1069	10486	HILAA	1	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-04-02 00:00:00.000	2	30.53	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1070	10487	QUEEN	2	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-03-28 00:00:00.000	2	71.07	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1071	10488	FRANK	8	1997-03-27 00:00:00	1997-04-24 00:00:00	1997-04-02 00:00:00.000	2	4.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1072	10489	PICCO	6	1997-03-28 00:00:00	1997-04-25 00:00:00	1997-04-09 00:00:00.000	2	5.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1073	10490	HILAA	7	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-03 00:00:00.000	2	210.19	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1074	10491	FURIB	8	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-08 00:00:00.000	3	16.96	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1075	10492	BOTTM	3	1997-04-01 00:00:00	1997-04-29 00:00:00	1997-04-11 00:00:00.000	1	62.89	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1076	10493	LAMAI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-10 00:00:00.000	3	10.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1077	10494	COMMI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-09 00:00:00.000	2	65.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1078	10495	LAUGB	3	1997-04-03 00:00:00	1997-05-01 00:00:00	1997-04-11 00:00:00.000	3	4.65	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
1079	10496	TRADH	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	2	46.77	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1080	10497	LEHMS	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	1	36.21	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1081	10498	HILAA	8	1997-04-07 00:00:00	1997-05-05 00:00:00	1997-04-11 00:00:00.000	2	29.75	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1082	10499	LILAS	4	1997-04-08 00:00:00	1997-05-06 00:00:00	1997-04-16 00:00:00.000	2	102.02	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1083	10500	LAMAI	6	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-17 00:00:00.000	1	42.68	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1084	10501	BLAUS	9	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-16 00:00:00.000	3	8.85	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1085	10502	PERIC	2	1997-04-10 00:00:00	1997-05-08 00:00:00	1997-04-29 00:00:00.000	1	69.32	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1086	10503	HUNGO	6	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-16 00:00:00.000	2	16.74	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1087	10504	WHITC	4	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-18 00:00:00.000	3	59.13	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1088	10505	MEREP	3	1997-04-14 00:00:00	1997-05-12 00:00:00	1997-04-21 00:00:00.000	3	7.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1089	10506	KOENE	9	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-05-02 00:00:00.000	2	21.19	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1090	10507	ANTON	7	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-04-22 00:00:00.000	1	47.45	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1091	10508	OTTIK	1	1997-04-16 00:00:00	1997-05-14 00:00:00	1997-05-13 00:00:00.000	2	4.99	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1092	10509	BLAUS	4	1997-04-17 00:00:00	1997-05-15 00:00:00	1997-04-29 00:00:00.000	1	0.15	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1093	10510	SAVEA	6	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-28 00:00:00.000	3	367.63	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1094	10511	BONAP	4	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-21 00:00:00.000	3	350.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1095	10512	FAMIA	7	1997-04-21 00:00:00	1997-05-19 00:00:00	1997-04-24 00:00:00.000	2	3.53	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1096	10513	WANDK	7	1997-04-22 00:00:00	1997-06-03 00:00:00	1997-04-28 00:00:00.000	1	105.65	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1097	10514	ERNSH	3	1997-04-22 00:00:00	1997-05-20 00:00:00	1997-05-16 00:00:00.000	2	789.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1098	10515	QUICK	2	1997-04-23 00:00:00	1997-05-07 00:00:00	1997-05-23 00:00:00.000	1	204.47	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1099	10516	HUNGO	2	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-05-01 00:00:00.000	3	62.78	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1100	10517	NORTS	3	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-04-29 00:00:00.000	3	32.07	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
1101	10518	TORTU	4	1997-04-25 00:00:00	1997-05-09 00:00:00	1997-05-05 00:00:00.000	2	218.15	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1102	10519	CHOPS	6	1997-04-28 00:00:00	1997-05-26 00:00:00	1997-05-01 00:00:00.000	3	91.76	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1103	10520	SANTG	7	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-01 00:00:00.000	1	13.37	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1104	10521	CACTU	8	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-02 00:00:00.000	2	17.22	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1105	10522	LEHMS	4	1997-04-30 00:00:00	1997-05-28 00:00:00	1997-05-06 00:00:00.000	1	45.33	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1106	10523	SEVES	7	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-30 00:00:00.000	2	77.63	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1107	10524	BERGS	1	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-07 00:00:00.000	2	244.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1108	10525	BONAP	1	1997-05-02 00:00:00	1997-05-30 00:00:00	1997-05-23 00:00:00.000	2	11.06	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1109	10526	WARTH	4	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-15 00:00:00.000	2	58.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1110	10527	QUICK	7	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-07 00:00:00.000	1	41.9	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1111	10528	GREAL	6	1997-05-06 00:00:00	1997-05-20 00:00:00	1997-05-09 00:00:00.000	2	3.35	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1112	10529	MAISD	5	1997-05-07 00:00:00	1997-06-04 00:00:00	1997-05-09 00:00:00.000	2	66.69	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1113	10530	PICCO	3	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-12 00:00:00.000	2	339.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1114	10531	OCEAN	7	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-19 00:00:00.000	1	8.12	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1115	10532	EASTC	7	1997-05-09 00:00:00	1997-06-06 00:00:00	1997-05-12 00:00:00.000	3	74.46	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1116	10533	FOLKO	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-22 00:00:00.000	1	188.04	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1117	10534	LEHMS	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-14 00:00:00.000	2	27.94	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1118	10535	ANTON	4	1997-05-13 00:00:00	1997-06-10 00:00:00	1997-05-21 00:00:00.000	1	15.64	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1119	10536	LEHMS	3	1997-05-14 00:00:00	1997-06-11 00:00:00	1997-06-06 00:00:00.000	2	58.88	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1120	10537	RICSU	1	1997-05-14 00:00:00	1997-05-28 00:00:00	1997-05-19 00:00:00.000	1	78.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1121	10538	BSBEV	9	1997-05-15 00:00:00	1997-06-12 00:00:00	1997-05-16 00:00:00.000	3	4.87	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1122	10539	BSBEV	6	1997-05-16 00:00:00	1997-06-13 00:00:00	1997-05-23 00:00:00.000	3	12.36	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1123	10540	QUICK	3	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-06-13 00:00:00.000	3	1007.64	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1124	10541	HANAR	2	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-05-29 00:00:00.000	1	68.65	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1125	10542	KOENE	1	1997-05-20 00:00:00	1997-06-17 00:00:00	1997-05-26 00:00:00.000	3	10.95	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1126	10543	LILAS	8	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-23 00:00:00.000	2	48.17	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1127	10544	LONEP	4	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-30 00:00:00.000	1	24.91	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1128	10545	LAZYK	8	1997-05-22 00:00:00	1997-06-19 00:00:00	1997-06-26 00:00:00.000	2	11.92	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
1129	10546	VICTE	1	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-05-27 00:00:00.000	3	194.72	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1130	10547	SEVES	3	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-06-02 00:00:00.000	2	178.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1131	10548	TOMSP	3	1997-05-26 00:00:00	1997-06-23 00:00:00	1997-06-02 00:00:00.000	2	1.43	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1132	10549	QUICK	5	1997-05-27 00:00:00	1997-06-10 00:00:00	1997-05-30 00:00:00.000	1	171.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1133	10550	GODOS	7	1997-05-28 00:00:00	1997-06-25 00:00:00	1997-06-06 00:00:00.000	3	4.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1134	10551	FURIB	4	1997-05-28 00:00:00	1997-07-09 00:00:00	1997-06-06 00:00:00.000	3	72.95	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1135	10552	HILAA	2	1997-05-29 00:00:00	1997-06-26 00:00:00	1997-06-05 00:00:00.000	1	83.22	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1136	10553	WARTH	2	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-03 00:00:00.000	2	149.49	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1137	10554	OTTIK	4	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-05 00:00:00.000	3	120.97	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1138	10555	SAVEA	6	1997-06-02 00:00:00	1997-06-30 00:00:00	1997-06-04 00:00:00.000	3	252.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1139	10556	SIMOB	2	1997-06-03 00:00:00	1997-07-15 00:00:00	1997-06-13 00:00:00.000	1	9.8	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1140	10557	LEHMS	9	1997-06-03 00:00:00	1997-06-17 00:00:00	1997-06-06 00:00:00.000	2	96.72	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1141	10558	AROUT	1	1997-06-04 00:00:00	1997-07-02 00:00:00	1997-06-10 00:00:00.000	2	72.97	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1142	10559	BLONP	6	1997-06-05 00:00:00	1997-07-03 00:00:00	1997-06-13 00:00:00.000	1	8.05	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1143	10560	FRANK	8	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	1	36.65	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1144	10561	FOLKO	2	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	2	242.21	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1145	10562	REGGC	1	1997-06-09 00:00:00	1997-07-07 00:00:00	1997-06-12 00:00:00.000	1	22.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1146	10563	RICAR	2	1997-06-10 00:00:00	1997-07-22 00:00:00	1997-06-24 00:00:00.000	2	60.43	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1147	10564	RATTC	4	1997-06-10 00:00:00	1997-07-08 00:00:00	1997-06-16 00:00:00.000	3	13.75	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1148	10565	MEREP	8	1997-06-11 00:00:00	1997-07-09 00:00:00	1997-06-18 00:00:00.000	2	7.15	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1149	10566	BLONP	9	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-18 00:00:00.000	1	88.4	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1150	10567	HUNGO	1	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-17 00:00:00.000	1	33.97	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1151	10568	GALED	3	1997-06-13 00:00:00	1997-07-11 00:00:00	1997-07-09 00:00:00.000	3	6.54	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1152	10569	RATTC	5	1997-06-16 00:00:00	1997-07-14 00:00:00	1997-07-11 00:00:00.000	1	58.98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1153	10570	MEREP	3	1997-06-17 00:00:00	1997-07-15 00:00:00	1997-06-19 00:00:00.000	3	188.99	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1154	10571	ERNSH	8	1997-06-17 00:00:00	1997-07-29 00:00:00	1997-07-04 00:00:00.000	3	26.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1155	10572	BERGS	3	1997-06-18 00:00:00	1997-07-16 00:00:00	1997-06-25 00:00:00.000	2	116.43	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1156	10573	ANTON	7	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-20 00:00:00.000	3	84.84	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1157	10574	TRAIH	4	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-30 00:00:00.000	2	37.6	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
1158	10575	MORGK	5	1997-06-20 00:00:00	1997-07-04 00:00:00	1997-06-30 00:00:00.000	1	127.34	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1159	10576	TORTU	3	1997-06-23 00:00:00	1997-07-07 00:00:00	1997-06-30 00:00:00.000	3	18.56	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1160	10577	TRAIH	9	1997-06-23 00:00:00	1997-08-04 00:00:00	1997-06-30 00:00:00.000	2	25.41	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
1161	10578	BSBEV	4	1997-06-24 00:00:00	1997-07-22 00:00:00	1997-07-25 00:00:00.000	3	29.6	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1162	10579	LETSS	1	1997-06-25 00:00:00	1997-07-23 00:00:00	1997-07-04 00:00:00.000	2	13.73	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
1163	10580	OTTIK	4	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-01 00:00:00.000	3	75.89	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1164	10581	FAMIA	3	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-02 00:00:00.000	1	3.01	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1165	10582	BLAUS	3	1997-06-27 00:00:00	1997-07-25 00:00:00	1997-07-14 00:00:00.000	2	27.71	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1166	10583	WARTH	2	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	2	7.28	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1167	10584	BLONP	4	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	1	59.14	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1168	10585	WELLI	7	1997-07-01 00:00:00	1997-07-29 00:00:00	1997-07-10 00:00:00.000	1	13.41	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1169	10586	REGGC	9	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	0.48	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1170	10587	QUEDE	1	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	62.52	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1171	10588	QUICK	2	1997-07-03 00:00:00	1997-07-31 00:00:00	1997-07-10 00:00:00.000	3	194.67	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1172	10589	GREAL	8	1997-07-04 00:00:00	1997-08-01 00:00:00	1997-07-14 00:00:00.000	2	4.42	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1173	10590	MEREP	4	1997-07-07 00:00:00	1997-08-04 00:00:00	1997-07-14 00:00:00.000	3	44.77	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1174	10591	VAFFE	1	1997-07-07 00:00:00	1997-07-21 00:00:00	1997-07-16 00:00:00.000	1	55.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1175	10592	LEHMS	3	1997-07-08 00:00:00	1997-08-05 00:00:00	1997-07-16 00:00:00.000	1	32.1	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1176	10593	LEHMS	7	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-08-13 00:00:00.000	2	174.2	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1177	10594	OLDWO	3	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-07-16 00:00:00.000	2	5.24	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1178	10595	ERNSH	2	1997-07-10 00:00:00	1997-08-07 00:00:00	1997-07-14 00:00:00.000	1	96.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1179	10596	WHITC	8	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-08-12 00:00:00.000	1	16.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1180	10597	PICCO	7	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-07-18 00:00:00.000	3	35.12	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1181	10598	RATTC	1	1997-07-14 00:00:00	1997-08-11 00:00:00	1997-07-18 00:00:00.000	3	44.42	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1182	10599	BSBEV	6	1997-07-15 00:00:00	1997-08-26 00:00:00	1997-07-21 00:00:00.000	3	29.98	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1183	10600	HUNGC	4	1997-07-16 00:00:00	1997-08-13 00:00:00	1997-07-21 00:00:00.000	1	45.13	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
1184	10601	HILAA	7	1997-07-16 00:00:00	1997-08-27 00:00:00	1997-07-22 00:00:00.000	1	58.3	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1185	10602	VAFFE	8	1997-07-17 00:00:00	1997-08-14 00:00:00	1997-07-22 00:00:00.000	2	2.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1186	10603	SAVEA	8	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-08-08 00:00:00.000	2	48.77	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1187	10604	FURIB	1	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-07-29 00:00:00.000	1	7.46	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1188	10605	MEREP	1	1997-07-21 00:00:00	1997-08-18 00:00:00	1997-07-29 00:00:00.000	2	379.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1189	10606	TRADH	4	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-31 00:00:00.000	3	79.4	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1190	10607	SAVEA	5	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-25 00:00:00.000	1	200.24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1191	10608	TOMSP	4	1997-07-23 00:00:00	1997-08-20 00:00:00	1997-08-01 00:00:00.000	2	27.79	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1192	10609	DUMON	7	1997-07-24 00:00:00	1997-08-21 00:00:00	1997-07-30 00:00:00.000	2	1.85	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
1193	10610	LAMAI	8	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-06 00:00:00.000	1	26.78	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1194	10611	WOLZA	6	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-01 00:00:00.000	2	80.65	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1195	10612	SAVEA	1	1997-07-28 00:00:00	1997-08-25 00:00:00	1997-08-01 00:00:00.000	2	544.08	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1196	10613	HILAA	4	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	2	8.11	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1197	10614	BLAUS	8	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	3	1.93	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1198	10615	WILMK	2	1997-07-30 00:00:00	1997-08-27 00:00:00	1997-08-06 00:00:00.000	3	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1199	10616	GREAL	1	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-05 00:00:00.000	2	116.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1200	10617	GREAL	4	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-04 00:00:00.000	2	18.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1201	10618	MEREP	1	1997-08-01 00:00:00	1997-09-12 00:00:00	1997-08-08 00:00:00.000	1	154.68	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1202	10619	MEREP	3	1997-08-04 00:00:00	1997-09-01 00:00:00	1997-08-07 00:00:00.000	3	91.05	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1203	10620	LAUGB	2	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-14 00:00:00.000	3	0.94	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
1204	10621	ISLAT	4	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-11 00:00:00.000	2	23.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1205	10622	RICAR	4	1997-08-06 00:00:00	1997-09-03 00:00:00	1997-08-11 00:00:00.000	3	50.97	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1206	10623	FRANK	8	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-12 00:00:00.000	2	97.18	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1207	10624	THECR	4	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-19 00:00:00.000	2	94.8	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
1208	10625	ANATR	3	1997-08-08 00:00:00	1997-09-05 00:00:00	1997-08-14 00:00:00.000	1	43.9	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
1209	10626	BERGS	1	1997-08-11 00:00:00	1997-09-08 00:00:00	1997-08-20 00:00:00.000	2	138.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1210	10627	SAVEA	8	1997-08-11 00:00:00	1997-09-22 00:00:00	1997-08-21 00:00:00.000	3	107.46	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1211	10628	BLONP	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	30.36	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1212	10629	GODOS	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	85.46	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1213	10630	KOENE	1	1997-08-13 00:00:00	1997-09-10 00:00:00	1997-08-19 00:00:00.000	2	32.35	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1214	10631	LAMAI	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-15 00:00:00.000	1	0.87	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1215	10632	WANDK	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-19 00:00:00.000	1	41.38	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1216	10633	ERNSH	7	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-18 00:00:00.000	3	477.9	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1217	10634	FOLIG	4	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-21 00:00:00.000	3	487.38	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1218	10635	MAGAA	8	1997-08-18 00:00:00	1997-09-15 00:00:00	1997-08-21 00:00:00.000	3	47.46	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1219	10636	WARTH	4	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	1.15	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1220	10637	QUEEN	6	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	201.29	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1221	10638	LINOD	3	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-09-01 00:00:00.000	1	158.44	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1222	10639	SANTG	7	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-08-27 00:00:00.000	3	38.64	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1223	10640	WANDK	4	1997-08-21 00:00:00	1997-09-18 00:00:00	1997-08-28 00:00:00.000	1	23.55	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1224	10641	HILAA	4	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-08-26 00:00:00.000	2	179.61	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1225	10642	SIMOB	7	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-09-05 00:00:00.000	3	41.89	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1226	10643	ALFKI	6	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-02 00:00:00.000	1	29.46	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1227	10644	WELLI	3	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-01 00:00:00.000	2	0.14	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1228	10645	HANAR	4	1997-08-26 00:00:00	1997-09-23 00:00:00	1997-09-02 00:00:00.000	1	12.41	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1229	10646	HUNGO	9	1997-08-27 00:00:00	1997-10-08 00:00:00	1997-09-03 00:00:00.000	3	142.33	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1230	10647	QUEDE	4	1997-08-27 00:00:00	1997-09-10 00:00:00	1997-09-03 00:00:00.000	2	45.54	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1231	10648	RICAR	5	1997-08-28 00:00:00	1997-10-09 00:00:00	1997-09-09 00:00:00.000	2	14.25	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1232	10649	MAISD	5	1997-08-28 00:00:00	1997-09-25 00:00:00	1997-08-29 00:00:00.000	3	6.2	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1233	10650	FAMIA	5	1997-08-29 00:00:00	1997-09-26 00:00:00	1997-09-03 00:00:00.000	3	176.81	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1234	10651	WANDK	8	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-11 00:00:00.000	2	20.6	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1235	10652	GOURL	4	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-08 00:00:00.000	2	7.14	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1236	10653	FRANK	1	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-19 00:00:00.000	1	93.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1237	10654	BERGS	5	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-11 00:00:00.000	1	55.26	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1238	10655	REGGC	1	1997-09-03 00:00:00	1997-10-01 00:00:00	1997-09-11 00:00:00.000	2	4.41	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1239	10656	GREAL	6	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-10 00:00:00.000	1	57.15	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1240	10657	SAVEA	2	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-15 00:00:00.000	2	352.69	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1241	10658	QUICK	4	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-08 00:00:00.000	1	364.15	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1242	10659	QUEEN	7	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-10 00:00:00.000	2	105.81	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1243	10660	HUNGC	8	1997-09-08 00:00:00	1997-10-06 00:00:00	1997-10-15 00:00:00.000	1	111.29	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
1244	10661	HUNGO	7	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-15 00:00:00.000	3	17.55	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1245	10662	LONEP	3	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-18 00:00:00.000	2	1.28	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1246	10663	BONAP	2	1997-09-10 00:00:00	1997-09-24 00:00:00	1997-10-03 00:00:00.000	2	113.15	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1247	10664	FURIB	1	1997-09-10 00:00:00	1997-10-08 00:00:00	1997-09-19 00:00:00.000	3	1.27	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1248	10665	LONEP	1	1997-09-11 00:00:00	1997-10-09 00:00:00	1997-09-17 00:00:00.000	2	26.31	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1249	10666	RICSU	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-22 00:00:00.000	2	232.42	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1250	10667	ERNSH	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-19 00:00:00.000	1	78.09	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1251	10668	WANDK	1	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-23 00:00:00.000	2	47.22	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1252	10669	SIMOB	2	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-22 00:00:00.000	1	24.39	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1253	10670	FRANK	4	1997-09-16 00:00:00	1997-10-14 00:00:00	1997-09-18 00:00:00.000	1	203.48	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1254	10671	FRANR	1	1997-09-17 00:00:00	1997-10-15 00:00:00	1997-09-24 00:00:00.000	1	30.34	France restauration	54 rue Royale	Nantes	NULL	44000	France
1255	10672	BERGS	9	1997-09-17 00:00:00	1997-10-01 00:00:00	1997-09-26 00:00:00.000	2	95.75	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1256	10673	WILMK	2	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-19 00:00:00.000	1	22.76	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1257	10674	ISLAT	4	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-30 00:00:00.000	2	0.9	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1258	10675	FRANK	5	1997-09-19 00:00:00	1997-10-17 00:00:00	1997-09-23 00:00:00.000	2	31.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1259	10676	TORTU	2	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-29 00:00:00.000	2	2.01	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1260	10677	ANTON	1	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-26 00:00:00.000	3	4.03	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1261	10678	SAVEA	7	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-10-16 00:00:00.000	3	388.98	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1262	10679	BLONP	8	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-09-30 00:00:00.000	3	27.94	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1263	10680	OLDWO	1	1997-09-24 00:00:00	1997-10-22 00:00:00	1997-09-26 00:00:00.000	1	26.61	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1264	10681	GREAL	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-09-30 00:00:00.000	3	76.13	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1265	10682	ANTON	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-10-01 00:00:00.000	2	36.13	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1266	10683	DUMON	2	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-10-01 00:00:00.000	1	4.4	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
1267	10684	OTTIK	3	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-09-30 00:00:00.000	1	145.63	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1268	10685	GOURL	4	1997-09-29 00:00:00	1997-10-13 00:00:00	1997-10-03 00:00:00.000	2	33.75	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1269	10686	PICCO	2	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-08 00:00:00.000	1	96.5	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1270	10687	HUNGO	9	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-30 00:00:00.000	2	296.43	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1271	10688	VAFFE	4	1997-10-01 00:00:00	1997-10-15 00:00:00	1997-10-07 00:00:00.000	2	299.09	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1272	10689	BERGS	1	1997-10-01 00:00:00	1997-10-29 00:00:00	1997-10-07 00:00:00.000	2	13.42	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1273	10690	HANAR	1	1997-10-02 00:00:00	1997-10-30 00:00:00	1997-10-03 00:00:00.000	1	15.8	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1274	10691	QUICK	2	1997-10-03 00:00:00	1997-11-14 00:00:00	1997-10-22 00:00:00.000	2	810.05	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1275	10692	ALFKI	4	1997-10-03 00:00:00	1997-10-31 00:00:00	1997-10-13 00:00:00.000	2	61.02	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1276	10693	WHITC	3	1997-10-06 00:00:00	1997-10-20 00:00:00	1997-10-10 00:00:00.000	3	139.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1277	10694	QUICK	8	1997-10-06 00:00:00	1997-11-03 00:00:00	1997-10-09 00:00:00.000	3	398.36	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1278	10695	WILMK	7	1997-10-07 00:00:00	1997-11-18 00:00:00	1997-10-14 00:00:00.000	1	16.72	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1279	10696	WHITC	8	1997-10-08 00:00:00	1997-11-19 00:00:00	1997-10-14 00:00:00.000	3	102.55	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1280	10697	LINOD	3	1997-10-08 00:00:00	1997-11-05 00:00:00	1997-10-14 00:00:00.000	1	45.52	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1281	10698	ERNSH	4	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-17 00:00:00.000	1	272.47	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1282	10699	MORGK	3	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-13 00:00:00.000	3	0.58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1283	10700	SAVEA	3	1997-10-10 00:00:00	1997-11-07 00:00:00	1997-10-16 00:00:00.000	1	65.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1284	10701	HUNGO	6	1997-10-13 00:00:00	1997-10-27 00:00:00	1997-10-15 00:00:00.000	3	220.31	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1285	10702	ALFKI	4	1997-10-13 00:00:00	1997-11-24 00:00:00	1997-10-21 00:00:00.000	1	23.94	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1286	10703	FOLKO	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-10-20 00:00:00.000	2	152.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1287	10704	QUEEN	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-11-07 00:00:00.000	1	4.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1288	10705	HILAA	9	1997-10-15 00:00:00	1997-11-12 00:00:00	1997-11-18 00:00:00.000	2	3.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1289	10706	OLDWO	8	1997-10-16 00:00:00	1997-11-13 00:00:00	1997-10-21 00:00:00.000	3	135.63	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1290	10707	AROUT	4	1997-10-16 00:00:00	1997-10-30 00:00:00	1997-10-23 00:00:00.000	3	21.74	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1291	10708	THEBI	6	1997-10-17 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	2	2.96	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
1292	10709	GOURL	1	1997-10-17 00:00:00	1997-11-14 00:00:00	1997-11-20 00:00:00.000	3	210.8	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1293	10710	FRANS	1	1997-10-20 00:00:00	1997-11-17 00:00:00	1997-10-23 00:00:00.000	1	4.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1294	10711	SAVEA	5	1997-10-21 00:00:00	1997-12-02 00:00:00	1997-10-29 00:00:00.000	2	52.41	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1295	10712	HUNGO	3	1997-10-21 00:00:00	1997-11-18 00:00:00	1997-10-31 00:00:00.000	1	89.93	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1296	10713	SAVEA	1	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-24 00:00:00.000	1	167.05	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1297	10714	SAVEA	5	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-27 00:00:00.000	3	24.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1298	10715	BONAP	3	1997-10-23 00:00:00	1997-11-06 00:00:00	1997-10-29 00:00:00.000	1	63.2	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1299	10716	RANCH	4	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-27 00:00:00.000	2	22.57	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1300	10717	FRANK	1	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-29 00:00:00.000	2	59.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1301	10718	KOENE	1	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-10-29 00:00:00.000	3	170.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1302	10719	LETSS	8	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-11-05 00:00:00.000	2	51.44	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
1303	10720	QUEDE	8	1997-10-28 00:00:00	1997-11-11 00:00:00	1997-11-05 00:00:00.000	2	9.53	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1304	10721	QUICK	5	1997-10-29 00:00:00	1997-11-26 00:00:00	1997-10-31 00:00:00.000	3	48.92	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1305	10722	SAVEA	8	1997-10-29 00:00:00	1997-12-10 00:00:00	1997-11-04 00:00:00.000	1	74.58	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1306	10723	WHITC	3	1997-10-30 00:00:00	1997-11-27 00:00:00	1997-11-25 00:00:00.000	1	21.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1307	10724	MEREP	8	1997-10-30 00:00:00	1997-12-11 00:00:00	1997-11-05 00:00:00.000	2	57.75	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1308	10725	FAMIA	4	1997-10-31 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	3	10.83	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1309	10726	EASTC	4	1997-11-03 00:00:00	1997-11-17 00:00:00	1997-12-05 00:00:00.000	1	16.56	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1310	10727	REGGC	2	1997-11-03 00:00:00	1997-12-01 00:00:00	1997-12-05 00:00:00.000	1	89.9	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1311	10728	QUEEN	4	1997-11-04 00:00:00	1997-12-02 00:00:00	1997-11-11 00:00:00.000	2	58.33	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1312	10729	LINOD	8	1997-11-04 00:00:00	1997-12-16 00:00:00	1997-11-14 00:00:00.000	3	141.06	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1313	10730	BONAP	5	1997-11-05 00:00:00	1997-12-03 00:00:00	1997-11-14 00:00:00.000	1	20.12	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1314	10731	CHOPS	7	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-14 00:00:00.000	1	96.65	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1315	10732	BONAP	3	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-07 00:00:00.000	1	16.97	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1316	10733	BERGS	1	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-10 00:00:00.000	3	110.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1317	10734	GOURL	2	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-12 00:00:00.000	3	1.63	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1318	10735	LETSS	6	1997-11-10 00:00:00	1997-12-08 00:00:00	1997-11-21 00:00:00.000	2	45.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
1319	10736	HUNGO	9	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-21 00:00:00.000	2	44.1	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1320	10737	VINET	2	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-18 00:00:00.000	2	7.79	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
1321	10738	SPECD	2	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-18 00:00:00.000	1	2.91	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
1322	10739	VINET	3	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-17 00:00:00.000	3	11.08	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
1323	10740	WHITC	4	1997-11-13 00:00:00	1997-12-11 00:00:00	1997-11-25 00:00:00.000	2	81.88	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1324	10741	AROUT	4	1997-11-14 00:00:00	1997-11-28 00:00:00	1997-11-18 00:00:00.000	3	10.96	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1325	10742	BOTTM	3	1997-11-14 00:00:00	1997-12-12 00:00:00	1997-11-18 00:00:00.000	3	243.73	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1326	10743	AROUT	1	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-21 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1327	10744	VAFFE	6	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-24 00:00:00.000	1	69.19	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1328	10745	QUICK	9	1997-11-18 00:00:00	1997-12-16 00:00:00	1997-11-27 00:00:00.000	1	3.52	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1329	10746	CHOPS	1	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-21 00:00:00.000	3	31.43	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1330	10747	PICCO	6	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-26 00:00:00.000	1	117.33	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1331	10748	SAVEA	3	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-11-28 00:00:00.000	1	232.55	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1332	10749	ISLAT	4	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-12-19 00:00:00.000	2	61.53	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1333	10750	WARTH	9	1997-11-21 00:00:00	1997-12-19 00:00:00	1997-11-24 00:00:00.000	1	79.3	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1334	10751	RICSU	3	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-12-03 00:00:00.000	3	130.79	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1335	10752	NORTS	2	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-11-28 00:00:00.000	3	1.39	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
1336	10753	FRANS	3	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	1	7.7	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1337	10754	MAGAA	6	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	3	2.38	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1338	10755	BONAP	4	1997-11-26 00:00:00	1997-12-24 00:00:00	1997-11-28 00:00:00.000	2	16.71	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1339	10756	SPLIR	8	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-02 00:00:00.000	2	73.21	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1340	10757	SAVEA	6	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-15 00:00:00.000	1	8.19	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1341	10758	RICSU	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-04 00:00:00.000	3	138.17	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1342	10759	ANATR	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-12 00:00:00.000	3	11.99	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
1343	10760	MAISD	4	1997-12-01 00:00:00	1997-12-29 00:00:00	1997-12-10 00:00:00.000	1	155.64	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1344	10761	RATTC	5	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-08 00:00:00.000	2	18.66	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1345	10762	FOLKO	3	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-09 00:00:00.000	1	328.74	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1346	10763	FOLIG	3	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	37.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1347	10764	ERNSH	6	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	145.45	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1348	10765	QUICK	3	1997-12-04 00:00:00	1998-01-01 00:00:00	1997-12-09 00:00:00.000	3	42.74	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1349	10766	OTTIK	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-09 00:00:00.000	1	157.55	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1350	10767	SUPRD	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-15 00:00:00.000	3	1.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1351	10768	AROUT	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-15 00:00:00.000	2	146.32	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1352	10769	VAFFE	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-12 00:00:00.000	1	65.06	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1353	10770	HANAR	8	1997-12-09 00:00:00	1998-01-06 00:00:00	1997-12-17 00:00:00.000	3	5.32	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1354	10771	ERNSH	9	1997-12-10 00:00:00	1998-01-07 00:00:00	1998-01-02 00:00:00.000	2	11.19	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1355	10772	LEHMS	3	1997-12-10 00:00:00	1998-01-07 00:00:00	1997-12-19 00:00:00.000	2	91.28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1356	10773	ERNSH	1	1997-12-11 00:00:00	1998-01-08 00:00:00	1997-12-16 00:00:00.000	3	96.43	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1357	10774	FOLKO	4	1997-12-11 00:00:00	1997-12-25 00:00:00	1997-12-12 00:00:00.000	1	48.2	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1358	10775	THECR	7	1997-12-12 00:00:00	1998-01-09 00:00:00	1997-12-26 00:00:00.000	1	20.25	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
1359	10776	ERNSH	1	1997-12-15 00:00:00	1998-01-12 00:00:00	1997-12-18 00:00:00.000	3	351.53	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1360	10777	GOURL	7	1997-12-15 00:00:00	1997-12-29 00:00:00	1998-01-21 00:00:00.000	2	3.01	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1361	10778	BERGS	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1997-12-24 00:00:00.000	1	6.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1362	10779	MORGK	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1998-01-14 00:00:00.000	2	58.13	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1363	10780	LILAS	2	1997-12-16 00:00:00	1997-12-30 00:00:00	1997-12-25 00:00:00.000	1	42.13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1364	10781	WARTH	2	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-19 00:00:00.000	3	73.16	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1365	10782	CACTU	9	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-22 00:00:00.000	3	1.1	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1366	10783	HANAR	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-19 00:00:00.000	2	124.98	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1367	10784	MAGAA	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-22 00:00:00.000	3	70.09	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1368	10785	GROSR	1	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-24 00:00:00.000	3	1.51	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
1369	10786	QUEEN	8	1997-12-19 00:00:00	1998-01-16 00:00:00	1997-12-23 00:00:00.000	1	110.87	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1370	10787	LAMAI	2	1997-12-19 00:00:00	1998-01-02 00:00:00	1997-12-26 00:00:00.000	1	249.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1371	10788	QUICK	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1998-01-19 00:00:00.000	2	42.7	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1372	10789	FOLIG	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-31 00:00:00.000	2	100.6	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1373	10790	GOURL	6	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-26 00:00:00.000	1	28.23	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1374	10791	FRANK	6	1997-12-23 00:00:00	1998-01-20 00:00:00	1998-01-01 00:00:00.000	2	16.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1375	10792	WOLZA	1	1997-12-23 00:00:00	1998-01-20 00:00:00	1997-12-31 00:00:00.000	3	23.79	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1376	10793	AROUT	3	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-08 00:00:00.000	3	4.52	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1377	10794	QUEDE	6	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-02 00:00:00.000	1	21.49	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1378	10795	ERNSH	8	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-20 00:00:00.000	2	126.66	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1379	10796	HILAA	3	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-14 00:00:00.000	1	26.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1380	10797	DRACD	7	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-05 00:00:00.000	2	33.35	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1381	10798	ISLAT	2	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	1	2.33	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1382	10799	KOENE	9	1997-12-26 00:00:00	1998-02-06 00:00:00	1998-01-05 00:00:00.000	3	30.76	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1383	10800	SEVES	1	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	3	137.44	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1384	10801	BOLID	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1997-12-31 00:00:00.000	2	97.09	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
1385	10802	SIMOB	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1998-01-02 00:00:00.000	2	257.26	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1386	10803	WELLI	4	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-06 00:00:00.000	1	55.23	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1387	10804	SEVES	6	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-07 00:00:00.000	2	27.33	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1388	10805	THEBI	2	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-09 00:00:00.000	3	237.34	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
1389	10806	VICTE	3	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-05 00:00:00.000	2	22.11	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1390	10807	FRANS	4	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-30 00:00:00.000	1	1.36	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1391	10808	OLDWO	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-09 00:00:00.000	3	45.53	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1392	10809	WELLI	7	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	1	4.87	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1393	10810	LAUGB	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	3	4.33	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
1394	10811	LINOD	8	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-08 00:00:00.000	1	31.22	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1395	10812	REGGC	5	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-12 00:00:00.000	1	59.78	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1396	10813	RICAR	1	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-09 00:00:00.000	1	47.38	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1397	10814	VICTE	3	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	130.94	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1398	10815	SAVEA	2	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	14.62	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1399	10816	GREAL	4	1998-01-06 00:00:00	1998-02-03 00:00:00	1998-02-04 00:00:00.000	2	719.78	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1400	10817	KOENE	3	1998-01-06 00:00:00	1998-01-20 00:00:00	1998-01-13 00:00:00.000	2	306.07	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1401	10818	MAGAA	7	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-12 00:00:00.000	3	65.48	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1402	10819	CACTU	2	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-16 00:00:00.000	3	19.76	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1403	10820	RATTC	3	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-13 00:00:00.000	2	37.52	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1404	10821	SPLIR	1	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-15 00:00:00.000	1	36.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1405	10822	TRAIH	6	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-16 00:00:00.000	3	7	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
1406	10823	LILAS	5	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-13 00:00:00.000	2	163.97	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1407	10824	FOLKO	8	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-30 00:00:00.000	1	1.23	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1408	10825	DRACD	1	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-14 00:00:00.000	1	79.25	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1409	10826	BLONP	6	1998-01-12 00:00:00	1998-02-09 00:00:00	1998-02-06 00:00:00.000	1	7.09	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1410	10827	BONAP	1	1998-01-12 00:00:00	1998-01-26 00:00:00	1998-02-06 00:00:00.000	2	63.54	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1411	10828	RANCH	9	1998-01-13 00:00:00	1998-01-27 00:00:00	1998-02-04 00:00:00.000	1	90.85	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1412	10829	ISLAT	9	1998-01-13 00:00:00	1998-02-10 00:00:00	1998-01-23 00:00:00.000	1	154.72	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1413	10830	TRADH	4	1998-01-13 00:00:00	1998-02-24 00:00:00	1998-01-21 00:00:00.000	2	81.83	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1414	10831	SANTG	3	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-23 00:00:00.000	2	72.19	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1415	10832	LAMAI	2	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-19 00:00:00.000	2	43.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1416	10833	OTTIK	6	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-23 00:00:00.000	2	71.49	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1417	10834	TRADH	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-19 00:00:00.000	3	29.78	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1418	10835	ALFKI	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-21 00:00:00.000	3	69.53	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1419	10836	ERNSH	7	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-21 00:00:00.000	1	411.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1420	10837	BERGS	9	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-23 00:00:00.000	3	13.32	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1421	10838	LINOD	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-23 00:00:00.000	3	59.28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1422	10839	TRADH	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-22 00:00:00.000	3	35.43	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1423	10840	LINOD	4	1998-01-19 00:00:00	1998-03-02 00:00:00	1998-02-16 00:00:00.000	2	2.71	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1424	10841	SUPRD	5	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	2	424.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1425	10842	TORTU	1	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	3	54.42	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1426	10843	VICTE	4	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	9.26	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1427	10844	PICCO	8	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	25.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1428	10845	QUICK	8	1998-01-21 00:00:00	1998-02-04 00:00:00	1998-01-30 00:00:00.000	1	212.98	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1429	10846	SUPRD	2	1998-01-22 00:00:00	1998-03-05 00:00:00	1998-01-23 00:00:00.000	3	56.46	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1430	10847	SAVEA	4	1998-01-22 00:00:00	1998-02-05 00:00:00	1998-02-10 00:00:00.000	3	487.57	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1431	10848	CONSH	7	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-29 00:00:00.000	2	38.24	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
1432	10849	KOENE	9	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-30 00:00:00.000	2	0.56	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1433	10850	VICTE	1	1998-01-23 00:00:00	1998-03-06 00:00:00	1998-01-30 00:00:00.000	1	49.19	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1434	10851	RICAR	5	1998-01-26 00:00:00	1998-02-23 00:00:00	1998-02-02 00:00:00.000	1	160.55	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1435	10852	RATTC	8	1998-01-26 00:00:00	1998-02-09 00:00:00	1998-01-30 00:00:00.000	1	174.05	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1436	10853	BLAUS	9	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-03 00:00:00.000	2	53.83	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1437	10854	ERNSH	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-05 00:00:00.000	2	100.22	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1438	10855	OLDWO	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-04 00:00:00.000	1	170.97	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1439	10856	ANTON	3	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-10 00:00:00.000	2	58.43	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1440	10857	BERGS	8	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-06 00:00:00.000	2	188.85	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1441	10858	LACOR	2	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-03 00:00:00.000	1	52.51	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
1442	10859	FRANK	1	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-02 00:00:00.000	2	76.1	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1443	10860	FRANR	3	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-04 00:00:00.000	3	19.26	France restauration	54 rue Royale	Nantes	NULL	44000	France
1444	10861	WHITC	4	1998-01-30 00:00:00	1998-02-27 00:00:00	1998-02-17 00:00:00.000	2	14.93	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1445	10862	LEHMS	8	1998-01-30 00:00:00	1998-03-13 00:00:00	1998-02-02 00:00:00.000	2	53.23	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1446	10863	HILAA	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-17 00:00:00.000	2	30.26	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1447	10864	AROUT	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-09 00:00:00.000	2	3.04	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1448	10865	QUICK	2	1998-02-02 00:00:00	1998-02-16 00:00:00	1998-02-12 00:00:00.000	1	348.14	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1449	10866	BERGS	5	1998-02-03 00:00:00	1998-03-03 00:00:00	1998-02-12 00:00:00.000	1	109.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1450	10867	LONEP	6	1998-02-03 00:00:00	1998-03-17 00:00:00	1998-02-11 00:00:00.000	1	1.93	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1451	10868	QUEEN	7	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-23 00:00:00.000	2	191.27	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1452	10869	SEVES	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-09 00:00:00.000	1	143.28	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1453	10870	WOLZA	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-13 00:00:00.000	3	12.04	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1454	10871	BONAP	9	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-10 00:00:00.000	2	112.27	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1455	10872	GODOS	5	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-09 00:00:00.000	2	175.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1456	10873	WILMK	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-09 00:00:00.000	1	0.82	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1457	10874	GODOS	5	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-11 00:00:00.000	2	19.58	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1458	10875	BERGS	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-03-03 00:00:00.000	2	32.37	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1459	10876	BONAP	7	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-12 00:00:00.000	3	60.42	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1460	10877	RICAR	1	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-19 00:00:00.000	1	38.06	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1461	10878	QUICK	4	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	1	46.69	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1462	10879	WILMK	3	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	3	8.5	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1463	10880	FOLKO	7	1998-02-10 00:00:00	1998-03-24 00:00:00	1998-02-18 00:00:00.000	1	88.01	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1464	10881	CACTU	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-18 00:00:00.000	1	2.84	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1465	10882	SAVEA	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-20 00:00:00.000	3	23.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1466	10883	LONEP	8	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-20 00:00:00.000	3	0.53	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1467	10884	LETSS	4	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-13 00:00:00.000	2	90.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
1468	10885	SUPRD	6	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-18 00:00:00.000	3	5.64	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1469	10886	HANAR	1	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-03-02 00:00:00.000	1	4.99	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1470	10887	GALED	8	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-02-16 00:00:00.000	3	1.25	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1471	10888	GODOS	1	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	2	51.87	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1472	10889	RATTC	9	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	3	280.61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1473	10890	DUMON	7	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-18 00:00:00.000	1	32.76	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
1474	10891	LEHMS	7	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	20.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1475	10892	MAISD	4	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	120.27	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1476	10893	KOENE	9	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	2	77.78	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1477	10894	SAVEA	1	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	1	116.13	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1478	10895	ERNSH	3	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-23 00:00:00.000	1	162.75	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1479	10896	MAISD	7	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-27 00:00:00.000	3	32.45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1480	10897	HUNGO	3	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-25 00:00:00.000	2	603.54	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1481	10898	OCEAN	4	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-06 00:00:00.000	2	1.27	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1482	10899	LILAS	5	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-02-26 00:00:00.000	3	1.21	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1483	10900	WELLI	1	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-04 00:00:00.000	2	1.66	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1484	10901	HILAA	4	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-02-26 00:00:00.000	1	62.09	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1485	10902	FOLKO	1	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-03-03 00:00:00.000	1	44.15	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1486	10903	HANAR	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-04 00:00:00.000	3	36.71	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1487	10904	WHITC	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-02-27 00:00:00.000	3	162.95	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1488	10905	WELLI	9	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-06 00:00:00.000	2	13.72	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1489	10906	WOLZA	4	1998-02-25 00:00:00	1998-03-11 00:00:00	1998-03-03 00:00:00.000	3	26.29	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1490	10907	SPECD	6	1998-02-25 00:00:00	1998-03-25 00:00:00	1998-02-27 00:00:00.000	3	9.19	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
1491	10908	REGGC	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-06 00:00:00.000	2	32.96	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1492	10909	SANTG	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-10 00:00:00.000	2	53.05	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1493	10910	WILMK	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	3	38.11	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1494	10911	GODOS	3	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-05 00:00:00.000	1	38.19	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1495	10912	HUNGO	2	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-18 00:00:00.000	2	580.91	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1496	10913	QUEEN	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	1	33.05	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1497	10914	QUEEN	6	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	1	21.19	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1498	10915	TORTU	2	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	2	3.51	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1499	10916	RANCH	1	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-09 00:00:00.000	2	63.77	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1500	10917	ROMEY	4	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	2	8.29	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
1501	10918	BOTTM	3	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	3	48.83	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1502	10919	LINOD	2	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-04 00:00:00.000	2	19.8	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1503	10920	AROUT	4	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-09 00:00:00.000	2	29.61	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1504	10921	VAFFE	1	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-09 00:00:00.000	1	176.48	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1505	10922	HANAR	5	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-05 00:00:00.000	3	62.74	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1506	10923	LAMAI	7	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-13 00:00:00.000	3	68.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1507	10924	BERGS	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-04-08 00:00:00.000	2	151.52	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1508	10925	HANAR	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-13 00:00:00.000	1	2.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1509	10926	ANATR	4	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-11 00:00:00.000	3	39.92	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
1510	10927	LACOR	4	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	19.79	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
1511	10928	GALED	1	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-18 00:00:00.000	1	1.36	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1512	10929	FRANK	6	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-12 00:00:00.000	1	33.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1513	10930	SUPRD	4	1998-03-06 00:00:00	1998-04-17 00:00:00	1998-03-18 00:00:00.000	3	15.55	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1514	10931	RICSU	4	1998-03-06 00:00:00	1998-03-20 00:00:00	1998-03-19 00:00:00.000	2	13.6	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1515	10932	BONAP	8	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-24 00:00:00.000	1	134.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1516	10933	ISLAT	6	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-16 00:00:00.000	3	54.15	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1517	10934	LEHMS	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-12 00:00:00.000	3	32.01	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1518	10935	WELLI	4	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	3	47.59	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1519	10936	GREAL	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	2	33.68	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1520	10937	CACTU	7	1998-03-10 00:00:00	1998-03-24 00:00:00	1998-03-13 00:00:00.000	3	31.51	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1521	10938	QUICK	3	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-16 00:00:00.000	2	31.89	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1522	10939	MAGAA	2	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-13 00:00:00.000	2	76.33	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1523	10940	BONAP	8	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-23 00:00:00.000	3	19.77	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1524	10941	SAVEA	7	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-20 00:00:00.000	2	400.81	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1525	10942	REGGC	9	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-18 00:00:00.000	3	17.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1526	10943	BSBEV	4	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-19 00:00:00.000	2	2.17	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1527	10944	BOTTM	6	1998-03-12 00:00:00	1998-03-26 00:00:00	1998-03-13 00:00:00.000	3	52.92	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1528	10945	MORGK	4	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-18 00:00:00.000	1	10.22	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1529	10946	VAFFE	1	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-19 00:00:00.000	2	27.2	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1530	10947	BSBEV	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-16 00:00:00.000	2	3.26	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1531	10948	GODOS	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-19 00:00:00.000	3	23.39	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1532	10949	BOTTM	2	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-17 00:00:00.000	3	74.44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1533	10950	MAGAA	1	1998-03-16 00:00:00	1998-04-13 00:00:00	1998-03-23 00:00:00.000	2	2.5	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1534	10951	RICSU	9	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-04-07 00:00:00.000	2	30.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1535	10952	ALFKI	1	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-03-24 00:00:00.000	1	40.42	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1536	10953	AROUT	9	1998-03-16 00:00:00	1998-03-30 00:00:00	1998-03-25 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1537	10954	LINOD	5	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	1	27.91	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1538	10955	FOLKO	8	1998-03-17 00:00:00	1998-04-14 00:00:00	1998-03-20 00:00:00.000	2	3.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1539	10956	BLAUS	6	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	2	44.65	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1540	10957	HILAA	8	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	3	105.36	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1541	10958	OCEAN	7	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	2	49.56	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1542	10959	GOURL	6	1998-03-18 00:00:00	1998-04-29 00:00:00	1998-03-23 00:00:00.000	2	4.98	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1543	10960	HILAA	3	1998-03-19 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	2.08	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1544	10961	QUEEN	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-30 00:00:00.000	1	104.47	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1545	10962	QUICK	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-23 00:00:00.000	2	275.79	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1546	10963	FURIB	9	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-26 00:00:00.000	3	2.7	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1547	10964	SPECD	3	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-24 00:00:00.000	2	87.38	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
1548	10965	OLDWO	6	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-30 00:00:00.000	3	144.38	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1549	10966	CHOPS	4	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-04-08 00:00:00.000	1	27.19	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1550	10967	TOMSP	2	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-02 00:00:00.000	2	62.22	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1551	10968	ERNSH	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-01 00:00:00.000	3	74.6	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1552	10969	COMMI	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-03-30 00:00:00.000	2	0.21	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1553	10970	BOLID	9	1998-03-24 00:00:00	1998-04-07 00:00:00	1998-04-24 00:00:00.000	1	16.16	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
1554	10971	FRANR	2	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-04-02 00:00:00.000	2	121.82	France restauration	54 rue Royale	Nantes	NULL	44000	France
1555	10972	LACOR	4	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-26 00:00:00.000	2	0.02	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
1556	10973	LACOR	6	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-27 00:00:00.000	2	15.17	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
1557	10974	SPLIR	3	1998-03-25 00:00:00	1998-04-08 00:00:00	1998-04-03 00:00:00.000	3	12.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1558	10975	BOTTM	1	1998-03-25 00:00:00	1998-04-22 00:00:00	1998-03-27 00:00:00.000	3	32.27	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1559	10976	HILAA	1	1998-03-25 00:00:00	1998-05-06 00:00:00	1998-04-03 00:00:00.000	1	37.97	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1560	10977	FOLKO	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-10 00:00:00.000	3	208.5	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1561	10978	MAISD	9	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-23 00:00:00.000	2	32.82	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1562	10979	ERNSH	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-03-31 00:00:00.000	2	353.07	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1563	10980	FOLKO	4	1998-03-27 00:00:00	1998-05-08 00:00:00	1998-04-17 00:00:00.000	1	1.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1564	10981	HANAR	1	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-02 00:00:00.000	2	193.37	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1565	10982	BOTTM	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-08 00:00:00.000	1	14.01	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1566	10983	SAVEA	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-06 00:00:00.000	2	657.54	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1567	10984	SAVEA	1	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-03 00:00:00.000	3	211.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1568	10985	HUNGO	2	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-02 00:00:00.000	1	91.51	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1569	10986	OCEAN	8	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-21 00:00:00.000	2	217.86	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1570	10987	EASTC	8	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-06 00:00:00.000	1	185.48	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1571	10988	RATTC	3	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-10 00:00:00.000	2	61.14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1572	10989	QUEDE	2	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-02 00:00:00.000	1	34.76	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1573	10990	ERNSH	2	1998-04-01 00:00:00	1998-05-13 00:00:00	1998-04-07 00:00:00.000	3	117.61	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1574	10991	QUICK	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-07 00:00:00.000	1	38.51	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1575	10992	THEBI	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-03 00:00:00.000	3	4.27	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
1576	10993	FOLKO	7	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-10 00:00:00.000	3	8.81	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1577	10994	VAFFE	2	1998-04-02 00:00:00	1998-04-16 00:00:00	1998-04-09 00:00:00.000	3	65.53	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1578	10995	PERIC	1	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-06 00:00:00.000	3	46	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1579	10996	QUICK	4	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-10 00:00:00.000	2	1.12	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1580	10997	LILAS	8	1998-04-03 00:00:00	1998-05-15 00:00:00	1998-04-13 00:00:00.000	2	73.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1581	10998	WOLZA	8	1998-04-03 00:00:00	1998-04-17 00:00:00	1998-04-17 00:00:00.000	2	20.31	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1582	10999	OTTIK	6	1998-04-03 00:00:00	1998-05-01 00:00:00	1998-04-10 00:00:00.000	2	96.35	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1583	11000	RATTC	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	3	55.12	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1584	11001	FOLKO	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	2	197.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1585	11002	SAVEA	4	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-16 00:00:00.000	1	141.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1586	11003	THECR	3	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-08 00:00:00.000	3	14.91	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
1587	11004	MAISD	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-20 00:00:00.000	1	44.84	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1588	11005	WILMK	2	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-10 00:00:00.000	1	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
1589	11006	GREAL	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-15 00:00:00.000	2	25.19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1590	11007	PRINI	8	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-13 00:00:00.000	2	202.24	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1591	11008	ERNSH	7	1998-04-08 00:00:00	1998-05-06 00:00:00	NULL	3	79.46	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1592	11009	GODOS	2	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-10 00:00:00.000	1	59.11	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1593	11010	REGGC	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-21 00:00:00.000	2	28.71	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1594	11011	ALFKI	3	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-13 00:00:00.000	1	1.21	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
1595	11012	FRANK	1	1998-04-09 00:00:00	1998-04-23 00:00:00	1998-04-17 00:00:00.000	3	242.95	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1596	11013	ROMEY	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-10 00:00:00.000	1	32.99	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
1597	11014	LINOD	2	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-15 00:00:00.000	3	23.6	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1598	11015	SANTG	2	1998-04-10 00:00:00	1998-04-24 00:00:00	1998-04-20 00:00:00.000	2	4.62	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1599	11016	AROUT	9	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-13 00:00:00.000	2	33.8	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1600	11017	ERNSH	9	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-20 00:00:00.000	2	754.26	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1601	11018	LONEP	4	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-16 00:00:00.000	2	11.65	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1602	11019	RANCH	6	1998-04-13 00:00:00	1998-05-11 00:00:00	NULL	3	3.17	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1603	11020	OTTIK	2	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-16 00:00:00.000	2	43.3	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1604	11021	QUICK	3	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-21 00:00:00.000	1	297.18	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1605	11022	HANAR	9	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-05-04 00:00:00.000	2	6.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1606	11023	BSBEV	1	1998-04-14 00:00:00	1998-04-28 00:00:00	1998-04-24 00:00:00.000	2	123.83	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1607	11024	EASTC	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-20 00:00:00.000	1	74.36	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1608	11025	WARTH	6	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-24 00:00:00.000	3	29.17	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1609	11026	FRANS	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-28 00:00:00.000	1	47.09	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1610	11027	BOTTM	1	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-20 00:00:00.000	1	52.52	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1611	11028	KOENE	2	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-22 00:00:00.000	1	29.59	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1612	11029	CHOPS	4	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-27 00:00:00.000	1	47.84	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1613	11030	SAVEA	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-27 00:00:00.000	2	830.75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1614	11031	SAVEA	6	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-24 00:00:00.000	2	227.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1615	11032	WHITC	2	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	606.19	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1616	11033	RICSU	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	84.74	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1617	11034	OLDWO	8	1998-04-20 00:00:00	1998-06-01 00:00:00	1998-04-27 00:00:00.000	1	40.32	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1618	11035	SUPRD	2	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-24 00:00:00.000	2	0.17	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1619	11036	DRACD	8	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-22 00:00:00.000	3	149.47	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1620	11037	GODOS	7	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-27 00:00:00.000	1	3.2	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1621	11038	SUPRD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-30 00:00:00.000	2	29.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1622	11039	LINOD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	NULL	2	65	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1623	11040	GREAL	4	1998-04-22 00:00:00	1998-05-20 00:00:00	NULL	3	18.84	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1624	11041	CHOPS	3	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-28 00:00:00.000	2	48.22	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1625	11042	COMMI	2	1998-04-22 00:00:00	1998-05-06 00:00:00	1998-05-01 00:00:00.000	1	29.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1626	11043	SPECD	5	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-29 00:00:00.000	2	8.8	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
1627	11044	WOLZA	4	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-05-01 00:00:00.000	1	8.72	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1628	11045	BOTTM	6	1998-04-23 00:00:00	1998-05-21 00:00:00	NULL	2	70.58	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1629	11046	WANDK	8	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-04-24 00:00:00.000	2	71.64	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1630	11047	EASTC	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-01 00:00:00.000	3	46.62	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1631	11048	BOTTM	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-04-30 00:00:00.000	3	24.12	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1632	11049	GOURL	3	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-04 00:00:00.000	1	8.34	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1633	11050	FOLKO	8	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-05 00:00:00.000	2	59.41	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1634	11051	LAMAI	7	1998-04-27 00:00:00	1998-05-25 00:00:00	NULL	3	2.79	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1635	11052	HANAR	3	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-01 00:00:00.000	1	67.26	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1636	11053	PICCO	2	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-04-29 00:00:00.000	2	53.05	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1637	11054	CACTU	8	1998-04-28 00:00:00	1998-05-26 00:00:00	NULL	1	0.33	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1638	11055	HILAA	7	1998-04-28 00:00:00	1998-05-26 00:00:00	1998-05-05 00:00:00.000	2	120.92	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1639	11056	EASTC	8	1998-04-28 00:00:00	1998-05-12 00:00:00	1998-05-01 00:00:00.000	2	278.96	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1640	11057	NORTS	3	1998-04-29 00:00:00	1998-05-27 00:00:00	1998-05-01 00:00:00.000	3	4.13	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
1641	11058	BLAUS	9	1998-04-29 00:00:00	1998-05-27 00:00:00	NULL	3	31.14	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1642	11059	RICAR	2	1998-04-29 00:00:00	1998-06-10 00:00:00	NULL	2	85.8	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1643	11060	FRANS	2	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-04 00:00:00.000	2	10.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1644	11061	GREAL	4	1998-04-30 00:00:00	1998-06-11 00:00:00	NULL	3	14.01	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1645	11062	REGGC	4	1998-04-30 00:00:00	1998-05-28 00:00:00	NULL	2	29.93	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1646	11063	HUNGO	3	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-06 00:00:00.000	2	81.73	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1647	11064	SAVEA	1	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	1	30.09	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1648	11065	LILAS	8	1998-05-01 00:00:00	1998-05-29 00:00:00	NULL	1	12.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1649	11066	WHITC	7	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	2	44.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1650	11067	DRACD	1	1998-05-04 00:00:00	1998-05-18 00:00:00	1998-05-06 00:00:00.000	2	7.98	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1651	11068	QUEEN	8	1998-05-04 00:00:00	1998-06-01 00:00:00	NULL	2	81.75	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1652	11069	TORTU	1	1998-05-04 00:00:00	1998-06-01 00:00:00	1998-05-06 00:00:00.000	2	15.67	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1653	11070	LEHMS	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	136	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1654	11071	LILAS	1	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	0.93	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1655	11072	ERNSH	4	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	258.64	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1656	11073	PERIC	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	24.95	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1657	11074	SIMOB	7	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	18.44	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1658	11075	RICSU	8	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	6.19	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1659	11076	BONAP	4	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	38.28	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1660	11077	RATTC	1	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	8.53	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1661	10248	VINET	5	1996-07-04 00:00:00	1996-08-01 00:00:00	1996-07-16 00:00:00.000	3	32.38	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
1662	10249	TOMSP	6	1996-07-05 00:00:00	1996-08-16 00:00:00	1996-07-10 00:00:00.000	1	11.61	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1663	10250	HANAR	4	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-12 00:00:00.000	2	65.83	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1664	10251	VICTE	3	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-15 00:00:00.000	1	41.34	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1665	10252	SUPRD	4	1996-07-09 00:00:00	1996-08-06 00:00:00	1996-07-11 00:00:00.000	2	51.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1666	10253	HANAR	3	1996-07-10 00:00:00	1996-07-24 00:00:00	1996-07-16 00:00:00.000	2	58.17	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1667	10254	CHOPS	5	1996-07-11 00:00:00	1996-08-08 00:00:00	1996-07-23 00:00:00.000	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1668	10255	RICSU	9	1996-07-12 00:00:00	1996-08-09 00:00:00	1996-07-15 00:00:00.000	3	148.33	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1669	10256	WELLI	3	1996-07-15 00:00:00	1996-08-12 00:00:00	1996-07-17 00:00:00.000	2	13.97	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1670	10257	HILAA	4	1996-07-16 00:00:00	1996-08-13 00:00:00	1996-07-22 00:00:00.000	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1671	10258	ERNSH	1	1996-07-17 00:00:00	1996-08-14 00:00:00	1996-07-23 00:00:00.000	1	140.51	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1672	10259	CENTC	4	1996-07-18 00:00:00	1996-08-15 00:00:00	1996-07-25 00:00:00.000	3	3.25	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	NULL	05022	Mexico
1673	10260	OTTIK	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-29 00:00:00.000	1	55.09	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1674	10261	QUEDE	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-30 00:00:00.000	2	3.05	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1675	10262	RATTC	8	1996-07-22 00:00:00	1996-08-19 00:00:00	1996-07-25 00:00:00.000	3	48.29	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1676	10263	ERNSH	9	1996-07-23 00:00:00	1996-08-20 00:00:00	1996-07-31 00:00:00.000	3	146.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1677	10264	FOLKO	6	1996-07-24 00:00:00	1996-08-21 00:00:00	1996-08-23 00:00:00.000	3	3.67	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1678	10265	BLONP	2	1996-07-25 00:00:00	1996-08-22 00:00:00	1996-08-12 00:00:00.000	1	55.28	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1679	10266	WARTH	3	1996-07-26 00:00:00	1996-09-06 00:00:00	1996-07-31 00:00:00.000	3	25.73	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1680	10267	FRANK	4	1996-07-29 00:00:00	1996-08-26 00:00:00	1996-08-06 00:00:00.000	1	208.58	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1681	10268	GROSR	8	1996-07-30 00:00:00	1996-08-27 00:00:00	1996-08-02 00:00:00.000	3	66.29	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
1682	10269	WHITC	5	1996-07-31 00:00:00	1996-08-14 00:00:00	1996-08-09 00:00:00.000	1	4.56	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1683	10270	WARTH	1	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-02 00:00:00.000	1	136.54	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1684	10271	SPLIR	6	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-30 00:00:00.000	2	4.54	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1685	10272	RATTC	6	1996-08-02 00:00:00	1996-08-30 00:00:00	1996-08-06 00:00:00.000	2	98.03	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1686	10273	QUICK	3	1996-08-05 00:00:00	1996-09-02 00:00:00	1996-08-12 00:00:00.000	3	76.07	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1687	10274	VINET	6	1996-08-06 00:00:00	1996-09-03 00:00:00	1996-08-16 00:00:00.000	1	6.01	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
1688	10275	MAGAA	1	1996-08-07 00:00:00	1996-09-04 00:00:00	1996-08-09 00:00:00.000	1	26.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1689	10276	TORTU	8	1996-08-08 00:00:00	1996-08-22 00:00:00	1996-08-14 00:00:00.000	3	13.84	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1690	10277	MORGK	2	1996-08-09 00:00:00	1996-09-06 00:00:00	1996-08-13 00:00:00.000	3	125.77	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1691	10278	BERGS	8	1996-08-12 00:00:00	1996-09-09 00:00:00	1996-08-16 00:00:00.000	2	92.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1692	10279	LEHMS	8	1996-08-13 00:00:00	1996-09-10 00:00:00	1996-08-16 00:00:00.000	2	25.83	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1693	10280	BERGS	2	1996-08-14 00:00:00	1996-09-11 00:00:00	1996-09-12 00:00:00.000	1	8.98	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1694	10281	ROMEY	4	1996-08-14 00:00:00	1996-08-28 00:00:00	1996-08-21 00:00:00.000	1	2.94	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
1695	10282	ROMEY	4	1996-08-15 00:00:00	1996-09-12 00:00:00	1996-08-21 00:00:00.000	1	12.69	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
1696	10283	LILAS	3	1996-08-16 00:00:00	1996-09-13 00:00:00	1996-08-23 00:00:00.000	3	84.81	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1697	10284	LEHMS	4	1996-08-19 00:00:00	1996-09-16 00:00:00	1996-08-27 00:00:00.000	1	76.56	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1698	10285	QUICK	1	1996-08-20 00:00:00	1996-09-17 00:00:00	1996-08-26 00:00:00.000	2	76.83	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1699	10286	QUICK	8	1996-08-21 00:00:00	1996-09-18 00:00:00	1996-08-30 00:00:00.000	3	229.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1700	10287	RICAR	8	1996-08-22 00:00:00	1996-09-19 00:00:00	1996-08-28 00:00:00.000	3	12.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1701	10288	REGGC	4	1996-08-23 00:00:00	1996-09-20 00:00:00	1996-09-03 00:00:00.000	1	7.45	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1702	10289	BSBEV	7	1996-08-26 00:00:00	1996-09-23 00:00:00	1996-08-28 00:00:00.000	3	22.77	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1703	10290	COMMI	8	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-03 00:00:00.000	1	79.7	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1704	10291	QUEDE	6	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-04 00:00:00.000	2	6.4	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1705	10292	TRADH	1	1996-08-28 00:00:00	1996-09-25 00:00:00	1996-09-02 00:00:00.000	2	1.35	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1706	10293	TORTU	1	1996-08-29 00:00:00	1996-09-26 00:00:00	1996-09-11 00:00:00.000	3	21.18	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1707	10294	RATTC	4	1996-08-30 00:00:00	1996-09-27 00:00:00	1996-09-05 00:00:00.000	2	147.26	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1708	10295	VINET	2	1996-09-02 00:00:00	1996-09-30 00:00:00	1996-09-10 00:00:00.000	2	1.15	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
1709	10296	LILAS	6	1996-09-03 00:00:00	1996-10-01 00:00:00	1996-09-11 00:00:00.000	1	0.12	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1710	10297	BLONP	5	1996-09-04 00:00:00	1996-10-16 00:00:00	1996-09-10 00:00:00.000	2	5.74	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1711	10298	HUNGO	6	1996-09-05 00:00:00	1996-10-03 00:00:00	1996-09-11 00:00:00.000	2	168.22	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1712	10299	RICAR	4	1996-09-06 00:00:00	1996-10-04 00:00:00	1996-09-13 00:00:00.000	2	29.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1713	10300	MAGAA	2	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-18 00:00:00.000	2	17.68	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1714	10301	WANDK	8	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-17 00:00:00.000	2	45.08	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1715	10302	SUPRD	4	1996-09-10 00:00:00	1996-10-08 00:00:00	1996-10-09 00:00:00.000	2	6.27	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1716	10303	GODOS	7	1996-09-11 00:00:00	1996-10-09 00:00:00	1996-09-18 00:00:00.000	2	107.83	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1717	10304	TORTU	1	1996-09-12 00:00:00	1996-10-10 00:00:00	1996-09-17 00:00:00.000	2	63.79	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1718	10305	OLDWO	8	1996-09-13 00:00:00	1996-10-11 00:00:00	1996-10-09 00:00:00.000	3	257.62	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1719	10306	ROMEY	1	1996-09-16 00:00:00	1996-10-14 00:00:00	1996-09-23 00:00:00.000	3	7.56	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
1720	10307	LONEP	2	1996-09-17 00:00:00	1996-10-15 00:00:00	1996-09-25 00:00:00.000	2	0.56	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1721	10308	ANATR	7	1996-09-18 00:00:00	1996-10-16 00:00:00	1996-09-24 00:00:00.000	3	1.61	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
1722	10309	HUNGO	3	1996-09-19 00:00:00	1996-10-17 00:00:00	1996-10-23 00:00:00.000	1	47.3	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1723	10310	THEBI	8	1996-09-20 00:00:00	1996-10-18 00:00:00	1996-09-27 00:00:00.000	2	17.52	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
1724	10311	DUMON	1	1996-09-20 00:00:00	1996-10-04 00:00:00	1996-09-26 00:00:00.000	3	24.69	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
1725	10312	WANDK	2	1996-09-23 00:00:00	1996-10-21 00:00:00	1996-10-03 00:00:00.000	2	40.26	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1726	10313	QUICK	2	1996-09-24 00:00:00	1996-10-22 00:00:00	1996-10-04 00:00:00.000	2	1.96	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1727	10314	RATTC	1	1996-09-25 00:00:00	1996-10-23 00:00:00	1996-10-04 00:00:00.000	2	74.16	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1728	10315	ISLAT	4	1996-09-26 00:00:00	1996-10-24 00:00:00	1996-10-03 00:00:00.000	2	41.76	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1729	10316	RATTC	1	1996-09-27 00:00:00	1996-10-25 00:00:00	1996-10-08 00:00:00.000	3	150.15	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1730	10317	LONEP	6	1996-09-30 00:00:00	1996-10-28 00:00:00	1996-10-10 00:00:00.000	1	12.69	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1731	10318	ISLAT	8	1996-10-01 00:00:00	1996-10-29 00:00:00	1996-10-04 00:00:00.000	2	4.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1732	10319	TORTU	7	1996-10-02 00:00:00	1996-10-30 00:00:00	1996-10-11 00:00:00.000	3	64.5	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1733	10320	WARTH	5	1996-10-03 00:00:00	1996-10-17 00:00:00	1996-10-18 00:00:00.000	3	34.57	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1734	10321	ISLAT	3	1996-10-03 00:00:00	1996-10-31 00:00:00	1996-10-11 00:00:00.000	2	3.43	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1735	10322	PERIC	7	1996-10-04 00:00:00	1996-11-01 00:00:00	1996-10-23 00:00:00.000	3	0.4	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1736	10323	KOENE	4	1996-10-07 00:00:00	1996-11-04 00:00:00	1996-10-14 00:00:00.000	1	4.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1737	10324	SAVEA	9	1996-10-08 00:00:00	1996-11-05 00:00:00	1996-10-10 00:00:00.000	1	214.27	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1738	10325	KOENE	1	1996-10-09 00:00:00	1996-10-23 00:00:00	1996-10-14 00:00:00.000	3	64.86	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1739	10326	BOLID	4	1996-10-10 00:00:00	1996-11-07 00:00:00	1996-10-14 00:00:00.000	2	77.92	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
1740	10327	FOLKO	2	1996-10-11 00:00:00	1996-11-08 00:00:00	1996-10-14 00:00:00.000	1	63.36	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1741	10328	FURIB	4	1996-10-14 00:00:00	1996-11-11 00:00:00	1996-10-17 00:00:00.000	3	87.03	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1742	10329	SPLIR	4	1996-10-15 00:00:00	1996-11-26 00:00:00	1996-10-23 00:00:00.000	2	191.67	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1743	10330	LILAS	3	1996-10-16 00:00:00	1996-11-13 00:00:00	1996-10-28 00:00:00.000	1	12.75	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1744	10331	BONAP	9	1996-10-16 00:00:00	1996-11-27 00:00:00	1996-10-21 00:00:00.000	1	10.19	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1745	10332	MEREP	3	1996-10-17 00:00:00	1996-11-28 00:00:00	1996-10-21 00:00:00.000	2	52.84	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1746	10333	WARTH	5	1996-10-18 00:00:00	1996-11-15 00:00:00	1996-10-25 00:00:00.000	3	0.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1747	10334	VICTE	8	1996-10-21 00:00:00	1996-11-18 00:00:00	1996-10-28 00:00:00.000	2	8.56	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1748	10335	HUNGO	7	1996-10-22 00:00:00	1996-11-19 00:00:00	1996-10-24 00:00:00.000	2	42.11	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1749	10336	PRINI	7	1996-10-23 00:00:00	1996-11-20 00:00:00	1996-10-25 00:00:00.000	2	15.51	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1750	10337	FRANK	4	1996-10-24 00:00:00	1996-11-21 00:00:00	1996-10-29 00:00:00.000	3	108.26	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1751	10338	OLDWO	4	1996-10-25 00:00:00	1996-11-22 00:00:00	1996-10-29 00:00:00.000	3	84.21	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1752	10339	MEREP	2	1996-10-28 00:00:00	1996-11-25 00:00:00	1996-11-04 00:00:00.000	2	15.66	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1753	10340	BONAP	1	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-08 00:00:00.000	3	166.31	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1754	10341	SIMOB	7	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-05 00:00:00.000	3	26.78	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1755	10342	FRANK	4	1996-10-30 00:00:00	1996-11-13 00:00:00	1996-11-04 00:00:00.000	2	54.83	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1756	10343	LEHMS	4	1996-10-31 00:00:00	1996-11-28 00:00:00	1996-11-06 00:00:00.000	1	110.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1757	10344	WHITC	4	1996-11-01 00:00:00	1996-11-29 00:00:00	1996-11-05 00:00:00.000	2	23.29	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1758	10345	QUICK	2	1996-11-04 00:00:00	1996-12-02 00:00:00	1996-11-11 00:00:00.000	2	249.06	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1759	10346	RATTC	3	1996-11-05 00:00:00	1996-12-17 00:00:00	1996-11-08 00:00:00.000	3	142.08	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1760	10347	FAMIA	4	1996-11-06 00:00:00	1996-12-04 00:00:00	1996-11-08 00:00:00.000	3	3.1	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1761	10348	WANDK	4	1996-11-07 00:00:00	1996-12-05 00:00:00	1996-11-15 00:00:00.000	2	0.78	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1762	10349	SPLIR	7	1996-11-08 00:00:00	1996-12-06 00:00:00	1996-11-15 00:00:00.000	1	8.63	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1763	10350	LAMAI	6	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-12-03 00:00:00.000	2	64.19	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1764	10351	ERNSH	1	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-11-20 00:00:00.000	1	162.33	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1765	10352	FURIB	3	1996-11-12 00:00:00	1996-11-26 00:00:00	1996-11-18 00:00:00.000	3	1.3	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1766	10353	PICCO	7	1996-11-13 00:00:00	1996-12-11 00:00:00	1996-11-25 00:00:00.000	3	360.63	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1767	10354	PERIC	8	1996-11-14 00:00:00	1996-12-12 00:00:00	1996-11-20 00:00:00.000	3	53.8	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1768	10355	AROUT	6	1996-11-15 00:00:00	1996-12-13 00:00:00	1996-11-20 00:00:00.000	1	41.95	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1769	10356	WANDK	6	1996-11-18 00:00:00	1996-12-16 00:00:00	1996-11-27 00:00:00.000	2	36.71	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1770	10357	LILAS	1	1996-11-19 00:00:00	1996-12-17 00:00:00	1996-12-02 00:00:00.000	3	34.88	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1771	10358	LAMAI	5	1996-11-20 00:00:00	1996-12-18 00:00:00	1996-11-27 00:00:00.000	1	19.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1772	10359	SEVES	5	1996-11-21 00:00:00	1996-12-19 00:00:00	1996-11-26 00:00:00.000	3	288.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1773	10360	BLONP	4	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-02 00:00:00.000	3	131.7	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1774	10361	QUICK	1	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-03 00:00:00.000	2	183.17	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1775	10362	BONAP	3	1996-11-25 00:00:00	1996-12-23 00:00:00	1996-11-28 00:00:00.000	1	96.04	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1776	10363	DRACD	4	1996-11-26 00:00:00	1996-12-24 00:00:00	1996-12-04 00:00:00.000	3	30.54	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1777	10364	EASTC	1	1996-11-26 00:00:00	1997-01-07 00:00:00	1996-12-04 00:00:00.000	1	71.97	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1778	10365	ANTON	3	1996-11-27 00:00:00	1996-12-25 00:00:00	1996-12-02 00:00:00.000	2	22	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1779	10366	GALED	8	1996-11-28 00:00:00	1997-01-09 00:00:00	1996-12-30 00:00:00.000	2	10.14	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1780	10367	VAFFE	7	1996-11-28 00:00:00	1996-12-26 00:00:00	1996-12-02 00:00:00.000	3	13.55	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1781	10368	ERNSH	2	1996-11-29 00:00:00	1996-12-27 00:00:00	1996-12-02 00:00:00.000	2	101.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1782	10369	SPLIR	8	1996-12-02 00:00:00	1996-12-30 00:00:00	1996-12-09 00:00:00.000	2	195.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1783	10370	CHOPS	6	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-27 00:00:00.000	2	1.17	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1784	10371	LAMAI	1	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-24 00:00:00.000	1	0.45	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1785	10372	QUEEN	5	1996-12-04 00:00:00	1997-01-01 00:00:00	1996-12-09 00:00:00.000	2	890.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1786	10373	HUNGO	4	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-11 00:00:00.000	3	124.12	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1787	10374	WOLZA	1	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-09 00:00:00.000	3	3.94	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
1788	10375	HUNGC	3	1996-12-06 00:00:00	1997-01-03 00:00:00	1996-12-09 00:00:00.000	2	20.12	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
1789	10376	MEREP	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	2	20.39	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1790	10377	SEVES	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00.000	3	22.21	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1791	10378	FOLKO	5	1996-12-10 00:00:00	1997-01-07 00:00:00	1996-12-19 00:00:00.000	3	5.44	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1792	10379	QUEDE	2	1996-12-11 00:00:00	1997-01-08 00:00:00	1996-12-13 00:00:00.000	1	45.03	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1793	10380	HUNGO	8	1996-12-12 00:00:00	1997-01-09 00:00:00	1997-01-16 00:00:00.000	3	35.03	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1794	10381	LILAS	3	1996-12-12 00:00:00	1997-01-09 00:00:00	1996-12-13 00:00:00.000	3	7.99	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1795	10382	ERNSH	4	1996-12-13 00:00:00	1997-01-10 00:00:00	1996-12-16 00:00:00.000	1	94.77	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1796	10383	AROUT	8	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-18 00:00:00.000	3	34.24	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1797	10384	BERGS	3	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-20 00:00:00.000	3	168.64	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1798	10385	SPLIR	1	1996-12-17 00:00:00	1997-01-14 00:00:00	1996-12-23 00:00:00.000	2	30.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1799	10386	FAMIA	9	1996-12-18 00:00:00	1997-01-01 00:00:00	1996-12-25 00:00:00.000	3	13.99	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1800	10387	SANTG	1	1996-12-18 00:00:00	1997-01-15 00:00:00	1996-12-20 00:00:00.000	2	93.63	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1801	10388	SEVES	2	1996-12-19 00:00:00	1997-01-16 00:00:00	1996-12-20 00:00:00.000	1	34.86	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1802	10389	BOTTM	4	1996-12-20 00:00:00	1997-01-17 00:00:00	1996-12-24 00:00:00.000	2	47.42	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1803	10390	ERNSH	6	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-26 00:00:00.000	1	126.38	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1804	10391	DRACD	3	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-31 00:00:00.000	3	5.45	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
1805	10392	PICCO	2	1996-12-24 00:00:00	1997-01-21 00:00:00	1997-01-01 00:00:00.000	3	122.46	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1806	10393	SAVEA	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	126.56	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1807	10394	HUNGC	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00.000	3	30.34	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
1808	10395	HILAA	6	1996-12-26 00:00:00	1997-01-23 00:00:00	1997-01-03 00:00:00.000	1	184.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1809	10396	FRANK	1	1996-12-27 00:00:00	1997-01-10 00:00:00	1997-01-06 00:00:00.000	3	135.35	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1810	10397	PRINI	5	1996-12-27 00:00:00	1997-01-24 00:00:00	1997-01-02 00:00:00.000	1	60.26	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1811	10398	SAVEA	2	1996-12-30 00:00:00	1997-01-27 00:00:00	1997-01-09 00:00:00.000	3	89.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1812	10399	VAFFE	8	1996-12-31 00:00:00	1997-01-14 00:00:00	1997-01-08 00:00:00.000	3	27.36	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1813	10400	EASTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-16 00:00:00.000	3	83.93	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1814	10401	RATTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-10 00:00:00.000	1	12.51	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1815	10402	ERNSH	8	1997-01-02 00:00:00	1997-02-13 00:00:00	1997-01-10 00:00:00.000	2	67.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1816	10403	ERNSH	4	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-09 00:00:00.000	3	73.79	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1817	10404	MAGAA	2	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-08 00:00:00.000	1	155.97	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1818	10405	LINOD	1	1997-01-06 00:00:00	1997-02-03 00:00:00	1997-01-22 00:00:00.000	1	34.82	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1819	10406	QUEEN	7	1997-01-07 00:00:00	1997-02-18 00:00:00	1997-01-13 00:00:00.000	1	108.04	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1820	10407	OTTIK	2	1997-01-07 00:00:00	1997-02-04 00:00:00	1997-01-30 00:00:00.000	2	91.48	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1821	10408	FOLIG	8	1997-01-08 00:00:00	1997-02-05 00:00:00	1997-01-14 00:00:00.000	1	11.26	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1822	10409	OCEAN	3	1997-01-09 00:00:00	1997-02-06 00:00:00	1997-01-14 00:00:00.000	1	29.83	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1823	10410	BOTTM	3	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-15 00:00:00.000	3	2.4	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1824	10411	BOTTM	9	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-21 00:00:00.000	3	23.65	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1825	10412	WARTH	8	1997-01-13 00:00:00	1997-02-10 00:00:00	1997-01-15 00:00:00.000	2	3.77	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1826	10413	LAMAI	3	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-16 00:00:00.000	2	95.66	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1827	10414	FAMIA	2	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-17 00:00:00.000	3	21.48	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1828	10415	HUNGC	3	1997-01-15 00:00:00	1997-02-12 00:00:00	1997-01-24 00:00:00.000	1	0.2	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
1829	10416	WARTH	8	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-27 00:00:00.000	3	22.72	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1830	10417	SIMOB	4	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-28 00:00:00.000	3	70.29	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1831	10418	QUICK	4	1997-01-17 00:00:00	1997-02-14 00:00:00	1997-01-24 00:00:00.000	1	17.55	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1832	10419	RICSU	4	1997-01-20 00:00:00	1997-02-17 00:00:00	1997-01-30 00:00:00.000	2	137.35	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1833	10420	WELLI	3	1997-01-21 00:00:00	1997-02-18 00:00:00	1997-01-27 00:00:00.000	1	44.12	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1834	10421	QUEDE	8	1997-01-21 00:00:00	1997-03-04 00:00:00	1997-01-27 00:00:00.000	1	99.23	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
1835	10422	FRANS	2	1997-01-22 00:00:00	1997-02-19 00:00:00	1997-01-31 00:00:00.000	1	3.02	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
1836	10423	GOURL	6	1997-01-23 00:00:00	1997-02-06 00:00:00	1997-02-24 00:00:00.000	3	24.5	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
1837	10424	MEREP	7	1997-01-23 00:00:00	1997-02-20 00:00:00	1997-01-27 00:00:00.000	2	370.61	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1838	10425	LAMAI	6	1997-01-24 00:00:00	1997-02-21 00:00:00	1997-02-14 00:00:00.000	2	7.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1839	10426	GALED	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-02-06 00:00:00.000	1	18.69	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1840	10427	PICCO	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-03-03 00:00:00.000	2	31.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1841	10428	REGGC	7	1997-01-28 00:00:00	1997-02-25 00:00:00	1997-02-04 00:00:00.000	1	11.09	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1842	10429	HUNGO	3	1997-01-29 00:00:00	1997-03-12 00:00:00	1997-02-07 00:00:00.000	2	56.63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1843	10430	ERNSH	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-03 00:00:00.000	1	458.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1844	10431	BOTTM	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-07 00:00:00.000	2	44.17	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1845	10432	SPLIR	3	1997-01-31 00:00:00	1997-02-14 00:00:00	1997-02-07 00:00:00.000	2	4.34	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
1846	10433	PRINI	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-03-04 00:00:00.000	3	73.83	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1847	10434	FOLKO	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-02-13 00:00:00.000	2	17.92	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1848	10435	CONSH	8	1997-02-04 00:00:00	1997-03-18 00:00:00	1997-02-07 00:00:00.000	2	9.21	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
1849	10436	BLONP	3	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-11 00:00:00.000	2	156.66	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1850	10437	WARTH	8	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-12 00:00:00.000	1	19.97	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1851	10438	TOMSP	3	1997-02-06 00:00:00	1997-03-06 00:00:00	1997-02-14 00:00:00.000	2	8.24	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1852	10439	MEREP	6	1997-02-07 00:00:00	1997-03-07 00:00:00	1997-02-10 00:00:00.000	3	4.07	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1853	10440	SAVEA	4	1997-02-10 00:00:00	1997-03-10 00:00:00	1997-02-28 00:00:00.000	2	86.53	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1854	10441	OLDWO	3	1997-02-10 00:00:00	1997-03-24 00:00:00	1997-03-14 00:00:00.000	2	73.02	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
1855	10442	ERNSH	3	1997-02-11 00:00:00	1997-03-11 00:00:00	1997-02-18 00:00:00.000	2	47.94	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1856	10443	REGGC	8	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-14 00:00:00.000	1	13.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1857	10444	BERGS	3	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-21 00:00:00.000	3	3.5	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1858	10445	BERGS	3	1997-02-13 00:00:00	1997-03-13 00:00:00	1997-02-20 00:00:00.000	1	9.3	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1859	10446	TOMSP	6	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-02-19 00:00:00.000	1	14.68	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1860	10447	RICAR	4	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-03-07 00:00:00.000	2	68.66	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1861	10448	RANCH	4	1997-02-17 00:00:00	1997-03-17 00:00:00	1997-02-24 00:00:00.000	2	38.82	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
1862	10449	BLONP	3	1997-02-18 00:00:00	1997-03-18 00:00:00	1997-02-27 00:00:00.000	2	53.3	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1863	10450	VICTE	8	1997-02-19 00:00:00	1997-03-19 00:00:00	1997-03-11 00:00:00.000	2	7.23	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1864	10451	QUICK	4	1997-02-19 00:00:00	1997-03-05 00:00:00	1997-03-12 00:00:00.000	3	189.09	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1865	10452	SAVEA	8	1997-02-20 00:00:00	1997-03-20 00:00:00	1997-02-26 00:00:00.000	1	140.26	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1866	10453	AROUT	1	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-26 00:00:00.000	2	25.36	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1867	10454	LAMAI	4	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-25 00:00:00.000	3	2.74	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1868	10455	WARTH	8	1997-02-24 00:00:00	1997-04-07 00:00:00	1997-03-03 00:00:00.000	2	180.45	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1869	10456	KOENE	8	1997-02-25 00:00:00	1997-04-08 00:00:00	1997-02-28 00:00:00.000	2	8.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1870	10457	KOENE	2	1997-02-25 00:00:00	1997-03-25 00:00:00	1997-03-03 00:00:00.000	1	11.57	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1871	10458	SUPRD	7	1997-02-26 00:00:00	1997-03-26 00:00:00	1997-03-04 00:00:00.000	3	147.06	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1872	10459	VICTE	4	1997-02-27 00:00:00	1997-03-27 00:00:00	1997-02-28 00:00:00.000	2	25.09	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1873	10460	FOLKO	8	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-03 00:00:00.000	1	16.27	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1874	10461	LILAS	1	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-05 00:00:00.000	3	148.61	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1875	10462	CONSH	2	1997-03-03 00:00:00	1997-03-31 00:00:00	1997-03-18 00:00:00.000	1	6.17	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
1876	10463	SUPRD	5	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-06 00:00:00.000	3	14.78	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1877	10464	FURIB	4	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-14 00:00:00.000	2	89	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1878	10465	VAFFE	1	1997-03-05 00:00:00	1997-04-02 00:00:00	1997-03-14 00:00:00.000	3	145.04	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
1879	10466	COMMI	4	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-13 00:00:00.000	1	11.93	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1880	10467	MAGAA	8	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-11 00:00:00.000	2	4.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
1881	10468	KOENE	3	1997-03-07 00:00:00	1997-04-04 00:00:00	1997-03-12 00:00:00.000	3	44.12	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1882	10469	WHITC	1	1997-03-10 00:00:00	1997-04-07 00:00:00	1997-03-14 00:00:00.000	1	60.18	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1883	10470	BONAP	4	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-14 00:00:00.000	2	64.56	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1884	10471	BSBEV	2	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-18 00:00:00.000	3	45.59	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1885	10472	SEVES	8	1997-03-12 00:00:00	1997-04-09 00:00:00	1997-03-19 00:00:00.000	1	4.2	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1886	10473	ISLAT	1	1997-03-13 00:00:00	1997-03-27 00:00:00	1997-03-21 00:00:00.000	3	16.37	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
1887	10474	PERIC	5	1997-03-13 00:00:00	1997-04-10 00:00:00	1997-03-21 00:00:00.000	2	83.49	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1888	10475	SUPRD	9	1997-03-14 00:00:00	1997-04-11 00:00:00	1997-04-04 00:00:00.000	1	68.52	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
1889	10476	HILAA	8	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-24 00:00:00.000	3	4.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1890	10477	PRINI	5	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-25 00:00:00.000	2	13.02	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
1891	10478	VICTE	2	1997-03-18 00:00:00	1997-04-01 00:00:00	1997-03-26 00:00:00.000	3	4.81	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1892	10479	RATTC	3	1997-03-19 00:00:00	1997-04-16 00:00:00	1997-03-21 00:00:00.000	3	708.95	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1893	10480	FOLIG	6	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-24 00:00:00.000	2	1.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
1894	10481	RICAR	8	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-25 00:00:00.000	2	64.33	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1895	10482	LAZYK	1	1997-03-21 00:00:00	1997-04-18 00:00:00	1997-04-10 00:00:00.000	3	7.48	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
1896	10483	WHITC	7	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-25 00:00:00.000	2	15.28	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1897	10484	BSBEV	3	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-01 00:00:00.000	3	6.88	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1898	10485	LINOD	4	1997-03-25 00:00:00	1997-04-08 00:00:00	1997-03-31 00:00:00.000	2	64.45	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
1899	10486	HILAA	1	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-04-02 00:00:00.000	2	30.53	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1900	10487	QUEEN	2	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-03-28 00:00:00.000	2	71.07	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
1901	10488	FRANK	8	1997-03-27 00:00:00	1997-04-24 00:00:00	1997-04-02 00:00:00.000	2	4.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1902	10489	PICCO	6	1997-03-28 00:00:00	1997-04-25 00:00:00	1997-04-09 00:00:00.000	2	5.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1903	10490	HILAA	7	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-03 00:00:00.000	2	210.19	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1904	10491	FURIB	8	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-08 00:00:00.000	3	16.96	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1905	10492	BOTTM	3	1997-04-01 00:00:00	1997-04-29 00:00:00	1997-04-11 00:00:00.000	1	62.89	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
1906	10493	LAMAI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-10 00:00:00.000	3	10.64	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1907	10494	COMMI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-09 00:00:00.000	2	65.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
1908	10495	LAUGB	3	1997-04-03 00:00:00	1997-05-01 00:00:00	1997-04-11 00:00:00.000	3	4.65	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
1909	10496	TRADH	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	2	46.77	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
1910	10497	LEHMS	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00.000	1	36.21	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1911	10498	HILAA	8	1997-04-07 00:00:00	1997-05-05 00:00:00	1997-04-11 00:00:00.000	2	29.75	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1912	10499	LILAS	4	1997-04-08 00:00:00	1997-05-06 00:00:00	1997-04-16 00:00:00.000	2	102.02	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1913	10500	LAMAI	6	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-17 00:00:00.000	1	42.68	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
1914	10501	BLAUS	9	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-16 00:00:00.000	3	8.85	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1915	10502	PERIC	2	1997-04-10 00:00:00	1997-05-08 00:00:00	1997-04-29 00:00:00.000	1	69.32	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
1916	10503	HUNGO	6	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-16 00:00:00.000	2	16.74	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1917	10504	WHITC	4	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-18 00:00:00.000	3	59.13	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
1918	10505	MEREP	3	1997-04-14 00:00:00	1997-05-12 00:00:00	1997-04-21 00:00:00.000	3	7.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1919	10506	KOENE	9	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-05-02 00:00:00.000	2	21.19	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1920	10507	ANTON	7	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-04-22 00:00:00.000	1	47.45	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1921	10508	OTTIK	1	1997-04-16 00:00:00	1997-05-14 00:00:00	1997-05-13 00:00:00.000	2	4.99	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1922	10509	BLAUS	4	1997-04-17 00:00:00	1997-05-15 00:00:00	1997-04-29 00:00:00.000	1	0.15	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1923	10510	SAVEA	6	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-28 00:00:00.000	3	367.63	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1924	10511	BONAP	4	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-21 00:00:00.000	3	350.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1925	10512	FAMIA	7	1997-04-21 00:00:00	1997-05-19 00:00:00	1997-04-24 00:00:00.000	2	3.53	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1926	10513	WANDK	7	1997-04-22 00:00:00	1997-06-03 00:00:00	1997-04-28 00:00:00.000	1	105.65	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
1927	10514	ERNSH	3	1997-04-22 00:00:00	1997-05-20 00:00:00	1997-05-16 00:00:00.000	2	789.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1928	10515	QUICK	2	1997-04-23 00:00:00	1997-05-07 00:00:00	1997-05-23 00:00:00.000	1	204.47	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1929	10516	HUNGO	2	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-05-01 00:00:00.000	3	62.78	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1930	10517	NORTS	3	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-04-29 00:00:00.000	3	32.07	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
1931	10518	TORTU	4	1997-04-25 00:00:00	1997-05-09 00:00:00	1997-05-05 00:00:00.000	2	218.15	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1932	10519	CHOPS	6	1997-04-28 00:00:00	1997-05-26 00:00:00	1997-05-01 00:00:00.000	3	91.76	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
1933	10520	SANTG	7	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-01 00:00:00.000	1	13.37	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
1934	10521	CACTU	8	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-02 00:00:00.000	2	17.22	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
1935	10522	LEHMS	4	1997-04-30 00:00:00	1997-05-28 00:00:00	1997-05-06 00:00:00.000	1	45.33	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1936	10523	SEVES	7	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-30 00:00:00.000	2	77.63	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1937	10524	BERGS	1	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-07 00:00:00.000	2	244.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1938	10525	BONAP	1	1997-05-02 00:00:00	1997-05-30 00:00:00	1997-05-23 00:00:00.000	2	11.06	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
1939	10526	WARTH	4	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-15 00:00:00.000	2	58.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1940	10527	QUICK	7	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-07 00:00:00.000	1	41.9	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1941	10528	GREAL	6	1997-05-06 00:00:00	1997-05-20 00:00:00	1997-05-09 00:00:00.000	2	3.35	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
1942	10529	MAISD	5	1997-05-07 00:00:00	1997-06-04 00:00:00	1997-05-09 00:00:00.000	2	66.69	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
1943	10530	PICCO	3	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-12 00:00:00.000	2	339.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
1944	10531	OCEAN	7	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-19 00:00:00.000	1	8.12	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
1945	10532	EASTC	7	1997-05-09 00:00:00	1997-06-06 00:00:00	1997-05-12 00:00:00.000	3	74.46	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
1946	10533	FOLKO	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-22 00:00:00.000	1	188.04	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1947	10534	LEHMS	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-14 00:00:00.000	2	27.94	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1948	10535	ANTON	4	1997-05-13 00:00:00	1997-06-10 00:00:00	1997-05-21 00:00:00.000	1	15.64	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1949	10536	LEHMS	3	1997-05-14 00:00:00	1997-06-11 00:00:00	1997-06-06 00:00:00.000	2	58.88	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1950	10537	RICSU	1	1997-05-14 00:00:00	1997-05-28 00:00:00	1997-05-19 00:00:00.000	1	78.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
1951	10538	BSBEV	9	1997-05-15 00:00:00	1997-06-12 00:00:00	1997-05-16 00:00:00.000	3	4.87	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1952	10539	BSBEV	6	1997-05-16 00:00:00	1997-06-13 00:00:00	1997-05-23 00:00:00.000	3	12.36	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1953	10540	QUICK	3	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-06-13 00:00:00.000	3	1007.64	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1954	10541	HANAR	2	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-05-29 00:00:00.000	1	68.65	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
1955	10542	KOENE	1	1997-05-20 00:00:00	1997-06-17 00:00:00	1997-05-26 00:00:00.000	3	10.95	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
1956	10543	LILAS	8	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-23 00:00:00.000	2	48.17	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
1957	10544	LONEP	4	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-30 00:00:00.000	1	24.91	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
1958	10545	LAZYK	8	1997-05-22 00:00:00	1997-06-19 00:00:00	1997-06-26 00:00:00.000	2	11.92	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
1959	10546	VICTE	1	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-05-27 00:00:00.000	3	194.72	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
1960	10547	SEVES	3	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-06-02 00:00:00.000	2	178.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
1961	10548	TOMSP	3	1997-05-26 00:00:00	1997-06-23 00:00:00	1997-06-02 00:00:00.000	2	1.43	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
1962	10549	QUICK	5	1997-05-27 00:00:00	1997-06-10 00:00:00	1997-05-30 00:00:00.000	1	171.24	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
1963	10550	GODOS	7	1997-05-28 00:00:00	1997-06-25 00:00:00	1997-06-06 00:00:00.000	3	4.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
1964	10551	FURIB	4	1997-05-28 00:00:00	1997-07-09 00:00:00	1997-06-06 00:00:00.000	3	72.95	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
1965	10552	HILAA	2	1997-05-29 00:00:00	1997-06-26 00:00:00	1997-06-05 00:00:00.000	1	83.22	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
1966	10553	WARTH	2	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-03 00:00:00.000	2	149.49	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1967	10554	OTTIK	4	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-05 00:00:00.000	3	120.97	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1968	10555	SAVEA	6	1997-06-02 00:00:00	1997-06-30 00:00:00	1997-06-04 00:00:00.000	3	252.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
1969	10556	SIMOB	2	1997-06-03 00:00:00	1997-07-15 00:00:00	1997-06-13 00:00:00.000	1	9.8	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
1970	10557	LEHMS	9	1997-06-03 00:00:00	1997-06-17 00:00:00	1997-06-06 00:00:00.000	2	96.72	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
1971	10558	AROUT	1	1997-06-04 00:00:00	1997-07-02 00:00:00	1997-06-10 00:00:00.000	2	72.97	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
1972	10559	BLONP	6	1997-06-05 00:00:00	1997-07-03 00:00:00	1997-06-13 00:00:00.000	1	8.05	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1973	10560	FRANK	8	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	1	36.65	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
1974	10561	FOLKO	2	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00.000	2	242.21	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
1975	10562	REGGC	1	1997-06-09 00:00:00	1997-07-07 00:00:00	1997-06-12 00:00:00.000	1	22.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
1976	10563	RICAR	2	1997-06-10 00:00:00	1997-07-22 00:00:00	1997-06-24 00:00:00.000	2	60.43	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
1977	10564	RATTC	4	1997-06-10 00:00:00	1997-07-08 00:00:00	1997-06-16 00:00:00.000	3	13.75	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1978	10565	MEREP	8	1997-06-11 00:00:00	1997-07-09 00:00:00	1997-06-18 00:00:00.000	2	7.15	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1979	10566	BLONP	9	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-18 00:00:00.000	1	88.4	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1980	10567	HUNGO	1	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-17 00:00:00.000	1	33.97	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
1981	10568	GALED	3	1997-06-13 00:00:00	1997-07-11 00:00:00	1997-07-09 00:00:00.000	3	6.54	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
1982	10569	RATTC	5	1997-06-16 00:00:00	1997-07-14 00:00:00	1997-07-11 00:00:00.000	1	58.98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
1983	10570	MEREP	3	1997-06-17 00:00:00	1997-07-15 00:00:00	1997-06-19 00:00:00.000	3	188.99	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
1984	10571	ERNSH	8	1997-06-17 00:00:00	1997-07-29 00:00:00	1997-07-04 00:00:00.000	3	26.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
1985	10572	BERGS	3	1997-06-18 00:00:00	1997-07-16 00:00:00	1997-06-25 00:00:00.000	2	116.43	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
1986	10573	ANTON	7	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-20 00:00:00.000	3	84.84	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
1987	10574	TRAIH	4	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-30 00:00:00.000	2	37.6	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
1988	10575	MORGK	5	1997-06-20 00:00:00	1997-07-04 00:00:00	1997-06-30 00:00:00.000	1	127.34	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
1989	10576	TORTU	3	1997-06-23 00:00:00	1997-07-07 00:00:00	1997-06-30 00:00:00.000	3	18.56	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
1990	10577	TRAIH	9	1997-06-23 00:00:00	1997-08-04 00:00:00	1997-06-30 00:00:00.000	2	25.41	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
1991	10578	BSBEV	4	1997-06-24 00:00:00	1997-07-22 00:00:00	1997-07-25 00:00:00.000	3	29.6	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
1992	10579	LETSS	1	1997-06-25 00:00:00	1997-07-23 00:00:00	1997-07-04 00:00:00.000	2	13.73	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
1993	10580	OTTIK	4	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-01 00:00:00.000	3	75.89	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
1994	10581	FAMIA	3	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-02 00:00:00.000	1	3.01	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
1995	10582	BLAUS	3	1997-06-27 00:00:00	1997-07-25 00:00:00	1997-07-14 00:00:00.000	2	27.71	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
1996	10583	WARTH	2	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	2	7.28	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
1997	10584	BLONP	4	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00.000	1	59.14	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
1998	10585	WELLI	7	1997-07-01 00:00:00	1997-07-29 00:00:00	1997-07-10 00:00:00.000	1	13.41	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
1999	10586	REGGC	9	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	0.48	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2000	10587	QUEDE	1	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00.000	1	62.52	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
2001	10588	QUICK	2	1997-07-03 00:00:00	1997-07-31 00:00:00	1997-07-10 00:00:00.000	3	194.67	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2002	10589	GREAL	8	1997-07-04 00:00:00	1997-08-01 00:00:00	1997-07-14 00:00:00.000	2	4.42	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2003	10590	MEREP	4	1997-07-07 00:00:00	1997-08-04 00:00:00	1997-07-14 00:00:00.000	3	44.77	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
2004	10591	VAFFE	1	1997-07-07 00:00:00	1997-07-21 00:00:00	1997-07-16 00:00:00.000	1	55.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2005	10592	LEHMS	3	1997-07-08 00:00:00	1997-08-05 00:00:00	1997-07-16 00:00:00.000	1	32.1	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2006	10593	LEHMS	7	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-08-13 00:00:00.000	2	174.2	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2007	10594	OLDWO	3	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-07-16 00:00:00.000	2	5.24	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2008	10595	ERNSH	2	1997-07-10 00:00:00	1997-08-07 00:00:00	1997-07-14 00:00:00.000	1	96.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2009	10596	WHITC	8	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-08-12 00:00:00.000	1	16.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2010	10597	PICCO	7	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-07-18 00:00:00.000	3	35.12	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
2011	10598	RATTC	1	1997-07-14 00:00:00	1997-08-11 00:00:00	1997-07-18 00:00:00.000	3	44.42	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2012	10599	BSBEV	6	1997-07-15 00:00:00	1997-08-26 00:00:00	1997-07-21 00:00:00.000	3	29.98	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
2013	10600	HUNGC	4	1997-07-16 00:00:00	1997-08-13 00:00:00	1997-07-21 00:00:00.000	1	45.13	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
2014	10601	HILAA	7	1997-07-16 00:00:00	1997-08-27 00:00:00	1997-07-22 00:00:00.000	1	58.3	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2015	10602	VAFFE	8	1997-07-17 00:00:00	1997-08-14 00:00:00	1997-07-22 00:00:00.000	2	2.92	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2016	10603	SAVEA	8	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-08-08 00:00:00.000	2	48.77	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2017	10604	FURIB	1	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-07-29 00:00:00.000	1	7.46	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
2018	10605	MEREP	1	1997-07-21 00:00:00	1997-08-18 00:00:00	1997-07-29 00:00:00.000	2	379.13	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
2019	10606	TRADH	4	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-31 00:00:00.000	3	79.4	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
2020	10607	SAVEA	5	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-25 00:00:00.000	1	200.24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2021	10608	TOMSP	4	1997-07-23 00:00:00	1997-08-20 00:00:00	1997-08-01 00:00:00.000	2	27.79	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
2022	10609	DUMON	7	1997-07-24 00:00:00	1997-08-21 00:00:00	1997-07-30 00:00:00.000	2	1.85	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
2023	10610	LAMAI	8	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-06 00:00:00.000	1	26.78	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2024	10611	WOLZA	6	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-01 00:00:00.000	2	80.65	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2025	10612	SAVEA	1	1997-07-28 00:00:00	1997-08-25 00:00:00	1997-08-01 00:00:00.000	2	544.08	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2026	10613	HILAA	4	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	2	8.11	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2027	10614	BLAUS	8	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00.000	3	1.93	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
2028	10615	WILMK	2	1997-07-30 00:00:00	1997-08-27 00:00:00	1997-08-06 00:00:00.000	3	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2029	10616	GREAL	1	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-05 00:00:00.000	2	116.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2030	10617	GREAL	4	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-04 00:00:00.000	2	18.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2031	10618	MEREP	1	1997-08-01 00:00:00	1997-09-12 00:00:00	1997-08-08 00:00:00.000	1	154.68	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
2032	10619	MEREP	3	1997-08-04 00:00:00	1997-09-01 00:00:00	1997-08-07 00:00:00.000	3	91.05	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
2033	10620	LAUGB	2	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-14 00:00:00.000	3	0.94	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
2034	10621	ISLAT	4	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-11 00:00:00.000	2	23.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2035	10622	RICAR	4	1997-08-06 00:00:00	1997-09-03 00:00:00	1997-08-11 00:00:00.000	3	50.97	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2036	10623	FRANK	8	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-12 00:00:00.000	2	97.18	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2037	10624	THECR	4	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-19 00:00:00.000	2	94.8	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
2038	10625	ANATR	3	1997-08-08 00:00:00	1997-09-05 00:00:00	1997-08-14 00:00:00.000	1	43.9	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
2039	10626	BERGS	1	1997-08-11 00:00:00	1997-09-08 00:00:00	1997-08-20 00:00:00.000	2	138.69	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2040	10627	SAVEA	8	1997-08-11 00:00:00	1997-09-22 00:00:00	1997-08-21 00:00:00.000	3	107.46	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2041	10628	BLONP	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	30.36	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
2042	10629	GODOS	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00.000	3	85.46	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2043	10630	KOENE	1	1997-08-13 00:00:00	1997-09-10 00:00:00	1997-08-19 00:00:00.000	2	32.35	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2044	10631	LAMAI	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-15 00:00:00.000	1	0.87	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2045	10632	WANDK	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-19 00:00:00.000	1	41.38	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
2046	10633	ERNSH	7	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-18 00:00:00.000	3	477.9	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2047	10634	FOLIG	4	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-21 00:00:00.000	3	487.38	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
2048	10635	MAGAA	8	1997-08-18 00:00:00	1997-09-15 00:00:00	1997-08-21 00:00:00.000	3	47.46	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2049	10636	WARTH	4	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	1.15	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
2050	10637	QUEEN	6	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00.000	1	201.29	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2051	10638	LINOD	3	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-09-01 00:00:00.000	1	158.44	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2052	10639	SANTG	7	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-08-27 00:00:00.000	3	38.64	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
2053	10640	WANDK	4	1997-08-21 00:00:00	1997-09-18 00:00:00	1997-08-28 00:00:00.000	1	23.55	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
2054	10641	HILAA	4	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-08-26 00:00:00.000	2	179.61	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2055	10642	SIMOB	7	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-09-05 00:00:00.000	3	41.89	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
2056	10643	ALFKI	6	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-02 00:00:00.000	1	29.46	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2057	10644	WELLI	3	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-01 00:00:00.000	2	0.14	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2058	10645	HANAR	4	1997-08-26 00:00:00	1997-09-23 00:00:00	1997-09-02 00:00:00.000	1	12.41	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2059	10646	HUNGO	9	1997-08-27 00:00:00	1997-10-08 00:00:00	1997-09-03 00:00:00.000	3	142.33	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2060	10647	QUEDE	4	1997-08-27 00:00:00	1997-09-10 00:00:00	1997-09-03 00:00:00.000	2	45.54	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
2061	10648	RICAR	5	1997-08-28 00:00:00	1997-10-09 00:00:00	1997-09-09 00:00:00.000	2	14.25	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2062	10649	MAISD	5	1997-08-28 00:00:00	1997-09-25 00:00:00	1997-08-29 00:00:00.000	3	6.2	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2063	10650	FAMIA	5	1997-08-29 00:00:00	1997-09-26 00:00:00	1997-09-03 00:00:00.000	3	176.81	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
2064	10651	WANDK	8	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-11 00:00:00.000	2	20.6	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
2065	10652	GOURL	4	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-08 00:00:00.000	2	7.14	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2066	10653	FRANK	1	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-19 00:00:00.000	1	93.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2067	10654	BERGS	5	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-11 00:00:00.000	1	55.26	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2068	10655	REGGC	1	1997-09-03 00:00:00	1997-10-01 00:00:00	1997-09-11 00:00:00.000	2	4.41	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2069	10656	GREAL	6	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-10 00:00:00.000	1	57.15	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2070	10657	SAVEA	2	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-15 00:00:00.000	2	352.69	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2071	10658	QUICK	4	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-08 00:00:00.000	1	364.15	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2072	10659	QUEEN	7	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-10 00:00:00.000	2	105.81	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2073	10660	HUNGC	8	1997-09-08 00:00:00	1997-10-06 00:00:00	1997-10-15 00:00:00.000	1	111.29	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
2074	10661	HUNGO	7	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-15 00:00:00.000	3	17.55	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2075	10662	LONEP	3	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-18 00:00:00.000	2	1.28	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
2076	10663	BONAP	2	1997-09-10 00:00:00	1997-09-24 00:00:00	1997-10-03 00:00:00.000	2	113.15	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2077	10664	FURIB	1	1997-09-10 00:00:00	1997-10-08 00:00:00	1997-09-19 00:00:00.000	3	1.27	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
2078	10665	LONEP	1	1997-09-11 00:00:00	1997-10-09 00:00:00	1997-09-17 00:00:00.000	2	26.31	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
2079	10666	RICSU	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-22 00:00:00.000	2	232.42	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2080	10667	ERNSH	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-19 00:00:00.000	1	78.09	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2081	10668	WANDK	1	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-23 00:00:00.000	2	47.22	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
2082	10669	SIMOB	2	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-22 00:00:00.000	1	24.39	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
2083	10670	FRANK	4	1997-09-16 00:00:00	1997-10-14 00:00:00	1997-09-18 00:00:00.000	1	203.48	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2084	10671	FRANR	1	1997-09-17 00:00:00	1997-10-15 00:00:00	1997-09-24 00:00:00.000	1	30.34	France restauration	54 rue Royale	Nantes	NULL	44000	France
2085	10672	BERGS	9	1997-09-17 00:00:00	1997-10-01 00:00:00	1997-09-26 00:00:00.000	2	95.75	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2086	10673	WILMK	2	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-19 00:00:00.000	1	22.76	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2087	10674	ISLAT	4	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-30 00:00:00.000	2	0.9	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2088	10675	FRANK	5	1997-09-19 00:00:00	1997-10-17 00:00:00	1997-09-23 00:00:00.000	2	31.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2089	10676	TORTU	2	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-29 00:00:00.000	2	2.01	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
2090	10677	ANTON	1	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-26 00:00:00.000	3	4.03	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
2091	10678	SAVEA	7	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-10-16 00:00:00.000	3	388.98	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2092	10679	BLONP	8	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-09-30 00:00:00.000	3	27.94	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
2093	10680	OLDWO	1	1997-09-24 00:00:00	1997-10-22 00:00:00	1997-09-26 00:00:00.000	1	26.61	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2094	10681	GREAL	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-09-30 00:00:00.000	3	76.13	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2095	10682	ANTON	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-10-01 00:00:00.000	2	36.13	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
2096	10683	DUMON	2	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-10-01 00:00:00.000	1	4.4	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
2097	10684	OTTIK	3	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-09-30 00:00:00.000	1	145.63	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
2098	10685	GOURL	4	1997-09-29 00:00:00	1997-10-13 00:00:00	1997-10-03 00:00:00.000	2	33.75	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2099	10686	PICCO	2	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-08 00:00:00.000	1	96.5	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
2100	10687	HUNGO	9	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-30 00:00:00.000	2	296.43	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2101	10688	VAFFE	4	1997-10-01 00:00:00	1997-10-15 00:00:00	1997-10-07 00:00:00.000	2	299.09	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2102	10689	BERGS	1	1997-10-01 00:00:00	1997-10-29 00:00:00	1997-10-07 00:00:00.000	2	13.42	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2103	10690	HANAR	1	1997-10-02 00:00:00	1997-10-30 00:00:00	1997-10-03 00:00:00.000	1	15.8	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2104	10691	QUICK	2	1997-10-03 00:00:00	1997-11-14 00:00:00	1997-10-22 00:00:00.000	2	810.05	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2105	10692	ALFKI	4	1997-10-03 00:00:00	1997-10-31 00:00:00	1997-10-13 00:00:00.000	2	61.02	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2106	10693	WHITC	3	1997-10-06 00:00:00	1997-10-20 00:00:00	1997-10-10 00:00:00.000	3	139.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2107	10694	QUICK	8	1997-10-06 00:00:00	1997-11-03 00:00:00	1997-10-09 00:00:00.000	3	398.36	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2108	10695	WILMK	7	1997-10-07 00:00:00	1997-11-18 00:00:00	1997-10-14 00:00:00.000	1	16.72	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2109	10696	WHITC	8	1997-10-08 00:00:00	1997-11-19 00:00:00	1997-10-14 00:00:00.000	3	102.55	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2110	10697	LINOD	3	1997-10-08 00:00:00	1997-11-05 00:00:00	1997-10-14 00:00:00.000	1	45.52	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2111	10698	ERNSH	4	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-17 00:00:00.000	1	272.47	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2112	10699	MORGK	3	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-13 00:00:00.000	3	0.58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
2113	10700	SAVEA	3	1997-10-10 00:00:00	1997-11-07 00:00:00	1997-10-16 00:00:00.000	1	65.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2114	10701	HUNGO	6	1997-10-13 00:00:00	1997-10-27 00:00:00	1997-10-15 00:00:00.000	3	220.31	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2115	10702	ALFKI	4	1997-10-13 00:00:00	1997-11-24 00:00:00	1997-10-21 00:00:00.000	1	23.94	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2116	10703	FOLKO	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-10-20 00:00:00.000	2	152.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2117	10704	QUEEN	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-11-07 00:00:00.000	1	4.78	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2118	10705	HILAA	9	1997-10-15 00:00:00	1997-11-12 00:00:00	1997-11-18 00:00:00.000	2	3.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2119	10706	OLDWO	8	1997-10-16 00:00:00	1997-11-13 00:00:00	1997-10-21 00:00:00.000	3	135.63	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2120	10707	AROUT	4	1997-10-16 00:00:00	1997-10-30 00:00:00	1997-10-23 00:00:00.000	3	21.74	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2121	10708	THEBI	6	1997-10-17 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	2	2.96	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
2122	10709	GOURL	1	1997-10-17 00:00:00	1997-11-14 00:00:00	1997-11-20 00:00:00.000	3	210.8	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2123	10710	FRANS	1	1997-10-20 00:00:00	1997-11-17 00:00:00	1997-10-23 00:00:00.000	1	4.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
2124	10711	SAVEA	5	1997-10-21 00:00:00	1997-12-02 00:00:00	1997-10-29 00:00:00.000	2	52.41	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2125	10712	HUNGO	3	1997-10-21 00:00:00	1997-11-18 00:00:00	1997-10-31 00:00:00.000	1	89.93	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2126	10713	SAVEA	1	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-24 00:00:00.000	1	167.05	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2127	10714	SAVEA	5	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-27 00:00:00.000	3	24.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2128	10715	BONAP	3	1997-10-23 00:00:00	1997-11-06 00:00:00	1997-10-29 00:00:00.000	1	63.2	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2129	10716	RANCH	4	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-27 00:00:00.000	2	22.57	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
2130	10717	FRANK	1	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-29 00:00:00.000	2	59.25	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2131	10718	KOENE	1	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-10-29 00:00:00.000	3	170.88	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2132	10719	LETSS	8	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-11-05 00:00:00.000	2	51.44	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
2133	10720	QUEDE	8	1997-10-28 00:00:00	1997-11-11 00:00:00	1997-11-05 00:00:00.000	2	9.53	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
2134	10721	QUICK	5	1997-10-29 00:00:00	1997-11-26 00:00:00	1997-10-31 00:00:00.000	3	48.92	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2135	10722	SAVEA	8	1997-10-29 00:00:00	1997-12-10 00:00:00	1997-11-04 00:00:00.000	1	74.58	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2136	10723	WHITC	3	1997-10-30 00:00:00	1997-11-27 00:00:00	1997-11-25 00:00:00.000	1	21.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2137	10724	MEREP	8	1997-10-30 00:00:00	1997-12-11 00:00:00	1997-11-05 00:00:00.000	2	57.75	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Canada
2138	10725	FAMIA	4	1997-10-31 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00.000	3	10.83	Familia Arquibaldo	Rua Orós 92	Sao Paulo	SP	05442-030	Brazil
2139	10726	EASTC	4	1997-11-03 00:00:00	1997-11-17 00:00:00	1997-12-05 00:00:00.000	1	16.56	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
2140	10727	REGGC	2	1997-11-03 00:00:00	1997-12-01 00:00:00	1997-12-05 00:00:00.000	1	89.9	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2141	10728	QUEEN	4	1997-11-04 00:00:00	1997-12-02 00:00:00	1997-11-11 00:00:00.000	2	58.33	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2142	10729	LINOD	8	1997-11-04 00:00:00	1997-12-16 00:00:00	1997-11-14 00:00:00.000	3	141.06	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2143	10730	BONAP	5	1997-11-05 00:00:00	1997-12-03 00:00:00	1997-11-14 00:00:00.000	1	20.12	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2144	10731	CHOPS	7	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-14 00:00:00.000	1	96.65	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
2145	10732	BONAP	3	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-07 00:00:00.000	1	16.97	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2146	10733	BERGS	1	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-10 00:00:00.000	3	110.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2147	10734	GOURL	2	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-12 00:00:00.000	3	1.63	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2148	10735	LETSS	6	1997-11-10 00:00:00	1997-12-08 00:00:00	1997-11-21 00:00:00.000	2	45.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
2149	10736	HUNGO	9	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-21 00:00:00.000	2	44.1	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2150	10737	VINET	2	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-18 00:00:00.000	2	7.79	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
2151	10738	SPECD	2	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-18 00:00:00.000	1	2.91	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
2152	10739	VINET	3	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-17 00:00:00.000	3	11.08	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	NULL	51100	France
2153	10740	WHITC	4	1997-11-13 00:00:00	1997-12-11 00:00:00	1997-11-25 00:00:00.000	2	81.88	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2154	10741	AROUT	4	1997-11-14 00:00:00	1997-11-28 00:00:00	1997-11-18 00:00:00.000	3	10.96	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2155	10742	BOTTM	3	1997-11-14 00:00:00	1997-12-12 00:00:00	1997-11-18 00:00:00.000	3	243.73	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2156	10743	AROUT	1	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-21 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2157	10744	VAFFE	6	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-24 00:00:00.000	1	69.19	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2158	10745	QUICK	9	1997-11-18 00:00:00	1997-12-16 00:00:00	1997-11-27 00:00:00.000	1	3.52	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2159	10746	CHOPS	1	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-21 00:00:00.000	3	31.43	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
2160	10747	PICCO	6	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-26 00:00:00.000	1	117.33	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
2161	10748	SAVEA	3	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-11-28 00:00:00.000	1	232.55	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2162	10749	ISLAT	4	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-12-19 00:00:00.000	2	61.53	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2163	10750	WARTH	9	1997-11-21 00:00:00	1997-12-19 00:00:00	1997-11-24 00:00:00.000	1	79.3	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
2164	10751	RICSU	3	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-12-03 00:00:00.000	3	130.79	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2165	10752	NORTS	2	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-11-28 00:00:00.000	3	1.39	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
2166	10753	FRANS	3	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	1	7.7	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
2167	10754	MAGAA	6	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00.000	3	2.38	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2168	10755	BONAP	4	1997-11-26 00:00:00	1997-12-24 00:00:00	1997-11-28 00:00:00.000	2	16.71	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2169	10756	SPLIR	8	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-02 00:00:00.000	2	73.21	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
2170	10757	SAVEA	6	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-15 00:00:00.000	1	8.19	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2171	10758	RICSU	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-04 00:00:00.000	3	138.17	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2172	10759	ANATR	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-12 00:00:00.000	3	11.99	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
2173	10760	MAISD	4	1997-12-01 00:00:00	1997-12-29 00:00:00	1997-12-10 00:00:00.000	1	155.64	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2174	10761	RATTC	5	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-08 00:00:00.000	2	18.66	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2175	10762	FOLKO	3	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-09 00:00:00.000	1	328.74	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2176	10763	FOLIG	3	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	37.35	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
2177	10764	ERNSH	6	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00.000	3	145.45	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2178	10765	QUICK	3	1997-12-04 00:00:00	1998-01-01 00:00:00	1997-12-09 00:00:00.000	3	42.74	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2179	10766	OTTIK	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-09 00:00:00.000	1	157.55	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
2180	10767	SUPRD	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-15 00:00:00.000	3	1.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2181	10768	AROUT	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-15 00:00:00.000	2	146.32	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2182	10769	VAFFE	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-12 00:00:00.000	1	65.06	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2183	10770	HANAR	8	1997-12-09 00:00:00	1998-01-06 00:00:00	1997-12-17 00:00:00.000	3	5.32	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2184	10771	ERNSH	9	1997-12-10 00:00:00	1998-01-07 00:00:00	1998-01-02 00:00:00.000	2	11.19	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2185	10772	LEHMS	3	1997-12-10 00:00:00	1998-01-07 00:00:00	1997-12-19 00:00:00.000	2	91.28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2186	10773	ERNSH	1	1997-12-11 00:00:00	1998-01-08 00:00:00	1997-12-16 00:00:00.000	3	96.43	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2187	10774	FOLKO	4	1997-12-11 00:00:00	1997-12-25 00:00:00	1997-12-12 00:00:00.000	1	48.2	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2188	10775	THECR	7	1997-12-12 00:00:00	1998-01-09 00:00:00	1997-12-26 00:00:00.000	1	20.25	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
2189	10776	ERNSH	1	1997-12-15 00:00:00	1998-01-12 00:00:00	1997-12-18 00:00:00.000	3	351.53	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2190	10777	GOURL	7	1997-12-15 00:00:00	1997-12-29 00:00:00	1998-01-21 00:00:00.000	2	3.01	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2191	10778	BERGS	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1997-12-24 00:00:00.000	1	6.79	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2192	10779	MORGK	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1998-01-14 00:00:00.000	2	58.13	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
2193	10780	LILAS	2	1997-12-16 00:00:00	1997-12-30 00:00:00	1997-12-25 00:00:00.000	1	42.13	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2194	10781	WARTH	2	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-19 00:00:00.000	3	73.16	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
2195	10782	CACTU	9	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-22 00:00:00.000	3	1.1	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
2196	10783	HANAR	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-19 00:00:00.000	2	124.98	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2197	10784	MAGAA	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-22 00:00:00.000	3	70.09	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2198	10785	GROSR	1	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-24 00:00:00.000	3	1.51	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
2199	10786	QUEEN	8	1997-12-19 00:00:00	1998-01-16 00:00:00	1997-12-23 00:00:00.000	1	110.87	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2200	10787	LAMAI	2	1997-12-19 00:00:00	1998-01-02 00:00:00	1997-12-26 00:00:00.000	1	249.93	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2201	10788	QUICK	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1998-01-19 00:00:00.000	2	42.7	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2202	10789	FOLIG	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-31 00:00:00.000	2	100.6	Folies gourmandes	184 chaussée de Tournai	Lille	NULL	59000	France
2203	10790	GOURL	6	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-26 00:00:00.000	1	28.23	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2204	10791	FRANK	6	1997-12-23 00:00:00	1998-01-20 00:00:00	1998-01-01 00:00:00.000	2	16.85	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2205	10792	WOLZA	1	1997-12-23 00:00:00	1998-01-20 00:00:00	1997-12-31 00:00:00.000	3	23.79	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2206	10793	AROUT	3	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-08 00:00:00.000	3	4.52	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2207	10794	QUEDE	6	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-02 00:00:00.000	1	21.49	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
2208	10795	ERNSH	8	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-20 00:00:00.000	2	126.66	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2209	10796	HILAA	3	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-14 00:00:00.000	1	26.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2210	10797	DRACD	7	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-05 00:00:00.000	2	33.35	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
2211	10798	ISLAT	2	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	1	2.33	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2212	10799	KOENE	9	1997-12-26 00:00:00	1998-02-06 00:00:00	1998-01-05 00:00:00.000	3	30.76	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2213	10800	SEVES	1	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00.000	3	137.44	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
2214	10801	BOLID	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1997-12-31 00:00:00.000	2	97.09	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
2215	10802	SIMOB	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1998-01-02 00:00:00.000	2	257.26	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
2216	10803	WELLI	4	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-06 00:00:00.000	1	55.23	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2217	10804	SEVES	6	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-07 00:00:00.000	2	27.33	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
2218	10805	THEBI	2	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-09 00:00:00.000	3	237.34	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
2219	10806	VICTE	3	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-05 00:00:00.000	2	22.11	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
2220	10807	FRANS	4	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-30 00:00:00.000	1	1.36	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
2221	10808	OLDWO	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-09 00:00:00.000	3	45.53	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2222	10809	WELLI	7	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	1	4.87	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2223	10810	LAUGB	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00.000	3	4.33	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
2224	10811	LINOD	8	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-08 00:00:00.000	1	31.22	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2225	10812	REGGC	5	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-12 00:00:00.000	1	59.78	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2226	10813	RICAR	1	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-09 00:00:00.000	1	47.38	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2227	10814	VICTE	3	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	130.94	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
2228	10815	SAVEA	2	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00.000	3	14.62	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2229	10816	GREAL	4	1998-01-06 00:00:00	1998-02-03 00:00:00	1998-02-04 00:00:00.000	2	719.78	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2230	10817	KOENE	3	1998-01-06 00:00:00	1998-01-20 00:00:00	1998-01-13 00:00:00.000	2	306.07	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2231	10818	MAGAA	7	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-12 00:00:00.000	3	65.48	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2232	10819	CACTU	2	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-16 00:00:00.000	3	19.76	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
2233	10820	RATTC	3	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-13 00:00:00.000	2	37.52	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2234	10821	SPLIR	1	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-15 00:00:00.000	1	36.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
2235	10822	TRAIH	6	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-16 00:00:00.000	3	7	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
2236	10823	LILAS	5	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-13 00:00:00.000	2	163.97	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2237	10824	FOLKO	8	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-30 00:00:00.000	1	1.23	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2238	10825	DRACD	1	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-14 00:00:00.000	1	79.25	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
2239	10826	BLONP	6	1998-01-12 00:00:00	1998-02-09 00:00:00	1998-02-06 00:00:00.000	1	7.09	Blondel père et fils	24 place Kléber	Strasbourg	NULL	67000	France
2240	10827	BONAP	1	1998-01-12 00:00:00	1998-01-26 00:00:00	1998-02-06 00:00:00.000	2	63.54	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2241	10828	RANCH	9	1998-01-13 00:00:00	1998-01-27 00:00:00	1998-02-04 00:00:00.000	1	90.85	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
2242	10829	ISLAT	9	1998-01-13 00:00:00	1998-02-10 00:00:00	1998-01-23 00:00:00.000	1	154.72	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2243	10830	TRADH	4	1998-01-13 00:00:00	1998-02-24 00:00:00	1998-01-21 00:00:00.000	2	81.83	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
2244	10831	SANTG	3	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-23 00:00:00.000	2	72.19	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
2245	10832	LAMAI	2	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-19 00:00:00.000	2	43.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2246	10833	OTTIK	6	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-23 00:00:00.000	2	71.49	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
2247	10834	TRADH	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-19 00:00:00.000	3	29.78	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
2248	10835	ALFKI	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-21 00:00:00.000	3	69.53	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2249	10836	ERNSH	7	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-21 00:00:00.000	1	411.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2250	10837	BERGS	9	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-23 00:00:00.000	3	13.32	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2251	10838	LINOD	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-23 00:00:00.000	3	59.28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2252	10839	TRADH	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-22 00:00:00.000	3	35.43	Tradiçao Hipermercados	Av. Inês de Castro 414	Sao Paulo	SP	05634-030	Brazil
2253	10840	LINOD	4	1998-01-19 00:00:00	1998-03-02 00:00:00	1998-02-16 00:00:00.000	2	2.71	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2254	10841	SUPRD	5	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	2	424.3	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2255	10842	TORTU	1	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00.000	3	54.42	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
2256	10843	VICTE	4	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	9.26	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
2257	10844	PICCO	8	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00.000	2	25.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
2258	10845	QUICK	8	1998-01-21 00:00:00	1998-02-04 00:00:00	1998-01-30 00:00:00.000	1	212.98	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2259	10846	SUPRD	2	1998-01-22 00:00:00	1998-03-05 00:00:00	1998-01-23 00:00:00.000	3	56.46	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2260	10847	SAVEA	4	1998-01-22 00:00:00	1998-02-05 00:00:00	1998-02-10 00:00:00.000	3	487.57	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2261	10848	CONSH	7	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-29 00:00:00.000	2	38.24	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
2262	10849	KOENE	9	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-30 00:00:00.000	2	0.56	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2263	10850	VICTE	1	1998-01-23 00:00:00	1998-03-06 00:00:00	1998-01-30 00:00:00.000	1	49.19	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
2264	10851	RICAR	5	1998-01-26 00:00:00	1998-02-23 00:00:00	1998-02-02 00:00:00.000	1	160.55	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2265	10852	RATTC	8	1998-01-26 00:00:00	1998-02-09 00:00:00	1998-01-30 00:00:00.000	1	174.05	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2266	10853	BLAUS	9	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-03 00:00:00.000	2	53.83	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
2267	10854	ERNSH	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-05 00:00:00.000	2	100.22	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2268	10855	OLDWO	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-04 00:00:00.000	1	170.97	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2269	10856	ANTON	3	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-10 00:00:00.000	2	58.43	Antonio Moreno Taquería	Mataderos  2312	México D.F.	NULL	05023	Mexico
2270	10857	BERGS	8	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-06 00:00:00.000	2	188.85	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2271	10858	LACOR	2	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-03 00:00:00.000	1	52.51	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
2272	10859	FRANK	1	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-02 00:00:00.000	2	76.1	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2273	10860	FRANR	3	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-04 00:00:00.000	3	19.26	France restauration	54 rue Royale	Nantes	NULL	44000	France
2274	10861	WHITC	4	1998-01-30 00:00:00	1998-02-27 00:00:00	1998-02-17 00:00:00.000	2	14.93	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2275	10862	LEHMS	8	1998-01-30 00:00:00	1998-03-13 00:00:00	1998-02-02 00:00:00.000	2	53.23	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2276	10863	HILAA	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-17 00:00:00.000	2	30.26	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2277	10864	AROUT	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-09 00:00:00.000	2	3.04	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2278	10865	QUICK	2	1998-02-02 00:00:00	1998-02-16 00:00:00	1998-02-12 00:00:00.000	1	348.14	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2279	10866	BERGS	5	1998-02-03 00:00:00	1998-03-03 00:00:00	1998-02-12 00:00:00.000	1	109.11	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2280	10867	LONEP	6	1998-02-03 00:00:00	1998-03-17 00:00:00	1998-02-11 00:00:00.000	1	1.93	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
2281	10868	QUEEN	7	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-23 00:00:00.000	2	191.27	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2282	10869	SEVES	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-09 00:00:00.000	1	143.28	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
2283	10870	WOLZA	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-13 00:00:00.000	3	12.04	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2284	10871	BONAP	9	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-10 00:00:00.000	2	112.27	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2285	10872	GODOS	5	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-09 00:00:00.000	2	175.32	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2286	10873	WILMK	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-09 00:00:00.000	1	0.82	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2287	10874	GODOS	5	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-11 00:00:00.000	2	19.58	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2288	10875	BERGS	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-03-03 00:00:00.000	2	32.37	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2289	10876	BONAP	7	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-12 00:00:00.000	3	60.42	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2290	10877	RICAR	1	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-19 00:00:00.000	1	38.06	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2291	10878	QUICK	4	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	1	46.69	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2292	10879	WILMK	3	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00.000	3	8.5	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2293	10880	FOLKO	7	1998-02-10 00:00:00	1998-03-24 00:00:00	1998-02-18 00:00:00.000	1	88.01	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2294	10881	CACTU	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-18 00:00:00.000	1	2.84	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
2295	10882	SAVEA	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-20 00:00:00.000	3	23.1	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2296	10883	LONEP	8	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-20 00:00:00.000	3	0.53	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
2297	10884	LETSS	4	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-13 00:00:00.000	2	90.97	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
2298	10885	SUPRD	6	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-18 00:00:00.000	3	5.64	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2299	10886	HANAR	1	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-03-02 00:00:00.000	1	4.99	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2300	10887	GALED	8	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-02-16 00:00:00.000	3	1.25	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
2301	10888	GODOS	1	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	2	51.87	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2302	10889	RATTC	9	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00.000	3	280.61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2303	10890	DUMON	7	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-18 00:00:00.000	1	32.76	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
2304	10891	LEHMS	7	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	20.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2305	10892	MAISD	4	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00.000	2	120.27	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2306	10893	KOENE	9	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	2	77.78	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2307	10894	SAVEA	1	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00.000	1	116.13	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2308	10895	ERNSH	3	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-23 00:00:00.000	1	162.75	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2309	10896	MAISD	7	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-27 00:00:00.000	3	32.45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2310	10897	HUNGO	3	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-25 00:00:00.000	2	603.54	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2311	10898	OCEAN	4	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-06 00:00:00.000	2	1.27	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
2312	10899	LILAS	5	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-02-26 00:00:00.000	3	1.21	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2313	10900	WELLI	1	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-04 00:00:00.000	2	1.66	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2314	10901	HILAA	4	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-02-26 00:00:00.000	1	62.09	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2315	10902	FOLKO	1	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-03-03 00:00:00.000	1	44.15	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2316	10903	HANAR	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-04 00:00:00.000	3	36.71	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2317	10904	WHITC	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-02-27 00:00:00.000	3	162.95	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2318	10905	WELLI	9	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-06 00:00:00.000	2	13.72	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2319	10906	WOLZA	4	1998-02-25 00:00:00	1998-03-11 00:00:00	1998-03-03 00:00:00.000	3	26.29	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2320	10907	SPECD	6	1998-02-25 00:00:00	1998-03-25 00:00:00	1998-02-27 00:00:00.000	3	9.19	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
2321	10908	REGGC	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-06 00:00:00.000	2	32.96	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2322	10909	SANTG	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-10 00:00:00.000	2	53.05	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
2323	10910	WILMK	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	3	38.11	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2324	10911	GODOS	3	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-05 00:00:00.000	1	38.19	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2325	10912	HUNGO	2	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-18 00:00:00.000	2	580.91	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2326	10913	QUEEN	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00.000	1	33.05	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2327	10914	QUEEN	6	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	1	21.19	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2328	10915	TORTU	2	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00.000	2	3.51	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
2329	10916	RANCH	1	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-09 00:00:00.000	2	63.77	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
2330	10917	ROMEY	4	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	2	8.29	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
2331	10918	BOTTM	3	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00.000	3	48.83	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2332	10919	LINOD	2	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-04 00:00:00.000	2	19.8	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2333	10920	AROUT	4	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-09 00:00:00.000	2	29.61	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2334	10921	VAFFE	1	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-09 00:00:00.000	1	176.48	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2335	10922	HANAR	5	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-05 00:00:00.000	3	62.74	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2336	10923	LAMAI	7	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-13 00:00:00.000	3	68.26	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2337	10924	BERGS	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-04-08 00:00:00.000	2	151.52	Berglunds snabbköp	Berguvsvägen  8	Luleå	NULL	S-958 22	Sweden
2338	10925	HANAR	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-13 00:00:00.000	1	2.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2339	10926	ANATR	4	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-11 00:00:00.000	3	39.92	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	NULL	05021	Mexico
2340	10927	LACOR	4	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	19.79	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
2341	10928	GALED	1	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-18 00:00:00.000	1	1.36	Galería del gastronómo	Rambla de Cataluña 23	Barcelona	NULL	8022	Spain
2342	10929	FRANK	6	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-12 00:00:00.000	1	33.93	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2343	10930	SUPRD	4	1998-03-06 00:00:00	1998-04-17 00:00:00	1998-03-18 00:00:00.000	3	15.55	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2344	10931	RICSU	4	1998-03-06 00:00:00	1998-03-20 00:00:00	1998-03-19 00:00:00.000	2	13.6	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2345	10932	BONAP	8	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-24 00:00:00.000	1	134.64	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2346	10933	ISLAT	6	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-16 00:00:00.000	3	54.15	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
2347	10934	LEHMS	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-12 00:00:00.000	3	32.01	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2348	10935	WELLI	4	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	3	47.59	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
2349	10936	GREAL	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00.000	2	33.68	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2350	10937	CACTU	7	1998-03-10 00:00:00	1998-03-24 00:00:00	1998-03-13 00:00:00.000	3	31.51	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
2351	10938	QUICK	3	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-16 00:00:00.000	2	31.89	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2352	10939	MAGAA	2	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-13 00:00:00.000	2	76.33	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2353	10940	BONAP	8	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-23 00:00:00.000	3	19.77	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2354	10941	SAVEA	7	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-20 00:00:00.000	2	400.81	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2355	10942	REGGC	9	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-18 00:00:00.000	3	17.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2356	10943	BSBEV	4	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-19 00:00:00.000	2	2.17	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
2357	10944	BOTTM	6	1998-03-12 00:00:00	1998-03-26 00:00:00	1998-03-13 00:00:00.000	3	52.92	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2358	10945	MORGK	4	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-18 00:00:00.000	1	10.22	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	04179	Germany
2359	10946	VAFFE	1	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-19 00:00:00.000	2	27.2	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2360	10947	BSBEV	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-16 00:00:00.000	2	3.26	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
2361	10948	GODOS	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-19 00:00:00.000	3	23.39	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2362	10949	BOTTM	2	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-17 00:00:00.000	3	74.44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2363	10950	MAGAA	1	1998-03-16 00:00:00	1998-04-13 00:00:00	1998-03-23 00:00:00.000	2	2.5	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
2364	10951	RICSU	9	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-04-07 00:00:00.000	2	30.85	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2365	10952	ALFKI	1	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-03-24 00:00:00.000	1	40.42	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2366	10953	AROUT	9	1998-03-16 00:00:00	1998-03-30 00:00:00	1998-03-25 00:00:00.000	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2367	10954	LINOD	5	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	1	27.91	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2368	10955	FOLKO	8	1998-03-17 00:00:00	1998-04-14 00:00:00	1998-03-20 00:00:00.000	2	3.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2369	10956	BLAUS	6	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00.000	2	44.65	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
2370	10957	HILAA	8	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	3	105.36	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2371	10958	OCEAN	7	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00.000	2	49.56	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
2372	10959	GOURL	6	1998-03-18 00:00:00	1998-04-29 00:00:00	1998-03-23 00:00:00.000	2	4.98	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2373	10960	HILAA	3	1998-03-19 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00.000	1	2.08	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2374	10961	QUEEN	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-30 00:00:00.000	1	104.47	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2375	10962	QUICK	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-23 00:00:00.000	2	275.79	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2376	10963	FURIB	9	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-26 00:00:00.000	3	2.7	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
2377	10964	SPECD	3	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-24 00:00:00.000	2	87.38	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
2378	10965	OLDWO	6	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-30 00:00:00.000	3	144.38	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2379	10966	CHOPS	4	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-04-08 00:00:00.000	1	27.19	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
2380	10967	TOMSP	2	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-02 00:00:00.000	2	62.22	Toms Spezialitäten	Luisenstr. 48	Münster	NULL	44087	Germany
2381	10968	ERNSH	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-01 00:00:00.000	3	74.6	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2382	10969	COMMI	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-03-30 00:00:00.000	2	0.21	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
2383	10970	BOLID	9	1998-03-24 00:00:00	1998-04-07 00:00:00	1998-04-24 00:00:00.000	1	16.16	Bólido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
2384	10971	FRANR	2	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-04-02 00:00:00.000	2	121.82	France restauration	54 rue Royale	Nantes	NULL	44000	France
2385	10972	LACOR	4	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-26 00:00:00.000	2	0.02	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
2386	10973	LACOR	6	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-27 00:00:00.000	2	15.17	La corne d'abondance	67 avenue de l'Europe	Versailles	NULL	78000	France
2387	10974	SPLIR	3	1998-03-25 00:00:00	1998-04-08 00:00:00	1998-04-03 00:00:00.000	3	12.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
2388	10975	BOTTM	1	1998-03-25 00:00:00	1998-04-22 00:00:00	1998-03-27 00:00:00.000	3	32.27	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2389	10976	HILAA	1	1998-03-25 00:00:00	1998-05-06 00:00:00	1998-04-03 00:00:00.000	1	37.97	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2390	10977	FOLKO	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-10 00:00:00.000	3	208.5	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2391	10978	MAISD	9	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-23 00:00:00.000	2	32.82	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2392	10979	ERNSH	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-03-31 00:00:00.000	2	353.07	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2393	10980	FOLKO	4	1998-03-27 00:00:00	1998-05-08 00:00:00	1998-04-17 00:00:00.000	1	1.26	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2394	10981	HANAR	1	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-02 00:00:00.000	2	193.37	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2395	10982	BOTTM	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-08 00:00:00.000	1	14.01	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2396	10983	SAVEA	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-06 00:00:00.000	2	657.54	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2397	10984	SAVEA	1	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-03 00:00:00.000	3	211.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2398	10985	HUNGO	2	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-02 00:00:00.000	1	91.51	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2399	10986	OCEAN	8	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-21 00:00:00.000	2	217.86	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
2400	10987	EASTC	8	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-06 00:00:00.000	1	185.48	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
2401	10988	RATTC	3	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-10 00:00:00.000	2	61.14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2402	10989	QUEDE	2	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-02 00:00:00.000	1	34.76	Que Delícia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
2403	10990	ERNSH	2	1998-04-01 00:00:00	1998-05-13 00:00:00	1998-04-07 00:00:00.000	3	117.61	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2404	10991	QUICK	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-07 00:00:00.000	1	38.51	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2405	10992	THEBI	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-03 00:00:00.000	3	4.27	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
2406	10993	FOLKO	7	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-10 00:00:00.000	3	8.81	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2407	10994	VAFFE	2	1998-04-02 00:00:00	1998-04-16 00:00:00	1998-04-09 00:00:00.000	3	65.53	Vaffeljernet	Smagsloget 45	Århus	NULL	8200	Denmark
2408	10995	PERIC	1	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-06 00:00:00.000	3	46	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
2409	10996	QUICK	4	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-10 00:00:00.000	2	1.12	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2410	10997	LILAS	8	1998-04-03 00:00:00	1998-05-15 00:00:00	1998-04-13 00:00:00.000	2	73.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2411	10998	WOLZA	8	1998-04-03 00:00:00	1998-04-17 00:00:00	1998-04-17 00:00:00.000	2	20.31	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2412	10999	OTTIK	6	1998-04-03 00:00:00	1998-05-01 00:00:00	1998-04-10 00:00:00.000	2	96.35	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
2413	11000	RATTC	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	3	55.12	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
2414	11001	FOLKO	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00.000	2	197.3	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2415	11002	SAVEA	4	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-16 00:00:00.000	1	141.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2416	11003	THECR	3	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-08 00:00:00.000	3	14.91	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
2417	11004	MAISD	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-20 00:00:00.000	1	44.84	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
2418	11005	WILMK	2	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-10 00:00:00.000	1	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
2419	11006	GREAL	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-15 00:00:00.000	2	25.19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2420	11007	PRINI	8	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-13 00:00:00.000	2	202.24	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	NULL	1756	Portugal
2421	11008	ERNSH	7	1998-04-08 00:00:00	1998-05-06 00:00:00	NULL	3	79.46	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2422	11009	GODOS	2	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-10 00:00:00.000	1	59.11	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2423	11010	REGGC	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-21 00:00:00.000	2	28.71	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2424	11011	ALFKI	3	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-13 00:00:00.000	1	1.21	Alfred's Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
2425	11012	FRANK	1	1998-04-09 00:00:00	1998-04-23 00:00:00	1998-04-17 00:00:00.000	3	242.95	Frankenversand	Berliner Platz 43	München	NULL	80805	Germany
2426	11013	ROMEY	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-10 00:00:00.000	1	32.99	Romero y tomillo	Gran Vía 1	Madrid	NULL	28001	Spain
2427	11014	LINOD	2	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-15 00:00:00.000	3	23.6	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2428	11015	SANTG	2	1998-04-10 00:00:00	1998-04-24 00:00:00	1998-04-20 00:00:00.000	2	4.62	Santé Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
2429	11016	AROUT	9	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-13 00:00:00.000	2	33.8	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
2430	11017	ERNSH	9	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-20 00:00:00.000	2	754.26	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2431	11018	LONEP	4	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-16 00:00:00.000	2	11.65	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
2432	11019	RANCH	6	1998-04-13 00:00:00	1998-05-11 00:00:00	NULL	3	3.17	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
2433	11020	OTTIK	2	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-16 00:00:00.000	2	43.3	Ottilies Käseladen	Mehrheimerstr. 369	Köln	NULL	50739	Germany
2434	11021	QUICK	3	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-21 00:00:00.000	1	297.18	QUICK-Stop	Taucherstraße 10	Cunewalde	NULL	01307	Germany
2435	11022	HANAR	9	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-05-04 00:00:00.000	2	6.27	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2436	11023	BSBEV	1	1998-04-14 00:00:00	1998-04-28 00:00:00	1998-04-24 00:00:00.000	2	123.83	B's Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
2437	11024	EASTC	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-20 00:00:00.000	1	74.36	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
2438	11025	WARTH	6	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-24 00:00:00.000	3	29.17	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
2439	11026	FRANS	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-28 00:00:00.000	1	47.09	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
2440	11027	BOTTM	1	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-20 00:00:00.000	1	52.52	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2441	11028	KOENE	2	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-22 00:00:00.000	1	29.59	Königlich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
2442	11029	CHOPS	4	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-27 00:00:00.000	1	47.84	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
2443	11030	SAVEA	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-27 00:00:00.000	2	830.75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2444	11031	SAVEA	6	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-24 00:00:00.000	2	227.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2445	11032	WHITC	2	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	606.19	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2446	11033	RICSU	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00.000	3	84.74	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2447	11034	OLDWO	8	1998-04-20 00:00:00	1998-06-01 00:00:00	1998-04-27 00:00:00.000	1	40.32	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
2448	11035	SUPRD	2	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-24 00:00:00.000	2	0.17	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2449	11036	DRACD	8	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-22 00:00:00.000	3	149.47	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
2450	11037	GODOS	7	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-27 00:00:00.000	1	3.2	Godos Cocina Típica	C/ Romero 33	Sevilla	NULL	41101	Spain
2451	11038	SUPRD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-30 00:00:00.000	2	29.59	Suprêmes délices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
2452	11039	LINOD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	NULL	2	65	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
2453	11040	GREAL	4	1998-04-22 00:00:00	1998-05-20 00:00:00	NULL	3	18.84	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2454	11041	CHOPS	3	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-28 00:00:00.000	2	48.22	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
2455	11042	COMMI	2	1998-04-22 00:00:00	1998-05-06 00:00:00	1998-05-01 00:00:00.000	1	29.99	Comércio Mineiro	Av. dos Lusíadas 23	Sao Paulo	SP	05432-043	Brazil
2456	11043	SPECD	5	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-29 00:00:00.000	2	8.8	Spécialités du monde	25 rue Lauriston	Paris	NULL	75016	France
2457	11044	WOLZA	4	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-05-01 00:00:00.000	1	8.72	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
2458	11045	BOTTM	6	1998-04-23 00:00:00	1998-05-21 00:00:00	NULL	2	70.58	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2459	11046	WANDK	8	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-04-24 00:00:00.000	2	71.64	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
2460	11047	EASTC	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-01 00:00:00.000	3	46.62	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
2461	11048	BOTTM	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-04-30 00:00:00.000	3	24.12	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
2462	11049	GOURL	3	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-04 00:00:00.000	1	8.34	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
2463	11050	FOLKO	8	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-05 00:00:00.000	2	59.41	Folk och fä HB	Åkergatan 24	Bräcke	NULL	S-844 67	Sweden
2464	11051	LAMAI	7	1998-04-27 00:00:00	1998-05-25 00:00:00	NULL	3	2.79	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
2465	11052	HANAR	3	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-01 00:00:00.000	1	67.26	Hanari Carnes	Rua do Paço 67	Rio de Janeiro	RJ	05454-876	Brazil
2466	11053	PICCO	2	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-04-29 00:00:00.000	2	53.05	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
2467	11054	CACTU	8	1998-04-28 00:00:00	1998-05-26 00:00:00	NULL	1	0.33	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
2468	11055	HILAA	7	1998-04-28 00:00:00	1998-05-26 00:00:00	1998-05-05 00:00:00.000	2	120.92	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
2469	11056	EASTC	8	1998-04-28 00:00:00	1998-05-12 00:00:00	1998-05-01 00:00:00.000	2	278.96	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
2470	11057	NORTS	3	1998-04-29 00:00:00	1998-05-27 00:00:00	1998-05-01 00:00:00.000	3	4.13	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
2471	11058	BLAUS	9	1998-04-29 00:00:00	1998-05-27 00:00:00	NULL	3	31.14	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
2472	11059	RICAR	2	1998-04-29 00:00:00	1998-06-10 00:00:00	NULL	2	85.8	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
2473	11060	FRANS	2	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-04 00:00:00.000	2	10.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
2474	11061	GREAL	4	1998-04-30 00:00:00	1998-06-11 00:00:00	NULL	3	14.01	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
2475	11062	REGGC	4	1998-04-30 00:00:00	1998-05-28 00:00:00	NULL	2	29.93	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
2476	11063	HUNGO	3	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-06 00:00:00.000	2	81.73	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
2477	11064	SAVEA	1	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	1	30.09	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
2478	11065	LILAS	8	1998-05-01 00:00:00	1998-05-29 00:00:00	NULL	1	12.91	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2479	11066	WHITC	7	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00.000	2	44.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
2480	11067	DRACD	1	1998-05-04 00:00:00	1998-05-18 00:00:00	1998-05-06 00:00:00.000	2	7.98	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
2481	11068	QUEEN	8	1998-05-04 00:00:00	1998-06-01 00:00:00	NULL	2	81.75	Queen Cozinha	Alameda dos Canàrios 891	Sao Paulo	SP	05487-020	Brazil
2482	11069	TORTU	1	1998-05-04 00:00:00	1998-06-01 00:00:00	1998-05-06 00:00:00.000	2	15.67	Tortuga Restaurante	Avda. Azteca 123	México D.F.	NULL	05033	Mexico
2483	11070	LEHMS	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	136	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
2484	11071	LILAS	1	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	1	0.93	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
2485	11072	ERNSH	4	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	258.64	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
2486	11073	PERIC	2	1998-05-05 00:00:00	1998-06-02 00:00:00	NULL	2	24.95	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	NULL	05033	Mexico
2487	11074	SIMOB	7	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	18.44	Simons bistro	Vinbæltet 34	Kobenhavn	NULL	1734	Denmark
2488	11075	RICSU	8	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	6.19	Richter Supermarkt	Starenweg 5	Genève	NULL	1204	Switzerland
2489	11076	BONAP	4	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	38.28	Bon app'	12 rue des Bouchers	Marseille	NULL	13008	France
2490	11077	RATTC	1	1998-05-06 00:00:00	1998-06-03 00:00:00	NULL	2	8.53	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued) FROM stdin;
1	1	Chai	1	1	10 boxes x 20 bags	18	39	0	10	0
2	2	Chang	1	1	24 - 12 oz bottles	19	17	40	25	0
3	3	Aniseed Syrup	1	2	12 - 550 ml bottles	10	13	70	25	0
4	4	Chef Anton's Cajun Seasoning	2	2	48 - 6 oz jars	22	53	0	0	0
5	5	Chef Anton's Gumbo Mix	2	2	36 boxes	21.35	0	0	0	1
6	6	Grandma's Boysenberry Spread	3	2	12 - 8 oz jars	25	120	0	25	0
7	7	Uncle Bob's Organic Dried Pears	3	7	12 - 1 lb pkgs.	30	15	0	10	0
8	8	Northwoods Cranberry Sauce	3	2	12 - 12 oz jars	40	6	0	0	0
9	9	Mishi Kobe Niku	4	6	18 - 500 g pkgs.	97	29	0	0	1
10	10	Ikura	4	8	12 - 200 ml jars	31	31	0	0	0
11	11	Queso Cabrales	5	4	1 kg pkg.	21	22	30	30	0
12	12	Queso Manchego La Pastora	5	4	10 - 500 g pkgs.	38	86	0	0	0
13	13	Konbu	6	8	2 kg box	6	24	0	5	0
14	14	Tofu	6	7	40 - 100 g pkgs.	23.25	35	0	0	0
15	15	Genen Shouyu	6	2	24 - 250 ml bottles	15.5	39	0	5	0
16	16	Pavlova	7	3	32 - 500 g boxes	17.45	29	0	10	0
17	17	Alice Mutton	7	6	20 - 1 kg tins	39	0	0	0	1
18	18	Carnarvon Tigers	7	8	16 kg pkg.	62.5	42	0	0	0
19	19	Teatime Chocolate Biscuits	8	3	10 boxes x 12 pieces	9.2	25	0	5	0
20	20	Sir Rodney's Marmalade	8	3	30 gift boxes	81	40	0	0	0
21	21	Sir Rodney's Scones	8	3	24 pkgs. x 4 pieces	10	3	40	5	0
22	22	Gustaf's Knäckebröd	9	5	24 - 500 g pkgs.	21	104	0	25	0
23	23	Tunnbröd	9	5	12 - 250 g pkgs.	9	61	0	25	0
24	24	Guaraná Fantástica	10	1	12 - 355 ml cans	4.5	20	0	0	1
25	25	NuNuCa Nuß-Nougat-Creme	11	3	20 - 450 g glasses	14	76	0	30	0
26	26	Gumbär Gummibärchen	11	3	100 - 250 g bags	31.23	15	0	0	0
27	27	Schoggi Schokolade	11	3	100 - 100 g pieces	43.9	49	0	30	0
28	28	Rössle Sauerkraut	12	7	25 - 825 g cans	45.6	26	0	0	1
29	29	Thüringer Rostbratwurst	12	6	50 bags x 30 sausgs.	123.79	0	0	0	1
30	30	Nord-Ost Matjeshering	13	8	10 - 200 g glasses	25.89	10	0	15	0
31	31	Gorgonzola Telino	14	4	12 - 100 g pkgs	12.5	0	70	20	0
32	32	Mascarpone Fabioli	14	4	24 - 200 g pkgs.	32	9	40	25	0
33	33	Geitost	15	4	500 g	2.5	112	0	20	0
34	34	Sasquatch Ale	16	1	24 - 12 oz bottles	14	111	0	15	0
35	35	Steeleye Stout	16	1	24 - 12 oz bottles	18	20	0	15	0
36	36	Inlagd Sill	17	8	24 - 250 g  jars	19	112	0	20	0
37	37	Gravad lax	17	8	12 - 500 g pkgs.	26	11	50	25	0
38	38	Côte de Blaye	18	1	12 - 75 cl bottles	263.5	17	0	15	0
39	39	Chartreuse verte	18	1	750 cc per bottle	18	69	0	5	0
40	40	Boston Crab Meat	19	8	24 - 4 oz tins	18.4	123	0	30	0
41	41	Jack's New England Clam Chowder	19	8	12 - 12 oz cans	9.65	85	0	10	0
42	42	Singaporean Hokkien Fried Mee	20	5	32 - 1 kg pkgs.	14	26	0	0	1
43	43	Ipoh Coffee	20	1	16 - 500 g tins	46	17	10	25	0
44	44	Gula Malacca	20	2	20 - 2 kg bags	19.45	27	0	15	0
45	45	Rogede sild	21	8	1k pkg.	9.5	5	70	15	0
46	46	Spegesild	21	8	4 - 450 g glasses	12	95	0	0	0
47	47	Zaanse koeken	22	3	10 - 4 oz boxes	9.5	36	0	0	0
48	48	Chocolade	22	3	10 pkgs.	12.75	15	70	25	0
49	49	Maxilaku	23	3	24 - 50 g pkgs.	20	10	60	15	0
50	50	Valkoinen suklaa	23	3	12 - 100 g bars	16.25	65	0	30	0
51	51	Manjimup Dried Apples	24	7	50 - 300 g pkgs.	53	20	0	10	0
52	52	Filo Mix	24	5	16 - 2 kg boxes	7	38	0	25	0
53	53	Perth Pasties	24	6	48 pieces	32.8	0	0	0	1
54	54	Tourtière	25	6	16 pies	7.45	21	0	10	0
55	55	Pâté chinois	25	6	24 boxes x 2 pies	24	115	0	20	0
56	56	Gnocchi di nonna Alice	26	5	24 - 250 g pkgs.	38	21	10	30	0
57	57	Ravioli Angelo	26	5	24 - 250 g pkgs.	19.5	36	0	20	0
58	58	Escargots de Bourgogne	27	8	24 pieces	13.25	62	0	20	0
59	59	Raclette Courdavault	28	4	5 kg pkg.	55	79	0	0	0
60	60	Camembert Pierrot	28	4	15 - 300 g rounds	34	19	0	0	0
61	61	Sirop d'érable	29	2	24 - 500 ml bottles	28.5	113	0	25	0
62	62	Tarte au sucre	29	3	48 pies	49.3	17	0	0	0
63	63	Vegie-spread	7	2	15 - 625 g jars	43.9	24	0	5	0
64	64	Wimmers gute Semmelknödel	12	5	20 bags x 4 pieces	33.25	22	80	30	0
65	65	Louisiana Fiery Hot Pepper Sauce	2	2	32 - 8 oz bottles	21.05	76	0	0	0
66	66	Louisiana Hot Spiced Okra	2	2	24 - 8 oz jars	17	4	100	20	0
67	67	Laughing Lumberjack Lager	16	1	24 - 12 oz bottles	14	52	0	10	0
68	68	Scottish Longbreads	8	3	10 boxes x 8 pieces	12.5	6	10	15	0
69	69	Gudbrandsdalsost	15	4	10 kg pkg.	36	26	0	15	0
70	70	Outback Lager	7	1	24 - 355 ml bottles	15	15	10	30	0
71	71	Flotemysost	15	4	10 - 500 g pkgs.	21.5	26	0	0	0
72	72	Mozzarella di Giovanni	14	4	24 - 200 g pkgs.	34.8	14	0	0	0
73	73	Röd Kaviar	17	8	24 - 150 g jars	15	101	0	5	0
74	74	Longlife Tofu	4	7	5 kg pkg.	10	4	20	5	0
75	75	Rhönbräu Klosterbier	12	1	24 - 0.5 l bottles	7.75	125	0	25	0
76	76	Lakkalikööri	23	1	500 ml	18	57	0	20	0
77	77	Original Frankfurter grüne Soße	12	2	12 boxes	13	32	0	15	0
78	1	Chai	1	1	10 boxes x 20 bags	18	39	0	10	0
79	2	Chang	1	1	24 - 12 oz bottles	19	17	40	25	0
80	3	Aniseed Syrup	1	2	12 - 550 ml bottles	10	13	70	25	0
81	4	Chef Anton's Cajun Seasoning	2	2	48 - 6 oz jars	22	53	0	0	0
82	5	Chef Anton's Gumbo Mix	2	2	36 boxes	21.35	0	0	0	1
83	6	Grandma's Boysenberry Spread	3	2	12 - 8 oz jars	25	120	0	25	0
84	7	Uncle Bob's Organic Dried Pears	3	7	12 - 1 lb pkgs.	30	15	0	10	0
85	8	Northwoods Cranberry Sauce	3	2	12 - 12 oz jars	40	6	0	0	0
86	9	Mishi Kobe Niku	4	6	18 - 500 g pkgs.	97	29	0	0	1
87	10	Ikura	4	8	12 - 200 ml jars	31	31	0	0	0
88	11	Queso Cabrales	5	4	1 kg pkg.	21	22	30	30	0
89	12	Queso Manchego La Pastora	5	4	10 - 500 g pkgs.	38	86	0	0	0
90	13	Konbu	6	8	2 kg box	6	24	0	5	0
91	14	Tofu	6	7	40 - 100 g pkgs.	23.25	35	0	0	0
92	15	Genen Shouyu	6	2	24 - 250 ml bottles	15.5	39	0	5	0
93	16	Pavlova	7	3	32 - 500 g boxes	17.45	29	0	10	0
94	17	Alice Mutton	7	6	20 - 1 kg tins	39	0	0	0	1
95	18	Carnarvon Tigers	7	8	16 kg pkg.	62.5	42	0	0	0
96	19	Teatime Chocolate Biscuits	8	3	10 boxes x 12 pieces	9.2	25	0	5	0
97	20	Sir Rodney's Marmalade	8	3	30 gift boxes	81	40	0	0	0
98	21	Sir Rodney's Scones	8	3	24 pkgs. x 4 pieces	10	3	40	5	0
99	22	Gustaf's Knäckebröd	9	5	24 - 500 g pkgs.	21	104	0	25	0
100	23	Tunnbröd	9	5	12 - 250 g pkgs.	9	61	0	25	0
101	24	Guaraná Fantástica	10	1	12 - 355 ml cans	4.5	20	0	0	1
102	25	NuNuCa Nuß-Nougat-Creme	11	3	20 - 450 g glasses	14	76	0	30	0
103	26	Gumbär Gummibärchen	11	3	100 - 250 g bags	31.23	15	0	0	0
104	27	Schoggi Schokolade	11	3	100 - 100 g pieces	43.9	49	0	30	0
105	28	Rössle Sauerkraut	12	7	25 - 825 g cans	45.6	26	0	0	1
106	29	Thüringer Rostbratwurst	12	6	50 bags x 30 sausgs.	123.79	0	0	0	1
107	30	Nord-Ost Matjeshering	13	8	10 - 200 g glasses	25.89	10	0	15	0
108	31	Gorgonzola Telino	14	4	12 - 100 g pkgs	12.5	0	70	20	0
109	32	Mascarpone Fabioli	14	4	24 - 200 g pkgs.	32	9	40	25	0
110	33	Geitost	15	4	500 g	2.5	112	0	20	0
111	34	Sasquatch Ale	16	1	24 - 12 oz bottles	14	111	0	15	0
112	35	Steeleye Stout	16	1	24 - 12 oz bottles	18	20	0	15	0
113	36	Inlagd Sill	17	8	24 - 250 g  jars	19	112	0	20	0
114	37	Gravad lax	17	8	12 - 500 g pkgs.	26	11	50	25	0
115	38	Côte de Blaye	18	1	12 - 75 cl bottles	263.5	17	0	15	0
116	39	Chartreuse verte	18	1	750 cc per bottle	18	69	0	5	0
117	40	Boston Crab Meat	19	8	24 - 4 oz tins	18.4	123	0	30	0
118	41	Jack's New England Clam Chowder	19	8	12 - 12 oz cans	9.65	85	0	10	0
119	42	Singaporean Hokkien Fried Mee	20	5	32 - 1 kg pkgs.	14	26	0	0	1
120	43	Ipoh Coffee	20	1	16 - 500 g tins	46	17	10	25	0
121	44	Gula Malacca	20	2	20 - 2 kg bags	19.45	27	0	15	0
122	45	Rogede sild	21	8	1k pkg.	9.5	5	70	15	0
123	46	Spegesild	21	8	4 - 450 g glasses	12	95	0	0	0
124	47	Zaanse koeken	22	3	10 - 4 oz boxes	9.5	36	0	0	0
125	48	Chocolade	22	3	10 pkgs.	12.75	15	70	25	0
126	49	Maxilaku	23	3	24 - 50 g pkgs.	20	10	60	15	0
127	50	Valkoinen suklaa	23	3	12 - 100 g bars	16.25	65	0	30	0
128	51	Manjimup Dried Apples	24	7	50 - 300 g pkgs.	53	20	0	10	0
129	52	Filo Mix	24	5	16 - 2 kg boxes	7	38	0	25	0
130	53	Perth Pasties	24	6	48 pieces	32.8	0	0	0	1
131	54	Tourtière	25	6	16 pies	7.45	21	0	10	0
132	55	Pâté chinois	25	6	24 boxes x 2 pies	24	115	0	20	0
133	56	Gnocchi di nonna Alice	26	5	24 - 250 g pkgs.	38	21	10	30	0
134	57	Ravioli Angelo	26	5	24 - 250 g pkgs.	19.5	36	0	20	0
135	58	Escargots de Bourgogne	27	8	24 pieces	13.25	62	0	20	0
136	59	Raclette Courdavault	28	4	5 kg pkg.	55	79	0	0	0
137	60	Camembert Pierrot	28	4	15 - 300 g rounds	34	19	0	0	0
138	61	Sirop d'érable	29	2	24 - 500 ml bottles	28.5	113	0	25	0
139	62	Tarte au sucre	29	3	48 pies	49.3	17	0	0	0
140	63	Vegie-spread	7	2	15 - 625 g jars	43.9	24	0	5	0
141	64	Wimmers gute Semmelknödel	12	5	20 bags x 4 pieces	33.25	22	80	30	0
142	65	Louisiana Fiery Hot Pepper Sauce	2	2	32 - 8 oz bottles	21.05	76	0	0	0
143	66	Louisiana Hot Spiced Okra	2	2	24 - 8 oz jars	17	4	100	20	0
144	67	Laughing Lumberjack Lager	16	1	24 - 12 oz bottles	14	52	0	10	0
145	68	Scottish Longbreads	8	3	10 boxes x 8 pieces	12.5	6	10	15	0
146	69	Gudbrandsdalsost	15	4	10 kg pkg.	36	26	0	15	0
147	70	Outback Lager	7	1	24 - 355 ml bottles	15	15	10	30	0
148	71	Flotemysost	15	4	10 - 500 g pkgs.	21.5	26	0	0	0
149	72	Mozzarella di Giovanni	14	4	24 - 200 g pkgs.	34.8	14	0	0	0
150	73	Röd Kaviar	17	8	24 - 150 g jars	15	101	0	5	0
151	74	Longlife Tofu	4	7	5 kg pkg.	10	4	20	5	0
152	75	Rhönbräu Klosterbier	12	1	24 - 0.5 l bottles	7.75	125	0	25	0
153	76	Lakkalikööri	23	1	500 ml	18	57	0	20	0
154	77	Original Frankfurter grüne Soße	12	2	12 boxes	13	32	0	15	0
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, region_id, region_description) FROM stdin;
1	1	Eastern
2	2	Western
3	3	Northern
4	4	Southern
5	1	Eastern
6	2	Western
7	3	Northern
8	4	Southern
\.


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippers (id, shipper_id, company_name, phone) FROM stdin;
1	1	Speedy Express	(503) 555-9831
2	2	United Package	(503) 555-3199
3	3	Federal Shipping	(503) 555-9931
4	1	Speedy Express	(503) 555-9831
5	2	United Package	(503) 555-3199
6	3	Federal Shipping	(503) 555-9931
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (id, supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage) FROM stdin;
1	1	Exotic Liquids	Charlotte Cooper	Purchasing Manager	49 Gilbert St.	London	NULL	EC1 4SD	UK	(171) 555-2222	NULL	NULL
2	2	New Orleans Cajun Delights	Shelley Burke	Order Administrator	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	NULL	#CAJUN.HTM#
3	3	Grandma Kelly's Homestead	Regina Murphy	Sales Representative	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	NULL
4	4	Tokyo Traders	Yoshi Nagase	Marketing Manager	9-8 Sekimai Musashino-shi	Tokyo	NULL	100	Japan	(03) 3555-5011	NULL	NULL
5	5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra	Export Administrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spain	(98) 598 76 54	NULL	NULL
6	6	Mayumi's	Mayumi Ohno	Marketing Representative	92 Setsuko Chuo-ku	Osaka	NULL	545	Japan	(06) 431-7877	NULL	Mayumi's (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
7	7	Pavlova Ltd.	Ian Devling	Marketing Manager	74 Rose St. Moonie Ponds	Melbourne	Victoria	3058	Australia	(03) 444-2343	(03) 444-6588	NULL
8	8	Specialty Biscuits Ltd.	Peter Wilson	Sales Representative	29 King's Way	Manchester	NULL	M14 GSD	UK	(161) 555-4448	NULL	NULL
9	9	PB Knäckebröd AB	Lars Peterson	Sales Agent	Kaloadagatan 13	Göteborg	NULL	S-345 67	Sweden	031-987 65 43	031-987 65 91	NULL
10	10	Refrescos Americanas LTDA	Carlos Diaz	Marketing Manager	Av. das Americanas 12.890	Sao Paulo	NULL	5442	Brazil	(11) 555 4640	NULL	NULL
11	11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Sales Manager	Tiergartenstraße 5	Berlin	NULL	10785	Germany	(010) 9984510	NULL	NULL
12	12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	International Marketing Mgr.	Bogenallee 51	Frankfurt	NULL	60439	Germany	(069) 992755	NULL	Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
13	13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Coordinator Foreign Markets	Frahmredder 112a	Cuxhaven	NULL	27478	Germany	(04721) 8713	(04721) 8714	NULL
14	14	Formaggi Fortini s.r.l.	Elio Rossi	Sales Representative	Viale Dante 75	Ravenna	NULL	48100	Italy	(0544) 60323	(0544) 60603	#FORMAGGI.HTM#
15	15	Norske Meierier	Beate Vileid	Marketing Manager	Hatlevegen 5	Sandvika	NULL	1320	Norway	(0)2-953010	NULL	NULL
16	16	Bigfoot Breweries	Cheryl Saylor	Regional Account Rep.	3400 - 8th Avenue Suite 210	Bend	OR	97101	USA	(503) 555-9931	NULL	NULL
17	17	Svensk Sjöföda AB	Michael Björn	Sales Representative	Brovallavägen 231	Stockholm	NULL	S-123 45	Sweden	08-123 45 67	NULL	NULL
18	18	Aux joyeux ecclésiastiques	Guylène Nodier	Sales Manager	203 Rue des Francs-Bourgeois	Paris	NULL	75004	France	(1) 03.83.00.68	(1) 03.83.00.62	NULL
19	19	New England Seafood Cannery	Robb Merchant	Wholesale Account Agent	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	MA	02134	USA	(617) 555-3267	(617) 555-3389	NULL
20	20	Leka Trading	Chandra Leka	Owner	471 Serangoon Loop Suite #402	Singapore	NULL	0512	Singapore	555-8787	NULL	NULL
21	21	Lyngbysild	Niels Petersen	Sales Manager	Lyngbysild Fiskebakken 10	Lyngby	NULL	2800	Denmark	43844108	43844115	NULL
22	22	Zaanse Snoepfabriek	Dirk Luchte	Accounting Manager	Verkoop Rijnweg 22	Zaandam	NULL	9999 ZZ	Netherlands	(12345) 1212	(12345) 1210	NULL
23	23	Karkki Oy	Anne Heikkonen	Product Manager	Valtakatu 12	Lappeenranta	NULL	53120	Finland	(953) 10956	NULL	NULL
24	24	G'day Mate	Wendy Mackenzie	Sales Representative	170 Prince Edward Parade Hunter's Hill	Sydney	NSW	2042	Australia	(02) 555-5914	(02) 555-4873	G'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
25	25	Ma Maison	Jean-Guy Lauzon	Marketing Manager	2960 Rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-9022	NULL	NULL
26	26	Pasta Buttini s.r.l.	Giovanni Giudici	Order Administrator	Via dei Gelsomini 153	Salerno	NULL	84100	Italy	(089) 6547665	(089) 6547667	NULL
27	27	Escargots Nouveaux	Marie Delamare	Sales Manager	22 rue H. Voiron	Montceau	NULL	71300	France	85.57.00.07	NULL	NULL
28	28	Gai pâturage	Eliane Noz	Sales Representative	Bat. B 3 rue des Alpes	Annecy	NULL	74000	France	38.76.98.06	38.76.98.58	NULL
29	29	Forêts d'érables	Chantal Goulet	Accounting Manager	148 rue Chasseur	Ste-Hyacinthe	Québec	J2S 7S8	Canada	(514) 555-2955	(514) 555-2921	NULL
30	1	Exotic Liquids	Charlotte Cooper	Purchasing Manager	49 Gilbert St.	London	NULL	EC1 4SD	UK	(171) 555-2222	NULL	NULL
31	2	New Orleans Cajun Delights	Shelley Burke	Order Administrator	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	NULL	#CAJUN.HTM#
32	3	Grandma Kelly's Homestead	Regina Murphy	Sales Representative	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	NULL
33	4	Tokyo Traders	Yoshi Nagase	Marketing Manager	9-8 Sekimai Musashino-shi	Tokyo	NULL	100	Japan	(03) 3555-5011	NULL	NULL
34	5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra	Export Administrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spain	(98) 598 76 54	NULL	NULL
35	6	Mayumi's	Mayumi Ohno	Marketing Representative	92 Setsuko Chuo-ku	Osaka	NULL	545	Japan	(06) 431-7877	NULL	Mayumi's (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
36	7	Pavlova Ltd.	Ian Devling	Marketing Manager	74 Rose St. Moonie Ponds	Melbourne	Victoria	3058	Australia	(03) 444-2343	(03) 444-6588	NULL
37	8	Specialty Biscuits Ltd.	Peter Wilson	Sales Representative	29 King's Way	Manchester	NULL	M14 GSD	UK	(161) 555-4448	NULL	NULL
38	9	PB Knäckebröd AB	Lars Peterson	Sales Agent	Kaloadagatan 13	Göteborg	NULL	S-345 67	Sweden	031-987 65 43	031-987 65 91	NULL
39	10	Refrescos Americanas LTDA	Carlos Diaz	Marketing Manager	Av. das Americanas 12.890	Sao Paulo	NULL	5442	Brazil	(11) 555 4640	NULL	NULL
40	11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Sales Manager	Tiergartenstraße 5	Berlin	NULL	10785	Germany	(010) 9984510	NULL	NULL
41	12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	International Marketing Mgr.	Bogenallee 51	Frankfurt	NULL	60439	Germany	(069) 992755	NULL	Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
42	13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Coordinator Foreign Markets	Frahmredder 112a	Cuxhaven	NULL	27478	Germany	(04721) 8713	(04721) 8714	NULL
43	14	Formaggi Fortini s.r.l.	Elio Rossi	Sales Representative	Viale Dante 75	Ravenna	NULL	48100	Italy	(0544) 60323	(0544) 60603	#FORMAGGI.HTM#
44	15	Norske Meierier	Beate Vileid	Marketing Manager	Hatlevegen 5	Sandvika	NULL	1320	Norway	(0)2-953010	NULL	NULL
45	16	Bigfoot Breweries	Cheryl Saylor	Regional Account Rep.	3400 - 8th Avenue Suite 210	Bend	OR	97101	USA	(503) 555-9931	NULL	NULL
46	17	Svensk Sjöföda AB	Michael Björn	Sales Representative	Brovallavägen 231	Stockholm	NULL	S-123 45	Sweden	08-123 45 67	NULL	NULL
47	18	Aux joyeux ecclésiastiques	Guylène Nodier	Sales Manager	203 Rue des Francs-Bourgeois	Paris	NULL	75004	France	(1) 03.83.00.68	(1) 03.83.00.62	NULL
48	19	New England Seafood Cannery	Robb Merchant	Wholesale Account Agent	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	MA	02134	USA	(617) 555-3267	(617) 555-3389	NULL
49	20	Leka Trading	Chandra Leka	Owner	471 Serangoon Loop Suite #402	Singapore	NULL	0512	Singapore	555-8787	NULL	NULL
50	21	Lyngbysild	Niels Petersen	Sales Manager	Lyngbysild Fiskebakken 10	Lyngby	NULL	2800	Denmark	43844108	43844115	NULL
51	22	Zaanse Snoepfabriek	Dirk Luchte	Accounting Manager	Verkoop Rijnweg 22	Zaandam	NULL	9999 ZZ	Netherlands	(12345) 1212	(12345) 1210	NULL
52	23	Karkki Oy	Anne Heikkonen	Product Manager	Valtakatu 12	Lappeenranta	NULL	53120	Finland	(953) 10956	NULL	NULL
53	24	G'day Mate	Wendy Mackenzie	Sales Representative	170 Prince Edward Parade Hunter's Hill	Sydney	NSW	2042	Australia	(02) 555-5914	(02) 555-4873	G'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
54	25	Ma Maison	Jean-Guy Lauzon	Marketing Manager	2960 Rue St. Laurent	Montréal	Québec	H1J 1C3	Canada	(514) 555-9022	NULL	NULL
55	26	Pasta Buttini s.r.l.	Giovanni Giudici	Order Administrator	Via dei Gelsomini 153	Salerno	NULL	84100	Italy	(089) 6547665	(089) 6547667	NULL
56	27	Escargots Nouveaux	Marie Delamare	Sales Manager	22 rue H. Voiron	Montceau	NULL	71300	France	85.57.00.07	NULL	NULL
57	28	Gai pâturage	Eliane Noz	Sales Representative	Bat. B 3 rue des Alpes	Annecy	NULL	74000	France	38.76.98.06	38.76.98.58	NULL
58	29	Forêts d'érables	Chantal Goulet	Accounting Manager	148 rue Chasseur	Ste-Hyacinthe	Québec	J2S 7S8	Canada	(514) 555-2955	(514) 555-2921	NULL
\.


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territories (id, territory_id, territory_description, region_id) FROM stdin;
1	1581	Westboro	1
2	1730	Bedford	1
3	1833	Georgetow	1
4	2116	Boston	1
5	2139	Cambridge	1
6	2184	Braintree	1
7	2903	Providence	1
8	3049	Hollis	3
9	3801	Portsmouth	3
10	6897	Wilton	1
11	7960	Morristown	1
12	8837	Edison	1
13	10019	NewYork	1
14	10038	NewYork	1
15	11747	Mellvile	1
16	14450	Fairport	1
17	19428	Philadelphia	3
18	19713	Neward	1
19	20852	Rockville	1
20	27403	Greensboro	1
21	27511	Cary	1
22	29202	Columbia	4
23	30346	Atlanta	4
24	31406	Savannah	4
25	32859	Orlando	4
26	33607	Tampa	4
27	40222	Louisville	1
28	44122	Beachwood	3
29	45839	Findlay	3
30	48075	Southfield	3
31	48084	Troy	3
32	48304	BloomfieldHills	3
33	53404	Racine	3
34	55113	Roseville	3
35	55439	Minneapolis	3
36	60179	HoffmanEstates	2
37	60601	Chicago	2
38	72716	Bentonville	4
39	75234	Dallas	4
40	78759	Austin	4
41	80202	Denver	2
42	80909	ColoradoSprings	2
43	85014	Phoenix	2
44	85251	Scottsdale	2
45	90405	SantaMonica	2
46	94025	MenloPark	2
47	94105	SanFrancisco	2
48	95008	Campbell	2
49	95054	SantaClara	2
50	95060	SantaCruz	2
51	98004	Bellevue	2
52	98052	Redmond	2
53	98104	Seattle	2
54	1581	Westboro	1
55	1730	Bedford	1
56	1833	Georgetow	1
57	2116	Boston	1
58	2139	Cambridge	1
59	2184	Braintree	1
60	2903	Providence	1
61	3049	Hollis	3
62	3801	Portsmouth	3
63	6897	Wilton	1
64	7960	Morristown	1
65	8837	Edison	1
66	10019	NewYork	1
67	10038	NewYork	1
68	11747	Mellvile	1
69	14450	Fairport	1
70	19428	Philadelphia	3
71	19713	Neward	1
72	20852	Rockville	1
73	27403	Greensboro	1
74	27511	Cary	1
75	29202	Columbia	4
76	30346	Atlanta	4
77	31406	Savannah	4
78	32859	Orlando	4
79	33607	Tampa	4
80	40222	Louisville	1
81	44122	Beachwood	3
82	45839	Findlay	3
83	48075	Southfield	3
84	48084	Troy	3
85	48304	BloomfieldHills	3
86	53404	Racine	3
87	55113	Roseville	3
88	55439	Minneapolis	3
89	60179	HoffmanEstates	2
90	60601	Chicago	2
91	72716	Bentonville	4
92	75234	Dallas	4
93	78759	Austin	4
94	80202	Denver	2
95	80909	ColoradoSprings	2
96	85014	Phoenix	2
97	85251	Scottsdale	2
98	90405	SantaMonica	2
99	94025	MenloPark	2
100	94105	SanFrancisco	2
101	95008	Campbell	2
102	95054	SantaClara	2
103	95060	SantaCruz	2
104	98004	Bellevue	2
105	98052	Redmond	2
106	98104	Seattle	2
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 16, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 182, true);


--
-- Name: employee_territorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_territorities_id_seq', 98, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 1, false);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 6465, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2490, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 154, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 8, true);


--
-- Name: shippers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippers_id_seq', 6, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 58, true);


--
-- Name: territories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.territories_id_seq', 106, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: employee_territorities employee_territorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territorities
    ADD CONSTRAINT employee_territorities_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: territories territories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT territories_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

