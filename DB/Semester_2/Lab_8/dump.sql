--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

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
-- Name: Cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cars" (
    car_id integer NOT NULL,
    name character varying(255),
    number_plate character varying(255),
    color character varying(255),
    rent_rate integer
);


ALTER TABLE public."Cars" OWNER TO postgres;

--
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    client_id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    phone_number integer,
    banned integer
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- Name: Rents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rents" (
    rent_id integer NOT NULL,
    car_id integer,
    client_id integer,
    date_start date,
    date_end date,
    rate integer
);


ALTER TABLE public."Rents" OWNER TO postgres;

--
-- Data for Name: Cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cars" (car_id, name, number_plate, color, rent_rate) FROM stdin;
1	Lanos	AA 7777 AA	black	75
2	VW Passat	AA 7778 AA	red	275
3	ZAZ	AA 7779 AA	green	45
4	Skoda Octavia	AA 7780 AA	blue	23
5	Ford Transit	AA 7781 AA	black	67
6	Renault Logan	AA 7782 AA	purple	94
7	BMW M3	AA 7783 AA	yellow	234
8	Chevrolet Aveo	AA 7784 AA	green	47
9	GMC	AA 7785 AA	green	32
10	Nissan Skyline GT R32	AA 7786 AA	black	19
11	Honda Civic	AA 7787 AA	red	93
\.


--
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" (client_id, firstname, lastname, phone_number, banned) FROM stdin;
1	Bob	Peters	15534567	0
2	John	Smith	44201678	0
3	Emily	Johnson	3316789	0
4	Michael	Brown	2345678	0
5	Olivia	Davis	6125678	0
6	William	Wilson	8135678	0
7	Sophia	Thompson	39345678	0
8	Benjamin	Davis	5345678	0
9	Ava	Robinson	7495567	0
10	James	Anderson	86145678	0
11	Isabella	Martinez	9714567	0
\.


--
-- Data for Name: Rents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rents" (rent_id, car_id, client_id, date_start, date_end, rate) FROM stdin;
\.


--
-- Name: Cars Cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars"
    ADD CONSTRAINT "Cars_pkey" PRIMARY KEY (car_id);


--
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (client_id);


--
-- Name: Rents Rents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rents"
    ADD CONSTRAINT "Rents_pkey" PRIMARY KEY (rent_id);


--
-- Name: Rents Rents_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rents"
    ADD CONSTRAINT "Rents_car_id_fkey" FOREIGN KEY (car_id) REFERENCES public."Cars"(car_id);


--
-- Name: Rents Rents_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rents"
    ADD CONSTRAINT "Rents_client_id_fkey" FOREIGN KEY (client_id) REFERENCES public."Clients"(client_id);


--
-- PostgreSQL database dump complete
--

