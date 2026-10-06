--sailors
CREATE TABLE sailors(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(30) NOT NULL,
rating number NOT NULL,
age real NOT NULL);

DESC sailors;
--RESERVES
CREATE TABLE reserves(
sid NUMBER not null,
bid NUMBER not null,
day date not null);

desc reserves;
  

--boat dro
CREATE TABLE BOAT(
bid number not null,
bname varchar2(50),
color varchar2(40));

desc boat;

--INSERT
INSERT INTO BOAT VALUES(101,'INTERLAKE','BLUE');
INSERT INTO BOAT VALUES(102,'INTERLAKE','RED');
 INSERT INTO BOAT VALUES(103,'CLIPPER','GREEN');
INSERT INTO BOAT VALUES(104,'MARINE','RED');

INSERT
INSERT INTO sailors VALUES(22,'dustin',7,45.0);
INSERT INTO sailors VALUES(29,'brutus ',1,33.0);
INSERT INTO sailors VALUES(31,'lubber',8,55.5);
INSERT INTO sailors VALUES(32,'andy',8,25.5);
INSERT INTO sailors VALUES(58,'rust',10,35.0);
INSERT INTO sailors VALUES(64,'horatio',7,35.0);


INSERT INTO reserves values(22,101,TO_DATE('10/10/06','mm/dd/yy'));
INSERT INTO reserves values(22,102,TO_DATE('10/10/06','mm/dd/yy'));
INSERT INTO reserves values(22,103,TO_DATE('10/8/08','mm/dd/yy'));
 selete* from sailors;


1.
SELECT sname,age FROM sailors;

__2.__
SELECT *FROM sailors
WHERE rating>7;

__3.__
SELECT sname
FROM sailors s,Reserves3 r
WHERE s.sid = r.sid
AND r.bid=103;

__4.__
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND color='red';

__5.__
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';

__6.__
SELECT DISTINCT b.color
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND sname='Lubber';

__7.__
SELECT DISTINCT s.sname
FROM sailors s,Reservese r
WHERE s.sid=r.sid;

__8.__
UPDATE sailors
SET rating=rating+1
WHERE sid IN (
SELECT r1.sid FROM Reserves3 r1,Reserves3 r2
WHERE r1.sid=r2.sid
AND r1.day=r2.day
AND r1.bid<>r2.bid );

__9.__
SELECT age FROM sailors
WHERE sname LIKE 'B-%B';

__10.__
SELECT DISTINCT bname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color IN('red','green');

__11.__
SELECT sname FROM sailors
WHERE EXISTS (
SELECT *FROM Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
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
SELECT sname, rating
FROM sailors
WHERE rating > (SELECT rating FROM sailors
                WHERE sname = 'Horatio');
                
18
SELECT sname, rating
FROM sailors
WHERE rating > (SELECT rating FROM sailors
                WHERE sname = 'Horatio');
19
SELECT sname, rating
FROM sailors
WHERE rating = (SELECT MAX(rating)
                FROM sailors);
20
select distinct s.sname
FROM sailors s, reserves r, boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'RED'
AND s.sid IN
(SELECT r2.sid
 FROM reserves r2, boats b2
 WHERE r2.bid = b2.bid
 AND b2.color = 'GREEN');


21
SELECT sname FROM sailors
WHERE sid IN
(SELECT sid
 FROM reserves
 GROUP BY sid
 HAVING COUNT(DISTINCT bid) =
       (SELECT COUNT(*) FROM boats));
22
SELECT AVG(age)FROM sailors;
23
SELECT AVG(age)FROM sailors
WHERE rating = 10;
24
SELECT sname, age FROM sailors
WHERE age = (SELECT MAX(age)
             FROM sailors);
25 
SELECT COUNT(*)FROM sailors;
26
SELECT COUNT(DISTINCT sname)FROM sailors;
27 
SELECT snameFROM sailors
WHERE age > (SELECT MAX(age)
             FROM sailors
             WHERE rating = 10)
28
SELECT rating, MIN(age) FROM sailors
GROUP BY rating;
29 
SELECT rating, MIN(age)FROM sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
30   
SELECT b.bid, b.bname, COUNT(r.sid)FROM boats b
LEFT JOIN reserves r ON b.bid = r.bid
WHERE b.color = 'RED'
GROUP BY b.bid, b.bname;
31  
SELECT rating, AVG(age)FROM sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
32  
SELECT rating, AVG(age)FROM sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
33
SELECT rating, AVG(age)FROM sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
34  
SELECT ratingFROM sailors
GROUP BY rating
HAVING AVG(age) <= ALL
       (SELECT AVG(age)
        FROM sailors
        GROUP BY rating);
drop table sailors;
drop table reserves;
drop table boat;




EXPERIMENT-7(a)
-- PL/SQL Procedures and Functions
-- Procedure with IN and OUT Parameters

-- 1. Enable Server Output
SET SERVEROUTPUT ON;

-- 2. Create STUDENT Table
CREATE TABLE STUDENT12
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(20),
    MARKS NUMBER(3)
);
-- 3. Insert Sample Records
INSERT INTO STUDENT12 VALUES (101, 'Rahul', 'B.Tech', 82);
INSERT INTO STUDENT12 VALUES (102, 'Sneha', 'B.Tech', 74);
INSERT INTO STUDENT12 VALUES (103, 'Arjun', 'BCA', 58);
INSERT INTO STUDENT12 VALUES (104, 'Priya', 'B.Sc', 91);
INSERT INTO STUDENT12 VALUES (105, 'Kiran', 'BCA', 45);

-- 4. Save the Records
COMMIT;

-- 4. Create Stored Procedure

CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS
(
    P_STUDENT_ID IN NUMBER,
    P_NAME       OUT VARCHAR2,
    P_MARKS      OUT NUMBER
)
IS
BEGIN
    SELECT STUDENT_NAME, MARKS
    INTO P_NAME, P_MARKS
    FROM STUDENT12
    WHERE STUDENT_ID = P_STUDENT_ID;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        P_NAME := 'Student Not Found';
        P_MARKS := NULL;
END;
/

-- 5. Call the Procedure

DECLARE
    V_NAME  VARCHAR2(30);
    V_MARKS NUMBER(3);
BEGIN
    GET_STUDENT_DETAILS(101, V_NAME, V_MARKS);

    DBMS_OUTPUT.PUT_LINE('Student ID   : 101');
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
END;
/

DECLARE
    V_NAME  VARCHAR2(30);
    V_MARKS NUMBER(3);
BEGIN
    GET_STUDENT_DETAILS(110, V_NAME, V_MARKS);

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    
    IF V_MARKS IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Marks        : Not Available');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
    END IF;
END;









