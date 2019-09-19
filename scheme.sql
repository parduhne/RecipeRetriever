--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-09-19 11:34:44

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 209 (class 1255 OID 24745)
-- Name: get_ingedienterecept(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_ingedienterecept(ime_recepta character varying) RETURNS TABLE(idingrediants integer, name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
   RETURN QUERY 
 SELECT
      public."Ingrediants"."IdIngrediants",
      public."Ingrediants"."Name"
   from  
      public."Ingrediants"
 ;
END; $$;


ALTER FUNCTION public.get_ingedienterecept(ime_recepta character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24588)
-- Name: Ingrediants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ingrediants" (
    "IdIngrediants" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text,
    "IdMeasurements" integer NOT NULL
);


ALTER TABLE public."Ingrediants" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24618)
-- Name: IngrediantsRecipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IngrediantsRecipes" (
    "IdIngrediants" integer NOT NULL,
    "IdRecipes" integer NOT NULL,
    "Size" real
);


ALTER TABLE public."IngrediantsRecipes" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24586)
-- Name: Ingrediants_IdIngrediants_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ingrediants_IdIngrediants_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ingrediants_IdIngrediants_seq" OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 196
-- Name: Ingrediants_IdIngrediants_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ingrediants_IdIngrediants_seq" OWNED BY public."Ingrediants"."IdIngrediants";


--
-- TOC entry 200 (class 1259 OID 24608)
-- Name: Ingrediants_IdMeasurements_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ingrediants_IdMeasurements_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ingrediants_IdMeasurements_seq" OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 200
-- Name: Ingrediants_IdMeasurements_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ingrediants_IdMeasurements_seq" OWNED BY public."Ingrediants"."IdMeasurements";


--
-- TOC entry 203 (class 1259 OID 24623)
-- Name: Measurements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Measurements" (
    "IdMeasurements" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."Measurements" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24621)
-- Name: Measurements_IdMeasurements_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Measurements_IdMeasurements_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Measurements_IdMeasurements_seq" OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 202
-- Name: Measurements_IdMeasurements_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Measurements_IdMeasurements_seq" OWNED BY public."Measurements"."IdMeasurements";


--
-- TOC entry 208 (class 1259 OID 24710)
-- Name: Pantry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pantry" (
    "IdUsers" integer NOT NULL,
    "IdIngrediants" integer NOT NULL,
    "Size" character varying
);


ALTER TABLE public."Pantry" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24599)
-- Name: Recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recipes" (
    "IdRecipes" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text
);


ALTER TABLE public."Recipes" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24597)
-- Name: Recipies_IdRecipies_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recipies_IdRecipies_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Recipies_IdRecipies_seq" OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 198
-- Name: Recipies_IdRecipies_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recipies_IdRecipies_seq" OWNED BY public."Recipes"."IdRecipes";


--
-- TOC entry 205 (class 1259 OID 24634)
-- Name: Units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Units" (
    "IdUnits" integer NOT NULL,
    "Name" character varying NOT NULL,
    "ConversionFactor" real,
    "IdMeasurements" integer
);


ALTER TABLE public."Units" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24632)
-- Name: Units_IdUnits_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Units_IdUnits_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Units_IdUnits_seq" OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 204
-- Name: Units_IdUnits_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Units_IdUnits_seq" OWNED BY public."Units"."IdUnits";


--
-- TOC entry 207 (class 1259 OID 24645)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "IdUsers" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Email" character varying NOT NULL,
    "Password" character varying NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24643)
-- Name: Users_IdUsers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_IdUsers_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_IdUsers_seq" OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 206
-- Name: Users_IdUsers_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_IdUsers_seq" OWNED BY public."Users"."IdUsers";


--
-- TOC entry 2711 (class 2604 OID 24591)
-- Name: Ingrediants IdIngrediants; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ingrediants" ALTER COLUMN "IdIngrediants" SET DEFAULT nextval('public."Ingrediants_IdIngrediants_seq"'::regclass);


--
-- TOC entry 2712 (class 2604 OID 24610)
-- Name: Ingrediants IdMeasurements; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ingrediants" ALTER COLUMN "IdMeasurements" SET DEFAULT nextval('public."Ingrediants_IdMeasurements_seq"'::regclass);


--
-- TOC entry 2714 (class 2604 OID 24626)
-- Name: Measurements IdMeasurements; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Measurements" ALTER COLUMN "IdMeasurements" SET DEFAULT nextval('public."Measurements_IdMeasurements_seq"'::regclass);


--
-- TOC entry 2713 (class 2604 OID 24602)
-- Name: Recipes IdRecipes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recipes" ALTER COLUMN "IdRecipes" SET DEFAULT nextval('public."Recipies_IdRecipies_seq"'::regclass);


--
-- TOC entry 2715 (class 2604 OID 24637)
-- Name: Units IdUnits; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Units" ALTER COLUMN "IdUnits" SET DEFAULT nextval('public."Units_IdUnits_seq"'::regclass);


--
-- TOC entry 2716 (class 2604 OID 24648)
-- Name: Users IdUsers; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "IdUsers" SET DEFAULT nextval('public."Users_IdUsers_seq"'::regclass);


--
-- TOC entry 2860 (class 0 OID 24588)
-- Dependencies: 197
-- Data for Name: Ingrediants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ingrediants" ("IdIngrediants", "Name", "Description", "IdMeasurements") FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 24618)
-- Dependencies: 201
-- Data for Name: IngrediantsRecipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IngrediantsRecipes" ("IdIngrediants", "IdRecipes", "Size") FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 24623)
-- Dependencies: 203
-- Data for Name: Measurements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Measurements" ("IdMeasurements", "Name") FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 24710)
-- Dependencies: 208
-- Data for Name: Pantry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pantry" ("IdUsers", "IdIngrediants", "Size") FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 24599)
-- Dependencies: 199
-- Data for Name: Recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recipes" ("IdRecipes", "Name", "Description") FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 24634)
-- Dependencies: 205
-- Data for Name: Units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Units" ("IdUnits", "Name", "ConversionFactor", "IdMeasurements") FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 24645)
-- Dependencies: 207
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("IdUsers", "Name", "Email", "Password") FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 196
-- Name: Ingrediants_IdIngrediants_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ingrediants_IdIngrediants_seq"', 1, false);


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 200
-- Name: Ingrediants_IdMeasurements_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ingrediants_IdMeasurements_seq"', 1, false);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 202
-- Name: Measurements_IdMeasurements_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Measurements_IdMeasurements_seq"', 1, false);


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 198
-- Name: Recipies_IdRecipies_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recipies_IdRecipies_seq"', 1, false);


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 204
-- Name: Units_IdUnits_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Units_IdUnits_seq"', 1, false);


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 206
-- Name: Users_IdUsers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_IdUsers_seq"', 1, false);


--
-- TOC entry 2718 (class 2606 OID 24596)
-- Name: Ingrediants Ingrediants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ingrediants"
    ADD CONSTRAINT "Ingrediants_pkey" PRIMARY KEY ("IdIngrediants");


--
-- TOC entry 2725 (class 2606 OID 24631)
-- Name: Measurements Measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Measurements"
    ADD CONSTRAINT "Measurements_pkey" PRIMARY KEY ("IdMeasurements");


--
-- TOC entry 2721 (class 2606 OID 24607)
-- Name: Recipes Recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recipes"
    ADD CONSTRAINT "Recipes_pkey" PRIMARY KEY ("IdRecipes");


--
-- TOC entry 2727 (class 2606 OID 24642)
-- Name: Units Units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY ("IdUnits");


--
-- TOC entry 2730 (class 2606 OID 24653)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("IdUsers");


--
-- TOC entry 2719 (class 1259 OID 24667)
-- Name: fki_IdMeasurement; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_IdMeasurement" ON public."Ingrediants" USING btree ("IdMeasurements");


--
-- TOC entry 2722 (class 1259 OID 24678)
-- Name: fki_Ingrediants_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Ingrediants_fkey" ON public."IngrediantsRecipes" USING btree ("IdIngrediants");


--
-- TOC entry 2728 (class 1259 OID 24707)
-- Name: fki_Measurements_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Measurements_fkey" ON public."Units" USING btree ("IdMeasurements");


--
-- TOC entry 2723 (class 1259 OID 24684)
-- Name: fki_Recipies; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Recipies" ON public."IngrediantsRecipes" USING btree ("IdRecipes");


--
-- TOC entry 2731 (class 1259 OID 24724)
-- Name: fki_Users_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Users_fkey" ON public."Pantry" USING btree ("IdUsers");


--
-- TOC entry 2733 (class 2606 OID 24673)
-- Name: IngrediantsRecipes Ingrediants_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IngrediantsRecipes"
    ADD CONSTRAINT "Ingrediants_fkey" FOREIGN KEY ("IdIngrediants") REFERENCES public."Ingrediants"("IdIngrediants");


--
-- TOC entry 2736 (class 2606 OID 24735)
-- Name: Pantry Ingrediants_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pantry"
    ADD CONSTRAINT "Ingrediants_fkey" FOREIGN KEY ("IdIngrediants") REFERENCES public."Ingrediants"("IdIngrediants");


--
-- TOC entry 2732 (class 2606 OID 24668)
-- Name: Ingrediants Measurements_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ingrediants"
    ADD CONSTRAINT "Measurements_fkey" FOREIGN KEY ("IdMeasurements") REFERENCES public."Measurements"("IdMeasurements");


--
-- TOC entry 2735 (class 2606 OID 24702)
-- Name: Units Measurements_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Measurements_fkey" FOREIGN KEY ("IdMeasurements") REFERENCES public."Measurements"("IdMeasurements");


--
-- TOC entry 2734 (class 2606 OID 24679)
-- Name: IngrediantsRecipes Recipes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IngrediantsRecipes"
    ADD CONSTRAINT "Recipes_fkey" FOREIGN KEY ("IdRecipes") REFERENCES public."Recipes"("IdRecipes");


--
-- TOC entry 2737 (class 2606 OID 24740)
-- Name: Pantry Users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pantry"
    ADD CONSTRAINT "Users_fkey" FOREIGN KEY ("IdUsers") REFERENCES public."Users"("IdUsers");


-- Completed on 2019-09-19 11:34:45

--
-- PostgreSQL database dump complete
--

