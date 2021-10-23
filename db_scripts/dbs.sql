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
-- Name: coin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin (
    coin_id integer NOT NULL,
    platform_id integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    num_market_pairs integer,
    date_added date NOT NULL,
    max_supply integer NOT NULL,
    circulating_supply numeric NOT NULL,
    total_supply numeric NOT NULL,
    cmc_rank integer NOT NULL,
    last_updated date NOT NULL
);


ALTER TABLE public.coin OWNER TO postgres;

--
-- Name: coin_coin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_coin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_coin_id_seq OWNER TO postgres;

--
-- Name: coin_coin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_coin_id_seq OWNED BY public.coin.coin_id;


--
-- Name: coin_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_tag (
    coin_tag_id integer NOT NULL,
    coin_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.coin_tag OWNER TO postgres;

--
-- Name: coin_tag_coin_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_tag_coin_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_tag_coin_tag_id_seq OWNER TO postgres;

--
-- Name: coin_tag_coin_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_tag_coin_tag_id_seq OWNED BY public.coin_tag.coin_tag_id;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platform (
    platform_id integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    token_address text NOT NULL
);


ALTER TABLE public.platform OWNER TO postgres;

--
-- Name: platform_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platform_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platform_platform_id_seq OWNER TO postgres;

--
-- Name: platform_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.platform_platform_id_seq OWNED BY public.platform.platform_id;


--
-- Name: quote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quote (
    quote_id integer NOT NULL,
    coin_id integer NOT NULL,
    currency character varying(255) NOT NULL,
    price numeric NOT NULL,
    vol_24 numeric NOT NULL,
    pct_change_1h numeric NOT NULL,
    pct_change_24h numeric NOT NULL,
    pct_change_7d numeric NOT NULL,
    market_cap numeric NOT NULL,
    fully_diluted_mc numeric NOT NULL,
    last_updated date NOT NULL
);


ALTER TABLE public.quote OWNER TO postgres;

--
-- Name: quote_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quote_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote_quote_id_seq OWNER TO postgres;

--
-- Name: quote_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quote_quote_id_seq OWNED BY public.quote.quote_id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    tag character varying(255) NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_tag_id_seq OWNER TO postgres;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- Name: coin coin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin ALTER COLUMN coin_id SET DEFAULT nextval('public.coin_coin_id_seq'::regclass);


--
-- Name: coin_tag coin_tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_tag ALTER COLUMN coin_tag_id SET DEFAULT nextval('public.coin_tag_coin_tag_id_seq'::regclass);


--
-- Name: platform platform_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform ALTER COLUMN platform_id SET DEFAULT nextval('public.platform_platform_id_seq'::regclass);


--
-- Name: quote quote_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote ALTER COLUMN quote_id SET DEFAULT nextval('public.quote_quote_id_seq'::regclass);


--
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- Name: coin coin_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_pk PRIMARY KEY (coin_id);


--
-- Name: coin_tag coin_tag_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_tag
    ADD CONSTRAINT coin_tag_pk PRIMARY KEY (coin_tag_id);


--
-- Name: platform platform_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pk PRIMARY KEY (platform_id);


--
-- Name: quote quote_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_pk PRIMARY KEY (quote_id);


--
-- Name: tag tag_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pk PRIMARY KEY (tag_id);


--
-- Name: coin coin_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_fk0 FOREIGN KEY (platform_id) REFERENCES public.platform(platform_id);


--
-- Name: coin_tag coin_tag_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_tag
    ADD CONSTRAINT coin_tag_fk0 FOREIGN KEY (coin_id) REFERENCES public.coin(coin_id);


--
-- Name: coin_tag coin_tag_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_tag
    ADD CONSTRAINT coin_tag_fk1 FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);


--
-- Name: quote quote_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_fk0 FOREIGN KEY (coin_id) REFERENCES public.coin(coin_id);


--
-- PostgreSQL database dump complete
--

