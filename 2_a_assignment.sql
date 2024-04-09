CREATE table emp(
    eid INTEGER,
    ename VARCHAR(20),
    age INTEGER,
    salary real,
    PRIMARY KEY(eid)
)

SELECT * from emp;


CREATE TABLE dept(
    did INTEGER,
    budget real,
    manager_id INTEGER,
    dname VARCHAR(20),
    PRIMARY KEY (did),
    Foreign Key (manager_id) REFERENCES emp (eid)
)

SELECT * from dept;


CREATE TABLE works(
    eid INTEGER,
    did INTEGER,
    pet_time INTEGER,
    PRIMARY key (eid, did),
    Foreign Key (eid) REFERENCES emp (eid),
    Foreign Key (did) REFERENCES dept (did)
)


SELECT * from works;


-- Insert values into emp table
INSERT INTO emp (eid, ename, age, salary) VALUES
(1, 'sumsum', 22, 50000.00),
(2, 'manoj', 25, 60000.00),
(3, 'suraj', 22, 75000.00);


-- Insert values into dept table
INSERT INTO dept (did, budget, manager_id, dname) VALUES
(101, 100000.00, 1, 'hardware'),
(102, 150000.00, 2, 'software'),
(103, 120000.00, 3, 'hr'),
(104, 130000.00, 2, 'it');


-- Insert values into works table
INSERT INTO works (eid, did, pet_time) VALUES
(1, 101, 50),
(2, 101, 30),
(2, 102, 40),
(3, 103, 19);




SELECT e.ename, e.age
FROM Emp e
JOIN Works w1 ON e.eid = w1.eid AND w1.did = (SELECT did FROM Dept WHERE dname = 'hardware')
JOIN Works w2 ON e.eid = w2.eid AND w2.did = (SELECT did FROM Dept WHERE dname = 'software');


SELECT Dept.did, COUNT(works.eid) AS employee_count FROM works JOIN Dept ON Dept.did = works.did GROUP BY Dept.did;


-- SELECT ename, age FROM Emp 
-- WHERE eid  IN 
-- (SELECT eid FROM Works 
-- WHERE did IN (SELECT did FROM Dept 
-- WHERE dname = "Hardware" OR "Software") );



-- SELECT ename, age FROM Emp 
-- WHERE eid  IN 
-- (SELECT eid FROM Works WHERE did = '101' AND '102' );



-- SELECT w.did, COUNT(*) AS num_employees
-- FROM Works w
-- JOIN (
--     SELECT did, SUM(pet_time) AS total_pet_time
--     FROM Works
--     GROUP BY did
--     HAVING total_pet_time >= 20
-- ) subquery ON w.did = subquery.did
-- GROUP BY w.did;



-- SELECT did, SUM(pet_time) AS total_pet_time
--     FROM Works
--     GROUP BY did
--     HAVING total_pet_time >= 20

-- SELECT *
-- FROM Works w
-- JOIN (
--     SELECT did, SUM(pet_time) AS total_pet_time
--     FROM Works
--     GROUP BY did
--     HAVING total_pet_time >= 20
-- ) subquery ON w.did = subquery.did;


