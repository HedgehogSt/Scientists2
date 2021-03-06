DROP DATABASE IF EXISTS j_stateva;
CREATE DATABASE j_stateva;
\c j_stateva;

CREATE TABLE countries (
    id integer NOT NULL,
    country character varying(80) NOT NULL
);


ALTER TABLE countries OWNER TO postgres;


CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;


ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


CREATE TABLE discoveries (
    id integer NOT NULL,
    discovery character varying(80) NOT NULL,
    year integer NOT NULL,
    opening_area character varying(80) NOT NULL,
    place character varying(180) NOT NULL,
    CONSTRAINT discoveries_year_check CHECK ((year >= 1500))
);


ALTER TABLE discoveries OWNER TO postgres;

CREATE SEQUENCE discoveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discoveries_id_seq OWNER TO postgres;

ALTER SEQUENCE discoveries_id_seq OWNED BY discoveries.id;

CREATE TABLE scientific_awards (
    id integer NOT NULL,
    the_name_of_the_award character varying(80) NOT NULL,
    year integer NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT scientific_awards_year_check CHECK ((year >= 1000))
);


ALTER TABLE scientific_awards OWNER TO postgres;

CREATE SEQUENCE scientific_awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientific_awards_id_seq OWNER TO postgres;

ALTER SEQUENCE scientific_awards_id_seq OWNED BY scientific_awards.id;


CREATE TABLE scientific_spheres (
    id integer NOT NULL,
    scientific_sphere character varying(80) NOT NULL
);


ALTER TABLE scientific_spheres OWNER TO postgres;

CREATE SEQUENCE scientific_spheres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientific_spheres_id_seq OWNER TO postgres;

ALTER SEQUENCE scientific_spheres_id_seq OWNED BY scientific_spheres.id;

CREATE TABLE scientists (
    id integer NOT NULL,
    name_and_surname character varying(80) NOT NULL,
    date_of_birth date NOT NULL,
    date_of_death date NOT NULL,
    town_of_birth_id integer NOT NULL,
    alma_mater character varying(80) NOT NULL,
    CONSTRAINT scientists_date_of_birth_check CHECK (((date_of_birth <= date_of_death) AND (date_of_birth >= '1300-01-01'::date)))
);


ALTER TABLE scientists OWNER TO postgres;

CREATE TABLE scientists_discoveries_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_scientist_discovery integer NOT NULL
);


ALTER TABLE scientists_discoveries_relation OWNER TO postgres;

CREATE SEQUENCE scientists_discoveries_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_discoveries_relation_id_seq OWNER TO postgres;

ALTER SEQUENCE scientists_discoveries_relation_id_seq OWNED BY scientists_discoveries_relation.id;

CREATE SEQUENCE scientists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_id_seq OWNER TO postgres;

ALTER SEQUENCE scientists_id_seq OWNED BY scientists.id;

CREATE TABLE scientists_scientific_awards_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_scientific_award integer NOT NULL
);


ALTER TABLE scientists_scientific_awards_relation OWNER TO postgres;

CREATE SEQUENCE scientists_scientific_awards_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_scientific_awards_relation_id_seq OWNER TO postgres;

ALTER SEQUENCE scientists_scientific_awards_relation_id_seq OWNED BY scientists_scientific_awards_relation.id;

CREATE TABLE scientists_spheres_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_sphere_of_activity integer NOT NULL
);


ALTER TABLE scientists_spheres_relation OWNER TO postgres;

CREATE SEQUENCE scientists_spheres_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_spheres_relation_id_seq OWNER TO postgres;

ALTER SEQUENCE scientists_spheres_relation_id_seq OWNED BY scientists_spheres_relation.id;

CREATE TABLE towns (
    id integer NOT NULL,
    town character varying(80) NOT NULL,
    id_country integer NOT NULL
);


ALTER TABLE towns OWNER TO postgres;

CREATE SEQUENCE towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE towns_id_seq OWNER TO postgres;

ALTER SEQUENCE towns_id_seq OWNED BY towns.id;

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);

ALTER TABLE ONLY discoveries ALTER COLUMN id SET DEFAULT nextval('discoveries_id_seq'::regclass);

ALTER TABLE ONLY scientific_awards ALTER COLUMN id SET DEFAULT nextval('scientific_awards_id_seq'::regclass);

ALTER TABLE ONLY scientific_spheres ALTER COLUMN id SET DEFAULT nextval('scientific_spheres_id_seq'::regclass);

ALTER TABLE ONLY scientists ALTER COLUMN id SET DEFAULT nextval('scientists_id_seq'::regclass);

ALTER TABLE ONLY scientists_discoveries_relation ALTER COLUMN id SET DEFAULT nextval('scientists_discoveries_relation_id_seq'::regclass);

ALTER TABLE ONLY scientists_scientific_awards_relation ALTER COLUMN id SET DEFAULT nextval('scientists_scientific_awards_relation_id_seq'::regclass);

ALTER TABLE ONLY scientists_spheres_relation ALTER COLUMN id SET DEFAULT nextval('scientists_spheres_relation_id_seq'::regclass);

ALTER TABLE ONLY towns ALTER COLUMN id SET DEFAULT nextval('towns_id_seq'::regclass);

INSERT INTO countries VALUES (1, 'Russian_Empire');
INSERT INTO countries VALUES (2, 'Austrian_Empire');
INSERT INTO countries VALUES (3, 'Switzerland');
INSERT INTO countries VALUES (4, 'USA');
INSERT INTO countries VALUES (5, 'New_Zealand');
INSERT INTO countries VALUES (6, 'Germany');
INSERT INTO countries VALUES (7, 'Japan');
INSERT INTO countries VALUES (8, 'RSFSR');
INSERT INTO countries VALUES (9, 'Britain');
INSERT INTO countries VALUES (10, 'France');
INSERT INTO countries VALUES (11, 'Sweden');
INSERT INTO countries VALUES (12, 'Italy');
INSERT INTO countries VALUES (13, 'Israel');
INSERT INTO countries VALUES (14, 'USSR');

SELECT pg_catalog.setval('countries_id_seq', 14, true);

INSERT INTO discoveries VALUES (1, 'The Fundamental Formula of Euler', 1740, 'Complex numbers', 'Introduction to the analysis of the infinitely small');
INSERT INTO discoveries VALUES (2, 'The problem of rotation of a rigid body around a fixed point', 1889, 'Mechanics', 'Acta Mathematica');
INSERT INTO discoveries VALUES (3, 'Planetary model of the atom', 1911, 'Atomic structure', 'The Scattering of ? and ? Particles by Matter and the Structure of the Atom');
INSERT INTO discoveries VALUES (4, 'Tesla coil', 1896, '…lectrical engineering', 'No');
INSERT INTO discoveries VALUES (5, 'The periodic system of chemical elements ', 1869, 'The dependence of the properties of elements from their atomic mass ', 'The journal of Russian physico chemical society');
INSERT INTO discoveries VALUES (6, 'The development of a three part structural model of the psyche', 1921, 'Group psychology and the analysis human "I"', 'The International Psychoanalytic Publishing House');
INSERT INTO discoveries VALUES (7, 'The origin of species ', 1859, 'Natural selectio of organisms ', 'On the Origin of Species by Means of Natural Selection or the Preservation of Favoured Races in the Struggle for Life');
INSERT INTO discoveries VALUES (8, 'The creation of the theory of superfluidity of liquid helium', 1941, 'Theoretical physics', 'Theory of superfluidity of helium II');
INSERT INTO discoveries VALUES (9, 'The discovery of Radium ', 1898, 'Physics', 'Personal records');
INSERT INTO discoveries VALUES (10, 'The equivalence of mass and energy ', 1907, 'Special relativity', 'About the inertia of energy required by the relativity principle');
INSERT INTO discoveries VALUES (11, 'The discovery of Acyclovir ', 1974, 'Pharmacology ', 'No');
INSERT INTO discoveries VALUES (12, 'Becquerel Rays', 1896, 'Radioactivity', 'Meeting of the Academy');
INSERT INTO discoveries VALUES (13, 'Spontaneous symmetry breaking', 2008, 'Subatomic physics', 'Pontaneous symmetry_breaking_in_particle_physics:_an_example_of_the_fruitful_exchange_of_ideas');
INSERT INTO discoveries VALUES (14, 'One of the founders of laser', 1962, 'Quantum electronics', 'No');
INSERT INTO discoveries VALUES (15, 'The founder of the Soviet school of philosophy of mathematics', 1930, 'Mathematics', 'Idealism in contemporary philosophy of mathematics');
INSERT INTO discoveries VALUES (16, 'Radiochemistry ', 1910, 'Chemistry ultrarunning state', 'The reference in article');
INSERT INTO discoveries VALUES (17, 'A method of obtaining reliable current', 1891, 'Radiocommunication', 'Public lecture');
INSERT INTO discoveries VALUES (18, 'Interpretation of dreams', 1900, 'Psychoanalysis ', 'Monographic work');
INSERT INTO discoveries VALUES (19, 'Radioactive transformations', 1902, 'Nuclear physics', 'Philosophical Magazine');
INSERT INTO discoveries VALUES (20, 'Radioactivity', 1896, 'Physics', 'The meeting of the French Academy of Sciences');
INSERT INTO discoveries VALUES (21, 'Controlled balloon', 1875, 'Aeronautics', 'Russian technical society');
INSERT INTO discoveries VALUES (22, 'Quantum generator', 1954, 'Quantum electronics', 'The molecular oscillator and amplifier');
INSERT INTO discoveries VALUES (23, 'Quantum theory of diamagnetism of electrons', 1930, 'Physics', 'No');

SELECT pg_catalog.setval('discoveries_id_seq', 23, true);

INSERT INTO scientific_awards VALUES (1, 'Nobel Prize', 1901, 11);
INSERT INTO scientific_awards VALUES (2, 'Copley Medal', 1731, 9);
INSERT INTO scientific_awards VALUES (3, 'The Wolf Prize', 1978, 13);
INSERT INTO scientific_awards VALUES (4, 'Davy Medal', 1877, 9);
INSERT INTO scientific_awards VALUES (5, 'IEEE Edison Medal', 1909, 4);
INSERT INTO scientific_awards VALUES (6, 'National Medal of Science', 1962, 5);
INSERT INTO scientific_awards VALUES (7, 'Large Gold Medal named after M V Lomonosov ', 1959, 14);
INSERT INTO scientific_awards VALUES (8, 'Gold Medal of the Royal astronomical society', 1824, 9);
INSERT INTO scientific_awards VALUES (9, 'The Goethe Prize', 1927, 6);
INSERT INTO scientific_awards VALUES (10, 'Wollaston Medal', 1831, 9);
INSERT INTO scientific_awards VALUES (11, 'Medal Helmholtz', 1892, 6);
INSERT INTO scientific_awards VALUES (12, 'The John Scott Medal', 1822, 4);
INSERT INTO scientific_awards VALUES (13, 'Demidov Prize', 1832, 1);
INSERT INTO scientific_awards VALUES (14, 'Royal Medal', 1826, 9);
INSERT INTO scientific_awards VALUES (15, 'The Max Plank Medal', 1929, 6);
INSERT INTO scientific_awards VALUES (16, 'Medal of Matteucci', 1868, 12);
INSERT INTO scientific_awards VALUES (17, 'The Order of Lenin', 1930, 14);
INSERT INTO scientific_awards VALUES (18, 'Lemelson MIT Prize', 1995, 4);

SELECT pg_catalog.setval('scientific_awards_id_seq', 18, true);

INSERT INTO scientific_spheres VALUES (1, 'Psyhology');
INSERT INTO scientific_spheres VALUES (2, 'Chemistry');
INSERT INTO scientific_spheres VALUES (3, 'Biology');
INSERT INTO scientific_spheres VALUES (4, 'Mathematics');
INSERT INTO scientific_spheres VALUES (5, 'Physics');
INSERT INTO scientific_spheres VALUES (6, 'Physiology_and_medicine');
INSERT INTO scientific_spheres VALUES (7, 'Theoretical_physics');
INSERT INTO scientific_spheres VALUES (8, 'Radiophysics');
INSERT INTO scientific_spheres VALUES (9, 'Mechanics');

SELECT pg_catalog.setval('scientific_spheres_id_seq', 9, true);

INSERT INTO scientists VALUES (1, 'Leonard Euler', '1707-04-15', '1783-09-18', 4, 'University of Basel');
INSERT INTO scientists VALUES (2, 'Albert Einshtein', '1879-03-14', '1955-04-18', 3, 'Higher technical school of Zurich');
INSERT INTO scientists VALUES (3, 'Dmitri Mendeleev', '1834-01-20', '1907-01-20', 12, 'The main pedagogical Institute');
INSERT INTO scientists VALUES (4, 'Sigmund Freud', '1856-05-06', '1939-09-23', 11, 'University of Vienna');
INSERT INTO scientists VALUES (5, 'Charles Darwin', '1809-02-12', '1882-04-19', 6, 'Edinburgh University');
INSERT INTO scientists VALUES (6, 'Lev Landau', '1908-01-22', '1968-04-01', 13, 'Baku state University');
INSERT INTO scientists VALUES (7, 'Marie Curie', '1867-11-07', '1934-07-04', 2, 'Sorbonne');
INSERT INTO scientists VALUES (8, 'Gertrude Elion', '1918-01-23', '1999-02-21', 14, 'New Yourk University');
INSERT INTO scientists VALUES (9, 'Sofia Kovalevskaya', '1850-01-15', '1891-02-10', 1, 'Heidelberg University');
INSERT INTO scientists VALUES (10, 'Nikola Tesla', '1856-08-30', '1943-01-07', 8, 'Graz technical University');
INSERT INTO scientists VALUES (11, 'Ernest Rutherford', '1871-08-30', '1937-10-19', 5, 'University of Canterbury');
INSERT INTO scientists VALUES (12, 'Sofya Yanovskaya', '1896-01-31', '1966-10-24', 10, 'The Institute of red professors');
INSERT INTO scientists VALUES (13, 'Nikolay Basov', '1922-12-14', '2001-07-01', 15, 'Moscow engineering physics Institute');
INSERT INTO scientists VALUES (14, 'Antoine Becquerel', '1852-12-15', '1908-08-25', 7, 'National school of bridges and roads');
INSERT INTO scientists VALUES (15, 'Yoichiro Nambu', '1921-01-18', '2015-07-05', 9, 'Tokyo University');

INSERT INTO scientists_discoveries_relation VALUES (1, 1, 1);
INSERT INTO scientists_discoveries_relation VALUES (2, 2, 10);
INSERT INTO scientists_discoveries_relation VALUES (3, 3, 5);
INSERT INTO scientists_discoveries_relation VALUES (4, 3, 21);
INSERT INTO scientists_discoveries_relation VALUES (5, 4, 6);
INSERT INTO scientists_discoveries_relation VALUES (6, 4, 18);
INSERT INTO scientists_discoveries_relation VALUES (7, 5, 7);
INSERT INTO scientists_discoveries_relation VALUES (8, 6, 8);
INSERT INTO scientists_discoveries_relation VALUES (9, 6, 23);
INSERT INTO scientists_discoveries_relation VALUES (10, 7, 9);
INSERT INTO scientists_discoveries_relation VALUES (11, 7, 16);
INSERT INTO scientists_discoveries_relation VALUES (12, 8, 11);
INSERT INTO scientists_discoveries_relation VALUES (13, 9, 2);
INSERT INTO scientists_discoveries_relation VALUES (14, 10, 4);
INSERT INTO scientists_discoveries_relation VALUES (15, 10, 17);
INSERT INTO scientists_discoveries_relation VALUES (16, 11, 3);
INSERT INTO scientists_discoveries_relation VALUES (17, 11, 19);
INSERT INTO scientists_discoveries_relation VALUES (18, 12, 15);
INSERT INTO scientists_discoveries_relation VALUES (19, 13, 14);
INSERT INTO scientists_discoveries_relation VALUES (20, 13, 22);
INSERT INTO scientists_discoveries_relation VALUES (21, 14, 12);
INSERT INTO scientists_discoveries_relation VALUES (22, 14, 20);
INSERT INTO scientists_discoveries_relation VALUES (23, 15, 13);

SELECT pg_catalog.setval('scientists_discoveries_relation_id_seq', 23, true);

SELECT pg_catalog.setval('scientists_id_seq', 15, true);

INSERT INTO scientists_scientific_awards_relation VALUES (1, 2, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (2, 2, 8);
INSERT INTO scientists_scientific_awards_relation VALUES (3, 3, 13);
INSERT INTO scientists_scientific_awards_relation VALUES (4, 3, 4);
INSERT INTO scientists_scientific_awards_relation VALUES (5, 3, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (6, 4, 9);
INSERT INTO scientists_scientific_awards_relation VALUES (7, 5, 14);
INSERT INTO scientists_scientific_awards_relation VALUES (8, 5, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (9, 5, 10);
INSERT INTO scientists_scientific_awards_relation VALUES (10, 6, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (11, 6, 15);
INSERT INTO scientists_scientific_awards_relation VALUES (12, 7, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (13, 8, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (14, 8, 18);
INSERT INTO scientists_scientific_awards_relation VALUES (15, 10, 12);
INSERT INTO scientists_scientific_awards_relation VALUES (16, 10, 15);
INSERT INTO scientists_scientific_awards_relation VALUES (17, 11, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (18, 11, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (19, 11, 16);
INSERT INTO scientists_scientific_awards_relation VALUES (20, 12, 17);
INSERT INTO scientists_scientific_awards_relation VALUES (21, 13, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (22, 13, 7);
INSERT INTO scientists_scientific_awards_relation VALUES (23, 14, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (24, 14, 11);
INSERT INTO scientists_scientific_awards_relation VALUES (25, 15, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (26, 15, 3);
INSERT INTO scientists_scientific_awards_relation VALUES (27, 15, 6);

SELECT pg_catalog.setval('scientists_scientific_awards_relation_id_seq', 27, true);

INSERT INTO scientists_spheres_relation VALUES (1, 15, 5);
INSERT INTO scientists_spheres_relation VALUES (2, 14, 5);
INSERT INTO scientists_spheres_relation VALUES (3, 13, 8);
INSERT INTO scientists_spheres_relation VALUES (4, 12, 4);
INSERT INTO scientists_spheres_relation VALUES (5, 11, 5);
INSERT INTO scientists_spheres_relation VALUES (6, 10, 5);
INSERT INTO scientists_spheres_relation VALUES (7, 9, 9);
INSERT INTO scientists_spheres_relation VALUES (8, 8, 2);
INSERT INTO scientists_spheres_relation VALUES (9, 7, 5);
INSERT INTO scientists_spheres_relation VALUES (10, 6, 7);
INSERT INTO scientists_spheres_relation VALUES (11, 5, 3);
INSERT INTO scientists_spheres_relation VALUES (12, 4, 1);
INSERT INTO scientists_spheres_relation VALUES (13, 3, 2);
INSERT INTO scientists_spheres_relation VALUES (14, 2, 7);
INSERT INTO scientists_spheres_relation VALUES (15, 1, 4);

SELECT pg_catalog.setval('scientists_spheres_relation_id_seq', 15, true);

INSERT INTO towns VALUES (1, 'Moscow', 1);
INSERT INTO towns VALUES (2, 'Warsaw', 1);
INSERT INTO towns VALUES (3, 'Ulm', 6);
INSERT INTO towns VALUES (4, 'Basel', 3);
INSERT INTO towns VALUES (5, 'Spring Grove', 5);
INSERT INTO towns VALUES (6, 'Shrewsbury', 9);
INSERT INTO towns VALUES (7, 'MParis', 10);
INSERT INTO towns VALUES (8, 'Smiljan', 2);
INSERT INTO towns VALUES (9, 'Tokyo', 7);
INSERT INTO towns VALUES (10, 'Pruzhany', 1);
INSERT INTO towns VALUES (11, 'Frieberg', 2);
INSERT INTO towns VALUES (12, 'Tobolsk', 1);
INSERT INTO towns VALUES (13, 'Baku', 1);
INSERT INTO towns VALUES (14, 'New York', 4);
INSERT INTO towns VALUES (15, 'Usman', 8);

SELECT pg_catalog.setval('towns_id_seq', 15, true);

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);

ALTER TABLE ONLY discoveries
    ADD CONSTRAINT discoveries_discovery_key UNIQUE (discovery);

ALTER TABLE ONLY discoveries
    ADD CONSTRAINT discoveries_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_the_name_of_the_award_key UNIQUE (the_name_of_the_award);

ALTER TABLE ONLY scientific_spheres
    ADD CONSTRAINT scientific_spheres_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientific_spheres
    ADD CONSTRAINT scientific_spheres_scientific_sphere_key UNIQUE (scientific_sphere);

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_pkey PRIMARY KEY (id);

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_fk0 FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_fk1 FOREIGN KEY (id_scientist_discovery) REFERENCES discoveries(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists
    ADD CONSTRAINT scientists_fk0 FOREIGN KEY (town_of_birth_id) REFERENCES towns(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_fk1 FOREIGN KEY (id_scientific_award) REFERENCES scientific_awards(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_fk1 FOREIGN KEY (id_sphere_of_activity) REFERENCES scientific_spheres(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_fk0 FOREIGN KEY (id_country) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;
