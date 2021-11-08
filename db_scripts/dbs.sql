--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
    id integer NOT NULL,
    name character varying NOT NULL,
    symbol character varying(10) NOT NULL,
    slug character varying(50) NOT NULL,
    max_supply bigint,
    date_added timestamp without time zone
);


ALTER TABLE public.coin OWNER TO nacho;

--
-- Name: COLUMN coin.name; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.coin.name IS 'Currency name';


--
-- Name: COLUMN coin.symbol; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.coin.symbol IS 'Currency symbol';


--
-- Name: COLUMN coin.date_added; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.coin.date_added IS 'Date when added to the market';


--
-- Name: market_stats; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.market_stats (
    id integer NOT NULL,
    coin_id integer NOT NULL,
    num_market_pairs integer,
    circulating_supply double precision,
    total_supply double precision,
    cmc_rank integer,
    last_updated timestamp without time zone
);


ALTER TABLE public.market_stats OWNER TO nacho;

--
-- Name: COLUMN market_stats.coin_id; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.market_stats.coin_id IS 'Foreign key for the ''coin'' table';


--
-- Name: market_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.market_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_stats_id_seq OWNER TO nacho;

--
-- Name: market_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.market_stats_id_seq OWNED BY public.market_stats.id;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.platform (
    id integer NOT NULL,
    platform_id integer NOT NULL,
    token_address bytea
);


ALTER TABLE public.platform OWNER TO nacho;

--
-- Name: quote; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.quote (
    id integer NOT NULL,
    coin_id integer NOT NULL,
    currency character varying(10) NOT NULL,
    price double precision NOT NULL,
    vol_24 double precision,
    pct_change_1h double precision,
    pct_change_24h double precision,
    pct_change_7d double precision,
    market_cap double precision,
    fully_diluted_mc double precision,
    last_updated timestamp without time zone NOT NULL
);


ALTER TABLE public.quote OWNER TO nacho;

--
-- Name: COLUMN quote.currency; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.quote.currency IS 'Name of the currency';


--
-- Name: quote_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote_id_seq OWNER TO nacho;

--
-- Name: quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.quote_id_seq OWNED BY public.quote.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    coin_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.tag OWNER TO nacho;

--
-- Name: COLUMN tag.coin_id; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.tag.coin_id IS 'Foreign key for ''coin'' table';


--
-- Name: COLUMN tag.tag_id; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.tag.tag_id IS 'Foreign key for ''tag_ref'' table';


--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO nacho;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tag_ref; Type: TABLE; Schema: public; Owner: nacho
--

CREATE TABLE public.tag_ref (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tag_ref OWNER TO nacho;

--
-- Name: COLUMN tag_ref.name; Type: COMMENT; Schema: public; Owner: nacho
--

COMMENT ON COLUMN public.tag_ref.name IS 'Tag name';


--
-- Name: tag_ref_id_seq; Type: SEQUENCE; Schema: public; Owner: nacho
--

CREATE SEQUENCE public.tag_ref_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_ref_id_seq OWNER TO nacho;

--
-- Name: tag_ref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nacho
--

ALTER SEQUENCE public.tag_ref_id_seq OWNED BY public.tag_ref.id;


--
-- Name: market_stats id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.market_stats ALTER COLUMN id SET DEFAULT nextval('public.market_stats_id_seq'::regclass);


--
-- Name: quote id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quote ALTER COLUMN id SET DEFAULT nextval('public.quote_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tag_ref id; Type: DEFAULT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag_ref ALTER COLUMN id SET DEFAULT nextval('public.tag_ref_id_seq'::regclass);


--
-- Name: coin coin_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_pkey PRIMARY KEY (id);


--
-- Name: coin coin_slug_key; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_slug_key UNIQUE (slug);


--
-- Name: market_stats market_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.market_stats
    ADD CONSTRAINT market_stats_pkey PRIMARY KEY (id);


--
-- Name: platform platform_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (id);


--
-- Name: platform platform_token_address_key; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_token_address_key UNIQUE (token_address);


--
-- Name: quote quote_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tag_ref tag_ref_name_key; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag_ref
    ADD CONSTRAINT tag_ref_name_key UNIQUE (name);


--
-- Name: tag_ref tag_ref_pkey; Type: CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag_ref
    ADD CONSTRAINT tag_ref_pkey PRIMARY KEY (id);


--
-- Name: ix_market_stats_coin_id; Type: INDEX; Schema: public; Owner: nacho
--

CREATE INDEX ix_market_stats_coin_id ON public.market_stats USING btree (coin_id);


--
-- Name: ix_platform_platform_id; Type: INDEX; Schema: public; Owner: nacho
--

CREATE INDEX ix_platform_platform_id ON public.platform USING btree (platform_id);


--
-- Name: ix_quote_coin_id; Type: INDEX; Schema: public; Owner: nacho
--

CREATE INDEX ix_quote_coin_id ON public.quote USING btree (coin_id);


--
-- Name: ix_tag_coin_id; Type: INDEX; Schema: public; Owner: nacho
--

CREATE INDEX ix_tag_coin_id ON public.tag USING btree (coin_id);


--
-- Name: ix_tag_tag_id; Type: INDEX; Schema: public; Owner: nacho
--

CREATE INDEX ix_tag_tag_id ON public.tag USING btree (tag_id);


--
-- Name: market_stats market_stats_coin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.market_stats
    ADD CONSTRAINT market_stats_coin_id_fkey FOREIGN KEY (coin_id) REFERENCES public.coin(id);


--
-- Name: platform platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_id_fkey FOREIGN KEY (id) REFERENCES public.coin(id);


--
-- Name: platform platform_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.coin(id);


--
-- Name: quote quote_coin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_coin_id_fkey FOREIGN KEY (coin_id) REFERENCES public.coin(id);


--
-- Name: tag tag_coin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_coin_id_fkey FOREIGN KEY (coin_id) REFERENCES public.coin(id);


--
-- Name: tag tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nacho
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag_ref(id);


--
-- PostgreSQL database dump complete
--

