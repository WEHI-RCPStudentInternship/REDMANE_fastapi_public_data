--
-- PostgreSQL database dump
--

\restrict 2YXmrci7yX56bNjsMPGaQlKad82e5Ynv7YCVwBh0tYsoDsnzWxOAHZGBHlne08x

-- Dumped from database version 18.3 (Homebrew)
-- Dumped by pg_dump version 18.3

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: datasets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasets (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name text NOT NULL,
    abstract text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    site text NOT NULL
);


ALTER TABLE public.datasets OWNER TO postgres;

--
-- Name: datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datasets_id_seq OWNER TO postgres;

--
-- Name: datasets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasets_id_seq OWNED BY public.datasets.id;


--
-- Name: datasets_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasets_metadata (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    key text,
    value text
);


ALTER TABLE public.datasets_metadata OWNER TO postgres;

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


ALTER SEQUENCE public.datasets_metadata_id_seq OWNER TO postgres;

--
-- Name: datasets_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasets_metadata_id_seq OWNED BY public.datasets_metadata.id;


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


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_metadata (
    metadata_id integer NOT NULL,
    file_id integer,
    metadata_key text NOT NULL,
    metadata_value text NOT NULL
);


ALTER TABLE public.files_metadata OWNER TO postgres;

--
-- Name: files_metadata_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_metadata_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_metadata_metadata_id_seq OWNER TO postgres;

--
-- Name: files_metadata_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_metadata_metadata_id_seq OWNED BY public.files_metadata.metadata_id;


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


ALTER TABLE public.patients OWNER TO postgres;

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


ALTER SEQUENCE public.patients_id_seq OWNER TO postgres;

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


ALTER TABLE public.patients_metadata OWNER TO postgres;

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


ALTER SEQUENCE public.patients_metadata_id_seq OWNER TO postgres;

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


ALTER TABLE public.projects OWNER TO postgres;

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


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: samples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samples (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    ext_sample_id text,
    ext_sample_url text
);


ALTER TABLE public.samples OWNER TO postgres;

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


ALTER SEQUENCE public.samples_id_seq OWNER TO postgres;

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


ALTER TABLE public.samples_metadata OWNER TO postgres;

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


ALTER SEQUENCE public.samples_metadata_id_seq OWNER TO postgres;

--
-- Name: samples_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.samples_metadata_id_seq OWNED BY public.samples_metadata.id;


--
-- Name: datasets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets ALTER COLUMN id SET DEFAULT nextval('public.datasets_id_seq'::regclass);


--
-- Name: datasets_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets_metadata ALTER COLUMN id SET DEFAULT nextval('public.datasets_metadata_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_metadata metadata_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata ALTER COLUMN metadata_id SET DEFAULT nextval('public.files_metadata_metadata_id_seq'::regclass);


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
1	1	Whole-exome sequencing of Lung Cancer Tumour-Normal pairs	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-04-03 00:00:00	WEHI Milton
2	1	Lung Cancer CITE-Seq	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-05-02 00:00:00	WEHI Milton
3	1	Lung Cancer Microbiome	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-07-12 00:00:00	WEHI Milton
4	1	Lung Cancer Clinical Data at ONJ	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta nibh venenatis cras sed felis eget velit. Cum sociis natoque penatibus et magnis dis parturient montes. Egestas purus viverra accumsan in nisl nisi scelerisque eu. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. Risus quis varius quam quisque id diam vel quam elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi blandit cursus risus at ultrices mi tempus imperdiet.\n\nSed pulvinar proin gravida hendrerit lectus a. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Non blandit massa enim nec dui nunc mattis enim ut. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Gravida arcu ac tortor dignissim convallis aenean et. Nulla at volutpat diam ut venenatis tellus in metus.\n\nTurpis egestas sed tempus urna et pharetra pharetra massa. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae.	2024-08-15 00:00:00	WEHI Milton
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
10	1	PatientID001_DiseaseX	https://example.org/patient/PatientID001_DiseaseX	PUB-001
11	1	PatientID002_DiseaseX	https://example.org/patient/PatientID002_DiseaseX	PUB-002
12	1	PatientID003_DiseaseX	https://example.org/patient/PatientID003_DiseaseX	PUB-003
13	1	PatientID004_DiseaseX	https://example.org/patient/PatientID004_DiseaseX	PUB-004
14	1	PatientID005_DiseaseX	https://example.org/patient/PatientID005_DiseaseX	PUB-005
15	1	PatientID006_DiseaseX	https://example.org/patient/PatientID006_DiseaseX	PUB-006
16	1	PatientID007_DiseaseX	https://example.org/patient/PatientID007_DiseaseX	PUB-007
17	1	PatientID008_DiseaseX	https://example.org/patient/PatientID008_DiseaseX	PUB-008
18	1	PatientID009_DiseaseX	https://example.org/patient/PatientID009_DiseaseX	PUB-009
19	1	PatientID010_DiseaseX	https://example.org/patient/PatientID010_DiseaseX	PUB-010
20	1	PatientID011_DiseaseX	https://example.org/patient/PatientID011_DiseaseX	PUB-011
21	1	PatientID012_DiseaseX	https://example.org/patient/PatientID012_DiseaseX	PUB-012
22	1	PatientID013_DiseaseX	https://example.org/patient/PatientID013_DiseaseX	PUB-013
23	1	PatientID014_DiseaseX	https://example.org/patient/PatientID014_DiseaseX	PUB-014
24	1	PatientID015_DiseaseX	https://example.org/patient/PatientID015_DiseaseX	PUB-015
25	1	PatientID016_DiseaseX	https://example.org/patient/PatientID016_DiseaseX	PUB-016
26	1	PatientID017_DiseaseX	https://example.org/patient/PatientID017_DiseaseX	PUB-017
27	1	PatientID018_DiseaseX	https://example.org/patient/PatientID018_DiseaseX	PUB-018
28	1	PatientID019_DiseaseX	https://example.org/patient/PatientID019_DiseaseX	PUB-019
29	1	PatientID020_DiseaseX	https://example.org/patient/PatientID020_DiseaseX	PUB-020
30	1	PatientID021_DiseaseX	https://example.org/patient/PatientID021_DiseaseX	PUB-021
31	1	PatientID022_DiseaseX	https://example.org/patient/PatientID022_DiseaseX	PUB-022
32	1	PatientID023_DiseaseX	https://example.org/patient/PatientID023_DiseaseX	PUB-023
33	1	PatientID024_DiseaseX	https://example.org/patient/PatientID024_DiseaseX	PUB-024
34	1	PatientID025_DiseaseX	https://example.org/patient/PatientID025_DiseaseX	PUB-025
35	1	PatientID026_DiseaseX	https://example.org/patient/PatientID026_DiseaseX	PUB-026
36	1	PatientID027_DiseaseX	https://example.org/patient/PatientID027_DiseaseX	PUB-027
37	1	PatientID028_DiseaseX	https://example.org/patient/PatientID028_DiseaseX	PUB-028
38	1	PatientID029_DiseaseX	https://example.org/patient/PatientID029_DiseaseX	PUB-029
39	1	PatientID030_DiseaseX	https://example.org/patient/PatientID030_DiseaseX	PUB-030
40	1	PatientID031_DiseaseX	https://example.org/patient/PatientID031_DiseaseX	PUB-031
41	1	PatientID032_DiseaseX	https://example.org/patient/PatientID032_DiseaseX	PUB-032
42	1	PatientID033_DiseaseX	https://example.org/patient/PatientID033_DiseaseX	PUB-033
43	1	PatientID034_DiseaseX	https://example.org/patient/PatientID034_DiseaseX	PUB-034
44	1	PatientID035_DiseaseX	https://example.org/patient/PatientID035_DiseaseX	PUB-035
45	1	PatientID036_DiseaseX	https://example.org/patient/PatientID036_DiseaseX	PUB-036
46	1	PatientID037_DiseaseX	https://example.org/patient/PatientID037_DiseaseX	PUB-037
47	1	PatientID038_DiseaseX	https://example.org/patient/PatientID038_DiseaseX	PUB-038
48	1	PatientID039_DiseaseX	https://example.org/patient/PatientID039_DiseaseX	PUB-039
49	1	PatientID040_DiseaseX	https://example.org/patient/PatientID040_DiseaseX	PUB-040
50	1	PatientID041_DiseaseX	https://example.org/patient/PatientID041_DiseaseX	PUB-041
51	1	PatientID042_DiseaseX	https://example.org/patient/PatientID042_DiseaseX	PUB-042
52	1	PatientID043_DiseaseX	https://example.org/patient/PatientID043_DiseaseX	PUB-043
53	1	PatientID044_DiseaseX	https://example.org/patient/PatientID044_DiseaseX	PUB-044
54	1	PatientID045_DiseaseX	https://example.org/patient/PatientID045_DiseaseX	PUB-045
55	1	PatientID046_DiseaseX	https://example.org/patient/PatientID046_DiseaseX	PUB-046
56	1	PatientID047_DiseaseX	https://example.org/patient/PatientID047_DiseaseX	PUB-047
57	1	PatientID048_DiseaseX	https://example.org/patient/PatientID048_DiseaseX	PUB-048
58	1	PatientID049_DiseaseX	https://example.org/patient/PatientID049_DiseaseX	PUB-049
59	1	PatientID050_DiseaseX	https://example.org/patient/PatientID050_DiseaseX	PUB-050
60	1	PatientID051_DiseaseX	https://example.org/patient/PatientID051_DiseaseX	PUB-051
61	1	PatientID052_DiseaseX	https://example.org/patient/PatientID052_DiseaseX	PUB-052
62	1	PatientID053_DiseaseX	https://example.org/patient/PatientID053_DiseaseX	PUB-053
63	1	PatientID054_DiseaseX	https://example.org/patient/PatientID054_DiseaseX	PUB-054
64	1	PatientID055_DiseaseX	https://example.org/patient/PatientID055_DiseaseX	PUB-055
65	1	PatientID056_DiseaseX	https://example.org/patient/PatientID056_DiseaseX	PUB-056
66	1	PatientID057_DiseaseX	https://example.org/patient/PatientID057_DiseaseX	PUB-057
67	1	PatientID058_DiseaseX	https://example.org/patient/PatientID058_DiseaseX	PUB-058
68	1	PatientID059_DiseaseX	https://example.org/patient/PatientID059_DiseaseX	PUB-059
69	1	PatientID060_DiseaseX	https://example.org/patient/PatientID060_DiseaseX	PUB-060
70	1	PatientID061_DiseaseX	https://example.org/patient/PatientID061_DiseaseX	PUB-061
71	1	PatientID062_DiseaseX	https://example.org/patient/PatientID062_DiseaseX	PUB-062
72	1	PatientID063_DiseaseX	https://example.org/patient/PatientID063_DiseaseX	PUB-063
73	1	PatientID064_DiseaseX	https://example.org/patient/PatientID064_DiseaseX	PUB-064
74	1	PatientID065_DiseaseX	https://example.org/patient/PatientID065_DiseaseX	PUB-065
75	1	PatientID066_DiseaseX	https://example.org/patient/PatientID066_DiseaseX	PUB-066
76	1	PatientID067_DiseaseX	https://example.org/patient/PatientID067_DiseaseX	PUB-067
77	1	PatientID068_DiseaseX	https://example.org/patient/PatientID068_DiseaseX	PUB-068
78	1	PatientID069_DiseaseX	https://example.org/patient/PatientID069_DiseaseX	PUB-069
79	1	PatientID070_DiseaseX	https://example.org/patient/PatientID070_DiseaseX	PUB-070
80	1	PatientID071_DiseaseX	https://example.org/patient/PatientID071_DiseaseX	PUB-071
81	1	PatientID072_DiseaseX	https://example.org/patient/PatientID072_DiseaseX	PUB-072
82	1	PatientID073_DiseaseX	https://example.org/patient/PatientID073_DiseaseX	PUB-073
83	1	PatientID074_DiseaseX	https://example.org/patient/PatientID074_DiseaseX	PUB-074
84	1	PatientID075_DiseaseX	https://example.org/patient/PatientID075_DiseaseX	PUB-075
85	1	PatientID076_DiseaseX	https://example.org/patient/PatientID076_DiseaseX	PUB-076
86	1	PatientID077_DiseaseX	https://example.org/patient/PatientID077_DiseaseX	PUB-077
87	1	PatientID078_DiseaseX	https://example.org/patient/PatientID078_DiseaseX	PUB-078
88	1	PatientID079_DiseaseX	https://example.org/patient/PatientID079_DiseaseX	PUB-079
89	1	PatientID080_DiseaseX	https://example.org/patient/PatientID080_DiseaseX	PUB-080
90	1	PatientID081_DiseaseX	https://example.org/patient/PatientID081_DiseaseX	PUB-081
91	1	PatientID082_DiseaseX	https://example.org/patient/PatientID082_DiseaseX	PUB-082
92	1	PatientID083_DiseaseX	https://example.org/patient/PatientID083_DiseaseX	PUB-083
93	1	PatientID084_DiseaseX	https://example.org/patient/PatientID084_DiseaseX	PUB-084
94	1	PatientID085_DiseaseX	https://example.org/patient/PatientID085_DiseaseX	PUB-085
95	1	PatientID086_DiseaseX	https://example.org/patient/PatientID086_DiseaseX	PUB-086
96	1	PatientID087_DiseaseX	https://example.org/patient/PatientID087_DiseaseX	PUB-087
97	1	PatientID088_DiseaseX	https://example.org/patient/PatientID088_DiseaseX	PUB-088
98	1	PatientID089_DiseaseX	https://example.org/patient/PatientID089_DiseaseX	PUB-089
99	1	PatientID090_DiseaseX	https://example.org/patient/PatientID090_DiseaseX	PUB-090
100	1	PatientID091_DiseaseX	https://example.org/patient/PatientID091_DiseaseX	PUB-091
101	1	PatientID092_DiseaseX	https://example.org/patient/PatientID092_DiseaseX	PUB-092
102	1	PatientID093_DiseaseX	https://example.org/patient/PatientID093_DiseaseX	PUB-093
103	1	PatientID094_DiseaseX	https://example.org/patient/PatientID094_DiseaseX	PUB-094
104	1	PatientID095_DiseaseX	https://example.org/patient/PatientID095_DiseaseX	PUB-095
105	1	PatientID096_DiseaseX	https://example.org/patient/PatientID096_DiseaseX	PUB-096
106	1	PatientID097_DiseaseX	https://example.org/patient/PatientID097_DiseaseX	PUB-097
107	1	PatientID098_DiseaseX	https://example.org/patient/PatientID098_DiseaseX	PUB-098
108	1	PatientID099_DiseaseX	https://example.org/patient/PatientID099_DiseaseX	PUB-099
109	1	PatientID100_DiseaseX	https://example.org/patient/PatientID100_DiseaseX	PUB-100
110	1	PatientID101_DiseaseX	https://example.org/patient/PatientID101_DiseaseX	PUB-101
111	1	PatientID102_DiseaseX	https://example.org/patient/PatientID102_DiseaseX	PUB-102
112	1	PatientID103_DiseaseX	https://example.org/patient/PatientID103_DiseaseX	PUB-103
113	1	PatientID104_DiseaseX	https://example.org/patient/PatientID104_DiseaseX	PUB-104
114	1	PatientID105_DiseaseX	https://example.org/patient/PatientID105_DiseaseX	PUB-105
115	1	PatientID106_DiseaseX	https://example.org/patient/PatientID106_DiseaseX	PUB-106
116	1	PatientID107_DiseaseX	https://example.org/patient/PatientID107_DiseaseX	PUB-107
117	1	PatientID108_DiseaseX	https://example.org/patient/PatientID108_DiseaseX	PUB-108
118	1	PatientID109_DiseaseX	https://example.org/patient/PatientID109_DiseaseX	PUB-109
119	1	PatientID110_DiseaseX	https://example.org/patient/PatientID110_DiseaseX	PUB-110
120	1	PatientID111_DiseaseX	https://example.org/patient/PatientID111_DiseaseX	PUB-111
121	1	PatientID112_DiseaseX	https://example.org/patient/PatientID112_DiseaseX	PUB-112
122	1	PatientID113_DiseaseX	https://example.org/patient/PatientID113_DiseaseX	PUB-113
123	1	PatientID114_DiseaseX	https://example.org/patient/PatientID114_DiseaseX	PUB-114
124	1	PatientID115_DiseaseX	https://example.org/patient/PatientID115_DiseaseX	PUB-115
125	1	PatientID116_DiseaseX	https://example.org/patient/PatientID116_DiseaseX	PUB-116
126	1	PatientID117_DiseaseX	https://example.org/patient/PatientID117_DiseaseX	PUB-117
127	1	PatientID118_DiseaseX	https://example.org/patient/PatientID118_DiseaseX	PUB-118
128	1	PatientID119_DiseaseX	https://example.org/patient/PatientID119_DiseaseX	PUB-119
129	1	PatientID120_DiseaseX	https://example.org/patient/PatientID120_DiseaseX	PUB-120
130	1	PatientID121_DiseaseX	https://example.org/patient/PatientID121_DiseaseX	PUB-121
131	1	PatientID122_DiseaseX	https://example.org/patient/PatientID122_DiseaseX	PUB-122
132	1	PatientID123_DiseaseX	https://example.org/patient/PatientID123_DiseaseX	PUB-123
133	1	PatientID124_DiseaseX	https://example.org/patient/PatientID124_DiseaseX	PUB-124
134	1	PatientID125_DiseaseX	https://example.org/patient/PatientID125_DiseaseX	PUB-125
135	1	PatientID126_DiseaseX	https://example.org/patient/PatientID126_DiseaseX	PUB-126
136	1	PatientID127_DiseaseX	https://example.org/patient/PatientID127_DiseaseX	PUB-127
137	1	PatientID128_DiseaseX	https://example.org/patient/PatientID128_DiseaseX	PUB-128
138	1	PatientID129_DiseaseX	https://example.org/patient/PatientID129_DiseaseX	PUB-129
139	1	PatientID130_DiseaseX	https://example.org/patient/PatientID130_DiseaseX	PUB-130
140	1	PatientID131_DiseaseX	https://example.org/patient/PatientID131_DiseaseX	PUB-131
141	1	PatientID132_DiseaseX	https://example.org/patient/PatientID132_DiseaseX	PUB-132
142	1	PatientID133_DiseaseX	https://example.org/patient/PatientID133_DiseaseX	PUB-133
143	1	PatientID134_DiseaseX	https://example.org/patient/PatientID134_DiseaseX	PUB-134
144	1	PatientID135_DiseaseX	https://example.org/patient/PatientID135_DiseaseX	PUB-135
145	1	PatientID136_DiseaseX	https://example.org/patient/PatientID136_DiseaseX	PUB-136
146	1	PatientID137_DiseaseX	https://example.org/patient/PatientID137_DiseaseX	PUB-137
147	1	PatientID138_DiseaseX	https://example.org/patient/PatientID138_DiseaseX	PUB-138
148	1	PatientID139_DiseaseX	https://example.org/patient/PatientID139_DiseaseX	PUB-139
149	1	PatientID140_DiseaseX	https://example.org/patient/PatientID140_DiseaseX	PUB-140
150	1	PatientID141_DiseaseX	https://example.org/patient/PatientID141_DiseaseX	PUB-141
151	1	PatientID142_DiseaseX	https://example.org/patient/PatientID142_DiseaseX	PUB-142
152	1	PatientID143_DiseaseX	https://example.org/patient/PatientID143_DiseaseX	PUB-143
153	1	PatientID144_DiseaseX	https://example.org/patient/PatientID144_DiseaseX	PUB-144
154	1	PatientID145_DiseaseX	https://example.org/patient/PatientID145_DiseaseX	PUB-145
155	1	PatientID146_DiseaseX	https://example.org/patient/PatientID146_DiseaseX	PUB-146
156	1	PatientID147_DiseaseX	https://example.org/patient/PatientID147_DiseaseX	PUB-147
157	1	PatientID148_DiseaseX	https://example.org/patient/PatientID148_DiseaseX	PUB-148
158	1	PatientID149_DiseaseX	https://example.org/patient/PatientID149_DiseaseX	PUB-149
159	1	PatientID150_DiseaseX	https://example.org/patient/PatientID150_DiseaseX	PUB-150
160	1	PatientID151_DiseaseX	https://example.org/patient/PatientID151_DiseaseX	PUB-151
161	1	PatientID152_DiseaseX	https://example.org/patient/PatientID152_DiseaseX	PUB-152
162	1	PatientID153_DiseaseX	https://example.org/patient/PatientID153_DiseaseX	PUB-153
163	1	PatientID154_DiseaseX	https://example.org/patient/PatientID154_DiseaseX	PUB-154
164	1	PatientID155_DiseaseX	https://example.org/patient/PatientID155_DiseaseX	PUB-155
165	1	PatientID156_DiseaseX	https://example.org/patient/PatientID156_DiseaseX	PUB-156
166	1	PatientID157_DiseaseX	https://example.org/patient/PatientID157_DiseaseX	PUB-157
167	1	PatientID158_DiseaseX	https://example.org/patient/PatientID158_DiseaseX	PUB-158
168	1	PatientID159_DiseaseX	https://example.org/patient/PatientID159_DiseaseX	PUB-159
169	1	PatientID160_DiseaseX	https://example.org/patient/PatientID160_DiseaseX	PUB-160
170	1	PatientID161_DiseaseX	https://example.org/patient/PatientID161_DiseaseX	PUB-161
171	1	PatientID162_DiseaseX	https://example.org/patient/PatientID162_DiseaseX	PUB-162
172	1	PatientID163_DiseaseX	https://example.org/patient/PatientID163_DiseaseX	PUB-163
173	1	PatientID164_DiseaseX	https://example.org/patient/PatientID164_DiseaseX	PUB-164
174	1	PatientID165_DiseaseX	https://example.org/patient/PatientID165_DiseaseX	PUB-165
175	1	PatientID166_DiseaseX	https://example.org/patient/PatientID166_DiseaseX	PUB-166
176	1	PatientID167_DiseaseX	https://example.org/patient/PatientID167_DiseaseX	PUB-167
177	1	PatientID168_DiseaseX	https://example.org/patient/PatientID168_DiseaseX	PUB-168
178	1	PatientID169_DiseaseX	https://example.org/patient/PatientID169_DiseaseX	PUB-169
179	1	PatientID170_DiseaseX	https://example.org/patient/PatientID170_DiseaseX	PUB-170
180	1	PatientID171_DiseaseX	https://example.org/patient/PatientID171_DiseaseX	PUB-171
181	1	PatientID172_DiseaseX	https://example.org/patient/PatientID172_DiseaseX	PUB-172
182	1	PatientID173_DiseaseX	https://example.org/patient/PatientID173_DiseaseX	PUB-173
183	1	PatientID174_DiseaseX	https://example.org/patient/PatientID174_DiseaseX	PUB-174
184	1	PatientID175_DiseaseX	https://example.org/patient/PatientID175_DiseaseX	PUB-175
185	1	PatientID176_DiseaseX	https://example.org/patient/PatientID176_DiseaseX	PUB-176
186	1	PatientID177_DiseaseX	https://example.org/patient/PatientID177_DiseaseX	PUB-177
187	1	PatientID178_DiseaseX	https://example.org/patient/PatientID178_DiseaseX	PUB-178
188	1	PatientID179_DiseaseX	https://example.org/patient/PatientID179_DiseaseX	PUB-179
189	1	PatientID180_DiseaseX	https://example.org/patient/PatientID180_DiseaseX	PUB-180
190	1	PatientID181_DiseaseX	https://example.org/patient/PatientID181_DiseaseX	PUB-181
191	1	PatientID182_DiseaseX	https://example.org/patient/PatientID182_DiseaseX	PUB-182
192	1	PatientID183_DiseaseX	https://example.org/patient/PatientID183_DiseaseX	PUB-183
193	1	PatientID184_DiseaseX	https://example.org/patient/PatientID184_DiseaseX	PUB-184
194	1	PatientID185_DiseaseX	https://example.org/patient/PatientID185_DiseaseX	PUB-185
195	1	PatientID186_DiseaseX	https://example.org/patient/PatientID186_DiseaseX	PUB-186
196	1	PatientID187_DiseaseX	https://example.org/patient/PatientID187_DiseaseX	PUB-187
197	1	PatientID188_DiseaseX	https://example.org/patient/PatientID188_DiseaseX	PUB-188
198	1	PatientID189_DiseaseX	https://example.org/patient/PatientID189_DiseaseX	PUB-189
199	1	PatientID190_DiseaseX	https://example.org/patient/PatientID190_DiseaseX	PUB-190
200	1	PatientID191_DiseaseX	https://example.org/patient/PatientID191_DiseaseX	PUB-191
201	1	PatientID192_DiseaseX	https://example.org/patient/PatientID192_DiseaseX	PUB-192
202	1	PatientID193_DiseaseX	https://example.org/patient/PatientID193_DiseaseX	PUB-193
203	1	PatientID194_DiseaseX	https://example.org/patient/PatientID194_DiseaseX	PUB-194
204	1	PatientID195_DiseaseX	https://example.org/patient/PatientID195_DiseaseX	PUB-195
205	1	PatientID196_DiseaseX	https://example.org/patient/PatientID196_DiseaseX	PUB-196
206	1	PatientID197_DiseaseX	https://example.org/patient/PatientID197_DiseaseX	PUB-197
207	1	PatientID198_DiseaseX	https://example.org/patient/PatientID198_DiseaseX	PUB-198
208	1	PatientID199_DiseaseX	https://example.org/patient/PatientID199_DiseaseX	PUB-199
209	1	PatientID200_DiseaseX	https://example.org/patient/PatientID200_DiseaseX	PUB-200
\.


--
-- Data for Name: patients_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients_metadata (id, patient_id, key, value) FROM stdin;
2	10	age	49
3	11	age	51
4	12	age	72
5	10	country	Australia
6	12	country	Australia
7	11	country	New Zealand
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
4	10	XY001	https://example.org/sample/XY001
5	11	XY002	https://example.org/sample/XY002
6	12	XY003	https://example.org/sample/XY003
7	13	XY004	https://example.org/sample/XY004
8	14	XY005	https://example.org/sample/XY005
9	15	XY006	https://example.org/sample/XY006
10	16	XY007	https://example.org/sample/XY007
11	17	XY008	https://example.org/sample/XY008
12	18	XY009	https://example.org/sample/XY009
13	19	XY010	https://example.org/sample/XY010
14	20	XY011	https://example.org/sample/XY011
15	21	XY012	https://example.org/sample/XY012
16	22	XY013	https://example.org/sample/XY013
17	23	XY014	https://example.org/sample/XY014
18	24	XY015	https://example.org/sample/XY015
19	25	XY016	https://example.org/sample/XY016
20	26	XY017	https://example.org/sample/XY017
21	27	XY018	https://example.org/sample/XY018
22	28	XY019	https://example.org/sample/XY019
23	29	XY020	https://example.org/sample/XY020
24	30	XY021	https://example.org/sample/XY021
25	31	XY022	https://example.org/sample/XY022
26	32	XY023	https://example.org/sample/XY023
27	33	XY024	https://example.org/sample/XY024
28	34	XY025	https://example.org/sample/XY025
29	35	XY026	https://example.org/sample/XY026
30	36	XY027	https://example.org/sample/XY027
31	37	XY028	https://example.org/sample/XY028
32	38	XY029	https://example.org/sample/XY029
33	39	XY030	https://example.org/sample/XY030
34	40	XY031	https://example.org/sample/XY031
35	41	XY032	https://example.org/sample/XY032
36	42	XY033	https://example.org/sample/XY033
37	43	XY034	https://example.org/sample/XY034
38	44	XY035	https://example.org/sample/XY035
39	45	XY036	https://example.org/sample/XY036
40	46	XY037	https://example.org/sample/XY037
41	47	XY038	https://example.org/sample/XY038
42	48	XY039	https://example.org/sample/XY039
43	49	XY040	https://example.org/sample/XY040
44	50	XY041	https://example.org/sample/XY041
45	51	XY042	https://example.org/sample/XY042
46	52	XY043	https://example.org/sample/XY043
47	53	XY044	https://example.org/sample/XY044
48	54	XY045	https://example.org/sample/XY045
49	55	XY046	https://example.org/sample/XY046
50	56	XY047	https://example.org/sample/XY047
51	57	XY048	https://example.org/sample/XY048
52	58	XY049	https://example.org/sample/XY049
53	59	XY050	https://example.org/sample/XY050
54	60	XY051	https://example.org/sample/XY051
55	61	XY052	https://example.org/sample/XY052
56	62	XY053	https://example.org/sample/XY053
57	63	XY054	https://example.org/sample/XY054
58	64	XY055	https://example.org/sample/XY055
59	65	XY056	https://example.org/sample/XY056
60	66	XY057	https://example.org/sample/XY057
61	67	XY058	https://example.org/sample/XY058
62	68	XY059	https://example.org/sample/XY059
63	69	XY060	https://example.org/sample/XY060
64	70	XY061	https://example.org/sample/XY061
65	71	XY062	https://example.org/sample/XY062
66	72	XY063	https://example.org/sample/XY063
67	73	XY064	https://example.org/sample/XY064
68	74	XY065	https://example.org/sample/XY065
69	75	XY066	https://example.org/sample/XY066
70	76	XY067	https://example.org/sample/XY067
71	77	XY068	https://example.org/sample/XY068
72	78	XY069	https://example.org/sample/XY069
73	79	XY070	https://example.org/sample/XY070
74	80	XY071	https://example.org/sample/XY071
75	81	XY072	https://example.org/sample/XY072
76	82	XY073	https://example.org/sample/XY073
77	83	XY074	https://example.org/sample/XY074
78	84	XY075	https://example.org/sample/XY075
79	85	XY076	https://example.org/sample/XY076
80	86	XY077	https://example.org/sample/XY077
81	87	XY078	https://example.org/sample/XY078
82	88	XY079	https://example.org/sample/XY079
83	89	XY080	https://example.org/sample/XY080
84	90	XY081	https://example.org/sample/XY081
85	91	XY082	https://example.org/sample/XY082
86	92	XY083	https://example.org/sample/XY083
87	93	XY084	https://example.org/sample/XY084
88	94	XY085	https://example.org/sample/XY085
89	95	XY086	https://example.org/sample/XY086
90	96	XY087	https://example.org/sample/XY087
91	97	XY088	https://example.org/sample/XY088
92	98	XY089	https://example.org/sample/XY089
93	99	XY090	https://example.org/sample/XY090
94	100	XY091	https://example.org/sample/XY091
95	101	XY092	https://example.org/sample/XY092
96	102	XY093	https://example.org/sample/XY093
97	103	XY094	https://example.org/sample/XY094
98	104	XY095	https://example.org/sample/XY095
99	105	XY096	https://example.org/sample/XY096
100	106	XY097	https://example.org/sample/XY097
101	107	XY098	https://example.org/sample/XY098
102	108	XY099	https://example.org/sample/XY099
103	109	XY100	https://example.org/sample/XY100
104	110	XY101	https://example.org/sample/XY101
105	111	XY102	https://example.org/sample/XY102
106	112	XY103	https://example.org/sample/XY103
107	113	XY104	https://example.org/sample/XY104
108	114	XY105	https://example.org/sample/XY105
109	115	XY106	https://example.org/sample/XY106
110	116	XY107	https://example.org/sample/XY107
111	117	XY108	https://example.org/sample/XY108
112	118	XY109	https://example.org/sample/XY109
113	119	XY110	https://example.org/sample/XY110
114	120	XY111	https://example.org/sample/XY111
115	121	XY112	https://example.org/sample/XY112
116	122	XY113	https://example.org/sample/XY113
117	123	XY114	https://example.org/sample/XY114
118	124	XY115	https://example.org/sample/XY115
119	125	XY116	https://example.org/sample/XY116
120	126	XY117	https://example.org/sample/XY117
121	127	XY118	https://example.org/sample/XY118
122	128	XY119	https://example.org/sample/XY119
123	129	XY120	https://example.org/sample/XY120
124	130	XY121	https://example.org/sample/XY121
125	131	XY122	https://example.org/sample/XY122
126	132	XY123	https://example.org/sample/XY123
127	133	XY124	https://example.org/sample/XY124
128	134	XY125	https://example.org/sample/XY125
129	135	XY126	https://example.org/sample/XY126
130	136	XY127	https://example.org/sample/XY127
131	137	XY128	https://example.org/sample/XY128
132	138	XY129	https://example.org/sample/XY129
133	139	XY130	https://example.org/sample/XY130
134	140	XY131	https://example.org/sample/XY131
135	141	XY132	https://example.org/sample/XY132
136	142	XY133	https://example.org/sample/XY133
137	143	XY134	https://example.org/sample/XY134
138	144	XY135	https://example.org/sample/XY135
139	145	XY136	https://example.org/sample/XY136
140	146	XY137	https://example.org/sample/XY137
141	147	XY138	https://example.org/sample/XY138
142	148	XY139	https://example.org/sample/XY139
143	149	XY140	https://example.org/sample/XY140
144	150	XY141	https://example.org/sample/XY141
145	151	XY142	https://example.org/sample/XY142
146	152	XY143	https://example.org/sample/XY143
147	153	XY144	https://example.org/sample/XY144
148	154	XY145	https://example.org/sample/XY145
149	155	XY146	https://example.org/sample/XY146
150	156	XY147	https://example.org/sample/XY147
151	157	XY148	https://example.org/sample/XY148
152	158	XY149	https://example.org/sample/XY149
153	159	XY150	https://example.org/sample/XY150
154	160	XY151	https://example.org/sample/XY151
155	161	XY152	https://example.org/sample/XY152
156	162	XY153	https://example.org/sample/XY153
157	163	XY154	https://example.org/sample/XY154
158	164	XY155	https://example.org/sample/XY155
159	165	XY156	https://example.org/sample/XY156
160	166	XY157	https://example.org/sample/XY157
161	167	XY158	https://example.org/sample/XY158
162	168	XY159	https://example.org/sample/XY159
163	169	XY160	https://example.org/sample/XY160
164	170	XY161	https://example.org/sample/XY161
165	171	XY162	https://example.org/sample/XY162
166	172	XY163	https://example.org/sample/XY163
167	173	XY164	https://example.org/sample/XY164
168	174	XY165	https://example.org/sample/XY165
169	175	XY166	https://example.org/sample/XY166
170	176	XY167	https://example.org/sample/XY167
171	177	XY168	https://example.org/sample/XY168
172	178	XY169	https://example.org/sample/XY169
173	179	XY170	https://example.org/sample/XY170
174	180	XY171	https://example.org/sample/XY171
175	181	XY172	https://example.org/sample/XY172
176	182	XY173	https://example.org/sample/XY173
177	183	XY174	https://example.org/sample/XY174
178	184	XY175	https://example.org/sample/XY175
179	185	XY176	https://example.org/sample/XY176
180	186	XY177	https://example.org/sample/XY177
181	187	XY178	https://example.org/sample/XY178
182	188	XY179	https://example.org/sample/XY179
183	189	XY180	https://example.org/sample/XY180
184	190	XY181	https://example.org/sample/XY181
185	191	XY182	https://example.org/sample/XY182
186	192	XY183	https://example.org/sample/XY183
187	193	XY184	https://example.org/sample/XY184
188	194	XY185	https://example.org/sample/XY185
189	195	XY186	https://example.org/sample/XY186
190	196	XY187	https://example.org/sample/XY187
191	197	XY188	https://example.org/sample/XY188
192	198	XY189	https://example.org/sample/XY189
193	199	XY190	https://example.org/sample/XY190
194	200	XY191	https://example.org/sample/XY191
195	201	XY192	https://example.org/sample/XY192
196	202	XY193	https://example.org/sample/XY193
197	203	XY194	https://example.org/sample/XY194
198	204	XY195	https://example.org/sample/XY195
199	205	XY196	https://example.org/sample/XY196
200	206	XY197	https://example.org/sample/XY197
201	207	XY198	https://example.org/sample/XY198
202	208	XY199	https://example.org/sample/XY199
203	209	XY200	https://example.org/sample/XY200
\.


--
-- Data for Name: samples_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samples_metadata (id, sample_id, key, value) FROM stdin;
2	4	tissue	fibroblast
3	5	tissue	liver
4	6	tissue	fibroblast
\.


--
-- Name: datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasets_id_seq', 4, true);


--
-- Name: datasets_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasets_metadata_id_seq', 1, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 1, true);


--
-- Name: files_metadata_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_metadata_metadata_id_seq', 1, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_id_seq', 209, true);


--
-- Name: patients_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_metadata_id_seq', 7, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: samples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.samples_id_seq', 203, true);


--
-- Name: samples_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.samples_metadata_id_seq', 4, true);


--
-- Name: datasets_metadata datasets_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets_metadata
    ADD CONSTRAINT datasets_metadata_pkey PRIMARY KEY (id);


--
-- Name: datasets datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (id);


--
-- Name: files_metadata files_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata
    ADD CONSTRAINT files_metadata_pkey PRIMARY KEY (metadata_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT datasets_metadata_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: datasets datasets_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: files files_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: files_metadata files_metadata_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_metadata
    ADD CONSTRAINT files_metadata_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: patients_metadata patients_metadata_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients_metadata
    ADD CONSTRAINT patients_metadata_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- Name: patients patients_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: samples_metadata samples_metadata_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples_metadata
    ADD CONSTRAINT samples_metadata_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.samples(id) ON DELETE CASCADE;


--
-- Name: samples samples_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 2YXmrci7yX56bNjsMPGaQlKad82e5Ynv7YCVwBh0tYsoDsnzWxOAHZGBHlne08x

