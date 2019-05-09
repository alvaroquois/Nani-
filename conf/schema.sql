

-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-21 13:54:48.463

-- tables
-- Table: anime
CREATE TABLE anime (
    id integer NOT NULL CONSTRAINT anime_pk PRIMARY KEY,
    category_id integer NOT NULL,
    genre_id integer NOT NULL,
    studio_id integer NOT NULL,
    CONSTRAINT anime_genre FOREIGN KEY (genre_id)
    REFERENCES genre (id),
    CONSTRAINT anime_studio FOREIGN KEY (studio_id)
    REFERENCES studio (id)
);

-- Table: category
CREATE TABLE category (
    name varchar(255) NOT NULL,
    id integer NOT NULL CONSTRAINT category_pk PRIMARY KEY
);

-- Table: category_anime
CREATE TABLE category_anime (
    anime_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT category_anime_anime FOREIGN KEY (anime_id)
    REFERENCES anime (id),
    CONSTRAINT category_anime_category FOREIGN KEY (category_id)
    REFERENCES category (id)
);

-- Table: genre
CREATE TABLE genre (
    name varchar(255) NOT NULL,
    id integer NOT NULL CONSTRAINT genre_pk PRIMARY KEY
);

-- Table: role
CREATE TABLE role (
    id integer NOT NULL CONSTRAINT role_pk PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Table: studio
CREATE TABLE studio (
    name varchar(255) NOT NULL,
    id integer NOT NULL CONSTRAINT studio_pk PRIMARY KEY,
    zip_code varchar(255) NOT NULL,
    country varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    adresse varchar(255) NOT NULL
);

-- Table: user
CREATE TABLE user (
    username varchar(255) NOT NULL,
    passwd_hash varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    id integer NOT NULL CONSTRAINT user_pk PRIMARY KEY,
    role_id integer NOT NULL,
    CONSTRAINT role_user FOREIGN KEY (role_id)
    REFERENCES role (id)
);

-- Table: version
CREATE TABLE version (
    name varchar(255) NOT NULL CONSTRAINT version_pk PRIMARY KEY,
    language integer NOT NULL,
    duration integer NOT NULL,
    anime_id integer NOT NULL,
    CONSTRAINT version_anime FOREIGN KEY (anime_id)
    REFERENCES anime (id)
);

-- End of file.

-- add 2 roles
INSERT INTO role (id,name) VALUES (1,'admin');
INSERT INTO role (id,name) VALUES (2,'user');

-- add 2 users
INSERT INTO user (username, passwd_hash, first_name,last_name, email,role_id) VALUES ('max', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Maxime', 'Lottaz', 'jeffy@gmail.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name, email,role_id) VALUES ('alva', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Alvaro', 'Moya', 'blablaaa@gmail.com',1);

-- add 10 animes
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Naruto, Shonen, Action, Studio Pierrot, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Naruto Shippuden, Shonen, Action, Studio Pierrot, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('One Piece, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('JJBA, Shonen, Action, David Production, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)
INSERT INTO anime (anime_name, category_anime, genre, studio, version) VALUES ('Dragon Ball, Shonen, Action, Toei, serie)





