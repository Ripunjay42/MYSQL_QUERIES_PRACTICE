CREATE table employee(
    emp_no int(5),
    e_name varchar(20),
    e_address VARCHAR(20),
    e_ph_no varchar(20),
    dept_no VARCHAR(20),
    dept_name varchar(20),
    job_id char(20),
    salary varchar(20)
);


INSERT into employee(emp_no, e_name, e_address, e_ph_no, dept_no, dept_name, job_id, salary) VALUES
(1, 'manoj', 'dhemaji', 9999911111, 10001, 'SWE', 101, 100000 );


SELECT * from employee;


alter table employee
add hiredate DATE;

-- update employee set hiredate = '2019-01-01'
-- WHERE emp_no=1;


ALTER table employee
MODIFY COLUMN job_id VARCHAR(20);


ALTER table employee
rename COLUMN emp_no TO e_no;


ALTER table employee
MODIFY COLUMN job_id VARCHAR(30);


