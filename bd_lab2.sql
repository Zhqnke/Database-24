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

INSERT INTO countries (region_id, population)
VALUES (5, 34000000);
