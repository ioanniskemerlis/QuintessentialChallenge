--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-16 02:09:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16419)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16418)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 220 (class 1259 OID 16403)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16402)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 218 (class 1259 OID 16391)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16390)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4656 (class 2604 OID 16422)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 16406)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 16394)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4820 (class 0 OID 16419)
-- Dependencies: 222
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, post_id, user_id, content, created_at, updated_at) FROM stdin;
1	1	2	Great post by user1!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
2	1	3	I really enjoyed this post!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
3	2	4	Interesting thoughts!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
4	2	5	Thanks for sharing, user1!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
5	3	1	Nice work, user2!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
6	3	6	I agree with your point!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
7	4	7	Very insightful!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
8	4	8	Loved reading this post!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
9	5	2	Good job, user3!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
10	5	9	Keep it up!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
11	6	10	Really interesting post!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
12	6	4	Thanks for the info!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
13	7	1	I like your style, user4!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
14	7	3	Very engaging content!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
15	8	2	Nice read, user4!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
16	8	5	Great insights!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
17	9	6	Interesting perspective!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
18	9	7	I learned something new!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
19	10	8	Very thoughtful!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
20	10	9	Keep sharing!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
21	11	5	Great post, user6!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
22	11	2	Really enjoyed this!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
23	12	7	Thanks for sharing, user6!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
24	12	10	Excellent write-up!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
25	13	4	Very creative, user7!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
26	13	8	I appreciate this post!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
27	14	3	Inspiring thoughts!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
28	14	9	Loved the content, user7!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
29	15	2	Nicely done, user8!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
30	15	6	Very interesting post!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
31	16	1	Good insights, user8!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
32	16	5	Keep it coming!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
33	17	4	Well articulated, user9!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
34	17	8	Enjoyed reading this!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
35	18	3	Great perspective, user9!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
36	18	7	Very informative!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
37	19	2	Nice post, user10!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
38	19	6	Thanks for sharing!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
39	20	1	Really enjoyed this post, user10!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
40	20	5	Keep up the great work!	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
43	21	12	Great post!	2025-02-16 00:54:44.055836	2025-02-16 00:54:44.055836
44	21	12	Great	2025-02-16 00:55:33.67788	2025-02-16 00:55:33.67788
45	21	12	welldone	2025-02-16 00:55:40.126897	2025-02-16 00:55:40.126897
46	21	12	happy birthday	2025-02-16 00:55:50.749417	2025-02-16 00:55:50.749417
47	21	12	happy new year	2025-02-16 00:55:57.728097	2025-02-16 00:55:57.728097
48	21	12	congratulations	2025-02-16 00:56:06.826421	2025-02-16 00:56:06.826421
\.


--
-- TOC entry 4818 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, content, created_at, updated_at) FROM stdin;
1	1	User 1 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
2	1	User 1 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
4	2	User 2 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
5	3	User 3 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
6	3	User 3 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
7	4	User 4 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
8	4	User 4 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
9	5	User 5 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
10	5	User 5 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
11	6	User 6 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
12	6	User 6 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
13	7	User 7 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
14	7	User 7 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
15	8	User 8 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
16	8	User 8 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
17	9	User 9 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
18	9	User 9 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
19	10	User 10 post 1 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
20	10	User 10 post 2 content	2025-02-15 20:27:40.134441	2025-02-15 20:27:40.134441
3	2	test ok	2025-02-15 20:27:40.134441	2025-02-15 20:50:09.701446
21	12	my post	2025-02-16 00:43:34.990572	2025-02-16 00:43:34.990572
22	12	my post2	2025-02-16 00:43:48.166313	2025-02-16 00:43:48.166313
23	12	my post3	2025-02-16 00:43:52.678676	2025-02-16 00:43:52.678676
24	12	my post4	2025-02-16 00:43:55.911384	2025-02-16 00:43:55.911384
25	12	my post5	2025-02-16 00:43:59.793421	2025-02-16 00:43:59.793421
26	12	my post6	2025-02-16 00:44:03.69256	2025-02-16 00:44:03.69256
27	12	my post7	2025-02-16 00:44:07.523525	2025-02-16 00:44:07.523525
28	12	my post8	2025-02-16 00:44:11.348403	2025-02-16 00:44:11.348403
29	12	my post9	2025-02-16 00:44:15.186562	2025-02-16 00:44:15.186562
30	12	my post10	2025-02-16 00:44:19.712337	2025-02-16 00:44:19.712337
\.


--
-- TOC entry 4816 (class 0 OID 16391)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, created_at) FROM stdin;
1	test@example.com	$2b$10$q3RdKvIw8k9Wv1Y3KdTYz.MA.LDMTnjRucNRt0JczM55N4vFI.9fa	2025-02-13 16:13:38.308953
2	user1@example.com	$2b$10$9RU0nbR7WZh9V2X.Nr4sau6xVpJeqv4gkcl1H/JBYcat2QnYJDJee	2025-02-15 20:27:40.134441
3	user2@example.com	$2b$10$SbO1CrI72F.XJlBnTyear.hTIH1H6n2YU9v9WJw5LCf9/SQwok5bG	2025-02-15 20:27:40.134441
4	user3@example.com	$2b$10$yM0TJS8WMdjsJFtEB5k/Du1y3BapQ6qmdoUH/xaUe5AjgTjIy4m7.	2025-02-15 20:27:40.134441
5	user4@example.com	$2b$10$Wmi11ViN.ZJBG08Cld03JeS/WiaRIuA3sVAJrUaqvm5dG8/dBPB7G	2025-02-15 20:27:40.134441
6	user5@example.com	$2b$10$niPKAH2qV/3g6VUP9rMkfedMuGd2ToZhP1qKDWe/SSMmWdPsewak.	2025-02-15 20:27:40.134441
7	user6@example.com	$2b$10$oClANH6xPjUh11NpkA7IY.zHfolv3snp9zqou8Po5H.pwruI4kaaO	2025-02-15 20:27:40.134441
8	user7@example.com	$2b$10$0aBspTOBx0FdpgL3y/zksON0761ta4pZTb5oU9eqoFb.vEbiz1682	2025-02-15 20:27:40.134441
9	user8@example.com	$2b$10$iHI/6I0AVKowFhrzivrrxOAMk6XeC80aOJ6zQIlDDWnHlvm3FlD9m	2025-02-15 20:27:40.134441
10	user9@example.com	$2b$10$iP0KRQgkgteBD16Ji32Y6.lRIWgdx97lwW7MrJO9vU0KBJ.czMZe6	2025-02-15 20:27:40.134441
11	user10@example.com	$2b$10$9LNEC4HvNw8vmkdlVsaYuuiBpB3C4/VZ0WX.o8JWw3B8foiDmpdgC	2025-02-15 20:27:40.134441
12	ioannis@example.com	$2b$10$UpdMLHQHmZdVsDtXH82ZlOMoAD47sXksuILOTfcFNsqtNWXW3znx.	2025-02-16 00:11:56.234971
\.


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 49, true);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 31, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- TOC entry 4666 (class 2606 OID 16428)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4664 (class 2606 OID 16412)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 16401)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4662 (class 2606 OID 16399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 16429)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- TOC entry 4669 (class 2606 OID 16434)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4667 (class 2606 OID 16413)
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-02-16 02:09:50

--
-- PostgreSQL database dump complete
--

