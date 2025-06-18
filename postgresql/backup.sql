--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: contoh; Type: SCHEMA; Schema: -; Owner: m16yusuf
--

CREATE SCHEMA contoh;


ALTER SCHEMA contoh OWNER TO m16yusuf;

--
-- Name: product_category; Type: TYPE; Schema: public; Owner: m16yusuf
--

CREATE TYPE public.product_category AS ENUM (
    'makanan',
    'minuman',
    'lain-lain'
);


ALTER TYPE public.product_category OWNER TO m16yusuf;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: products; Type: TABLE; Schema: contoh; Owner: m16yusuf
--

CREATE TABLE contoh.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE contoh.products OWNER TO m16yusuf;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: contoh; Owner: m16yusuf
--

CREATE SEQUENCE contoh.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE contoh.products_id_seq OWNER TO m16yusuf;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: contoh; Owner: m16yusuf
--

ALTER SEQUENCE contoh.products_id_seq OWNED BY contoh.products.id;


--
-- Name: admin; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100)
);


ALTER TABLE public.admin OWNER TO m16yusuf;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO m16yusuf;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: barang; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.barang (
    kode integer NOT NULL,
    name character varying(100) NOT NULL,
    harga integer DEFAULT 1000 NOT NULL,
    jumlah integer DEFAULT 0 NOT NULL,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.barang OWNER TO m16yusuf;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.categories (
    id character varying(10) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO m16yusuf;

--
-- Name: contoh_sequence; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.contoh_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contoh_sequence OWNER TO m16yusuf;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);


ALTER TABLE public.customer OWNER TO m16yusuf;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO m16yusuf;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: guestbooks; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.guestbooks (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    content text
);


ALTER TABLE public.guestbooks OWNER TO m16yusuf;

--
-- Name: guestbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.guestbooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guestbooks_id_seq OWNER TO m16yusuf;

--
-- Name: guestbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.guestbooks_id_seq OWNED BY public.guestbooks.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.orders OWNER TO m16yusuf;

--
-- Name: orders_detail; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.orders_detail (
    id_product character varying(10) NOT NULL,
    id_order integer NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.orders_detail OWNER TO m16yusuf;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO m16yusuf;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.products (
    id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price integer NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_category character varying(10),
    CONSTRAINT price_check CHECK ((price > 1000)),
    CONSTRAINT quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.products OWNER TO m16yusuf;

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.sellers OWNER TO m16yusuf;

--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.sellers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sellers_id_seq OWNER TO m16yusuf;

--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: wallet; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.wallet (
    id integer NOT NULL,
    id_customer integer NOT NULL,
    balance integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.wallet OWNER TO m16yusuf;

--
-- Name: wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_id_seq OWNER TO m16yusuf;

--
-- Name: wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.wallet_id_seq OWNED BY public.wallet.id;


--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: m16yusuf
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    id_product character varying(10) NOT NULL,
    description text,
    id_customer integer
);


ALTER TABLE public.wishlist OWNER TO m16yusuf;

--
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: m16yusuf
--

CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlist_id_seq OWNER TO m16yusuf;

--
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: m16yusuf
--

ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- Name: products id; Type: DEFAULT; Schema: contoh; Owner: m16yusuf
--

ALTER TABLE ONLY contoh.products ALTER COLUMN id SET DEFAULT nextval('contoh.products_id_seq'::regclass);


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: guestbooks id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.guestbooks ALTER COLUMN id SET DEFAULT nextval('public.guestbooks_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: wallet id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wallet ALTER COLUMN id SET DEFAULT nextval('public.wallet_id_seq'::regclass);


--
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: contoh; Owner: m16yusuf
--

COPY contoh.products (id, name) FROM stdin;
1	iphone
2	Play station
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.admin (id, first_name, last_name) FROM stdin;
1	Eko	Khannedy
2	Muhammad	Yusuf
3	Budi	Nugraha
4	Joko	Morro
\.


--
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.barang (kode, name, harga, jumlah, waktu_dibuat) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.categories (id, name) FROM stdin;
C0001	Makanan
C0002	Minuman
C0003	Gadget
C0004	Laptop
C0005	Pulsa
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.customer (id, email, first_name, last_name) FROM stdin;
1	yusufsmd58@gmail.com	Muhammad	Yusuf
2	eko@pzn.com	Eko	Khannedy
4	budi@pzn.com	Budi	Nugraha
5	joko@pzn.com	joko	Morro
6	rully@pzn.com	Ruly	Irwansyah
\.


--
-- Data for Name: guestbooks; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.guestbooks (id, email, title, content) FROM stdin;
1	eko@pzn.com	feedback eko	ini feedback eko
2	eko@pzn.com	feedback eko	ini feedback eko
3	budi@pzn.com	feedback budi	ini feedback budi
4	rully@pzn.com	feedback rully	ini feedback rully
5	tono@pzn.com	feedback tono	ini feedback tono
6	tono@pzn.com	feedback tono	ini feedback tono
7	transaction@pzn.com	transaction	transaction
8	transaction@pzn.com	transaction	transaction 2
9	transaction@pzn.com	transaction	transaction 3
10	transaction@pzn.com	transaction	transaction 4
11	transaction@pzn.com	transaction	transaction 5
17	eko@pzn.com	contoh	contoh
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.orders (id, total, order_date) FROM stdin;
1	1	2025-06-17 11:07:14.120072
2	1	2025-06-17 11:07:14.120072
3	1	2025-06-17 11:07:14.120072
\.


--
-- Data for Name: orders_detail; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.orders_detail (id_product, id_order, price, quantity) FROM stdin;
P0001	1	1000	2
P0002	1	1000	2
P0003	1	1000	2
P0004	2	1000	2
P0006	2	1000	2
P0007	2	1000	2
P0001	3	1000	2
P0004	3	1000	2
P0005	3	1000	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.products (id, name, description, price, quantity, created_at, id_category) FROM stdin;
P0006	es teh tawar	\N	10000	100	2025-05-16 10:38:47.341706	C0002
P0007	es campur	\N	20000	100	2025-05-16 10:38:47.341706	C0002
P0002	Mie Ayam Baso Tahu	Mie Ayam original + baso tahu	20000	100	2025-05-07 14:45:35.672049	C0001
P0005	Mie Ayam Yamin	\N	15000	100	2025-05-07 14:48:51.19683	C0001
P0003	Mie Ayam Ceker	mie ayam + ceker	20000	100	2025-05-07 14:48:51.19683	C0001
P0004	Mie Ayam Spesial	\N	30000	100	2025-05-07 14:48:51.19683	C0001
P0008	jus jeruk	\N	15000	100	2025-05-16 10:38:47.341706	C0002
X0001	Contoh 1	\N	10000	100	2025-06-17 11:35:31.936059	\N
X0002	Contoh 2	\N	10000	100	2025-06-17 11:35:31.936059	\N
P0001	Mie Ayam Original	mie ayam original enak	30000	200	2025-05-07 14:43:19.603113	C0001
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.sellers (id, name, email) FROM stdin;
1	galeri olahraga	galeri@pzn.com
2	galeri Tono	tono@pzn.com
3	galeri Budi	budi@pzn.com
4	galeri Arvin	arvin@pzn.com
5	galeri Rully	rully@pzn.com
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.wallet (id, id_customer, balance) FROM stdin;
1	1	1000000
2	2	2000000
3	4	3000000
4	5	4000000
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: m16yusuf
--

COPY public.wishlist (id, id_product, description, id_customer) FROM stdin;
1	P0001	Mie ayam kesukaan	1
2	P0002	Mie ayam kesukaan	1
3	P0005	Mie ayam kesukaan	4
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: contoh; Owner: m16yusuf
--

SELECT pg_catalog.setval('contoh.products_id_seq', 2, true);


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.admin_id_seq', 4, true);


--
-- Name: contoh_sequence; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.contoh_sequence', 3, true);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.customer_id_seq', 6, true);


--
-- Name: guestbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.guestbooks_id_seq', 17, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.sellers_id_seq', 5, true);


--
-- Name: wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.wallet_id_seq', 4, true);


--
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: m16yusuf
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 4, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: contoh; Owner: m16yusuf
--

ALTER TABLE ONLY contoh.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: sellers email_unique; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- Name: guestbooks guestbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.guestbooks
    ADD CONSTRAINT guestbooks_pkey PRIMARY KEY (id);


--
-- Name: orders_detail orders_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT orders_detail_pkey PRIMARY KEY (id_product, id_order);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: customer unique_email; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: wallet wallet_customer_unique; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_customer_unique UNIQUE (id_customer);


--
-- Name: wallet wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (id);


--
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


--
-- Name: products_description_search; Type: INDEX; Schema: public; Owner: m16yusuf
--

CREATE INDEX products_description_search ON public.products USING gin (to_tsvector('indonesian'::regconfig, description));


--
-- Name: products_name_search; Type: INDEX; Schema: public; Owner: m16yusuf
--

CREATE INDEX products_name_search ON public.products USING gin (to_tsvector('indonesian'::regconfig, (name)::text));


--
-- Name: sellers_email_and_name_index; Type: INDEX; Schema: public; Owner: m16yusuf
--

CREATE INDEX sellers_email_and_name_index ON public.sellers USING btree (email, name);


--
-- Name: sellers_id_and_name_index; Type: INDEX; Schema: public; Owner: m16yusuf
--

CREATE INDEX sellers_id_and_name_index ON public.sellers USING btree (id, name);


--
-- Name: sellers_name_index; Type: INDEX; Schema: public; Owner: m16yusuf
--

CREATE INDEX sellers_name_index ON public.sellers USING btree (name);


--
-- Name: orders_detail fk_order_detail_order; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT fk_order_detail_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: orders_detail fk_order_detail_product; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT fk_order_detail_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (id_category) REFERENCES public.categories(id);


--
-- Name: wallet fk_wallet_customer; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id);


--
-- Name: wishlist fk_wishlist_customer; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id);


--
-- Name: wishlist fk_wishlist_product; Type: FK CONSTRAINT; Schema: public; Owner: m16yusuf
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TABLE admin; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.admin TO yusuf;


--
-- Name: TABLE barang; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.barang TO yusuf;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.categories TO yusuf;


--
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.customer TO yusuf;
GRANT SELECT,INSERT,UPDATE ON TABLE public.customer TO anisa;


--
-- Name: TABLE guestbooks; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.guestbooks TO yusuf;


--
-- Name: SEQUENCE guestbooks_id_seq; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT ALL ON SEQUENCE public.guestbooks_id_seq TO yusuf;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.orders TO yusuf;


--
-- Name: TABLE orders_detail; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.orders_detail TO yusuf;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.products TO yusuf;


--
-- Name: TABLE sellers; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.sellers TO yusuf;


--
-- Name: TABLE wallet; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.wallet TO yusuf;


--
-- Name: TABLE wishlist; Type: ACL; Schema: public; Owner: m16yusuf
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.wishlist TO yusuf;


--
-- PostgreSQL database dump complete
--

