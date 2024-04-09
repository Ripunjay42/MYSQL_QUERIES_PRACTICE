
-- 1. Creating the EMP table
CREATE TABLE EMP (
    EMPNO INTEGER(6),
    ENAME VARCHAR(20) NOT NULL,
    JOB VARCHAR(10) NOT NULL,
    DEPTNO INTEGER(3),
    SAL DECIMAL(7,2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT CHK_EMPNO CHECK (EMPNO > 100),
    CONSTRAINT UNQ_DEPTNO UNIQUE (DEPTNO)
);



INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES 
(101, 'John', 'Engineer', 10, 5000),
(102, 'Sara', 'Analyst', 20, 5500),
(103, 'Mike', 'Salesman', 30, 4000),
(104, 'Emma', 'Manager', 40, 6500),
(105, 'David', 'Engineer', 50, 5000),
(106, 'Sophia', 'Clerk', 60, 3500);


SELECT * FROM EMP;

INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (101, 'John', 'Manager', 10, 5000);
-- Trying to insert data with a duplicate DEPTNO (should fail due to unique constraint)

INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (99, 'Jane', 'Clerk', 10, 4000); -- This will fail





-- Select all even or odd records
-- To select all even records:
SELECT * FROM EMP WHERE MOD(EMPNO, 2) = 0;
-- To select all odd records:
SELECT * FROM EMP WHERE MOD(EMPNO, 2) <> 0;



-- Find 6th highest salary
SELECT SAL FROM EMP ORDER BY SAL DESC LIMIT 5, 1;



-- Select names starting with a certain letter
SELECT * FROM EMP WHERE ENAME LIKE 'K%';



-- Select random rows
SELECT * FROM EMP ORDER BY RAND();




-- Create a view
CREATE VIEW EMP_VIEW AS
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL FROM EMP;


--------------------------------------------------------------------------------------------



CREATE table OTHER_TABLE (
    S_NO INT,
    name VARCHAR(20),
    age INT,
    address varchar(20),
    f_name varchar(20)
);



INSERT INTO OTHER_TABLE (S_NO, name, age, address, f_name) VALUES
(1, 'John', 25, '123 Main St', 'Smith'),
(2, 'Alice', 30, '456 Elm St', 'Johnson');



-- Set Operations
-- Union
SELECT * FROM EMP
UNION
SELECT * FROM OTHER_TABLE;



-- Minus
SELECT * FROM EMP
MINUS
SELECT * FROM OTHER_TABLE;



-- Intersect
SELECT * FROM EMP
INTERSECT
SELECT * FROM OTHER_TABLE;



-- Copy Tables

-- Using CREATE TABLE AS SELECT
CREATE TABLE NEW_EMP AS SELECT * FROM EMP;
-- Using INSERT INTO SELECT
INSERT INTO NEW_EMP SELECT * FROM EMP;




-- SQL Injection Example (for explanation)
-- $username = "admin'; DROP TABLE EMP;--";



-- BETWEEN vs IN Operators
-- BETWEEN: Used to filter results within a range.
SELECT * FROM EMP WHERE SAL BETWEEN 3000 AND 5000;




-- IN: Used to specify multiple possible values for a column.
SELECT * FROM EMP WHERE DEPTNO IN (10, 20, 30);



-----------------------------------------------------------------------------------------



-- PL/SQL Examples
-- Calculate incentive for employee ID 110
DECLARE
    v_emp_id NUMBER := 110;
    v_salary EMP.SAL%TYPE;
    v_incentive NUMBER;
BEGIN
    SELECT SAL INTO v_salary FROM EMP WHERE EMPNO = v_emp_id;
    
    -- Calculate incentive (example calculation)
    v_incentive := v_salary * 0.1;
    
    DBMS_OUTPUT.PUT_LINE('Incentive for employee ' || v_emp_id || ': ' || v_incentive);
END;
/

-- Invalid case-insensitive reference
DECLARE
    "invalid_identifier" VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE(invalid_identifier); -- This will raise an error as the identifier is not defined
END;
/

-- Operator precedence with parentheses
DECLARE
    v_result NUMBER;
BEGIN
    v_result := (10 + 5) * 2 / 3 - (4 * 2);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- Declare user-defined exception
DECLARE
    ex_custom EXCEPTION;
BEGIN
    RAISE ex_custom;
EXCEPTION
    WHEN ex_custom THEN
        DBMS_OUTPUT.PUT_LINE('Custom exception raised.');
END;
/

-- Arrange numbers in variables
DECLARE
    v_num1 NUMBER := 20;
    v_num2 NUMBER := 10;
    v_small_num NUMBER;
    v_large_num NUMBER;
BEGIN
    IF v_num1 < v_num2 THEN
        v_small_num := v_num1;
      


