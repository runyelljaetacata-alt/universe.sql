--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_types_id integer NOT NULL,
    description text NOT NULL,
    num_stars integer NOT NULL,
    num_planets integer NOT NULL,
    size numeric(10,1) NOT NULL,
    age numeric(10,1) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius integer NOT NULL,
    orbital_period_days integer NOT NULL,
    size numeric(10,1) NOT NULL,
    age numeric(10,1) NOT NULL,
    has_magnetic_field boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    diameter numeric(10,1) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    time_travel_possible boolean NOT NULL,
    description text NOT NULL
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
    name character varying(50) NOT NULL,
    star_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 'Our home galaxy', 100000, 1000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 'Nearest major galaxy', 90000, 800, 110000.0, 10.0, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 'Third largest in Local Group', 50000, 400, 60000.0, 12.0, false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 2, 'Distinct bright bulge', 60000, 500, 90000.0, 11.0, false, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 2, 'Massive elliptical galaxy', 200000, 1200, 200000.0, 13.4, false, true);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 3, 'Dwarf galaxy by Milky Way', 30000, 300, 50000.0, 12.5, false, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Spiral-shaped galaxy');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Ellipsoid galaxy');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'No particular structure');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 27, 3474.0, 4500.0, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0, 22.4, 4600.0, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1, 12.4, 4600.0, false, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 1560, 4, 3121.0, 4500.0, false, false, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 7, 5268.0, 4500.0, false, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, 17, 4821.0, 4500.0, false, false, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 2575, 16, 5150.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', 764, 5, 1528.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', 734, 79, 1469.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252, 1, 504.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 198, 1, 396.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 235, 1, 471.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (13, 'Titania', 788, 9, 1578.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 761, 14, 1523.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (15, 'Umbriel', 585, 4, 1170.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 579, 3, 1158.0, 4500.0, false, false, 6);
INSERT INTO public.moon VALUES (17, 'Charon', 606, 6, 1206.0, 4500.0, false, false, 12);
INSERT INTO public.moon VALUES (18, 'Hydra', 430, 3, 430.0, 4500.0, false, false, 12);
INSERT INTO public.moon VALUES (19, 'Nix', 50, 2, 50.0, 4500.0, false, false, 12);
INSERT INTO public.moon VALUES (20, 'Styx', 16, 1, 16.0, 4500.0, false, false, 12);
INSERT INTO public.moon VALUES (21, 'Kerberos', 6, 0, 6.0, 4500.0, false, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742.0, true, 1, false, 'Our home planet');
INSERT INTO public.planet VALUES (2, 'Mars', 6779.0, false, 1, false, 'The Red Planet');
INSERT INTO public.planet VALUES (3, 'Venus', 12104.0, false, 1, false, 'Very hot planet');
INSERT INTO public.planet VALUES (4, 'Mercury', 4879.0, false, 1, false, 'Closest to Sun');
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820.0, false, 1, false, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 116460.0, false, 1, false, 'Has rings');
INSERT INTO public.planet VALUES (7, 'Proxima b', 11400.0, false, 5, false, 'Exoplanet');
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 13000.0, false, 5, false, 'Exoplanet');
INSERT INTO public.planet VALUES (9, 'Rigel b', 15000.0, false, 4, false, 'Massive planet');
INSERT INTO public.planet VALUES (10, 'Antares b', 14000.0, false, 6, false, 'Unknown planet');
INSERT INTO public.planet VALUES (11, 'Ceres', 946.0, false, 1, false, 'Dwarf planet');
INSERT INTO public.planet VALUES (12, 'Pluto', 2376.0, false, 1, false, 'Dwarf planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'A-type main-sequence', 300, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', 8000, true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', 8000, true, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'G-type', 5800, true, 3);
INSERT INTO public.star VALUES (6, 'Antares', 'Red Supergiant', 12000, true, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

