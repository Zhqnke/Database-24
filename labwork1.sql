DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;

\c lab1;

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(60),
    second_name VARCHAR(60),
    email VARCHAR(60),
    date_joined DATE,
    status BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_name VARCHAR(60),
    client_id INT,
    CONSTRAINT fk_client
        FOREIGN KEY (client_id)
        REFERENCES clients(client_id) ON DELETE CASCADE
);
DROP TABLE IF EXISTS orders;

DROP DATABASE IF EXISTS lab1;




