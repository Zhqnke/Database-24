CREATE DATABASE lab7;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    surname VARCHAR(100) NOT NULL,
    department_id INT,
    salary FLOAT
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    budget FLOAT
);

INSERT INTO countries (name) VALUES
    ('Canada'),
    ('Germany'),
    ('Japan');

INSERT INTO departments (name, budget) VALUES
    ('Research and Development', 1500000),
    ('Human Resources', 300000),
    ('Customer Support', 450000);

INSERT INTO employees (name, surname, department_id, salary) VALUES
    ('Alice', 'Johnson', 1, 85000),
    ('Robert', 'Lee', 2, 48000),
    ('Sophia', 'Miller', 1, 92000),
    ('William', 'Garcia', 3, 67000),
    ('Linda', 'Martinez', 2, 52000);

-- 1
CREATE INDEX idx_countries_name ON countries (name);

-- 2
CREATE INDEX idx_employees_name_surname ON employees (name, surname);

-- 3
CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

-- 4
CREATE INDEX idx_employees_name_substring ON employees (substring(name FROM 1 FOR 4));

-- 5
CREATE INDEX idx_employees_department_id_salary ON employees (department_id, salary);
CREATE INDEX idx_departments_department_id ON departments (budget);
