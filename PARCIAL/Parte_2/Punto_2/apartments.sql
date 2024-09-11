--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.3

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.addresses (
    address_id integer NOT NULL,
    address character varying(255),
    city_id integer,
    latitude character varying(50),
    longitude character varying(50)
);


ALTER TABLE public.addresses OWNER TO "BDO_owner";

--
-- Name: addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.addresses_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_address_id_seq OWNER TO "BDO_owner";

--
-- Name: addresses_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.addresses_address_id_seq OWNED BY public.addresses.address_id;


--
-- Name: amenities; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.amenities (
    amenity_id integer NOT NULL,
    amenity_name character varying(255) NOT NULL
);


ALTER TABLE public.amenities OWNER TO "BDO_owner";

--
-- Name: amenities_amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.amenities_amenity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.amenities_amenity_id_seq OWNER TO "BDO_owner";

--
-- Name: amenities_amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.amenities_amenity_id_seq OWNED BY public.amenities.amenity_id;


--
-- Name: apartment_amenities; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.apartment_amenities (
    apartment_id bigint NOT NULL,
    amenity_id integer NOT NULL
);


ALTER TABLE public.apartment_amenities OWNER TO "BDO_owner";

--
-- Name: apartment_pet_types; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.apartment_pet_types (
    apartment_id bigint NOT NULL,
    pet_type_id integer NOT NULL
);


ALTER TABLE public.apartment_pet_types OWNER TO "BDO_owner";

--
-- Name: apartments; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.apartments (
    apartment_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    body text,
    bathrooms numeric,
    bedrooms integer,
    price bigint,
    currency character varying(10),
    fee character varying(10),
    has_photo character varying(50),
    price_display character varying(50),
    price_type character varying(50),
    square_feet bigint,
    address_id integer,
    city_id integer,
    source_id integer,
    category_id integer,
    "time" character varying(255)
);


ALTER TABLE public.apartments OWNER TO "BDO_owner";

--
-- Name: apartment_price_per_sqft; Type: VIEW; Schema: public; Owner: BDO_owner
--

CREATE VIEW public.apartment_price_per_sqft AS
 SELECT apartment_id,
    title,
    price,
    square_feet,
    (price / square_feet) AS price_per_sqft
   FROM public.apartments;


ALTER VIEW public.apartment_price_per_sqft OWNER TO "BDO_owner";

--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.apartments_apartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apartments_apartment_id_seq OWNER TO "BDO_owner";

--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.apartments_apartment_id_seq OWNED BY public.apartments.apartment_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO "BDO_owner";

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO "BDO_owner";

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(255) NOT NULL,
    state character varying(10) NOT NULL
);


ALTER TABLE public.cities OWNER TO "BDO_owner";

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_city_id_seq OWNER TO "BDO_owner";

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: pet_types; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.pet_types (
    pet_type_id integer NOT NULL,
    pet_type_name character varying(255) NOT NULL
);


ALTER TABLE public.pet_types OWNER TO "BDO_owner";

--
-- Name: pet_types_pet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.pet_types_pet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pet_types_pet_type_id_seq OWNER TO "BDO_owner";

--
-- Name: pet_types_pet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.pet_types_pet_type_id_seq OWNED BY public.pet_types.pet_type_id;


--
-- Name: sources; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.sources (
    source_id integer NOT NULL,
    source_name character varying(255) NOT NULL
);


ALTER TABLE public.sources OWNER TO "BDO_owner";

--
-- Name: sources_source_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.sources_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sources_source_id_seq OWNER TO "BDO_owner";

--
-- Name: sources_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.sources_source_id_seq OWNED BY public.sources.source_id;


--
-- Name: addresses address_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.addresses ALTER COLUMN address_id SET DEFAULT nextval('public.addresses_address_id_seq'::regclass);


--
-- Name: amenities amenity_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.amenities ALTER COLUMN amenity_id SET DEFAULT nextval('public.amenities_amenity_id_seq'::regclass);


--
-- Name: apartments apartment_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments ALTER COLUMN apartment_id SET DEFAULT nextval('public.apartments_apartment_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: pet_types pet_type_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pet_types ALTER COLUMN pet_type_id SET DEFAULT nextval('public.pet_types_pet_type_id_seq'::regclass);


--
-- Name: sources source_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.sources ALTER COLUMN source_id SET DEFAULT nextval('public.sources_source_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.addresses VALUES (0, '0', 1, '307.084', '-963.470');
INSERT INTO public.addresses VALUES (1, '7830 South Eighth St', 7, '422.837', '-855.793');
INSERT INTO public.addresses VALUES (2, '301 South Inspiration Rd', 8, '262.147', '-983.516');
INSERT INTO public.addresses VALUES (3, '519 Albee Farm Rd Unit 316', 10, '270.717', '-823.833');
INSERT INTO public.addresses VALUES (4, '7 9 11 12 13,16 20 Simpson St', 11, '418.859', '-883.101');
INSERT INTO public.addresses VALUES (5, '121 E Wedgewood', 13, '476.794', '-1.174.018');
INSERT INTO public.addresses VALUES (6, '210 N Easterling St', 14, '347.754', '-849.497');
INSERT INTO public.addresses VALUES (7, '7500 West Slaughter Lane', 16, '303.054', '-977.497');
INSERT INTO public.addresses VALUES (8, '9511 81st St', 17, '398.163', '-985.576');
INSERT INTO public.addresses VALUES (9, '9600 Escarpment Boulevard', 16, '303.054', '-977.497');
INSERT INTO public.addresses VALUES (10, '335 Double Creek Dr', 21, '397.078', '-863.938');
INSERT INTO public.addresses VALUES (11, '504 Esplanade', 23, '338.520', '-1.183.759');
INSERT INTO public.addresses VALUES (12, '422 Harrison St', 25, '404.969', '-869.659');
INSERT INTO public.addresses VALUES (13, '18851 W 153rd CT', 29, '388.647', '-948.283');
INSERT INTO public.addresses VALUES (14, '770 S 40th St', 30, '346.780', '-927.603');
INSERT INTO public.addresses VALUES (15, '751 E Holly St', 32, '436.046', '-1.162.475');
INSERT INTO public.addresses VALUES (16, '3409 Primm Ln', 35, '333.926', '-868.018');
INSERT INTO public.addresses VALUES (17, '80175 Ave 52', 36, '336.713', '-1.162.873');
INSERT INTO public.addresses VALUES (18, '7901 N Cortaro Rd', 37, '322.264', '-1.109.438');
INSERT INTO public.addresses VALUES (19, '100 N Santa Rosa Ave', 39, '294.624', '-985.253');
INSERT INTO public.addresses VALUES (20, '100 Crossing Boulevard', 40, '334.549', '-841.280');
INSERT INTO public.addresses VALUES (21, '100 Commercial Park Court', 41, '348.523', '-924.058');
INSERT INTO public.addresses VALUES (22, '2917 Heathrow Dr', 42, '420.259', '-936.516');
INSERT INTO public.addresses VALUES (23, '128-30 West 2nd St Putnam', 25, '415.486', '-905.922');
INSERT INTO public.addresses VALUES (24, '314 S Chauncey Ave', 44, '404.969', '-869.659');
INSERT INTO public.addresses VALUES (25, '2350 Phillips Road', 47, '304.601', '-842.714');
INSERT INTO public.addresses VALUES (26, '8409 5th Avenue NE #05', 50, '476.160', '-1.223.275');
INSERT INTO public.addresses VALUES (27, '855 Walther Boulevard', 52, '339.569', '-840.214');
INSERT INTO public.addresses VALUES (28, '1620 Corinthian Dr', 53, '389.885', '-846.468');
INSERT INTO public.addresses VALUES (29, '1750 P St NW', 54, '389.118', '-770.132');
INSERT INTO public.addresses VALUES (30, '2108 Vinton St', 56, '412.562', '-960.404');
INSERT INTO public.addresses VALUES (31, '608 Holiday Avenue', 57, '387.677', '-903.880');
INSERT INTO public.addresses VALUES (32, '200 Kedron Pwky', 58, '357.530', '-868.832');
INSERT INTO public.addresses VALUES (33, '245 Sinclair', 42, '420.259', '-936.516');
INSERT INTO public.addresses VALUES (34, '1100 N Cass St', 59, '430.531', '-879.659');
INSERT INTO public.addresses VALUES (35, '210 S Montgomery St', 62, '334.345', '-888.353');
INSERT INTO public.addresses VALUES (36, '2201 104th St South', 63, '472.154', '-1.224.608');
INSERT INTO public.addresses VALUES (37, '500 Bartlett St', 64, '377.599', '-1.224.379');
INSERT INTO public.addresses VALUES (38, '520 W Doty St', 66, '430.724', '-894.003');
INSERT INTO public.addresses VALUES (39, '1652 SE 28th St 103', 67, '253.801', '-804.041');
INSERT INTO public.addresses VALUES (40, '1800 Austin Parkway', 69, '296.015', '-956.306');
INSERT INTO public.addresses VALUES (41, '78 Buchanan St', 64, '377.599', '-1.224.379');
INSERT INTO public.addresses VALUES (42, '11476 Miranda St', 70, '341.881', '-1.183.905');
INSERT INTO public.addresses VALUES (43, '25 Bacon St', 72, '444.624', '-731.603');
INSERT INTO public.addresses VALUES (44, '3825 Anthem Way', 74, '338.335', '-1.121.292');
INSERT INTO public.addresses VALUES (45, '1016 N 39th St', 75, '479.179', '-970.658');
INSERT INTO public.addresses VALUES (46, '2309 Lyndale Avenue S', 24, '449.855', '-933.023');
INSERT INTO public.addresses VALUES (47, '135 Campus', 42, '420.259', '-936.516');
INSERT INTO public.addresses VALUES (48, '1996 County Rd D East', 78, '449.773', '-930.391');
INSERT INTO public.addresses VALUES (49, '1100 55th St N', 74, '479.179', '-970.658');
INSERT INTO public.addresses VALUES (50, '5400 Cascade Way', 80, '338.569', '-1.180.019');
INSERT INTO public.addresses VALUES (51, '19511 NE Halsey St', 81, '454.913', '-1.224.185');
INSERT INTO public.addresses VALUES (52, '4231 SW Emland Drive', 82, '390.375', '-957.052');
INSERT INTO public.addresses VALUES (53, '2275 Grove Way', 83, '377.184', '-1.220.656');
INSERT INTO public.addresses VALUES (54, '1321 Lake Dr West', 86, '448.525', '-935.502');
INSERT INTO public.addresses VALUES (55, '2409 10th Ave', 87, '429.115', '-878.656');
INSERT INTO public.addresses VALUES (56, '4901 S Macarthur Ln  1201 E 57th St', 89, '435.329', '-967.265');
INSERT INTO public.addresses VALUES (57, '817 W 5th St', 16, '303.054', '-977.497');
INSERT INTO public.addresses VALUES (58, '1100 Sterling Drive', 91, '410.091', '-742.081');
INSERT INTO public.addresses VALUES (59, 'Lockside 3210 3222 NW 54th St', 48, '476.160', '-1.223.275');
INSERT INTO public.addresses VALUES (60, '622 0rth Wayne St', 96, '330.769', '-833.032');
INSERT INTO public.addresses VALUES (61, '1350 Irwinton Rd', 96, '330.769', '-833.032');


--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.amenities VALUES (1, 'Garbage Disposal');
INSERT INTO public.amenities VALUES (2, 'Tennis');
INSERT INTO public.amenities VALUES (3, 'Pool');
INSERT INTO public.amenities VALUES (4, 'Internet Access');
INSERT INTO public.amenities VALUES (5, 'Wood Floors');
INSERT INTO public.amenities VALUES (6, 'Cable or Satellite');
INSERT INTO public.amenities VALUES (7, 'Clubhouse');
INSERT INTO public.amenities VALUES (8, 'Storage');
INSERT INTO public.amenities VALUES (9, 'TV');
INSERT INTO public.amenities VALUES (10, 'AC');
INSERT INTO public.amenities VALUES (11, 'Gym');
INSERT INTO public.amenities VALUES (12, 'No');
INSERT INTO public.amenities VALUES (13, 'Parking');
INSERT INTO public.amenities VALUES (14, 'Alarm');
INSERT INTO public.amenities VALUES (15, 'Fireplace');
INSERT INTO public.amenities VALUES (16, 'Elevator');
INSERT INTO public.amenities VALUES (17, 'Playground');
INSERT INTO public.amenities VALUES (18, 'Washer Dryer');
INSERT INTO public.amenities VALUES (19, 'Basketball');
INSERT INTO public.amenities VALUES (20, 'Dishwasher');
INSERT INTO public.amenities VALUES (21, 'Patio/Deck');
INSERT INTO public.amenities VALUES (22, 'Gated');
INSERT INTO public.amenities VALUES (23, 'Hot Tub');
INSERT INTO public.amenities VALUES (24, 'Refrigerator');


--
-- Data for Name: apartment_amenities; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.apartment_amenities VALUES (5629355898, 11);
INSERT INTO public.apartment_amenities VALUES (5629355898, 4);
INSERT INTO public.apartment_amenities VALUES (5629355898, 3);
INSERT INTO public.apartment_amenities VALUES (5629355898, 18);
INSERT INTO public.apartment_amenities VALUES (5509005268, 13);
INSERT INTO public.apartment_amenities VALUES (5509005268, 24);
INSERT INTO public.apartment_amenities VALUES (5509005268, 18);
INSERT INTO public.apartment_amenities VALUES (5509165195, 10);
INSERT INTO public.apartment_amenities VALUES (5509165195, 20);
INSERT INTO public.apartment_amenities VALUES (5509165195, 4);
INSERT INTO public.apartment_amenities VALUES (5509165195, 13);
INSERT INTO public.apartment_amenities VALUES (5509165195, 24);
INSERT INTO public.apartment_amenities VALUES (5509188159, 10);
INSERT INTO public.apartment_amenities VALUES (5509188159, 7);
INSERT INTO public.apartment_amenities VALUES (5509188159, 20);
INSERT INTO public.apartment_amenities VALUES (5509188159, 15);
INSERT INTO public.apartment_amenities VALUES (5509188159, 11);
INSERT INTO public.apartment_amenities VALUES (5509188159, 13);
INSERT INTO public.apartment_amenities VALUES (5509188159, 21);
INSERT INTO public.apartment_amenities VALUES (5509188159, 17);
INSERT INTO public.apartment_amenities VALUES (5509188159, 3);
INSERT INTO public.apartment_amenities VALUES (5509188159, 18);
INSERT INTO public.apartment_amenities VALUES (5509009082, 10);
INSERT INTO public.apartment_amenities VALUES (5509009082, 8);
INSERT INTO public.apartment_amenities VALUES (5508693080, 12);
INSERT INTO public.apartment_amenities VALUES (5668617532, 12);
INSERT INTO public.apartment_amenities VALUES (5668622956, 6);
INSERT INTO public.apartment_amenities VALUES (5668622956, 7);
INSERT INTO public.apartment_amenities VALUES (5668622956, 20);
INSERT INTO public.apartment_amenities VALUES (5668622956, 1);
INSERT INTO public.apartment_amenities VALUES (5668622956, 22);
INSERT INTO public.apartment_amenities VALUES (5668622956, 4);
INSERT INTO public.apartment_amenities VALUES (5668622956, 13);
INSERT INTO public.apartment_amenities VALUES (5668622956, 21);
INSERT INTO public.apartment_amenities VALUES (5668622956, 17);
INSERT INTO public.apartment_amenities VALUES (5668622956, 3);
INSERT INTO public.apartment_amenities VALUES (5668622956, 24);
INSERT INTO public.apartment_amenities VALUES (5508707650, 13);
INSERT INTO public.apartment_amenities VALUES (5508707650, 3);
INSERT INTO public.apartment_amenities VALUES (5668639051, 12);
INSERT INTO public.apartment_amenities VALUES (5668640569, 12);
INSERT INTO public.apartment_amenities VALUES (5508995033, 18);
INSERT INTO public.apartment_amenities VALUES (5664594525, 12);
INSERT INTO public.apartment_amenities VALUES (5664592555, 12);
INSERT INTO public.apartment_amenities VALUES (5668225138, 12);
INSERT INTO public.apartment_amenities VALUES (5668631897, 21);
INSERT INTO public.apartment_amenities VALUES (5668631897, 3);
INSERT INTO public.apartment_amenities VALUES (5668643105, 12);
INSERT INTO public.apartment_amenities VALUES (5668627377, 20);
INSERT INTO public.apartment_amenities VALUES (5668627377, 13);
INSERT INTO public.apartment_amenities VALUES (5668627377, 3);
INSERT INTO public.apartment_amenities VALUES (5668627377, 24);
INSERT INTO public.apartment_amenities VALUES (5668227011, 12);
INSERT INTO public.apartment_amenities VALUES (5509218438, 11);
INSERT INTO public.apartment_amenities VALUES (5509218438, 21);
INSERT INTO public.apartment_amenities VALUES (5509218438, 3);
INSERT INTO public.apartment_amenities VALUES (5509218438, 18);
INSERT INTO public.apartment_amenities VALUES (5668615127, 20);
INSERT INTO public.apartment_amenities VALUES (5668615127, 21);
INSERT INTO public.apartment_amenities VALUES (5668615127, 3);
INSERT INTO public.apartment_amenities VALUES (5668615127, 24);
INSERT INTO public.apartment_amenities VALUES (5509234766, 10);
INSERT INTO public.apartment_amenities VALUES (5509234766, 19);
INSERT INTO public.apartment_amenities VALUES (5509234766, 6);
INSERT INTO public.apartment_amenities VALUES (5509234766, 7);
INSERT INTO public.apartment_amenities VALUES (5509234766, 20);
INSERT INTO public.apartment_amenities VALUES (5509234766, 11);
INSERT INTO public.apartment_amenities VALUES (5509234766, 13);
INSERT INTO public.apartment_amenities VALUES (5509234766, 21);
INSERT INTO public.apartment_amenities VALUES (5509234766, 17);
INSERT INTO public.apartment_amenities VALUES (5509234766, 3);
INSERT INTO public.apartment_amenities VALUES (5509234766, 24);
INSERT INTO public.apartment_amenities VALUES (5509234766, 2);
INSERT INTO public.apartment_amenities VALUES (5509234766, 18);
INSERT INTO public.apartment_amenities VALUES (5509227082, 10);
INSERT INTO public.apartment_amenities VALUES (5509227082, 19);
INSERT INTO public.apartment_amenities VALUES (5509227082, 6);
INSERT INTO public.apartment_amenities VALUES (5509227082, 7);
INSERT INTO public.apartment_amenities VALUES (5509227082, 20);
INSERT INTO public.apartment_amenities VALUES (5509227082, 11);
INSERT INTO public.apartment_amenities VALUES (5509227082, 13);
INSERT INTO public.apartment_amenities VALUES (5509227082, 21);
INSERT INTO public.apartment_amenities VALUES (5509227082, 17);
INSERT INTO public.apartment_amenities VALUES (5509227082, 3);
INSERT INTO public.apartment_amenities VALUES (5509227082, 24);
INSERT INTO public.apartment_amenities VALUES (5509227082, 2);
INSERT INTO public.apartment_amenities VALUES (5509227082, 18);
INSERT INTO public.apartment_amenities VALUES (5668636875, 12);
INSERT INTO public.apartment_amenities VALUES (5659895572, 20);
INSERT INTO public.apartment_amenities VALUES (5659895572, 16);
INSERT INTO public.apartment_amenities VALUES (5659895572, 1);
INSERT INTO public.apartment_amenities VALUES (5659895572, 13);
INSERT INTO public.apartment_amenities VALUES (5659895572, 21);
INSERT INTO public.apartment_amenities VALUES (5659895572, 3);
INSERT INTO public.apartment_amenities VALUES (5659895572, 24);
INSERT INTO public.apartment_amenities VALUES (5668618375, 20);
INSERT INTO public.apartment_amenities VALUES (5668618375, 13);
INSERT INTO public.apartment_amenities VALUES (5668618375, 21);
INSERT INTO public.apartment_amenities VALUES (5668618375, 24);
INSERT INTO public.apartment_amenities VALUES (5509107380, 19);
INSERT INTO public.apartment_amenities VALUES (5509107380, 7);
INSERT INTO public.apartment_amenities VALUES (5509107380, 11);
INSERT INTO public.apartment_amenities VALUES (5509107380, 23);
INSERT INTO public.apartment_amenities VALUES (5509107380, 4);
INSERT INTO public.apartment_amenities VALUES (5509107380, 21);
INSERT INTO public.apartment_amenities VALUES (5509107380, 17);
INSERT INTO public.apartment_amenities VALUES (5509107380, 9);
INSERT INTO public.apartment_amenities VALUES (5509000066, 15);
INSERT INTO public.apartment_amenities VALUES (5509000066, 11);
INSERT INTO public.apartment_amenities VALUES (5509000066, 13);
INSERT INTO public.apartment_amenities VALUES (5509000066, 21);
INSERT INTO public.apartment_amenities VALUES (5509000066, 3);
INSERT INTO public.apartment_amenities VALUES (5509000066, 2);
INSERT INTO public.apartment_amenities VALUES (5509000066, 18);
INSERT INTO public.apartment_amenities VALUES (5668636556, 12);
INSERT INTO public.apartment_amenities VALUES (5508805948, 7);
INSERT INTO public.apartment_amenities VALUES (5508805948, 22);
INSERT INTO public.apartment_amenities VALUES (5508805948, 11);
INSERT INTO public.apartment_amenities VALUES (5508805948, 3);
INSERT INTO public.apartment_amenities VALUES (5508805948, 18);
INSERT INTO public.apartment_amenities VALUES (5668615251, 6);
INSERT INTO public.apartment_amenities VALUES (5668615251, 7);
INSERT INTO public.apartment_amenities VALUES (5668615251, 20);
INSERT INTO public.apartment_amenities VALUES (5668615251, 1);
INSERT INTO public.apartment_amenities VALUES (5668615251, 13);
INSERT INTO public.apartment_amenities VALUES (5668615251, 21);
INSERT INTO public.apartment_amenities VALUES (5668615251, 3);
INSERT INTO public.apartment_amenities VALUES (5668615251, 24);
INSERT INTO public.apartment_amenities VALUES (5668621079, 6);
INSERT INTO public.apartment_amenities VALUES (5668621079, 7);
INSERT INTO public.apartment_amenities VALUES (5668621079, 20);
INSERT INTO public.apartment_amenities VALUES (5668621079, 1);
INSERT INTO public.apartment_amenities VALUES (5668621079, 23);
INSERT INTO public.apartment_amenities VALUES (5668621079, 4);
INSERT INTO public.apartment_amenities VALUES (5668621079, 13);
INSERT INTO public.apartment_amenities VALUES (5668621079, 3);
INSERT INTO public.apartment_amenities VALUES (5668621079, 24);
INSERT INTO public.apartment_amenities VALUES (5509193802, 11);
INSERT INTO public.apartment_amenities VALUES (5509193802, 21);
INSERT INTO public.apartment_amenities VALUES (5509193802, 3);
INSERT INTO public.apartment_amenities VALUES (5509193802, 18);
INSERT INTO public.apartment_amenities VALUES (5668634782, 12);
INSERT INTO public.apartment_amenities VALUES (5668615042, 20);
INSERT INTO public.apartment_amenities VALUES (5668615042, 15);
INSERT INTO public.apartment_amenities VALUES (5668615042, 3);
INSERT INTO public.apartment_amenities VALUES (5668615042, 24);
INSERT INTO public.apartment_amenities VALUES (5509267318, 7);
INSERT INTO public.apartment_amenities VALUES (5509267318, 20);
INSERT INTO public.apartment_amenities VALUES (5509267318, 15);
INSERT INTO public.apartment_amenities VALUES (5509267318, 11);
INSERT INTO public.apartment_amenities VALUES (5509267318, 23);
INSERT INTO public.apartment_amenities VALUES (5509267318, 13);
INSERT INTO public.apartment_amenities VALUES (5509267318, 21);
INSERT INTO public.apartment_amenities VALUES (5509267318, 3);
INSERT INTO public.apartment_amenities VALUES (5509267318, 24);
INSERT INTO public.apartment_amenities VALUES (5509267318, 9);
INSERT INTO public.apartment_amenities VALUES (5509275588, 7);
INSERT INTO public.apartment_amenities VALUES (5509275588, 20);
INSERT INTO public.apartment_amenities VALUES (5509275588, 15);
INSERT INTO public.apartment_amenities VALUES (5509275588, 11);
INSERT INTO public.apartment_amenities VALUES (5509275588, 23);
INSERT INTO public.apartment_amenities VALUES (5509275588, 13);
INSERT INTO public.apartment_amenities VALUES (5509275588, 21);
INSERT INTO public.apartment_amenities VALUES (5509275588, 3);
INSERT INTO public.apartment_amenities VALUES (5509275588, 24);
INSERT INTO public.apartment_amenities VALUES (5509275588, 9);
INSERT INTO public.apartment_amenities VALUES (5509227184, 7);
INSERT INTO public.apartment_amenities VALUES (5509227184, 20);
INSERT INTO public.apartment_amenities VALUES (5509227184, 22);
INSERT INTO public.apartment_amenities VALUES (5509227184, 11);
INSERT INTO public.apartment_amenities VALUES (5509227184, 13);
INSERT INTO public.apartment_amenities VALUES (5509227184, 21);
INSERT INTO public.apartment_amenities VALUES (5509227184, 3);
INSERT INTO public.apartment_amenities VALUES (5509227184, 24);
INSERT INTO public.apartment_amenities VALUES (5664594957, 12);
INSERT INTO public.apartment_amenities VALUES (5668616768, 12);
INSERT INTO public.apartment_amenities VALUES (5664597445, 12);
INSERT INTO public.apartment_amenities VALUES (5668616726, 6);
INSERT INTO public.apartment_amenities VALUES (5668616726, 7);
INSERT INTO public.apartment_amenities VALUES (5668616726, 20);
INSERT INTO public.apartment_amenities VALUES (5668616726, 15);
INSERT INTO public.apartment_amenities VALUES (5668616726, 22);
INSERT INTO public.apartment_amenities VALUES (5668616726, 4);
INSERT INTO public.apartment_amenities VALUES (5668616726, 21);
INSERT INTO public.apartment_amenities VALUES (5668616726, 3);
INSERT INTO public.apartment_amenities VALUES (5668616726, 24);
INSERT INTO public.apartment_amenities VALUES (5509171538, 19);
INSERT INTO public.apartment_amenities VALUES (5509171538, 15);
INSERT INTO public.apartment_amenities VALUES (5509171538, 11);
INSERT INTO public.apartment_amenities VALUES (5509171538, 23);
INSERT INTO public.apartment_amenities VALUES (5509171538, 3);
INSERT INTO public.apartment_amenities VALUES (5509171538, 2);
INSERT INTO public.apartment_amenities VALUES (5664569521, 16);
INSERT INTO public.apartment_amenities VALUES (5664569521, 22);
INSERT INTO public.apartment_amenities VALUES (5664569521, 11);
INSERT INTO public.apartment_amenities VALUES (5664569521, 13);
INSERT INTO public.apartment_amenities VALUES (5664569521, 21);
INSERT INTO public.apartment_amenities VALUES (5664569521, 3);
INSERT INTO public.apartment_amenities VALUES (5664569521, 8);
INSERT INTO public.apartment_amenities VALUES (5668625855, 12);
INSERT INTO public.apartment_amenities VALUES (5668627564, 20);
INSERT INTO public.apartment_amenities VALUES (5668627564, 4);
INSERT INTO public.apartment_amenities VALUES (5668627564, 13);
INSERT INTO public.apartment_amenities VALUES (5668627564, 3);
INSERT INTO public.apartment_amenities VALUES (5668627564, 24);
INSERT INTO public.apartment_amenities VALUES (5664594490, 12);
INSERT INTO public.apartment_amenities VALUES (5509242122, 13);
INSERT INTO public.apartment_amenities VALUES (5509242122, 8);
INSERT INTO public.apartment_amenities VALUES (5668643137, 12);
INSERT INTO public.apartment_amenities VALUES (5668618408, 20);
INSERT INTO public.apartment_amenities VALUES (5668618408, 1);
INSERT INTO public.apartment_amenities VALUES (5668618408, 13);
INSERT INTO public.apartment_amenities VALUES (5668618408, 24);
INSERT INTO public.apartment_amenities VALUES (5509051507, 11);
INSERT INTO public.apartment_amenities VALUES (5509051507, 13);
INSERT INTO public.apartment_amenities VALUES (5509051507, 21);
INSERT INTO public.apartment_amenities VALUES (5508938507, 10);
INSERT INTO public.apartment_amenities VALUES (5508938507, 14);
INSERT INTO public.apartment_amenities VALUES (5508938507, 6);
INSERT INTO public.apartment_amenities VALUES (5508938507, 7);
INSERT INTO public.apartment_amenities VALUES (5508938507, 20);
INSERT INTO public.apartment_amenities VALUES (5508938507, 15);
INSERT INTO public.apartment_amenities VALUES (5508938507, 11);
INSERT INTO public.apartment_amenities VALUES (5508938507, 4);
INSERT INTO public.apartment_amenities VALUES (5508938507, 21);
INSERT INTO public.apartment_amenities VALUES (5508938507, 24);
INSERT INTO public.apartment_amenities VALUES (5508938507, 8);
INSERT INTO public.apartment_amenities VALUES (5508938507, 2);
INSERT INTO public.apartment_amenities VALUES (5508938507, 18);
INSERT INTO public.apartment_amenities VALUES (5668614517, 19);
INSERT INTO public.apartment_amenities VALUES (5668614517, 7);
INSERT INTO public.apartment_amenities VALUES (5668614517, 20);
INSERT INTO public.apartment_amenities VALUES (5668614517, 22);
INSERT INTO public.apartment_amenities VALUES (5668614517, 13);
INSERT INTO public.apartment_amenities VALUES (5668614517, 3);
INSERT INTO public.apartment_amenities VALUES (5668614517, 24);
INSERT INTO public.apartment_amenities VALUES (5508974243, 7);
INSERT INTO public.apartment_amenities VALUES (5508974243, 15);
INSERT INTO public.apartment_amenities VALUES (5508974243, 22);
INSERT INTO public.apartment_amenities VALUES (5508974243, 11);
INSERT INTO public.apartment_amenities VALUES (5508974243, 4);
INSERT INTO public.apartment_amenities VALUES (5508974243, 13);
INSERT INTO public.apartment_amenities VALUES (5508974243, 21);
INSERT INTO public.apartment_amenities VALUES (5508974243, 3);
INSERT INTO public.apartment_amenities VALUES (5508974243, 2);
INSERT INTO public.apartment_amenities VALUES (5508974243, 18);
INSERT INTO public.apartment_amenities VALUES (5508742389, 6);
INSERT INTO public.apartment_amenities VALUES (5508742389, 11);
INSERT INTO public.apartment_amenities VALUES (5508742389, 4);
INSERT INTO public.apartment_amenities VALUES (5508742389, 13);
INSERT INTO public.apartment_amenities VALUES (5508742389, 8);
INSERT INTO public.apartment_amenities VALUES (5668629901, 12);
INSERT INTO public.apartment_amenities VALUES (5509223793, 10);
INSERT INTO public.apartment_amenities VALUES (5509223793, 19);
INSERT INTO public.apartment_amenities VALUES (5509223793, 6);
INSERT INTO public.apartment_amenities VALUES (5509223793, 7);
INSERT INTO public.apartment_amenities VALUES (5509223793, 20);
INSERT INTO public.apartment_amenities VALUES (5509223793, 11);
INSERT INTO public.apartment_amenities VALUES (5509223793, 13);
INSERT INTO public.apartment_amenities VALUES (5509223793, 21);
INSERT INTO public.apartment_amenities VALUES (5509223793, 17);
INSERT INTO public.apartment_amenities VALUES (5509223793, 3);
INSERT INTO public.apartment_amenities VALUES (5509223793, 24);
INSERT INTO public.apartment_amenities VALUES (5509223793, 2);
INSERT INTO public.apartment_amenities VALUES (5509223793, 18);
INSERT INTO public.apartment_amenities VALUES (5509072766, 10);
INSERT INTO public.apartment_amenities VALUES (5509072766, 13);
INSERT INTO public.apartment_amenities VALUES (5668612448, 20);
INSERT INTO public.apartment_amenities VALUES (5668612448, 13);
INSERT INTO public.apartment_amenities VALUES (5668612448, 21);
INSERT INTO public.apartment_amenities VALUES (5668612448, 3);
INSERT INTO public.apartment_amenities VALUES (5668612448, 24);
INSERT INTO public.apartment_amenities VALUES (5668612448, 8);
INSERT INTO public.apartment_amenities VALUES (5668615301, 20);
INSERT INTO public.apartment_amenities VALUES (5668615301, 15);
INSERT INTO public.apartment_amenities VALUES (5668615301, 13);
INSERT INTO public.apartment_amenities VALUES (5668615301, 21);
INSERT INTO public.apartment_amenities VALUES (5668615301, 3);
INSERT INTO public.apartment_amenities VALUES (5668615301, 24);
INSERT INTO public.apartment_amenities VALUES (5668613816, 6);
INSERT INTO public.apartment_amenities VALUES (5668613816, 20);
INSERT INTO public.apartment_amenities VALUES (5668613816, 1);
INSERT INTO public.apartment_amenities VALUES (5668613816, 4);
INSERT INTO public.apartment_amenities VALUES (5668613816, 13);
INSERT INTO public.apartment_amenities VALUES (5668613816, 24);
INSERT INTO public.apartment_amenities VALUES (5508997698, 15);
INSERT INTO public.apartment_amenities VALUES (5508997698, 11);
INSERT INTO public.apartment_amenities VALUES (5508997698, 13);
INSERT INTO public.apartment_amenities VALUES (5508997698, 3);
INSERT INTO public.apartment_amenities VALUES (5508997698, 18);
INSERT INTO public.apartment_amenities VALUES (5509146646, 15);
INSERT INTO public.apartment_amenities VALUES (5509146646, 11);
INSERT INTO public.apartment_amenities VALUES (5509146646, 13);
INSERT INTO public.apartment_amenities VALUES (5509146646, 3);
INSERT INTO public.apartment_amenities VALUES (5509146646, 18);
INSERT INTO public.apartment_amenities VALUES (5509144370, 11);
INSERT INTO public.apartment_amenities VALUES (5509144370, 13);
INSERT INTO public.apartment_amenities VALUES (5668628920, 12);
INSERT INTO public.apartment_amenities VALUES (5664585003, 12);
INSERT INTO public.apartment_amenities VALUES (5659917491, 12);
INSERT INTO public.apartment_amenities VALUES (5659918254, 12);
INSERT INTO public.apartment_amenities VALUES (5668638856, 12);
INSERT INTO public.apartment_amenities VALUES (5509053677, 11);
INSERT INTO public.apartment_amenities VALUES (5509053677, 3);
INSERT INTO public.apartment_amenities VALUES (5509195034, 11);
INSERT INTO public.apartment_amenities VALUES (5509195034, 13);
INSERT INTO public.apartment_amenities VALUES (5509195034, 21);
INSERT INTO public.apartment_amenities VALUES (5509195034, 3);
INSERT INTO public.apartment_amenities VALUES (5668626244, 14);
INSERT INTO public.apartment_amenities VALUES (5668626244, 11);
INSERT INTO public.apartment_amenities VALUES (5668626244, 13);
INSERT INTO public.apartment_amenities VALUES (5668626244, 21);
INSERT INTO public.apartment_amenities VALUES (5668626244, 9);
INSERT INTO public.apartment_amenities VALUES (5668614420, 6);
INSERT INTO public.apartment_amenities VALUES (5668614420, 20);
INSERT INTO public.apartment_amenities VALUES (5668614420, 15);
INSERT INTO public.apartment_amenities VALUES (5668614420, 1);
INSERT INTO public.apartment_amenities VALUES (5668614420, 4);
INSERT INTO public.apartment_amenities VALUES (5668614420, 13);
INSERT INTO public.apartment_amenities VALUES (5668614420, 21);
INSERT INTO public.apartment_amenities VALUES (5668614420, 17);
INSERT INTO public.apartment_amenities VALUES (5668614420, 3);
INSERT INTO public.apartment_amenities VALUES (5668614420, 24);
INSERT INTO public.apartment_amenities VALUES (5509217631, 10);
INSERT INTO public.apartment_amenities VALUES (5509217631, 6);
INSERT INTO public.apartment_amenities VALUES (5509217631, 7);
INSERT INTO public.apartment_amenities VALUES (5509217631, 20);
INSERT INTO public.apartment_amenities VALUES (5509217631, 22);
INSERT INTO public.apartment_amenities VALUES (5509217631, 11);
INSERT INTO public.apartment_amenities VALUES (5509217631, 23);
INSERT INTO public.apartment_amenities VALUES (5509217631, 4);
INSERT INTO public.apartment_amenities VALUES (5509217631, 21);
INSERT INTO public.apartment_amenities VALUES (5509217631, 24);
INSERT INTO public.apartment_amenities VALUES (5509217631, 8);
INSERT INTO public.apartment_amenities VALUES (5509217631, 18);
INSERT INTO public.apartment_amenities VALUES (5509219655, 6);
INSERT INTO public.apartment_amenities VALUES (5509219655, 7);
INSERT INTO public.apartment_amenities VALUES (5509219655, 20);
INSERT INTO public.apartment_amenities VALUES (5509219655, 15);
INSERT INTO public.apartment_amenities VALUES (5509219655, 1);
INSERT INTO public.apartment_amenities VALUES (5509219655, 11);
INSERT INTO public.apartment_amenities VALUES (5509219655, 21);
INSERT INTO public.apartment_amenities VALUES (5509219655, 24);
INSERT INTO public.apartment_amenities VALUES (5509219655, 8);
INSERT INTO public.apartment_amenities VALUES (5509219655, 18);
INSERT INTO public.apartment_amenities VALUES (5509165793, 11);
INSERT INTO public.apartment_amenities VALUES (5509211431, 6);
INSERT INTO public.apartment_amenities VALUES (5509211431, 7);
INSERT INTO public.apartment_amenities VALUES (5509211431, 20);
INSERT INTO public.apartment_amenities VALUES (5509211431, 15);
INSERT INTO public.apartment_amenities VALUES (5509211431, 1);
INSERT INTO public.apartment_amenities VALUES (5509211431, 11);
INSERT INTO public.apartment_amenities VALUES (5509211431, 13);
INSERT INTO public.apartment_amenities VALUES (5509211431, 21);
INSERT INTO public.apartment_amenities VALUES (5509211431, 24);
INSERT INTO public.apartment_amenities VALUES (5509211431, 8);
INSERT INTO public.apartment_amenities VALUES (5509211431, 18);
INSERT INTO public.apartment_amenities VALUES (5668624057, 20);
INSERT INTO public.apartment_amenities VALUES (5668624057, 24);
INSERT INTO public.apartment_amenities VALUES (5509102227, 10);
INSERT INTO public.apartment_amenities VALUES (5509102227, 6);
INSERT INTO public.apartment_amenities VALUES (5509102227, 20);
INSERT INTO public.apartment_amenities VALUES (5509102227, 16);
INSERT INTO public.apartment_amenities VALUES (5509102227, 11);
INSERT INTO public.apartment_amenities VALUES (5509102227, 21);
INSERT INTO public.apartment_amenities VALUES (5509102227, 3);
INSERT INTO public.apartment_amenities VALUES (5509102227, 24);
INSERT INTO public.apartment_amenities VALUES (5509102227, 18);
INSERT INTO public.apartment_amenities VALUES (5664576787, 20);
INSERT INTO public.apartment_amenities VALUES (5664576787, 13);
INSERT INTO public.apartment_amenities VALUES (5664576787, 21);
INSERT INTO public.apartment_amenities VALUES (5509215696, 13);
INSERT INTO public.apartment_amenities VALUES (5509215696, 8);
INSERT INTO public.apartment_amenities VALUES (5509215696, 18);
INSERT INTO public.apartment_amenities VALUES (5544558459, 1);
INSERT INTO public.apartment_amenities VALUES (5544558459, 24);
INSERT INTO public.apartment_amenities VALUES (5509061809, 10);
INSERT INTO public.apartment_amenities VALUES (5509061809, 6);
INSERT INTO public.apartment_amenities VALUES (5509061809, 7);
INSERT INTO public.apartment_amenities VALUES (5509061809, 20);
INSERT INTO public.apartment_amenities VALUES (5509061809, 15);
INSERT INTO public.apartment_amenities VALUES (5509061809, 22);
INSERT INTO public.apartment_amenities VALUES (5509061809, 11);
INSERT INTO public.apartment_amenities VALUES (5509061809, 4);
INSERT INTO public.apartment_amenities VALUES (5509061809, 13);
INSERT INTO public.apartment_amenities VALUES (5509061809, 21);
INSERT INTO public.apartment_amenities VALUES (5509061809, 3);
INSERT INTO public.apartment_amenities VALUES (5509061809, 24);
INSERT INTO public.apartment_amenities VALUES (5509061809, 8);
INSERT INTO public.apartment_amenities VALUES (5509061809, 2);
INSERT INTO public.apartment_amenities VALUES (5509061809, 18);
INSERT INTO public.apartment_amenities VALUES (5509061809, 5);
INSERT INTO public.apartment_amenities VALUES (5668609372, 13);
INSERT INTO public.apartment_amenities VALUES (5668609372, 3);
INSERT INTO public.apartment_amenities VALUES (5668609372, 8);
INSERT INTO public.apartment_amenities VALUES (5668624110, 20);
INSERT INTO public.apartment_amenities VALUES (5668624110, 24);
INSERT INTO public.apartment_amenities VALUES (5668635808, 12);
INSERT INTO public.apartment_amenities VALUES (5668635564, 12);
INSERT INTO public.apartment_amenities VALUES (5509099137, 10);
INSERT INTO public.apartment_amenities VALUES (5509099137, 13);
INSERT INTO public.apartment_amenities VALUES (5509099137, 21);
INSERT INTO public.apartment_amenities VALUES (5509099137, 3);
INSERT INTO public.apartment_amenities VALUES (5509099137, 2);
INSERT INTO public.apartment_amenities VALUES (5509125154, 10);
INSERT INTO public.apartment_amenities VALUES (5509125154, 19);
INSERT INTO public.apartment_amenities VALUES (5509125154, 6);
INSERT INTO public.apartment_amenities VALUES (5509125154, 13);
INSERT INTO public.apartment_amenities VALUES (5508752793, 12);
INSERT INTO public.apartment_amenities VALUES (5668616955, 20);
INSERT INTO public.apartment_amenities VALUES (5668616955, 13);
INSERT INTO public.apartment_amenities VALUES (5668634944, 12);
INSERT INTO public.apartment_amenities VALUES (5664598513, 12);
INSERT INTO public.apartment_amenities VALUES (5509265463, 13);
INSERT INTO public.apartment_amenities VALUES (5509265463, 3);
INSERT INTO public.apartment_amenities VALUES (5661941724, 7);
INSERT INTO public.apartment_amenities VALUES (5661941724, 15);
INSERT INTO public.apartment_amenities VALUES (5661941724, 11);
INSERT INTO public.apartment_amenities VALUES (5661941724, 17);
INSERT INTO public.apartment_amenities VALUES (5661941724, 3);
INSERT INTO public.apartment_amenities VALUES (5668637513, 12);
INSERT INTO public.apartment_amenities VALUES (5508998368, 15);
INSERT INTO public.apartment_amenities VALUES (5508998368, 21);
INSERT INTO public.apartment_amenities VALUES (5508998368, 17);
INSERT INTO public.apartment_amenities VALUES (5508998368, 3);
INSERT INTO public.apartment_amenities VALUES (5508998368, 8);
INSERT INTO public.apartment_amenities VALUES (5508998368, 18);
INSERT INTO public.apartment_amenities VALUES (5659899382, 6);
INSERT INTO public.apartment_amenities VALUES (5659899382, 7);
INSERT INTO public.apartment_amenities VALUES (5659899382, 20);
INSERT INTO public.apartment_amenities VALUES (5659899382, 1);
INSERT INTO public.apartment_amenities VALUES (5659899382, 4);
INSERT INTO public.apartment_amenities VALUES (5659899382, 13);
INSERT INTO public.apartment_amenities VALUES (5659899382, 21);
INSERT INTO public.apartment_amenities VALUES (5659899382, 17);
INSERT INTO public.apartment_amenities VALUES (5659899382, 24);
INSERT INTO public.apartment_amenities VALUES (5668617849, 7);
INSERT INTO public.apartment_amenities VALUES (5668617849, 20);
INSERT INTO public.apartment_amenities VALUES (5668617849, 1);
INSERT INTO public.apartment_amenities VALUES (5668617849, 13);
INSERT INTO public.apartment_amenities VALUES (5668617849, 17);
INSERT INTO public.apartment_amenities VALUES (5668617849, 24);
INSERT INTO public.apartment_amenities VALUES (5668618041, 7);
INSERT INTO public.apartment_amenities VALUES (5668618041, 20);
INSERT INTO public.apartment_amenities VALUES (5668618041, 1);
INSERT INTO public.apartment_amenities VALUES (5668618041, 13);
INSERT INTO public.apartment_amenities VALUES (5668618041, 21);
INSERT INTO public.apartment_amenities VALUES (5668618041, 3);
INSERT INTO public.apartment_amenities VALUES (5668618041, 24);
INSERT INTO public.apartment_amenities VALUES (5668618041, 8);
INSERT INTO public.apartment_amenities VALUES (5659898702, 12);
INSERT INTO public.apartment_amenities VALUES (5668633895, 12);
INSERT INTO public.apartment_amenities VALUES (5668618635, 6);
INSERT INTO public.apartment_amenities VALUES (5668618635, 15);
INSERT INTO public.apartment_amenities VALUES (5668618635, 4);
INSERT INTO public.apartment_amenities VALUES (5668618635, 13);
INSERT INTO public.apartment_amenities VALUES (5668618635, 3);
INSERT INTO public.apartment_amenities VALUES (5668618635, 24);
INSERT INTO public.apartment_amenities VALUES (5664598264, 12);
INSERT INTO public.apartment_amenities VALUES (5509245368, 13);
INSERT INTO public.apartment_amenities VALUES (5509019480, 11);
INSERT INTO public.apartment_amenities VALUES (5509019480, 13);
INSERT INTO public.apartment_amenities VALUES (5509019480, 21);
INSERT INTO public.apartment_amenities VALUES (5509268579, 16);
INSERT INTO public.apartment_amenities VALUES (5509268579, 15);
INSERT INTO public.apartment_amenities VALUES (5509268579, 11);
INSERT INTO public.apartment_amenities VALUES (5509268579, 13);
INSERT INTO public.apartment_amenities VALUES (5509268579, 21);
INSERT INTO public.apartment_amenities VALUES (5508749003, 7);
INSERT INTO public.apartment_amenities VALUES (5508749003, 11);
INSERT INTO public.apartment_amenities VALUES (5508749003, 13);
INSERT INTO public.apartment_amenities VALUES (5508749003, 21);
INSERT INTO public.apartment_amenities VALUES (5508749003, 17);
INSERT INTO public.apartment_amenities VALUES (5508749003, 18);
INSERT INTO public.apartment_amenities VALUES (5668637293, 12);
INSERT INTO public.apartment_amenities VALUES (5664579415, 20);
INSERT INTO public.apartment_amenities VALUES (5664579415, 24);
INSERT INTO public.apartment_amenities VALUES (5509034679, 13);
INSERT INTO public.apartment_amenities VALUES (5664598194, 12);
INSERT INTO public.apartment_amenities VALUES (5668630408, 20);
INSERT INTO public.apartment_amenities VALUES (5668630408, 16);
INSERT INTO public.apartment_amenities VALUES (5668630408, 4);
INSERT INTO public.apartment_amenities VALUES (5668630408, 13);
INSERT INTO public.apartment_amenities VALUES (5668630408, 3);
INSERT INTO public.apartment_amenities VALUES (5668630408, 24);
INSERT INTO public.apartment_amenities VALUES (5509256330, 10);
INSERT INTO public.apartment_amenities VALUES (5509256330, 11);
INSERT INTO public.apartment_amenities VALUES (5509256330, 13);
INSERT INTO public.apartment_amenities VALUES (5509256330, 17);
INSERT INTO public.apartment_amenities VALUES (5509256330, 3);
INSERT INTO public.apartment_amenities VALUES (5509256330, 2);
INSERT INTO public.apartment_amenities VALUES (5509256330, 18);
INSERT INTO public.apartment_amenities VALUES (5664594421, 12);
INSERT INTO public.apartment_amenities VALUES (5509076533, 12);
INSERT INTO public.apartment_amenities VALUES (5668639235, 12);
INSERT INTO public.apartment_amenities VALUES (5508817616, 13);
INSERT INTO public.apartment_amenities VALUES (5508817616, 21);
INSERT INTO public.apartment_amenities VALUES (5508817616, 8);
INSERT INTO public.apartment_amenities VALUES (5509152430, 20);
INSERT INTO public.apartment_amenities VALUES (5509152430, 16);
INSERT INTO public.apartment_amenities VALUES (5509152430, 24);
INSERT INTO public.apartment_amenities VALUES (5509152430, 18);
INSERT INTO public.apartment_amenities VALUES (5509152430, 5);
INSERT INTO public.apartment_amenities VALUES (5509267866, 11);
INSERT INTO public.apartment_amenities VALUES (5509268840, 11);
INSERT INTO public.apartment_amenities VALUES (5663111837, 10);
INSERT INTO public.apartment_amenities VALUES (5663111837, 6);
INSERT INTO public.apartment_amenities VALUES (5663111837, 20);
INSERT INTO public.apartment_amenities VALUES (5663111837, 4);
INSERT INTO public.apartment_amenities VALUES (5663111837, 21);
INSERT INTO public.apartment_amenities VALUES (5663111837, 18);
INSERT INTO public.apartment_amenities VALUES (5641785233, 13);
INSERT INTO public.apartment_amenities VALUES (5641785233, 3);
INSERT INTO public.apartment_amenities VALUES (5663106093, 10);
INSERT INTO public.apartment_amenities VALUES (5663106093, 6);
INSERT INTO public.apartment_amenities VALUES (5663106093, 4);
INSERT INTO public.apartment_amenities VALUES (5663106093, 21);
INSERT INTO public.apartment_amenities VALUES (5663106093, 18);
INSERT INTO public.apartment_amenities VALUES (5663106093, 5);


--
-- Data for Name: apartment_pet_types; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.apartment_pet_types VALUES (5629355898, 2);
INSERT INTO public.apartment_pet_types VALUES (5509005268, 2);
INSERT INTO public.apartment_pet_types VALUES (5509165195, 3);
INSERT INTO public.apartment_pet_types VALUES (5509165195, 1);
INSERT INTO public.apartment_pet_types VALUES (5509188159, 2);
INSERT INTO public.apartment_pet_types VALUES (5509009082, 2);
INSERT INTO public.apartment_pet_types VALUES (5508693080, 2);
INSERT INTO public.apartment_pet_types VALUES (5668617532, 2);
INSERT INTO public.apartment_pet_types VALUES (5668622956, 3);
INSERT INTO public.apartment_pet_types VALUES (5668622956, 1);
INSERT INTO public.apartment_pet_types VALUES (5508707650, 2);
INSERT INTO public.apartment_pet_types VALUES (5668639051, 2);
INSERT INTO public.apartment_pet_types VALUES (5668640569, 3);
INSERT INTO public.apartment_pet_types VALUES (5668640569, 1);
INSERT INTO public.apartment_pet_types VALUES (5508995033, 2);
INSERT INTO public.apartment_pet_types VALUES (5664594525, 3);
INSERT INTO public.apartment_pet_types VALUES (5664594525, 1);
INSERT INTO public.apartment_pet_types VALUES (5664592555, 2);
INSERT INTO public.apartment_pet_types VALUES (5668225138, 3);
INSERT INTO public.apartment_pet_types VALUES (5668225138, 1);
INSERT INTO public.apartment_pet_types VALUES (5668631897, 2);
INSERT INTO public.apartment_pet_types VALUES (5668643105, 2);
INSERT INTO public.apartment_pet_types VALUES (5668627377, 3);
INSERT INTO public.apartment_pet_types VALUES (5668627377, 1);
INSERT INTO public.apartment_pet_types VALUES (5668227011, 3);
INSERT INTO public.apartment_pet_types VALUES (5668227011, 1);
INSERT INTO public.apartment_pet_types VALUES (5509218438, 2);
INSERT INTO public.apartment_pet_types VALUES (5668615127, 3);
INSERT INTO public.apartment_pet_types VALUES (5668615127, 1);
INSERT INTO public.apartment_pet_types VALUES (5509234766, 3);
INSERT INTO public.apartment_pet_types VALUES (5509234766, 1);
INSERT INTO public.apartment_pet_types VALUES (5509227082, 3);
INSERT INTO public.apartment_pet_types VALUES (5509227082, 1);
INSERT INTO public.apartment_pet_types VALUES (5668636875, 3);
INSERT INTO public.apartment_pet_types VALUES (5668636875, 1);
INSERT INTO public.apartment_pet_types VALUES (5659895572, 3);
INSERT INTO public.apartment_pet_types VALUES (5659895572, 1);
INSERT INTO public.apartment_pet_types VALUES (5668618375, 2);
INSERT INTO public.apartment_pet_types VALUES (5509107380, 3);
INSERT INTO public.apartment_pet_types VALUES (5509107380, 1);
INSERT INTO public.apartment_pet_types VALUES (5509000066, 3);
INSERT INTO public.apartment_pet_types VALUES (5509000066, 1);
INSERT INTO public.apartment_pet_types VALUES (5668636556, 3);
INSERT INTO public.apartment_pet_types VALUES (5668636556, 1);
INSERT INTO public.apartment_pet_types VALUES (5508805948, 2);
INSERT INTO public.apartment_pet_types VALUES (5668615251, 3);
INSERT INTO public.apartment_pet_types VALUES (5668615251, 1);
INSERT INTO public.apartment_pet_types VALUES (5668621079, 3);
INSERT INTO public.apartment_pet_types VALUES (5668621079, 1);
INSERT INTO public.apartment_pet_types VALUES (5509193802, 2);
INSERT INTO public.apartment_pet_types VALUES (5668634782, 2);
INSERT INTO public.apartment_pet_types VALUES (5668615042, 3);
INSERT INTO public.apartment_pet_types VALUES (5668615042, 1);
INSERT INTO public.apartment_pet_types VALUES (5509267318, 2);
INSERT INTO public.apartment_pet_types VALUES (5509275588, 2);
INSERT INTO public.apartment_pet_types VALUES (5509227184, 2);
INSERT INTO public.apartment_pet_types VALUES (5664594957, 3);
INSERT INTO public.apartment_pet_types VALUES (5664594957, 1);
INSERT INTO public.apartment_pet_types VALUES (5668616768, 3);
INSERT INTO public.apartment_pet_types VALUES (5664597445, 2);
INSERT INTO public.apartment_pet_types VALUES (5668616726, 3);
INSERT INTO public.apartment_pet_types VALUES (5668616726, 1);
INSERT INTO public.apartment_pet_types VALUES (5509171538, 3);
INSERT INTO public.apartment_pet_types VALUES (5509171538, 1);
INSERT INTO public.apartment_pet_types VALUES (5664569521, 2);
INSERT INTO public.apartment_pet_types VALUES (5668625855, 2);
INSERT INTO public.apartment_pet_types VALUES (5668627564, 3);
INSERT INTO public.apartment_pet_types VALUES (5668627564, 1);
INSERT INTO public.apartment_pet_types VALUES (5664594490, 3);
INSERT INTO public.apartment_pet_types VALUES (5509242122, 2);
INSERT INTO public.apartment_pet_types VALUES (5668643137, 3);
INSERT INTO public.apartment_pet_types VALUES (5668643137, 1);
INSERT INTO public.apartment_pet_types VALUES (5668618408, 2);
INSERT INTO public.apartment_pet_types VALUES (5509051507, 2);
INSERT INTO public.apartment_pet_types VALUES (5508938507, 2);
INSERT INTO public.apartment_pet_types VALUES (5668614517, 3);
INSERT INTO public.apartment_pet_types VALUES (5668614517, 1);
INSERT INTO public.apartment_pet_types VALUES (5508974243, 3);
INSERT INTO public.apartment_pet_types VALUES (5508974243, 1);
INSERT INTO public.apartment_pet_types VALUES (5508742389, 2);
INSERT INTO public.apartment_pet_types VALUES (5668629901, 2);
INSERT INTO public.apartment_pet_types VALUES (5509223793, 3);
INSERT INTO public.apartment_pet_types VALUES (5509223793, 1);
INSERT INTO public.apartment_pet_types VALUES (5509072766, 2);
INSERT INTO public.apartment_pet_types VALUES (5668612448, 3);
INSERT INTO public.apartment_pet_types VALUES (5668612448, 1);
INSERT INTO public.apartment_pet_types VALUES (5668615301, 3);
INSERT INTO public.apartment_pet_types VALUES (5668615301, 1);
INSERT INTO public.apartment_pet_types VALUES (5668613816, 3);
INSERT INTO public.apartment_pet_types VALUES (5668613816, 1);
INSERT INTO public.apartment_pet_types VALUES (5508997698, 3);
INSERT INTO public.apartment_pet_types VALUES (5508997698, 1);
INSERT INTO public.apartment_pet_types VALUES (5509146646, 3);
INSERT INTO public.apartment_pet_types VALUES (5509146646, 1);
INSERT INTO public.apartment_pet_types VALUES (5509144370, 2);
INSERT INTO public.apartment_pet_types VALUES (5668628920, 3);
INSERT INTO public.apartment_pet_types VALUES (5668628920, 1);
INSERT INTO public.apartment_pet_types VALUES (5664585003, 3);
INSERT INTO public.apartment_pet_types VALUES (5664585003, 1);
INSERT INTO public.apartment_pet_types VALUES (5659917491, 3);
INSERT INTO public.apartment_pet_types VALUES (5659918254, 3);
INSERT INTO public.apartment_pet_types VALUES (5659918254, 1);
INSERT INTO public.apartment_pet_types VALUES (5668638856, 3);
INSERT INTO public.apartment_pet_types VALUES (5668638856, 1);
INSERT INTO public.apartment_pet_types VALUES (5509053677, 2);
INSERT INTO public.apartment_pet_types VALUES (5509195034, 2);
INSERT INTO public.apartment_pet_types VALUES (5668626244, 2);
INSERT INTO public.apartment_pet_types VALUES (5668614420, 3);
INSERT INTO public.apartment_pet_types VALUES (5668614420, 1);
INSERT INTO public.apartment_pet_types VALUES (5509217631, 3);
INSERT INTO public.apartment_pet_types VALUES (5509217631, 1);
INSERT INTO public.apartment_pet_types VALUES (5509219655, 3);
INSERT INTO public.apartment_pet_types VALUES (5509219655, 1);
INSERT INTO public.apartment_pet_types VALUES (5509165793, 2);
INSERT INTO public.apartment_pet_types VALUES (5509211431, 3);
INSERT INTO public.apartment_pet_types VALUES (5509211431, 1);
INSERT INTO public.apartment_pet_types VALUES (5668624057, 3);
INSERT INTO public.apartment_pet_types VALUES (5668624057, 1);
INSERT INTO public.apartment_pet_types VALUES (5509102227, 3);
INSERT INTO public.apartment_pet_types VALUES (5509102227, 1);
INSERT INTO public.apartment_pet_types VALUES (5664576787, 2);
INSERT INTO public.apartment_pet_types VALUES (5509215696, 3);
INSERT INTO public.apartment_pet_types VALUES (5509215696, 1);
INSERT INTO public.apartment_pet_types VALUES (5544558459, 2);
INSERT INTO public.apartment_pet_types VALUES (5509061809, 3);
INSERT INTO public.apartment_pet_types VALUES (5509061809, 1);
INSERT INTO public.apartment_pet_types VALUES (5668609372, 3);
INSERT INTO public.apartment_pet_types VALUES (5668609372, 1);
INSERT INTO public.apartment_pet_types VALUES (5668624110, 3);
INSERT INTO public.apartment_pet_types VALUES (5668624110, 1);
INSERT INTO public.apartment_pet_types VALUES (5668635808, 2);
INSERT INTO public.apartment_pet_types VALUES (5668635564, 3);
INSERT INTO public.apartment_pet_types VALUES (5668635564, 1);
INSERT INTO public.apartment_pet_types VALUES (5509099137, 2);
INSERT INTO public.apartment_pet_types VALUES (5509125154, 2);
INSERT INTO public.apartment_pet_types VALUES (5508752793, 3);
INSERT INTO public.apartment_pet_types VALUES (5508752793, 1);
INSERT INTO public.apartment_pet_types VALUES (5668616955, 3);
INSERT INTO public.apartment_pet_types VALUES (5668616955, 1);
INSERT INTO public.apartment_pet_types VALUES (5668634944, 2);
INSERT INTO public.apartment_pet_types VALUES (5664598513, 3);
INSERT INTO public.apartment_pet_types VALUES (5664598513, 1);
INSERT INTO public.apartment_pet_types VALUES (5509265463, 3);
INSERT INTO public.apartment_pet_types VALUES (5509265463, 1);
INSERT INTO public.apartment_pet_types VALUES (5661941724, 2);
INSERT INTO public.apartment_pet_types VALUES (5668637513, 2);
INSERT INTO public.apartment_pet_types VALUES (5508998368, 2);
INSERT INTO public.apartment_pet_types VALUES (5659899382, 2);
INSERT INTO public.apartment_pet_types VALUES (5668617849, 2);
INSERT INTO public.apartment_pet_types VALUES (5668618041, 3);
INSERT INTO public.apartment_pet_types VALUES (5668618041, 1);
INSERT INTO public.apartment_pet_types VALUES (5659898702, 2);
INSERT INTO public.apartment_pet_types VALUES (5668633895, 3);
INSERT INTO public.apartment_pet_types VALUES (5668633895, 1);
INSERT INTO public.apartment_pet_types VALUES (5668618635, 3);
INSERT INTO public.apartment_pet_types VALUES (5668618635, 1);
INSERT INTO public.apartment_pet_types VALUES (5664598264, 2);
INSERT INTO public.apartment_pet_types VALUES (5509245368, 3);
INSERT INTO public.apartment_pet_types VALUES (5509245368, 1);
INSERT INTO public.apartment_pet_types VALUES (5509019480, 2);
INSERT INTO public.apartment_pet_types VALUES (5509268579, 2);
INSERT INTO public.apartment_pet_types VALUES (5508749003, 2);
INSERT INTO public.apartment_pet_types VALUES (5668637293, 3);
INSERT INTO public.apartment_pet_types VALUES (5664579415, 3);
INSERT INTO public.apartment_pet_types VALUES (5664579415, 1);
INSERT INTO public.apartment_pet_types VALUES (5509034679, 3);
INSERT INTO public.apartment_pet_types VALUES (5509034679, 1);
INSERT INTO public.apartment_pet_types VALUES (5664598194, 2);
INSERT INTO public.apartment_pet_types VALUES (5668630408, 3);
INSERT INTO public.apartment_pet_types VALUES (5668630408, 1);
INSERT INTO public.apartment_pet_types VALUES (5509256330, 2);
INSERT INTO public.apartment_pet_types VALUES (5664594421, 3);
INSERT INTO public.apartment_pet_types VALUES (5664594421, 1);
INSERT INTO public.apartment_pet_types VALUES (5509076533, 2);
INSERT INTO public.apartment_pet_types VALUES (5668639235, 3);
INSERT INTO public.apartment_pet_types VALUES (5668639235, 1);
INSERT INTO public.apartment_pet_types VALUES (5508817616, 2);
INSERT INTO public.apartment_pet_types VALUES (5509152430, 3);
INSERT INTO public.apartment_pet_types VALUES (5509152430, 1);
INSERT INTO public.apartment_pet_types VALUES (5509267866, 2);
INSERT INTO public.apartment_pet_types VALUES (5509268840, 2);
INSERT INTO public.apartment_pet_types VALUES (5663111837, 2);
INSERT INTO public.apartment_pet_types VALUES (5641785233, 3);
INSERT INTO public.apartment_pet_types VALUES (5641785233, 1);
INSERT INTO public.apartment_pet_types VALUES (5663106093, 2);


--
-- Data for Name: apartments; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.apartments VALUES (5629355898, 'Room with private bathroom for rent in a furnished 2 BR 2 BA apartment', 'I have a vacant room furnished with a queen bed with foam mattress, study table and dressers for $500/month. The room has a closet and spacious private bathroom. The apartment (900+ sq ft) has a private cloths washer and drier, and parking spot. The rent includes water, Internet and heating except electricity, access to gym, swimming pool and recreation zone. The location is ~ 2mis from campus and there is a bus stop within the apartment complex. I am looking for a responsible, clean and a professional working individual to rent the room. I am a professional engineer, graduated three years ago and recently moved to college station for work. I can be contacted for further enquiries of the room at Listedbuy. com', 2, 2, 500, 'USD', 'No', 'Thumbnail', '$ 500', 'Monthly', 900, 0, 1, 3, 2, '1575062563');
INSERT INTO public.apartments VALUES (5509005268, 'Apartment downstairs', 'This is a two beds, 1 bathrooms, 1 car carport apartment that has a disposal, a refrigerator, a gas stove, and central heat and air. area washer & dryer connections located within apartment complex in same building. 0 ok for pets. Stove, central heat, and hotwater heater: gas hook ups. Travis Elementary. Please visit. Cats 0t allowed, Dogs 0t allowed.', 1, 2, 500, 'USD', 'No', 'Thumbnail', '$ 500', 'Monthly', 900, 0, 2, 1, 1, '1568766847');
INSERT INTO public.apartments VALUES (5509165195, 'Apartment for rent in New Kensington. Single Car Garage!', 'Rent $455. Price range: $455 - $825. Square footage range: 900 - 900. Pet conditions: Dogs Allowed: 0, Cats Allowed: 0. Terms: Short-term Lease: Yes, Application Fee: 35.00. Amenities: Onsite Maintenance, Parking Covered, Parking Garage, Parking Surface Lot. Appliances: A/c, Dishwasher, Refrigerator. Interior Amenities: Ceiling Fan, Large Closets, Window Coverings. Air conditioned: Central. Utilities: High speed internet Included. Close to dining and shops, bright, gas stove, trash included. More units available: three Bd / 2 Bedrooms 1,300 square feet for $795/mo | one Bd / 1 Bedrooms 600 square ft for $500/mo | three Bd / 2 Bedrooms 1,300 square ft for $455/mo | one Bd / 1 Bedrooms 700 square ft for $455/mo', 1, 2, 455, 'USD', 'No', 'Thumbnail', '$ 455', 'Monthly', 900, 0, 3, 1, 1, '1568777326');
INSERT INTO public.apartments VALUES (5509188159, 'Over 901 sf in Coraopolis', 'Square footage: 901 sq-ft, unit number: 0143. s of Montour Run in Coraopolis, PA offers one-, two-, and 3 beds apartments for rent near Pittsburgh. Enjoy the convenience of an in-home washer and dryer, dishwasher, and microwave, as well as air conditioner and a fireplace in select homes. Get outdoors on your private balcony, or relax by our community pool. There''s also a twenty-four hour fitness facilities, club house, play-area, and a guest suite where your visiting friends and family can stay. We offer on-site maintenance and you can pay your rent on-line. We are pet friendly, so cats and dogs are of Montour Run! Our location in West Pittsburgh makes it easy to get to the airport or Interstate 376. Close to Robinson Town Centre! On Montour Run Trail. Under new management with Morgan Communities! Income Requirement: Must have 2. 5x the rent in total household income before taxes, include income from all adults. Utilities included: Trash. Additional Charges: Renter''s insurance required.', 1.5, 2, 1231, 'USD', 'No', 'Yes', '$ 1.231', 'Monthly', 901, 0, 4, 1, 1, '1568778533');
INSERT INTO public.apartments VALUES (5509009082, 'Charming Two BR, One BA', 'Nestled in the charm of Old Main in the beautiful historic district of South Yarmouth, The John Simpkins School offers stylishly designed studio, 1 and 2 beds apartment homes. The building which once served the community''s youth will be reintroduced as home to adults aged 55 and better. Choose from open-concept studio, one beds and two beds homes featuring new interiors, fully-equipped kitchens, a-c, oversized architectural windows, and historic elements throughout. Enjoy amenities including added storage, on-site laundry and bountiful community spaces. Enjoy neighborhood attractions including white sand beaches, shopping and entertainment just minutes away. one cat per household. $20/monthly charge.', 1, 2, 999, 'USD', 'No', 'Thumbnail', '$ 999', 'Monthly', 901, 0, 5, 1, 1, '1568767135');
INSERT INTO public.apartments VALUES (5508693080, 'Live the you''ve always wanted without compromising style or quality.', 'At The Melrose, our apartment residences are designed with you in mind. 0w you really can have it all. lifestyle included. Must move in before. Price from $874. More units available: two Bd / 1 Bedrooms 901 square feet for $799/mo | two Bd / 1 Bedrooms 901 square feet for $844/mo | one Bd / 1 Bedrooms 691 square ft for $699/mo | three Bd / 1.5 Bedrooms 1,025 square feet for $954/mo', 1, 2, 874, 'USD', 'No', 'Thumbnail', '$ 874', 'Monthly', 901, 0, 6, 1, 1, '1568745963');
INSERT INTO public.apartments VALUES (5668617532, 'Two BR 7830 South Eighth Street', 'This unit is located at 7830 South 8th Street, Kalamazoo, 49009, MIMonthly rental rates range from $850We have 2 beds units available for rent Apartment features include:-- A-c', 1, 2, 850, 'USD', 'No', 'Thumbnail', '$ 850', 'Monthly', 901, 1, 7, 2, 1, '1577358796');
INSERT INTO public.apartments VALUES (5668622956, 'Two BR 301 South Inspiration Road', 'This unit is located at 301 South Inspiration Road, Mission, 78572, TXMonthly rental rates range from $578 - $664We have two - three beds units available for rent Apartment features include:-- On-Site Laundry- Refrigerator- Water Included- On Bus Line- Trash Removal Included- Balcony, Deck, Patio- Garbage Disposal- Dishwasher', 2, 2, 578, 'USD', 'No', 'Thumbnail', '$ 578', 'Monthly', 901, 2, 8, 2, 1, '1577359146');
INSERT INTO public.apartments VALUES (5508707650, 'Denver Value!', 'Come home to a gorgeous new apartment and experience urban Downing Apartments in Capitol Hill. Located in the desirable Capitol Hill neighborhood, these fully updated Denver apartments are 1000smoke free and offer off-street parking, a sparkling pool, new game room and onsite laundry. Each residence is equipped with well-appointed finishes such as wood plank flooring, new appliances, tile back-splashes, designer color schemes and track lighting. Just minutes away from Downtown Denver, you can kiss your commute Good-bye! Walk to Cheesman Park, the Auditorium, Ogden Theater, Whole Foods Market, bars, restaurants and so much more! Pets - allowed Cats - allowed Dogs - allowed Price range: from $1,850 More units available: two Bd / 1 Bedrooms 950 square ft for $1,700/mo | two Bd / 1 Bedrooms 902 sq-ft for $1,965/mo | 0 Bd / 1 Bedrooms 430 sq-ft for $1,260/mo | 0 Bd / 1 Bedrooms 430 sq-ft for $1,375/mo | one Bd / 1 Bedrooms 700 square feet for $1,415/mo | 0 Bd / 1 Bedrooms 430 sq. feet for $1,270/mo', 1, 2, 1850, 'USD', 'No', 'Thumbnail', '$ 1.850', 'Monthly', 902, 0, 9, 1, 1, '1568746681');
INSERT INTO public.apartments VALUES (5668639051, 'Two BR 519 Albee Farm Road Unit 316', 'This unit is located at 519 Albee Farm Road Unit 316, Venice, 34285, FLMonthly rental rates range from $1250We have 2 beds units available for rent', 2, 2, 1250, 'USD', 'No', 'Thumbnail', '$ 1.250', 'Monthly', 902, 3, 10, 2, 1, '1577360281');
INSERT INTO public.apartments VALUES (5668640569, 'Two BR 7, 9, 11, 12, 13,16, 20 Simpson Street', 'This unit is located at 7, 9, 11, 12, 13,16, 20 Simpson Street, Geneva, 60134, ILMonthly rental rates range from $1225We have 2 beds units available for rent', 1, 2, 1225, 'USD', 'No', 'Thumbnail', '$ 1.225', 'Monthly', 902, 4, 11, 2, 1, '1577360393');
INSERT INTO public.apartments VALUES (5668618375, 'Three BR 422 Harrison Street', 'This unit is located at 422 Harrison Street, West Lafayette, 47906, INMonthly rental rates range from $1797We have 3 beds units available for rent Apartment features include:-- Carpet- Trash Removal Included- On-Site Laundry- Balcony, Deck, Patio- Water Included- Dishwasher- Microwave- Refrigerator', 3, 3, 1797, 'USD', 'No', 'Thumbnail', '$ 1.797', 'Monthly', 905, 12, 25, 2, 1, '1577358852');
INSERT INTO public.apartments VALUES (5508995033, 'Apartment in move in condition in Federal Way', 'Uptown, a brand new apartment community located in the heart of Federal, offers 1, 2, 3 and four beds apartment flats and 5 beds townhomes. Our spacious apartments offer everything you could ask for and some things you may have only dreamed of! Built with you in mind, we are a 0nsmoking, ok for pets and energy/water efficient -Sustainable Community. Each apartment home has a warm interior, contemporary cabinetry, microwave and cloths washer and drier. Our community is the most desirable location tohome in the area, offering anything you could want within reach. The. features shopping, movies, groceries and dining. Interstate five is less than a mile away, making your commute a breeze. Reserve your new home today and be among the very 1st residents toUptown home. Life is Better Here! Pets - allowed Comments: 2 animal max per household. Animal applies to each animal. Breed Restrictions may apply, our Leasing Team.', 1, 1, 1177, 'USD', 'No', 'Thumbnail', '$ 1.177', 'Monthly', 902, 0, 12, 1, 1, '1568766090');
INSERT INTO public.apartments VALUES (5664594525, 'Two BR 121 E Wedgewood', 'This unit is located at 121 E Wedgewood, Spokane, 99208, WAMonthly rental rates range from $845We have 2 beds units available for rent', 1, 2, 845, 'USD', 'No', 'Thumbnail', '$ 845', 'Monthly', 902, 5, 13, 2, 1, '1577016828');
INSERT INTO public.apartments VALUES (5664592555, 'Two BR 210 N Easterling Street', 'This unit is located at 210 N Easterling Street, Dalton, 30721, GAMonthly rental rates range from $700We have 2 beds units available for rent', 1, 2, 700, 'USD', 'No', 'Thumbnail', '$ 700', 'Monthly', 902, 6, 14, 2, 1, '1577016700');
INSERT INTO public.apartments VALUES (5668225138, 'Dorsey Ridge Villa Apartments #A5 - The Clio: H...', 'Dorsey Ridge Villa Apartments #A5 - The Clio: Ha0ver MD 21076. As you drive through the gates, you are impressed with the smart, sophisticated architecture that wraps around unrivaled community amenities all under 1 roof! Step inside the beautifully de... List ID: 925560506 | RealRentals.com', 1, 1, 1730, 'USD', 'No', 'Thumbnail', '$ 1.730', 'Monthly', 903, 0, 15, 4, 1, '1577305036');
INSERT INTO public.apartments VALUES (5668631897, 'One BR 7500 West Slaughter Ln.', 'This unit is located at 7500 West Slaughter Ln., Austin, 78749, TxMonthly rental rates range from $1495 - $1995We have one - two beds units available for rent', 1, 1, 1495, 'USD', 'No', 'Thumbnail', '$ 1.495', 'Monthly', 903, 7, 16, 2, 1, '1577359788');
INSERT INTO public.apartments VALUES (5668643105, 'One BR 9511 81st Street', 'This unit is located at 9511 81st Street, Pleasant Praririe, 53158, WIMonthly rental rates range from $1300 - $1400We have one - two beds units available for rent', 1.5, 1, 1300, 'USD', 'No', 'Thumbnail', '$ 1.300', 'Monthly', 903, 8, 17, 2, 1, '1577360547');
INSERT INTO public.apartments VALUES (5668627377, 'One BR 9600 Escarpment Blvd', 'This unit is located at 9600 Escarpment Blvd, Austin, 78749, TXMonthly rental rates range from $1265We have 1 beds units available for rent', 1, 1, 1265, 'USD', 'No', 'Thumbnail', '$ 1.265', 'Monthly', 903, 9, 16, 2, 1, '1577359456');
INSERT INTO public.apartments VALUES (5668227011, 'The Residences At The Ma0r Apartments #Two BR 2...', 'The Residences At The Ma0r Apartments #two Bedrooms 2 Bathrooms Ma0r Monroe: Frederick MD 21702. At this community you will find something very special-- a place that will make you feel welcome and important. This community''s commitment is reflected in the tenure of... List ID: 573761736 | RealRentals.com', 2, 2, 1240, 'USD', 'No', 'Thumbnail', '$ 1.240', 'Monthly', 903, 0, 19, 4, 1, '1577305308');
INSERT INTO public.apartments VALUES (5509218438, 'Euless, prime location Two BR, Apartment', 'Experience a community that combines affordability and style in Euless, TX. was designed with you in mind from our new exterior look and new energy efficient windows, to our state of the art finishes and interior selections with new black sleek appliances, track lighting and hardwood style flooring in select apartments. Come home to a trendy, stylish, state of the art apartment home close to everything Dallas for rent in Euless, TX. Located just minutes from DFW Airport and off of 360, is easy access to Fort Worth, Arlington, Dallas, and Grand Prairie. The TRE Centreport is less than 2 mis away from with easy fingertips. Stop in today to rent a home from a professional team that will work to exceed your expectations daily. We are excited for you to stop by! Pets - Max 2 allowed, Max weight 100 pound each, 1 time $325. 00, Rent $10.', 2, 2, 1055, 'USD', 'No', 'Yes', '$ 1.055', 'Monthly', 903, 0, 20, 1, 1, '1568779695');
INSERT INTO public.apartments VALUES (5668615127, 'One BR 335 Double Creek Drive', 'This unit is located at 335 Double Creek Drive, Plainfield, 46168, INMonthly rental rates range from $834 - $1631We have one - three beds units available for rent Apartment features include:-- Balcony, Deck, Patio- Fitness facilities- In-Unit Laundry- Refrigerator- Pool- Dishwasher- A/c', 1, 1, 834, 'USD', 'No', 'Thumbnail', '$ 834', 'Monthly', 903, 10, 21, 2, 1, '1577358654');
INSERT INTO public.apartments VALUES (5509234766, 'Over 904 sf in Plainsboro. Offstreet parking!', 'Square footage: 904 sq. feet, unit number: 0306. UNDER NEW MANAGEMENT! Our residents are our. at Princeton Meadows. Stop by to say hello and learn about the new apartment re0vations property. We are 0w offering limited time fall specials: 1 mnth FREE ON A 12-13 mnth LEASE and 1 1/2 monS FREE ON A 14-15 mnth LEASE on our brand new updated one beds. 1 mon AND A HALF FREE ON 12-13 mon LEASE and 2 monthS FREE ON 14-fifteen month LEASE for new up-to-date two beds apartments. Looking for a spacious, well-appointed apartment in a fantastic location. Meadows is the for you. Featuring clean, classic designs, spectacular views, gorgeous landscaping and an incredible selection of luxurious amenities, our charming community of apartments for rent in Plainsboro, NJ is guaranteed to keep you coming home with a smile on your face each and every day.', 1, 2, 1770, 'USD', 'No', 'Thumbnail', '$ 1.770', 'Monthly', 904, 0, 22, 1, 1, '1568780321');
INSERT INTO public.apartments VALUES (5509227082, 'Gorgeous Plainsboro, Two BR, One BA', 'Square footage: 904 sq-ft, unit number: 1707. UNDER NEW MANAGEMENT! Our residents are our. at Princeton Meadows. Stop by to say hello and learn about the new apartment re0vations property. We are 0w offering one month FREE ON A 12-13 mnth LEASE and 1 1/two monthS FREE ON A 14-fifteen month LEASE on our brand new updated apartments. Looking for a spacious, well-appointed apartment in a terrific location. Meadows is the for you. Featuring clean, classic designs, amazing views, gorgeous landscaping and an incredible selection of luxurious amenities, our charming community of apartments for rent in Plainsboro, NJ is guaranteed to keep you coming home with a smile on your face each and every day. Whether you are enjoying interior perks like bright, open floor plans, modern gourmet kitchens and private patios and balconies, or shared features like a sparkling outdoor swimming pool with sundeck, modern health and fitness facilities', 1, 2, 1770, 'USD', 'No', 'Thumbnail', '$ 1.770', 'Monthly', 904, 0, 22, 1, 1, '1568779983');
INSERT INTO public.apartments VALUES (5668636875, 'Two BR 504 ESPLANADE', 'This unit is located at 504 ESPLANADE, Redondo Beach, 90277, CAMonthly rental rates range from $2859We have 2 beds units available for rent', 2, 2, 2859, 'USD', 'No', 'Thumbnail', '$ 2.859', 'Monthly', 905, 11, 23, 2, 1, '1577360136');
INSERT INTO public.apartments VALUES (5659895572, 'One BR W Lake St & Dean Parkway', 'This unit is located at W Lake St & Dean Parkway, Minneapolis, 55416, MNMonthly rental rates range from $2450 - $3995We have one - two beds units available for rent Apartment features include:-- Balcony, Deck, Patio- Ac- Fitness facilities- Dishwasher- Garbage Disposal- Pool- Refrigerator- In-Unit Laundry', 1, 1, 2450, 'USD', 'No', 'Thumbnail', '$ 2.450', 'Monthly', 905, 0, 24, 2, 1, '1576666263');
INSERT INTO public.apartments VALUES (5509107380, 'Move-in condition, Two BR Two BA', 'Square footage: 905 sq. feet, unit number: 2K101. Part of you loves peaceful mornings on the deck, tranquil walks through the trees and a soak in the sparkling pools. A part of you craves action and excitement from the state-of-the art fitness facilities with indoor activity hub, outdoor basketball and picnic area with barbecue''s. All that you want, all that you love, put together piece by piece, like a mosaic, to create the ideal to live. Seize your chance to live in 1 of the premier apartment communities in Kent, WA. Picture coming home every day to the warm embrace of meticulous landscaping, comfortable homes, and thoughtful amenities tailored to enhance your life. Located in Kent, with easy access to 240th and James. Hill, Mosaic Hills is just minutes away from Kent Station, as well as all of the shopping, dining, and entertainment that nearby Seattle has to offer.', 2, 2, 1468, 'USD', 'No', 'Yes', '$ 1.468', 'Monthly', 905, 0, 26, 1, 1, '1568773800');
INSERT INTO public.apartments VALUES (5509000066, 'Amazing Two BR, Two BA for rent', 'Welcome to Windsong Apartments in Dallas, TX, a Choice Living Apartment Community featuring Distinct Living and spacious floorplans. Your pet-friendly home features large closets, built-in microwave, walk-in closets and in-home washer dryer connections. Everything was designed with you in mind. Relax alongside 1 of our refreshing resort-style swimming pools with outdoor cooking area, work up a sweat in our twenty-four hour fitness facilities or play a round of tennis on our tennis courts. Conveniently located with easy access to President George Bush Turnpike, the 0rth Dallas Tollway, Sam Rayburn Tollway and I-35, you are close to everything that Dallas offers. Welcome Home This is Choice Living. BBQ/Picnic Area, Professional center, Sheltered parking, Fitness facilities, Pool, Tennis, Ceiling Fan, Fireplace, Vaulted ceilings, Large Closets, Microwave, State of the art Black Appliances, Patio/Balcony, Premium, Upgraded Flooring. Pet-friendly, Max weight 75 pound each, 1 time $400.', 2, 2, 1330, 'USD', 'No', 'Thumbnail', '$ 1.330', 'Monthly', 905, 0, 27, 1, 1, '1568766447');
INSERT INTO public.apartments VALUES (5668636556, 'Two BR IH 35 and Slaughter', 'This unit is located at IH 35 and Slaughter, Austin, 78744, TXMonthly rental rates range from $1240We have 2 beds units available for rent', 1, 2, 1240, 'USD', 'No', 'Thumbnail', '$ 1.240', 'Monthly', 905, 0, 16, 2, 1, '1577360119');
INSERT INTO public.apartments VALUES (5508805948, 'Two BR Apartment - Large & Bright', 'Price from: 1160. Welcome home to The Apartments. Located in the heart of Silverado Ranch in Las Vegas, NV. The is close to shopping and restaurants as well as major freeway access. We offer amenities like 0 other, a twenty-four hour fitness facilities, gated access and an intrusion alarm for added secure, a spectacular club house for all your party-planning needs, and a sparkling swimming pool with spa. Our apartment homes offer 9 foot ceilings, all electric kitchens, garden tubs, cloths washer and drier, window seats, mirrored closet doors, and a breakfast area. We have recently up-to-date interiors, featuring granite counter tops, with upgraded cabinets, stainless steel appliances and wood plank floors. our office staff today to see what we can do for you.', 1, 2, 1160, 'USD', 'No', 'Thumbnail', '$ 1.160', 'Monthly', 905, 0, 28, 1, 1, '1568754034');
INSERT INTO public.apartments VALUES (5668615251, 'One BR 18851 W. 153rd Court', 'This unit is located at 18851 W. 153rd Court, Olathe, 66062, KSMonthly rental rates range from $1050 - $1510We have one - three beds units available for rent Apartment features include:-- In-Unit Laundry- Sheltered parking- Garbage Disposal- Fitness facilities- Balcony, Deck, Patio- Refrigerator- Dishwasher- Air conditioned', 1, 1, 1050, 'USD', 'No', 'Thumbnail', '$ 1.050', 'Monthly', 905, 13, 29, 2, 1, '1577358663');
INSERT INTO public.apartments VALUES (5668621079, 'Two BR 770 S. 40th Street', 'This unit is located at 770 S. 40th Street, Springdale, 72762, ARMonthly rental rates range from $795 - $895We have two - three beds units available for rent Apartment features include:-- Trash Removal Included- Garbage Disposal- Surface Parking- Laundry hookups- Water Included- Air conditioner- Refrigerator- Dishwasher', 2, 2, 795, 'USD', 'No', 'Thumbnail', '$ 795', 'Monthly', 905, 14, 30, 2, 1, '1577359037');
INSERT INTO public.apartments VALUES (5509193802, '906 sq. ft. \ One BA - ready to move in.', 'Square footage: 906 sq. feet, unit number: 11. The Gateway offers stunning apartment homes in a phe0menal location near Baltimore, Washington DC and Annapolis. Whether for work or play, you won t have to travel far for a whole host of amazing locations. These one, two, and three beds apartments for rent in Odenton, MD have an elegant yet practical design to accommodate residents with both convenience and comfort. Walk through the large living room, with impressive 9 foot ceilings adorned with graceful crown molding, to the private screened- in balcony or sunroom. Fully equipped with appliances, this home has a washer-dryer in a space-saving laundry closet, while the designer kitchens blend beauty and practicality with premium granite counters, maple cabinets and brushed nickel hardware. The Gateway does 0t apartment homes. It provides residents with a whole community s worth of exciting amenities. state-of-the-art fitness facilities, then relax by the private swimming pool.', 1, 1, 1743, 'USD', 'No', 'Yes', '$ 1.743', 'Monthly', 906, 0, 31, 1, 1, '1568778729');
INSERT INTO public.apartments VALUES (5668634782, 'Two BR 751 E. Holly St.', 'This unit is located at 751 E. Holly St., Boise, 83712, IDMonthly rental rates range from $1700We have 2 beds units available for rent', 1, 2, 1700, 'USD', 'No', 'Thumbnail', '$ 1.700', 'Monthly', 906, 15, 32, 2, 1, '1577360007');
INSERT INTO public.apartments VALUES (5509267318, 'The Seasons - the you want tohome!', 'Our apartment homes offer remodeled kitchen appliances, counter tops, and light fixtures throughout the home. Each apartment home offers its own private deck or patio with greenbelt views in select models. Our elegant interiors are available with romantic wood-burning fireplaces, convenience of full-size washers and dryers, dishwashers, and garbage disposals as well as frost-free refrigerators. With your Seasons home, you''ll enjoy a free reserved parking space, plus garages are available for rent. We offer an elegant club house for entertaining, full kitchen, sunken seating room with big screen TELEVISION and free Wi-Fi, heated Pool, 24hr fitness facilities, half size indoor basket ball, and indoor hot bathtub. Here you''ll find a home that gives you comfort, style and quality and a team that is here for you! lets you live the good life. Price range: $1,683.00 - $1,688.00.', 1.5, 2, 1683, 'USD', 'No', 'Thumbnail', '$ 1.683', 'Monthly', 906, 0, 33, 1, 1, '1568782026');
INSERT INTO public.apartments VALUES (5509275588, 'The Seasons - the you want tohome!', 'Square footage: 906 square feet, unit number: T179. Our apartment homes offer remodeled kitchen appliances, counters, and light fixtures throughout the home. Each apartment home offers its own private deck or patio with greenbelt views in select models. Our elegant interiors are available with romantic wood-burning fireplaces, convenience of full-size washers and dryers, dishwashers, and garbage disposals as well as frost-free refrigerators. With your Seasons home, you''ll enjoy a free reserved parking space, plus garages are available for rent. We offer an elegant club house for entertaining, full kitchen, sunken seating room with big screen TELEVISION and free Wi-Fi, heated Pool, twenty-four-hour fitness facilities, half size indoor basket ball, and indoor hot bathtub. Here you''ll find a home that gives you comfort, style and quality and a team that is here for you! lets you live the good life. Price range: $1,683.00 - $1,778.00.', 1.5, 2, 1683, 'USD', 'No', 'Thumbnail', '$ 1.683', 'Monthly', 906, 0, 33, 1, 1, '1568782542');
INSERT INTO public.apartments VALUES (5509227184, 'Bright Granbury, One BR, 1.50 BA for rent', 'Square footage: 906 sq. feet, unit number: 103. Price from: 1295. Lakehouse is the lakefront home you have been searching for. Situated on the shore of Lake Granbury, this waterfront oasis will delight you with magnificent views and breathtaking sunsets. We are located off 377, near the Historic Granbury. A variety of local shopping, dining, and entertainment options are within moments from your home. Premium interior craftsmanship is evident in our 7 masterfully crafted 1 and 2 beds homes. nine foot ceilings, garden tubs, a balcony or patio, and all-electric kitchens with dishwasher, refrigerator, microwave, breakfast 0ok, and walk-in closets await you. Select apartments for rent feature large bay windows providing an amazing of Lake Granbury. Our Texas-sized dog park is the perfect for a walk with your furry family member, as we are pet friendly. Quality of life is what Lakehouse living is all about. Community features include gated access, a club house, and sheltered parking.', 1.5, 1, 1295, 'USD', 'No', 'No', '$ 1.295', 'Monthly', 906, 0, 34, 1, 1, '1568779988');
INSERT INTO public.apartments VALUES (5664594957, 'One BR Slaughter and Brodie', 'This unit is located at Slaughter and Brodie, Austin, 78749, TXMonthly rental rates range from $1175 - $1545We have one - two beds units available for rent', 1, 1, 1175, 'USD', 'No', 'Thumbnail', '$ 1.175', 'Monthly', 906, 0, 16, 2, 1, '1577016865');
INSERT INTO public.apartments VALUES (5668616768, 'One BR 3409 Primm Lane', 'This unit is located at 3409 Primm Lane, Hoover, 35216, ALMonthly rental rates range from $730 - $1000We have one - three beds units available for rent', 1, 1, 730, 'USD', 'No', 'Thumbnail', '$ 730', 'Monthly', 906, 16, 35, 2, 1, '1577358748');
INSERT INTO public.apartments VALUES (5664597445, 'One BR 80175 Avenue 52', 'This unit is located at 80175 Avenue 52, La Quinta, 92253, CAMonthly rental rates range from $1369We have 1 beds units available for rent', 1, 1, 1369, 'USD', 'No', 'Thumbnail', '$ 1.369', 'Monthly', 907, 17, 36, 2, 1, '1577017084');
INSERT INTO public.apartments VALUES (5668616726, 'Studio apartment 7901 N. Cortaro Road', 'This unit is located at 7901 N. Cortaro Road, Tucson, 85743, AZMonthly rental rates range from $925 - $1450We have studio - 3 beds units available for rent Apartment features include:-- Fitness facilities- Refrigerator- In-Unit Laundry- Dishwasher- Fireplace- Balcony, Deck, Patio- Air conditioned- Pool', 1, 3, 1194, 'USD', 'No', 'Thumbnail', '$ 1.194', 'Monthly', 907, 18, 37, 2, 1, '1577358745');
INSERT INTO public.apartments VALUES (5509171538, 'Outstanding Opportunity To Live At The Mountlake Terrace City Club', 'Whether it s a rustle of trees or the calming crackle of a fire, Taluswood Apartments embraces its residents in refreshed one, two, and three beds apartment homes in Mountlake Terrace, Washington. It s a community that takes hold of its Pacific 0rthwest roots, with direct access to the Creek Side Walking Trail and idyllic outdoor features settled within the property s confines. Interested in journeying outside. seamlessly to nearby Seattle, or map out a short journey to the mountains or shores of Lake Washington. Unveil this Mountlake Terrace retreat and plan your visit. Retreat from Other Seattle, Lynnwood and Mountlake Terrace Apartments Wind down in the shade of the lush landscape of Taluswood Apartments. If that does 0t cut it for you, however, consider mowing over to the heated pool, relaxing in the indoor hot bath-tub, or strolling along the Creek Side Walking Trail with your four-legged friend. Easing into an is also an option, with an ability to cozy up to your own wood-burning fireplace.', 2, 2, 1640, 'USD', 'No', 'Thumbnail', '$ 1.640', 'Monthly', 908, 0, 38, 1, 1, '1568777665');
INSERT INTO public.apartments VALUES (5664569521, 'One BR 100 N Santa Rosa Avenue', 'This unit is located at 100 N Santa Rosa Avenue, San Antonio, 78207, TXMonthly rental rates range from $1225 - $2150We have one - two beds units available for rent Apartment available amenities:-- Fitness facilities- On-Site Laundry', 1, 1, 1225, 'USD', 'No', 'Thumbnail', '$ 1.225', 'Monthly', 908, 19, 39, 2, 1, '1577014956');
INSERT INTO public.apartments VALUES (5668625855, 'One BR 100 Crossing Blvd', 'This unit is located at 100 Crossing Blvd, Mcdo0ugh, 30253, GAMonthly rental rates range from $1010 - $1375We have one - three beds units available for rent', 1, 1, 1010, 'USD', 'No', 'Thumbnail', '$ 1.010', 'Monthly', 908, 20, 40, 2, 1, '1577359344');
INSERT INTO public.apartments VALUES (5668627564, 'Two BR 100 Commercial Park Ct', 'This unit is located at 100 Commercial Park Ct, Maumelle, 72113, ARMonthly rental rates range from $660 - $1139We have two - three beds units available for rent', 2, 2, 660, 'USD', 'No', 'Thumbnail', '$ 660', 'Monthly', 908, 21, 41, 2, 1, '1577359473');
INSERT INTO public.apartments VALUES (5664594490, 'Two BR 2917 Heathrow Drive', 'This unit is located at 2917 Heathrow Drive, Ames, 50014, IAMonthly rental rates range from $1095We have 2 beds units available for rent', 2, 2, 1095, 'USD', 'No', 'Thumbnail', '$ 1.095', 'Monthly', 909, 22, 42, 2, 1, '1577016826');
INSERT INTO public.apartments VALUES (5509242122, 'Attractive Two BR, Two BA', 'Square footage: 910 sq. feet, unit number: R-103. Apartments in Renton, WA, provides an unrivaled living experience. In the Fairwood area of Renton, you ll find beautifully landscaped apartments with tastefully updated Cove Apartments. We ve taken it upon ourselves to create a inviting atmosphere you ll be proud to come home to every day. Our community amenities sweeten the deal with both entertainment options and conveniences for your daily life. Get to k0w Apartments in Renton, WA. We look forward to inviting you home. Income Requirement: Must have 3. 0x the rent in total household income before taxes, include income from all adults. Utilities: Renter responsible for all utilities. Additional Charges: Renter''s insurance required. Pet restrictions: Breed restrictions. Parking Information: Open parking, Carports for $50 and Garages for $150. Storage Info: $20/month 20ft storage, $40/month 50 feet storage.', 2, 2, 1887, 'USD', 'No', 'Yes', '$ 1.887', 'Monthly', 910, 0, 43, 1, 1, '1568780574');
INSERT INTO public.apartments VALUES (5668643137, 'One BR 128-30 West 2nd St. Putnam', 'This unit is located at 128-30 West second St. Putnam, Davenport, 52801, IAMonthly rental rates range from $1750 - $1895We have one - two beds units available for rent', 1, 1, 1750, 'USD', 'No', 'Thumbnail', '$ 1.750', 'Monthly', 910, 23, 25, 2, 1, '1577360549');
INSERT INTO public.apartments VALUES (5668618408, 'Four BR 314 S. Chauncey Avenue', 'This unit is located at 314 S. Chauncey Avenue, West Lafayette, 47906, INMonthly rental rates range from $1496We have 4 beds units available for rent Apartment features include:-- Surface Parking- Refrigerator- Water Included- Dishwasher- Microwave- Heat: Forced Air- Trash Removal Included- Garbage Disposal', 2, 4, 1496, 'USD', 'No', 'Thumbnail', '$ 1.496', 'Monthly', 910, 24, 44, 2, 1, '1577358855');
INSERT INTO public.apartments VALUES (5668615301, 'Two BR 1620 Corinthian Drive', 'This unit is located at 1620 Corinthian Drive, Florence, 41042, KYMonthly rental rates range from $991 - $1304We have two - three beds units available for rent Apartment features include:-- Air conditioner- Fireplace- Fitness facilities- Refrigerator- Dishwasher- Sheltered parking- On-Site Laundry- Balcony, Deck, Patio', 2, 2, 991, 'USD', 'No', 'Thumbnail', '$ 991', 'Monthly', 911, 28, 53, 2, 1, '1577358668');
INSERT INTO public.apartments VALUES (5668613816, 'Two BR 1750 P Street, Nw', 'This unit is located at 1750 P Street, Nw, Washington, 20036, DCMonthly rental rates range from $3700We have 2 beds units available for rent Apartment features include:-- In-Unit Laundry- Fitness facilities- A-c- Sheltered parking- Dishwasher- Controlled Access- Garbage Disposal- Refrigerator', 2, 2, 3700, 'USD', 'No', 'Thumbnail', '$ 3.700', 'Monthly', 912, 29, 54, 2, 1, '1577358557');
INSERT INTO public.apartments VALUES (5509051507, 'One BR Apartment - Experience Urban Living- Just minutes away from Downtown', 'You ll thrive in the heart of all that s happening. A vibrant, buzzing locale, mixed with a nightlife that will never disappoint. This is your ideal location and this is your chance toit home. Incredible retail and gourmet restaurants just steps away. 0t in the mood to step out Enjoy all that Oberlin has to offer! Watch a movie in our theater or relax pool-side, enjoy of our 3 yards or play of our 2 clubhouses. Take in the sites from our roof top terrace or relax in or Zen Garden and Sauna. If fitness is your thing then you came to the right. Our twenty-four-hour fitness facilities is 1 to impress. At Oberlin you will get more then you expected but everything you deserve. Oberlin offers a pet free and a pet friendly building. The pet friendly building allows up to 2 pets per apartment. There is a 1 time $300 pet and an additional $150 for a 2nd pet. Pet rent is $20 per month, per pet. Each building has a multi-level parking deck. There is 1 space allowed per resident.', 1, 1, 1161, 'USD', 'No', 'Thumbnail', '$ 1.161', 'Monthly', 910, 0, 45, 1, 1, '1568770358');
INSERT INTO public.apartments VALUES (5508938507, 'Great Central Location One BR, One BA', 'If you''re looking for comfortable, complete family oriented lifestyle apartments near West Chester, 4 Bridges is the to be! Just by being a part of the 4 Bridges Country Club community, Bridges Apartments become automatic social members of The Club with access to the incomparable amenities and the country club lifestyle. Want to see for yourself Check out our great amenities that lend to the country lifestyle here! Tour Our Community Take a newsletter for some more info about our great community! Official Updater Partner, TOP RATED Community by Apartment Ratings, Superior Resident Satisfaction Award - Multi Year, Elite 10In The Country For On-line Ratings! Availability 24 Hours, Conference Center, 22, 000ft Club house, Trash Compactor, Private, 18-Hole Golf Course Designed by Bob Cupp, Driving Range, Chipping Green, Putting Green, Golf Academy with Heated Practice Stalls and 4 PGA Professionals - With Golf Membership Upgrade, Award Winning Lakota Schools, Mixed Grille with Bar and Fireplace, Dining area', 1, 1, 1047, 'USD', 'No', 'Thumbnail', '$ 1.047', 'Monthly', 910, 0, 46, 1, 1, '1568762582');
INSERT INTO public.apartments VALUES (5668614517, 'One BR 2350 Phillips Rd', 'This unit is located at 2350 Phillips Rd, Tallahassee, 32308, FLMonthly rental rates range from $1046 - $1395We have one - three beds units available for rent Apartment features include:-- Public Transportation- In-Unit Laundry- Surface Parking- Refrigerator- Fitness facilities- Dishwasher- A-c- Pool', 1, 1, 1046, 'USD', 'No', 'Thumbnail', '$ 1.046', 'Monthly', 910, 25, 47, 2, 1, '1577358611');
INSERT INTO public.apartments VALUES (5508974243, 'Apartment 910 sq. ft. Loveland - must see to believe. Pet OK!', 'Square footage: 910 square feet, unit number: 013491. Welcome to Mallard Crossing Apartments in Loveland, OH, where we understand what it means to live the life you want in the city you love. Your pet-friendly home features a state-of-the-art fitness facilities and rejuvenating pool to give you the energy you need to propel you through your busy day. Enjoy our luxurious club house and internet cafe. Inside your spacious one, 2 or 3 beds home, you''ll find well-equipped kitchens, walk-in closets, full-sized washers and dryers and private balconies or cozy patios to suit your lifestyle. Conveniently located in the Loveland / Mason area, we re a short from Downtown Cincinnati. Mallard Crossing is close to the Loveland Bike Trail, parks, schools, shopping, and the great entertainment. Immerse yourself in a collection of the latest upscale shopping, for the culinary curious you will enjoy gourmet dining, or delve into the exciting array of arts and entertainment options. Welcome home. This is Choice living.', 1, 1, 1019, 'USD', 'No', 'Thumbnail', '$ 1.019', 'Monthly', 910, 0, 48, 1, 1, '1568764727');
INSERT INTO public.apartments VALUES (5508742389, 'Apartment in quiet area, spacious with big kitchen', 'Welcome Apartments!Enjoy spacious, luxurious apartments just minutes from Chapel Hill, Durham, Raleigh and the RTP. Apartments is located just south of historic Hillsborough, a community which provides a small-town atmosphere with the convenience of large city amenities. Residents are able to easily access less than 15mis both downtown Chapel Hill and downtown Durham and are minutes from Raleigh. With 4 spacious floor plans to choose from, offers features such as sunrooms, walk-in closets, wired for cable and internet connection to accommodate the service plan you purchase, and 24-hr fitness facilities. Apartments is designed for your comfort and convenience. Professional management office onsite and maintenance assures excellent service and attention to your housing needs. today! Income Requirement: Must have 3. 0x the rent in total household income before taxes, include income from all adults. Utilities: Renter responsible for all utilities.', 1, 1, 893, 'USD', 'No', 'Thumbnail', '$ 893', 'Monthly', 910, 0, 49, 1, 1, '1568749150');
INSERT INTO public.apartments VALUES (5668629901, 'Two BR 8409 5th Ave NE #05', 'This unit is located at 8409 fifth Ave NE #05, Seattle, 98115, WAMonthly rental rates range from $1949We have 2 beds units available for rent', 2, 2, 1949, 'USD', 'No', 'Thumbnail', '$ 1.949', 'Monthly', 911, 26, 50, 2, 1, '1577359655');
INSERT INTO public.apartments VALUES (5509223793, 'Apartment only for $1,870/mo. You Can Stop Looking 0w!', 'UNDER NEW MANAGEMENT! Our residents are our. at Princeton Meadows. Stop by to say hello and learn about the new apartment re0vations property. We are 0w offering 1 mon FREE ON A 12-13 mon LEASE and 1 1/2 monS FREE ON A 14-fifteen month LEASE on our brand new up-to-date apartments. Looking for a spacious, well-appointed apartment in a terrific location. Meadows is the for you. Featuring clean, classic designs, spectacular views, gorgeous landscaping and an incredible selection of luxurious amenities, our charming community of apartments for rent in Plainsboro, NJ is guaranteed to keep you coming home with a smile on your face each and every day. Whether you are enjoying interior perks like bright, open floor plans, modern gourmet kitchens and private patios and balconies, or shared features like a sparkling outdoor swimming pool with sundeck, modern health and fitness facilities, basketball and tennis courts you will find happiness around every at Princeton Meadows.', 2, 2, 1870, 'USD', 'No', 'Yes', '$ 1.870', 'Monthly', 911, 0, 22, 1, 1, '1568779867');
INSERT INTO public.apartments VALUES (5509072766, 'Super Cute! Apartment for Rent!', 'Located in a park-like setting in Cockeysville, Maryland, this luxurious community is pet friendly and offers many high end amenities. From washer/dryers to energy efficient windows, heating and a/c systems, live the life of rate. Income Requirement: Must have 3. 0x the rent in total household income before taxes, include income from all adults. Utilities: Renter responsible for all utilities. Additional Charges: Renter''s insurance required. Pet restrictions: Aggressive Breeds, Weight limit: 35 pounds. Parking Information: Open lot: included in lease. More units available: two Bd / 1 Bedrooms 1,057 sq. feet for $1,320/mo | one Bd / 1 Bedrooms 804 square feet for $1,089/mo | one Bd / 1 Bedrooms 804 sq-ft for $1,099/mo | two Bd / 1 Bedrooms 1,057 sq. feet for $1,340/mo |', 1, 1, 1299, 'USD', 'No', 'Yes', '$ 1.299', 'Monthly', 911, 0, 51, 1, 1, '1568771891');
INSERT INTO public.apartments VALUES (5668612448, 'One BR 855 Walther Blvd.', 'This unit is located at 855 Walther Blvd., Lawrenceville, 30043, GAMonthly rental rates range from $1079 - $1557We have one - three beds units available for rent Apartment features include:-- Pool- Refrigerator- Balcony, Deck, Patio- Sheltered parking- Fitness facilities- A/c- Dishwasher- Storage', 1, 1, 1079, 'USD', 'No', 'Thumbnail', '$ 1.079', 'Monthly', 911, 27, 52, 2, 1, '1577358482');
INSERT INTO public.apartments VALUES (5508997698, '912 sq. ft. Two BR - convenient location. Pet OK!', 'Carrollton, TX luxurious Apartments: Deer Run Introducing an apartment community for your busy lifestyle - Deer Run. This lush residential setting offers exemplary schools, the most fashionable shopping, countless restaurants and convenience to George Bush, and Dallas 0rth Tollway. These one and two beds apartment homes feature sheltered parking, a brand-new fitness facility, an outdoor grill, and pergola. Come home to a quiet sanctuary and discover the lifestyle you deserve. Fireplace, Cathedral ceiling, Pool, Washer/Dryer Connections, Bay Window, 1st Floor, Redesigned Interior, Kitchen & Bath Upgrades, Select K/B upgrades, Re0vate Location, RENW Washer & dryer, 2nd Floor, Stacked Washer/Dryer, 3rd Floor, Washer/Dryer. Ok for pets Comments: Pet Charges and Deposits Vary by Property. Assistance animals are always welcome without deposit or fee. Restrictions: Pet Types Allowed: Dogs, Cats, Fish, Caged Birds. Price range: $1, 153 - $1, 613.', 2, 2, 1313, 'USD', 'No', 'Thumbnail', '$ 1.313', 'Monthly', 912, 0, 26, 1, 1, '1568766275');
INSERT INTO public.apartments VALUES (5509146646, 'Come home to Colonial Creek apartments. Carport parking!', 'Square footage: 912 sq. feet, unit number: 212131. Located conveniently in the Mid-Cities and loaded with amenities, our 1, 2 and three beds homes feature garden tubs, excellent interior finishes, gourmet kitchens, customized cabinetry, garages/carports, a newly remodeled 24-hr fitness facility, two swimming pools, and a professional, friendly team here to serve you. You don''t have to go far from home to enjoy an outstanding variety of dining, shopping, and entertainment and easy access to Highways 183 and 121. Experience this and more when you make the decision to. Creek. Reserve your new home today! Creek, Fireplace 1, Handicappped Accessible, High ceiling, Washer/dryer, ground floor, second Floor, third Floor, 11A-fireplace, 11B-fireplace, 11C-fireplace, 21A-fireplace, 22A-fireplace, 22B-fireplace, 32A-fireplace, C1, Ct.', 1, 2, 1239, 'USD', 'No', 'Thumbnail', '$ 1.239', 'Monthly', 912, 0, 55, 1, 1, '1568776078');
INSERT INTO public.apartments VALUES (5509144370, 'Come home to Colonial Creek apartments.', 'Located conveniently in the Mid-Cities and loaded with amenities, our 1, 2 and three beds homes feature garden tubs, excellent interior finishes, gourmet kitchens, custom cabinets, garages/carports, a newly remodeled 24-hr fitness facility, two swimming pools, and a professional, friendly team here to serve you. You don''t have to go far from home to enjoy an outstanding variety of dining, shopping, and entertainment and easy access to Highways 183 and 121. Experience this and more when you make the decision to. Creek. Reserve your new home today. More units available: two Bd / 1 Bedrooms 912 sq. feet for $1,219/mo | one Bd / 1 Bedrooms 740 sq. feet for $1,014/mo | two Bd / 1 Bedrooms 912 square feet for $1,179/mo | two Bd / 1 Bedrooms 912 sq. feet for $1,239/mo | one Bd / 1 Bedrooms 650 square ft for $944/mo | one Bd / 1 Bedrooms 650 square ft for $979/mo | two Bd / 2 Bedrooms 1,069 square ft for $1,249/mo | one Bd / 1 Bedrooms 740 sq. feet for $964/mo | one Bd / 1 Bedrooms 740 square feet for $939/mo |', 1, 2, 1159, 'USD', 'No', 'Yes', '$ 1.159', 'Monthly', 912, 0, 55, 1, 1, '1568775912');
INSERT INTO public.apartments VALUES (5668628920, 'Two BR 2108 Vinton St.', 'This unit is located at 2108 Vinton St., Omaha, 68108, NEMonthly rental rates range from $1145 - $1245We have two - three beds units available for rent', 1, 2, 1145, 'USD', 'No', 'Thumbnail', '$ 1.145', 'Monthly', 912, 30, 56, 2, 1, '1577359580');
INSERT INTO public.apartments VALUES (5664585003, 'Three BR 608 Holiday Ave', 'This unit is located at 608 Holiday Ave, Hazelwood, 63042, MOMonthly rental rates range from $1045We have 3 beds units available for rent', 1, 3, 1045, 'USD', 'No', 'Thumbnail', '$ 1.045', 'Monthly', 912, 31, 57, 2, 1, '1577016214');
INSERT INTO public.apartments VALUES (5668615042, 'Two BR 200 Kedron Pwky.', 'This unit is located at 200 Kedron Pwky., Spring Hill, 37174, TNMonthly rental rates range from $1004 - $1168We have two - three beds units available for rent Apartment features include:-- On-Site Laundry- Refrigerator- Fitness facilities- Pool- Air conditioned- Fireplace- Dishwasher', 2, 2, 1004, 'USD', 'No', 'Thumbnail', '$ 1.004', 'Monthly', 912, 32, 58, 2, 1, '1577358647');
INSERT INTO public.apartments VALUES (5659917491, 'Two BR 245 Sinclair', 'This unit is located at 245 Sinclair, Ames, 50014, IAMonthly rental rates range from $895We have 2 beds units available for rent', 2, 2, 895, 'USD', 'No', 'Thumbnail', '$ 895', 'Monthly', 912, 33, 42, 2, 1, '1576667691');
INSERT INTO public.apartments VALUES (5659918254, 'Three BR 1305 Georgia', 'This unit is located at 1305 Georgia, Ames, 50014, IAMonthly rental rates range from $790We have 3 beds units available for rent', 2, 3, 790, 'USD', 'No', 'Thumbnail', '$ 790', 'Monthly', 912, 0, 42, 2, 1, '1576667756');
INSERT INTO public.apartments VALUES (5668638856, 'One BR 1100 N CASS STREET', 'This unit is located at 1100 N CASS STREET, Milwaukee, 53202, WIMonthly rental rates range from $1795 - $1850We have one - two beds units available for rent', 1, 1, 1795, 'USD', 'No', 'Thumbnail', '$ 1.795', 'Monthly', 913, 34, 59, 2, 1, '1577360267');
INSERT INTO public.apartments VALUES (5509053677, 'This Apartment is a must see!', 'Seize your chance to live in 1 of the premier apartment communities in Bothell, WA. Picture coming home every day to the warm embrace of meticulous landscaping, comfortable homes, and thoughtful amenities tailored to enhance your life. Stonemeadow Farms Apartments provides its residents a wide selection of unique one, two, or three beds apartment homes that feature exclusive community and household amenities like a twenty-four hour fitness facilities, swimming pool, and state of the art kitchens with granite countertops. Come wiggle your toes in our picturesque pool, stroll through our ok for pets community with your favorite furry companion, or have a day out on the town in nearby Seattle. We k0w you deserve the very best in apartment living, and our community is designed specifiy to ensure you don t just lease, you live. Go take a image gallery and schedule your appointment, or drop by and visit us for your personal tour today! Stonemeadow Farms welcomes dogs and cats. $300 pet per pet.', 2, 2, 1712, 'USD', 'No', 'Thumbnail', '$ 1.712', 'Monthly', 913, 0, 60, 1, 1, '1568770528');
INSERT INTO public.apartments VALUES (5509195034, 'Average Rent $1,685 a month - That''s a STEAL. Single Car Garage!', 'Square footage: 913 square feet, unit number: 0306. At the edge of historic Simsbury Town Center is the stunning entry into The Powder Forest with its expansive brownstone walls and flowering trees beckoning you upward. At the top, you will find , with its welcoming village feel, Lodge, features a lounge, gathering rooms, bus. ctr., game carousel, and entertaining kitchen. The Fitness facilities offers cutting-edge weight training, cardio-fit, and stretching equipment. The Lodge leads outside to a refreshing, salt water pool with loungers and cabanas, and boasts a large sunning terrace. The patio features covered porches, an outdoor grilling kitchen, bocce, and a relaxing fire pit. There are also plenty of other spaces around the property to enjoy nature or entertain and Playscape, Dog Park, grilling areas and in the Village Green. Income Requirement: Must have 2. 5x the rent in total household income before taxes, include income from all adults. Utilities included: Hot Water, Sewer, Water.', 1, 1, 1685, 'USD', 'No', 'Yes', '$ 1.685', 'Monthly', 913, 0, 61, 1, 1, '1568778772');
INSERT INTO public.apartments VALUES (5668626244, 'Two BR 210 S Montgomery St', 'This unit is located at 210 S Montgomery St, Starkville, 39759, MSMonthly rental rates range from $1480 - $3250We have two - five beds units available for rent', 2, 2, 1480, 'USD', 'No', 'Thumbnail', '$ 1.480', 'Monthly', 913, 35, 62, 2, 1, '1577359363');
INSERT INTO public.apartments VALUES (5668614420, 'Two BR 2201 104th Street South', 'This unit is located at 2201 104th Street South, Tacoma, 98444, WAMonthly rental rates range from $1397 - $1817We have two - three beds units available for rent Apartment features include:-- In-Unit Laundry- Dishwasher- Air conditioned- Sheltered parking- Refrigerator- Fitness facilities- Fireplace- Balcony, Deck, Patio', 1, 2, 1397, 'USD', 'No', 'Thumbnail', '$ 1.397', 'Monthly', 913, 36, 63, 2, 1, '1577358603');
INSERT INTO public.apartments VALUES (5509217631, 'Euless, prime location Two BR, Apartment. Pet OK!', 'Thank you for visiting Station Apartment Homes. Our tranquil apartment community is conveniently located between Dallas and Fort Worth. With easy access to DFW International Airport, TRE Rail Station, Highways 121, 183 and 360, your commute will be smooth sailing. Several major employers and golf course are within minutes from your new home, giving you plenty of opportunity for work and play. Invite your friends over to enjoy 1 of our sparkling swimming pools with a jacuzzi. We offer one to three beds apartments so you can find the perfect apartment for you or your family. two Sparkling Pools, Accepts Electronic Payments, BBQ/Picnic Area, Business facility, Close to TRE Station, Club house Cyber Cafe Fitness facilities, Access controlled community, Broadband internet, On-Site Maintenance, Management office onsite, Package Receiving, Short-term Lease, Spanish Speaking Staff, Ac, Brushed Nickel Hardware, Built-in Computer Desks & Bookshelves, Cable Ready, Carpeting, Crown Molding, Dishwasher, Disposal', 1, 2, 1005, 'USD', 'No', 'Thumbnail', '$ 1.005', 'Monthly', 913, 0, 20, 1, 1, '1568779668');
INSERT INTO public.apartments VALUES (5509219655, 'One BR Apartment in Euless', 'Westdale Hills is a neighborhood of beautifully landscaped apartment communities surrounding the Westdale Hills Golf Course. Uniquely similar in amenities and appeal, Westdale Hills is conveniently located in a part of the Metroplex that provides easy access to freeways and all that both Dallas and Ft. Worth have to offer. Isn''t it time for a new. eighteen Sparkling Swimming Pools, 22 Clothes Care, 9-Hole Par three Golf Course, Accepts Electronic Payments, Availability 24 Hours, BBQ/Picnic Area, Club house, Courtesy Patrol, Easy Freeway Access, Fitness facilities HEB School District, On Site Day Care, On-Site Maintenance, Management office onsite, Playgrounds, Short-term Lease, Spanish Speaking Staff, Splash Park, Cable Ready, Carpeting, Ceiling Fan, Central Heating and Cooling, Handicapped access, Dishwasher, Added storage, Fireplace, Garbage Disposal, Golf Course and Lake Side Views, Microwave, Open Garages, Private Patio/Balcony, Refrigerator, Stove, Soaring ceilings, washer / dryer Connections', 1, 1, 808, 'USD', 'No', 'Yes', '$ 808', 'Monthly', 913, 0, 20, 1, 1, '1568779734');
INSERT INTO public.apartments VALUES (5509211431, 'Average Rent $805 a month - That''s a STEAL. Single Car Garage!', 'Westdale Hills is a neighborhood of beautifully landscaped apartment communities surrounding the Westdale Hills Golf Course. Uniquely similar in amenities and appeal, Westdale Hills is conveniently located in a part of the Metroplex that provides easy access to freeways and all that both Dallas and Ft. Worth have to offer. Isn''t it time for a new. 22 Clothes Care Facilities, Availability 24 Hours, BBQ/Picnic Area, Club house, Courtesy Patrol, Fitness facilities On Site Day Care, On-Site Maintenance, Management office onsite, Playgrounds, Short-term Lease, Spanish Speaking Staff, eighteen Sparkling Swimming Pools, 9-Hole Par three Golf Course, Accepts Electronic Payments, Easy Freeway Access, HEB School District, Splash Park, Cable Ready, Carpeting, Ceiling Fan, Central Heating and Cooling, Handicapped access, Dishwasher, Additional storage, Fireplace, Golf Course and Lake Side Views, Microwave, Private Patio/Balcony, Refrigerator, Stove, washer and dryer Connections, Window Coverings, Garbage Disposal', 1, 1, 805, 'USD', 'No', 'Thumbnail', '$ 805', 'Monthly', 913, 0, 20, 1, 1, '1568779381');
INSERT INTO public.apartments VALUES (5668624057, 'One BR 500 Bartlett Street', 'This unit is located at 500 Bartlett Street, San Francisco, 94110, CAMonthly rental rates range from $5000We have 1 beds units available for rent Apartment features include:-- On Bus Line- Dishwasher- Refrigerator- In-Unit Laundry', 1, 1, 5000, 'USD', 'No', 'Thumbnail', '$ 5.000', 'Monthly', 914, 37, 64, 2, 1, '1577359212');
INSERT INTO public.apartments VALUES (5509102227, 'Ellicott City, prime location Two BR, Apartment', 'Square footage: 914 sq-ft, unit number: 301. Orchard Meadows Apartment Homes is located in historic Ellicott City, MD. Ellicott City is k0wn for its convenient location, historic downtown and outdoor recreation opportunities. The accessible location allows residents easy access to Baltimore and Washington DC from major thoroughfares such as US- 29, -95 and 100. The historic downtown Ellicott City is just a few miles from Orchard Meadows offering eateries, boutique shops and historical location that contribute to its charm. For outdoor enthusiasts Ellicott City offers 3 major parks within 5 mis of the community. Orchard Meadows Apartments offers spacious 1 and 2 beds apartments for rent. In addition, residents enjoy an attractive collection of community amenities to include a strength and cardio center with yoga studio, cyber caf, swimming pool with sundeck seating, and an outdoor kitchen and fire pit.', 2, 2, 1855, 'USD', 'No', 'Yes', '$ 1.855', 'Monthly', 914, 0, 65, 1, 1, '1568773500');
INSERT INTO public.apartments VALUES (5664576787, 'Three BR 520 W Doty St', 'This unit is located at 520 W Doty St, Madison, 53703, WIMonthly rental rates range from $1575We have 3 beds units available for rent Apartment available amenities:-- Surface Parking- Sheltered parking- Off-Street parking- Dishwasher- Balcony, Deck, Patio- Microwave- carpeted', 2, 3, 1575, 'USD', 'No', 'Thumbnail', '$ 1.575', 'Monthly', 914, 38, 66, 2, 1, '1577015504');
INSERT INTO public.apartments VALUES (5509215696, 'Lovely Renton, One BR, Two BA. Pet OK!', 'Square footage: 914 square feet, unit number: 01-310. Experience the high life. Discover your home for state of the art luxurious Apartments. Our new community provides deluxe interior amenities, including sleek quartz counter tops, state of the art stainless steel-steel appliances, and a full-size washer/dryer, as well as desirable community features, from a convenient on-site parking garage to controlled-access buildings for your peace of mind. Situated alongside the Cedar River, our upscale community is proud to offer fine living in Renton, Washington, with convenient access to all the schools, employers, and activities the Seattle area has to offer. Income Requirement: Must have 3. 0x the rent in total household income before taxes, include income from all adults. Utilities: Renter responsible for all utilities. Additional Charges: Renter''s insurance required. Pet restrictions: 35 pounds full grown. Parking Information: Garage $75 Tandem Garage $100 Uncovered Parking $25.', 2, 1, 1555, 'USD', 'No', 'Yes', '$ 1.555', 'Monthly', 914, 0, 43, 1, 1, '1568779566');
INSERT INTO public.apartments VALUES (5544558459, '1652 SE 28th St 103', 'Condominium 2 Beds Apartment Spacious 2 Beds Apartment - close to supermarkets, shopping malls, banking institutions, bus transportation and movie theaters. For more properties like this visit GoSection8.com.', 2, 2, 1350, 'USD', 'No', 'No', '$ 1.350', 'Monthly', 914, 39, 67, 5, 1, '1570656439');
INSERT INTO public.apartments VALUES (5668634944, 'Two BR 1016 N 39th St', 'This unit is located at 1016 N 39th St, Grand Forks, 58203, NDMonthly rental rates range from $565We have 2 beds units available for rent', 1, 2, 565, 'USD', 'No', 'Thumbnail', '$ 565', 'Monthly', 915, 45, 75, 2, 1, '1577360016');
INSERT INTO public.apartments VALUES (5664598513, 'Two BR 2309 Lyndale Ave S', 'This unit is located at 2309 Lyndale Ave S, Minneapolis, 55405, MNMonthly rental rates range from $2199 - $3199We have 2 beds units available for rent', 1, 2, 2199, 'USD', 'No', 'Thumbnail', '$ 2.199', 'Monthly', 916, 46, 24, 2, 1, '1577017178');
INSERT INTO public.apartments VALUES (5509061809, 'Beautiful Arlington Apartment for rent', 'Price from: 1128. Our beautifully detailed one beds, 1 baths home offers 914ft of spacious living. We have furnished homes You will find well appointed interiors featuring a cozy wood burning fireplace, your own private patio or balcony area, an all electric kitchen with pantry and breakfast area, wood flooring, plush carpeting, nine feet ceilings with overhead fans, spacious walk in closets, washer & dryer connections and central heating and air conditioner. Find your new home today! Welcome home to Huntington Meadows Apartment Homes! You will find our beautiful community conveniently located nearby 6 Flags Hurricane, The Dallas Cowboys Stadium, The, and Interstate 30 for quick access to anywhere you want to be. We offer 1 and 2 beds apartment homes featuring 9 ft ceilings, an all electric high-end kitchen with a pantry and breakfast area, central heating and air conditioned, a cozy wood burning fireplace, added storage, faux wood flooring, spacious walk in closets, stackable washer-dryer and overhead fans.', 1, 1, 1128, 'USD', 'No', 'Thumbnail', '$ 1.128', 'Monthly', 914, 0, 68, 1, 1, '1568771148');
INSERT INTO public.apartments VALUES (5668609372, 'Two BR 1800 Austin Parkway', 'Contact us for a FREE apartment search and up to $200 rebate! An expert agent will match properties with your exact search criteria while you search from home.This community advertises itself as ''Up-to-date Apartments'' in its entry marquis. This sprawling eighteen building property only features 1st and 2nd floor units giving it a larger feel than it actually is with only 238 residences. Numerous trees grow throughout the neatly landscaped premises with manicured lawns and bushes. This community only features two and three beds floor plans creating more of a family environment. Units are well maintained with stainless appliances, premium granite counter tops, new overhead fans and outdoor patios.', 1, 2, 1123, 'USD', 'No', 'Thumbnail', '$ 1.123', 'Monthly', 914, 40, 69, 2, 1, '1577358265');
INSERT INTO public.apartments VALUES (5668624110, 'Two BR 78 Buchanan Street', 'This unit is located at 78 Buchanan Street, San Francisco, 94102, CAMonthly rental rates range from $4895We have 2 beds units available for rent Apartment features include:-- Refrigerator- Hard wood floors- In-Unit Laundry- Dishwasher- Furnished- Walk in Closets- On-Site Laundry- Public Transportation', 2, 2, 4895, 'USD', 'No', 'Thumbnail', '$ 4.895', 'Monthly', 915, 41, 64, 2, 1, '1577359216');
INSERT INTO public.apartments VALUES (5668635808, 'Two BR 11476 Miranda St.', 'This unit is located at 11476 Miranda St., 0rth Hollywood, 91601, CAMonthly rental rates range from $2295We have 2 beds units available for rent', 2, 2, 2295, 'USD', 'No', 'Thumbnail', '$ 2.295', 'Monthly', 915, 42, 70, 2, 1, '1577360066');
INSERT INTO public.apartments VALUES (5509165793, 'One BA, One BR, Mercer Island - ready to move in.', 'luxurious Island Apartments on Mercer Island These lovely apartment homes redefine the meaning of upscale living on Mercer Island. Designed by Mithun Architects, Island provides a vast array of amenities ranging from essentials such as a twenty-four hour fitness facilities and a business facility to more luxurious features, including a wine tasting room and our own two-tier waterfall spa. Contemporary and Craftsman-style architecture are blended together in each of our 130 different floor plans and offer spacious, versatile Mercer Island apartments that include state of the art, energy-efficient appliances. Within close proximity of downtown Seattle and numerous public parks in the area, Island is centrally located and ready for you to tour today! We do 0t accept reusable tenant screening reports. Take advantage of our limited-time-only special offer! Learn More. Other lease term options available with price depending.Price range: $2120 - $3648.', 1, 1, 2120, 'USD', 'No', 'Yes', '$ 2.120', 'Monthly', 915, 0, 71, 1, 1, '1568777350');
INSERT INTO public.apartments VALUES (5668635564, 'One BR 25 Bacon Street', 'This unit is located at 25 Bacon Street, South Burlington, 05403, VTMonthly rental rates range from $1650 - $1750We have one - two beds units available for rent', 1, 1, 1650, 'USD', 'No', 'Thumbnail', '$ 1.650', 'Monthly', 915, 43, 72, 2, 1, '1577360050');
INSERT INTO public.apartments VALUES (5509099137, 'Ellicott City Luxurious 2 + 1. Offstreet parking!', 'Make your new home Charleston in Ellicott City, MD a city ranked 6th, along with nearby Columbia, MA, among MONEY Magazine''s s to Live in America. Offering one- and 2 beds apartments for rent, Charleston provides access to Howard County Public Schools, some of the best in the country. You''ll enjoy newly remodeled kitchens with rich maple cabinetry and brushed silver appliances, ceramic-tile baths, ac, and a balcony or patio. Select apartments have a separate dedicated dining area room, and a office-den. Additional features include a swimming pool, tennis courts, fitness and business centers, car care area, and more!Just twenty minutes from the Baltimore/Washington International Airport, Charleston is near Interstate 695, Interstate 95, Interstate 70, U. S. 29, U. S. 40, and 100. Our ok for pets complex is located near H-Mart Supermarket and Baltimore. Enjoy off-street parking. Housing s welcome.', 1, 2, 1445, 'USD', 'No', 'Thumbnail', '$ 1.445', 'Monthly', 915, 0, 65, 1, 1, '1568773332');
INSERT INTO public.apartments VALUES (5509125154, 'Two BR Apartment in Somersworth. Parking Available!', 'Tara Meadows is a 270 apartment community conveniently located approx one mile from the Spaulding 9. Tara Meadows successfully brings together the charm of our centuries. Old New Hampshire Colonial Heritage and all of the conveniences it takes to create the most carefree of state of the art lifestyles. Pets are 0t allowed. Why Choose Tara Meadows Meadows are equipped with A-c, Cable Ready and Carpeting and have rental rates ranging from $880 to $1, 410. This apartment community also offers amenities such as Basketball, BBQ/Picnic Area and Bike Racks and is located on -City in the zip code. Browse through Studio apartments, 1 Beds apartments or 2 Beds apartments with floorplans ranging from 392. Ft to 915. Ft. choose your next home in the Tara Meadows community and apply for a lease on-line! The John Flatley Company property management company will verify your lease application and send you a timely response.', 1, 2, 1410, 'USD', 'No', 'Yes', '$ 1.410', 'Monthly', 915, 0, 73, 1, 1, '1568774671');
INSERT INTO public.apartments VALUES (5508752793, 'Average Rent $1,300 a month - That''s a STEAL. Pet OK!', 'This wonderful apartment makes calling Heights home easy! Recently up-to-date using gray, white, and black tones. NEW white Shaker Panel Cabinets, beautiful 3 tone counters, and NEW black appliance in you galley kitchen with a pass through to your separate dining area makes entertaining family and friends that much more enjoyable! Your Recently remodeled bathroom offers the same gray, white, and black tones with a new bath-tub and tiled walls and a separate vanity area. NEW flooring throughout the apartment with carpet in the bedrooms and plank flooring or high-quality vinyl in the remaining areas. Great closet space in the bedrooms. Finished with brushed nickel hardware your new home is warm and welcoming! Cats allowed, Dogs allowed.', 1, 2, 1300, 'USD', 'No', 'Thumbnail', '$ 1.300', 'Monthly', 915, 0, 9, 1, 1, '1568749948');
INSERT INTO public.apartments VALUES (5668616955, 'One BR 3825 Anthem Way', 'This unit is located at 3825 Anthem Way, Anthem, 85086, AZMonthly rental rates range from $1045 - $1610We have one - three beds units available for rent Apartment features include:-- Business facility- Sheltered parking- On Bus Line- Dishwasher- Fitness facilities', 1, 1, 1045, 'USD', 'No', 'Thumbnail', '$ 1.045', 'Monthly', 915, 44, 74, 2, 1, '1577358759');
INSERT INTO public.apartments VALUES (5509265463, 'The Best of the Best in the City of Pittsburgh! Save Big. Pet OK!', 'Within the historic Bakery campus, in the sweet neighborhood of Shadyside, fall in love with a pair of and blue buildings: Bakery Living. Our studio, one, and 2 beds apartments in Pittsburgh, Pennsylvannia are the epitome of luxurious living. Immerse yourself in the ultimate lifestyle center with an endless list of community and apartment amenities, all for you to leisure. Kick back in the social areas featuring courtyards, grilling areas, spa-inspired indoor/outdoor pool, sleek study 0oks, large game and media rooms, fully equipped twenty-four-hour fitness centers and more! Plus, the location couldn''t be better! Easily commute to work on the nearby bus line, snag a bike from the Healthy Ride Station on-site, or get to nearby highways in 0 time. You''ll find yourself near 2 highly respected universities, PITT and CMU, some of Pittsburgh''s top employers, Google, UPMC, UBER, and across the from trendy shops like West Elm, Anthropologie, Free People and more Income Requirement: Must have 3.', 1, 2, 1800, 'USD', 'No', 'Thumbnail', '$ 1.800', 'Monthly', 916, 0, 76, 1, 1, '1568781912');
INSERT INTO public.apartments VALUES (5661941724, 'Spacious 2 BR, 2 BA', 'Square footage: 916 square ft, unit number: 1A. Price from: 1365. Experience a classic and comfortable Hills. Our charming community is situated in the beautiful Cimarron Hills area of Colorado Springs, Colorado. Enjoy a wide selection of fantastic shopping, dining, and entertainment options just minutes away. Outdoor enthusiasts will love our close proximity to the many hiking and nature trails in Colorado Springs. Everything you need is right outside your door. Western Hills is proud to offer one and two bedrooms apartment homes that were designed for your satisfaction. Our residences are crafted with quality features including all-electric kitchens, high ceilings, walk-in closets, cozy fireplaces, balconies or patios, and washers and dryers.', 2, 2, 1365, 'USD', 'No', 'Thumbnail', '$ 1.365', 'Monthly', 916, 0, 77, 3, 1, '1576791595');
INSERT INTO public.apartments VALUES (5668637513, 'Two BR 135 Campus', 'This unit is located at 135 Campus, Ames, 50014, IAMonthly rental rates range from $1300 - $1800We have two - three beds units available for rent', 2, 2, 1300, 'USD', 'No', 'Thumbnail', '$ 1.300', 'Monthly', 916, 47, 42, 2, 1, '1577360163');
INSERT INTO public.apartments VALUES (5508998368, 'Lovely Federal Way, Two BR, One BA', 'Square footage: 916 square ft, unit number: 122. Price from: 1130. Look 0 further for great apartment home living in the beautiful coastal city of Federal, Washington. You have found Apartments. With close proximity to 509 and Interstate 5 Freeway, it is close to the Seattle metropolitan area. Apartments is a close-by from Poverty Bay, Saltwater State Park and a variety of other outdoor activities, dining, shopping and entertainment venues. If convenience and location are important factors in your lifestyle, then you have come to the right. We are proud to offer 5 one and two beds apartment home floor plans. Each features an all-electric kitchen for your gourmet cooking needs, carpeted and tile floors, and some paid utilities. You will love the from your balcony or patio and enjoy the warmth of your wood burning fireplace. Some apartments have additional storage and an in-home washer-dryer. Stop by and take a we have to offer. The fun doesn t end when you leave your apartment home.', 1, 2, 1130, 'USD', 'No', 'Thumbnail', '$ 1.130', 'Monthly', 916, 0, 12, 1, 1, '1568766322');
INSERT INTO public.apartments VALUES (5659899382, 'Two BR 1996 County Road D East', 'This unit is located at 1996 County Road D East, Maplewood, 55109, MNMonthly rental rates range from $1025 - $1190We have two - three beds units available for rent Apartment features include:-- Dishwasher- Balcony, Deck, Patio- Fitness facilities- Handicapped access- A-c- Sheltered parking- In-Unit Laundry- Controlled Access', 1, 2, 1025, 'USD', 'No', 'Thumbnail', '$ 1.025', 'Monthly', 916, 48, 78, 2, 1, '1576666506');
INSERT INTO public.apartments VALUES (5668617849, 'Two BR 1100 55th St N.', 'This unit is located at 1100 55th St N., Grand Forks, 58203, NDMonthly rental rates range from $820We have 2 beds units available for rent Apartment features include:-- Ac- Sheltered parking- Surface Parking- Dishwasher- In-Unit Laundry- Garbage Disposal- Carpet- Refrigerator', 1, 2, 820, 'USD', 'No', 'Thumbnail', '$ 820', 'Monthly', 916, 49, 74, 2, 1, '1577358818');
INSERT INTO public.apartments VALUES (5668618041, 'Two BR Autumn Ridge Apartments', 'This unit is located at Autumn Ridge Apartments, Saginaw, 48601, MIMonthly rental rates range from $725 - $815We have two - three beds units available for rent Apartment features include:-- On-Site Laundry- Balcony, Deck, Patio- Storage- Garbage Disposal- Dishwasher- Laundry hookups- Surface Parking- Refrigerator', 1, 2, 725, 'USD', 'No', 'Thumbnail', '$ 725', 'Monthly', 916, 0, 79, 2, 1, '1577358829');
INSERT INTO public.apartments VALUES (5659898702, 'Two BR 5400 Cascade Way', 'This unit is located at 5400 Cascade Way, Buena Park, 90621, CAMonthly rental rates range from $1900 - $1995We have 2 beds units available for rent', 1, 2, 1900, 'USD', 'No', 'Thumbnail', '$ 1.900', 'Monthly', 917, 50, 80, 2, 1, '1576666458');
INSERT INTO public.apartments VALUES (5668633895, 'Two BR 19511 NE Halsey Street', 'This unit is located at 19511 NE Halsey Street, Gresham, 97230, ORMonthly rental rates range from $1295We have 2 beds units available for rent', 1, 2, 1295, 'USD', 'No', 'Thumbnail', '$ 1.295', 'Monthly', 917, 51, 81, 2, 1, '1577359942');
INSERT INTO public.apartments VALUES (5668618635, 'One BR 4231 Sw Emland Dr', 'This unit is located at 4231 Sw Emland Dr, Topeka, 66606, KSMonthly rental rates range from $655 - $775We have one - two beds units available for rent Apartment features include:-- Refrigerator- Carpet- Surface Parking- Pool- Laundry hookups- Trash Removal Included- Public Transportation- Fireplace', 1, 1, 655, 'USD', 'No', 'Thumbnail', '$ 655', 'Monthly', 917, 52, 82, 2, 1, '1577358872');
INSERT INTO public.apartments VALUES (5664598264, 'Two BR 2275 Grove Way', 'This unit is located at 2275 Grove Way, Castro Valley, 94546, CAMonthly rental rates range from $2495We have 2 beds units available for rent', 1.5, 2, 2495, 'USD', 'No', 'Thumbnail', '$ 2.495', 'Monthly', 918, 53, 83, 2, 1, '1577017156');
INSERT INTO public.apartments VALUES (5509245368, 'One BR Apartment - As one of the most luxurious communities in Princeton.', 'Square footage: 918 sq. feet, unit number: 03-307. The Junction offers beautiful one-, two-, and 3 beds apartments near a variety of shops, restaurants, and entertainment. With easy access to public transportation and major freeways, you are always minutes away from the greatest attractions and recreation in Princeton. During your lunch hour, you can stop by Aurelios Cocina Latina for authentic Mexican cuisine. Cross Culture is a fantastic location if you are looking for traditional Indian dishes. Agricola Eatery is an American-style, fine-dining restaurant where you can take family and friends for special occasions. Within minutes of The Junction, residents enjoy spending Art University. You can also visit the Princeton Garden Theatre on warm summer nights. Bonkerz, an arcade with laser tag, is also a close-by from The Junction. Conveniently located off 1, Quaker Bridge Mall. Leasing Information. Lease Length: 6-15 mnths Please 0te leases shorter than 12 mnths often have extra charges.', 1, 1, 2025, 'USD', 'No', 'Thumbnail', '$ 2.025', 'Monthly', 918, 0, 84, 1, 1, '1568780720');
INSERT INTO public.apartments VALUES (5509019480, 'Attractive Two BR, Two BA. Covered parking!', 'Price from: $2344. This apartment home has an open-concept living area with an attached 0rth facing patio. Conveniently located just a quick walk from Microsoft''s main campus is Bellevue Meadows Apartments, a sprawling community with plenty of amenities to keep you busy and enjoying all life has in store. Talk a walk with your furry friend around the beautifully manicured lawns of our Smoke Free community, stopping to enjoy the scenic pond or heading over to nearby Robinswood, Wilburton and Marymoor Parks. Our 24hr fitness facilities features state-of-the-art equipment, and the added convenience of our package service and community lounge Wi-Fi will make you life here in beautiful Bellevue that much more relaxing. More units available: one Bd / 1 Bedrooms 644 sq-ft for $1,641/mo | one Bd / 1 Bedrooms 644 sq-ft for $1,590/mo | two Bd / 2 Bedrooms 918 sq. feet for $1,910/mo | two Bd / 2 Bedrooms 918 sq. feet for $1,908/mo | two Bd / 1 Bedrooms 843 sq.', 2, 2, 1890, 'USD', 'No', 'Thumbnail', '$ 1.890', 'Monthly', 918, 0, 85, 1, 1, '1568767959');
INSERT INTO public.apartments VALUES (5509268579, 'Lynnwood - convenient location.', 'Seize your chance to live in 1 of the premier apartment communities in Lynnwood, WA. Picture coming home every day to the warm embrace of meticulous landscaping, comfortable homes, and thoughtful amenities tailored to enhance your life. Located in Lynnwood, with easy access to Interstate 5 and 525, Newberry is just minutes away from Boeing, as well as all of the shopping, dining, and entertainment that nearby Seattle has to offer. Newberry provides its residents a wide selection of unique studio, one, two, or three beds apartment homes that feature exclusive community and household amenities like a fitness facilities, fireplace, and patio/balcony. Come stroll through our ok for pets community with your favorite furry companion or have a day out on the town in nearby Seattle. We k0w you deserve the very best in apartment living, and our community is designed specifically to ensure you don t just lease, you live.', 2, 2, 1805, 'USD', 'No', 'Thumbnail', '$ 1.805', 'Monthly', 918, 0, 33, 1, 1, '1568782101');
INSERT INTO public.apartments VALUES (5508749003, 'Las Vegas Value!', 'features luxurious 1, 2 and three beds townhomes and apartment homes that include fully equipped kitchens, washer/dryer, attached one or two car garage, private patio or balcony, overhead fans, 24hr emergency maintenance and a 30-day move-in guarantee. offers luxury apartment homes, within lush, park-like setting surrounded by on-site, resort-quality recreational facilities. Community available amenities two pools, 2 spas, fitness facilities, club house, business facility, entertainment, play area and more. apartment homes offer a variety of floor plans and amenities that meet a wide range of tastes and needs. the fun in a spacious, luxury apartment community surrounded by the numerous conveniences such as shopping, dining, entertainment, walking trails and parks. It just doesn''t get any better than this. Income Requirement: Must have 2. 0x the rent in total household income before taxes, include income from all adults. Utilities: Renter responsible for all utilities.', 2, 2, 1289, 'USD', 'No', 'Thumbnail', '$ 1.289', 'Monthly', 918, 0, 28, 1, 1, '1568749650');
INSERT INTO public.apartments VALUES (5668637293, 'One BR 1321 Lake Drive West', 'This unit is located at 1321 Lake Drive West, Chanhassen, 55317, MNMonthly rental rates range from $1250 - $1395We have one - two beds units available for rent', 1, 1, 1250, 'USD', 'No', 'Thumbnail', '$ 1.250', 'Monthly', 918, 54, 86, 2, 1, '1577360152');
INSERT INTO public.apartments VALUES (5664579415, 'Two BR 2409 10th Avenue', 'This unit is located at 2409 10th Avenue, South Milwaukee, 53172, WIMonthly rental rates range from $1200We have 2 beds units available for rent Apartment available amenities:-- Bus. ctr.- Refrigerator- In-Unit Laundry- Dishwasher- Fitness facilities', 1, 2, 1200, 'USD', 'No', 'Thumbnail', '$ 1.200', 'Monthly', 918, 55, 87, 2, 1, '1577015736');
INSERT INTO public.apartments VALUES (5509034679, 'Three BR, One BA ranch in Springfield Township is 0w ready. Pet OK!', 'Laundry, off-parking on street, and Move iN ready! Pets - Max two allowed, One time $150. 00, Rent $25 Comments: Breed Restrictions Apply.', 1, 3, 830, 'USD', 'No', 'Yes', '$ 830', 'Monthly', 918, 0, 88, 1, 1, '1568769099');
INSERT INTO public.apartments VALUES (5664598194, 'Two BR 4901 S. MacArthur Lane & 1201 E. 57th Street', 'This unit is located at 4901 S. MacArthur Lane & 1201 E. 57th Street, Sioux Falls, 57108, SDMonthly rental rates range from $750We have 2 beds units available for rent', 1, 2, 750, 'USD', 'No', 'Thumbnail', '$ 750', 'Monthly', 918, 56, 89, 2, 1, '1577017150');
INSERT INTO public.apartments VALUES (5668630408, 'One BR 817 W 5th St', 'This unit is located at 817 W fifth St, Austin, 78703, TXMonthly rental rates range from $1920 - $2930We have one - two beds units available for rent', 1, 1, 1920, 'USD', 'No', 'Thumbnail', '$ 1.920', 'Monthly', 919, 57, 16, 2, 1, '1577359694');
INSERT INTO public.apartments VALUES (5509256330, 'Apartment in quiet area, spacious with big kitchen', 'Welcome, Home to The Crossing where you deserve all of the luxuries of living! Come and enjoy our brand new top of the line fitness facilities with modern equipment, and brand new dog park for all of your furry friends. Soak in the Olympic sized swimming pool and get moving on our tennis and volleyball courts. We also offer a car care center, play-area area, bus. ctr. and laundry care centers as well. The Crossing offers 1, 2 and three beds apartment homes for your convenience. We are excited to an0unce a variety of re0vations including premium granite counters, your choice of stainless or black appliances, kitchen backsplashes, microwaves and a full-size washer and dryer. Our 1, 2 and three beds feature wall to wall carpeting, oversized closets, vinyl flooring and are fully equipped with centralized ac and heating. The Crossing is conveniently located near Historic Reisterstown, Interstate 795, Interstate 695, Income Requirement: Must have 3.', 1, 2, 1110, 'USD', 'No', 'No', '$ 1.110', 'Monthly', 919, 0, 90, 1, 1, '1568781298');
INSERT INTO public.apartments VALUES (5664594421, 'One BR 1100 STERLING DR', 'This unit is located at 1100 STERLING DR, Franklin Lakes, 07417, NJMonthly rental rates range from $2700 - $3400We have one - two beds units available for rent', 1, 1, 2700, 'USD', 'No', 'Thumbnail', '$ 2.700', 'Monthly', 920, 58, 91, 2, 1, '1577016821');
INSERT INTO public.apartments VALUES (5509076533, 'Apartment in quiet area, spacious with big kitchen', 'Price from: 2,065. Nestled in the beautiful city of, California, Arbor Apartment Homes is a paradise waiting to be discovered. Arbor Apartment Homes delivers everything you ve been dreaming of in a traditional apartment home and so much more! Our beautifully up-to-date 1 and 2 beds apartment homes will exceed all of your expectations. This comfortable residence exemplifies refined styling and traditional charm that distinguishes the contemporary of life. Arbor Apartment Homes is located just off the 5, 22 and 605 Freeways and has been thoughtfully planned to include easy access to local schools, shopping and dining. Arbor Apartment Homes brings you classic, luxurious best. More units available: two Bd / 1 Bedrooms 920 sq-ft for $1,985/mo | two Bd / 1 Bedrooms 920 sq. feet for $2,085/mo', 1, 2, 2065, 'USD', 'No', 'Thumbnail', '$ 2.065', 'Monthly', 920, 0, 92, 1, 1, '1568772102');
INSERT INTO public.apartments VALUES (5668639235, 'Two BR Lockside 3210, 3222 NW 54th Street', 'This unit is located at Lockside 3210, 3222 NW 54th Street, Seattle, 98107, WAMonthly rental rates range from $2050We have 2 beds units available for rent', 1, 2, 2050, 'USD', 'No', 'Thumbnail', '$ 2.050', 'Monthly', 920, 59, 48, 2, 1, '1577360298');
INSERT INTO public.apartments VALUES (5508817616, 'Apartment in great location', 'Utilities included: Electric, Gas, Hot Water, Sewer, Trash, Water. Additional Charges: Renter''s insurance required. Parking Information: Private parking spot: included in lease. Storage Info: Patio/Balcony, Storage Unit: $35/month. More units available: three Bd / 2 Bedrooms 1,312 sq-ft for $2,020/mo | two Bd / 2 Bedrooms 1,200 sq-ft for $1,832/mo | one Bd / 1 Bedrooms 920 sq-ft for $1,710/mo | three Bd / 2 Bedrooms 1,430 square ft for $2,170/mo | two Bd / 2 Bedrooms 1,200 square ft for $1,882/mo | two Bd / 2 Bedrooms 1,200 sq-ft for $2,022/mo | one Bd / 1 Bedrooms 920 sq-ft for $1,635/mo | one Bd / 1 Bedrooms 920 sq-ft for $1,660/mo | two Bd / 1 Bedrooms 1,050 sq-ft for $1,897/mo |', 1, 1, 1810, 'USD', 'No', 'Thumbnail', '$ 1.810', 'Monthly', 920, 0, 93, 1, 1, '1568754967');
INSERT INTO public.apartments VALUES (5509152430, 'THE LIFESTYLE YOU DESERVE. Pet OK!', 'luxurious STATE OF THE ART LIVING IN ELIZABETH! RESERVE YOUR NEW HOME TODAY! - Your chance to reside in 1 of our luxurious residential buildings has arrived! We are taking applications for an immediate occupancy! The location is incredible. Just minutes away from both Elizabeth, NJ Transit Stations, Commuting to NYC has never been easier. Travel with convenience to Newark Liberty International Airport. A cultural immersion of good food, unique shopping, and entertainment surrounds you. Near great places to shop such as The Gardens, Menlo Park Mall & Short Hills Mall. For your educational aspirations, Kean University is located just minutes away. YOUR NEW HOME AMENITIES: one Beds. Den. one Baths Spacious Walk-In Closets In-Unit Washer-dryer Gourmet Kitchens featuring Granite counter tops, Maple Cabinets, Tile Backsplashes, and Slate Grey Appliances.', 1, 1, 1649, 'USD', 'No', 'Yes', '$ 1.649', 'Monthly', 920, 0, 94, 1, 1, '1568776489');
INSERT INTO public.apartments VALUES (5509267866, 'Welcome to eaves Lawrenceville.', 'where sensible apartment living unites with a sensible cost of living. We offer quality apartments in Lawrenceville with a few little extras, like 9ft ceilings with fans and in-unit washers and dryers. Simply put, our Lawrenceville apartments provide more of what you hope for. Better than you bargained for. So, what are you waiting for. Columbia Apartments by eaves eaves Lawrenceville is conveniently located near 1, Interstate 295 and Interstate 95 as well as the Princeton Junction railway station. Residents will find a host of retail, dining and entertainment options nearby, including the Quaker Bridge Mall, Nassau Park Pavilion and MarketFair Mall. Columbia Apartment Lawrenceville we offer residents a wide range of on-site community amenities. Coming soon to our community are a number of enhancements designed with our residents in mind.', 1, 2, 1630, 'USD', 'No', 'Yes', '$ 1.630', 'Monthly', 920, 0, 95, 1, 1, '1568782058');
INSERT INTO public.apartments VALUES (5509268840, 'Welcome to eaves Lawrenceville.', 'where sensible apartment living unites with a sensible cost of living. We offer quality apartments in Lawrenceville with a few little extras, like 9ft ceilings with fans and in-unit washers and dryers. Simply put, our Lawrenceville apartments provide more of what you hope for. Better than you bargained for. Residents will find a host of retail, dining and entertainment options nearby, including the Quaker Bridge Mall, Nassau Park Pavilion and MarketFair Mall. Columbia Apartment Lawrenceville we offer residents a wide range of on-site community amenities. Coming soon to our community are a number of enhancements designed with our residents in mind. Included are a brand new WAG Pet Park to keep canine friends exercised and content, an expanded fitness facilities with modern equipment and yoga suite and an re0vated community room available for resident rental including modern kitchen, dining and lounge seating and gaming/entertainment options. More units available: two Bd / 1 Bedrooms 920 sq.', 1, 2, 1586, 'USD', 'No', 'Thumbnail', '$ 1.586', 'Monthly', 920, 0, 95, 1, 1, '1568782120');
INSERT INTO public.apartments VALUES (5663111837, '622 0rth Wayne Street, Apartment. A', 'Milledgeville STUCCO SIDING - DOWNTOWN WAYNE STREET AREA � ALL ELECTRIC � FRONT PORCH � WINDOW UNIT AIR CONDITIONER AND HEAT - WASHER/DRYER INCLUDED � WIFI AND LANDSCAPING INCLUDED IN RENT Ac, Balcony, Deck, Patio or Porch, Cable Ready, Dishwasher, Microwave, Paid Utilities, Cloths washer and drier In Unit, Washer dryer Connections, Highspeed broadband Available', 1, 2, 625, 'USD', 'No', 'Thumbnail', '$ 625', 'Monthly', 828, 60, 96, 3, 3, '1576878211');
INSERT INTO public.apartments VALUES (5641785233, 'Apartment sublease $775/mo', 'Sublease needed from December/beginning of January to August 15th, 2020, just in time for Spring and Summer semesters. The apartment is a fully furnished two bedrooms and I will likely leave my king size mattress behind if that''d be of use! You''d likely be taking the bigger room of the two. This apartment building is located right on Baseline facing the Flat Irons, right by bus route/public transportation stops and about 30 minutes from Denver. Walking distance from CU Boulder, roommate and I can attest, as well as coffee shops, yoga, and restaurants. Roommate is a junior at CU Boulder, quiet but friendly and super clean female. The apartment is 850 sq-ft and has one shared bathroom thats kept super clean. The utilities are included in rent (heat, water, trash, recycling, sewer). Roommate handles wifi and there is a fullsize washer/dryer area in the building.', 0, 2, 775, 'USD', 'No', 'Thumbnail', '$ 775', 'Monthly', 850, 0, 97, 3, 2, '1575602264');
INSERT INTO public.apartments VALUES (5663106093, '1350 Irwinton Road, Apartment. B', 'Milledgeville SWINT AVENUE/441 SOUTH � VINYL SIDING � ELECTRIC STOVE AND HOTWATER HEATER, NATURAL GAS HEAT - FRONT PORCH � LANDSCAPING INCLUDED IN RENT Air conditioned, Balcony, Deck, Patio or Porch, Cable Ready, Ceiling Fan(s), Washer and dryer Connections, Highspeed internet Available, Wood floors', 1, 1, 475, 'USD', 'No', 'Thumbnail', '$ 475', 'Monthly', 664, 61, 96, 3, 3, '1576877678');


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.categories VALUES (2, 'housing/rent/short_term');
INSERT INTO public.categories VALUES (1, 'housing/rent/apartment');
INSERT INTO public.categories VALUES (3, 'housing/rent/home');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.cities VALUES (1, 'Bryan', 'TX');
INSERT INTO public.cities VALUES (2, 'Greenville', 'TX');
INSERT INTO public.cities VALUES (3, 'New Kensington', 'PA');
INSERT INTO public.cities VALUES (4, 'Coraopolis', 'PA');
INSERT INTO public.cities VALUES (5, 'South Yarmouth', 'MA');
INSERT INTO public.cities VALUES (6, 'Natchitoches', 'LA');
INSERT INTO public.cities VALUES (7, 'Kalamazoo', 'MI');
INSERT INTO public.cities VALUES (8, 'Mission', 'TX');
INSERT INTO public.cities VALUES (9, 'Denver', 'CO');
INSERT INTO public.cities VALUES (10, 'Venice', 'FL');
INSERT INTO public.cities VALUES (11, 'Geneva', 'IL');
INSERT INTO public.cities VALUES (12, 'Federal Way', 'WA');
INSERT INTO public.cities VALUES (13, 'Spokane', 'WA');
INSERT INTO public.cities VALUES (14, 'Dalton', 'GA');
INSERT INTO public.cities VALUES (15, 'Ha0ver', 'MD');
INSERT INTO public.cities VALUES (16, 'Austin', 'TX');
INSERT INTO public.cities VALUES (17, 'N/A', 'N/A');
INSERT INTO public.cities VALUES (19, 'Frederick', 'MD');
INSERT INTO public.cities VALUES (20, 'Euless', 'TX');
INSERT INTO public.cities VALUES (21, 'Plainfield', 'IN');
INSERT INTO public.cities VALUES (22, 'Plainsboro', 'NJ');
INSERT INTO public.cities VALUES (23, 'Redondo Beach', 'CA');
INSERT INTO public.cities VALUES (24, 'Minneapolis', 'MN');
INSERT INTO public.cities VALUES (25, 'West Lafayette', 'IN');
INSERT INTO public.cities VALUES (26, 'Kent', 'WA');
INSERT INTO public.cities VALUES (27, 'Dallas', 'TX');
INSERT INTO public.cities VALUES (28, 'Las Vegas', 'NV');
INSERT INTO public.cities VALUES (29, 'Olathe', 'KS');
INSERT INTO public.cities VALUES (30, 'Springdale', 'AR');
INSERT INTO public.cities VALUES (31, 'Odenton', 'MD');
INSERT INTO public.cities VALUES (32, 'Boise', 'ID');
INSERT INTO public.cities VALUES (33, 'Lynnwood', 'WA');
INSERT INTO public.cities VALUES (34, 'Granbury', 'TX');
INSERT INTO public.cities VALUES (35, 'Hoover', 'AL');
INSERT INTO public.cities VALUES (36, 'La Quinta', 'CA');
INSERT INTO public.cities VALUES (37, 'Tucson', 'AZ');
INSERT INTO public.cities VALUES (38, 'Mountlake Terrace', 'WA');
INSERT INTO public.cities VALUES (39, 'San Antonio', 'TX');
INSERT INTO public.cities VALUES (40, 'Mcdo0ugh', 'GA');
INSERT INTO public.cities VALUES (41, 'Maumelle', 'AR');
INSERT INTO public.cities VALUES (42, 'Ames', 'IA');
INSERT INTO public.cities VALUES (43, 'Renton', 'WA');
INSERT INTO public.cities VALUES (44, 'West Lafayette', 'IN');
INSERT INTO public.cities VALUES (45, 'Raleigh', 'NC');
INSERT INTO public.cities VALUES (46, 'Middletown', 'OH');
INSERT INTO public.cities VALUES (47, 'Tallahassee', 'FL');
INSERT INTO public.cities VALUES (48, 'Loveland', 'OH');
INSERT INTO public.cities VALUES (49, 'Hillsborough', 'NC');
INSERT INTO public.cities VALUES (50, 'Seattle', 'WA');
INSERT INTO public.cities VALUES (51, 'Cockeysville', 'MD');
INSERT INTO public.cities VALUES (52, 'Lawrenceville', 'GA');
INSERT INTO public.cities VALUES (53, 'Florence', 'KY');
INSERT INTO public.cities VALUES (54, 'Washington', 'DC');
INSERT INTO public.cities VALUES (55, 'Bedford', 'TX');
INSERT INTO public.cities VALUES (56, 'Omaha', 'NE');
INSERT INTO public.cities VALUES (57, 'Hazelwood', 'MO');
INSERT INTO public.cities VALUES (58, 'Spring Hill', 'TN');
INSERT INTO public.cities VALUES (59, 'Milwaukee', 'WI');
INSERT INTO public.cities VALUES (60, 'Bothell', 'WA');
INSERT INTO public.cities VALUES (61, 'Weatogue', 'CT');
INSERT INTO public.cities VALUES (62, 'Starkville', 'MS');
INSERT INTO public.cities VALUES (63, 'Tacoma', 'WA');
INSERT INTO public.cities VALUES (64, 'San Francisco', 'CA');
INSERT INTO public.cities VALUES (65, 'Ellicott City', 'MD');
INSERT INTO public.cities VALUES (66, 'Madison', 'WI');
INSERT INTO public.cities VALUES (67, 'Homestead', 'FL');
INSERT INTO public.cities VALUES (68, 'Arlington', 'TX');
INSERT INTO public.cities VALUES (69, 'Sugar Land', 'TX');
INSERT INTO public.cities VALUES (70, '0rth Hollywood', 'CA');
INSERT INTO public.cities VALUES (71, 'Mercer Island', 'WA');
INSERT INTO public.cities VALUES (72, 'South Burlington', 'VT');
INSERT INTO public.cities VALUES (73, 'Somersworth', 'NH');
INSERT INTO public.cities VALUES (74, 'Anthem', 'AZ');
INSERT INTO public.cities VALUES (75, 'Grand Forks', 'ND');
INSERT INTO public.cities VALUES (76, 'Pittsburgh', 'PA');
INSERT INTO public.cities VALUES (77, 'Colorado Springs', 'CO');
INSERT INTO public.cities VALUES (78, 'Maplewood', 'MN');
INSERT INTO public.cities VALUES (79, 'Saginaw', 'MI');
INSERT INTO public.cities VALUES (80, 'Buena Park', 'CA');
INSERT INTO public.cities VALUES (81, 'Gresham', 'OR');
INSERT INTO public.cities VALUES (82, 'Topeka', 'KS');
INSERT INTO public.cities VALUES (83, 'Castro Valley', 'CA');
INSERT INTO public.cities VALUES (84, 'Princeton', 'NJ');
INSERT INTO public.cities VALUES (85, 'Bellevue', 'WA');
INSERT INTO public.cities VALUES (86, 'Chanhassen', 'MN');
INSERT INTO public.cities VALUES (87, 'South Milwaukee', 'WI');
INSERT INTO public.cities VALUES (88, 'Cincinnati', 'OH');
INSERT INTO public.cities VALUES (89, 'Sioux Falls', 'SD');
INSERT INTO public.cities VALUES (90, 'Reisterstown', 'MD');
INSERT INTO public.cities VALUES (91, 'Franklin Lakes', 'NJ');
INSERT INTO public.cities VALUES (92, 'Cypress', 'CA');
INSERT INTO public.cities VALUES (93, 'Greenbelt', 'MD');
INSERT INTO public.cities VALUES (94, 'Elizabeth', 'NJ');
INSERT INTO public.cities VALUES (95, 'Lawrence', 'NJ');
INSERT INTO public.cities VALUES (96, 'Milledgeville', 'GA');
INSERT INTO public.cities VALUES (97, 'Boulder', 'CO');


--
-- Data for Name: pet_types; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.pet_types VALUES (1, 'Dogs');
INSERT INTO public.pet_types VALUES (2, 'None');
INSERT INTO public.pet_types VALUES (3, 'Cats');


--
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.sources VALUES (3, 'ListedBuy');
INSERT INTO public.sources VALUES (1, 'RentDigs.com');
INSERT INTO public.sources VALUES (2, 'RentLingo');
INSERT INTO public.sources VALUES (4, 'RealRentals');
INSERT INTO public.sources VALUES (5, 'GoSection8');


--
-- Name: addresses_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.addresses_address_id_seq', 1, false);


--
-- Name: amenities_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.amenities_amenity_id_seq', 24, true);


--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.apartments_apartment_id_seq', 1, false);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 1, false);


--
-- Name: pet_types_pet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.pet_types_pet_type_id_seq', 3, true);


--
-- Name: sources_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.sources_source_id_seq', 1, false);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (amenity_id);


--
-- Name: apartment_amenities apartment_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_amenities
    ADD CONSTRAINT apartment_amenities_pkey PRIMARY KEY (apartment_id, amenity_id);


--
-- Name: apartment_pet_types apartment_pet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_pet_types
    ADD CONSTRAINT apartment_pet_types_pkey PRIMARY KEY (apartment_id, pet_type_id);


--
-- Name: apartments apartments_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (apartment_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: pet_types pet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pet_types
    ADD CONSTRAINT pet_types_pkey PRIMARY KEY (pet_type_id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (source_id);


--
-- Name: amenities unique_amenity_name; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT unique_amenity_name UNIQUE (amenity_name);


--
-- Name: pet_types unique_pet_type_name; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pet_types
    ADD CONSTRAINT unique_pet_type_name UNIQUE (pet_type_name);


--
-- Name: addresses addresses_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: apartment_amenities apartment_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_amenities
    ADD CONSTRAINT apartment_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(amenity_id);


--
-- Name: apartment_amenities apartment_amenities_apartment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_amenities
    ADD CONSTRAINT apartment_amenities_apartment_id_fkey FOREIGN KEY (apartment_id) REFERENCES public.apartments(apartment_id);


--
-- Name: apartment_pet_types apartment_pet_types_apartment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_pet_types
    ADD CONSTRAINT apartment_pet_types_apartment_id_fkey FOREIGN KEY (apartment_id) REFERENCES public.apartments(apartment_id);


--
-- Name: apartment_pet_types apartment_pet_types_pet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartment_pet_types
    ADD CONSTRAINT apartment_pet_types_pet_type_id_fkey FOREIGN KEY (pet_type_id) REFERENCES public.pet_types(pet_type_id);


--
-- Name: apartments apartments_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(address_id);


--
-- Name: apartments apartments_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: apartments apartments_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: apartments apartments_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.sources(source_id);


--
-- PostgreSQL database dump complete
--

