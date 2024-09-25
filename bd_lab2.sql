CREATE DATABASE lab2;
USE lab2;
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Kazakhstan', 1, 18000000);

INSERT INTO countries (country_id, country_name)
VALUES (2, 'USA');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Russia', NULL, 144000000);

INSERT INTO countries (country_name, region_id, population)
VALUES ('China', 3, 1390000000),
       ('India', 2, 1360000000),
       ('Brazil', 4, 211000000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name, region_id, population)
VALUES (DEFAULT, DEFAULT, DEFAULT); 

CREATE TABLE countries_new LIKE countries;

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, 
       population * 1.10 AS "New Population"
FROM countries;

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries);

DELETE FROM countries;
