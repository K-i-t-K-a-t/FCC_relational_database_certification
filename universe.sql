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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30) NOT NULL,
    constellation_id integer NOT NULL,
    abbreviated_name character varying(10)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size_in_kpc integer,
    distance_in_kpc integer,
    billions_of_stars integer,
    constellation_id integer NOT NULL
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
    name character varying(30),
    has_water boolean,
    planet_id integer NOT NULL,
    gravity_in_g numeric(4,1)
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
    name character varying(30),
    velocity text,
    has_water boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    apparent_magnitude numeric(4,2),
    galaxy_id integer NOT NULL,
    common_name character varying(20)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Milky Way', 1, NULL);
INSERT INTO public.constellation VALUES ('Andromeda', 2, NULL);
INSERT INTO public.constellation VALUES ('Canis Major', 4, 'CMa');
INSERT INTO public.constellation VALUES ('Ursa Major', 5, 'UMa');
INSERT INTO public.constellation VALUES ('Cygnus', 3, 'Cyg');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 27, 8, 250, 1);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 47, 765, 1000, 2);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', NULL, 233017, NULL, 3);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', NULL, 8, 1, 4);
INSERT INTO public.galaxy VALUES (7, 'Ursa Major II Dwarf', 17, 30, NULL, 5);
INSERT INTO public.galaxy VALUES (8, 'Ursa Major I Dwarf', NULL, 100, NULL, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 1, 0.2);
INSERT INTO public.moon VALUES (2, 'Io', false, 5, 0.2);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5, 0.2);
INSERT INTO public.moon VALUES (3, 'Europa', true, 5, 0.1);
INSERT INTO public.moon VALUES (5, 'Callisto', true, 5, 0.1);
INSERT INTO public.moon VALUES (6, 'Enceladus', true, 4, 0.0);
INSERT INTO public.moon VALUES (7, 'Tethys', true, 4, 0.0);
INSERT INTO public.moon VALUES (8, 'Dione', true, 4, 0.0);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 4, 0.0);
INSERT INTO public.moon VALUES (10, 'Titan', true, 4, 0.1);
INSERT INTO public.moon VALUES (11, 'Iapetus', false, 4, 0.0);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 7, 0.0);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 7, 0.0);
INSERT INTO public.moon VALUES (14, 'Titania', true, 7, 0.0);
INSERT INTO public.moon VALUES (15, 'Oberon', false, 7, 0.0);
INSERT INTO public.moon VALUES (16, 'Triton', true, 6, 0.1);
INSERT INTO public.moon VALUES (17, 'Polaris Australis 7 a', false, 14, 0.1);
INSERT INTO public.moon VALUES (18, 'Polaris Australis 7 b', false, 14, 0.1);
INSERT INTO public.moon VALUES (19, 'Polaris Australis 7 c', false, 14, 0.1);
INSERT INTO public.moon VALUES (20, 'New World', true, 21, 0.6);
INSERT INTO public.moon VALUES (21, 'Conversion', true, 21, 0.9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', '30', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', '24', true, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', '47', true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', '10', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '13', false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', '5', true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '7', true, 1);
INSERT INTO public.planet VALUES (10, 'Polaris Australis 3', NULL, false, 2);
INSERT INTO public.planet VALUES (11, 'Polaris Australis 4', NULL, false, 2);
INSERT INTO public.planet VALUES (12, 'Polaris Australis 5', NULL, false, 2);
INSERT INTO public.planet VALUES (13, 'Polaris Australis 6', NULL, false, 2);
INSERT INTO public.planet VALUES (14, 'Polaris Australis 7', NULL, false, 2);
INSERT INTO public.planet VALUES (15, 'Polaris Australis 8', NULL, true, 2);
INSERT INTO public.planet VALUES (8, 'Polaris Australis 1', NULL, false, 2);
INSERT INTO public.planet VALUES (9, 'Polaris Australis 2', NULL, false, 2);
INSERT INTO public.planet VALUES (16, 'Waypoint', NULL, false, 7);
INSERT INTO public.planet VALUES (17, 'Lucifer', NULL, false, 7);
INSERT INTO public.planet VALUES (18, 'Achenar 1', NULL, false, 8);
INSERT INTO public.planet VALUES (19, 'Achenar 2', NULL, false, 8);
INSERT INTO public.planet VALUES (20, 'Achenar 3', NULL, false, 8);
INSERT INTO public.planet VALUES (21, 'Achenar 6', NULL, false, 8);
INSERT INTO public.planet VALUES (22, 'Achenar 9', NULL, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Beta Ursae Minoris', 2.08, 1, NULL);
INSERT INTO public.star VALUES (4, 'Gamma Ursae Minoris', 3.05, 1, NULL);
INSERT INTO public.star VALUES (1, 'Sol', 4.83, 1, 'Sun');
INSERT INTO public.star VALUES (6, 'Xi Andromedae', 4.90, 4, 'Adhil');
INSERT INTO public.star VALUES (2, 'Polaris Australis', 5.47, 1, 'Sigma Octantis');
INSERT INTO public.star VALUES (7, 'Alpha Canis Majoris', 8.44, 1, 'Sirius');
INSERT INTO public.star VALUES (8, 'Achenar', 3.64, 1, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation uq_constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT uq_constellation_name UNIQUE (name);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

