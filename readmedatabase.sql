--
-- PostgreSQL database dump
--

\restrict 4uY3aM37eKz7TX8oLBtfqs3JnaZS0TORX7Nzi9hAwXPfPlPr4Xi9FIl1pDXkB3P

-- Dumped from database version 14.19 (Homebrew)
-- Dumped by pg_dump version 14.19 (Homebrew)

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
-- Name: datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: datasets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasets (
    id integer DEFAULT nextval('public.datasets_id_seq'::regclass) NOT NULL,
    project_id integer NOT NULL,
    name text NOT NULL,
    abstract text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    site text NOT NULL
);



--
-- Name: datasets_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasets_metadata (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL
);



--
-- Name: datasets_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasets_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: datasets_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasets_metadata_id_seq OWNED BY public.datasets_metadata.id;


--
-- Name: datasets_new_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasets_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: datasets_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasets_new_id_seq OWNED BY public.datasets.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    path text,
    file_type text,
    CONSTRAINT file_type_check CHECK ((file_type = ANY (ARRAY['raw'::text, 'processed'::text, 'summarised'::text])))
);



--
-- Name: files_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_metadata (
    metadata_id integer NOT NULL,
    file_id integer,
    metadata_key text NOT NULL,
    metadata_value text NOT NULL
);



--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    project_id integer NOT NULL,
    ext_patient_id text,
    ext_patient_url text,
    public_patient_id text
);



--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: patients_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients_metadata (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    key text,
    value text
);



--
-- Name: patients_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: patients_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_metadata_id_seq OWNED BY public.patients_metadata.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name text NOT NULL,
    status text
);



--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: raw_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raw_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: raw_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raw_files_id_seq OWNED BY public.files.id;


--
-- Name: raw_files_metadata_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raw_files_metadata_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: raw_files_metadata_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raw_files_metadata_metadata_id_seq OWNED BY public.files_metadata.metadata_id;


--
-- Name: samples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samples (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    ext_sample_id text,
    ext_sample_url text
);



--
-- Name: samples_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.samples_id_seq OWNED BY public.samples.id;


--
-- Name: samples_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samples_metadata (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    key text,
    value text
);



--
-- Name: samples_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.samples_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: samples_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.samples_metadata_id_seq OWNED BY public.samples_metadata.id;


--
-- Name: datasets_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets_metadata ALTER COLUMN id SET DEFAULT nextval('public.datasets_metadata_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.raw_files_id_seq'::regclass);


--
-- Name: files_metadata metadata_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata ALTER COLUMN metadata_id SET DEFAULT nextval('public.raw_files_metadata_metadata_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: patients_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients_metadata ALTER COLUMN id SET DEFAULT nextval('public.patients_metadata_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: samples id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples ALTER COLUMN id SET DEFAULT nextval('public.samples_id_seq'::regclass);


--
-- Name: samples_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples_metadata ALTER COLUMN id SET DEFAULT nextval('public.samples_metadata_id_seq'::regclass);


--
-- Data for Name: datasets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datasets (id, project_id, name, abstract, created_at, site) FROM stdin;
7	1	ABC	ABC	2025-10-05 06:26:56.16409	ABC
3	2	DEF	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2025-10-03 14:31:26.589665	WEHI Milton
5	1	Lung Cancer Microbiome	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-05-02 00:00:00	WEHI Milton
6	1	Lung Cancer Clinical Data at ONJ	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-04-03 00:00:00	WEHI Milton
1	1	Whole-exome sequencing of Lung Cancer Tumour-Normal pairs	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-08-15 00:00:00	WEHI Milton
2	1	Lung Cancer CITE-Seq	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-07-12 00:00:00	WEHI Milton
\.


--
-- Data for Name: datasets_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datasets_metadata (id, dataset_id, key, value) FROM stdin;
1	1	location	/vast/projects/P1/P1001
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, dataset_id, path, file_type) FROM stdin;
\.


--
-- Data for Name: files_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_metadata (metadata_id, file_id, metadata_key, metadata_value) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, project_id, ext_patient_id, ext_patient_url, public_patient_id) FROM stdin;
1	1	EXT-P001	https://example.org/patient/EXT-P001	PUB-001
2	1	EXT-P002	https://example.org/patient/EXT-P002	PUB-002
3	1	EXT-P003	https://example.org/patient/EXT-P003	PUB-003
7	2	EXT-P004	https://example.org/patient/EXT-P004	PUB-004
8	3	EXT-P005	https://example.org/patient/EXT-P005	PUB-005
9	3	EXT-P006	https://example.org/patient/EXT-P006	PUB-006
\.


--
-- Data for Name: patients_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients_metadata (id, patient_id, key, value) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, status) FROM stdin;
1	Cancer Genomics Portal	In Progress
2	AI for Pathology	Completed
3	Brain Imaging Dashboard	Pending
\.


--
-- Data for Name: samples; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samples (id, patient_id, ext_sample_id, ext_sample_url) FROM stdin;
1	1	SAMPLE-001-A	https://example.org/sample/SAMPLE-001-A
2	2	SAMPLE-002-A	https://example.org/sample/SAMPLE-002-A
3	3	SAMPLE-003-A	https://example.org/sample/SAMPLE-003-A
\.


--
-- Data for Name: samples_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samples_metadata (id, sample_id, key, value) FROM stdin;
\.


--
-- Name: datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasets_id_seq', 7, true);


--
-- Name: datasets_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasets_metadata_id_seq', 1, true);


--
-- Name: datasets_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasets_new_id_seq', 1, false);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_id_seq', 9, true);


--
-- Name: patients_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_metadata_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: raw_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_files_id_seq', 1, true);


--
-- Name: raw_files_metadata_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_files_metadata_metadata_id_seq', 1, false);


--
-- Name: samples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.samples_id_seq', 3, true);


--
-- Name: samples_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.samples_metadata_id_seq', 1, false);


--
-- Name: datasets_metadata datasets_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets_metadata
    ADD CONSTRAINT datasets_metadata_pkey PRIMARY KEY (id);


--
-- Name: datasets datasets_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_new_pkey PRIMARY KEY (id);


--
-- Name: patients_metadata patients_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients_metadata
    ADD CONSTRAINT patients_metadata_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: files_metadata raw_files_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata
    ADD CONSTRAINT raw_files_metadata_pkey PRIMARY KEY (metadata_id);


--
-- Name: files raw_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT raw_files_pkey PRIMARY KEY (id);


--
-- Name: samples_metadata samples_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples_metadata
    ADD CONSTRAINT samples_metadata_pkey PRIMARY KEY (id);


--
-- Name: samples samples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_pkey PRIMARY KEY (id);


--
-- Name: datasets_metadata datasets_metadata_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets_metadata
    ADD CONSTRAINT datasets_metadata_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id);


--
-- Name: datasets datasets_new_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_new_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: patients_metadata patients_metadata_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients_metadata
    ADD CONSTRAINT patients_metadata_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: patients patients_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: files raw_files_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT raw_files_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id);


--
-- Name: files_metadata raw_files_metadata_raw_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata
    ADD CONSTRAINT raw_files_metadata_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id);


--
-- Name: samples_metadata samples_metadata_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples_metadata
    ADD CONSTRAINT samples_metadata_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.samples(id);


--
-- Name: samples samples_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--



--
-- PostgreSQL database dump complete
--

\unrestrict 4uY3aM37eKz7TX8oLBtfqs3JnaZS0TORX7Nzi9hAwXPfPlPr4Xi9FIl1pDXkB3P

