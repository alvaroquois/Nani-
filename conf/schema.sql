

-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-21 13:54:48.463

-- tables
-- Table: anime
CREATE TABLE anime (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL,
    category_id integer NOT NULL,
    genre_id integer NOT NULL,
    studio_id integer NOT NULL
);

-- Table: category
CREATE TABLE category (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Table: category_anime
CREATE TABLE category_anime (
    anime_id integer NOT NULL,
    category_id integer NOT NULL
);

-- Table: genre
CREATE TABLE genre (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Table: role
CREATE TABLE role (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Table: studio
CREATE TABLE studio (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL,
    country varchar(255) NOT NULL,
    city varchar(255) NOT NULL
);

-- Table: user
CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    username varchar(255) NOT NULL,
    passwd_hash varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    role_id integer NOT NULL
);


-- Table: anime_version
CREATE TABLE anime_version (
    id INTEGER PRIMARY KEY,
    version varchar(255) NOT NULL	
);

-- Table: version
CREATE TABLE version (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL, 
    language integer NOT NULL,
    duration integer NOT NULL,
    anime_id integer NOT NULL
);

-- End of file.

-- add 2 roles
INSERT INTO role (id,name) VALUES (1,'admin');
INSERT INTO role (id,name) VALUES (2,'user');

-- add 2 users
INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('max', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Maxime', 'Lottaz', 'jeffy@gmail.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('alva', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Alvaro', 'Moya', 'blablaaa@gmail.com',1);

-- category
INSERT INTO category (id, name) VALUES (1, 'Shonen');
INSERT INTO category (id, name) VALUES (2, 'Shonen');
INSERT INTO category (id, name) VALUES (3, 'Shonen');
INSERT INTO category (id, name) VALUES (4, 'Shonen');

-- genre
INSERT INTO genre (id, name) VALUES (1, 'Action');
INSERT INTO genre (id, name) VALUES (2, 'Action');
INSERT INTO genre (id, name) VALUES (3, 'Action');
INSERT INTO genre (id, name) VALUES (4, 'Action');

-- studio
INSERT INTO studio (id, name, country, city) VALUES (1, 'Studio Pierrot', 'Japan', 'Tokyo');
INSERT INTO studio (id, name, country, city) VALUES (2, 'Toei', 'Japan', 'Tokyo');
INSERT INTO studio (id, name, country, city) VALUES (3, 'Bones', 'Japan', 'Tokyo');
INSERT INTO studio (id, name, country, city) VALUES (4, 'A1 Pictures', 'Japan', 'Tokyo');

-- anime_category
-- TODO
--INSERT INTO category_anime (id, version) VALUES (1, 'film');
-- INSERT INTO category_anime (id, version) VALUES (2, 'serie');

-- add 10 animes
INSERT INTO anime (name, category_id, genre_id, studio_id) VALUES ('Naruto', 1, 1, 1);
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Naruto', Shonen, Action, Studio Pierrot, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Naruto Shippuden, Shonen, Action, Studio Pierrot, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('One Piece, Shonen, Action, Toei, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('JJBA, Shonen, Action, David Production, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
-- INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)





