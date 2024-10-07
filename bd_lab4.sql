-- 1
CREATE DATABASE lab4;

-- 2
CREATE TABLE Warehouses (
    code INT,
    location VARCHAR(255),
    capacity INT );

CREATE TABLE Boxes (
    code CHAR(6),
    contents VARCHAR(255),
    value REAL,
    warehouse INT );

INSERT INTO Warehouses (code, location, capacity) VALUES
(1, 'Chicago', 3),
(2, 'New York', 7),
(3, 'Los Angeles', 2),
(4, 'San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('QWNT', 'Rocks', 180, 1),
('4H8P', 'Scissors', 190, 2),
('K9NH', 'Papers', 75, 3),
('B6UT', 'Rocks', 200, 4),
('9MNF', 'Papers', 50, 2),
('B6MF', 'Rocks', 140, 4),
('7H9L', 'Scissors', 120, 5),
('P276', 'Papers', 80, 1),
('TU15', 'Papers', 90, 5);

-- 3
SELECT * FROM Warehouses;
SELECT * FROM Boxes;

-- 4
SELECT * FROM Warehouses;

-- 5
SELECT * FROM Boxes WHERE value > 150;

-- 6
SELECT DISTINCT contents FROM Boxes;

-- 7
SELECT warehouse, COUNT(*) AS number_of_boxes
FROM Boxes
GROUP BY warehouse;

-- 8
SELECT warehouse, COUNT(*) AS number_of_boxes
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

-- 9
INSERT INTO Warehouses (code, location, capacity)
VALUES (6, 'New York', 3);

-- 10
INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

-- 11
UPDATE Boxes
SET value = value * 0.85
WHERE code = (SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

-- 12
DELETE FROM Boxes
WHERE value < 150;

-- 13
DELETE FROM Boxes
WHERE warehouse = 2
RETURNING *;
