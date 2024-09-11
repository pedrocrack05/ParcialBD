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
-- Name: events; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.events (
    event_id bigint NOT NULL,
    event_name character varying(150) NOT NULL,
    event_date timestamp without time zone NOT NULL,
    location character varying(255) NOT NULL
);


ALTER TABLE public.events OWNER TO "BDO_owner";

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_event_id_seq OWNER TO "BDO_owner";

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.feedback (
    feedback_id bigint NOT NULL,
    event_id bigint,
    user_id bigint,
    comments text,
    rating integer,
    CONSTRAINT feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.feedback OWNER TO "BDO_owner";

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_feedback_id_seq OWNER TO "BDO_owner";

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.media (
    media_id bigint NOT NULL,
    media_type character varying(10),
    url character varying(255) NOT NULL,
    model_id bigint,
    CONSTRAINT media_media_type_check CHECK (((media_type)::text = ANY ((ARRAY['photo'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.media OWNER TO "BDO_owner";

--
-- Name: media_media_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.media_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_media_id_seq OWNER TO "BDO_owner";

--
-- Name: media_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.media_media_id_seq OWNED BY public.media.media_id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.models (
    model_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    biography text,
    user_id bigint
);


ALTER TABLE public.models OWNER TO "BDO_owner";

--
-- Name: models_model_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.models_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.models_model_id_seq OWNER TO "BDO_owner";

--
-- Name: models_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.models_model_id_seq OWNED BY public.models.model_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO "BDO_owner";

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_role_id_seq OWNER TO "BDO_owner";

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.tickets (
    ticket_id bigint NOT NULL,
    user_id bigint,
    event_id bigint,
    purchase_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tickets OWNER TO "BDO_owner";

--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.tickets_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_ticket_id_seq OWNER TO "BDO_owner";

--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.tickets_ticket_id_seq OWNED BY public.tickets.ticket_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    role_id bigint
);


ALTER TABLE public.users OWNER TO "BDO_owner";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO "BDO_owner";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- Name: media media_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.media ALTER COLUMN media_id SET DEFAULT nextval('public.media_media_id_seq'::regclass);


--
-- Name: models model_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.models ALTER COLUMN model_id SET DEFAULT nextval('public.models_model_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: tickets ticket_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.tickets_ticket_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.events VALUES (1, 'Dwarf Drag Queen Fashion Show 2024', '2024-11-15 19:00:00', 'Auditorio Universidad EIA');
INSERT INTO public.events VALUES (2, 'Dwarf Drag Queens Parade', '2024-11-16 18:00:00', 'Plaza Central Medellín');


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.feedback VALUES (1, 1, 4, 'Un evento fabuloso, todo estuvo increíble.', 5);
INSERT INTO public.feedback VALUES (2, 2, 4, 'La pasé genial, espero que haya más eventos como este.', 4);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.media VALUES (1, 'photo', 'https://example.com/photo1.jpg', 1);
INSERT INTO public.media VALUES (2, 'video', 'https://example.com/video1.mp4', 1);
INSERT INTO public.media VALUES (3, 'photo', 'https://example.com/photo2.jpg', 2);
INSERT INTO public.media VALUES (4, 'video', 'https://example.com/video2.mp4', 2);


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.models VALUES (1, 'Queen Bella', 'Una modelo enana destacada por su estilo único y glamoroso.', 3);
INSERT INTO public.models VALUES (2, 'Queen Glitter', 'Apasionada por la moda y el empoderamiento.', 3);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.roles VALUES (1, 'Admin');
INSERT INTO public.roles VALUES (2, 'Organizer');
INSERT INTO public.roles VALUES (3, 'Model');
INSERT INTO public.roles VALUES (4, 'Attendee');


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.tickets VALUES (1, 4, 1, '2024-09-11 05:22:24.677252');
INSERT INTO public.tickets VALUES (2, 4, 2, '2024-09-11 05:22:24.677252');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.users VALUES (1, 'admin_user', 'hashed_password1', 'admin@eia.com', 1);
INSERT INTO public.users VALUES (2, 'organizer_user', 'hashed_password2', 'organizer@eia.com', 2);
INSERT INTO public.users VALUES (3, 'model_user', 'hashed_password3', 'model@eia.com', 3);
INSERT INTO public.users VALUES (4, 'attendee_user', 'hashed_password4', 'attendee@eia.com', 4);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.events_event_id_seq', 2, true);


--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 2, true);


--
-- Name: media_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.media_media_id_seq', 4, true);


--
-- Name: models_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.models_model_id_seq', 2, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 4, true);


--
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (media_id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (model_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: feedback feedback_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: feedback feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: media media_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(model_id);


--
-- Name: models models_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: tickets tickets_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

