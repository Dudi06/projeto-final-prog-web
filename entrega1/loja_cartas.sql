--
-- PostgreSQL database dump
--

\restrict ScwelenUgQg2Bt1x1ZGckavp3fyd5Zl3PZBXeFEym2gZfSGCC6DL07ZDLQKQfMX

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-09-22 12:19:59

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16423)
-- Name: card; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.card (
    id integer NOT NULL,
    nome character varying,
    type character varying,
    "humanReadableCardType" character varying,
    "frameType" character varying,
    "desc" text,
    race character varying,
    ygoprodeck_url character varying,
    cardmarket_price money,
    tcgplayer_price money,
    ebay_price money,
    amazon_price money,
    coolstuffinc_price money
);


ALTER TABLE public.card OWNER TO aluno;

--
-- TOC entry 236 (class 1259 OID 16627)
-- Name: card_cardset; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.card_cardset (
    "card_Id" integer NOT NULL,
    cardset_id integer NOT NULL,
    set_name character varying,
    set_code character varying,
    set_rarity character varying,
    set_rarity_code character varying,
    set_price money
);


ALTER TABLE public.card_cardset OWNER TO aluno;

--
-- TOC entry 234 (class 1259 OID 16625)
-- Name: card_cardset_card_Id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public."card_cardset_card_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."card_cardset_card_Id_seq" OWNER TO aluno;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 234
-- Name: card_cardset_card_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public."card_cardset_card_Id_seq" OWNED BY public.card_cardset."card_Id";


--
-- TOC entry 235 (class 1259 OID 16626)
-- Name: card_cardset_cardset_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.card_cardset_cardset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.card_cardset_cardset_id_seq OWNER TO aluno;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 235
-- Name: card_cardset_cardset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.card_cardset_cardset_id_seq OWNED BY public.card_cardset.cardset_id;


--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: card_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.card_id_seq OWNER TO aluno;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 221
-- Name: card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.card_id_seq OWNED BY public.card.id;


--
-- TOC entry 224 (class 1259 OID 16433)
-- Name: cardset; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.cardset (
    id integer NOT NULL,
    set_name character varying,
    set_code character varying,
    num_of_cards integer,
    set_image text
);


ALTER TABLE public.cardset OWNER TO aluno;

--
-- TOC entry 223 (class 1259 OID 16432)
-- Name: cardset_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.cardset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardset_id_seq OWNER TO aluno;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 223
-- Name: cardset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.cardset_id_seq OWNED BY public.cardset.id;


--
-- TOC entry 227 (class 1259 OID 16444)
-- Name: monstro; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.monstro (
    card_id integer NOT NULL,
    id integer NOT NULL,
    atk integer,
    def integer,
    level integer,
    attribute character varying
);


ALTER TABLE public.monstro OWNER TO aluno;

--
-- TOC entry 225 (class 1259 OID 16442)
-- Name: monstro_card_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.monstro_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.monstro_card_id_seq OWNER TO aluno;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 225
-- Name: monstro_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.monstro_card_id_seq OWNED BY public.monstro.card_id;


--
-- TOC entry 226 (class 1259 OID 16443)
-- Name: monstro_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.monstro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.monstro_id_seq OWNER TO aluno;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 226
-- Name: monstro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.monstro_id_seq OWNED BY public.monstro.id;


--
-- TOC entry 220 (class 1259 OID 16391)
-- Name: usuario; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    administrador boolean NOT NULL,
    email character varying NOT NULL,
    endereco character varying
);


ALTER TABLE public.usuario OWNER TO aluno;

--
-- TOC entry 219 (class 1259 OID 16390)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO aluno;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 230 (class 1259 OID 16587)
-- Name: venda; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.venda (
    id integer NOT NULL,
    data_hora timestamp with time zone,
    usuario_id integer NOT NULL
);


ALTER TABLE public.venda OWNER TO aluno;

--
-- TOC entry 233 (class 1259 OID 16603)
-- Name: venda_card; Type: TABLE; Schema: public; Owner: aluno
--

CREATE TABLE public.venda_card (
    card_id integer NOT NULL,
    venda_id integer NOT NULL,
    preco money,
    quantidade character varying
);


ALTER TABLE public.venda_card OWNER TO aluno;

--
-- TOC entry 231 (class 1259 OID 16601)
-- Name: venda_card_card_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.venda_card_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venda_card_card_id_seq OWNER TO aluno;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 231
-- Name: venda_card_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.venda_card_card_id_seq OWNED BY public.venda_card.card_id;


--
-- TOC entry 232 (class 1259 OID 16602)
-- Name: venda_card_venda_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.venda_card_venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venda_card_venda_id_seq OWNER TO aluno;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 232
-- Name: venda_card_venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.venda_card_venda_id_seq OWNED BY public.venda_card.venda_id;


--
-- TOC entry 228 (class 1259 OID 16585)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venda_id_seq OWNER TO aluno;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 228
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- TOC entry 229 (class 1259 OID 16586)
-- Name: venda_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: aluno
--

CREATE SEQUENCE public.venda_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venda_usuario_id_seq OWNER TO aluno;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: venda_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aluno
--

ALTER SEQUENCE public.venda_usuario_id_seq OWNED BY public.venda.usuario_id;


--
-- TOC entry 4790 (class 2604 OID 16426)
-- Name: card id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card ALTER COLUMN id SET DEFAULT nextval('public.card_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16630)
-- Name: card_cardset card_Id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card_cardset ALTER COLUMN "card_Id" SET DEFAULT nextval('public."card_cardset_card_Id_seq"'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16631)
-- Name: card_cardset cardset_id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card_cardset ALTER COLUMN cardset_id SET DEFAULT nextval('public.card_cardset_cardset_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16436)
-- Name: cardset id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.cardset ALTER COLUMN id SET DEFAULT nextval('public.cardset_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16447)
-- Name: monstro card_id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.monstro ALTER COLUMN card_id SET DEFAULT nextval('public.monstro_card_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16448)
-- Name: monstro id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.monstro ALTER COLUMN id SET DEFAULT nextval('public.monstro_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16394)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16590)
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16591)
-- Name: venda usuario_id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda ALTER COLUMN usuario_id SET DEFAULT nextval('public.venda_usuario_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16606)
-- Name: venda_card card_id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda_card ALTER COLUMN card_id SET DEFAULT nextval('public.venda_card_card_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16607)
-- Name: venda_card venda_id; Type: DEFAULT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda_card ALTER COLUMN venda_id SET DEFAULT nextval('public.venda_card_venda_id_seq'::regclass);


--
-- TOC entry 4970 (class 0 OID 16423)
-- Dependencies: 222
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.card (id, nome, type, "humanReadableCardType", "frameType", "desc", race, ygoprodeck_url, cardmarket_price, tcgplayer_price, ebay_price, amazon_price, coolstuffinc_price) FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 16627)
-- Dependencies: 236
-- Data for Name: card_cardset; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.card_cardset ("card_Id", cardset_id, set_name, set_code, set_rarity, set_rarity_code, set_price) FROM stdin;
\.


--
-- TOC entry 4972 (class 0 OID 16433)
-- Dependencies: 224
-- Data for Name: cardset; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.cardset (id, set_name, set_code, num_of_cards, set_image) FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 16444)
-- Dependencies: 227
-- Data for Name: monstro; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.monstro (card_id, id, atk, def, level, attribute) FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 16391)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.usuario (id, nome, login, senha, administrador, email, endereco) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 16587)
-- Dependencies: 230
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.venda (id, data_hora, usuario_id) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 16603)
-- Dependencies: 233
-- Data for Name: venda_card; Type: TABLE DATA; Schema: public; Owner: aluno
--

COPY public.venda_card (card_id, venda_id, preco, quantidade) FROM stdin;
\.


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 234
-- Name: card_cardset_card_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public."card_cardset_card_Id_seq"', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 235
-- Name: card_cardset_cardset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.card_cardset_cardset_id_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.card_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: cardset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.cardset_id_seq', 1, false);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 225
-- Name: monstro_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.monstro_card_id_seq', 1, false);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 226
-- Name: monstro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.monstro_id_seq', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 231
-- Name: venda_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.venda_card_card_id_seq', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 232
-- Name: venda_card_venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.venda_card_venda_id_seq', 1, false);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 228
-- Name: venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.venda_id_seq', 1, false);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 229
-- Name: venda_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aluno
--

SELECT pg_catalog.setval('public.venda_usuario_id_seq', 1, false);


--
-- TOC entry 4813 (class 2606 OID 16637)
-- Name: card_cardset card_cardset_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card_cardset
    ADD CONSTRAINT card_cardset_pkey PRIMARY KEY ("card_Id", cardset_id);


--
-- TOC entry 4803 (class 2606 OID 16431)
-- Name: card card_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 16441)
-- Name: cardset cardset_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.cardset
    ADD CONSTRAINT cardset_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16454)
-- Name: monstro monstro_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.monstro
    ADD CONSTRAINT monstro_pkey PRIMARY KEY (card_id, id);


--
-- TOC entry 4801 (class 2606 OID 16404)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16613)
-- Name: venda_card venda_card_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda_card
    ADD CONSTRAINT venda_card_pkey PRIMARY KEY (card_id, venda_id);


--
-- TOC entry 4809 (class 2606 OID 16595)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 16638)
-- Name: card_cardset card_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card_cardset
    ADD CONSTRAINT card_id FOREIGN KEY ("card_Id") REFERENCES public.card(id);


--
-- TOC entry 4814 (class 2606 OID 16455)
-- Name: monstro card_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.monstro
    ADD CONSTRAINT card_id FOREIGN KEY (card_id) REFERENCES public.card(id);


--
-- TOC entry 4816 (class 2606 OID 16614)
-- Name: venda_card card_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda_card
    ADD CONSTRAINT card_id FOREIGN KEY (card_id) REFERENCES public.card(id);


--
-- TOC entry 4819 (class 2606 OID 16643)
-- Name: card_cardset cardset_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.card_cardset
    ADD CONSTRAINT cardset_id FOREIGN KEY (cardset_id) REFERENCES public.cardset(id);


--
-- TOC entry 4815 (class 2606 OID 16596)
-- Name: venda usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 4817 (class 2606 OID 16619)
-- Name: venda_card venda_id; Type: FK CONSTRAINT; Schema: public; Owner: aluno
--

ALTER TABLE ONLY public.venda_card
    ADD CONSTRAINT venda_id FOREIGN KEY (venda_id) REFERENCES public.venda(id);


-- Completed on 2026-09-22 12:19:59

--
-- PostgreSQL database dump complete
--

\unrestrict ScwelenUgQg2Bt1x1ZGckavp3fyd5Zl3PZBXeFEym2gZfSGCC6DL07ZDLQKQfMX

