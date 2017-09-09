--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE courses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000) NOT NULL,
    credits integer NOT NULL
);


ALTER TABLE courses OWNER TO postgres;

--
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE faculties (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE faculties OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE students (
    id integer NOT NULL,
    first_name character varying(250) NOT NULL,
    last_name character varying(250) NOT NULL,
    facultyid integer
);


ALTER TABLE students OWNER TO postgres;

--
-- Name: students_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE students_courses (
    studentid integer NOT NULL,
    courseid integer NOT NULL
);


ALTER TABLE students_courses OWNER TO postgres;

--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY courses (id, name, description, credits) FROM stdin;
2	Math	Math class	10
1	English	English class	10
4	History	History class	5
3	Geography	Geography class	5
6	Physics	Physics class	5
5	Biology	Biology class	5
7	Computer graphics	Computer graphics class	5
10	Democracy, Freedom, and the Rule of Law	Democracy, Freedom, and the Rule of Law class	5
9	Methodology of Science – Biology	Methodology of Science – Biology class	5
12	Advanced Topics in Philosophy I	Advanced Topics in Philosophy I class	5
8	Human Nature and Society	Human Nature and Society class	5
11	Critical Reading and Argumentation	Critical Reading and Argumentation class	5
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY faculties (id, name) FROM stdin;
1	FMI
2	fakultet
3	fakultet
4	filologiq
5	filologiq
6	fakultet
7	pedagogika
8	fakultet
9	fakultet
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY students (id, first_name, last_name, facultyid) FROM stdin;
1	Viktor	Naydenov	1
2	Viktor	Velev	5
3	Pesho	Peshov	3
4	Mark	Gea	4
5	Ivan	Ivanov	7
6	Petkan	Petkanov	2
7	Ivan	Yonkov	6
8	Presli	Mihailov	8
9	Adrian	Petrov	9
10	Viktoriq	Naydenova	1
11	Nenka	Veleva	5
12	Mitka	Petrova	3
13	Damqn	Nazi	4
14	Panaiot	Ivanov	7
15	Mitko	Petkanov	2
16	Gosho	Yonkov	6
17	Valio	Mihailov	8
18	Petko	Georgiev	9
\.


--
-- Data for Name: students_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY students_courses (studentid, courseid) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
2	1
2	2
2	3
2	4
2	5
2	6
2	7
3	4
3	5
3	6
3	7
3	8
3	9
3	10
4	6
5	5
6	12
7	11
8	3
8	10
9	9
9	11
10	10
\.


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students_courses students_courses_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students_courses
    ADD CONSTRAINT students_courses_courseid_fkey FOREIGN KEY (courseid) REFERENCES courses(id) ON DELETE CASCADE;


--
-- Name: students_courses students_courses_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students_courses
    ADD CONSTRAINT students_courses_studentid_fkey FOREIGN KEY (studentid) REFERENCES students(id) ON DELETE CASCADE;


--
-- Name: students students_facultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_facultyid_fkey FOREIGN KEY (facultyid) REFERENCES faculties(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

