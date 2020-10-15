--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 9.4.20
-- Started on 2020-10-15 07:25:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE mobil1;
--
-- TOC entry 2084 (class 1262 OID 49987)
-- Name: mobil1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mobil1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE mobil1 OWNER TO postgres;

\connect mobil1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 50028)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    comment_content character varying(500) NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 50026)
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_comment_id_seq OWNER TO postgres;

--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 182
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;


--
-- TOC entry 185 (class 1259 OID 50039)
-- Name: imagen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.imagen (
    img_id integer NOT NULL,
    img_url character varying(500) NOT NULL,
    product_id integer NOT NULL,
    img_created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.imagen OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 50037)
-- Name: imagen_img_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagen_img_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagen_img_id_seq OWNER TO postgres;

--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 184
-- Name: imagen_img_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagen_img_id_seq OWNED BY public.imagen.img_id;


--
-- TOC entry 177 (class 1259 OID 50004)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.invoice (
    invoice_id integer NOT NULL,
    user_id integer NOT NULL,
    total real NOT NULL,
    invoice_created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 50002)
-- Name: invoice_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 176
-- Name: invoice_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_invoice_id_seq OWNED BY public.invoice.invoice_id;


--
-- TOC entry 179 (class 1259 OID 50013)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    product_name character varying(50) NOT NULL,
    product_des character varying(50) NOT NULL,
    product_prices real NOT NULL,
    quantify integer NOT NULL,
    product_created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 50020)
-- Name: product_invoice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.product_invoice (
    product_id integer NOT NULL,
    invoice_id integer NOT NULL
);


ALTER TABLE public.product_invoice OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 50011)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 178
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 186 (class 1259 OID 50049)
-- Name: shopping_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.shopping_product (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    quantify integer NOT NULL
);


ALTER TABLE public.shopping_product OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 49988)
-- Name: type_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.type_user (
    type_id integer NOT NULL,
    type_des character varying(20) NOT NULL
);


ALTER TABLE public.type_user OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 49995)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    user_username character varying(25) NOT NULL,
    user_password character varying(100) NOT NULL,
    user_email character varying(50) NOT NULL,
    user_created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 49993)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 181 (class 1259 OID 50023)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.wishlist (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    quantify integer NOT NULL
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 1929 (class 2604 OID 50031)
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 50042)
-- Name: img_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen ALTER COLUMN img_id SET DEFAULT nextval('public.imagen_img_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 50007)
-- Name: invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice ALTER COLUMN invoice_id SET DEFAULT nextval('public.invoice_invoice_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 50016)
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 1923 (class 2604 OID 49998)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2075 (class 0 OID 50028)
-- Dependencies: 183
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 182
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 1, false);


--
-- TOC entry 2077 (class 0 OID 50039)
-- Dependencies: 185
-- Data for Name: imagen; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 184
-- Name: imagen_img_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagen_img_id_seq', 1, false);


--
-- TOC entry 2069 (class 0 OID 50004)
-- Dependencies: 177
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 176
-- Name: invoice_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_invoice_id_seq', 1, false);


--
-- TOC entry 2071 (class 0 OID 50013)
-- Dependencies: 179
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (product_id, user_id, product_name, product_des, product_prices, quantify, product_created_at) VALUES (2, 2, 'a81', 'Samsung', 555.75, 55558, '2020-10-10 13:54:53.995');


--
-- TOC entry 2072 (class 0 OID 50020)
-- Dependencies: 180
-- Data for Name: product_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 178
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 2, true);


--
-- TOC entry 2078 (class 0 OID 50049)
-- Dependencies: 186
-- Data for Name: shopping_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shopping_product (product_id, user_id, quantify) VALUES (2, 2, 23336);


--
-- TOC entry 2065 (class 0 OID 49988)
-- Dependencies: 173
-- Data for Name: type_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_user (type_id, type_des) VALUES (1, 'admin');
INSERT INTO public.type_user (type_id, type_des) VALUES (2, 'user');


--
-- TOC entry 2067 (class 0 OID 49995)
-- Dependencies: 175
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, type_id, user_username, user_password, user_email, user_created_at) VALUES (2, 2, 'fanny', '$2a$10$Lapg9I/9niHLoczEF.F4Qu71m1GZOoFZROjAifQzYTtroiWox8NSm', 'fanny@urbe.edu', '2020-10-10 09:51:15.908');
INSERT INTO public.users (user_id, type_id, user_username, user_password, user_email, user_created_at) VALUES (3, 2, 'fanny2', '$2a$10$thz3vCqkkIHSTQVAnRDk5uCuKwFYqlO9qPYFDDJBt5UGMovZdYhvi', 'fanny@urbe.edu.com', '2020-10-10 09:59:24.455');
INSERT INTO public.users (user_id, type_id, user_username, user_password, user_email, user_created_at) VALUES (4, 2, 'pepe', '$2a$10$nJLNV/vWDVuEyEfIxuQ5A.qCT.pba4pHDdJFUV6bcGLZOu9nhRpDK', 'pepe@gmail.com', '2020-10-14 22:24:59.511');
INSERT INTO public.users (user_id, type_id, user_username, user_password, user_email, user_created_at) VALUES (5, 2, 'mobil', '$2a$10$gsGOVuuK7VWYR92AfpTOVeedkj/Ej0Av7YvRoM6kq8xZH8F.1cwnK', 'mobil@gmail.com', '2020-10-14 22:27:18.843');


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- TOC entry 2073 (class 0 OID 50023)
-- Dependencies: 181
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1941 (class 2606 OID 50036)
-- Name: comment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 1943 (class 2606 OID 50048)
-- Name: imagen_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.imagen
    ADD CONSTRAINT imagen_pk PRIMARY KEY (img_id);


--
-- TOC entry 1937 (class 2606 OID 50010)
-- Name: invoice_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pk PRIMARY KEY (invoice_id);


--
-- TOC entry 1939 (class 2606 OID 50019)
-- Name: product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (product_id);


--
-- TOC entry 1933 (class 2606 OID 49992)
-- Name: type_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.type_user
    ADD CONSTRAINT type_user_pk PRIMARY KEY (type_id);


--
-- TOC entry 1935 (class 2606 OID 50001)
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- TOC entry 1947 (class 2606 OID 50082)
-- Name: invoice_product_invoice_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_invoice
    ADD CONSTRAINT invoice_product_invoice_fk FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id);


--
-- TOC entry 1955 (class 2606 OID 50087)
-- Name: product_car_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_product
    ADD CONSTRAINT product_car_product_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 1952 (class 2606 OID 50097)
-- Name: product_comment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT product_comment_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 1953 (class 2606 OID 50092)
-- Name: product_imagen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen
    ADD CONSTRAINT product_imagen_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 1948 (class 2606 OID 50107)
-- Name: product_product_invoice_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_invoice
    ADD CONSTRAINT product_product_invoice_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 1950 (class 2606 OID 50102)
-- Name: product_wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT product_wishlist_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 1944 (class 2606 OID 50052)
-- Name: type_user_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT type_user_users_fk FOREIGN KEY (type_id) REFERENCES public.type_user(type_id);


--
-- TOC entry 1951 (class 2606 OID 50067)
-- Name: users_comment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT users_comment_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 1945 (class 2606 OID 50077)
-- Name: users_invoice_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT users_invoice_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 1946 (class 2606 OID 50057)
-- Name: users_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT users_product_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 1954 (class 2606 OID 50062)
-- Name: users_shopping_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_product
    ADD CONSTRAINT users_shopping_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 1949 (class 2606 OID 50072)
-- Name: users_wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT users_wishlist_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-10-15 07:25:49

--
-- PostgreSQL database dump complete
--

