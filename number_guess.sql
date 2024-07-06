--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1720267741384', 2, 493);
INSERT INTO public.users VALUES (9, 'sakhile', 4, 6);
INSERT INTO public.users VALUES (1, 'user_1720267741385', 5, 259);
INSERT INTO public.users VALUES (4, 'user_1720267752136', 2, 142);
INSERT INTO public.users VALUES (3, 'user_1720267752137', 5, 111);
INSERT INTO public.users VALUES (6, 'user_1720268712314', 2, 7);
INSERT INTO public.users VALUES (25, 'user_1720269888425', 2, 272);
INSERT INTO public.users VALUES (5, 'user_1720268712315', 5, 64);
INSERT INTO public.users VALUES (8, 'user_1720268984673', 2, 37);
INSERT INTO public.users VALUES (35, 'user_1720270457554', 2, 589);
INSERT INTO public.users VALUES (7, 'user_1720268984674', 5, 125);
INSERT INTO public.users VALUES (24, 'user_1720269888426', 5, 1);
INSERT INTO public.users VALUES (11, 'user_1720269053488', 2, 295);
INSERT INTO public.users VALUES (10, 'user_1720269053489', 5, 540);
INSERT INTO public.users VALUES (13, 'user_1720269122176', 2, 304);
INSERT INTO public.users VALUES (34, 'user_1720270457555', 5, 1);
INSERT INTO public.users VALUES (12, 'user_1720269122177', 5, 139);
INSERT INTO public.users VALUES (15, 'user_1720269222346', 2, 352);
INSERT INTO public.users VALUES (27, 'user_1720270196955', 2, 25);
INSERT INTO public.users VALUES (14, 'user_1720269222347', 5, 114);
INSERT INTO public.users VALUES (17, 'user_1720269315742', 2, 173);
INSERT INTO public.users VALUES (16, 'user_1720269315743', 5, 418);
INSERT INTO public.users VALUES (26, 'user_1720270196956', 5, 1);
INSERT INTO public.users VALUES (19, 'user_1720269455798', 2, 228);
INSERT INTO public.users VALUES (18, 'user_1720269455799', 5, 234);
INSERT INTO public.users VALUES (21, 'user_1720269560640', 2, 216);
INSERT INTO public.users VALUES (37, 'user_1720270663541', 2, 253);
INSERT INTO public.users VALUES (20, 'user_1720269560641', 5, 464);
INSERT INTO public.users VALUES (29, 'user_1720270225250', 2, 380);
INSERT INTO public.users VALUES (36, 'user_1720270663542', 5, 1);
INSERT INTO public.users VALUES (23, 'user_1720269725961', 2, 46);
INSERT INTO public.users VALUES (28, 'user_1720270225251', 5, 1);
INSERT INTO public.users VALUES (22, 'user_1720269725962', 5, 1);
INSERT INTO public.users VALUES (31, 'user_1720270272771', 2, 412);
INSERT INTO public.users VALUES (39, 'user_1720270959826', 2, 301);
INSERT INTO public.users VALUES (30, 'user_1720270272772', 5, 1);
INSERT INTO public.users VALUES (38, 'user_1720270959827', 5, 1);
INSERT INTO public.users VALUES (33, 'user_1720270309458', 2, 112);
INSERT INTO public.users VALUES (32, 'user_1720270309459', 5, 1);
INSERT INTO public.users VALUES (41, 'user_1720271082327', 2, 533);
INSERT INTO public.users VALUES (40, 'user_1720271082328', 5, 1);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 41, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

