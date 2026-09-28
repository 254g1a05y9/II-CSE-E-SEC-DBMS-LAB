--sailors
CREATE TABLE sailors(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(30) NOT NULL,
rating number NOT NULL,
age real NOT NULL);
#desc table
DESC sailors;
![output(op 1)]
--RESERVES
CREATE TABLE reserves(
sid NUMBER not null,
bid NUMBER not null,
day date not null);

#desc table
DESC reserves;
![output(op 2)]
--boat 
CREATE TABLE BOAT(
bid number not null,
bname varchar2(50),
color varchar2(40));
#desc table
DESC boat;
![output(op 3)]

--INSERT
INSERT INTO BOAT VALUES(101,'INTERLAKE','BLUE'),(102,'INTERLAKE','RED'),(103,'CLIPPER','GREEN'),(104,'MARINE','RED');
![output(b insert)]

INSERT INTO sailors VALUES(22,'dustin',7,45.0);
INSERT INTO sailors VALUES(29,'brutus ',1,33.0);
INSERT INTO sailors VALUES(31,'lubber',8,55.5);
INSERT INTO sailors VALUES(32,'andy',8,25.5);
INSERT INTO sailors VALUES(58,'rust',10,35.0);
INSERT INTO sailors VALUES(64,'horatio',7,35.0);
![output(s insert)]

INSERT INTO reserves values(22,101,TO_DATE('10/10/06','mm/dd/yy'));
![output(r insert)]
#output 
![output(sailors op)]
select * from sailors;
![output(res op)]
select * from reserves;
![output(boat op)]
select * from boat;


SELECT sname,age FROM sailors;

__2.__
WHERE rating>7;

__3.__
SELECT sname
AND r.bid=103;

__4.__
FROM Reserves3 r,Boats b
AND color='red';

__5.__
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
__6.__
SELECT DISTINCT b.color
WHERE s.sid=r.sid
AND sname='Lubber';
SELECT DISTINCT s.sname

SELECT age FROM sailors
WHERE sname LIKE 'B-%B';
__10.__
SELECT DISTINCT bname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid

__9.__
AND r1.bid<>r2.bid );
AND r1.day=r2.day
__8.__
AND b.color IN('red','green');

__11.__
SELECT sname FROM sailors
WHERE EXISTS (
WHERE s.sid=r.sid
AND b.color='red' )
AND EXISTS (
SELECT *FROM Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='green' );

__12.__
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='red'
MINUS
SELECT DISTINCT r.sid FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='green';

__13.__
SELECT sid FROM sailors
WHERE rating=10 UNION
SELECT sid FROM Reserves3 
WHERE bid=104;

__14.__

SELECT sname FROM sailors 
WHERE sid IN(
SELECT sid FROM Reserves3
WHERE bid=103 );

__15.__
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';

16
SELECT s.sname
FROM sailors s, reserves r
WHERE s.sid = r.sid
AND r.bid = 103;

17 
FROM sailors
WHERE rating > (SELECT rating FROM sailors
                
18
SELECT sname, rating
FROM sailors
WHERE rating > (SELECT rating FROM sailors
19
SELECT sname, rating
FROM sailors
WHERE rating = (SELECT MAX(rating)
                FROM sailors);
select distinct s.sname
FROM sailors s, reserves r, boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'RED'
(SELECT r2.sid
 FROM reserves r2, boats b2
 WHERE r2.bid = b2.bid
 AND b2.color = 'GREEN');


21
SELECT sname FROM sailors
WHERE sid IN
 FROM reserves
 GROUP BY sid
 HAVING COUNT(DISTINCT bid) =
       (SELECT COUNT(*) FROM boats));
SELECT AVG(age)FROM sailors;
23
SELECT AVG(age)FROM sailors
WHERE rating = 10;
24
SELECT sname, age FROM sailors
WHERE age = (SELECT MAX(age)
             FROM sailors);
SELECT COUNT(*)FROM sailors;
SELECT COUNT(DISTINCT sname)FROM sailors;
27 
WHERE age > (SELECT MAX(age)
             FROM sailors
             WHERE rating = 10)
28
SELECT rating, MIN(age) FROM sailors
29 
SELECT rating, MIN(age)FROM sailors
WHERE age >= 18
GROUP BY rating
30   
SELECT b.bid, b.bname, COUNT(r.sid)FROM boats b
WHERE b.color = 'RED'
GROUP BY b.bid, b.bname;
31  
SELECT rating, AVG(age)FROM sailors
SELECT rating, AVG(age)FROM sailors
WHERE age >= 18
HAVING AVG(age) <= ALL
       (SELECT AVG(age)
        FROM sailors
drop table reserves;




drop table boat;

        GROUP BY rating);
drop table sailors;
SELECT ratingFROM sailors
GROUP BY rating
GROUP BY rating
34  
HAVING COUNT(*) >= 2;
GROUP BY rating
WHERE age >= 18
SELECT rating, AVG(age)FROM sailors
33
HAVING COUNT(*) >= 2;
32  
HAVING COUNT(*) >= 2;
GROUP BY rating
LEFT JOIN reserves r ON b.bid = r.bid
HAVING COUNT(*) >= 2;
GROUP BY rating;
SELECT snameFROM sailors
26
25 
22
(SELECT sid
AND s.sid IN
20
                WHERE sname = 'Horatio');
                WHERE sname = 'Horatio');
SELECT sname, rating
AND r.bid=b.bid
SELECT *FROM Reserves3 r,Boats b
WHERE r1.sid=r2.sid
SELECT r1.sid FROM Reserves3 r1,Reserves3 r2
WHERE sid IN (
UPDATE sailors
SET rating=rating+1
WHERE s.sid=r.sid;

FROM sailors s,Reservese r
__7.__

AND r.bid=b.bid
FROM sailors s,Reserves3 r,Boats b

AND b.color='red';
AND r.bid=b.bid
WHERE r.bid=b.bid
SELECT DISTINCT r.sid
WHERE s.sid = r.sid
FROM sailors s,Reserves3 r
SELECT *FROM sailors
1.
INSERT INTO reserves values(22,102,TO_DATE('10/10/06','mm/dd/yy'));
