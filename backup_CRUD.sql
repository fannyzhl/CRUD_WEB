--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 9.4.20
-- Started on 2020-10-15 07:27:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

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



-- Completed on 2020-10-15 07:27:54

--
-- PostgreSQL database dump complete
--

