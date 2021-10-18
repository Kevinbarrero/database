--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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

DROP DATABASE farm;
--
-- Name: farm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE farm WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE farm OWNER TO postgres;

\connect farm

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
-- Name: animal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animal (
    type character varying(50),
    breed character varying(50),
    gender character varying(10) NOT NULL,
    age numeric NOT NULL,
    stable_number integer
);


ALTER TABLE public.animal OWNER TO postgres;

--
-- Name: home; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home (
    number integer NOT NULL,
    home_number integer,
    veterinary_id integer NOT NULL,
    CONSTRAINT home_home_number_check CHECK (((home_number > 9) AND (home_number < 51)))
);


ALTER TABLE public.home OWNER TO postgres;

--
-- Name: home_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_number_seq OWNER TO postgres;

--
-- Name: home_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_number_seq OWNED BY public.home.number;


--
-- Name: horse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horse (
    id integer NOT NULL,
    name character varying(70),
    age integer NOT NULL,
    CONSTRAINT horse_age_check CHECK ((age < 51))
);


ALTER TABLE public.horse OWNER TO postgres;

--
-- Name: horse_home; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horse_home (
    groom_id integer NOT NULL,
    home_number integer NOT NULL
);


ALTER TABLE public.horse_home OWNER TO postgres;

--
-- Name: horse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horse_id_seq OWNER TO postgres;

--
-- Name: horse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horse_id_seq OWNED BY public.horse.id;


--
-- Name: veterinary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veterinary (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    experience integer NOT NULL,
    CONSTRAINT veterinary_experience_check CHECK ((experience > 2))
);


ALTER TABLE public.veterinary OWNER TO postgres;

--
-- Name: veterinary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veterinary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veterinary_id_seq OWNER TO postgres;

--
-- Name: veterinary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veterinary_id_seq OWNED BY public.veterinary.id;


--
-- Name: home number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home ALTER COLUMN number SET DEFAULT nextval('public.home_number_seq'::regclass);


--
-- Name: horse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horse ALTER COLUMN id SET DEFAULT nextval('public.horse_id_seq'::regclass);


--
-- Name: veterinary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinary ALTER COLUMN id SET DEFAULT nextval('public.veterinary_id_seq'::regclass);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animal (type, breed, gender, age, stable_number) FROM stdin;
\.
COPY public.animal (type, breed, gender, age, stable_number) FROM '$$PATH$$/3026.dat';

--
-- Data for Name: home; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home (number, home_number, veterinary_id) FROM stdin;
\.
COPY public.home (number, home_number, veterinary_id) FROM '$$PATH$$/3025.dat';

--
-- Data for Name: horse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horse (id, name, age) FROM stdin;
\.
COPY public.horse (id, name, age) FROM '$$PATH$$/3022.dat';

--
-- Data for Name: horse_home; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horse_home (groom_id, home_number) FROM stdin;
\.
COPY public.horse_home (groom_id, home_number) FROM '$$PATH$$/3023.dat';

--
-- Data for Name: veterinary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veterinary (id, name, experience) FROM stdin;
\.
COPY public.veterinary (id, name, experience) FROM '$$PATH$$/3020.dat';

--
-- Name: home_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_number_seq', 1, false);


--
-- Name: horse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horse_id_seq', 1, false);


--
-- Name: veterinary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veterinary_id_seq', 1, false);


--
-- Name: home home_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home
    ADD CONSTRAINT home_pkey PRIMARY KEY (number);


--
-- Name: horse horse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horse
    ADD CONSTRAINT horse_pkey PRIMARY KEY (id);


--
-- Name: veterinary veterinary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinary
    ADD CONSTRAINT veterinary_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

