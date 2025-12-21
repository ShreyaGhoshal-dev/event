--
-- PostgreSQL database cluster dump
--

\restrict RfgNHY2ges6LFD9NM2SPdkDbVlPwua8RDr5b1vetAoKQzCKN8hyw5FRfa7RnyME

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:9JpB2a/he7WA4TMAh4OJSQ==$nSmCD/Z0YXWGtljdt+83Z6TE+P0FXG8OQh83hv6cSQ0=:skZe7fSd55p6EMCustRVeJzLDYIEC4UiAQSl9iqKaL0=';
CREATE ROLE sqluser;
ALTER ROLE sqluser WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:aXbaCEg3Ac1j1uHZLlGHTg==$QYJHtw8HpDi+YLbjs+vlJXe/74laS/NrnWxK95067TY=:8uhL9vj1FMdRgdMu2J9VG+UqBE/9VbuXp4Nky9giAjU=';

--
-- User Configurations
--






\unrestrict RfgNHY2ges6LFD9NM2SPdkDbVlPwua8RDr5b1vetAoKQzCKN8hyw5FRfa7RnyME

--
-- PostgreSQL database cluster dump complete
--

