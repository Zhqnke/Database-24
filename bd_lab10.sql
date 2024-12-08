CREATE DATABASE lab10;

-- Creating tables:
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data
INSERT INTO Books (book_id, title, author, price, quantity)
VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email)
VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');



-- Task 1: Transaction for placing an order
START TRANSACTION;
INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, '2024-12-08', 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;



-- Task 2: Transaction with Rollback
DO $$
BEGIN
    IF (SELECT quantity FROM books WHERE book_id = 3) >= 10 THEN
        INSERT INTO orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, '2024-12-08', 10);
    ELSE
        RAISE NOTICE 'Insufficient stock, rolling back';
        ROLLBACK;
    END IF;
END $$;



-- Task 3: Isolation level demonstration
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE BOOKS
SET price = 20.99
WHERE title = 'The Great Gatsby';

-- In the second session, try reading the updated price
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM BOOKS WHERE title = 'The Great Gatsby';
COMMIT;

-- Re-read the price after commit
SELECT price FROM BOOKS WHERE title = 'The Great Gatsby';

COMMIT;



-- Task 4: Durability check
BEGIN;

UPDATE customers
SET email = 'newemail@example.com'
WHERE customer_id = 102;
COMMIT;

-- Manually restart the database (outside SQL) and check:
SELECT email
FROM customers
WHERE customer_id = 102;
