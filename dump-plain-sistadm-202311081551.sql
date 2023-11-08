--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-11-08 15:51:39

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 221 (class 1259 OID 16495)
-- Name: academic_details_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.academic_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_details_id_seq OWNER TO sistadm_write;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16496)
-- Name: academic_details; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.academic_details (
    id integer DEFAULT nextval('public.academic_details_id_seq'::regclass) NOT NULL,
    class_10_school_id integer NOT NULL,
    class_12_school_id integer,
    diploma_id integer,
    jee_mains_rank integer DEFAULT 0,
    jee_mains_marks integer DEFAULT 0,
    jee_advanced_rank integer DEFAULT 0,
    jee_advanced_marks integer DEFAULT 0,
    cuet_rank integer DEFAULT 0,
    cuet_marks integer DEFAULT 0,
    merit_score integer
);


ALTER TABLE public.academic_details OWNER TO sistadm_write;

--
-- TOC entry 226 (class 1259 OID 16545)
-- Name: application_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_id_seq OWNER TO sistadm_write;

--
-- TOC entry 227 (class 1259 OID 16546)
-- Name: applications; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.applications (
    id integer DEFAULT nextval('public.application_id_seq'::regclass) NOT NULL,
    basic_details_id integer,
    academic_details_id integer,
    payment_id integer,
    application_type character varying(255) DEFAULT 'FRESHER'::character varying NOT NULL,
    application_start_date date DEFAULT CURRENT_DATE NOT NULL,
    status character varying(255) DEFAULT 'NOT SUBMITTED'::character varying NOT NULL
);


ALTER TABLE public.applications OWNER TO sistadm_write;

--
-- TOC entry 214 (class 1259 OID 16441)
-- Name: basic_details_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.basic_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_details_id_seq OWNER TO sistadm_write;

--
-- TOC entry 215 (class 1259 OID 16442)
-- Name: basic_details; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.basic_details (
    id integer DEFAULT nextval('public.basic_details_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    dob date NOT NULL,
    gender character(10) NOT NULL,
    category character(10) NOT NULL,
    is_coi boolean NOT NULL,
    is_pwd boolean NOT NULL,
    father_name character varying(255) NOT NULL,
    mother_name character varying(255) NOT NULL,
    nationality character varying(255) NOT NULL,
    identity_type character varying(255) NOT NULL,
    identity_number character varying(255) NOT NULL,
    identity_document_id integer NOT NULL,
    signature_document_id integer,
    photo_document_id integer,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    phone character varying(255) DEFAULT ''::character varying NOT NULL,
    address character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.basic_details OWNER TO sistadm_write;

--
-- TOC entry 210 (class 1259 OID 16394)
-- Name: batches; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.batches (
    batch_code character varying NOT NULL,
    batch_name character varying(255),
    department_code character varying NOT NULL,
    start_year integer NOT NULL,
    end_year integer NOT NULL
);


ALTER TABLE public.batches OWNER TO sistadm_write;

--
-- TOC entry 211 (class 1259 OID 16409)
-- Name: class_12_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.class_12_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_12_marks_id_seq OWNER TO sistadm_write;

--
-- TOC entry 237 (class 1259 OID 16668)
-- Name: class_12_marks; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.class_12_marks (
    id integer DEFAULT nextval('public.class_12_marks_id_seq'::regclass) NOT NULL,
    school_id integer NOT NULL,
    marks_obtained integer NOT NULL,
    total_marks integer NOT NULL,
    is_passed boolean NOT NULL,
    subject_name character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.class_12_marks OWNER TO sistadm_write;

--
-- TOC entry 209 (class 1259 OID 16389)
-- Name: departments; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.departments (
    department_code character varying(4) NOT NULL,
    department_name character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO sistadm_write;

--
-- TOC entry 216 (class 1259 OID 16455)
-- Name: diploma_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.diploma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diploma_id_seq OWNER TO sistadm_write;

--
-- TOC entry 217 (class 1259 OID 16456)
-- Name: diploma; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.diploma (
    id integer DEFAULT nextval('public.diploma_id_seq'::regclass) NOT NULL,
    college_name character varying(255) NOT NULL,
    department character varying(255) NOT NULL,
    year_of_passing integer NOT NULL,
    cgpa double precision DEFAULT 0.0 NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE public.diploma OWNER TO sistadm_write;

--
-- TOC entry 218 (class 1259 OID 16464)
-- Name: diploma_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.diploma_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diploma_marks_id_seq OWNER TO sistadm_write;

--
-- TOC entry 212 (class 1259 OID 16432)
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO sistadm_write;

--
-- TOC entry 213 (class 1259 OID 16433)
-- Name: documents; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.documents (
    id integer DEFAULT nextval('public.documents_id_seq'::regclass) NOT NULL,
    document_name character varying(255) NOT NULL,
    mime_type character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    is_verified boolean NOT NULL,
    user_id integer,
    file_url character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL
);


ALTER TABLE public.documents OWNER TO sistadm_write;

--
-- TOC entry 232 (class 1259 OID 16619)
-- Name: merit_list_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.merit_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merit_list_id_seq OWNER TO sistadm_write;

--
-- TOC entry 234 (class 1259 OID 16637)
-- Name: merit_list_student_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.merit_list_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merit_list_student_id_seq OWNER TO sistadm_write;

--
-- TOC entry 235 (class 1259 OID 16638)
-- Name: merit_list_students; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.merit_list_students (
    id integer DEFAULT nextval('public.merit_list_student_id_seq'::regclass) NOT NULL,
    merit_list_id integer NOT NULL,
    user_id integer NOT NULL,
    submission_id integer NOT NULL,
    total_merit_score integer NOT NULL
);


ALTER TABLE public.merit_list_students OWNER TO sistadm_write;

--
-- TOC entry 233 (class 1259 OID 16620)
-- Name: merit_lists; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.merit_lists (
    id integer DEFAULT nextval('public.merit_list_id_seq'::regclass) NOT NULL,
    department_code character varying NOT NULL,
    batch_code character varying NOT NULL,
    published_date date,
    last_payment_date date,
    is_published boolean DEFAULT false NOT NULL
);


ALTER TABLE public.merit_lists OWNER TO sistadm_write;

--
-- TOC entry 225 (class 1259 OID 16535)
-- Name: payment_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.payment_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_transactions_id_seq OWNER TO sistadm_write;

--
-- TOC entry 236 (class 1259 OID 16654)
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.payment_transactions (
    id integer DEFAULT nextval('public.payment_transactions_id_seq'::regclass) NOT NULL,
    payment_id integer NOT NULL,
    rp_payment_id character varying(255) NOT NULL,
    amount integer NOT NULL,
    is_success boolean DEFAULT false NOT NULL,
    status character varying(255) NOT NULL,
    metadata text
);


ALTER TABLE public.payment_transactions OWNER TO sistadm_write;

--
-- TOC entry 223 (class 1259 OID 16523)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO sistadm_write;

--
-- TOC entry 224 (class 1259 OID 16524)
-- Name: payments; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.payments (
    id integer DEFAULT nextval('public.payments_id_seq'::regclass) NOT NULL,
    amount integer NOT NULL,
    payment_date date DEFAULT CURRENT_DATE NOT NULL,
    payment_mode character varying(255) DEFAULT 'online'::character varying NOT NULL,
    is_paid boolean DEFAULT false NOT NULL,
    rp_order_id character varying(255) NOT NULL,
    status character varying(50) DEFAULT 'created'::character varying
);


ALTER TABLE public.payments OWNER TO sistadm_write;

--
-- TOC entry 219 (class 1259 OID 16481)
-- Name: school_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.school_id_seq OWNER TO sistadm_write;

--
-- TOC entry 220 (class 1259 OID 16482)
-- Name: school; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.school (
    id integer DEFAULT nextval('public.school_id_seq'::regclass) NOT NULL,
    board character varying(255) NOT NULL,
    year_of_passing integer NOT NULL,
    roll_number character varying(255) NOT NULL,
    percentage double precision NOT NULL,
    document_id integer,
    total_marks double precision,
    marks_obtained double precision,
    school_name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.school OWNER TO sistadm_write;

--
-- TOC entry 230 (class 1259 OID 16590)
-- Name: submission_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_id_seq OWNER TO sistadm_write;

--
-- TOC entry 231 (class 1259 OID 16591)
-- Name: submissions; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.submissions (
    id integer DEFAULT nextval('public.submission_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    department_code character varying NOT NULL,
    batch_code character varying NOT NULL,
    status character varying(255) NOT NULL,
    is_verified boolean DEFAULT false NOT NULL,
    is_admitted boolean DEFAULT false NOT NULL,
    application_id integer NOT NULL,
    merit_list_id integer,
    payment_id integer
);


ALTER TABLE public.submissions OWNER TO sistadm_write;

--
-- TOC entry 228 (class 1259 OID 16573)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sistadm_write
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sistadm_write;

--
-- TOC entry 229 (class 1259 OID 16574)
-- Name: users; Type: TABLE; Schema: public; Owner: sistadm_write
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    email_verified boolean DEFAULT false NOT NULL,
    phone_verified boolean DEFAULT false NOT NULL,
    role character varying(255) DEFAULT 'STUDENT'::character varying NOT NULL,
    application_id integer,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO sistadm_write;

--
-- TOC entry 3499 (class 0 OID 16496)
-- Dependencies: 222
-- Data for Name: academic_details; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.academic_details (id, class_10_school_id, class_12_school_id, diploma_id, jee_mains_rank, jee_mains_marks, jee_advanced_rank, jee_advanced_marks, cuet_rank, cuet_marks, merit_score) FROM stdin;
\.


--
-- TOC entry 3504 (class 0 OID 16546)
-- Dependencies: 227
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.applications (id, basic_details_id, academic_details_id, payment_id, application_type, application_start_date, status) FROM stdin;
44	\N	\N	\N	FRESHER	2023-07-06	DRAFT
\.


--
-- TOC entry 3492 (class 0 OID 16442)
-- Dependencies: 215
-- Data for Name: basic_details; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.basic_details (id, name, dob, gender, category, is_coi, is_pwd, father_name, mother_name, nationality, identity_type, identity_number, identity_document_id, signature_document_id, photo_document_id, email, phone, address) FROM stdin;
\.


--
-- TOC entry 3487 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: batches; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.batches (batch_code, batch_name, department_code, start_year, end_year) FROM stdin;
CSE23	Computer Engineering 2023 - 2027	CSE	2023	2027
CVL23	Civil Engineering 2023 - 2027	CVL	2023	2027
CSE22	Computer Engineering 2022 - 2026	CSE	2022	2026
CVL22	Civil Engineering 2022 - 2026	CVL	2022	2026
\.


--
-- TOC entry 3514 (class 0 OID 16668)
-- Dependencies: 237
-- Data for Name: class_12_marks; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.class_12_marks (id, school_id, marks_obtained, total_marks, is_passed, subject_name) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 16389)
-- Dependencies: 209
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.departments (department_code, department_name) FROM stdin;
CVL	Civil Engineering
CSE	Computer Engineering
\.


--
-- TOC entry 3494 (class 0 OID 16456)
-- Dependencies: 217
-- Data for Name: diploma; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.diploma (id, college_name, department, year_of_passing, cgpa, document_id) FROM stdin;
\.


--
-- TOC entry 3490 (class 0 OID 16433)
-- Dependencies: 213
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.documents (id, document_name, mime_type, key, is_verified, user_id, file_url, status) FROM stdin;
\.


--
-- TOC entry 3512 (class 0 OID 16638)
-- Dependencies: 235
-- Data for Name: merit_list_students; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.merit_list_students (id, merit_list_id, user_id, submission_id, total_merit_score) FROM stdin;
\.


--
-- TOC entry 3510 (class 0 OID 16620)
-- Dependencies: 233
-- Data for Name: merit_lists; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.merit_lists (id, department_code, batch_code, published_date, last_payment_date, is_published) FROM stdin;
\.


--
-- TOC entry 3513 (class 0 OID 16654)
-- Dependencies: 236
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.payment_transactions (id, payment_id, rp_payment_id, amount, is_success, status, metadata) FROM stdin;
\.


--
-- TOC entry 3501 (class 0 OID 16524)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.payments (id, amount, payment_date, payment_mode, is_paid, rp_order_id, status) FROM stdin;
\.


--
-- TOC entry 3497 (class 0 OID 16482)
-- Dependencies: 220
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.school (id, board, year_of_passing, roll_number, percentage, document_id, total_marks, marks_obtained, school_name) FROM stdin;
\.


--
-- TOC entry 3508 (class 0 OID 16591)
-- Dependencies: 231
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.submissions (id, user_id, department_code, batch_code, status, is_verified, is_admitted, application_id, merit_list_id, payment_id) FROM stdin;
\.


--
-- TOC entry 3506 (class 0 OID 16574)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sistadm_write
--

COPY public.users (id, name, email, password, phone, email_verified, phone_verified, role, application_id, is_active) FROM stdin;
10	Bijay Sharma	bijay.sharma@broadcom.com	$2a$14$lWbiDZE6jyLJgP0lXENIBeilRfTHTT3QhSJhQLaGDyCuAG0a9PZZu	9832046671	f	f	ADMIN	\N	t
15	Sefali Basnet	sefali.basnet@gmail.com	$2a$14$VhHaRqE8WPRJ1e2XiHDXvOlwBj9OmmNeCfS/5NhS04BFecib6pu46	8900089820	f	f	STUDENT	\N	t
16	Bijay Sharma	bijay@kloudone.com	$2a$14$9DhfjA1upRD9mz.mkBVM8ej02dJnClmtCkeQ8jQxf5Q7NfQnGlOaC	9832046671	f	f	STUDENT	\N	t
17	Sefali Basnet	sefali@kloudone.com	$2a$14$x.81V8LX5Yz7csFNdItbW.UAp0HIT49YKOrFh5TOAV.TFcT4u5jru	8900089820	f	f	STUDENT	44	t
\.


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 221
-- Name: academic_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.academic_details_id_seq', 30, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 226
-- Name: application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.application_id_seq', 44, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 214
-- Name: basic_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.basic_details_id_seq', 31, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 211
-- Name: class_12_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.class_12_marks_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 216
-- Name: diploma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.diploma_id_seq', 4, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 218
-- Name: diploma_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.diploma_marks_id_seq', 1, false);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 212
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.documents_id_seq', 158, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 232
-- Name: merit_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.merit_list_id_seq', 19, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 234
-- Name: merit_list_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.merit_list_student_id_seq', 1, false);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 225
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.payment_transactions_id_seq', 1, false);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.payments_id_seq', 77, true);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 219
-- Name: school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.school_id_seq', 59, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 230
-- Name: submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.submission_id_seq', 39, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sistadm_write
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- TOC entry 3306 (class 2606 OID 16507)
-- Name: academic_details academic_details_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.academic_details
    ADD CONSTRAINT academic_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 16556)
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 16449)
-- Name: basic_details basic_details_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.basic_details
    ADD CONSTRAINT basic_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 16697)
-- Name: batches batches_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (batch_code);


--
-- TOC entry 3322 (class 2606 OID 16673)
-- Name: class_12_marks class_12_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.class_12_marks
    ADD CONSTRAINT class_12_marks_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 16393)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_code);


--
-- TOC entry 3302 (class 2606 OID 16463)
-- Name: diploma diploma_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.diploma
    ADD CONSTRAINT diploma_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 16440)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16643)
-- Name: merit_list_students merit_list_students_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_list_students
    ADD CONSTRAINT merit_list_students_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 16626)
-- Name: merit_lists merit_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_lists
    ADD CONSTRAINT merit_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 16662)
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16534)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 16489)
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 16598)
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 16584)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 16508)
-- Name: academic_details academic_details_class_10_school_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.academic_details
    ADD CONSTRAINT academic_details_class_10_school_id_fkey FOREIGN KEY (class_10_school_id) REFERENCES public.school(id);


--
-- TOC entry 3329 (class 2606 OID 16513)
-- Name: academic_details academic_details_class_12_school_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.academic_details
    ADD CONSTRAINT academic_details_class_12_school_id_fkey FOREIGN KEY (class_12_school_id) REFERENCES public.school(id);


--
-- TOC entry 3330 (class 2606 OID 16518)
-- Name: academic_details academic_details_diploma_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.academic_details
    ADD CONSTRAINT academic_details_diploma_id_fkey FOREIGN KEY (diploma_id) REFERENCES public.diploma(id);


--
-- TOC entry 3332 (class 2606 OID 16562)
-- Name: applications applications_academic_details_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_academic_details_id_fkey FOREIGN KEY (academic_details_id) REFERENCES public.academic_details(id);


--
-- TOC entry 3331 (class 2606 OID 16557)
-- Name: applications applications_basic_details_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_basic_details_id_fkey FOREIGN KEY (basic_details_id) REFERENCES public.basic_details(id);


--
-- TOC entry 3333 (class 2606 OID 16567)
-- Name: applications applications_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- TOC entry 3325 (class 2606 OID 16450)
-- Name: basic_details basic_details_identity_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.basic_details
    ADD CONSTRAINT basic_details_identity_document_id_fkey FOREIGN KEY (identity_document_id) REFERENCES public.documents(id);


--
-- TOC entry 3323 (class 2606 OID 16710)
-- Name: batches batches_department_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_department_code_fkey FOREIGN KEY (department_code) REFERENCES public.departments(department_code);


--
-- TOC entry 3346 (class 2606 OID 16679)
-- Name: class_12_marks class_12_marks_school_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.class_12_marks
    ADD CONSTRAINT class_12_marks_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.school(id);


--
-- TOC entry 3324 (class 2606 OID 16614)
-- Name: documents documents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3326 (class 2606 OID 16690)
-- Name: diploma fk1_diploma_document_id; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.diploma
    ADD CONSTRAINT fk1_diploma_document_id FOREIGN KEY (document_id) REFERENCES public.documents(id);


--
-- TOC entry 3336 (class 2606 OID 16715)
-- Name: submissions fk1_submissions_applications; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk1_submissions_applications FOREIGN KEY (application_id) REFERENCES public.applications(id);


--
-- TOC entry 3343 (class 2606 OID 16644)
-- Name: merit_list_students merit_list_students_merit_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_list_students
    ADD CONSTRAINT merit_list_students_merit_list_id_fkey FOREIGN KEY (merit_list_id) REFERENCES public.merit_lists(id);


--
-- TOC entry 3344 (class 2606 OID 16649)
-- Name: merit_list_students merit_list_students_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_list_students
    ADD CONSTRAINT merit_list_students_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3342 (class 2606 OID 16747)
-- Name: merit_lists merit_lists_batch_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_lists
    ADD CONSTRAINT merit_lists_batch_code_fkey FOREIGN KEY (batch_code) REFERENCES public.batches(batch_code);


--
-- TOC entry 3341 (class 2606 OID 16740)
-- Name: merit_lists merit_lists_department_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.merit_lists
    ADD CONSTRAINT merit_lists_department_code_fkey FOREIGN KEY (department_code) REFERENCES public.departments(department_code);


--
-- TOC entry 3345 (class 2606 OID 16663)
-- Name: payment_transactions payment_transactions_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- TOC entry 3327 (class 2606 OID 16490)
-- Name: school school_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.documents(id);


--
-- TOC entry 3338 (class 2606 OID 16727)
-- Name: submissions submissions_batch_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_batch_code_fkey FOREIGN KEY (batch_code) REFERENCES public.batches(batch_code);


--
-- TOC entry 3337 (class 2606 OID 16720)
-- Name: submissions submissions_department_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_department_code_fkey FOREIGN KEY (department_code) REFERENCES public.departments(department_code);


--
-- TOC entry 3339 (class 2606 OID 16735)
-- Name: submissions submissions_merit_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_merit_list_id_fkey FOREIGN KEY (merit_list_id) REFERENCES public.merit_lists(id);


--
-- TOC entry 3340 (class 2606 OID 16753)
-- Name: submissions submissions_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- TOC entry 3335 (class 2606 OID 16599)
-- Name: submissions submissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3334 (class 2606 OID 16585)
-- Name: users users_application_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sistadm_write
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_application_id_fkey FOREIGN KEY (application_id) REFERENCES public.applications(id);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO sistadm_write;


-- Completed on 2023-11-08 15:52:20

--
-- PostgreSQL database dump complete
--

