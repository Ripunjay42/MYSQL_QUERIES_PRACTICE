CREATE TABLE EMP (
    Emp_no INT,
    Emp_name VARCHAR(255),
    Department VARCHAR(10),
    City VARCHAR(255),
    Email_id VARCHAR(255)
);



INSERT INTO EMP (Emp_no, Emp_name, Department, City, Email_id)
VALUES
    (1, 'james', 'D1', 'mumbai', 'james@gmail.com'),
    (2, 'viru', 'MECH', 'delhi', 'viru@gmail.com'),
    (12, 'ram', 'Sales', 'kolkata', 'ram1@gmail.com'),
    (4, 'kishan', 'D10', 'Guwahati', 'kishan@gmail.com'),
    (5, 'lakshya', 'D10', 'Tezpur', 'lakshya@gmail.com');



SELECT * FROM EMP;


SELECT * FROM EMP WHERE Department = 'D10';


UPDATE EMP SET City = 'jorhat' WHERE Emp_no = 12;



SELECT * FROM EMP WHERE Department = 'MECH';



UPDATE EMP SET Email_id = NULL WHERE Emp_name = 'James';


UPDATE EMP SET Email_id = 'james12@gmail.com' WHERE Emp_name = 'James';



SELECT * FROM EMP WHERE Department = 'SALES';


TRUNCATE TABLE EMP;
