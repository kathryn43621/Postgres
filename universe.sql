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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    type character varying(30),
    year numeric,
    distance double precision,
    size integer,
    tech_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius double precision,
    year numeric,
    tech_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    radius double precision,
    year numeric,
    have_moons boolean,
    number_moons integer,
    tech_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(30),
    year numeric,
    have_planets boolean,
    number_planets integer,
    tech_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: tech; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tech (
    tech_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year numeric,
    country text,
    developer character varying(30)
);


ALTER TABLE public.tech OWNER TO freecodecamp;

--
-- Name: technology_tech_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.technology_tech_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technology_tech_id_seq OWNER TO freecodecamp;

--
-- Name: technology_tech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.technology_tech_id_seq OWNED BY public.tech.tech_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: tech tech_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tech ALTER COLUMN tech_id SET DEFAULT nextval('public.technology_tech_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittaurus', 'barred spiral', 1610, 0.026, 52850, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000, 1);
INSERT INTO public.galaxy VALUES (3, 'Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500, 5);
INSERT INTO public.galaxy VALUES (4, 'Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800, 5);
INSERT INTO public.galaxy VALUES (5, 'Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000, 4);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Virgo', 'elliptical', NULL, 0.49, 25000, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 428, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.2, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.2, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.6, 1610, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.8, 1610, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2631, 1610, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 1610, 1);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.5, 1979, 2);
INSERT INTO public.moon VALUES (9, 'Metis', 5, 43, 1979, 2);
INSERT INTO public.moon VALUES (10, 'Adrasthea', 5, 16.4, 1979, 2);
INSERT INTO public.moon VALUES (11, 'Thebe', 5, 98.6, 1979, 1);
INSERT INTO public.moon VALUES (12, 'Leda', 5, 21.5, 1974, 2);
INSERT INTO public.moon VALUES (13, 'Triton', 6, 1353.4, 1846, 1);
INSERT INTO public.moon VALUES (14, 'Nereid', 6, 170, 1949, 2);
INSERT INTO public.moon VALUES (15, 'Galatea', 6, 87.4, 1989, 1);
INSERT INTO public.moon VALUES (16, 'Despina', 6, 75, 1989, 2);
INSERT INTO public.moon VALUES (17, 'Proteus', 6, 210, 1989, 2);
INSERT INTO public.moon VALUES (18, 'Thalassa', 6, 41, 1989, 2);
INSERT INTO public.moon VALUES (19, 'Halimede', 6, 31, 2002, 2);
INSERT INTO public.moon VALUES (20, 'Titan', 7, 2474.3, 1965, 1);
INSERT INTO public.moon VALUES (21, 'Enceladus', 7, 500, 1789, 1);
INSERT INTO public.moon VALUES (22, 'Mimas', 7, 198.2, 1789, 2);
INSERT INTO public.moon VALUES (23, 'Atlas', 7, 15, 1980, 1);
INSERT INTO public.moon VALUES (24, 'Lapetus', 7, 734.5, 1671, 2);
INSERT INTO public.moon VALUES (25, 'Elara', 5, 80, 1905, 1);
INSERT INTO public.moon VALUES (26, 'Himalia', 5, 149, 1904, 1);
INSERT INTO public.moon VALUES (27, 'Callirrhoe', 5, 1.3, 2000, 1);
INSERT INTO public.moon VALUES (28, 'Carpo', 5, 3, 2003, 1);
INSERT INTO public.moon VALUES (29, 'Charon', 8, 606, 1978, 1);
INSERT INTO public.moon VALUES (30, 'Eukelade', 5, 4, 2033, 3);
INSERT INTO public.moon VALUES (31, 'Hyperion', 7, 135, 1848, 1);
INSERT INTO public.moon VALUES (32, 'Iapetus', 7, 734.5, 1671, 1);
INSERT INTO public.moon VALUES (33, 'Miranda', 9, 500, 1986, 1);
INSERT INTO public.moon VALUES (34, 'KOI-268.01_moon', 15, NULL, 2013, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, NULL, true, 1, 2);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6778, 1610, true, 2, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 4871.4, 1631, false, 0, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 12104, 1610, false, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, 1610, true, 80, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 49244, 1846, true, 14, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 58232, 1610, true, 83, 1);
INSERT INTO public.planet VALUES (8, 'Pluto', 1, 1188.3, 1930, true, 4, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 1, 25362, 1781, true, 27, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-1649c', 2, 6753.3, 2020, NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Gliese-163c', 3, 28000, 2012, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, '51_Pegasi_b', 6, 135830, 1995, false, 0, 2);
INSERT INTO public.planet VALUES (13, 'L 98-59-f', 9, 3140, 2021, NULL, NULL, 2);
INSERT INTO public.planet VALUES (14, 'Bocaprins', 12, 167820, 2011, NULL, NULL, 4);
INSERT INTO public.planet VALUES (15, 'KOI-268.01', 13, 112000, 2013, true, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 450, true, 8, 1);
INSERT INTO public.star VALUES (2, 'Kepler-1649', 1, 'M5V', 2020, true, 2, 4);
INSERT INTO public.star VALUES (3, 'Gliese 163', 5, 'M3V', 2012, true, 5, 3);
INSERT INTO public.star VALUES (4, 'Alpha_andromedae', 2, 'A3V', 1993, false, 0, 3);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 'M0III', 1521, false, 0, 5);
INSERT INTO public.star VALUES (6, '51_pegasi', 2, 'G2IV', 1995, true, 1, 3);
INSERT INTO public.star VALUES (7, 'Delta_Centauri', 3, 'B-type', NULL, false, 0, 3);
INSERT INTO public.star VALUES (8, 'Canis_Major', 4, 'DA2', 2000, NULL, NULL, 4);
INSERT INTO public.star VALUES (9, 'L 98-59', 3, 'M3V', 2019, true, 4, 3);
INSERT INTO public.star VALUES (10, 'Antares', 1, 'B2.5V', 1819, false, 0, 3);
INSERT INTO public.star VALUES (11, 'Mu_Cephei', 1, 'M2-Ia', 1881, false, 0, 5);
INSERT INTO public.star VALUES (12, 'WASP-39 ', 1, 'G8', 2011, true, 1, 4);
INSERT INTO public.star VALUES (13, 'KOI-268', 1, NULL, 2013, true, 1, 3);
INSERT INTO public.star VALUES (14, 'Vega', 2, 'A0Va', 2005, false, 0, 4);


--
-- Data for Name: tech; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tech VALUES (1, 'optical', 1608, 'Germany-Dutch', 'Hans Lippershey');
INSERT INTO public.tech VALUES (2, 'occultation', 1590, 'Germany', 'Michael Maestlin');
INSERT INTO public.tech VALUES (3, 'X-ray astronomy', 1927, 'USA', 'US_Naval_Research_Laboratory');
INSERT INTO public.tech VALUES (4, 'infrared', 1830, 'Scotland', 'Charles Piazzi Smyth');
INSERT INTO public.tech VALUES (5, 'radio_astronomy', 1933, 'USA', 'Karl_Jansky');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: technology_tech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.technology_tech_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: tech technology_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tech
    ADD CONSTRAINT technology_name_key UNIQUE (name);


--
-- Name: tech technology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tech
    ADD CONSTRAINT technology_pkey PRIMARY KEY (tech_id);


--
-- Name: galaxy galaxy_tech_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_tech_id_fkey FOREIGN KEY (tech_id) REFERENCES public.tech(tech_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

