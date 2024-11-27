CREATE DATABASE lab9;

-- Table for Task 4 and Task 6b
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    salary NUMERIC(10, 2)
);

-- Table for Task 5
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10, 2),
    category TEXT
);

-- Task 1: Increase value by 10
CREATE OR REPLACE FUNCTION increase_value(num INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN num + 10;
END;
$$ LANGUAGE plpgsql;

SELECT increase_value(20);  -- Output: 30



-- Task 2: Compare two numbers
CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT compare_numbers(10, 5);  -- Output: 'Greater'
SELECT compare_numbers(10, 10); -- Output: 'Equal'
SELECT compare_numbers(5, 10);  -- Output: 'Lesser'



-- Task 3: Generate series from 1 to n
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TEXT AS $$
DECLARE
    series TEXT := '';
    i INTEGER := 1;
BEGIN
    WHILE i <= n LOOP
        series := series || i || CASE WHEN i < n THEN ', ' ELSE '' END;
        i := i + 1;
    END LOOP;
    RETURN series;
END;
$$ LANGUAGE plpgsql;

SELECT number_series(5); -- Output: '1, 2, 3, 4, 5'



-- Task 4: Find employee details by name
CREATE OR REPLACE FUNCTION find_employee(employee_name TEXT)
RETURNS TABLE(id INTEGER, name TEXT, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, salary FROM employees WHERE name = employee_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM find_employee('Zhanerke');



-- Task 5: List products by category
CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(id INTEGER, name TEXT, price NUMERIC, category TEXT) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price, category FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM list_products('Electronics');



-- Task 6a: Calculate bonus
CREATE OR REPLACE FUNCTION calculate_bonus(base_salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN base_salary * 0.1;
END;
$$ LANGUAGE plpgsql;

SELECT calculate_bonus(50000); -- Output: 5000.00



-- Task 6b: Update salary using calculate_bonus
CREATE OR REPLACE FUNCTION update_salary(emp_id INTEGER, base_salary NUMERIC)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(base_salary);
    UPDATE employees SET salary = base_salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;

CALL update_salary(1, 50000);
-- The salary of employee with ID 1 will be updated to 55000 (if bonus is 5000).



-- Task 7: Complex calculation
CREATE OR REPLACE FUNCTION complex_calculation(num INTEGER, text_param TEXT)
RETURNS TEXT AS $$
DECLARE
    numeric_result INTEGER;
    string_result TEXT;
BEGIN
    -- Subblock 1: Numeric computation
    numeric_result := num * 2;

    -- Subblock 2: String manipulation
    string_result := 'Hello, ' || text_param || '!';

    -- Combine results
    RETURN string_result || ' Your number doubled is ' || numeric_result || '.';
END;
$$ LANGUAGE plpgsql;

SELECT complex_calculation(10, 'Zhanerke');
-- Output: 'Hello, Zhanerke! Your number doubled is 20.'

