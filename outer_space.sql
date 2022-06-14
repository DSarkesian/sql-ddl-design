CREATE DATABASE outer_space;
\c outer_space;


CREATE TABLE stars(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    temp_in_k INT
);


CREATE TABLE planets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    orbital_period_yrs FLOAT,
    star_id INT REFERENCES stars,

    UNIQUE(name,star_id)
);



CREATE TABLE moons(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL ,
    planet_id INT REFERENCES planets,

    UNIQUE(name, planet_id)
);
