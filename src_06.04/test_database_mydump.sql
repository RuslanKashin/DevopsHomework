--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Debian 13.7-1.pgdg110+1)
-- Dumped by pg_dump version 13.7 (Debian 13.7-1.pgdg110+1)

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
-- Name: orders; Type: TABLE; Schema: public; Owner: kashin
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    title character varying(80) NOT NULL UNIQUE,
    price integer DEFAULT 0
);


ALTER TABLE public.orders OWNER TO kashin;

--
-- Name: orders_hight_price; Type: TABLE; Schema: public; Owner: kashin
--

CREATE TABLE public.orders_hight_price (
    CONSTRAINT orders_hight_price_price_check CHECK ((price > 499))
)
INHERITS (public.orders);


ALTER TABLE public.orders_hight_price OWNER TO kashin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: kashin
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO kashin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kashin
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_low_price; Type: TABLE; Schema: public; Owner: kashin
--

CREATE TABLE public.orders_low_price (
    CONSTRAINT orders_low_price_price_check CHECK ((price <= 499))
)
INHERITS (public.orders);


ALTER TABLE public.orders_low_price OWNER TO kashin;

--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_hight_price id; Type: DEFAULT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders_hight_price ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_hight_price price; Type: DEFAULT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders_hight_price ALTER COLUMN price SET DEFAULT 0;


--
-- Name: orders_low_price id; Type: DEFAULT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders_low_price ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_low_price price; Type: DEFAULT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders_low_price ALTER COLUMN price SET DEFAULT 0;


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: kashin
--

COPY public.orders (id, title, price) FROM stdin;
\.


--
-- Data for Name: orders_hight_price; Type: TABLE DATA; Schema: public; Owner: kashin
--

COPY public.orders_hight_price (id, title, price) FROM stdin;
2	My little database	500
6	WAL never lies	900
8	Dbiezdmin	501
\.


--
-- Data for Name: orders_low_price; Type: TABLE DATA; Schema: public; Owner: kashin
--

COPY public.orders_low_price (id, title, price) FROM stdin;
1	War and peace	100
3	Adventure psql time	300
4	Server gravity falls	300
5	Log gossips	123
7	Me and my bash-pet	499
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kashin
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: kashin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_insert_to_hight_price; Type: RULE; Schema: public; Owner: kashin
--

CREATE RULE orders_insert_to_hight_price AS
    ON INSERT TO public.orders
   WHERE (new.price > 499) DO INSTEAD  INSERT INTO public.orders_hight_price (id, title, price)
  VALUES (new.id, new.title, new.price);


--
-- Name: orders orders_insert_to_low_price; Type: RULE; Schema: public; Owner: kashin
--

CREATE RULE orders_insert_to_low_price AS
    ON INSERT TO public.orders
   WHERE (new.price <= 499) DO INSTEAD  INSERT INTO public.orders_low_price (id, title, price)
  VALUES (new.id, new.title, new.price);


--
-- PostgreSQL database dump complete
--

