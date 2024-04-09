CREATE TABLE sailors (
    sid int,
    sname varchar(20),
    rating int,
    age real,
    PRIMARY KEY(sid)
    );


CREATE TABLE boats (
    bid int,
    bname varchar(20),
    color varchar(20),
    primary key (bid)
    );


CREATE TABLE reserves (
    sid INT,
    bid INT,
    day DATE,
    PRIMARY key(sid, bid, day),
    FOREIGN KEY (sid) REFERENCES sailors(sid),
    FOREIGN KEY (bid) REFERENCES boats(bid)
);



INSERT INTO sailors (sid, sname, rating, age) VALUES
(1, 'John', 8, 25),
(2, 'Alice', 7, 27),
(3, 'Bob', 6, 27),
(4, 'Emma', 9, 30),
(5, 'Mike', 5, 28);

SELECT * from sailors;


INSERT INTO boats (bid, bname, color) VALUES
(101, ' boat1', 'red'),
(102, 'boat2', 'green'),
(103, 'boat3', 'blue'),
(104, 'boat3', 'yellow');

SELECT * from boats;


INSERT INTO reserves (sid, bid, day) VALUES
(1, 101, '2024-01-01'),
(2, 102, '2024-01-02'),
(3, 103, '2024-01-03'),
(4, 101, '2024-01-04'),
(5, 102, '2024-01-05');

SELECT * from reserves;



SELECT sname, rating,age  FROM sailors WHERE age = 27;

SELECT DISTINCT sailors.sid, sname FROM sailors JOIN reserves ON sailors.sid = reserves.sid;

SELECT sid  FROM reserves  JOIN boats ON reserves.bid = boats.bid WHERE color IN ('red', 'green');


SELECT sid FROM sailors WHERE sid NOT IN (SELECT sid FROM reserves);
