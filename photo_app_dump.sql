--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-21 09:41:32 UTC

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
-- TOC entry 217 (class 1259 OID 34270)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(128) NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 34269)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 209 (class 1259 OID 34233)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 34277)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    email character varying(128) NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 34288)
-- Name: customers_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_events (
    price character varying(128) NOT NULL,
    photo_type character varying(128) NOT NULL,
    customer_id integer NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.customers_events OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 34276)
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
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 218
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 215 (class 1259 OID 34253)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    customer_id integer NOT NULL,
    appt_date date NOT NULL,
    location_id integer NOT NULL,
    photo_shoot_id integer NOT NULL,
    duration character varying(128) NOT NULL,
    appt_time character varying(128) NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 34252)
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 214
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- TOC entry 213 (class 1259 OID 34246)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    locations character varying(128) NOT NULL,
    numb_pers integer NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 34245)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 212
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 211 (class 1259 OID 34239)
-- Name: photo_shoots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo_shoots (
    id integer NOT NULL,
    event_id integer NOT NULL,
    duration character varying(128) NOT NULL
);


ALTER TABLE public.photo_shoots OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 34238)
-- Name: photo_shoots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photo_shoots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_shoots_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 210
-- Name: photo_shoots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photo_shoots_id_seq OWNED BY public.photo_shoots.id;


--
-- TOC entry 3197 (class 2604 OID 34273)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 34280)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 34256)
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 34249)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 34242)
-- Name: photo_shoots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_shoots ALTER COLUMN id SET DEFAULT nextval('public.photo_shoots_id_seq'::regclass);


--
-- TOC entry 3365 (class 0 OID 34270)
-- Dependencies: 217
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, username, password) FROM stdin;
1	lknagges0	ksaunier0@163.com
3	emilbank2	dcavalier2@cafepress.com
4	ghardway3	mhamlington3@skyrock.com
5	ceam4	rmanssuer4@sun.com
6	efryatt5	spull5@pbs.org
7	ebottinelli6	cstuddeard6@homestead.com
8	dslatten7	sstanbra7@ycombinator.com
9	nkirkwood8	gbondar8@craigslist.org
10	dtroker9	dsawdon9@webnode.com
2	updated_user_2	0e88c0fd47c0bfd009498320a440719880d8532ca4f16f1897e6c1b7a5d20832348490bfe4b0152fc350267879184904168f153508d422e9be1b178624e14e80
12	posted_user_user	63600eaa1f0fe8d91a337d02f09f3670109f9fca29f14712bf66b2fea18b2c048a8efa781e5fedecb5908436a10268dbb0fb8a2070950078cecdbbaeb9ead9f2
\.


--
-- TOC entry 3357 (class 0 OID 34233)
-- Dependencies: 209
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
0a129216179c
\.


--
-- TOC entry 3367 (class 0 OID 34277)
-- Dependencies: 219
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, email, account_id) FROM stdin;
1	Tadeo	Burchnall	tburchnall0@house.gov	1
2	Ernest	Alfonsini	ealfonsini1@ted.com	2
4	Hugibert	Griffen	hgriffen3@chicagotribune.com	4
5	Stillman	Kropp	skropp4@google.co.jp	5
6	Thorn	Lanphere	tlanphere5@ocn.ne.jp	6
7	Cherice	Alf	calf6@dagondesign.com	7
8	Dory	Flamank	dflamank7@fema.gov	8
9	Hyacinthie	Woolerton	hwoolerton8@de.vu	9
10	Wade	Yoxen	wyoxen9@taobao.com	10
3	updated_user_3	updated	jason.c.sodenkamp@gmail.com	3
\.


--
-- TOC entry 3368 (class 0 OID 34288)
-- Dependencies: 220
-- Data for Name: customers_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_events (price, photo_type, customer_id, event_id) FROM stdin;
150	Mini	2	1
150	Mini	6	2
200	Large	8	3
\.


--
-- TOC entry 3363 (class 0 OID 34253)
-- Dependencies: 215
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, customer_id, appt_date, location_id, photo_shoot_id, duration, appt_time) FROM stdin;
1	2	2022-07-14	2	1	30	9:00 AM
2	6	2022-07-14	2	2	30	10:00 AM
3	8	2022-07-14	1	3	60	1:30 PM
\.


--
-- TOC entry 3361 (class 0 OID 34246)
-- Dependencies: 213
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, locations, numb_pers) FROM stdin;
1	On Location	8
2	At Location	10
\.


--
-- TOC entry 3359 (class 0 OID 34239)
-- Dependencies: 211
-- Data for Name: photo_shoots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo_shoots (id, event_id, duration) FROM stdin;
1	1	30
2	2	30
3	3	60
\.


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 12, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 218
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 214
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 1, false);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 212
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 2, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 210
-- Name: photo_shoots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photo_shoots_id_seq', 1, false);


--
-- TOC entry 3208 (class 2606 OID 34275)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 34237)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3212 (class 2606 OID 34292)
-- Name: customers_events customers_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_events
    ADD CONSTRAINT customers_events_pkey PRIMARY KEY (customer_id, event_id);


--
-- TOC entry 3210 (class 2606 OID 34282)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 34258)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 3204 (class 2606 OID 34251)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 34244)
-- Name: photo_shoots photo_shoots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_shoots
    ADD CONSTRAINT photo_shoots_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 34283)
-- Name: customers customers_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- TOC entry 3216 (class 2606 OID 34293)
-- Name: customers_events customers_events_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_events
    ADD CONSTRAINT customers_events_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 3217 (class 2606 OID 34298)
-- Name: customers_events customers_events_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_events
    ADD CONSTRAINT customers_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- TOC entry 3213 (class 2606 OID 34259)
-- Name: events events_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- TOC entry 3214 (class 2606 OID 34264)
-- Name: events events_photo_shoot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_photo_shoot_id_fkey FOREIGN KEY (photo_shoot_id) REFERENCES public.photo_shoots(id);


-- Completed on 2022-05-21 09:41:32 UTC

--
-- PostgreSQL database dump complete
--

