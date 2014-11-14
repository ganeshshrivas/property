--
-- PostgreSQL database cluster dump
--

\connect postgres

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';
CREATE ROLE postgress;
ALTER ROLE postgress WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;
CREATE ROLE rails;
ALTER ROLE rails WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5f5bf6abb224c316ee3d56fa52a8ab524';






--
-- Database creation
--

CREATE DATABASE prop_development WITH TEMPLATE = template0 OWNER = rails;
CREATE DATABASE prop_production WITH TEMPLATE = template0 OWNER = rails;
CREATE DATABASE prop_test WITH TEMPLATE = template0 OWNER = rails;
CREATE DATABASE sales WITH TEMPLATE = template0 OWNER = rails;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

\connect prop_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: estates; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE estates (
    id integer NOT NULL,
    ptype character varying(255),
    stype character varying(255),
    levels integer,
    area integer,
    bedroom integer,
    hall integer,
    bathroom integer,
    built date,
    feature character varying(255),
    price integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying(255),
    address character varying(255),
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.estates OWNER TO rails;

--
-- Name: estates_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE estates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estates_id_seq OWNER TO rails;

--
-- Name: estates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE estates_id_seq OWNED BY estates.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE pictures (
    id integer NOT NULL,
    avatar character varying(255),
    imageable_id integer,
    imageable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pictures OWNER TO rails;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO rails;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rails;

--
-- Name: users; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    fname character varying(255),
    lname character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    gender character varying(255),
    invitation_token character varying(255),
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_id integer,
    invited_by_type character varying(255),
    invitations_count integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rails
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO rails;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rails
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY estates ALTER COLUMN id SET DEFAULT nextval('estates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rails
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: estates; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY estates (id, ptype, stype, levels, area, bedroom, hall, bathroom, built, feature, price, user_id, created_at, updated_at, status, address, latitude, longitude) FROM stdin;
1	villa	sell	4	12000	8	4	8	2013-11-03	..	2000000	1	2014-11-03 09:17:09.666158	2014-11-03 09:17:09.666158	\N	3/2, Rajkumar Bridge Road, Snehlataganj, Indore, Madhya Pradesh 452007, India	22.7277650319844113	75.866123877246082
2	flat	sell	\N	2000	3	1	2	2014-10-03	..	400000	1	2014-11-03 09:19:11.777103	2014-11-03 09:19:11.777103	\N	466-467, Mahatma Gandhi Road, Kadabin, Bada Ganpati, Indore, Madhya Pradesh 452002, India	22.7199661185709303	75.8432982063598047
3	land	sell	\N	15000	\N	\N	\N	\N	.	15000000	1	2014-11-03 09:20:27.670851	2014-11-03 09:20:27.670851	\N	Transport Nagar, Indore, Madhya Pradesh, India	22.6968366999999986	75.8613838999999643
4	flat	sell	\N	2200	2	2	2	2014-11-03	..	800000	1	2014-11-03 09:22:08.648065	2014-11-03 09:22:08.648065	\N	39, AB Road, Pachunkar Colony, Ram Nagar, Dewas, Madhya Pradesh 455001, India	22.9648208025779965	76.0485845184325626
5	flat	sell	\N	2200	2	1	2	2014-11-03	none	900000	1	2014-11-03 09:33:35.772536	2014-11-03 09:33:35.772536	\N	9, Maksi Road, Radhaganj, Itawa, Dewas, Madhya Pradesh 455001, India	22.9728419210100334	76.0694413757323673
6	land	sell	\N	4000	\N	\N	\N	\N	Main Road	1300000	1	2014-11-03 09:35:28.198626	2014-11-03 09:35:28.198626	\N	Bhagat Singh Marg, Jabsinghpura Marg, Ujjain, Madhya Pradesh 456001, India	23.1747388192652402	75.7668176876220514
\.


--
-- Name: estates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('estates_id_seq', 6, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY pictures (id, avatar, imageable_id, imageable_type, created_at, updated_at) FROM stdin;
1	16.jpg	1	Estate	2014-11-03 09:17:10.129896	2014-11-03 09:17:10.129896
2	17.jpg	1	Estate	2014-11-03 09:17:10.284257	2014-11-03 09:17:10.284257
3	18.jpg	1	Estate	2014-11-03 09:17:10.424892	2014-11-03 09:17:10.424892
4	19.jpg	1	Estate	2014-11-03 09:17:10.571667	2014-11-03 09:17:10.571667
5	03.jpg	2	Estate	2014-11-03 09:19:11.917367	2014-11-03 09:19:11.917367
6	04.jpg	2	Estate	2014-11-03 09:19:12.060229	2014-11-03 09:19:12.060229
7	05.jpg	2	Estate	2014-11-03 09:19:12.206468	2014-11-03 09:19:12.206468
8	06.jpg	2	Estate	2014-11-03 09:19:12.362454	2014-11-03 09:19:12.362454
9	01.jpg	3	Estate	2014-11-03 09:20:27.813991	2014-11-03 09:20:27.813991
10	02.jpg	3	Estate	2014-11-03 09:20:27.994115	2014-11-03 09:20:27.994115
11	03.jpg	3	Estate	2014-11-03 09:20:28.147285	2014-11-03 09:20:28.147285
12	04.jpg	3	Estate	2014-11-03 09:20:28.283864	2014-11-03 09:20:28.283864
13	05.jpg	3	Estate	2014-11-03 09:20:28.426363	2014-11-03 09:20:28.426363
14	11.jpg	4	Estate	2014-11-03 09:22:08.788674	2014-11-03 09:22:08.788674
15	12.jpg	4	Estate	2014-11-03 09:22:08.942939	2014-11-03 09:22:08.942939
16	13.jpg	4	Estate	2014-11-03 09:22:09.095411	2014-11-03 09:22:09.095411
17	14.jpg	4	Estate	2014-11-03 09:22:09.233031	2014-11-03 09:22:09.233031
18	15.jpg	4	Estate	2014-11-03 09:22:09.380366	2014-11-03 09:22:09.380366
19	18.jpg	5	Estate	2014-11-03 09:33:35.903324	2014-11-03 09:33:35.903324
20	19.jpg	5	Estate	2014-11-03 09:33:36.060853	2014-11-03 09:33:36.060853
21	20.jpg	5	Estate	2014-11-03 09:33:36.214395	2014-11-03 09:33:36.214395
22	21.jpg	5	Estate	2014-11-03 09:33:36.358619	2014-11-03 09:33:36.358619
23	22.jpg	5	Estate	2014-11-03 09:33:36.503474	2014-11-03 09:33:36.503474
24	01.jpg	6	Estate	2014-11-03 09:35:28.319011	2014-11-03 09:35:28.319011
25	02.jpg	6	Estate	2014-11-03 09:35:28.452896	2014-11-03 09:35:28.452896
26	04.jpg	6	Estate	2014-11-03 09:35:28.607201	2014-11-03 09:35:28.607201
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('pictures_id_seq', 26, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY schema_migrations (version) FROM stdin;
20141029131139
20140926073902
20140925140258
20140926084612
20140925130044
20141006065234
20140925145329
20141103071332
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, fname, lname, created_at, updated_at, gender, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_id, invited_by_type, invitations_count) FROM stdin;
1	harpal@mailimate.com	$2a$10$3ABwmhdq0yEomfavJsAAKe7t7zh0ZU32MTenxRshnrp8EUmaCIPlK	BaucsMek4SzNe5NNySeV	\N	\N	7	2014-11-04 10:20:32.166867	2014-11-04 09:41:03.775358	127.0.0.1	127.0.0.1	\N	2014-11-04 09:40:58.592139	2014-11-03 09:14:59.179567	\N	Harpal	Singh	2014-11-03 09:14:58.738446	2014-11-04 10:20:32.167933	male	\N	\N	\N	\N	\N	\N	\N	0
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rails
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: estates_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY estates
    ADD CONSTRAINT estates_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_estates_on_user_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_estates_on_user_id ON estates USING btree (user_id);


--
-- Name: index_pictures_on_imageable_id_and_imageable_type; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_pictures_on_imageable_id_and_imageable_type ON pictures USING btree (imageable_id, imageable_type);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON users USING btree (invitation_token);


--
-- Name: index_users_on_invitations_count; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_users_on_invitations_count ON users USING btree (invitations_count);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE INDEX index_users_on_invited_by_id ON users USING btree (invited_by_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: rails; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

\connect prop_production

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

\connect prop_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

\connect sales

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: company; Type: TABLE; Schema: public; Owner: rails; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    name text NOT NULL,
    age integer NOT NULL,
    address character(50),
    salary real
);


ALTER TABLE public.company OWNER TO rails;

--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: rails
--

COPY company (id, name, age, address, salary) FROM stdin;
\.


--
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: rails; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


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

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

--
-- PostgreSQL database cluster dump complete
--

