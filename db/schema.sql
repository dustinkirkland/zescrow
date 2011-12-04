-- /*
--
--    keyescrow: web application for securely escrowing keys
--    - schema.sql: database schema
--
--    Copyright (C) 2008-2011 Scot-Irish Lads, LLC
--    Author: Dustin Kirkland <dustin.kirkland@gmail.com>
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU Affero General Public License as
--    published by the Free Software Foundation, version 3 of the
--    License.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU Affero General Public License for more details.
--
--    You should have received a copy of the GNU Affero General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- */


--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
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
    key text NOT NULL,
    expiration timestamp with time zone DEFAULT (now() + '00:15:00'::interval),
    payload_id integer NOT NULL
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
    email text NOT NULL,
    filename text NOT NULL,
    filesize integer NOT NULL,
    md5 text NOT NULL,
    sha1 text NOT NULL
);


ALTER TABLE public.payload OWNER TO postgres;

--
-- Name: payload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payload_id_seq
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

