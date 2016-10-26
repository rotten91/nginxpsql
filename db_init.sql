--
-- Roles
--

CREATE USER testuser
  WITH PASSWORD 'md599e5ea7a6f7c3269995cba3927fd0093';

--
-- Database creation
--

CREATE DATABASE testdb
  WITH OWNER testuser;

--
-- Access rights
--

REVOKE ALL ON DATABASE testdb FROM PUBLIC;
GRANT ALL ON DATABASE testdb TO testuser;

\connect testdb

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO testuser;

--  Tables creation
--

CREATE TABLE ip(
  id SERIAL PRIMARY KEY,
  ip VARCHAR(16) NOT NULL,
  created VARCHAR(100),
  is_on_blacklist boolean,
  rdns VARCHAR
);


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO testuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO testuser;
