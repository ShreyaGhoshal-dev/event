--
-- PostgreSQL database dump
--

\restrict z33YmMtKFWPQk93ns8mXVJfErssjrGqX8BmjbqLQWVPkMkO7rJjTVvbNzca2N1Y

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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
-- Name: crime_scene; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crime_scene (
    id integer NOT NULL,
    date integer,
    type text,
    location text,
    description text
);


ALTER TABLE public.crime_scene OWNER TO postgres;

--
-- Name: interviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interviews (
    suspect_id integer,
    transcript text
);


ALTER TABLE public.interviews OWNER TO postgres;

--
-- Name: suspects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suspects (
    id integer NOT NULL,
    name text,
    bandana_color text,
    accessory text
);


ALTER TABLE public.suspects OWNER TO postgres;

--
-- Name: witnesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.witnesses (
    id integer NOT NULL,
    crime_scene_id integer,
    clue text
);


ALTER TABLE public.witnesses OWNER TO postgres;

--
-- Data for Name: crime_scene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crime_scene (id, date, type, location, description) FROM stdin;
1	20120909	theft	City Street	A guest was found dead in their hotel room. There were signs of a struggle and blood near the bed.
2	19920415	theft	Downtown Bank	A briefcase was stolen during a robbery. A man in a suit was seen leaving the premises with it.
3	20010702	murder	Corner Café	A body was found behind the café. No witnesses reported anything, but there was a knife wound in the back.
4	19980328	bribery	Metro Station	\N
5	20091113	theft	Park Avenue Office	A briefcase with classified documents was stolen. A witness mentioned a person in a blazer running away from the scene.
6	20050716	murder	Grand Hotel	A guest was found dead in their room with signs of foul play. The door was locked from the inside, and there was no sign of forced entry.
7	19960205	theft	City Library	A briefcase containing confidential papers went missing. The thief was caught on security camera, wearing a jacket.
8	20080422	bribery	Main Street Mall	\N
9	20110630	theft	Old Town Square	A man was seen fleeing with a briefcase. He had a scar on his right hand and was wearing a coat.
10	20031218	murder	Central Park	A woman’s body was discovered in the park with signs of strangulation. A witness saw a man wearing a baseball cap near the scene.
11	20120909	theft	City Museum	A briefcase containing valuable artifacts was taken. A man in a trench coat was seen leaving the scene.
12	20140512	theft	Airport Terminal	\N
13	19950521	murder	Museum of Modern Art	A prominent artist was found dead in his studio with multiple stab wounds. No suspect has been identified yet.
14	20060907	theft	Luxury Hotel	A briefcase was stolen from a guest. The thief was wearing a dark suit and had a scar on his right cheek.
15	19980211	theft	Subway Station	A briefcase went missing from the platform. A man in a leather jacket was seen with it.
16	20021225	bribery	Downtown Restaurant	\N
17	20160114	murder	University Library	A student was found dead near the library’s entrance. The cause of death was a gunshot wound to the head.
18	19910730	theft	Art Gallery	\N
19	20050710	murder	Beachside Hotel	A guest was found dead in their hotel room. There were signs of a struggle and blood near the bed.
20	19990416	theft	City Plaza	A briefcase went missing after an event. No clear suspect was identified, but a man in a gray coat was seen near the area.
21	20080312	theft	Luxury Mall	A briefcase with valuable goods was stolen. The thief was described as wearing a dark jacket and had a visible scar.
22	20100122	bribery	Highway Rest Stop	\N
23	20151203	murder	Coffee Shop	A barista was found dead behind the counter with a gunshot wound. The suspect was seen leaving in a red car.
24	20180418	bribery	City Hall	A corrupt city official was caught accepting a bribe. A videotape showed the transaction in a private office.
25	20120719	theft	Warehouse District	\N
26	19980903	murder	Luxury Condo	A body was discovered in a high-rise apartment. The victim had multiple gunshot wounds.
27	20060522	theft	Shopping Mall	A purse was stolen from a woman’s bag in the food court. A man in a red hoodie was seen near the area.
28	19941030	bribery	Corporate Office	A CEO was seen accepting illegal payments from a contractor. The contract was later canceled under suspicious circumstances.
29	20150914	theft	Train Station	\N
30	20070426	bribery	Golf Club	A bribery scandal involving several high-ranking officials at the country club. A video surfaced showing the exchange of money.
31	20010212	murder	Dark Alley	A man was found dead in a dark alley with a knife stuck in his chest. No suspects yet.
32	20180125	theft	Bank Vault	A bank vault was broken into overnight. Security cameras were tampered with, and the culprit remains unidentified.
33	19961118	murder	Luxury Yacht	\N
34	20030705	bribery	Subway Station	A bribe was offered to a transit officer in exchange for bypassing the fare. The officer reported the incident immediately.
35	19921221	theft	Fashion Boutique	A necklace worth thousands was stolen during a fashion show. A woman was seen leaving with it in her purse.
36	20081008	murder	City Park	A body was discovered in the park. The victim was hit by a car, and police are investigating whether it was intentional.
37	20150203	theft	Corporate Office	A laptop containing company secrets was stolen from a secured office. No signs of forced entry.
38	19950627	theft	Luxury Mall	A designer handbag was stolen from a display. A suspect in a suit was seen on the surveillance footage.
39	20030410	bribery	Construction Site	A contractor was bribed to overlook safety violations. The transaction was caught on camera.
40	20091206	theft	Parking Garage	A car was stolen from a parking garage. Security footage shows a person in a hoodie breaking into the vehicle.
41	20150722	murder	Street Corner	A young man was found dead near a busy street. Police are investigating the cause of death, possibly drug-related.
42	19980305	theft	Shopping Mall	A briefcase containing cash was stolen from a display. A suspect in a red jacket was seen near the scene.
43	20060119	bribery	Airport Lounge	A flight attendant was caught accepting a bribe to let passengers bypass security checks.
44	20171003	theft	Car Dealership	\N
45	20080409	murder	Night Club	A man was found dead in the club’s bathroom. Police are investigating whether it was a drug deal gone wrong.
46	20140822	bribery	Public Office	A city official was caught accepting bribes from contractors in exchange for government contracts.
47	20031014	murder	Back Alley	A woman was found dead with a broken neck. No witnesses were present, and no suspects have been identified.
48	20151209	theft	Restaurant	A woman’s purse was stolen while she was dining. A man in a black jacket was seen near the table.
49	19990217	bribery	Government Building	A politician was caught receiving bribes from a lobbyist. The deal was overheard by a security guard.
50	20100115	theft	Jewelry Store	A diamond ring was stolen from a high-end jewelry store. The thief was wearing a black coat and gloves.
51	20090222	bribery	Courtroom	\N
52	20061214	murder	Luxury Hotel	A businessman was found dead in his hotel room. Police suspect foul play, but no suspects have been named yet.
53	19980718	theft	Art Gallery	A valuable painting was stolen during an exhibition. A woman in a red dress was seen leaving the gallery.
54	20080304	bribery	Construction Site	\N
55	19971005	murder	City Hospital	A nurse was found dead in a hospital storage room. The police are looking into hospital staff for possible involvement.
56	20011117	bribery	Financial District	A stockbroker was caught bribing clients to inflate their investments.
57	20070315	theft	Corporate Office	A company laptop with sensitive information was stolen. A man in a suit was seen leaving the office with it.
58	20130321	murder	City Street	\N
59	20141011	theft	Airport Terminal	A passenger’s suitcase was swapped with another at the terminal. The suspect was wearing a red shirt.
60	20100518	bribery	Public Office	An official was caught accepting bribes to approve a construction project without proper inspection.
61	19941122	murder	City Bar	A man was found dead after an altercation in a local bar. The suspect fled the scene.
62	20050329	theft	Luxury Mall	A woman’s handbag was stolen from a high-end store. A man in a gray jacket was seen walking away with it.
63	20170704	murder	Restaurant	A chef was found dead in the kitchen. No obvious injuries, but foul play is suspected.
64	20020301	bribery	Construction Site	A contractor was bribed to overlook safety violations on a new building project.
65	19830715	theft	West Hollywood Records	A prized vinyl record was stolen from the store during a busy evening.
66	20121118	theft	Casino	A man was seen taking chips from an unguarded table. The suspect was wearing a black hoodie.
67	19990514	murder	City Park	A body was discovered near the park bench. The cause of death was a gunshot wound.
68	20190906	bribery	University	A professor was caught accepting bribes from students in exchange for better grades.
69	20071220	theft	Train Station	A man stole a suitcase from a passenger at the train station. The suspect was wearing a jacket and hat.
70	19990410	murder	Street Corner	\N
71	20080111	theft	Restaurant	A purse was stolen while the victim was eating dinner. The suspect was seen walking away briskly.
72	20180228	bribery	Municipal Office	A city official was seen accepting cash from a local contractor to fast-track his projects.
73	20030504	theft	Library	A rare book was stolen from the library. The suspect was seen entering and exiting the restricted area.
74	20160622	murder	Downtown Alley	A woman was found dead in an alley with signs of blunt force trauma to her head.
75	19930310	theft	Parking Lot	\N
76	19851120	theft	Blue Note Lounge	A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.
77	20151019	murder	Office Building	A manager was found dead in his office. Police suspect a workplace dispute may have led to the murder.
78	20110225	theft	Art Auction	A painting was stolen during an auction. The thief was seen fleeing the scene.
79	19980507	bribery	Medical Center	\N
80	20091229	theft	Airport Security	A bag containing valuable items was stolen during security checks.
81	19941021	murder	Rooftop Bar	A man was found dead after an argument with another patron. No weapons were found at the scene.
82	20081116	theft	Corporate Office	A laptop with confidential information was stolen. No signs of forced entry, but a suspect in a suit was seen.
83	20030613	bribery	Hospital	A doctor was caught accepting money to provide fake medical reports for insurance claims.
84	20150607	murder	Woods	A body was discovered in the woods with a bullet wound to the chest. The police are still looking for suspects.
85	20081005	theft	Shopping Mall	A wallet was stolen from a shopper. The thief was caught on camera wearing a baseball cap.
86	20131011	bribery	City Council	A councilman was caught accepting bribes to approve zoning laws.
87	20180503	theft	Luxury Store	A man was seen taking a bracelet without paying for it.
88	19921214	murder	Train Station	A body was found near the tracks. Investigators believe it may have been an accident or foul play.
89	20070911	bribery	Corporate Office	\N
90	20140206	theft	Tech Conference	A laptop was stolen during the conference. A man in a black hoodie was seen leaving the area.
91	20100817	theft	Bookstore	A rare edition book was stolen from a bookstore display.
92	19970103	bribery	Police Station	A police officer was caught accepting bribes from local criminals to overlook their activities.
93	20091129	murder	House	A body was found in a house with signs of strangulation.
94	19960521	theft	Gallery	A painting was stolen during an exhibition.
95	20131028	bribery	Post Office	A postal worker was caught accepting money to tamper with mail.
96	20080303	murder	Lakeside	\N
97	20030512	theft	Gas Station	A cashier was robbed at gunpoint. The thief took the cash from the register.
98	20150717	bribery	School	A teacher was caught accepting bribes from parents to give their children better grades.
99	20090611	theft	Construction Site	A truck full of equipment was stolen from a construction site.
100	20180320	murder	Club	A man was killed during a fight inside a club. The suspect was seen leaving the scene.
\.


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interviews (suspect_id, transcript) FROM stdin;
1	\N
2	I was at home the whole day, no idea what happened.
3	\N
4	I have no recollection of that event.
5	I was at work, couldn’t have been involved.
6	\N
7	I was with friends at a restaurant.
8	I don’t know anything about the incident.
9	\N
10	I didn’t even know anything was going on.
11	\N
12	I didn’t see anything suspicious at all.
13	\N
14	I was traveling out of town.
15	\N
16	I was with family the entire evening.
17	I was sleeping at that time.
18	\N
19	I have no idea about the situation.
20	\N
21	I heard nothing, I was watching a movie.
22	I was stuck in traffic, didn’t see anything.
23	\N
24	I have no clue about that event.
25	\N
26	I wasn’t even in the area, sorry.
27	I have no connection with the incident.
28	\N
29	I wasn’t near the place at all.
30	\N
31	I wasn’t part of any of that.
32	\N
33	I had no part in anything going on.
34	\N
35	I wasn't anywhere near West Hollywood Records that night.
36	I was out with friends, didn’t even hear about it.
37	\N
38	I’m not sure what happened, but I wasn’t near.
39	\N
40	I have no idea about the situation.
41	\N
42	I wasn’t anywhere near that area.
43	I don’t know anything about it, sorry.
44	I was busy with my music career; I have nothing to do with this theft.
45	I was busy at work, no time for anything else.
46	\N
47	I had nothing to do with it, I’m innocent.
48	\N
49	I didn’t even know it was happening.
50	I was with a friend the whole time.
51	\N
52	I wasn’t there, and I don’t know anything.
53	\N
54	I’m not involved in any way.
55	\N
56	I didn’t hear anything, I was busy.
57	\N
58	I didn’t see anything strange.
59	\N
60	I don’t know anything about what happened.
61	\N
62	I was out of town that day, no idea.
63	\N
64	I didn’t see anything unusual happening.
65	\N
66	I wasn’t involved, I have an alibi.
67	I wasn’t part of it, I swear.
68	\N
69	I didn’t even know there was something going on.
70	I have nothing to do with this.
71	\N
72	I was at the store, nothing to do with it.
73	I wasn’t in the area, I have proof.
74	\N
75	I don’t know anything, I swear.
76	\N
77	I was nowhere near there.
78	I was at home, minding my business.
79	\N
80	I wasn’t part of any of this.
81	I didn’t hear anything that night.
82	\N
83	I don’t know, I wasn’t there.
84	\N
85	I had no idea what was happening.
86	\N
87	I didn’t see anything strange at all.
88	\N
89	I don’t know anything about it.
90	I was with my friends, no involvement.
91	\N
92	I was at home, nothing happened around me.
93	\N
94	I don’t even know what happened.
95	I was elsewhere, couldn’t be me.
96	\N
97	I couldn't help it. I snapped and took the record.
98	\N
99	I don’t even know about the crime.
100	I wasn’t near the place, no idea.
101	\N
102	I wasn’t there, I can prove it.
103	I have nothing to say about it.
104	\N
105	I didn’t hear anything or see anything.
106	\N
107	I’m innocent, I didn’t do anything.
108	\N
109	I wasn’t in town during the incident.
110	\N
111	I don’t know who’s behind this.
112	I wasn’t anywhere near there, I swear.
113	\N
114	I didn’t even know about the crime.
115	\N
116	I was busy with work, didn’t notice anything.
117	I didn’t see anything, I was out of town.
118	\N
119	I’m not involved at all, I promise.
120	I don’t know anything about the theft.
121	\N
122	I wasn’t there at all, couldn’t have done anything.
123	I had no part in this, I swear.
124	\N
125	I don’t even know who you are talking about.
126	I wasn’t involved, I didn’t even hear about it.
127	\N
128	I wasn’t near that place, no connection at all.
129	I wasn’t involved, trust me.
130	\N
131	I was with a friend all night.
132	\N
133	I wasn’t in town that evening, no way.
134	\N
135	I didn’t even know about the incident.
136	\N
137	I wasn’t near the area at all.
138	I was at the gym, can’t be me.
139	\N
140	I didn’t see anything that night.
141	I don’t know anything, sorry.
142	\N
143	I didn’t hear or see anything, I was in bed.
144	I wasn’t there, I’m innocent.
145	\N
146	I wasn’t even close to the crime scene.
147	\N
148	I was with family, didn’t see anything.
149	\N
150	I wasn’t involved, I swear on my life.
151	\N
152	I don’t know anything, I wasn’t there.
153	I have no connection to the incident.
154	\N
155	I wasn’t part of this, I have an alibi.
156	I don’t know anything about the crime.
157	\N
158	I didn’t see anything, I was busy at work.
159	I don’t know anything about the theft.
160	\N
161	I wasn’t near the crime scene, I swear.
162	\N
163	I don’t even know about it, sorry.
164	\N
165	I wasn’t there, I promise.
166	\N
167	I wasn’t involved in any way, I swear.
168	I didn’t see anything suspicious.
169	\N
170	I don’t know what you are talking about.
171	\N
172	I didn’t even hear about the crime.
173	I wasn’t near the scene.
174	\N
175	I have no involvement in this.
176	I didn’t hear anything, I was asleep.
177	\N
178	I wasn’t involved at all, I swear.
179	I was working that day, can’t be me.
180	\N
181	I wasn’t near the place, I didn’t see anything.
182	\N
183	I wasn’t going to steal it, but I did.
184	I have no clue what happened.
185	\N
186	I was at home that day, I didn’t know.
187	I wasn’t part of it, I swear.
188	\N
189	I don’t know anything about it, I wasn’t there.
190	I wasn’t involved in any of this.
191	\N
192	I didn’t see anything, I swear.
193	I wasn’t around there, I was busy at work.
194	\N
195	I didn’t even know about the crime.
196	\N
197	I have no idea who did this.
198	\N
199	I wasn’t involved, I was at the park.
200	I didn’t see anything suspicious, sorry.
\.


--
-- Data for Name: suspects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suspects (id, name, bandana_color, accessory) FROM stdin;
1	Carlos Mendoza	green	silver chain
2	Javier Silva	purple	gold necklace
3	Luis Garcia	yellow	black gloves
4	Miguel Torres	blue	leather jacket
5	David Morales	black	watch
6	Juan Sanchez	red	sunglasses
7	Oscar Lopez	pink	gold ring
8	Eddie Castillo	brown	bracelet
9	Victor Alvarez	gray	silver earring
10	Raul Garcia	white	keychain
11	Francisco Ruiz	orange	silver pendant
12	Manuel Herrera	blue	leather belt
13	Ricardo Gonzalez	black	gold watch
14	Daniel Perez	green	scarf
15	Antonio Cruz	yellow	red gloves
16	Julio Soto	purple	beaded necklace
17	Santiago Vargas	gray	sunglasses
18	Diego Mendoza	red	ring
19	Fernando Ruiz	green	gold cufflinks
20	Oscar Ramirez	brown	silver bracelet
21	Carlos Torres	blue	leather wallet
22	Adrian Gonzalez	pink	silver necklace
23	Sebastian Silva	orange	black cap
24	Luis Martinez	red	silver earrings
25	Jorge Herrera	black	chain bracelet
26	Pedro Ruiz	yellow	pocket watch
27	Carlos Castillo	purple	gold ring
28	Javier Soto	gray	leather jacket
29	Manuel Alvarez	blue	beaded bracelet
30	Antonio Perez	green	gold necklace
31	Julian Sanchez	red	leather gloves
32	David Castillo	pink	silver chain
33	Victor Soto	black	bracelet
34	Francisco Gonzalez	brown	gold watch
35	Tony Ramirez	red	gold watch
36	Diego Soto	yellow	gold ring
37	Oscar Alvarez	green	chain necklace
38	Raul Vega	purple	black wallet
39	Javier Morales	red	leather band
40	Manuel Soto	gray	silver earrings
41	Fernando Mendoza	black	gold bracelet
42	Sebastian Lopez	yellow	watch
43	Carlos Ramirez	blue	silver pendant
44	Mickey Rivera	red	gold watch
45	Pedro Vega	pink	gold chain
46	Luis Lopez	red	black gloves
47	Jorge Soto	brown	silver belt buckle
48	David Morales	blue	leather necklace
49	Carlos Vega	purple	gold earring
50	Julian Cruz	red	bracelet
51	Santiago Vega	green	gold watch
52	Ricardo Herrera	gray	beaded necklace
53	Antonio Cruz	blue	black hat
54	Diego Vega	yellow	silver bracelet
55	Manuel Lopez	green	gold necklace
56	Francisco Vega	brown	silver pendant
57	Carlos Soto	red	gold chain
58	Oscar Perez	purple	watch
59	Luis Herrera	blue	silver necklace
60	David Cruz	yellow	gold watch
61	Raul Cruz	black	silver bracelet
62	Carlos Soto	green	chain necklace
63	Julio Perez	pink	gold cufflinks
64	Victor Vega	red	gold bracelet
65	Pedro Soto	brown	silver earrings
66	Javier Herrera	yellow	gold chain
67	David Soto	green	silver belt buckle
68	Ricardo Cruz	blue	gold necklace
69	Fernando Vega	red	bracelet
70	Manuel Vega	gray	black gloves
71	Oscar Cruz	green	gold earring
72	Julian Lopez	yellow	gold bracelet
73	Luis Soto	blue	chain necklace
74	Victor Herrera	red	bracelet
75	Jorge Vega	green	gold ring
76	Carlos Cruz	brown	silver pendant
77	Santiago Cruz	gray	gold cufflinks
78	Manuel Soto	yellow	silver necklace
79	David Lopez	blue	bracelet
80	Fernando Vega	green	silver belt buckle
81	Ricardo Soto	brown	black gloves
82	Pedro Cruz	red	silver pendant
83	Oscar Soto	green	gold necklace
84	Carlos Vega	purple	beaded bracelet
85	Luis Cruz	yellow	watch
86	Victor Lopez	blue	gold chain
87	Julian Vega	gray	silver bracelet
88	David Cruz	green	gold ring
89	Raul Soto	red	silver earring
90	Manuel Perez	blue	gold pendant
91	Santiago Soto	green	bracelet
92	Ricardo Vega	yellow	gold earrings
93	Oscar Cruz	blue	silver chain
94	David Vega	red	gold belt buckle
95	Carlos Herrera	green	silver chain
96	Luis Vega	gray	black jacket
97	Rico Delgado	red	gold watch
98	Victor Soto	yellow	silver watch
99	Fernando Perez	blue	bracelet
100	Manuel Cruz	green	gold necklace
\.


--
-- Data for Name: witnesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.witnesses (id, crime_scene_id, clue) FROM stdin;
1	66	There was a loud crash, and then I saw a person in a leather jacket running away.
2	78	I saw a woman wearing a red scarf walking near the scene.
3	44	\N
4	75	I saw a person in a blue jacket standing near the crime scene.
5	89	There was a black car parked nearby, I think it had tinted windows.
6	35	The suspect had a scar on his left cheek and was wearing a black cap.
7	55	\N
8	12	I remember hearing footsteps behind me, but I didn’t turn around.
9	44	\N
10	78	I saw a man running away with a briefcase, looking very suspicious.
11	102	I noticed a woman in a green dress walking away from the scene.
12	67	There was a red sports car parked by the alley when I passed by.
13	94	\N
14	33	The suspect was wearing a leather jacket and carrying a bag.
15	53	I heard a loud bang before I saw a man walking quickly away from the building.
16	81	\N
17	25	A person with a yellow bandana was seen leaving the area.
18	99	I saw a black van parked outside the building around the time of the crime.
19	56	\N
20	14	The thief was holding a shiny object as he ran down the street.
21	88	I remember a woman in a red dress walking toward the building just before the crime occurred.
22	101	\N
23	63	A suspicious man in a trench coat was lurking near the crime scene.
24	42	I noticed a person wearing a black hoodie entering the building just before the crime took place.
25	92	\N
26	27	I saw someone walking away from the scene with a duffel bag.
27	48	The suspect had a silver ring on his finger and was talking to someone on the phone.
28	65	I saw a man wearing a red bandana rushing out of the store.
29	39	\N
30	59	I saw a man with a blue bandana and sunglasses in the area.
31	83	\N
32	28	A suspicious man in a gray hoodie was seen leaving the premises quickly.
33	77	I remember seeing a person with a briefcase running toward the exit.
34	49	\N
35	19	I saw a person with a distinctive tattoo on his neck near the scene.
36	18	The suspect had a black backpack and was walking very fast.
37	24	\N
38	9	I saw a man with a gold chain on his neck near the scene of the crime.
39	74	There was a woman in a black dress near the scene when it happened.
40	95	\N
41	40	I heard someone shout and then saw a person in a white coat running away.
42	31	\N
43	61	A person with a red hat was seen walking quickly away from the building.
44	76	\N
45	51	I noticed a person in a leather jacket walking towards the alley.
46	86	I saw a person in a blue cap walking by just after the incident.
47	62	\N
48	41	A person with a black duffel bag ran past me just after the crime happened.
49	13	\N
50	57	I saw a person wearing a dark trench coat entering the building.
51	50	\N
52	80	There was a silver car parked near the crime scene when it happened.
53	98	I noticed a person with a blue scarf walking down the street quickly.
54	4	\N
55	46	I saw a woman in a red dress running down the stairs just after the incident.
56	93	I saw a man with a scar on his face standing near the building.
57	70	A person wearing a brown leather jacket was seen near the scene of the crime.
58	103	\N
59	71	I noticed a black sedan parked near the entrance of the building.
60	2	\N
61	100	I saw a man wearing a gray hat standing nearby when the crime occurred.
62	32	A person with a red backpack was near the scene just before the crime.
63	60	\N
64	69	I saw a person in a black coat walking out of the building with a duffel bag.
65	55	\N
66	20	I noticed a man in a yellow jacket walking away from the crime scene.
67	64	A man with a black cap was seen standing near the scene of the crime.
68	21	\N
69	45	I saw a person in a gray jacket running from the crime scene.
70	82	A woman in a white dress was seen near the scene when the crime occurred.
71	73	\N
72	30	I remember seeing a man in a black hoodie walking away from the building.
73	58	A person with a black jacket was standing near the door just before the crime.
74	15	\N
75	65	The main thing I remember is that he had a distinctive gold watch on his wrist.
76	17	A man in a blue jacket was running away with a bag after the crime occurred.
77	60	\N
78	79	I noticed a person in a green hat standing outside the building.
79	38	\N
80	22	I saw a person with a silver necklace walking down the street quickly.
81	68	A woman in a purple dress was near the scene during the incident.
82	26	\N
83	7	I saw a person with a black jacket and a hat near the crime scene.
84	47	I remember seeing a person in a white coat walking quickly away from the building.
85	23	\N
86	3	I saw a person with a red scarf walking near the scene of the crime.
87	36	I noticed a man wearing a gray hoodie and a black backpack near the crime scene.
88	68	\N
89	29	I saw a woman in a yellow dress walking out of the building.
90	12	I saw a man with a distinctive tattoo on his neck leaving the scene.
91	10	\N
92	5	I noticed a person in a white jacket near the crime scene just before it happened.
93	43	A man in a black trench coat was seen near the alley during the crime.
94	34	\N
95	11	I saw a man in a red cap standing near the scene when the crime occurred.
96	27	I noticed a person in a dark suit near the crime scene.
97	42	\N
98	18	I saw a person with a black jacket standing near the building when the crime happened.
99	74	A person in a green coat was seen leaving the area shortly after the crime.
100	84	\N
\.


--
-- Name: crime_scene crime_scene_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crime_scene
    ADD CONSTRAINT crime_scene_pkey PRIMARY KEY (id);


--
-- Name: suspects suspects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suspects
    ADD CONSTRAINT suspects_pkey PRIMARY KEY (id);


--
-- Name: witnesses witnesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.witnesses
    ADD CONSTRAINT witnesses_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO sqluser;


--
-- Name: TABLE crime_scene; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.crime_scene TO sqluser;


--
-- Name: TABLE interviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.interviews TO sqluser;


--
-- Name: TABLE suspects; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.suspects TO sqluser;


--
-- Name: TABLE witnesses; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.witnesses TO sqluser;


--
-- PostgreSQL database dump complete
--

\unrestrict z33YmMtKFWPQk93ns8mXVJfErssjrGqX8BmjbqLQWVPkMkO7rJjTVvbNzca2N1Y

