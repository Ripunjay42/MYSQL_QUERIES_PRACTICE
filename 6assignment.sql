-- Creating tables
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);



CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    job_category VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
);




-- Inserting data
INSERT INTO Department (department_id, department_name) VALUES 
(1, 'Sales'),
(2, 'Finance'),
(3, 'Human Resources');




INSERT INTO Employee (employee_id, employee_name, job_category, salary, department_id, manager_id) 
VALUES 
    (1, 'John Doe', 'Manager', 50000.00, 1, NULL),
    (2, 'Jane Smith', 'Sales Associate', 30000.00, 1, 1),
    (3, 'David Johnson', 'Sales Associate', 28000.00, 1, 1),
    (4, 'Emily Brown', 'Financial Analyst', 45000.00, 2, NULL),
    (5, 'Michael Wilson', 'Financial Analyst', 42000.00, 2, 4),
    (6, 'Jessica Lee', 'HR Coordinator', 35000.00, 3, NULL),
    (7, 'Robert Garcia', 'HR Assistant', 32000.00, 3, 6),
    (8, 'Lisa Martinez', 'HR Assistant', 33000.00, 3, 6);

-- Adjusting manager IDs for proper hierarchy
UPDATE Employee SET manager_id = 1 WHERE employee_id = 2 OR employee_id = 3;

UPDATE Employee SET manager_id = 4 WHERE employee_id = 5;

UPDATE Employee SET manager_id = 6 WHERE employee_id = 7 OR employee_id = 8;




-- Queries
-- 1. Display total salary spent for each job category.
SELECT job_category, SUM(salary) AS total_salary
FROM Employee
GROUP BY job_category;




-- 2. Display lowest paid employee details under each manager.
SELECT m.employee_name AS manager_name, e.employee_name AS employee_name, e.job_category, e.salary
FROM Employee e
JOIN Employee m ON e.manager_id = m.employee_id
WHERE e.salary = (
    SELECT MIN(salary)
    FROM Employee
    WHERE manager_id = m.employee_id
);



-- 3. Display number of employees working in each department and their department name.
SELECT d.department_name, COUNT(*) AS num_employees
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



-- 4. Display the details of employees sorting the salary in increasing order.
SELECT employee_id, employee_name, job_category, salary
FROM Employee
ORDER BY salary ASC;




-- 5. Show the record of employee earning salary greater than 16000 in each department.
SELECT d.department_name, e.employee_id, e.employee_name, e.job_category, e.salary
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
WHERE e.salary > 16000;
