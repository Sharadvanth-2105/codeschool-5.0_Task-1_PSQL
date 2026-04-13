-- Active: 1775629722491@@127.0.0.1@5432@crm@public
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    industry VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    companies (name, industry)
VALUES ('TechNova', 'IT'),
    ('FinEdge', 'Finance'),
    ('HealthPlus', 'Healthcare'),
    ('EduCore', 'Education'),
    ('RetailHub', 'Retail'),
    ('AutoDrive', 'Automobile'),
    ('Foodies', 'Hospitality'),
    ('BuildCorp', 'Construction'),
    ('GreenEnergy', 'Energy'),
    ('MediaWorks', 'Media'),
    ('SoftSolutions', 'IT'),
    ('BankTrust', 'Finance'),
    ('MediCare', 'Healthcare'),
    ('LearnSphere', 'Education'),
    ('ShopEase', 'Retail'),
    ('SpeedMotors', 'Automobile'),
    ('TasteBuds', 'Hospitality'),
    ('InfraBuild', 'Construction'),
    ('EcoPower', 'Energy'),
    ('CreativeMedia', 'Media');

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies (id),
    name VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    departments (company_id, name)
VALUES (1, 'Engineering'),
    (1, 'HR'),
    (2, 'Finance'),
    (2, 'Risk'),
    (3, 'Medical'),
    (3, 'Admin'),
    (4, 'Teaching'),
    (4, 'Support'),
    (5, 'Sales'),
    (5, 'Inventory'),
    (6, 'Production'),
    (6, 'QA'),
    (7, 'Kitchen'),
    (7, 'Service'),
    (8, 'Planning'),
    (8, 'Execution'),
    (9, 'Operations'),
    (9, 'Maintenance'),
    (10, 'Content'),
    (10, 'Marketing');

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies (id),
    department_id INT REFERENCES departments (id),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    hire_date DATE,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    employees (
        company_id,
        department_id,
        first_name,
        last_name,
        email,
        hire_date
    )
VALUES (
        1,
        1,
        'Amit',
        'Sharma',
        'amit1@gmail.com',
        '2024-01-10'
    ),
    (
        1,
        2,
        'Ravi',
        'Kumar',
        'ravi2@gmail.com',
        '2023-12-12'
    ),
    (
        2,
        3,
        'Neha',
        'Singh',
        'neha3@gmail.com',
        '2024-02-01'
    ),
    (
        2,
        4,
        'Priya',
        'Verma',
        'priya4@gmail.com',
        '2023-11-20'
    ),
    (
        3,
        5,
        'Karan',
        'Mehta',
        'karan5@gmail.com',
        '2024-03-15'
    ),
    (
        3,
        6,
        'Anita',
        'Rao',
        'anita6@gmail.com',
        '2024-01-05'
    ),
    (
        4,
        7,
        'Rahul',
        'Das',
        'rahul7@gmail.com',
        '2023-10-10'
    ),
    (
        4,
        8,
        'Sneha',
        'Iyer',
        'sneha8@gmail.com',
        '2024-04-01'
    ),
    (
        5,
        9,
        'Arjun',
        'Patel',
        'arjun9@gmail.com',
        '2023-09-09'
    ),
    (
        5,
        10,
        'Pooja',
        'Nair',
        'pooja10@gmail.com',
        '2024-05-01'
    ),
    (
        6,
        11,
        'Vikram',
        'Yadav',
        'vikram11@gmail.com',
        '2023-08-15'
    ),
    (
        6,
        12,
        'Deepa',
        'Kapoor',
        'deepa12@gmail.com',
        '2024-02-20'
    ),
    (
        7,
        13,
        'Rohit',
        'Bansal',
        'rohit13@gmail.com',
        '2023-07-07'
    ),
    (
        7,
        14,
        'Meera',
        'Joshi',
        'meera14@gmail.com',
        '2024-01-25'
    ),
    (
        8,
        15,
        'Sanjay',
        'Reddy',
        'sanjay15@gmail.com',
        '2023-06-10'
    ),
    (
        8,
        16,
        'Kavya',
        'Menon',
        'kavya16@gmail.com',
        '2024-03-30'
    ),
    (
        9,
        17,
        'Ajay',
        'Gupta',
        'ajay17@gmail.com',
        '2023-05-05'
    ),
    (
        9,
        18,
        'Divya',
        'Agarwal',
        'divya18@gmail.com',
        '2024-02-14'
    ),
    (
        10,
        19,
        'Nikhil',
        'Jain',
        'nikhil19@gmail.com',
        '2023-04-01'
    ),
    (
        10,
        20,
        'Swati',
        'Mishra',
        'swati20@gmail.com',
        '2024-06-01'
    );

CREATE TABLE salaries (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees (id),
    salary_month DATE NOT NULL,
    total_amount NUMERIC(12, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (employee_id, salary_month)
);

INSERT INTO
    salaries (
        employee_id,
        salary_month,
        total_amount
    )
VALUES (1, '2025-01-01', 50000),
    (2, '2025-01-01', 52000),
    (3, '2025-01-01', 55000),
    (4, '2025-01-01', 48000),
    (5, '2025-01-01', 60000),
    (6, '2025-01-01', 47000),
    (7, '2025-01-01', 53000),
    (8, '2025-01-01', 51000),
    (9, '2025-01-01', 49000),
    (10, '2025-01-01', 62000),
    (11, '2025-01-01', 58000),
    (12, '2025-01-01', 54000),
    (13, '2025-01-01', 45000),
    (14, '2025-01-01', 47000),
    (15, '2025-01-01', 65000),
    (16, '2025-01-01', 61000),
    (17, '2025-01-01', 52000),
    (18, '2025-01-01', 56000),
    (19, '2025-01-01', 60000),
    (20, '2025-01-01', 70000);

CREATE TABLE salary_components (
    id SERIAL PRIMARY KEY,
    component_name VARCHAR(100) UNIQUE,
    type VARCHAR(20) CHECK (
        type IN ('EARNING', 'DEDUCTION')
    ),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    salary_components (component_name, type)
VALUES ('Basic', 'EARNING'),
    ('HRA', 'EARNING'),
    ('Bonus', 'EARNING'),
    (
        'Special Allowance',
        'EARNING'
    ),
    ('Travel Allowance', 'EARNING'),
    (
        'Medical Allowance',
        'EARNING'
    ),
    (
        'Performance Bonus',
        'EARNING'
    ),
    ('Overtime', 'EARNING'),
    ('PF', 'DEDUCTION'),
    ('Tax', 'DEDUCTION'),
    ('Insurance', 'DEDUCTION'),
    (
        'Professional Tax',
        'DEDUCTION'
    ),
    ('Loan Deduction', 'DEDUCTION'),
    ('Gratuity', 'DEDUCTION'),
    ('Food Allowance', 'EARNING'),
    (
        'Internet Allowance',
        'EARNING'
    ),
    ('Shift Allowance', 'EARNING'),
    ('Retention Bonus', 'EARNING'),
    ('Penalty', 'DEDUCTION'),
    (
        'Other Deduction',
        'DEDUCTION'
    );

CREATE TABLE salary_details (
    id SERIAL PRIMARY KEY,
    salary_id INT REFERENCES salaries (id) ON DELETE CASCADE,
    component_id INT REFERENCES salary_components (id),
    amount NUMERIC(12, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    salary_details (
        salary_id,
        component_id,
        amount
    )
VALUES (1, 1, 30000),
    (1, 2, 10000),
    (2, 1, 32000),
    (2, 9, 2000),
    (3, 1, 35000),
    (3, 10, 3000),
    (4, 1, 28000),
    (4, 9, 1500),
    (5, 1, 40000),
    (5, 3, 5000),
    (6, 1, 27000),
    (6, 10, 2000),
    (7, 1, 31000),
    (7, 2, 9000),
    (8, 1, 30000),
    (8, 11, 2000),
    (9, 1, 29000),
    (9, 12, 1500),
    (10, 1, 42000),
    (10, 3, 6000);

-- 3. Write a query for following:
-- 3.1. Employees List
select * from employees;
-- 3.2. Company list
select * from companies;
-- 3.3. Salary list
select * from salaries;
-- 3.4. Get Salary Details
SELECT * from salary_details;
-- 3.5. How many salary created total
SELECT COUNT(*) FROM salaries;
-- 3.6. How many total employees
SELECT count(id) from employees;
-- 3.7. How many Total employees company wise
select companies.name as company_name, COUNT(employees.id)
from employees
    join companies on employees.company_id = companies.id
GROUP BY
    companies.name;
-- 4.1 Get Max Salary of employee
SELECT
    employees.first_name || ' ' || employees.last_name as "employees_name",
    MAX(total_amount) as "max_amount"
FROM salaries
    join employees on employees.id = salaries.employee_id
GROUP BY
    employees_name
ORDER BY max_amount DESC
LIMIT 1; 
-- 4.2 Get List salary of employee
SELECT
    employees.first_name || ' ' || employees.last_name as "employee_name",
    salary_month,
    total_amount
FROM salaries
    join employees on salaries.employee_id = employees.id
ORDER BY total_amount DESC;
-- 4.3 Salary component wise Min & Max Amount
SELECT sc.component_name, MIN(sd.amount), MAX(sd.amount)
FROM
    salary_details sd
    JOIN salary_components sc ON sc.id = sd.component_id
GROUP BY
    sc.component_name;

-- *More question related same database*

-- 5.1 Total salary amount per employee (sum of all salaries)
SELECT e.id AS employee_id, e.first_name, SUM(s.total_amount) AS total_salary
FROM employees e
    JOIN salaries s ON e.id = s.employee_id
GROUP BY
    e.id,
    e.first_name
ORDER BY total_salary DESC;

-- 5.2 Employees who have not received any salary yet
select count(*)
from employees
    join salaries on employees.id = salaries.employee_id
where
    salaries.total_amount is NULL;
-- 5.3 Average salary per company
SELECT
    c.id AS company_id,
    c.name AS company_name,
    AVG(s.total_amount)::NUMERIC(12,2) AS avg_salary
FROM
    companies c
    JOIN employees e ON c.id = e.company_id
    JOIN salaries s ON e.id = s.employee_id
GROUP BY
    c.id,
    c.name
ORDER BY c.id;
-- 5.4 Top 3 highest paid employees (latest salary)
SELECT
    employees.first_name || ' ' || employees.last_name as "highest_paid_employees",
    salaries.total_amount
from employees
    join salaries on employees.id = salaries.employee_id
ORDER BY salaries.total_amount DESC
LIMIT 3;
-- 5.5 Salary range (max - min) for each salary component
SELECT sc.component_name, MAX(sd.amount) - MIN(sd.amount) as range  
FROM
    salary_details sd 
    JOIN salary_components sc ON sc.id = sd.component_id
GROUP BY
    sc.component_name;
-- 5.6 Employees hired in last 6 months with their salary details
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.hire_date, sc.component_name, sd.amount
FROM
    employees e
    JOIN salaries s ON e.id = s.employee_id
    JOIN salary_details sd ON sd.salary_id = s.id
    JOIN salary_components sc ON sc.id = sd.component_id
WHERE
    e.hire_date >= CURRENT_DATE - INTERVAL '6 months';

-- 5.7 Companies with no employees
select companies.name
from companies
    join employees on companies.id = employees.company_id
where
    employees.id is NULL; 
-- 5.8 Full salary breakdown for a specific employee (parameterized)
SELECT
    e.id AS employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    s.salary_month,
    sc.component_name,
    sc.type,
    sd.amount
FROM employees e
JOIN salaries s ON e.id = s.employee_id
JOIN salary_details sd ON s.id = sd.salary_id
JOIN salary_components sc ON sc.id = sd.component_id
WHERE e.id = 1
ORDER BY s.salary_month DESC, sc.type;
-- 5.9 Year-wise salary count and total amount
SELECT 
    EXTRACT(YEAR FROM s.salary_month) AS year,
    COUNT(*) AS total_salary_records,
    SUM(s.total_amount) AS total_amount
FROM salaries s
GROUP BY year
ORDER BY year DESC;
    -- 5.10 Employees earning more than average salary across all 
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    s.total_amount
FROM employees e 
JOIN salaries s ON e.id = s.employee_id
WHERE s.total_amount > (
    SELECT AVG(total_amount) FROM salaries
)
ORDER BY s.total_amount DESC;

