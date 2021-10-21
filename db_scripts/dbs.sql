--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: coin; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.coin (
    coin_id integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    num_market_pairs integer,
    date_added date NOT NULL,
    max_supply integer,
    circulating_supply integer NOT NULL,
    total_supply integer NOT NULL,
    platform integer,
    cmc_rank integer NOT NULL,
    last_updated date NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.coin OWNER TO nacho;

--
-- Name: coin_coin_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.coin_coin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_coin_id_seq OWNER TO nacho;

--
-- Name: coin_coin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.coin_coin_id_seq OWNED BY public.coin.coin_id;


--
-- Name: coin_tags; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.coin_tags (
    coin_tag_id integer NOT NULL,
    coin_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.coin_tags OWNER TO nacho;

--
-- Name: coin_tags_coin_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.coin_tags_coin_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_tags_coin_tag_id_seq OWNER TO nacho;

--
-- Name: coin_tags_coin_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.coin_tags_coin_tag_id_seq OWNED BY public.coin_tags.coin_tag_id;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.platform (
    platform_id integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    token_address character varying(255) NOT NULL
);


ALTER TABLE public.platform OWNER TO nacho;

--
-- Name: platform_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.platform_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platform_platform_id_seq OWNER TO nacho;

--
-- Name: platform_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.platform_platform_id_seq OWNED BY public.platform.platform_id;


--
-- Name: quotes; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.quotes (
    quotes_id integer NOT NULL,
    currency character varying(255) NOT NULL,
    price numeric NOT NULL,
    vol_24 numeric NOT NULL,
    pct_change_1h numeric NOT NULL,
    pct_change_24h numeric NOT NULL,
    pct_change_7d numeric NOT NULL,
    market_cap numeric NOT NULL,
    fully_diluted_mc numeric,
    last_updated date NOT NULL,
    coin_id integer NOT NULL
);


ALTER TABLE public.quotes OWNER TO nacho;

--
-- Name: quotes_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.quotes_quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotes_quotes_id_seq OWNER TO nacho;

--
-- Name: quotes_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.quotes_quotes_id_seq OWNED BY public.quotes.quotes_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.tags (
    tag_id integer NOT NULL,
    tag character varying(255) NOT NULL
);


ALTER TABLE public.tags OWNER TO nacho;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_tag_id_seq OWNER TO nacho;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags.tag_id;


--
-- Name: coin coin_id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin ALTER COLUMN coin_id SET DEFAULT nextval('public.coin_coin_id_seq'::regclass);


--
-- Name: coin_tags coin_tag_id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin_tags ALTER COLUMN coin_tag_id SET DEFAULT nextval('public.coin_tags_coin_tag_id_seq'::regclass);


--
-- Name: platform platform_id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform ALTER COLUMN platform_id SET DEFAULT nextval('public.platform_platform_id_seq'::regclass);


--
-- Name: quotes quotes_id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quotes ALTER COLUMN quotes_id SET DEFAULT nextval('public.quotes_quotes_id_seq'::regclass);


--
-- Name: tags tag_id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tags ALTER COLUMN tag_id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);


--
-- Name: coin coin_pk; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_pk PRIMARY KEY (coin_id);


--
-- Name: coin_tags coin_tags_pk; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin_tags
    ADD CONSTRAINT coin_tags_pk PRIMARY KEY (coin_tag_id);


--
-- Name: platform platform_pk; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pk PRIMARY KEY (platform_id);


--
-- Name: quotes quotes_pk; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pk PRIMARY KEY (quotes_id);


--
-- Name: tags tags_pk; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pk PRIMARY KEY (tag_id);


--
-- Name: coin coin_fk0; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_fk0 FOREIGN KEY (platform) REFERENCES public.platform(platform_id);


--
-- Name: coin_tags coin_tags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin_tags
    ADD CONSTRAINT coin_tags_fk0 FOREIGN KEY (coin_id) REFERENCES public.coin(coin_id);


--
-- Name: coin_tags coin_tags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin_tags
    ADD CONSTRAINT coin_tags_fk1 FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id);


--
-- Name: quotes quotes_fk0; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_fk0 FOREIGN KEY (coin_id) REFERENCES public.coin(coin_id);


--
-- PostgreSQL database dump complete
--

