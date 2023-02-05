--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth (
    earth_id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    no_population integer NOT NULL
);


ALTER TABLE public.earth OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_earth_id_seq OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_earth_id_seq OWNED BY public.earth.earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    series_galaxy_star character varying(30),
    expanding boolean NOT NULL,
    explorer text NOT NULL
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
    series_planet_moon character varying(30),
    diameter numeric(6,2),
    year_of_discovery integer NOT NULL
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
    series_star_planet character varying(30),
    series_planet_moon character varying(30),
    human_living boolean NOT NULL,
    year_of_discovery integer NOT NULL
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
    series_galaxy_star character varying(30),
    series_star_planet character varying(30),
    year_of_discovery integer NOT NULL
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
-- Name: earth earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth ALTER COLUMN earth_id SET DEFAULT nextval('public.earth_earth_id_seq'::regclass);


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
-- Data for Name: earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth VALUES (1, 'Earth01', 'Malaysia', 'Kuala Lumpur', 1600000);
INSERT INTO public.earth VALUES (2, 'Earth02', 'Singapore', 'WSingapore', 600000);
INSERT INTO public.earth VALUES (3, 'Earth03', 'USA', 'LA', 1800000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky_Way', 'A-01', true, 'Jordan');
INSERT INTO public.galaxy VALUES (2, 'Messier_81', 'A-02', true, 'Bryant');
INSERT INTO public.galaxy VALUES (3, 'Messier_82', 'A-03', true, 'James');
INSERT INTO public.galaxy VALUES (4, 'Messier_63', 'A-04', true, 'Harden');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel_galaxy', 'A-05', true, 'Johnson');
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'A-06', true, 'Williamson');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moonx', 'C-01', 3456.02, 1880);
INSERT INTO public.moon VALUES (2, 'Phobos', 'C-02', 23.52, 1820);
INSERT INTO public.moon VALUES (3, 'Deimos', 'C-03', 13.02, 1878);
INSERT INTO public.moon VALUES (4, 'Amalthea', 'C-04', 200.02, 1865);
INSERT INTO public.moon VALUES (5, 'Thebe', 'C-05', 90.02, 1894);
INSERT INTO public.moon VALUES (6, 'Io', 'C-06', 3630.02, 1852);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, 3138.00, 1863);
INSERT INTO public.moon VALUES (8, 'Ganymede', NULL, 77.02, 1862);
INSERT INTO public.moon VALUES (9, 'Callisto', NULL, 2620.02, 1885);
INSERT INTO public.moon VALUES (10, 'Himalia', NULL, 7854.02, 1884);
INSERT INTO public.moon VALUES (11, 'Pan', NULL, 5326.02, 1890);
INSERT INTO public.moon VALUES (12, 'Atlas', NULL, 512.02, 1900);
INSERT INTO public.moon VALUES (13, 'Prometheus', NULL, 672.02, 1877);
INSERT INTO public.moon VALUES (14, 'Pandora', NULL, 3562.01, 1875);
INSERT INTO public.moon VALUES (15, 'Janus', NULL, 851.06, 1871);
INSERT INTO public.moon VALUES (16, 'Mimas', NULL, 703.50, 1877);
INSERT INTO public.moon VALUES (17, 'Enceladus', NULL, 987.12, 1865);
INSERT INTO public.moon VALUES (18, 'Dione', NULL, 2516.21, 1890);
INSERT INTO public.moon VALUES (19, 'Phobe', NULL, 316.20, 1875);
INSERT INTO public.moon VALUES (20, 'Ariel', NULL, 1625.20, 1876);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'B-01', 'C-01', false, 1856);
INSERT INTO public.planet VALUES (2, 'Venus', 'B-02', 'C-02', false, 1821);
INSERT INTO public.planet VALUES (3, 'Earth', 'B-03', 'C-03', true, 1652);
INSERT INTO public.planet VALUES (4, 'Mars', 'B-04', 'C-04', false, 1861);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'B-05', 'C-05', false, 1965);
INSERT INTO public.planet VALUES (6, 'Satum', 'B-06', 'C-06', false, 1987);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, false, 1875);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, false, 1954);
INSERT INTO public.planet VALUES (9, 'Kepler', NULL, NULL, false, 1957);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, NULL, false, 1862);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, NULL, false, 1756);
INSERT INTO public.planet VALUES (12, 'Orcus', NULL, NULL, false, 1920);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'A-01', 'B-01', 1920);
INSERT INTO public.star VALUES (2, 'Canopus', 'A-02', 'B-02', 1921);
INSERT INTO public.star VALUES (3, 'Arcturus', 'A-03', 'B-03', 1922);
INSERT INTO public.star VALUES (4, 'Vega', 'A-04', 'B-04', 1923);
INSERT INTO public.star VALUES (5, 'Rigel', 'A-05', 'B-05', 1928);
INSERT INTO public.star VALUES (6, 'Achemar', 'A-06', 'B-06', 1929);


--
-- Name: earth_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_earth_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: earth earth_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_name_key UNIQUE (name);


--
-- Name: earth earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_pkey PRIMARY KEY (earth_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_series_galaxy_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_series_galaxy_star_key UNIQUE (series_galaxy_star);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_series_planet_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_series_planet_moon_key UNIQUE (series_planet_moon);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_series_planet_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_series_planet_moon_key UNIQUE (series_planet_moon);


--
-- Name: planet planet_series_star_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_series_star_planet_key UNIQUE (series_star_planet);


--
-- Name: planet planet_year_of_discovery_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_year_of_discovery_key UNIQUE (year_of_discovery);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_series_galaxy_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_series_galaxy_star_key UNIQUE (series_galaxy_star);


--
-- Name: star star_series_star_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_series_star_planet_key UNIQUE (series_star_planet);


--
-- Name: star star_year_of_discovery_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_year_of_discovery_key UNIQUE (year_of_discovery);


--
-- Name: moon moon_series_planet_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_series_planet_moon_fkey FOREIGN KEY (series_planet_moon) REFERENCES public.planet(series_planet_moon);


--
-- Name: planet planet_series_star_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_series_star_planet_fkey FOREIGN KEY (series_star_planet) REFERENCES public.star(series_star_planet);


--
-- Name: star star_series_galaxy_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_series_galaxy_star_fkey FOREIGN KEY (series_galaxy_star) REFERENCES public.galaxy(series_galaxy_star);


--
-- PostgreSQL database dump complete
--
