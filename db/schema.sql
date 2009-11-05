--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: download; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE download (
    payload_id integer NOT NULL,
    key text NOT NULL,
    expiration timestamp with time zone DEFAULT (now() + '00:15:00'::interval)
);


ALTER TABLE public.download OWNER TO postgres;

--
-- Name: payload; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payload (
    id integer DEFAULT nextval(('"payload_id_seq"'::text)::regclass) NOT NULL,
    creation timestamp with time zone DEFAULT now() NOT NULL,
    expiration timestamp with time zone DEFAULT (now() + '1 year'::interval),
    note text,
    payload text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.payload OWNER TO postgres;

--
-- Name: payload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.payload_id_seq OWNER TO postgres;

--
-- Name: retrieval; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retrieval (
    email text NOT NULL,
    key text NOT NULL,
    expiration timestamp with time zone DEFAULT (now() + '00:15:00'::interval)
);


ALTER TABLE public.retrieval OWNER TO postgres;

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

