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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    solar_masses character varying(25),
    distance_from_earth character varying(25),
    super_massive boolean DEFAULT false,
    constellation character varying(20),
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(30) NOT NULL,
    diameter integer NOT NULL,
    distance character varying(20),
    constellation character varying(30)
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
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter character varying(25),
    radius_km integer,
    distance_from_planet character varying(25)
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
    star_id integer,
    earth_masses numeric,
    distance_au numeric,
    earth_radii numeric,
    suitable_of_life boolean DEFAULT false,
    description text,
    type character varying(25)
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
    galaxy_id integer,
    age_years character varying(25),
    type character varying(25),
    solar_radius numeric,
    distance_light_years character varying(20),
    solar_masses numeric DEFAULT 0,
    color character varying(15),
    temperature_k numeric DEFAULT 0
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (24, 'V616 Monocerotis', 'Stellar', '9.2–13.0', '3.000 light-years', false, 'Monoceros', 641);
INSERT INTO public.black_hole VALUES (25, 'GRO J1655-40', 'Stellar', '6.3–7.0', '3.200 light-years', false, 'Scorpius', 641);
INSERT INTO public.black_hole VALUES (26, 'Sagittarius A*', 'Stellar', '4.1 million', '25.640 light-years', true, 'Sagittarius', 641);
INSERT INTO public.black_hole VALUES (27, 'Cygnus X-1', ' Stellar', '14.8 ± 1.0', '6.070 light-years', false, 'Cygnus', 641);
INSERT INTO public.black_hole VALUES (28, 'M31', 'Supermassive', '110-230 million', '2.5 million light-years', true, 'Andromeda', 642);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (641, 'Milky Way', 'Spiral Galaxy', 140000, 'N/A', 'Sagittarius');
INSERT INTO public.galaxy VALUES (642, 'Andromeda Galaxy (M31)', 'Spiral Galaxy', 220000, '2.5 million', 'Andromeda');
INSERT INTO public.galaxy VALUES (643, 'Triangulum Galaxy (M33)', 'Spiral Galaxy', 50000, '2.7 million', 'Triangulum');
INSERT INTO public.galaxy VALUES (644, 'Whirlpool Galaxy (M51)', 'Spiral Galaxy', 100000, '23 million', 'Canes Venatici');
INSERT INTO public.galaxy VALUES (645, 'Sombrero Galaxy (M104)', 'Spiral Galaxy', 50000, '28 million', 'Virgo');
INSERT INTO public.galaxy VALUES (646, 'Large Magellanic Cloud', 'Irregular Galaxy', 14000, '163.000', 'Dorado and Mensa');
INSERT INTO public.galaxy VALUES (647, 'Small Magellanic Cloud', 'Irregular Galaxy', 7000, '200.000', 'Tucana');
INSERT INTO public.galaxy VALUES (648, 'Pinwheel Galaxy (M101)', 'Spiral Galaxy', 170000, '21 million', 'Ursa Majo');
INSERT INTO public.galaxy VALUES (649, 'Black Eye Galaxy (M64)', 'Spiral Galaxy', 60000, '24 million', 'Coma Berenices');
INSERT INTO public.galaxy VALUES (650, 'Cigar Galaxy (M82)', 'Starburst Galaxy', 5200, '12 million', 'Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (301, 'Luna', 309, '3474.2 km', 1737, '384400 km');
INSERT INTO public.moon VALUES (302, 'Phobos', 314, '22.2 km', 11, '9378 km');
INSERT INTO public.moon VALUES (303, 'Deimos', 314, '12.4 km', 6, '23460 km');
INSERT INTO public.moon VALUES (304, 'Io', 312, '3643.2 km', 1821, '421700 km');
INSERT INTO public.moon VALUES (305, 'Europa', 312, '3121.6 km', 1561, '671100 km');
INSERT INTO public.moon VALUES (306, 'Ganymede', 312, '5262.4 km', 2631, '1070400 km');
INSERT INTO public.moon VALUES (307, 'Callisto', 312, '4820.6 km', 2404, '1882700 km');
INSERT INTO public.moon VALUES (308, 'Mimas', 313, '396.4 km', 198, '185539 km');
INSERT INTO public.moon VALUES (309, 'Enceladus', 313, '504.2 km', 252, '238037 km');
INSERT INTO public.moon VALUES (310, 'Tethys', 313, '1070.4 km', 535, '294619 km');
INSERT INTO public.moon VALUES (311, 'Dione', 313, '1122.8 km', 561, '377415 km');
INSERT INTO public.moon VALUES (312, 'Rhea', 313, '1527.6 km', 764, '527108 km');
INSERT INTO public.moon VALUES (313, 'Titan', 313, '5150.0 km', 2575, '1221865 km');
INSERT INTO public.moon VALUES (314, 'Hyperion', 313, '266.0 km', 133, '1481100 km');
INSERT INTO public.moon VALUES (315, 'Iapetus', 313, '1468.0 km', 735, '3560820 km');
INSERT INTO public.moon VALUES (316, 'Miranda', 316, '472.6 km', 236, '129780 km');
INSERT INTO public.moon VALUES (317, 'Ariel', 316, '1157.8 km', 579, '191020 km');
INSERT INTO public.moon VALUES (318, 'Umbriel', 316, '1169.4 km', 585, '266300 km');
INSERT INTO public.moon VALUES (319, 'Titania', 316, '1577.8 km', 789, '435910 km');
INSERT INTO public.moon VALUES (320, 'Oberon', 316, '1522.8 km', 761, '583520 km');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (309, 'Earth', 782, 1, 1, 1, true, 'Our home planet, with liquid water on the surface and a breathable atmosphere. It is the only known planet to harbor life.', 'Terrestrial');
INSERT INTO public.planet VALUES (310, 'Mercury', 782, 0.055, 0.387, 0.383, false, 'Closest planet to the Sun with a heavily cratered surface and no atmosphere.', 'Terrestrial');
INSERT INTO public.planet VALUES (311, 'Neptune', 782, 17.147, 30.07, 3.883, false, 'Has a deep blue color and 14 moons, with a turbulent atmosphere of hydrogen, helium, and methane.', 'Ice Giant');
INSERT INTO public.planet VALUES (312, 'Jupiter', 782, 317.8, 5.20, 86.881, false, 'Largest planet in the solar system with 79 known moons, a thick atmosphere of hydrogen, helium, and ammonia.', 'Gas Giant');
INSERT INTO public.planet VALUES (313, 'Saturn', 782, 95.159, 9.58, 72.367, false, 'Known for its rings made of ice particles, with 82 known moons and a thick atmosphere of hydrogen, helium, and methane.', 'Gas Giant');
INSERT INTO public.planet VALUES (314, 'Mars', 782, 0.107, 1.52, 0.532, false, 'Known as the "Red Planet," it has a thin atmosphere and no liquid water on the surface, but may have subsurface liquid water and potential for microbial life.', 'Terrestrial');
INSERT INTO public.planet VALUES (315, 'Venus', 782, 0.815, 0.723, 0.949, false, 'Has a thick, toxic atmosphere with extreme greenhouse effect, making it the hottest planet in the solar system.', 'Terrestrial');
INSERT INTO public.planet VALUES (316, 'Uranus', 782, 14.536, 19.18, 4.007, false, 'Uranus is the seventh planet from the Sun and is the third-largest planet in the Solar System. It has the coldest planetary atmosphere in the Solar System, with a minimum temperature of -224 °C. Uranus is known for its unique feature: it rotates on its side, with an axial tilt of 98 degrees.', 'Ice giant');
INSERT INTO public.planet VALUES (317, 'Kepler-62f', 787, 0.63, 0.04, 1.41, true, 'Exoplanet in the habitable zone of a K-type star, potentially with liquid water on its surface.', 'Terrestrial');
INSERT INTO public.planet VALUES (318, 'Antares b', 786, 13.67, 550, 1.32, false, 'A gas giant planet that orbits a red supergiant star. Antares b is one of the few exoplanets that has been discovered using the radial velocity method, and its extreme proximity to its host star means that it has a surface temperature of over 1,500 degrees Celsius.', 'Gas Giant');
INSERT INTO public.planet VALUES (319, 'WASP-47e', 789, 9.3, 0.05, 3.34, false, 'Exoplanet with a mass similar to Neptune, orbiting a star with a binary companion.', 'Neptune-like');
INSERT INTO public.planet VALUES (320, 'Kepler-1625b', 790, 1.47, 0.05, 1.5, false, 'Exoplanet in a binary star system, with a large size similar to Jupiter.', 'Jupiter-like');
INSERT INTO public.planet VALUES (321, 'HD 131399Ab', 792, 4, 82, 1.5, false, 'Exoplanet orbiting a star in a triple star system, with an extremely wide orbit.', 'Jupiter-like');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (782, 'Sun', 641, '4.6 billion', 'G2V (Main-sequence)', 1.00, '0', 1.00, 'Yellow', 5.500);
INSERT INTO public.star VALUES (783, 'Sirius', 641, '2.6 - 300 million', 'Main Sequence', 1.71, '8.6', 2.02, 'Blue-white', 9.940);
INSERT INTO public.star VALUES (784, 'Betelgeuse', 641, '8 - 8.5 million', 'Red Supergiant', 910, '642', 13.3, 'Red', 3.500);
INSERT INTO public.star VALUES (785, 'Proxima Centauri', 641, '4.85 billion', 'Red Dwarf', 0.141, '4.24', 0.12, 'Red', 2.800);
INSERT INTO public.star VALUES (786, 'Antares', 641, '12 million', 'Red Supergiant', 998, '550', 15, 'Red', 3.500);
INSERT INTO public.star VALUES (787, 'Alpha Centauri A', 641, '6.3 billion', 'Main Sequence', 1.227, '4.37', 1.1, 'Yellow', 5.770);
INSERT INTO public.star VALUES (788, 'Alpha Centauri B', 641, '6.3 billion', 'Main Sequence', 0.865, '4.37', 0.907, 'Orange', 5.240);
INSERT INTO public.star VALUES (789, 'Rigel', 641, '10 million', 'Blue Supergiant', 95, '863', 17.1, 'Blue', 11.000);
INSERT INTO public.star VALUES (790, 'Vega', 641, '455 million', 'Main Sequence', 2.135, '25.05', 2.1, 'Blue', 9.600);
INSERT INTO public.star VALUES (791, 'Aldebaran', 641, '6.6 billion', 'Red Giant', 50.5, '65.23', 1.75, 'Orange-red', 3.900);
INSERT INTO public.star VALUES (792, 'Triangulum X-1', 643, '12.5 million', 'Neutron Star', 11.0, '3 million', 2.5, 'Blue', 1.2);
INSERT INTO public.star VALUES (793, 'Polaris', 641, '70-150 million', 'F7 yellow supergiant', 46.6, '323.2', 6, 'Yellow', 6.000);
INSERT INTO public.star VALUES (794, 'Eta Carinae', 641, '3 million', 'Luminous blue variable', 250, '7.500', 135, 'Blue', 25.000);
INSERT INTO public.star VALUES (795, 'WOH G64', 646, '2 million', 'Red hypergiant', 1.540, '163.000', 30, 'Red', 3.400);
INSERT INTO public.star VALUES (796, 'WR 102', 641, '2-3 million', 'Wolf-Rayet star', 1.5, '8.000', 35, 'Blue', 210.000);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 28, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 650, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 320, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 321, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 796, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

