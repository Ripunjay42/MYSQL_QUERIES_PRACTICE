CREATE TABLE EMPLOYEE (
    Emp_no INT,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id VARCHAR(10),
    Designation VARCHAR(50),
    Salary DECIMAL(10, 2),
    Join_date DATE 
);


INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, Join_date)
VALUES
    (1,   'suraj',    'jorhat',       '55522-21234',  10,   'HR',       'HR001',    'MANAGER',      60000.00,   '1980-01-15'),
    (2,   'manoj',    'silapothar',   '22555-25678',  20,   'IT',       'IT002',    'IT PROFF',     70000.00,   '1982-03-20'),
    (3,   'bishal',   'aamguri',      '56555-98762',  10,   'HR',       'HR003',    'CLERK',        40000.00,   '1983-05-10'),
    (4,   'abhijit',  'sonapur',      '34555-43218',  20,   'IT',       'IT004',    'ANALYST',      80000.00,   '1981-07-18'),
    (5,   'dhriti',   'mongoldoi',    '91555-87652',  30,   'Finance',  'FIN005',   'ACCOUNTANT',   55000.00,   '1985-09-25');


SELECT * from employee;



SELECT Emp_no, E_name, Salary
FROM EMPLOYEE
WHERE Designation = 'MANAGER';



SELECT *
FROM EMPLOYEE
WHERE Salary > (SELECT MAX(Salary) FROM EMPLOYEE WHERE Designation = 'IT PROFF');



SELECT *
FROM EMPLOYEE
WHERE Join_date > '1981-01-01'
ORDER BY Designation ASC;



SELECT Emp_no, E_name, DATEDIFF(CURRENT_DATE, Join_date) AS Experience, Salary / 30 AS Daily_Salary
FROM EMPLOYEE;


SELECT *
FROM EMPLOYEE
WHERE Designation IN ('CLERK', 'ANALYST');



SELECT *
FROM EMPLOYEE
WHERE Join_date IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19');


SELECT *
FROM EMPLOYEE
WHERE Dept_no IN (10, 20);


SELECT E_name
FROM EMPLOYEE
WHERE E_name LIKE 'S%';


SELECT E_name, LEFT(E_name, 5) AS First_Five_Characters
FROM EMPLOYEE
WHERE E_name LIKE 'H%';



SELECT *
FROM EMPLOYEE
WHERE Designation NOT IN ('PRESIDENT', 'MGR')
ORDER BY Salary ASC;
