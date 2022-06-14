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


INSERT INTO stars 
    (name, temp_in_k)
VALUES 
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);


INSERT INTO planets
    (name, orbital_period_yrs, star_id)
VALUES
    ('Earth', 1.00, 1),
    ('Mars', 1.882, 1),
    ('Venus', 0.62, 1),
    ('Proxima Centauri b', 0.03, 2),
    ('Gliese 876 b', 0.236, 3);


INSERT INTO moons
    (name, planet_id)
VALUES
    ('The Moon', 1),
    ('Phobos', 2),
    ('Deimos', 2);

SELECT p.name, s.name, count(m.id) as moon_count
FROM planets p 
    LEFT JOIN stars s ON p.star_id = s.id
    LEFT JOIN moons m  ON m.planet_id = p.id
    GROUP BY p.id, s.id;
