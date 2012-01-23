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
    payload_id bigint NOT NULL,
    creation timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.download OWNER TO postgres;

--
-- Name: payload; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payload (
    id bigint DEFAULT round(((9223372036854775807::bigint)::double precision * random())) NOT NULL,
    creation timestamp with time zone DEFAULT now() NOT NULL,
    registration timestamp with time zone,
    expiration timestamp with time zone,
    note text,
    payload text NOT NULL,
    email text,
    filename text NOT NULL,
    filesize integer NOT NULL,
    md5 text NOT NULL,
    sha1 text NOT NULL,
    auth bigint DEFAULT round(((9223372036854775807::bigint)::double precision * random())) NOT NULL
);


ALTER TABLE public.payload OWNER TO postgres;

--
-- Name: payload_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payload
    ADD CONSTRAINT payload_id_pkey UNIQUE (id);


--
-- Name: payload_id_chk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY download
    ADD CONSTRAINT payload_id_chk FOREIGN KEY (payload_id) REFERENCES payload(id);


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

