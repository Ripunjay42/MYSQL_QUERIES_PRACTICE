-- Create Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age INT
);

-- Create Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- Create Reserves table
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid),
    PRIMARY KEY (sid, bid, day)
);

-- Insert rows into Sailors table
INSERT INTO Sailors (sid, sname, rating, age) VALUES
(1, 'Bob', 5, 25),
(2, 'Alice', 8, 30),
(3, 'rudra', 7, 35),
(4, 'kush', 8, 22),
(5, 'bhargab', 6, 28);

-- Insert rows into Boats table
INSERT INTO Boats (bid, bname, color) VALUES
(101, 'Boat1', 'red'),
(102, 'Boat2', 'blue'),
(103, 'Boat3', 'green'),
(104, 'Boat4', 'red'),
(105, 'Boat5', 'yellow');

-- Insert rows into Reserves table
INSERT INTO Reserves (sid, bid, day) VALUES
(1, 101, '2024-03-28'),
(2, 102, '2024-03-29'),
(3, 101, '2024-03-28'),
(4, 104, '2024-03-30'),
(5, 103, '2024-03-29'),
(1, 102, '2024-03-29');


SELECT *
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    WHERE bid = 101
);


SELECT bname
FROM Boats
WHERE bid IN (
    SELECT bid
    FROM Reserves
    WHERE sid = (
        SELECT sid
        FROM Sailors
        WHERE sname = 'Bob'
    )
);



SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'red'
)
ORDER BY age;


SELECT DISTINCT sname
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
);


SELECT distinct s.sid, s.sname
FROM Sailors s
JOIN Reserves r1 ON s.sid = r1.sid
JOIN Reserves r2 ON r1.day = r2.day AND r1.sid = r2.sid AND r1.bid != r2.bid;


SELECT DISTINCT sid
FROM Reserves
WHERE bid IN (
    SELECT bid
    FROM Boats
    WHERE color IN ('red', 'green')
);


SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MIN(age)
    FROM Sailors
);


SELECT COUNT(DISTINCT sname)
FROM Sailors;



SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating;


SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating
HAVING COUNT(sid) >= 2;





