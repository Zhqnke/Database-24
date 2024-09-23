CREATE DATABASE lab1;
USE lab1;
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    PRIMARY KEY (id)
);

ALTER TABLE users ADD COLUMN isadmin INT;

ALTER TABLE users MODIFY COLUMN isadmin BOOLEAN;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

CREATE TABLE tasks (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    user_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE tasks;

DROP DATABASE lab1;
